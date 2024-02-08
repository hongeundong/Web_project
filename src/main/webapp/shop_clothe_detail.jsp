<%@ page import="com.springboot.project3.data.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>고양이 소핑몰</title>
    <meta charset="utf-8">
    <link href="css/shopmall.css" rel="stylesheet" />
    <link href="css/menu.css" rel="stylesheet"/>

    <style>
        .container {
            display: flex;
            align-items: center;
        }
        .image {
            flex-shrink: 0;
            margin-right: 10px;
        }
        .text {
            flex-grow: 1;
            text-align: center;
            margin-top: 5%;
            font-size: 24px;
        }
    </style>

</head>

<body>
<div class="navbar">
    <nav>
        <ul class="menu">
            <li><div class="logo">
                <a href="index.html">
                    <span class="icon fa-gem"> </span>
                </a>
            </div></li>
            <li><a href="index.jsp" style="color: black; padding: 0px; margin-left:50px; margin-bottom: 20px;"><strong>홈</strong></a></li>
            <li><a href="gaesipan.html" style="color: black; padding: 0px; margin-left: 80px;"><strong>게시판</strong></a></li>
            <li><a href="shopmall.jsp" style="color: black; padding: 0px; margin-left: 80px;"><strong>쇼핑</strong></a></li>
        </ul>
    </nav>
    <div class="search-bar">
        <div class="search-container">
            <input type="text" placeholder="검색어를 입력하세요">
            <div class="search-icon">
                <i class="fa fa-search"></i> <!-- 돋보기 아이콘 -->
            </div>
        </div>
    </div>
    <ul id="menu">
        <div style="color: black; text-align: right;">
            <%
                if (session.getAttribute("loggedInUser") != null) {
            %>
            <h1 style="font-size: 16px;">환영합니다, <%= ((User)session.getAttribute("loggedInUser")).getUid() %>님!</h1>
            <%
            } else {
            %>
            <h1 style="font-size: 16px;">로그인을 해주세요.</h1>
            <%
                }
            %>
        </div>
    </ul>
</div>
<div class="hero-header"></div>


<div class="products">
    <h3></h3>
    <!-- 상품 목록 -->
    <div class="product-list">

        <div class="container">
            <img class="image" src="https://cocous007.speedgabia.com/miyopet/fashion/47_leopard/11.jpg" width="400" height="500">
            <div class="text" style="margin-left: 30px; margin-bottom:30px" >
                <p><strong>고양이 코트</strong></p>
                <hr>
                <p style="text-align: left">34,999,000원</p>
                <p style="text-align: left; color: red; font-size: 15px">품절 임박(1개 남음)</p>
                <p style="text-align: left; font-size: 15px">⭐⭐⭐⭐⭐(5/5)</p>
                <p style="text-align: left; font-size: 15px">구매 후기 : 힙해요(80%)</p>

                <hr>
                <p style="text-align: left; font-size: 15px"><strong>무료배송</strong></p>
                <p style="text-align: left; font-size: 15px">서울 - 내일(금) 11/9 도착 예정</p>
                <p style="text-align: left; font-size: 15px">서울 외 지역 - 배송불가</p>
                <hr>
                <li style="text-align: left; font-size: 15px">기능 : 고양이 피부/털 보호</li>
                <li style="text-align: left; font-size: 15px">재질 : 모피 가죽</li>
                <li style="text-align: left; font-size: 15px">최대 100원 적립</li>

                <br>
                <button style="width: 100px; height: 60px; font-size: 20px">구매</button> <button style="width: 100px; height: 60px; font-size: 20px">장바구니</button>
            </div>
        </div>

        <!--광고 배너-->
        <a href="#" class="banner">
            <img src="https://mblogthumb-phinf.pstatic.net/MjAxNzEwMTNfMjU2/MDAxNTA3ODc4NDcxNjYx.rB9Z2kOnGc50eW0TEGKlQkNnz-wNPil1YgM0u72HpeMg.vBMrst-VuXwNO25tNu6FOgYt4R_LyJr6VHsePfsO5tsg.PNG.thinkingwolf/image_7688740411507878456485.png?type=w800" width="225" height="600">
        </a>

        <a href="#" class="banner2">
            <img src="https://cdn.enewstoday.co.kr/news/photo/201702/689042_205269_1536.jpg" width="225" height="600">
        </a>

        <a href="#" class="banner3">
            <img src="" width="225">
        </a>

        <div class="clearfix"></div>
    </div>
</div>
<br><br><br>
<br><br><br>
<div class="footer">
    <a href="http://facebook.com">
        <img src="data:image/png;base64,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"height="20">
    </a>
    <a href="http://instagram.com">
        <img src="data:image/jpeg;base64,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35QVfhR1cfsWPJlDWeGI5GRflVp7ViyNTm2hOcrz5qUymg7g8lTVYrVP0OqZrHY1+9j6llq3N1nadZ2nlKzntVh7UwTuf0iTrU+FrGdAAahcsJzVZc1Zj2q05qlxyKa1yw3NVpzVlPar+F4VLUzNhibdxsXON8xjL6XOPBxbVZwPvTHTNjaXONwGUrYZC4IamqbI4foactlcbaDICDGz8XQOFS+tbgeFR0kDYI9IGl7yAHSPOtzrbT7FslZLBWlWmrnL+qMQGj+cqIiIUBEREIRERCEREQhY9VSslaWPaHNPlB4QdhWgq8Hkj0tvKzi/aDlG3o8i6dFBrLOgq23SDHmIyhNimfGeauLbbVovtB0EdB0qvMXVTU0b+3Y130gCsc4RB3pHI94+9ZyXgzLfzJARpBHpepgrhnC53NTNXRe9EPeu6yT2p70Q967rJPak/DNT327dy95a3sXO5q8LV0fvRD3rusk9qe9EPeu6yT2r34aqe+3buRyxvYubLVSWLpfeaDvXdY/2p7zwd67rH+1dDg3Ujrt27kctb2Fcs5qtPYut95YO9d1kntXhwOn713WSe1MHB6pHXbt3LsV7BmK4x7FjyNXcnAKbvHdZJ7VScnaXvHdZJ7U0WDUDrN2p7bUjGYqP3tVl7VIhyapPBu6yT2qk5L0ng3dbL7U9tjTjrDanNtiIZjsUbPYrL27Np1DWTyDapOGStH4IniMkhHpWdSYZBD+ygijPCxjQfLrUmOy5Aec4fa/+F063YwOaw3+SjvCMkaichzwaeHa6QWlI+bGdXK63IVIOD4TDSR73CzNB0ucdL5HcLnbStgitYoGxDEqirr5qnE84uwZP5REROUJEREIRERCEREQhEREIRERCEREQhEREIRERCEREQhEREIRERCEREQhEREIRERCEREQhEREIRERCEREQhEREIRERCEREQhEREIRERCEREQhEREIRERCEREQhEREIRERCEREQhEREIRERCF//2Q=="height="20">
    </a>
    <a href="http://twitter.com">
        <img src="data:image/png;base64,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"height="20">
    </a>
</div>
</body>
</html>