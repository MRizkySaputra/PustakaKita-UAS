/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/javafx/FXML.java to edit this template
 */
package pustakakita;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;

/**
 *
 * @author Muhammad Rizky S
 */
public class Main extends Application {
    
    private static Stage primaryStage;
    
    @Override
    public void start(Stage stage) throws Exception {
//        Parent root = FXMLLoader.load(getClass().getResource("/pustakakita/views/Main.fxml"));
//        
//        Scene scene = new Scene(root);
//        
//        stage.setScene(scene);
//        stage.show();
        
//    public void start(Stage stage) throws Exception {
        primaryStage = stage;
        primaryStage.setResizable(true);
        primaryStage.centerOnScreen();

        Parent root = FXMLLoader.load(getClass().getResource("/pustakakita/views/Main.fxml"));
        Scene scene = new Scene(root);

        primaryStage.setScene(scene);
        primaryStage.show();

    }
    
        public void changeScene(String fxmlFile) throws Exception {
        Parent newRoot = FXMLLoader.load(getClass().getResource(fxmlFile));
        Scene newScene = new Scene(newRoot);
//        double width = newRoot.prefWidth(-1);
//        double height = newRoot.prefHeight(-1);

        primaryStage.setScene(newScene);
        primaryStage.sizeToScene();
//        primaryStage.setWidth(width);
//        primaryStage.setHeight(height);
    }

    public static void main(String[] args) {
        launch(args);
    }
    
}
