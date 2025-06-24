/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/javafx/FXML2.java to edit this template
 */
package pustakakita.controllers;

import java.net.URL;
//import java.time.LocalDate;
import java.util.ResourceBundle;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Alert;
import javafx.scene.control.Button;
import javafx.scene.control.PasswordField;
import javafx.scene.control.TextField;
import pustakakita.Main;
import pustakakita.dao.UserDAO;
import pustakakita.dao.Session;
import pustakakita.models.User;

/**
 *
 * @author Muhammad Rizky S
 */
public class MainController implements Initializable {
    @FXML private TextField inputUsername;
    @FXML private PasswordField inputPassword;
    
    @FXML private Button btnLogin;

//Awal Login
    @FXML
    private void handleButtonLoginAction(ActionEvent event) throws Exception {
        checkLogin();
    }

    private void checkLogin() throws Exception {
        String username = inputUsername.getText();
        String password = inputPassword.getText();

        if (username.isEmpty() || password.isEmpty()) {
            showAlert("Login Error", "Isi Username dan Password");
            return;
        }
        try {
            User user = UserDAO.getAccount(username, password);
            if (user != null) {
                Session.createSession(user.getUsername(),
                        user.getPassword(),
                        user.getFullname(),
                        user.getRole());

                showInfo("Login Success", "Login berhasil, " + "Session Database");

                Main main = new Main();
                main.changeScene("/pustakakita/views/Dashboard.fxml");
            } else {
                showAlert("Login Error", "Username atau Password Salah !");
            }
        } catch (Exception e) {
            e.printStackTrace();
            showAlert("Login Error", "Username atau Password Salah !");
        }
    }

    private void showAlert(String title, String massage) {
        Alert alert = new Alert(Alert.AlertType.ERROR);
        alert.setTitle(title);
        alert.setHeaderText(null);
        alert.setContentText(massage);
        alert.showAndWait();
    }

    private void showInfo(String title, String massage) {
        Alert alert = new Alert(Alert.AlertType.INFORMATION);
        alert.setTitle(title);
        alert.setHeaderText(null);
        alert.setContentText(massage);
        alert.showAndWait();
    }
//Akhir Login

    @Override
    public void initialize(URL url, ResourceBundle rb) {
        // TODO
    }

}
