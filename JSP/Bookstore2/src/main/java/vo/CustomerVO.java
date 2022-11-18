package vo;

public class CustomerVO {
	private int custId;
	private String custName;
	private String custAddr;
	private String custHp;
	
	public int getCustId() {
		return custId;
	}
	public void setCustId(int custId) {
		this.custId = custId;
	}
	public void setCustId(String custId) {
		this.custId = Integer.parseInt(custId);
	}
	public String getCustName() {
		return custName;
	}
	public void setCustName(String custName) {
		this.custName = custName;
	}
	public String getCustAddr() {
		return custAddr;
	}
	public void setCustAddr(String custAddr) {
		this.custAddr = custAddr;
	}
	public String getCustHp() {
		return custHp;
	}
	public void setCustHp(String custHp) {
		this.custHp = custHp;
	}
	
}
