<%@include file="../init.jsp"%>
<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="https://cdn.datatables.net/1.10.7/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.7/css/jquery.dataTables.css">

<aui:button-row cssClass="guestbook-admin-buttons">
    <portlet:renderURL var="addGuestbookURL">
        <portlet:param name="mvcPath"  value="/guestbookadminportlet/edit_guestbook.jsp" />
        <portlet:param name="redirect" value="<%= "currentURL" %>" />
    </portlet:renderURL>

    <aui:button onClick="<%= addGuestbookURL.toString() %>" value="Add Guestbook" />
</aui:button-row>

<liferay-ui:search-container total="<%= GuestbookLocalServiceUtil.getGuestbooksCount(scopeGroupId) %>">
    <liferay-ui:search-container-results
        results="<%= GuestbookLocalServiceUtil.getGuestbooks(scopeGroupId, 
            searchContainer.getStart(), searchContainer.getEnd()) %>" />

    <liferay-ui:search-container-row
        className="com.liferay.docs.guestbook.model.Guestbook" modelVar="guestbook">
     
     
        <%
long guestbookId = ParamUtil.getLong(request, "guestbookId");

	ExpandoBridge expandoBridge = ExpandoBridgeFactoryUtil.getExpandoBridge(themeDisplay.getCompanyId(),
			Guestbook.class.getName(), guestbook.getGuestbookId());
	List<String> list = Collections.list(expandoBridge.getAttributeNames());

//	if (list.size() != 0) {
%>
<%-- <liferay-ui:header title="Custom Fields" />
<%
	}
%>
 --%>
 
<%--  <%if(list.size() != 0){ %> --%>
 
<%-- <liferay-ui:header title="Custom Fields"/> --%>
 
<%-- <%} %> --%>
 

<%-- <liferay-ui:custom-attribute-list --%>
<%-- className="<%= Guestbook.class.getName() %>" --%>
<%-- classPK="<%= guestbookId %>" --%>
<%-- editable="<%= false %>" --%>
<%-- label="<%= true %>" --%>
<%-- /> --%>


        <liferay-ui:search-container-column-text property="name" />
        
        <liferay-ui:search-container-column-text property="email" />
        
        <liferay-ui:search-container-column-text property="message" />
       
       
       
       
        
<%--  <liferay-ui:search-container-column-text>  --%>
<%--  <liferay-ui:custom-attributes-available  --%>
<%--  	className="<%=Guestbook.class.getName()%>">  --%>
<%--  	<liferay-ui:custom-attribute-list  --%>
<%--  		classPK="<%=(guestbook != null) ? guestbook.getGuestbookId() : 0%>"  --%>
<%--  		className="<%=Guestbook.class.getName()%>" editable="<%=true%>"  --%>
<%--  		label="<%=true%>" />  --%>
<%--  </liferay-ui:custom-attributes-available>  --%>
        
<%--  </liferay-ui:search-container-column-text>  --%>
         <liferay-ui:search-container-column-jsp 
            align="center" 
            path="/guestbookadminportlet/guestbook_actions.jsp" />

    </liferay-ui:search-container-row>

    <liferay-ui:search-iterator />
</liferay-ui:search-container>




<style>
.message-container{
 padding:10px;
 margin:2px;
 display:none;
 background: rgba(128, 128, 128, 0.33);
 border: 1px solid #0A0A0C;
 }
</style>

<%
List<Guestbook> guestbooks=GuestbookLocalServiceUtil.getGuestbooks(scopeGroupId);
%>
<c:if test="<%=guestbooks!=null&&!guestbooks.isEmpty() %>">
<table id="userTable" class="display" cellspacing="0" width="100%">
        <thead>
            <tr>
                <th>Name</th>
                <th>Email</th>
                <th>Message</th>
                 </tr>
        </thead>
        <tfoot>
            <tr>
                <th>Name</th>
                <th>Email</th>
                <th>message</th>
            </tr>
        </tfoot>
        <tbody>
        <%for(Guestbook curGuestbook:guestbooks){ %>
            <tr>
                <td><%=curGuestbook.getName()%></td>
                 <td><%=curGuestbook.getEmail()%></td>
                 <td><%=curGuestbook.getMessage()%></td>
                  </tr>
          <%} %>
        </tbody>
    </table>
 <script>
 $(document).ready(function() {
                $('#userTable').DataTable();
            } );
 </script>
 </c:if>