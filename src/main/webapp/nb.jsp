<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.springboot.project3.data.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="css/menu.css">
<%
    // JDBC 드라이버 로드
    Class.forName("org.mariadb.jdbc.Driver");

    // 데이터베이스 연결 설정
    Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/project", "root", "1234");

    Statement statement = conn.createStatement();
    ResultSet resultSet = statement.executeQuery("SELECT id, title, content, uid, created_at FROM post_list");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항</title>
    <link rel="stylesheet" href="css/css.css">
    <style>
        /* 배경 이미지 스타일 설정 */
        body {
            /*background-image: url("https://i.ytimg.com/vi/n94ZvqtclUc/maxresdefault.jpg");*/
            background-size: cover; /* 이미지를 화면에 맞게 조절합니다. */
            background-repeat: no-repeat; /* 이미지 반복 없음 */
        }
    </style>
</head>
<body style="background-image: url('');">
<header>
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
    <nav>
        <ul>
            <li><div class="logo">
                <a href="index.jsp">
                    <span class="icon fa-gem"> </span>
                </a>
            </div>
            </li>
            <li><a href="shopmall.jsp" style="color: black;"><strong>쇼핑</strong></a></li>
            <li><a href="gaesipan.html" style="color: black"><strong>게시판</strong></a></li>
        </ul>
    </nav>
</header>
<div class="board_wrap">
    <div class="board_title">
        <strong>자유게시판</strong>
    </div>
    <div class="board_list_wrap">
        <div class="board_list">
            <div class="top">
                <div class="num">번호</div>
                <div class="title">제목</div>
                <div class="writer">글쓴이</div>
                <div class="date">작성일</div>
                <div class="count">삭제</div>
            </div>
            <% while(resultSet.next()) { %>
            <div>
                <div class="num"><%= resultSet.getString("id") %></div>
                <div class="title"><a href="post_detail.jsp?postId=<%= resultSet.getInt("id") %>"><%= resultSet.getString("title") %></a></div>
                <div class="writer"><%= resultSet.getString("uid") %></div>
                <div class="date"><%= resultSet.getString("created_at") %></div>
                <div class="count" style="border: 1px solid; margin-left:25px; width:5%"><a href="post_delete.jsp?postId=<%= resultSet.getInt("id") %>">X</a></div>
            </div>
            <% } %>
            <%
                resultSet.close();
                statement.close();
                conn.close();
            %>
        </div>
        <div class="board_page">
            <a href="#" class="bt first"><<</a>
            <a href="#" class="bt prev"><</a>
            <a href="#" class="num on">1</a>
            <a href="#" class="bt next">></a>
            <a href="#" class="bt last">>></a>
        </div>
        <div class="bt_wrap">
            <a href="post.jsp" class="on">등록</a>
            <!--<a href="#">수정</a>-->
        </div>
    </div>

</div>
</body>
</html>