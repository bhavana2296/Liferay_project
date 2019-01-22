<%@include file="../init.jsp"%>

<%
	String mvcPath = ParamUtil.getString(request, "mvcPath");

	ResultRow row = (ResultRow) request.getAttribute(WebKeys.SEARCH_CONTAINER_RESULT_ROW);

	Entry entry = (Entry) row.getObject();
%>

<liferay-ui:icon-menu icon="" message="Operations">

	<portlet:renderURL var="viewURL">
		<portlet:param name="entryId"
			value="<%=String.valueOf(entry.getEntryId())%>" />
		<portlet:param name="mvcPath" value="/guestbookwebportlet/view.jsp" />
	</portlet:renderURL>

	<liferay-ui:icon message="view" image="view" url="<%=viewURL.toString()%>" />
	<portlet:renderURL var="viewEntryURL">
		<portlet:param name="entryId"
			value="<%=String.valueOf(entry.getEntryId())%>" />
		<portlet:param name="mvcPath"
			value="/guestbookwebportlet/view_entry.jsp" />
	</portlet:renderURL>

	<liferay-ui:icon message="Rating & comment" image="post" url="<%=viewEntryURL.toString()%>" />
	<c:if
		test="<%=EntryPermission.contains(permissionChecker, entry.getEntryId(), ActionKeys.UPDATE)%>">
		<portlet:renderURL var="editURL">
			<portlet:param name="entryId"
				value="<%=String.valueOf(entry.getEntryId())%>" />
			<portlet:param name="mvcPath"
				value="/guestbookwebportlet/edit_entry.jsp" />
		</portlet:renderURL>

		<liferay-ui:icon image="edit" message="Edit"
			url="<%=editURL.toString()%>" />
	</c:if>

	<c:if
		test="<%=EntryPermission.contains(permissionChecker, entry.getEntryId(), ActionKeys.PERMISSIONS)%>">

		<liferay-security:permissionsURL
			modelResource="<%=Entry.class.getName()%>"
			modelResourceDescription="<%=entry.getMessage()%>"
			resourcePrimKey="<%=String.valueOf(entry.getEntryId())%>"
			var="permissionsURL" />

		<liferay-ui:icon image="permissions" url="<%=permissionsURL%>" />

	</c:if>

	<c:if
		test="<%=EntryPermission.contains(permissionChecker, entry.getEntryId(), ActionKeys.DELETE)%>">

		<portlet:actionURL name="deleteEntry" var="deleteURL">
			<portlet:param name="entryId"
				value="<%=String.valueOf(entry.getEntryId())%>" />
			<portlet:param name="guestbookId"
				value="<%=String.valueOf(entry.getGuestbookId())%>" />
		</portlet:actionURL>

		<liferay-ui:icon-delete image="delete" url="<%=deleteURL.toString()%>" />
	</c:if>

</liferay-ui:icon-menu>
