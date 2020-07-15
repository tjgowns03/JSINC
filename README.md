# JSINC
1. project clone
2. src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml
<!-- 업로드 패스 설정 --> 
<beans:bean class="java.lang.String" id="uploadPath">
<beans:constructor-arg value=".metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\JSINC\resources" />  // 여기부분 수정

3. 수정
<beans:constructor-arg value="(workspace 경로까지 추가).metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\JSINC\resources" />

ex)
<beans:constructor-arg value="D:\spring_workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\JSINC\resources" />
