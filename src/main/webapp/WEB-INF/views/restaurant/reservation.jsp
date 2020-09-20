<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script>
	
</script>
</head>
<body>
		   <div class="share_modal_container modal_number_3" style="display: none; opacity: 0;">
	        <div class="resvr_modal_dialog">
	            
	            <div class="resvr_modal_header">
	                <div class="resvr_modal_title">�����ϱ�</div>
	                <span class="resvr_modal_name">��Ÿ���� ���� �ĳ�</span>
	                <div class="resvr_modal_address">��õ������ ������ ������ 1364-8</div>
	            </div>
	            
	            <div class="resvr_modal_content">
	                <input id="datepicker" class="form-control resvr_modal_date" type="date" name="resvr_date" placeholder="���೯¥">
	                <input class="form-control resvr_control_time" type="time" name="resvr_time">    
	                    
	                    <select class="custom-select resvr_control_number" id="inputGroupSelect02" placeholder="����ð�">
	                        <option selected disabled>�ο���</option>
	                        <option value="1">1</option>
	                        <option value="2">2</option>
	                        <option value="3">3</option>
	                        <option value="4">4</option>
	                        <option value="5">5</option>
	                        <option value="6">6</option>
	                        <option value="7">7</option>
	                        <option value="8">8</option>
	                        <option value="9">9</option>
	                        <option value="10">10</option>
	                    </select>    
	            </div>
	            <div class="alert alert-warning resvr_control_result" role="alert">
	            	<span class="resvr_control_result_date">0000-00-00</span> 
	            	<span class="resvr_control_result_time">00:00</span> 
	            	<span class="resvr_control_result_number">0</span>�� 
	            	<span class="resvr_control_result_price">0</span>�� 
	            </div>
	
	            <div class="resvr_modal_content">
	                <input class="form-control resvr_control_name" name="resvr_name" type="text" placeholder="������ �Է����ּ���">
	                <input class="form-control resvr_control_phone" name="resvr_phone" type="text" placeholder="��ȭ��ȣ�� �Է����ּ���">
	            </div>
	            <div class="resvr_modal_content">
	                <textarea class="form-control resvr_control_content" id="exampleFormControlTextarea1" name="resvr_content" rows="3" placeholder="��û ������ �Է��ϼ���."></textarea>
	            </div>
	            
	            <div class="resvr_button_wrapper" style="margin-top: 20px;">
	                <button type="button" class="btn btn-outline-warning resvr_cancel_btn">����ϱ�</button>
	                <button type="submit" class="btn btn-outline-warning resvr_ok_btn" onclick="resve_click();">�����ϱ�</button>
	            </div>
	        </div>
	    </div>

	<script>
		// ���� ���� �ٲ𶧸��� ��� �� �ٲٱ�

		$(".resvr_modal_date").on("propertychange change keyup paste input",
				function() {
					var newValue = $(".resvr_modal_date").val();
					console.log(newValue);

					$(".resvr_control_result_date").html(newValue);

				});

		$(".resvr_control_time").on("propertychange change keyup paste input",
				function() {
					var newValue = $(".resvr_control_time").val();
					console.log(newValue);

					$(".resvr_control_result_time").html(newValue);

				});

		$(".resvr_control_number").on(
				"propertychange change keyup paste input", function() {
					var newValue = $(".resvr_control_number").val();
					var newValue2 = $(".resvr_control_number").val() * 5000;
					money = newValue2;
					console.log(newValue);

					$(".resvr_control_result_number").html(newValue);
					$(".resvr_control_result_price").html(newValue2);

				});

		// ���� ��ư Ŭ��
		function resve_click() {

			var date = document.querySelector(".resvr_modal_date").value;
			var time = document.querySelector(".resvr_control_time").value;
			var number = document.querySelector(".resvr_control_number").value;

			var name = document.querySelector(".resvr_control_name").value;
			var phone = document.querySelector(".resvr_control_phone").value;
			var content = document.querySelector(".resvr_control_content").value;
			var amount = number * 5000;
			var rNo = $
			{
				restaurant.RNo
			}
			;
			//var mNo = ${ loginUser.mNo };

			//console.log(date + " " + time + " " + number);

			var resvrInfo = "${ restaurant.RName }" + " "
					+ date.substring(5, 10);
			//console.log(resvrInfo);

			var IMP = window.IMP;
			IMP.init('imp64570035');
			console.log(money);

			IMP.request_pay({
				pg : 'kakao',
				merchant_uid : 'merchant_' + new Date().getTime(),

				name : resvrInfo,
				amount : money,
				buyer_email : '${ loginUser.mEmail }',
				buyer_name : '${ loginUser.mName }',
				buyer_tel : '${ loginUser.mPhone }',
				buyer_addr : '${ loginUser.mAddress }',
			}, function(rsp) {
				console.log(rsp);
				if (rsp.success) {

					$.ajax({
						type : "post",
						url : "resve.do",
						data : {
							'rsvde' : date,
							'rsvtm' : time,
							'visitrCo' : number,
							"rsvctm" : name,
							"resvePhone" : phone,
							"resveReq" : content,
							"resveAmount" : amount,
							"rNo" : rNo,
							"mNo" : mNo
						},

						success : function() {
							var msg = '������ �Ϸ�Ǿ����ϴ�.';

						}
					});

				} else {
					console.log("����");
					var msg = '������ �����Ͽ����ϴ�.';
					//msg += '�������� : ' + rsp.error_msg;
				}
				alert(msg);
				document.location.href = "/honeypoint/"; //alertâ Ȯ�� �� �̵��� url ����
			});

		}
	</script>
</body>
</html>