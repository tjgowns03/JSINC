<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
<title>JS.Inc</title>
<link href="resources/img/favicon.png" rel="icon">
</head>

<body>
	<section id="container">
		<jsp:include page="../default/header.jsp"/>
		<!--sidebar start-->
      <aside>
         <div id="sidebar" class="nav-collapse ">
            <!-- sidebar menu start-->
            <ul class="sidebar-menu" id="nav-accordion">
               <p class="centered">
                  <a href="profile">
                     <img src="resources/img${user.img}" class="img-circle" width="80">
                  </a>
               </p>
               <h5 class="centered"><i class="fa fa-user"></i> ${user.name } <br>(${user.userEmail })</h5>
               
               <!-- 출/퇴근 관리 -->
               <li class="mt">
                  <a href="attendance"> 
                     <i class="fa fa-asterisk"></i> <span>출/퇴근</span>
                  </a>
               </li>
               
               <!-- 커뮤니티 -->
               <li class="sub-menu">
                  <a href="javascript:;"> 
                     <i class="fa fa-desktop"></i> <span>커뮤니티</span>
                  </a>
                  <ul class="sub">
                     <li><a href="createCommunity">커뮤니티 만들기</a></li>
                     <li><a href="allCommunity">전체 커뮤니티</a></li>
                     <li><a href="joinCommunity">가입 커뮤니티</a></li>
                     
                  </ul>
               </li>
               
               <!-- 게시판 -->
               <li class="sub-menu"><a href="javascript:;"> <i
                     class="fa fa-cogs"></i> <span>게시판</span>
               </a>
                  <ul class="sub">
                     <li><a href="allCompanyBoard">전사 게시판</a></li>
                     <li><a href="departmentBoard">부서 게시판</a></li>
                     <li><a href="referenceBoard">자료실 게시판</a></li>
                  </ul>
               </li>
               
               <!-- 전자 결재 -->
               <li class="sub-menu">
                  <a class="active" href="javascript:;"> 
                     <i class="fa fa-book"></i>  <span>전자 결재</span>
                  </a>
                  <ul class="sub">
                     <li class="active"><a href="newSign">결재 상신</a></li>
                     <li><a href="signApprove">결재 승인</a></li>
                     <li><a href="signWait">결재 대기</a></li>
                     <li><a href="signSuccess">결재 완료</a></li>
                  </ul>
               </li>
               
               <!-- 주소록 -->
               <li >
                  <a href="addressBook"> 
                     <i class="fa fa-tasks"></i><span>주소록</span>
                  </a>
               </li>
               
               <!-- 캘린더 -->
               <li>
                  <a href="toDoList">
                     <i class="fa fa-th"></i><span>스케줄</span>
                  </a>
               </li>
               

               
               <!-- 보고 -->
               <li>
                  <a href="report"> 
                     <i class=" fa fa-bar-chart-o"></i><span>보고</span>
               		</a>
               </li>
               
               <!-- 쪽지 -->
               <li class="sub-menu">
                  <a href="javascript:;"> 
                     <i class="fa fa-comments-o"></i> <span>쪽지함</span><span class="label label-theme pull-right mail-info">${msgAlarm }</span>
                  </a>
                  <ul class="sub">
                     <li><a href="sentMessage">보낸 쪽지함</a></li>
                     <li><a href="RecMessage">받은 쪽지함</a></li>
                  </ul>
               </li>
               
               <!-- 설문 -->
               <li class="sub-menu">
                  <a  href="javascript:;"> 
                     <i class="fa fa-map-marker"></i>  <span>설문</span>
                  </a>
                  <ul class="sub">
                  	 <li><a href="createSurvey">새 설문 작성</a></li>
                     <li><a href="startedSurvey">진행중인 설문</a></li>
                     <li><a href="endSurvey">마감된 설문</a></li>
                     <li><a href="mySurvey">내가 만든 설문</a></li>
                  </ul>
               </li>
            </ul>
            <!-- sidebar menu end-->
         </div>
      </aside>
      <!--sidebar end-->
		<!--main content start-->
		<section id="main-content">
			<section class="wrapper">
				<h3>
					<i class="fa fa-angle-right"></i> 결재 상신
				</h3>
				<div class="row mt">
					<!--  DATE PICKERS -->
					<div class="col-lg-12">
						<div class="form-panel">
							<form action="signInsert" class="form-horizontal style-form" method="post">
							<input type="hidden" name="empno" value="${user.empNo }">
								<div class="form-group">
									<label  class="control-label col-lg-2" style="text-align: center;">제목</label>
									<div class="col-lg-10">
										<input type="text" class="form-control "  name="title" required>
									</div>
								</div>
								<div class="form-group">
									<label  class="col-sm-2 col-sm-2 control-label" style="text-align: center;">보고 대상자</label>
									<div class="col-md-3 col-xs-11">
									<select name="target" class="form-control" required="required">
												<option value="홍앵앵 과장">홍앵앵 과장</option>
												<option value="홍길동 과장">홍길동 과장</option>
												<option value="황원장 과장">황원장 과장</option>
												<option value="박창준 과장">박창준 과장</option>
												<option value="심고은 과장">심고은 과장</option>
												<option value="최양락 과장">최양락 과장</option>
												<option value="이순재 과장">이순재 과장</option>
												<option value="최불암 과장">최불암 과장</option>
												<option value="이특 부장">이특 부장</option>
												<option value="고준희 부장">고준희 부장</option>
												<option value="이효리 부장">이효리 부장</option>
												<option value="나길동 부장">나길동 부장</option>
												<option value="장동건 이사">장동건 이사</option>
												<option value="강동원 이사">강동원 이사</option>
												<option value="이송이 이사">이송이 이사</option>
												<option value="수진 이사">수진 이사</option>
												
									</select>
									</div>
								</div>
								
								
								<div class="form-group">
									<label class="col-sm-2 col-sm-2 control-label" style="text-align: center;">부서</label>
									<div class="col-md-3 col-xs-11">
										<input type="text" class="form-control" name="department" value="${user.dep }" readonly="readonly">
									</div>
									<label class="col-sm-2 col-sm-2 control-label" style="text-align: center;">작성자</label>
									<div class="col-md-3 col-xs-11">
										<input type="text" class="form-control" name="writer" value="${user.name } ${user.rank}" readonly="readonly">
									</div>
								</div>

								<div class="form-group ">
									<label class="control-label col-lg-2" style="text-align: center;">결재 분류</label>
									<div class="col-md-3 col-xs-11">
										<select id="signChange" name="signs" class="form-control">
													<option value="선택">선택</option>
													<option value="휴가">휴가</option>
													<option value="외근">외근</option>
													<option value="연장근무">연장근무</option>
											</select>
									</div>
								</div>
								<div class="form-group" id="vacation" style="display: none;">
									<label class="control-label col-lg-2" style="text-align: center;">휴가 시작</label>
									<div class="col-md-3 col-xs-12">
										<input id="vacation1"  disabled="disabled" class="form-control" name="startDT" type="date">
									</div>
									<label class="control-label col-lg-2" style="text-align: center;">휴가 마감 </label>
									<div class="col-md-3 col-xs-12">
										<input id="vacation2"disabled="disabled" class="form-control" name="endDT" type="date">
									</div>
									<div class="form-group"></div>
									<label class="col-sm-2 col-sm-2 control-label"  style="text-align: center;">휴가 사유</label>
									<div class="col-lg-10">
										<textarea id="vacation3" class="form-control" disabled="disabled" name="content"></textarea>
									</div>
								</div>
								<div class="form-group" id="outwork1" style="display: none;">
									<label class="control-label col-lg-2" style="text-align: center;">외근 일자</label>
									<div class="col-md-3 col-xs-11">
										<input id="outwork2" class="form-control" disabled="disabled" name="outwork" type="date">
									</div>
									<label class="control-label col-lg-2" style="text-align: center;">외근 지역</label>
									<div class="col-md-3 col-xs-11">
										<input id="outwork3" class="form-control" disabled="disabled" type="text" name="worklocation">
									</div>
									<div class="form-group"></div>
									<label class="control-label col-lg-2" style="text-align: center;">작업 내용</label>
									<div class="col-lg-10">
										<textarea id="outwork4" class="form-control" disabled="disabled" name="content" placeholder="이곳엔 간략히 적고 보고서에 자세히 기제 바랍니다."></textarea>
									</div>
								</div>
								<div class="form-group" id="extend" style="display: none;">
									<label class="control-label col-lg-2" style="text-align: center;">연장 시간</label>
									<div class="col-md-3 col-xs-11">
										<input id="extend1" class="form-control" disabled="disabled" name="startDT" type="time">
									</div>
									<label class="control-label col-lg-2" style="text-align: center;">연장 마감 </label>
									<div class="col-md-3 col-xs-11">
									 <input id="extend2" class="form-control" disabled="disabled" name="endDT" type="time">
									</div>
									<div class="form-group"></div>
									<label class="control-label col-lg-2" style="text-align: center;">연장 사유</label>
									<div class="col-lg-10">
										<textarea id="extend3" class="form-control" disabled="disabled" name="content"></textarea>
									</div>
								</div>
									
								<div class="form-group">
									<div class="col-lg-offset-2 col-lg-10">
										<button class="btn btn-theme" type="submit">올리기</button>
										<button class="btn btn-theme04" type="reset">초기화</button>
									</div>
								</div>
							</form>
						</div>
						<!-- /form-panel -->
					</div>
					<!-- /col-lg-12 -->
				</div>
				<!-- /row -->
				
			</section>
			<!-- /wrapper -->
		</section>
		<!-- /MAIN CONTENT -->
		<!--main content end-->
		<jsp:include page="../default/footer.jsp"/>
	</section>
	<!-- js placed at the end of the document so the pages load faster -->
	<script src="resources/lib/jquery/jquery.min.js"></script>
	<script src="resources/lib/bootstrap/js/bootstrap.min.js"></script>
	<script class="include" type="text/javascript" src="resources/lib/jquery.dcjqaccordion.2.7.js"></script>
	<script src="resources/lib/jquery.scrollTo.min.js"></script>
	<script src="resources/lib/jquery.nicescroll.js" type="text/javascript"></script>
	<!--common script for all pages-->
	<script src="resources/lib/common-scripts.js"></script>
	<!--script for this page-->
	<script src="resources/lib/jquery-ui-1.9.2.custom.min.js"></script>
	<script type="text/javascript" src="resources/lib/bootstrap-fileupload/bootstrap-fileupload.js"></script>
	<script type="text/javascript" src="resources/lib/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
	<script type="text/javascript" src="resources/lib/bootstrap-daterangepicker/date.js"></script>
	<script type="text/javascript" src="resources/lib/bootstrap-daterangepicker/daterangepicker.js"></script>
	<script type="text/javascript" src="resources/lib/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
	<script type="text/javascript" src="resources/lib/bootstrap-daterangepicker/moment.min.js"></script>
	<script type="text/javascript" src="resources/lib/bootstrap-timepicker/js/bootstrap-timepicker.js"></script>
	<script src="resources/lib/advanced-form-components.js"></script>
<script type="text/javascript">
		$("#signChange").change(function() {
			var value = $(this).val();
			if(value=="휴가"){
				document.all.vacation.style.display="";
				document.all.outwork1.style.display="none";
				document.all.extend.style.display="none";
				$("#vacation1").removeAttr("disabled");
				$("#vacation2").removeAttr("disabled");
				$("#vacation3").removeAttr("disabled");
				$("#outwork2").removeAttr("disabled");
				$("#outwork3").removeAttr("disabled");
				$("#outwork4").attr("disabled",true);
				$("#extend1").attr("disabled",true);
				$("#extend2").attr("disabled",true);
				$("#extend3").attr("disabled",true);
			}else if(value=="외근"){
				document.all.outwork1.style.display="";
				document.all.vacation.style.display="none";
				document.all.extend.style.display="none";
				$("#vacation1").removeAttr("disabled");
				$("#vacation2").removeAttr("disabled");
				$("#outwork2").removeAttr("disabled");
				$("#outwork3").removeAttr("disabled");
				$("#outwork4").removeAttr("disabled");
				$("#vacation3").attr("disabled",true);
				$("#extend1").attr("disabled",true);
				$("#extend2").attr("disabled",true);
				$("#extend3").attr("disabled",true);
				
				
			}else if(value=="연장근무"){
				document.all.extend.style.display="";
				document.all.vacation.style.display="none";
				document.all.outwork1.style.display="none";
				$("#extend1").removeAttr("disabled");
				$("#extend2").removeAttr("disabled");
				$("#extend3").removeAttr("disabled");
				$("#outwork2").removeAttr("disabled");
				$("#outwork3").removeAttr("disabled");
				$("#outwork4").attr("disabled",true);
				$("#vacation1").attr("disabled",true);
				$("#vacation2").attr("disabled",true);
				$("#vacation3").attr("disabled",true);
			}else{
				document.all.vacation.style.display="none";
				document.all.outwork.style.display="none";
				document.all.extend.style.display="none";
				$("#outwork2").attr("disabled",true);
				$("#outwork3").attr("disabled",true);
				$("#outwork4").attr("disabled",true);
				$("#vacation1").attr("disabled",true);
				$("#vacation2").attr("disabled",true);
				$("#vacation3").attr("disabled",true);
				$("#extend1").attr("disabled",true);
				$("#extend2").attr("disabled",true);
				$("#extend3").attr("disabled",true);
			}


		})
	</script>
</body>

</html>
