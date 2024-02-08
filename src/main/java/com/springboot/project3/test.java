package com.springboot.project3;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class test {
    public static void main(String[] args) {
        String jdbcUrl = "jdbc:mariadb://localhost:3306/project";
        String username = "root";
        String password = "1234";

        try {
            // 데이터베이스 연결
            Connection connection = DriverManager.getConnection(jdbcUrl, username, password);

            // SQL 쿼리 작성
            String insertQuery = "INSERT INTO user_register(id, pwd) VALUES (?, ?)";

            // PreparedStatement 생성
            PreparedStatement preparedStatement = connection.prepareStatement(insertQuery);

            // 값 설정
            preparedStatement.setString(1, "1"); // id에 넣을 값
            preparedStatement.setString(2, "Value2"); // name에 넣을 값

            // 쿼리 실행
            int rowsAffected = preparedStatement.executeUpdate();

            // 결과 확인
            if (rowsAffected > 0) {
                System.out.println("데이터가 성공적으로 추가되었습니다.");
            } else {
                System.out.println("데이터 추가 실패");
            }

            // 리소스 정리
            preparedStatement.close();
            connection.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}