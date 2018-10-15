package org.zerock.domain;

public class Criteria {

	private int page;
	private int perPageNum;
	private int startPage;
	

	public Criteria() {
		this.page = 1;
		this.perPageNum = 10;
	}

	public void setPage(int page) {
		if (page <= 0) {
			this.perPageNum = 1;
			return;
		}
		
		
		this.page = page;
		
		startPage = getPageStart();
	}

	public int getPage() {
		return page;
	}

	public void setPerPageNum(int perPageNum) {
		if (perPageNum <= 0 || perPageNum > 100) {
			this.perPageNum = 10;
			return;
		}
		this.perPageNum = perPageNum;
	}

	// Method for mybatis SQL mapper
	public int getPerPageNum() {
		return this.perPageNum;
	}

	// Method for mybatis SQL mapper
	public int getPageStart() {
		return (this.page - 1) * perPageNum;
	}

	@Override
	public String toString() {
		return "Critera [page=" + page+ ", " + "perPageNum=" + perPageNum + "]";
	}
}
