package Model;

import java.sql.Date;

public class QnaReplyDTO {

	/*
	 CREATE TABLE t_qna_reply
(
    rep_seq          NUMBER(12, 0)     NOT NULL, 
    qna_seq          NUMBER(12, 0)     NOT NULL, 
    rep__title       VARCHAR2(200)     NOT NULL, 
    rep__content     VARCHAR2(4000)    NOT NULL, 
    rep__joindate    DATE              DEFAULT SYSDATE NOT NULL, 
    user_id          VARCHAR2(30)      NOT NULL, 
     PRIMARY KEY (rep_seq)
);
	 */
	
	// 응답 순번 
    private Double rep_seq;

    // 질의 순번 
    private Double qna_seq;

    // 응답 제목 
    private String rep__title;

    // 응답 내용 
    private String rep__content;

    // 응답 작성일자 
    private Date rep__joindate;

    // 응답 작성자 
    private String user_id;
    
    
	public QnaReplyDTO(Double rep_seq, Double qna_seq, String rep__title, String rep__content, Date rep__joindate,
			String user_id) {
		super();
		this.rep_seq = rep_seq;
		this.qna_seq = qna_seq;
		this.rep__title = rep__title;
		this.rep__content = rep__content;
		this.rep__joindate = rep__joindate;
		this.user_id = user_id;
	}

	
	public Double getRep_seq() {
		return rep_seq;
	}

	public void setRep_seq(Double rep_seq) {
		this.rep_seq = rep_seq;
	}

	public Double getQna_seq() {
		return qna_seq;
	}

	public void setQna_seq(Double qna_seq) {
		this.qna_seq = qna_seq;
	}

	public String getRep__title() {
		return rep__title;
	}

	public void setRep__title(String rep__title) {
		this.rep__title = rep__title;
	}

	public String getRep__content() {
		return rep__content;
	}

	public void setRep__content(String rep__content) {
		this.rep__content = rep__content;
	}

	public Date getRep__joindate() {
		return rep__joindate;
	}

	public void setRep__joindate(Date rep__joindate) {
		this.rep__joindate = rep__joindate;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

    

}
