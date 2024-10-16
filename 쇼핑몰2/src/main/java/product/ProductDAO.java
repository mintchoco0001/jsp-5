package product;

import java.util.ArrayList;

import common.JDBConnect;

public class ProductDAO extends JDBConnect {

	private ArrayList<ProductDTO> listOfProducts = new ArrayList<ProductDTO>();

	public ProductDAO() {
		String sql = "select * from product";

		try {
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();

			while (rs.next()) {
				ProductDTO dto = new ProductDTO();
				dto.setProductId(rs.getString(1));
				dto.setPname(rs.getString(2));
				dto.setUnitPrice(rs.getInt(3));
				dto.setDescription(rs.getString(4));
				dto.setCategory(rs.getString(5));
				dto.setManuFacturer(rs.getString(6));
				dto.setUnitsInStock(rs.getInt(7));
				dto.setCondition(rs.getString(8));
				dto.setFilename(rs.getString(9));
				listOfProducts.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("상품정보 가져오기 오류");
		}

	}

	public ArrayList<ProductDTO> getAllProducts() {
		return listOfProducts;
	}

	public ProductDTO getProductById(String id) {
		ProductDTO dto = new ProductDTO();
		String sql = "select * from product where p_id=?";

		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();

			while (rs.next()) {
				dto.setProductId(rs.getString(1));
				dto.setPname(rs.getString(2));
				dto.setUnitPrice(rs.getInt(3));
				dto.setDescription(rs.getString(4));
				dto.setCategory(rs.getString(5));
				dto.setManuFacturer(rs.getString(6));
				dto.setUnitsInStock(rs.getInt(7));
				dto.setCondition(rs.getString(8));
				dto.setFilename(rs.getString(9));
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("상품 상세정보 불러오기 실패");
		}
		return dto;
	}

	public int addProduct(String productId, String productName, int unitPrice, String description, String category,
			String manufacturer, int unitsInStock, String condition, String filename) {
		int result = 0;
		String sql = "insert into product values (?, ?, ?, ?, ?, ?, ?, ?, ?)";

		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, productId);
			psmt.setString(2, productName);
			psmt.setInt(3, unitPrice);
			psmt.setString(4, description);
			psmt.setString(5, category);
			psmt.setString(6, manufacturer);
			psmt.setInt(7, unitsInStock);
			psmt.setString(8, condition);
			psmt.setString(9, filename);
			result = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("상품 추가 실패");
		}
		return result;
	}

}
