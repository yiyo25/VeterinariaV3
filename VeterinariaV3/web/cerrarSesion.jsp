<%@page session="true"%>
<%
    HttpSession sesion2 = request.getSession();
    sesion2.invalidate();
%>

<jsp:forward page="login.jsp"/>
