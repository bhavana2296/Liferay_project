<%@include file="../init.jsp"%>

<%
	long entryId = ParamUtil.getLong(renderRequest, "entryId");

	Entry entry = null;
	if (entryId > 0) {
		entry = EntryLocalServiceUtil.getEntry(entryId);
	}

	long guestbookId = ParamUtil.getLong(renderRequest, "guestbookId");
%>

<portlet:renderURL var="viewURL">

	<portlet:param name="mvcPath" value="/guestbookwebportlet/view.jsp"></portlet:param>

</portlet:renderURL>

<portlet:actionURL name="addEntry" var="addEntryURL"></portlet:actionURL>

<aui:form action="<%=addEntryURL%>" name="<portlet:namespace />fm">

	<aui:model-context bean="<%=entry%>" model="<%=Entry.class%>" />

	<aui:fieldset>

		<aui:input name="name" type="text" placeholder="Enter name" />
		<%--         <aui:validator name="required" errorMessage="please enter your name"></aui:validator></aui:input> --%>
		<aui:input name="email" type="text" placeholder="Email" />
		<%--         <aui:validator name="required" errorMessage="field is empty"/> --%>
		<%--             </aui:input> --%>
		<aui:input name="message" type="text" placeholder="write your message" />
		<%--         <aui:validator name="required" errorMessage="Enter message"></aui:validator></aui:input> --%>

		<aui:input name="entryId" type="hidden" />
		<aui:input name="guestbookId" type="hidden"
			value='<%=entry == null ? guestbookId : entry.getGuestbookId()%>' />

	</aui:fieldset>
	
	
	
	
	
	
	
	<liferay-ui:asset-categories-error />
	<liferay-ui:asset-tags-error />
	<liferay-ui:panel defaultState="closed" extended="<%=false%>"
		id="entryCategorizationPanel" persistState="<%=true%>"
		title="categorization">
		<aui:fieldset>
			<aui:input name="categories" type="assetCategories" />

			<aui:input name="tags" type="assetTags" />
		</aui:fieldset>
	</liferay-ui:panel>

	<liferay-ui:panel defaultState="closed" extended="<%=false%>"
		id="entryAssetLinksPanel" persistState="<%=true%>"
		title="related-assets">
		<aui:fieldset>
			<liferay-ui:input-asset-links className="<%=Entry.class.getName()%>"
				classPK="<%=entryId%>" />
		</aui:fieldset>
	</liferay-ui:panel>

	<aui:button-row>

		<aui:button type="submit"></aui:button>
		<aui:button type="cancel" onClick="<%= viewURL.toString() %>"></aui:button>

	</aui:button-row>
</aui:form>
