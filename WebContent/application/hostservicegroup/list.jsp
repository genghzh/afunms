<%@page language="java" contentType="text/html;charset=GB2312"%>
<%@page import="com.afunms.application.model.HostServiceGroup"%>
<%@page import="java.util.List"%>

<%
    String rootPath = request.getContextPath();
    List list = (List) request.getAttribute("list");
    String ipaddress = (String) request.getAttribute("ipaddress");
    String nodeid = (String) request.getAttribute("nodeid");
%>


<html>
	<head>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<link
			href="<%=rootPath%>/resource/<%=com.afunms.common.util.CommonAppUtil.getSkinPath()%>css/global/global.css"
			rel="stylesheet" type="text/css" />
		<script language="JavaScript" type="text/javascript"
			src="<%=rootPath%>/include/navbar.js"></script>
		<script type="text/javascript" src="<%=rootPath%>/resource/js/page.js"></script>
		<script type="text/javascript">
		 	
			var show = true;
			var hide = false;
			//修改菜单的上下箭头符号
			function my_on(head,body)
			{
				var tag_a;
				for(var i=0;i<head.childNodes.length;i++)
				{
					if (head.childNodes[i].nodeName=="A")
					{
						tag_a=head.childNodes[i];
						break;
					}
				}
				tag_a.className="on";
			}
			function my_off(head,body)
			{
				var tag_a;
				for(var i=0;i<head.childNodes.length;i++)
				{
					if (head.childNodes[i].nodeName=="A")
					{
						tag_a=head.childNodes[i];
						break;
					}
				}
				tag_a.className="off";
			}
			//添加菜单	
			function initmenu()
			{
				var idpattern=new RegExp("^menu");
				var menupattern=new RegExp("child$");
				var tds = document.getElementsByTagName("div");
				for(var i=0,j=tds.length;i<j;i++){
					var td = tds[i];
					if(idpattern.test(td.id)&&!menupattern.test(td.id)){					
						menu =new Menu(td.id,td.id+"child",'dtu','100',show,my_on,my_off);
						menu.init();		
					}
				}
			
			}
		</script>
		<script language="javascript">
			var delAction = "<%=rootPath%>/hostservicegroup.do?action=delete";
		  	var listAction = "<%=rootPath%>/hostservicegroup.do?action=list";
		  
		  	function toAdd()
		  	{
		    	mainForm.action = "<%=rootPath%>/hostservicegroup.do?action=ready_add";
		    	mainForm.submit();
		  	}
		  	
		  	function toDelete(){
                 if(confirm('是否确定删除这条记录?')) {
                   mainForm.action = "<%=rootPath%>/hostservicegroup.do?action=delete";
                   mainForm.submit();
                   }
              }
		  
		  	function detail(id)
		  	{
				mainForm.action = "<%=rootPath%>/hostservicegroup.do?action=tomcat_jvm&id="+id;
				mainForm.submit();
		  	}
		  	
		  	function edit(id)
		  	{
				mainForm.action = "<%=rootPath%>/hostservicegroup.do?action=ready_edit&groupId="+id;
				mainForm.submit();
		  	}
		  
		</script>
		<script type="text/javascript" src="<%=rootPath%>/topology/network/js/wincloseoverride.js"></script>
		<style>
<!--
body {
background-image: url(${pageContext.request.contextPath}/resource/image/bg.jpg);
TEXT-ALIGN: center;
}
-->
</style>
	</head>
	<body id="body" class="body" onload="initmenu();">
		<form id="mainForm" method="post" name="mainForm">
			<table>
				<tr>
					<td class="td-container-main" style="border: none;">
						<table>
							<tr>
								<td>
									<table>
										<tr>
											<td>
												<table id="content-header" class="content-header">
													<tr>
														<td align="left" width="5">
															<img src="<%=rootPath%>/common/images/right_t_01.jpg"
																width="5" height="29" />
														</td>
														<td class="content-title">
															应用 >> 主机服务组管理 >> 服务组列表
														</td>
														<td align="right">
															<img src="<%=rootPath%>/common/images/right_t_03.jpg"
																width="5" height="29" />
														</td>
													</tr>
												</table>
											</td>
										</tr>
										<tr>
											<td>
												<table id="content-body" class="content-body">
													<tr>
														<td align="center" class="body-data-title"
															style="text-align: left;">
															IP地址：
															<input type="text" name="ipaddress" id="ipaddress"
																value="<%=ipaddress%>">
															<input type="hidden" name="nodeid" id="nodeid"
																value="<%=nodeid%>">
														</td>
														<td align="center" class="body-data-title"
															style="text-align: right;">
															<a href="#" onclick="toAdd();return false;">添加</a>
															<a href="#" onclick="toDelete();return false;">删除</a>&nbsp;&nbsp;&nbsp;
														</td>
													</tr>
													<tr>
														<td colspan="2">
															<table>
																<tr>
																	<td align="center" class="body-data-title">
																		<INPUT type="checkbox" id="checkall" name="checkall"
																			onclick="javascript:chkall()">
																		序号
																	</td>
																	<td align="center" class="body-data-title">
																		IP地址
																	</td>
																	<td align="center" class="body-data-title">
																		进程组名称
																	</td>
																	<td align="center" class="body-data-title">
																		告警等级
																	</td>
																	<td align="center" class="body-data-title">
																		监控状态
																	</td>
																</tr>
																<%
																    if (list != null && list.size() > 0) {
																        for (int i = 0; i < list.size(); i++) {
																            HostServiceGroup hostServiceGroup = (HostServiceGroup) list.get(i);

																            String alarmlevel = hostServiceGroup.getAlarm_level();

																            String monflag = hostServiceGroup.getMon_flag();

																            if ("1".equals(alarmlevel)) {
																                alarmlevel = "普通告警";
																            } else if ("2".equals(alarmlevel)) {
																                alarmlevel = "严重告警";
																            } else if ("3".equals(alarmlevel)) {
																                alarmlevel = "紧急告警";
																            }
																            String monflag_str = "否";
																            if ("1".equals(monflag)) {
																                monflag_str = "是";
																            }
																%>
																<tr>
																	<td align="center" class="body-data-list">
																		<INPUT type="checkbox"
																			value="<%=hostServiceGroup.getId()%>" name="checkbox"
																			id="checkbox"><%=i + 1%></td>
																	<td align="center" class="body-data-list"><%=hostServiceGroup.getIpaddress()%></td>
																	<td align="center" class="body-data-list">
																		<a href="#"
																			onclick='edit("<%=hostServiceGroup.getId()%>")'><%=hostServiceGroup.getName()%></a>
																	</td>
																	<td align="center" class="body-data-list"><%=alarmlevel%></td>
																	<td align="center" class="body-data-list"><%=monflag_str%></td>
																</tr>

																<%
																    }
																    }
																%>
															</table>
														</td>
													</tr>
													<tr>
														<td align=center colspan=6>
															<br>
															<input type="reset" style="width: 50" value="关 闭"
																onclick="javascript:window.close()">
															&nbsp;&nbsp;
														</td>

													</tr>
												</table>
											</td>
										</tr>
										<tr>
											<td>
												<table id="content-footer" class="content-footer">
													<tr>
														<td>
															<table width="100%" border="0" cellspacing="0"
																cellpadding="0">
																<tr>
																	<td align="left" valign="bottom">
																		<img src="<%=rootPath%>/common/images/right_b_01.jpg"
																			width="5" height="12" />
																	</td>
																	<td></td>
																	<td align="right" valign="bottom">
																		<img src="<%=rootPath%>/common/images/right_b_03.jpg"
																			width="5" height="12" />
																	</td>
																</tr>
															</table>
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
