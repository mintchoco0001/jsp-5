package product;

public class ProductDTO {

	private String productId;
	private String pname;
	private int unitPrice;
	private String description;
	private String category;//카테고리
	private String manufacturer;//제조사
	private int unitsInStock;//상품 재고 수
	private String condition;//상품상태
	private String filename;//그림파일명

	public ProductDTO() {
		super();
	}

	public ProductDTO(String productId, String pname, int unitPrice) {
		super();
		this.productId = productId;
		this.pname = pname;
		this.unitPrice = unitPrice;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public int getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(int unitPrice) {
		this.unitPrice = unitPrice;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getManuFacturer() {
		return manufacturer;
	}

	public void setManuFacturer(String manuFacturer) {
		this.manufacturer = manuFacturer;
	}

	public int getUnitsInStock() {
		return unitsInStock;
	}

	public void setUnitsInStock(int unitsInStock) {
		this.unitsInStock = unitsInStock;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}
	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}


}
