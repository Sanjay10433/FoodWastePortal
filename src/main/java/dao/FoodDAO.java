package dao;

import model.Food;
import util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FoodDAO {

	public boolean addFood(Food f) {
		String sql = "INSERT INTO food (donor_id, description, quantity, location) VALUES (?,?,?,?)";
		try (Connection con = DBConnection.getConnection(); PreparedStatement pst = con.prepareStatement(sql)) {
			pst.setInt(1, f.getDonorId());
			pst.setString(2, f.getDescription());
			pst.setString(3, f.getQuantity());
			pst.setString(4, f.getLocation());
			int a = pst.executeUpdate();
			return a == 1;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	public List<Food> getAvailableFood() {
		String sql = "SELECT * FROM food WHERE status='AVAILABLE' ORDER BY posted_at DESC";
		List<Food> list = new ArrayList<>();
		try (Connection con = DBConnection.getConnection();
				PreparedStatement pst = con.prepareStatement(sql);
				ResultSet rs = pst.executeQuery()) {
			while (rs.next()) {
				Food f = new Food();
				f.setId(rs.getInt("id"));
				f.setDonorId(rs.getInt("donor_id"));
				f.setDescription(rs.getString("description"));
				f.setQuantity(rs.getString("quantity"));
				f.setLocation(rs.getString("location"));
				f.setStatus(rs.getString("status"));
				f.setClaimedBy(rs.getInt("claimed_by"));
				f.setPostedAt(rs.getTimestamp("posted_at"));
				list.add(f);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public Food findById(int id) {
		String sql = "SELECT * FROM food WHERE id=?";
		try (Connection con = DBConnection.getConnection(); PreparedStatement pst = con.prepareStatement(sql)) {
			pst.setInt(1, id);
			try (ResultSet rs = pst.executeQuery()) {
				if (rs.next()) {
					Food f = new Food();
					f.setId(rs.getInt("id"));
					f.setDonorId(rs.getInt("donor_id"));
					f.setDescription(rs.getString("description"));
					f.setQuantity(rs.getString("quantity"));
					f.setLocation(rs.getString("location"));
					f.setStatus(rs.getString("status"));
					f.setClaimedBy(rs.getInt("claimed_by"));
					f.setPostedAt(rs.getTimestamp("posted_at"));
					return f;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public boolean claimFood(int foodId, int ngoId) {
		String sql = "UPDATE food SET status='CLAIMED', claimed_by=? WHERE id=? AND status='AVAILABLE'";
		try (Connection con = DBConnection.getConnection(); PreparedStatement pst = con.prepareStatement(sql)) {
			pst.setInt(1, ngoId);
			pst.setInt(2, foodId);
			int a = pst.executeUpdate();
			return a == 1;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
}
