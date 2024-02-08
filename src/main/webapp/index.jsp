<%@ page import="com.springboot.project3.data.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
    <title>고양이 샵</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="assets/css/main.css" />
    <noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
</head>
<body class="is-preload">
<!-- Wrapper -->
<div id="wrapper">
    <div style="color: violet;">
        <%
            if (session.getAttribute("loggedInUser") != null) {
        %>
        <h1>환영합니다. <%= ((User)session.getAttribute("loggedInUser")).getUid() %>님!</h1>
        <%
        } else {
        %>
        <h1>로그인을 해주세요.</h1>
        <%
            }
        %>
    </div>
    <!-- Header -->
    <header id="header">
        <div class="logo">
            <span class="icon fa-gem"></span>
        </div>
        <div class="content">
            <div class="inner">
                <h1>고양이 쇼핑몰</h1>
                <p>고양이로 우주정복<br/>
                    　<br></p>
            </div>
        </div>
        <nav>
            <ul>
<%--                <li><a href="#login"></a></li>--%>
                <%
                    if (session.getAttribute("loggedInUser") != null) {
                %>
                <li><a href="/logout_do">로그아웃</a></li>
                <%
                } else {
                %>
                <li><a href="#login">로그인</a></li>
                <%
                    }
                %>

                <%
                    if (session.getAttribute("loggedInUser") != null) {
                %>
                <li><a href="#user_info">회원정보</a></li>
                <%
                } else {
                %>
                <li><a href="#register">회원가입</a></li>
                <%
                    }
                %>
            </ul>
        </nav>
        <nav>
            <ul>
                <li><a href="#intro">소개</a></li>
                <li><a href="shopmall.jsp">쇼핑</a></li>
                <li><a href="gaesipan.html">게시판</a></li>
                <li><a href="#contact">제작자</a></li>
            </ul>
        </nav>
    </header>

    <!-- Main -->
    <div id="main">
        <article id="login">
            <h2>Login</h2>
            <div class="container">
                <form action="/login" method="post"> <!--다음 사이트 주소 코드-->
                    <div class="input-group" style="margin-bottom: 30px">
                        <label for="uid">Username</label>
                        <input type="text" id="uid" name="uid" required>
                    </div>
                    <div class="input-group" style="margin-bottom: 50px">
                        <label for="pwd">Password</label>
                        <input type="password" id="pwd" name="pwd" required>
                    </div>
                    <button type="submit" class="btn">Login</button> <!-- 제출 버튼 생성하는 코드 -->
                </form>
            </div>
        </article>
        <article id="register">
            <h2>Register</h2>
            <div class="container">
                <form action="/register" method="post"> <!--다음 사이트 주소 코드-->
                    <div class="input-group" style="margin-bottom: 30px">
                        <label for="uid">Username</label>
                        <input type="text" id="uids" name="uid" required>
                    </div>
                    <div class="input-group" style="margin-bottom: 50px">
                        <label for="pwd">Password</label>
                        <input type="password" id="pwds" name="pwd" required>
                    </div>
                    <button type="submit" class="btn">Register</button> <!-- 제출 버튼 생성하는 코드 -->
                </form>
            </div>
        </article>
        <!-- Intro -->
        <article id="intro">
            <h2 class="major">홈페이지 소개</h2>
            <p>고양이를 위한 쇼핑몰을 만들어봤습니다. 많이 사랑해주세요.</p>
            <p>고양이를 위한 옷, 차, 우주선, 그 외에 많은 물품들 기대해주세요.</p>
            <span class="image main"><img src="https://th.bing.com/th/id/R.539840108581874b21dc1f9132d1895e?rik=RFfK7MSM1GUUzQ&riu=http%3a%2f%2fblogfiles.naver.net%2f20150209_12%2f1026eun_1423460076517hY8TM_JPEG%2fDSC01308.JPG&ehk=xatLy1GcVwzCY1Qqvz4wNs%2fGWRjlWgepB%2f8wBGgBKMs%3d&risl=&pid=ImgRaw&r=0" alt="" /></span>
        </article>

        <!-- Contact -->
        <article id="contact">
            <h2 class="major">만든 사람들</h2>
            <div class="contact-info">
                <div class="contact-info-item">
                    <span class="image main"><img src="https://pds.joongang.co.kr/news/component/htmlphoto_mmdata/201310/28/htm_2013102810154430103011.jpg" alt="" /></span>
                    <p style="margin-bottom: 0px">백민호(23세)</p>
                    <p>yonseiman@naver.com</p>
                </div>
                <div class="contact-info-item">
                    <span class="image main"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgg9ANsmwnAGpXAVygAx1y3bQS25SZOli_-w&usqp=CAU" alt="" /></span>
                    <p style="margin-bottom: 0px">지용욱(24세)</p>
                    <p>helpmeplz@naver.com</p>
                </div>
                <div class="contact-info-item">
                    <span class="image main"><img src="https://images.unsplash.com/photo-1572196663741-b91b8f045330?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDE4fHx8ZW58MHx8fHx8&w=1000&q=80" alt="" /></span>
                    <p style="margin-bottom: 0px">김유준(24세)</p>
                    <p>koreano1@naver.com</p>
                </div>
            </div>
        </article>
        <article id="user_info">
            <%
                if (session.getAttribute("loggedInUser") != null) {
            %>
            <h1>회원 아이디 <%= ((User)session.getAttribute("loggedInUser")).getUid() %></h1>
            <%
            }
            %>
        </article>
        <article id="logout">
        </article>
    </div>

    <!-- Footer -->

</div>

<!-- BG -->
<div id="bg"></div>

<!-- Scripts -->
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/browser.min.js"></script>
<script src="assets/js/breakpoints.min.js"></script>
<script src="assets/js/util.js"></script>
<script src="assets/js/main.js"></script>
</body>
</html>
