package Model;

import java.sql.Date;

public class QnaDTO {
	
	/*
	 CREATE TABLE t_qna
(
    qna_seq         NUMBER(12, 0)     NOT NULL, 
    qna_title       VARCHAR2(200)     NOT NULL, 
    qna_content     VARCHAR2(4000)    NOT NULL, 
    qna_file        VARCHAR2(200)     NOT NULL, 
    qna_joindate    DATE              DEFAULT SYSDATE NOT NULL, 
    qna_id          VARCHAR2(30)      NOT NULL, 
    qna_cnt         NUMBER(12, 0)     DEFAULT 0 NOT NULL, 
     PRIMARY KEY (qna_seq)
);
	 */

	 // 질의 순번 
    private Double qna_seq;

    // 질의 제목 
    private String qna_title;

    // 질의 내용 
    private String qna_content;

    // 질의 첨부파일 
    private String qna_file;

    // 질의 작성일자 
    private Date qna_joindate;

    // 질의 작성자 
    private String qna_id;

    // 질의 조회수 
    private Double qna_cnt;

    
	public QnaDTO(Double qna_seq, String qna_title, String qna_content, String qna_file, Date qna_joindate,
			String qna_id, Double qna_cnt) {
		super();
		this.qna_seq = qna_seq;
		this.qna_title = qna_title;
		this.qna_content = qna_content;
		this.qna_file = qna_file;
		this.qna_joindate = qna_joindate;
		this.qna_id = qna_id;
		this.qna_cnt = qna_cnt;
	}

	
	public Double getQna_seq() {
		return qna_seq;
	}

	public void setQna_seq(Double qna_seq) {
		this.qna_seq = qna_seq;
	}

	public String getQna_title() {
		return qna_title;
	}

	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}

	public String getQna_content() {
		return qna_content;
	}

	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}

	public String getQna_file() {
		return qna_file;
	}

	public void setQna_file(String qna_file) {
		this.qna_file = qna_file;
	}

	public Date getQna_joindate() {
		return qna_joindate;
	}

	public void setQna_joindate(Date qna_joindate) {
		this.qna_joindate = qna_joindate;
	}

	public String getQna_id() {
		return qna_id;
	}

	public void setQna_id(String qna_id) {
		this.qna_id = qna_id;
	}

	public Double getQna_cnt() {
		return qna_cnt;
	}

	public void setQna_cnt(Double qna_cnt) {
		this.qna_cnt = qna_cnt;
	}
    
    


}
