/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package pustakakita.dao;

import java.sql.*;
import java.time.LocalDate;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import java.util.ArrayList;
import java.util.List;
import pustakakita.models.Buku;

/**
 *
 * @author Muhammad Rizky S
 */
public class BukuDAO {

    public static String filterTanggalDari;
    public static String filterTanggalSampai;
    public static String filterJudulPengarang;
    public static String filterKategori;
    public static String sortingOption = "";

    public static List<Buku> getAllBuku() {
        List<Buku> bukuList = new ArrayList<>();
        String sql = "SELECT buku.*, kategori_buku.nama_kategori "
                + "FROM buku "
                + "LEFT JOIN kategori_buku ON buku.kode_kategori = kategori_buku.kode_kategori "
                + "WHERE 1=1";

        if (filterTanggalDari != null && !filterTanggalDari.isEmpty()) {
            sql += " AND buku.tanggal_pengadaan BETWEEN '" + filterTanggalDari + "' AND '" + filterTanggalSampai + "' ";
        }

        if (filterJudulPengarang != null && !filterJudulPengarang.isEmpty()) {
            sql += " AND (buku.judul LIKE '%" + filterJudulPengarang + "%' OR buku.pengarang LIKE '%" + filterJudulPengarang + "%') ";
        }

        if (filterKategori != null && !filterKategori.isEmpty()) {
            sql += " AND buku.kode_kategori = '" + filterKategori + "' ";
        }

        if (!sortingOption.isEmpty()) {
            switch (sortingOption) {
                case "Judul A-Z":
                    sql += " ORDER BY buku.judul ASC";
                    break;
                case "Judul Z-A":
                    sql += " ORDER BY buku.judul DESC";
                    break;
                case "Pengadaan Terbaru":
                    sql += " ORDER BY buku.tanggal_pengadaan DESC";
                    break;
                case "Pengadaan Lama":
                    sql += " ORDER BY buku.tanggal_pengadaan ASC";
                    break;
            }
        }

        try (
                Connection koneksi = DBConnection.getConnection(); Statement stmt = koneksi.createStatement(); ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                String kodeBuku = rs.getString("kode_buku");
                String kodeKategori = rs.getString("kode_kategori");
                String judul = rs.getString("judul");
                String pengarang = rs.getString("pengarang");
                String penerbit = rs.getString("penerbit");
                int tahun = rs.getInt("tahun_terbit");
                int edisi = rs.getInt("edisi");
                String tanggalPengadaan = rs.getString("tanggal_pengadaan");
                String namaKategori = rs.getString("nama_kategori");

                bukuList.add(new Buku(
                    kodeBuku, kodeKategori, judul, pengarang, penerbit, tahun, edisi, tanggalPengadaan, namaKategori
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return bukuList;
    }
    
    public static String getKodeBukuTerakhir() {
        String kodeTerakhir = null;
        String sql = "SELECT kode_buku FROM buku ORDER BY kode_buku DESC LIMIT 1";

        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            if (rs.next()) {
                kodeTerakhir = rs.getString("kode_buku");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return kodeTerakhir;
    }

//    public static String generateKodeBuku() {
//        String kodeBaru = "B00001";
//
//        String sql = "SELECT kode_buku FROM buku ORDER BY kode_buku DESC LIMIT 1";
//
//        try (Connection koneksi = DBConnection.getConnection();
//             Statement stmt = koneksi.createStatement();
//             ResultSet rs = stmt.executeQuery(sql)) {
//
//            if (rs.next()) {
//                String kodeTerakhir = rs.getString("kode_buku");
//
//                String angka = kodeTerakhir.substring(1);
//                int nomor = Integer.parseInt(angka);
//                nomor++;
//
//                kodeBaru = String.format("B%05d", nomor);
//            }
//
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//
//        return kodeBaru;
//    }
    
    public static void addBuku(Buku buku) {
        String query = "INSERT INTO buku (kode_buku, kode_kategori, judul, pengarang, penerbit, tahun_terbit, edisi, tanggal_pengadaan) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (
            Connection koneksi = DBConnection.getConnection(); PreparedStatement smt = koneksi.prepareStatement(query)) {

            smt.setString(1, buku.getKodeBuku());
            smt.setString(2, buku.getKodeKategori());
            smt.setString(3, buku.getJudul());
            smt.setString(4, buku.getPengarang());
            smt.setString(5, buku.getPenerbit());
            smt.setInt(6, buku.getTahun());
            smt.setInt(7, buku.getEdisi());
            smt.setString(8,buku.getTanggalPengadaan());

            smt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public static void updateBuku(Buku buku) {
        String query = "UPDATE buku SET kode_kategori = ?, judul = ?, pengarang = ?, penerbit = ?, tahun_terbit = ?, edisi = ?, tanggal_pengadaan = ? WHERE kode_buku = ?";
        try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, buku.getKodeKategori());
            stmt.setString(2, buku.getJudul());
            stmt.setString(3, buku.getPengarang());
            stmt.setString(4, buku.getPenerbit());
            stmt.setInt(5, buku.getTahun());
            stmt.setInt(6, buku.getEdisi());
            stmt.setString(7,buku.getTanggalPengadaan());
            stmt.setString(8, buku.getKodeBuku());

            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public static void deleteBuku(String kodeBuku) {
        String query = "DELETE FROM buku WHERE kode_buku = ?";
        try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, kodeBuku);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
