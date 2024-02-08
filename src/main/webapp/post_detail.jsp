<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.springboot.project3.data.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // JDBC 드라이버 로드
    Class.forName("org.mariadb.jdbc.Driver");

    // 데이터베이스 연결 설정
    Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/project", "root", "1234");
    int postId = Integer.parseInt(request.getParameter("postId"));
    Statement statement = conn.createStatement();
    ResultSet resultSet = statement.executeQuery("SELECT id, uid, title, content, created_at FROM post_list WHERE id = " + postId);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항</title>
    <link rel="stylesheet" href="css/css.css">
</head>

<body>

<div style="color: black; text-align: right; margin-right: 270px;">
    <%
        if (session.getAttribute("loggedInUser") != null) {
    %>
    <h1>환영합니다, <%= ((User)session.getAttribute("loggedInUser")).getUid() %>님!</h1>
    <%
    } else {
    %>
    <h1><a href="login.html">로그인을 해주세요.</a></h1>
    <%
        }
    %>
</div>
<div class="board_wrap">
    <div class="board_title">
        <strong>자유게시판</strong>
    </div>
    <div class="board_view_wrap">
        <div class="board_view">
            <% while(resultSet.next()) { %>
            <div class="title">
                <dt><%= resultSet.getString("title") %></dt>
            </div>
            <div class="info">
                <dl>
                    <dt>번호　:　</dt>
                    <dt><%= resultSet.getString("id")%></dt>
                </dl>
                <dl>
                    <dt>글쓴이　:　</dt>
                    <dt><%= resultSet.getString("uid")%></dt>
                </dl>
                <dl>
                    <dt>작성일　:　</dt>
                    <dt><%= resultSet.getString("created_at")%></dt>
                </dl>
            </div>
            <div class="cont">
                <%= resultSet.getString("content")%>
            </div>
            <% } %>
            <%
                resultSet.close();
                statement.close();
                conn.close();
            %>
        </div>
        <div class="bt_wrap">
            <a href="nb.jsp" class="on">목록</a>
            <a href="edit.html">수정</a>
        </div>
    </div>
</div>
</body>
</html>
