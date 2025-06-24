/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package pustakakita.controllers;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.net.URL;
import java.time.LocalDate;
import java.util.List;
import java.util.ResourceBundle;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.Alert;
import javafx.scene.control.ButtonType;
import javafx.scene.control.ComboBox;
import javafx.scene.control.DatePicker;
import javafx.scene.control.Label;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.TextField;
import javafx.scene.control.cell.PropertyValueFactory;
import pustakakita.Main;
import pustakakita.dao.BukuDAO;
import pustakakita.dao.KategoriBukuDAO;
import pustakakita.dao.Session;
import pustakakita.models.Buku;
import pustakakita.models.KategoriBuku;

/**
 *
 * @author Muhammad Rizky S
 */

public class MasterDataDashboard implements Initializable{    
    @FXML private ComboBox<KategoriBuku> cbxKategori;
    @FXML private ComboBox<KategoriBuku> cbxKategoriCari;
    @FXML private ComboBox<String> cbxSorting;
    
    @FXML private DatePicker dpcDari;
    @FXML private DatePicker dpcSampai;
    @FXML private DatePicker tglPengadaan;

    @FXML private TextField txtJudulPengarang;
    @FXML private TextField kodeBuku;
    @FXML private TextField judul;
    @FXML private TextField pengarang;
    @FXML private TextField penerbit;
    @FXML private TextField tahun;
    @FXML private TextField edisi;
    @FXML private Label labelWelcome;
    
    @FXML private Button btnClear;
    @FXML private Button btnAdd;
    @FXML private Button btnUpdate;
    @FXML private Button btnDelete;
    @FXML private Button btnClearData;
    @FXML private Button btnExportData;
    @FXML private Button buttonLogout;
    
    @FXML private TableView<Buku> tblViewBuku;
    @FXML private TableColumn<Buku, String> colKodeBuku;
    @FXML private TableColumn<Buku, String> colKategori;
    @FXML private TableColumn<Buku, String> colJudul;
    @FXML private TableColumn<Buku, String> colPengarang;
    @FXML private TableColumn<Buku, String> colPenerbit;
    @FXML private TableColumn<Buku, String> colTahun;
    @FXML private TableColumn<Buku, String> colEdisi;
    @FXML private TableColumn<Buku, String> colPengadaan;

    private ObservableList<Buku> bukuList;
    
    //Awal Logout
    @FXML
    private void handleButtonLogoutAction(ActionEvent event) throws Exception {        
        Main main = new Main();
        main.changeScene("/pustakakita/views/Main.fxml");
    }
    //Akhir Logout
    
    //Awal Alert, Clear dan Select
    private Buku selectedBuku;
    
    @FXML
    private void clearData() {
        String kodeBaru = generateKodeBukuBaru();
        kodeBuku.setDisable(false);
        kodeBuku.setEditable(false);
        
        kodeBuku.setText(kodeBaru);
        cbxKategori.setValue(null);
        judul.clear();
        pengarang.clear();
        penerbit.clear();
        tahun.clear();
        edisi.clear();
        tglPengadaan.setValue(null);
        selectedBuku = null;
    }


    private void showAlert(String title, String message) {
        Alert alert = new Alert(Alert.AlertType.ERROR);
        alert.setTitle(title);
        alert.setHeaderText(null);
        alert.setContentText(message);
        alert.showAndWait();
    }

    private void showInformation(String message) {
        Alert alert = new Alert(Alert.AlertType.INFORMATION);
        alert.setTitle("Information");
        alert.setHeaderText(null);
        alert.setContentText(message);
        alert.showAndWait();
    }

    private void selectBuku(Buku buku) {
        if (buku != null) {
            selectedBuku = buku;
            kodeBuku.setText(buku.getKodeBuku());
            kodeBuku.setEditable(false);
            judul.setText(buku.getJudul());
            pengarang.setText(buku.getPengarang());
            penerbit.setText(buku.getPenerbit());
            tahun.setText(String.valueOf(buku.getTahun()));
            edisi.setText(String.valueOf(buku.getEdisi()));
            tglPengadaan.setValue(LocalDate.parse(buku.getTanggalPengadaan()));

            for (Object obj : cbxKategori.getItems()) {
                KategoriBuku kat = (KategoriBuku) obj;
                if (kat.getKodeKategori().equals(buku.getKodeKategori())) {
                    cbxKategori.setValue(kat);
                    break;
                }
            }
        }
    }
    //Akhir Alert dan Select
    
    //Awal Export Data
    @FXML
    private void handleButtonExport(ActionEvent event) throws IOException{
        List<Buku> bukuList = BukuDAO.getAllBuku();
        
        BufferedWriter writer = new BufferedWriter(new FileWriter("storage/data_buku.csv"));
        
        //Header
        writer.write("Kode Buku, Kode Kategori, Judul, Pengarang, Penerbit, Tahun, Edisi, Tanggal Pengadaan, Nama Kategori\n");
        
        for (Buku buku : bukuList) {
            writer.write(
                buku.getKodeBuku() + "," +
                buku.getKodeKategori() + "," +
                buku.getJudul() + "," +
                buku.getPengarang() + "," +
                buku.getPenerbit() + "," +
                buku.getTahun() + "," +
                buku.getEdisi() + "," +
                buku.getTanggalPengadaan() + "," +
                buku.getNamaKategori() + "\n"
            );
        }

        writer.close();
        
        showInformation("Data berhasil diexport.");
    }
    //Akhir Export Data
    
    private String generateKodeBukuBaru() {
        String kodeTerakhir = BukuDAO.getKodeBukuTerakhir();
        if (kodeTerakhir == null || kodeTerakhir.isEmpty()) {
            return "B00001";
        }

        String angkaStr = kodeTerakhir.substring(1);
        int angka = Integer.parseInt(angkaStr) + 1;

        return String.format("B%05d", angka);
    }

    //AWAL CRUD
    @FXML
    private void AddBuku() {
        String kode = generateKodeBukuBaru();
        KategoriBuku kategori = cbxKategori.getValue();

        if (kategori == null) {
            showAlert("Input Error", "Kategori belum dipilih!");
            return;
        }

        String kodeKategori = kategori.getKodeKategori();
        String namaKategori = kategori.getNamaKategori();
        String judulBuku = judul.getText();
        String pengarangBuku = pengarang.getText();
        String penerbitBuku = penerbit.getText();
        String tahunBuku = tahun.getText();
        String tanggalPengadaan = tglPengadaan.getValue().toString();

        if (kode.isEmpty() || judulBuku.isEmpty() || pengarangBuku.isEmpty() || penerbitBuku.isEmpty()
                || tahun.getText().isEmpty() || edisi.getText().isEmpty() || tanggalPengadaan == null) {
            showAlert("Input Error", "Semua kolom harus diisi!");
            return;
        }

        if (judulBuku.length() < 3) {
            showAlert("Input Error", "Judul harus lebih dari 3 karakter.");
            return;
        }

        if (pengarangBuku.length() < 3) {
            showAlert("Input Error", "Nama pengarang harus lebih dari 3 karakter.");
            return;
        }
        
        if (tahunBuku.length() != 4 || !tahunBuku.matches("\\d{4}")) {
            showAlert("Input Error", "Tahun terbit harus 4 digit angka.");
            return;
        }

        try {
            int tahunTerbit = Integer.parseInt(tahun.getText());
            int edisiBuku = Integer.parseInt(edisi.getText());

            Buku newBuku = new Buku(kode, kodeKategori, judulBuku, pengarangBuku, penerbitBuku, tahunTerbit, edisiBuku, tanggalPengadaan, namaKategori);

            BukuDAO.addBuku(newBuku);
            loadDataBuku();
            clearData();
            showInformation("Buku Berhasil Ditambahkan!");

        } catch (NumberFormatException e) {
            showAlert("Format Error", "Tahun dan Edisi harus berupa angka!");
        }
    }
    
    @FXML
    private void UpdateBuku() {
        if (selectedBuku == null) {
            showAlert("Pilih Data", "Silakan pilih buku yang ingin diubah!");
            return;
        }

        String kode = kodeBuku.getText();
        KategoriBuku kategori = (KategoriBuku) cbxKategori.getValue();
        if (kategori == null) {
            showAlert("Input Error", "Kategori belum dipilih!");
            return;
        }

        String kodeKategori = kategori.getKodeKategori();
        String namaKategori = kategori.getNamaKategori();
        String judulBuku = judul.getText();
        String pengarangBuku = pengarang.getText();
        String penerbitBuku = penerbit.getText();
        String tahunBuku = tahun.getText();
        String tanggalPengadaan = tglPengadaan.getValue().toString();

        if (judulBuku.length() < 3) {
            showAlert("Input Error", "Judul harus lebih dari 3 karakter.");
            return;
        }

        if (pengarangBuku.length() < 3) {
            showAlert("Input Error", "Nama pengarang harus lebih dari 3 karakter.");
            return;
        }
        
        if (tahunBuku.length() != 4 || !tahunBuku.matches("\\d{4}")) {
            showAlert("Input Error", "Tahun terbit harus 4 digit angka, misalnya: 2023");
            return;
        }

        Alert confirm = new Alert(Alert.AlertType.CONFIRMATION);
        confirm.setTitle("Konfirmasi Ubah Data");
        confirm.setHeaderText(null);
        confirm.setContentText("Yakin ingin mengubah data ini?");
        confirm.showAndWait().ifPresent(response -> {
            if (response == ButtonType.OK) {
                try {
                    int tahunTerbit = Integer.parseInt(tahun.getText());
                    int edisiBuku = Integer.parseInt(edisi.getText());

                    Buku updated = new Buku(kode, kodeKategori, judulBuku, pengarangBuku, penerbitBuku, tahunTerbit, edisiBuku, tanggalPengadaan, namaKategori);
                    BukuDAO.updateBuku(updated);
                    loadDataBuku();
                    clearData();
                    showInformation("Data buku berhasil diperbarui!");
                } catch (NumberFormatException e) {
                    showAlert("Format Error", "Tahun Terbit dan Edisi harus angka!");
                }
            }
        });
    }

    @FXML
    private void DeleteBuku() {
        Buku selected = tblViewBuku.getSelectionModel().getSelectedItem();
        if (selected == null) {
            showAlert("Pilih Data", "Pilih buku yang ingin dihapus!");
            return;
        }

        Alert confirm = new Alert(Alert.AlertType.CONFIRMATION);
        confirm.setTitle("Konfirmasi Hapus");
        confirm.setHeaderText(null);
        confirm.setContentText("Yakin ingin menghapus data ini?");
        confirm.showAndWait().ifPresent(response -> {
            if (response == ButtonType.OK) {
                BukuDAO.deleteBuku(selected.getKodeBuku());
                loadDataBuku();
                clearData();
                showInformation("Data berhasil dihapus.");
            }
        });
    }
    //Akhir CRUD

    //Awal Filtering
    private void loadDataKategori() {
        KategoriBukuDAO kategoriBukuDAO = new KategoriBukuDAO();

        ObservableList<KategoriBuku> kategoriBukuList = FXCollections.observableArrayList(kategoriBukuDAO.getAllKategoriBuku());
        cbxKategoriCari.setItems(kategoriBukuList);
        cbxKategori.setItems(kategoriBukuList);
    }

    public String getSelectedKodeKategori() {
        KategoriBuku selectedKategoriBuku = cbxKategoriCari.getSelectionModel().getSelectedItem();

        if (selectedKategoriBuku != null) {
            return selectedKategoriBuku.getKodeKategori();
        }
        return null;
    }

    private void loadDataBuku() {
        bukuList = FXCollections.observableArrayList(BukuDAO.getAllBuku());
        tblViewBuku.setItems(bukuList);
    }

    @FXML
    private void handleBtnCari(ActionEvent event) {
        bukuList.clear();
        BukuDAO.sortingOption = getSelectedComboboxSorting();
        BukuDAO.filterJudulPengarang = txtJudulPengarang.getText();
        LocalDate dari = dpcDari.getValue();
        LocalDate sampai = dpcSampai.getValue();
        if (dari != null || sampai != null) {
            BukuDAO.filterTanggalDari = dari.toString();
            BukuDAO.filterTanggalSampai = sampai.toString();
        }

        if (getSelectedKodeKategori() != null) {
            BukuDAO.filterKategori = getSelectedKodeKategori();
        }

        loadDataBuku();
        loadTableBuku();
    }

    private void initComboboxSorting() {
        cbxSorting.setItems(
                FXCollections.observableArrayList(
                        "",
                        "Judul A-Z",
                        "Judul Z-A",
                        "Pengadaan Terbaru",
                        "Pengadaan Lama"
                )
        );
        cbxSorting.getSelectionModel().selectFirst();
    }
    //Akhir Filtering

    //Awal Sorting
    public String getSelectedComboboxSorting() {
        String sortingOption = cbxSorting.getSelectionModel().getSelectedItem();
        return sortingOption;
    }

    private void loadTableBuku() {
        bukuList = FXCollections.observableArrayList(BukuDAO.getAllBuku());
        tblViewBuku.setItems(bukuList);
    }
    //Akhir Sorting

    @FXML
    private void handleClear(ActionEvent event) {
        txtJudulPengarang.clear();
        dpcDari.setValue(null);
        dpcSampai.setValue(null);

        cbxKategoriCari.getSelectionModel().clearSelection();
        cbxKategoriCari.setValue(null);

        BukuDAO.filterJudulPengarang = "";
        BukuDAO.filterTanggalDari = "";
        BukuDAO.filterTanggalSampai = "";
        BukuDAO.filterKategori = "";

        loadDataBuku();

        cbxSorting.getSelectionModel().selectFirst();
        BukuDAO.sortingOption = "";
        loadTableBuku();
    }

    private void refreshTable() {
        bukuList = FXCollections.observableArrayList(BukuDAO.getAllBuku());
        tblViewBuku.setItems(bukuList);
    }

    private void initTableViewBuku() {
        colKodeBuku.setCellValueFactory(
                new PropertyValueFactory<>("kodeBuku")
        );
        colKategori.setCellValueFactory(
                new PropertyValueFactory<>("namaKategori")
        );
        colJudul.setCellValueFactory(
                new PropertyValueFactory<>("judul")
        );
        colPengarang.setCellValueFactory(
                new PropertyValueFactory<>("pengarang")
        );
        colPenerbit.setCellValueFactory(
                new PropertyValueFactory<>("penerbit")
        );
        colTahun.setCellValueFactory(
                new PropertyValueFactory<>("tahun")
        );
        colEdisi.setCellValueFactory(
                new PropertyValueFactory<>("edisi")
        );
        colPengadaan.setCellValueFactory(
                new PropertyValueFactory<>("tanggalPengadaan")
        );

    }
    
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        String username = Session.getSessionAttribute("username");
        String password = Session.getSessionAttribute("password");
        String fullname = Session.getSessionAttribute("fullname");
        String role = Session.getSessionAttribute("role");
        
        labelWelcome.setText("Selamat datang, " + fullname + " (" + role +") ");
        
        tblViewBuku.getSelectionModel().selectedItemProperty().addListener((obs, oldSelection, newSelection) -> {
            if (newSelection != null) {
                selectBuku(newSelection);
            }
        });
        
        //Filtering
        loadDataKategori();
        initTableViewBuku();
        loadDataBuku();

        //Sorting
        initComboboxSorting();
        initTableViewBuku();
        loadTableBuku();
        
        String kodeBaru = generateKodeBukuBaru();
        kodeBuku.setText(kodeBaru);
        kodeBuku.setDisable(true);
        kodeBuku.setEditable(false);
        
        //Clear
        refreshTable();
    }
}