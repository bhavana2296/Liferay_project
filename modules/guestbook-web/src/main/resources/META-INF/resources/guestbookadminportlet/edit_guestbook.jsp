<%@include file = "../init.jsp" %>

<%
        long guestbookId = ParamUtil.getLong(request, "guestbookId");

        Guestbook guestbook = null;

        if (guestbookId > 0) {
                guestbook = GuestbookLocalServiceUtil.getGuestbook(guestbookId);
                

                ExpandoBridge expandoBridge = ExpandoBridgeFactoryUtil.getExpandoBridge(themeDisplay.getCompanyId(), Guestbook.class.getName(),guestbook.getGuestbookId());
                List<String> attributeList = Collections.list(expandoBridge.getAttributeNames());
        
                
                }
        else{        
        ExpandoBridge expandoBridge = ExpandoBridgeFactoryUtil.getExpandoBridge(themeDisplay.getCompanyId(), Guestbook.class.getName());
        List<String> attributeList = Collections.list(expandoBridge.getAttributeNames());
        }
%>

<portlet:renderURL var="viewURL">
        <portlet:param name="mvcPath" value="/guestbookadminportlet/view.jsp" />
</portlet:renderURL>

<portlet:actionURL name='<%= guestbook == null ? "addGuestbook" : "updateGuestbook" %>' var="editGuestbookURL" />

<aui:form action="<%= editGuestbookURL %>" name="fm">

        <aui:model-context bean="<%= guestbook %>" model="<%= Guestbook.class %>" />

        <aui:input type="hidden" name="guestbookId"
            value='<%= guestbook == null ? "" : guestbook.getGuestbookId() %>' />

        <aui:fieldset>
             <aui:input name="name" type="text">

             </aui:input>
             
             <aui:input name="email" type="text">
                          </aui:input>
             
			<aui:input name="message" type="text">

			</aui:input>
		        </aui:fieldset>


<%-- 	 <%if(attributeList.size() != 0){ %> --%>
 
<%-- <liferay-ui:header title="Custom Fields"/> --%>
 
<%-- <%} %> --%>
 	        
		        
<%-- <liferay-ui:panel defaultState="closed" extended="<%=false%>" --%>
<%-- 		id="guestbookCustomfield" persistState="<%=true%>" --%>
<%-- 		title="Custom field"> --%>
				        
<%-- <liferay-ui:custom-attributes-available className="<%=Guestbook.class.getName() %>"> --%>
<%-- <liferay-ui:custom-attribute-list --%>
<%-- className="<%= Guestbook.class.getName() %>" --%>
<%-- classPK="<%= (guestbook != null) ? guestbook.getGuestbookId() : 0%>" --%>
<%-- editable="<%= false %>" --%>
<%-- label="<%= true %>" --%>
<%-- /> --%>
<%-- </liferay-ui:custom-attributes-available> --%>
<%-- </liferay-ui:panel> --%>
		 

<%--  <%if(attributeList.size() != 0){ %>  --%>
 
<%--  <liferay-ui:header title="Custom Fields"/>  --%>
 
<%--  <%} %>  --%>
 
 <liferay-ui:panel defaultState="closed" extended="<%=false%>" 
 		id="guestbookCustomfield" persistState="<%=true%>" 
 		title="Custom field"> 

  
	
 
 <liferay-ui:custom-attributes-available className="<%=Guestbook.class.getName() %>"> 
 <liferay-ui:custom-attribute-list 
 className="<%= Guestbook.class.getName() %>"
 classPK="<%= (guestbook != null) ? guestbook.getGuestbookId() : 0 %>" 
 editable="<%= true %>" 
 label="<%= true %>" 
 /> 
 </liferay-ui:custom-attributes-available> 

</liferay-ui:panel>

        <aui:button-row>
             <aui:button type="submit" />
             <aui:button onClick="<%= viewURL.toString() %>" type="cancel"  />
        </aui:button-row>
</aui:form>

