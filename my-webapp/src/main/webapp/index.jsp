<html>
<body>
<h3>
    <%
        String message = (String)System.getenv("message");
        if(message==null)  {
    %>
    Hello world!
    <%
    } else {
        out.print(message);
    }
    %>
</h3>
</body>
</html>
