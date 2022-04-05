package Model;

import java.sql.Date;

public class MediDTO {
	
	/*
	 CREATE TABLE t_medicine
(
    h_seq           NUMBER(12, 0)    NOT NULL, 
    med_num         VARCHAR2(50)     NULL, 
    med_name        VARCHAR2(50)     NULL, 
    med_hosp        VARCHAR2(50)     NULL, 
    med_way         VARCHAR2(50)     NULL, 
    med_date        DATE             NULL, 
    med_exp_date    DATE             NULL, 
    med_visit       DATE             NULL, 
    med_alarm       VARCHAR2(30)     NULL, 
     PRIMARY KEY (h_seq)
); 
	 */
	
	// 장애인 순번 
    private Double h_seq;

    // 보관함번호 
    private String med_num;

    // 약이름 
    private String med_name;

    // 처방의료기관 
    private String med_hosp;

    // 복용법 
    private String med_way;

    // 처방일자 
    private Date med_date;

    // 약 유통기한 
    private Date med_exp_date;

    // 병원재방문일자 
    private Date med_visit;

    // 복용시간알람 
    private String med_alarm;
    

	public MediDTO(Double h_seq, String med_num, String med_name, String med_hosp, String med_way, Date med_date,
			Date med_exp_date, Date med_visit, String med_alarm) {
		super();
		this.h_seq = h_seq;
		this.med_num = med_num;
		this.med_name = med_name;
		this.med_hosp = med_hosp;
		this.med_way = med_way;
		this.med_date = med_date;
		this.med_exp_date = med_exp_date;
		this.med_visit = med_visit;
		this.med_alarm = med_alarm;
	}

	
	public Double getH_seq() {
		return h_seq;
	}

	public void setH_seq(Double h_seq) {
		this.h_seq = h_seq;
	}

	public String getMed_num() {
		return med_num;
	}

	public void setMed_num(String med_num) {
		this.med_num = med_num;
	}

	public String getMed_name() {
		return med_name;
	}

	public void setMed_name(String med_name) {
		this.med_name = med_name;
	}

	public String getMed_hosp() {
		return med_hosp;
	}

	public void setMed_hosp(String med_hosp) {
		this.med_hosp = med_hosp;
	}

	public String getMed_way() {
		return med_way;
	}

	public void setMed_way(String med_way) {
		this.med_way = med_way;
	}

	public Date getMed_date() {
		return med_date;
	}

	public void setMed_date(Date med_date) {
		this.med_date = med_date;
	}

	public Date getMed_exp_date() {
		return med_exp_date;
	}

	public void setMed_exp_date(Date med_exp_date) {
		this.med_exp_date = med_exp_date;
	}

	public Date getMed_visit() {
		return med_visit;
	}

	public void setMed_visit(Date med_visit) {
		this.med_visit = med_visit;
	}

	public String getMed_alarm() {
		return med_alarm;
	}

	public void setMed_alarm(String med_alarm) {
		this.med_alarm = med_alarm;
	}
    
    

	

}
