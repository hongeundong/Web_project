<%@ page import="com.springboot.project3.data.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <strong>게시글 작성</strong>
  </div>
  <div class="board_write_wrap">
    <div class="board_write">
      <form action="/post" method="post">
        <input type="hidden" name="test" value="board">
        <div class="title">
          <dl>
            <dt><label for="title">제목</label></dt>
            <dd><input type="text" id="title" name="title" required></dd>
          </dl>
        </div>
        <div class="info">
          <dl>
            <dt><label for="uid">글쓴이</label></dt>
            <dd><input type="text" id="uid" name="uid" required></dd>
          </dl>
        </div>
        <div class="cont">
          <dt><label for="content"></label></dt>
          <textarea placeholder="내용 입력" id="content" name="content" required></textarea>
        </div>
      <div class="bt_wrap">
        <button type="submit"><a>등록</a></button>
        <button><a href="nb.jsp">취소</a></button>
      </div>
      </form>
    </div>
  </div>
</div>
</body>
</html>