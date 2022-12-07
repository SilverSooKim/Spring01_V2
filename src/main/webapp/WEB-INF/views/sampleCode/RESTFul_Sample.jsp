<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- 

참고할 만한 사이트 : https://hyejin.tistory.com/284


 -->
<html>
<script>
$(function(){
	user_list();
	user_delete();
	user_insert();
	form_init();
	user_select();
	user_update();
	city_list();
});

function user_list(){
	
	$.ajax({
		url : 'users',
		method : 'GET',
		contentType:'application/json;charset=utf-8',
		dataType:'json',
		
		error:function(error,status,msg){
			alert("상태코드 " + status + "에러메시지" + msg );
		},
		success:user_list_result
	});
	
}



function user_list_result(xhr) {
	$('tbody#list').empty();
	$.each(xhr, function(idx,user){
		console.log(idx,user);
		$("<tr>")
			.append($("<td>").html(idx+1))
			.append($("<td>").html(user.userid))
			.append($("<td>").html(user.name))
			.append($("<td>").html(user.gender))
			.append($("<td>").html(user.city))
			.append($("<td>").html("<button class='btn btn-success' id='btnSelect'>조회</button>"))
			.append($("<td>").html("<button class='btn btn-primary' id='btnDelete'>삭제</button>"))
			.append($("<input type='hidden' id='hidden_id'>").val(user.id))
			.append($("<input type='hidden' id='hidden_userid'>").val(user.userid))
			.appendTo('tbody#list');
	});// each
	
}




function user_select(){
	$('body').on('click', '#btnSelect', function(){
		var userid=$(this).closest('tr').find('#hidden_userid').val();
		
		$.ajax({
			url : 'users/' + userid,
			method : 'GET',
			error:function(error,status,msg){
				alert("상태코드 " + status + "에러메시지" + msg );
			},
			success:user_select_result
		});
		
	})
}

function user_select_result(xhr){
	var user = xhr;

	$('input:text[name="userid"]').val(user.userid);
	$('input:text[name="name"]').val(user.name);
	$('input:radio[name="gender"][value="'+user.gender+'"]').prop('checked',true);
	$('select[name="city"]').val(user.city).attr("selected","selected");
	
	
}




function user_delete(){
	
	$('body').on('click', '#btnDelete', function(){
		var id = $(this).closest('tr').find('#hidden_id').val();
		var userid = $(this).closest('tr').find('#hidden_userid').val();
		var result = confirm(userid +'님을 정말 삭제하시겠습니까?');
		console.log('result : ' + result);
		if(result){
			$.ajax({
				url : 'users/' + id,
				method : 'DELETE',
				error:function(error,status,msg){
					alert("상태코드 " + status + "에러메시지" + msg );
				},
				success:function(){
					user_list();
				}
			});
		}
	});
}

function user_insert(){
	
	$('body').on('click', '#btnInsert', function(){
		var userid = $("input:text[name='userid']").val();
		var name   = $("input:text[name='name']").val();
		var gender = $("input:radio[name='gender']:checked").val();
		var city   = $("select[name='city']").val();
		var userObj = {userid:userid, name:name, gender:gender, city:city};
		var result = confirm(name +'님을 정말 등록하시겠습니까?');
		if(result){
			$.ajax({
				url : 'users',
				method : 'POST',
				contentType:'application/json;charset=utf-8',
				dataType:'json',
				data: JSON.stringify(userObj),
				
				error:function(error,status,msg){
					alert("상태코드 " + status + "에러메시지" + msg );
				},
				success:function(xhr){
					console.log(xhr);
					if(xhr == 1){
						$('#btnInit').trigger('click');
					}
					user_list();
				}
			});
		}
	});
}

function form_init(){
	$('#btnInit').on('click', function(){
		$('#user_form').each(function(){
			this.reset();
		})
	});
}


function user_update(){
	$('body').on('click', '#btnUpdate', function(){
		var userid = $("input:text[name='userid']").val();
		var name   = $("input:text[name='name']").val();
		var gender = $("input:radio[name='gender']:checked").val();
		var city   = $("select[name='city']").val();
		var userObj = {userid:userid, name:name, gender:gender, city:city};
		var result = confirm(name +'님을 정말 수정하시겠습니까?');
		console.log('result : ' + result);
		if(result){
			$.ajax({
				url : 'users',
				method : 'PUT',
				contentType:'application/json;charset=utf-8',
				dataType:'json',
				data: JSON.stringify(userObj),
				error:function(error,status,msg){
					alert("상태코드 " + status + "에러메시지" + msg );
				},
				success:function(xhr){
					console.log(xhr);
					if(xhr == 1){
						$('#btnInit').trigger('click');
					}
					user_list();
				}
			});
		}
	});
}


function city_list(){
	$.ajax({
		url : 'cities',
		method : 'GET',
		error:function(error,status,msg){
			alert("상태코드 " + status + "에러메시지" + msg );
		},
		success:function(xhr){
			$.each(xhr, function(idx,city){
				$('<option>')
				.text(city)
				.val(city)
				.appendTo('#citySelect');
			});// each
		}
	});
	
}


</script>


<body>
	<div class="text-center">
		<h2>사용자 등록</h2>
	</div>
	
	<div  class="container p-3">
		<form id="user_form" method="post" action="userInsert.do">
			<table>
				<tr class="form-group">
					<th><label>사용자 ID :</label></th>
					<td><input class="form-control" type="text" name="userid"></td>
				</tr>
				<tr class="form-group">
					<th>사용자 이름 :</th>
					<td><input class="form-control" type="text" name="name"></td>
				</tr>
				<tr class="form-group">
					<th>성별 :</th>
					<td>
						<div class="form-control">
							<input type="radio" name="gender" value="남">남 
							<input type="radio" name="gender" value="여">여
						</div>
					</td>
				</tr>
				<tr class="form-group">
					<th>주소 :</th>
					<td>
						<select id="citySelect" class="form-control" name="city">
						</select>
					</td>
				</tr>
			</table>
			<div class="container p-3">
				<div class="btn-group">
					<input type ="button" value="등록" class="btn btn-primary" id="btnInsert">
					<input type ="button" value="초기화" class="btn btn-info" id="btnInit">
					<input type ="button" value="수정" class="btn btn-secondary" id="btnUpdate">
				</div>
			</div>
		</form>
	</div>



	<hr>

	<div class="text-center">
		<h2>사용자 목록 Ajax</h2>
	</div>
	<div class="container p-3">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>순서</th>
					<th>사용자ID</th>
					<th>이름</th>
					<th>성별</th>
					<th>주소</th>
					<th>&nbsp;</th>
					<th>&nbsp;</th>
				</tr>
			</thead>
			<tbody id='list'>
			</tbody>
		</table>
	</div>
</body>
</html>