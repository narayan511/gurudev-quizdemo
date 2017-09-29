<html>
<body bgcolor="#FFFFFF" text="#0000FF">
<form method="POST" enctype="multipart/form-data" action="servlet/UpLoadServlet">

<table width="242" background="images/tbg.gif">
  <%
String path=getServletConfig().getServletContext().getRealPath("")+"/upload";
%>
  <tr> 
      <td><font color="#000000"><b>Attach your Image file</b></font></td>
  </tr>
  <tr> 
    <td>&nbsp; </td>
  </tr>
  <tr> 
    <td> 
      <input type=file size=20 name="uploadFile">
    </td>
  </tr>
  <tr> 
    <td align="center"> 
      <input type=Submit value=Upload name="Submit">
    </td>
  </tr>
</table> 
</form>
</body>
</html>
