package com.bpm.process.action;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.afunms.common.base.JspPage;
import com.bpm.process.service.ProcessService;
import com.opensymphony.xwork2.ActionSupport;

@Controller
@Scope("prototype")
public class ProcessStatisticalsDetailAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = -8044134931883095043L;
	@Resource
	private ProcessService processService;
	private String type;// ���뷽ʽ (�����ʵ����ʽ)��0����1ʵ��
	private String person;// ���ź���Ա��ʽ��0��Ա��1��λ
	private String startdate;
	private String todate;
	private String exectname;
	private String perpagenum = "";// ÿҳ��Ҫ��ʾ�ļ�¼��
	private JspPage jsppage = new JspPage();// ��ҳ��ѯ
	private String jp = ""; // ��ǰҳ

	@Override
	public String execute() throws Exception {
		jsppage.setCurrentPage(jp);// ���õ�ǰҳ�����
		jsppage.setPerPage(perpagenum);// ����ÿҳ��Ҫ��ȡ�ļ�¼��
		jsppage = processService.queryProcessStatisticalsDetail(exectname, type, person, startdate, todate, jsppage.getCurrentPage(), jsppage.getPerPage());
		return SUCCESS;
	}

	public String getExectname() {
		return exectname;
	}

	public String getJp() {
		return jp;
	}

	public JspPage getJsppage() {
		return jsppage;
	}

	public String getPerpagenum() {
		return perpagenum;
	}

	public String getPerson() {
		return person;
	}

	public String getStartdate() {
		return startdate;
	}

	public String getTodate() {
		return todate;
	}

	public String getType() {
		return type;
	}

	public void setExectname(String exectname) {
		this.exectname = exectname;
	}

	public void setJp(String jp) {
		this.jp = jp;
	}

	public void setJsppage(JspPage jsppage) {
		this.jsppage = jsppage;
	}

	public void setPerpagenum(String perpagenum) {
		this.perpagenum = perpagenum;
	}

	public void setPerson(String person) {
		this.person = person;
	}

	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}

	public void setTodate(String todate) {
		this.todate = todate;
	}

	public void setType(String type) {
		this.type = type;
	}

}