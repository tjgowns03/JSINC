<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <style type="text/css">
         /* 기본 설정*/
         a{text-decoration:none; color:#000000;}         
         a:hover{color:#ff0000;}                    
         
         /* nav tag */
         nav ul{padding-top:10px;}                     /*  상단 여백 10px  */
         nav ul li {
            display:inline;                         /*  세로나열을 가로나열로 변경 */
            border-left:1px solid #999;             /* 각 메뉴의 왼쪽에 "|" 표시(분류 표시) */
            font:bold 12px Dotum;                     /* 폰트 설정 - 12px의 돋움체 굵은 글씨로 표시 */
            padding:0 10px;                         /* 각 메뉴 간격 */
        }
         nav ul li:first-child{border-left:none;}     /* 메뉴 분류중 제일 왼쪽의 "|"는 삭제       
    </style>

<title>JS.Inc</title>
<link href="resources/img/favicon.png" rel="icon">
</head>

<body>
	<section id="container">
		<jsp:include page="../default/header.jsp" />
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
                     <li><a href="newSign">결재 상신</a></li>
                     <li class="active"><a href="signApprove">결재 승인</a></li>
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
                  <a href="javascript:;"> 
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
					<i class="fa fa-angle-right"></i> 결재 승인
				</h3>
				<hr>
				<div class="row mb">
					<!-- page start-->
					<div class="content-panel">
						<div class="adv-table">
							<table cellpadding="0" cellspacing="0" border="0"
								class="display table table-bordered" id="hidden-table-info">
								<thead>
									<tr>
										<td>제목</td><td>결재 분류</td><td>보고 대상자</td><td>부서</td><td>작성일자</td><td>결재 현황</td>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="list" items="${sign }">
										<tr>
											<td><a href="aproved?bno=${list.bno }">${list.title }</a></td>
											<td>${list.signs }</td>
											<td>${list.target }</td>
											<td>${list.department }</td>
											<td><fmt:formatDate value="${list.regdate }" pattern="yyyy-MM-dd (E) HH:mm:ss (a)"/></td>
											<td>${list.checksign }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<!-- page end-->
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
	<script type="text/javascript" language="javascript" src="resources/lib/advanced-datatable/js/jquery.js"></script>
	<script src="resources/lib/bootstrap/js/bootstrap.min.js"></script>
	<script class="include" type="text/javascript" src="resources/lib/jquery.dcjqaccordion.2.7.js"></script>
	<script src="resources/lib/jquery.scrollTo.min.js"></script>
	<script src="resources/lib/jquery.nicescroll.js" type="text/javascript"></script>
	<script type="text/javascript" language="javascript" src="resources/lib/advanced-datatable/js/jquery.dataTables.js"></script>
	<script type="text/javascript" src="resources/lib/advanced-datatable/js/DT_bootstrap.js"></script>
	<!--common script for all pages-->
	<script src="resources/lib/common-scripts.js"></script>
	
	<!--script for this page-->
	<script type="text/javascript">
		/* Formating function for row details 
		function fnFormatDetails(oTable, nTr) {
			var aData = oTable.fnGetData(nTr);
			var sOut = '<table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;">';
			sOut += '<tr><td>Rendering engine:</td><td>' + aData[2] + '</td></tr>';
			sOut += '</table>';
			return sOut;
		}
		*/
		$(document).ready(
			function() {
				var nCloneTh = document.createElement('th');
				var nCloneTd = document.createElement('td');
				/*
				nCloneTd.innerHTML = '<img src="resources/lib/advanced-datatable/images/details_open.png">';
				nCloneTd.className = "center";
				*/
				
				$('#hidden-table-info thead tr').each(
					function() {
						this.insertBefore(nCloneTh,this.childNodes[0]);
					}
				);

				$('#hidden-table-info tbody tr').each(
					function() {
						this.insertBefore(nCloneTd.cloneNode(true),this.childNodes[0]);
					}
				);
				
				/*
				 * Initialse DataTables, with no sorting on the 'details' column
				 */
				 
				var oTable = $('#hidden-table-info').dataTable({
					"aoColumnDefs" : [ {"bSortable" : false, "aTargets" : [ 0 ]} ], "aaSorting" : [ [ 5, 'desc' ] ]
				});

				/* Add event listener for opening and closing details
				 * Note that the indicator for showing which row is open is not controlled by DataTables,
				 * rather it is done here
				 */
				
				 /*
				$('#hidden-table-info tbody td img').live('click',
					function() {
						var nTr = $(this).parents('tr')[0];
						if (oTable.fnIsOpen(nTr)) {
							this.src = "resources/lib/advanced-datatable/images/details_open.png";
							oTable.fnClose(nTr);
						} else {
							this.src = "resources/lib/advanced-datatable/images/details_close.png";
							oTable.fnOpen(nTr,fnFormatDetails(oTable,nTr),'details');
						}
					}
				);*/
			}
		);
	</script>
</body>

</html>
				