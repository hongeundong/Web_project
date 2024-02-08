package com.springboot.project3.controller;

import com.springboot.project3.data.User;
import com.springboot.project3.repository.UserRepository;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Optional;

@Controller
public class UserController {

    @Autowired
    private UserRepository userRepository; // UserRepository는 MariaDB에 접근하여 데이터를 저장하기 위한 인터페이스입니다.

    @PostMapping("/register")
    public String registerUser(@RequestParam String uid, @RequestParam String pwd) {
        String jwtToken = Jwts.builder()
                .setSubject(pwd)  // 비밀번호를 토큰의 subject로 설정
                .signWith(SignatureAlgorithm.HS256, pwd) // 시크릿 키로 서명
                .compact();
//         사용자 객체 생성
        User user = new User();
        user.setUid(uid);
        user.setPwd(jwtToken); // 암호화된 토큰을 저장

        // userRepository를 사용하여 사용자 정보 저장
        userRepository.save(user);

        return "redirect:/index.html";
    }

    @PostMapping("/login")
    public String loginUser(@RequestParam String uid, @RequestParam String pwd, HttpSession session, HttpServletResponse response) throws IOException {
        Optional<User> userOptional = userRepository.findByUid(uid);

        if (userOptional.isPresent()) {
            User user = userOptional.get();
            String jwtToken = user.getPwd();

            Claims claims = Jwts.parser().setSigningKey(pwd).parseClaimsJws(jwtToken).getBody();
            String storedPwd = claims.getSubject();

            if (pwd.equals(storedPwd)) {
                // 비밀번호가 일치하면 로그인 성공
                session.setAttribute("loggedInUser", user);
                return "redirect:/index.jsp";
            } else {
                // 비밀번호가 일치하지 않으면 로그인 실패
                response.setContentType("text/html;charset=UTF-8");
                PrintWriter out = response.getWriter();
                out.println("<script>alert('아이디 또는 비밀번호가 일치하지 않습니다.'); location.href='/index.html#login';</script>");
                out.flush();
                return "index.jsp#login";
            }
        } else {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('아이디 또는 비밀번호가 일치하지 않습니다.'); location.href='/index.html#login';</script>");
            out.flush();
            return "index.jsp#login";
        }
    }

    @GetMapping("/logout_do")
    public String logout(HttpSession session) {
        // 세션 무효화
        session.invalidate();

        // 로그아웃 후 리다이렉트할 경로를 지정해주세요.
        return "redirect:/index.jsp";
    }

    @GetMapping("/test")
    @ResponseBody
    public String getUserRegisterData() {
        Optional<User> userOptional = userRepository.findById(1L);

        if (userOptional.isPresent()) {
            User user = userOptional.get();
            System.out.println("ID: " + user.getId());
            System.out.println("Username: " + user.getPwd());
            System.out.println("Email: " + user.getUid());
            // 필요한 다른 필드들을 출력하거나 처리할 수 있습니다.
        } else {
            System.out.println("해당 ID의 사용자를 찾을 수 없습니다.");
        }
        return "main";
    }

    @GetMapping("/profile")
    public String showProfile(HttpSession session) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        // loggedInUser를 이용하여 프로필 정보를 표시
        // ...
        return "profilePage";
    }
}