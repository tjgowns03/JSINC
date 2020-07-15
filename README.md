# JSINC

그룹웨어  
=========

개발환경  
Programming Language - Java 1.8  IDE - Eclipse  
DB - Oracle  
Framework - MyBatis, Spring 4  
Build Tool - Maven  

→주요 구현 기능  
1.출/퇴근  
2.커뮤니티  
3.게시판  
4.전자 결재  
5.주소록  
6.스케줄 관리  
7.보고  
8.쪽지  
9.설문  
10.관리자 페이지  


→설치
1. project clone  
2. src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml  
<!-- 업로드 패스 설정 --> 
<beans:bean class="java.lang.String" id="uploadPath">
<beans:constructor-arg value=".metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\JSINC\resources" />  // 여기부분 수정

3. 수정  
<beans:constructor-arg value="(workspace 경로까지 추가).metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\JSINC\resources" />

ex)
<beans:constructor-arg value="D:\spring_workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\JSINC\resources" />
