/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package pustakakita.dao;

import java.sql.*;
import pustakakita.models.User;

/**
 *
 * @author Muhammad Rizky S
 */
public class UserDAO {

    public static User getAccount(String username, String password) {
        String query = "SELECT * FROM users WHERE username = ? AND password = md5(?)";

        try (
             Connection koneksi = DBConnection.getConnection(); 
             PreparedStatement pstmt = koneksi.prepareStatement(query)) {

            pstmt.setString(1, username);
            pstmt.setString(2, password);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return new User(
                            rs.getString("username"),
                            rs.getString("password"),
                            rs.getString("fullname"),
                            rs.getString("role")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }
}
