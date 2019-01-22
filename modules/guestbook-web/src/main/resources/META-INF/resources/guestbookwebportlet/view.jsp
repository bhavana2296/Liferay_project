<%@page import="com.liferay.portal.kernel.security.permission.ResourceActionsUtil"%>
<%@page import="java.util.stream.Collectors"%>
<%@page import="java.util.Comparator"%>
<%@page import="java.util.Collections"%>
<%@page import="com.liferay.portal.kernel.util.PortletKeys"%>
<%@page import="com.liferay.portal.kernel.model.UserConstants"%>
<%@page import="com.liferay.portal.kernel.language.LanguageUtil"%>
<%@page import="com.liferay.portal.kernel.model.User"%>
<%@page import="com.liferay.portal.kernel.service.UserLocalServiceUtil"%>
<%@page import="java.util.Objects"%>
<%@page import="com.liferay.portal.kernel.portlet.PortletURLUtil"%>
<%@page import="javax.portlet.PortletURL"%>
<%@include file="../init.jsp"%>
<portlet:resourceURL var="addResourceURL">
	<portlet:param name="mvcPath" value="/guestbookwebportlet/view.jsp" />
</portlet:resourceURL>

<%
String modelResource = ParamUtil.getString(request, "modelResource");
String modelResourceName = ResourceActionsUtil.getModelResource(request, modelResource);

ExpandoBridge expandoBridge = ExpandoBridgeFactoryUtil.getExpandoBridge(company.getCompanyId(), modelResource);

List<String> attributeNames = Collections.list(expandoBridge.getAttributeNames());





	String entriesNavigation = ParamUtil.getString(request, "entriesNavigation");
	long guestbookId = Long.valueOf((Long) renderRequest.getAttribute("guestbookId"));
	String displayStyle = ParamUtil.getString(request, "displayStyle", "list");
	String orderByCol = ParamUtil.getString(request, "orderByCol", "name");
	String orderByType = ParamUtil.getString(request, "orderByType", "asc");
	PortletURL navigationPortletURL = renderResponse.createRenderURL();

	PortletURL sortURL = PortletURLUtil.clone(navigationPortletURL, liferayPortletResponse);

	navigationPortletURL.setParameter("orderBycol", orderByCol);
	navigationPortletURL.setParameter("orderByType", orderByType);

	PortletURL portletURL = PortletURLUtil.clone(navigationPortletURL, liferayPortletResponse);

	PortletURL displayStyleURL = PortletURLUtil.clone(portletURL, liferayPortletResponse);
	boolean orderByAsc = false;

	if (orderByType.equals("asc")) {
		orderByAsc = true;
	}

	OrderByComparator orderByComparator = null;

	if (orderByCol.equals("name")) {
		orderByComparator = new EntryNameComparator(orderByAsc);
	}
%>

<liferay-frontend:management-bar includeCheckBox="<%=true%>"
	searchContainerId="GuestbookEntries">
	<liferay-frontend:management-bar-buttons>
		<liferay-frontend:management-bar-display-buttons
			displayViews='<%=new String[] { "icon", "descriptive", "list" }%>'
			portletURL="<%=displayStyleURL%>"
			selectedDisplayStyle="<%=displayStyle%>" />
	</liferay-frontend:management-bar-buttons>

	<liferay-frontend:management-bar-filters>
		<liferay-frontend:management-bar-navigation
			navigationKeys='<%=new String[] { "all", "Recent by Create", "Recent by Modify" }%>'
			navigationParam="entriesNavigation"
			portletURL="<%=navigationPortletURL%>" />

		<liferay-frontend:management-bar-sort orderByCol="<%=orderByCol%>"
			orderByType="<%=orderByType%>"
			orderColumns='<%=new String[] { "name" }%>' portletURL="<%=sortURL%>" />

		<%-- 	 <liferay-frontend:management-bar-action-buttons>
		<liferay-frontend:management-bar-button href='<%= "javascript:" + renderResponse.getNamespace() + "deleteEntries();" %>' icon='<%= trashHelper.isTrashEnabled(scopeGroupId) ? "trash" : "times" %>' label='<%= trashHelper.isTrashEnabled(scopeGroupId) ? "recycle-bin" : "delete" %>' />
	</liferay-frontend:management-bar-action-buttons> --%>
	</liferay-frontend:management-bar-filters>
</liferay-frontend:management-bar>

<liferay-portlet:renderURL varImpl="searchURL">
	<portlet:param name="mvcPath"
		value="/guestbookwebportlet/view_search.jsp" />
</liferay-portlet:renderURL>

<aui:form action="<%=searchURL%>" method="get" name="fm">
	<liferay-portlet:renderURLParams varImpl="searchURL" />

	<div class="search-form">
		<span class="aui-search-bar"> <aui:input
				inlineField="<%=true%>" placeholder="search" label=""
				name="keywords" size="30" title="search-entries" type="text" /> <aui:button
				type="submit" value="search" />
		</span>
	</div>
</aui:form>
<aui:nav cssClass="nav-tabs">

	<%
		List<Guestbook> guestbooks = GuestbookLocalServiceUtil.getGuestbooks(scopeGroupId);

			for (int i = 0; i < guestbooks.size(); i++) {

				Guestbook curGuestbook = (Guestbook) guestbooks.get(i);
				String cssClass = StringPool.BLANK;

				if (curGuestbook.getGuestbookId() == guestbookId) {
					cssClass = "active";
				}

				if (GuestbookPermission.contains(permissionChecker, curGuestbook.getGuestbookId(), "VIEW")) {
	%>

	<portlet:renderURL var="viewPageURL">
		<portlet:param name="mvcPath" value="/guestbookwebportlet/view.jsp" />
		<portlet:param name="guestbookId"
			value="<%=String.valueOf(curGuestbook.getGuestbookId())%>" />
		<portlet:param name="displayStyle" value="<%=displayStyle%>" />

	</portlet:renderURL>


	<aui:nav-item cssClass="<%=cssClass%>" href="<%=viewPageURL%>"
		label="<%=HtmlUtil.escape(curGuestbook.getName())%>" />

	<%
		}

			}
	%>

</aui:nav>

<aui:button-row cssClass="guestbook-buttons">

	<c:if
		test='<%=GuestbookPermission.contains(permissionChecker, guestbookId, "ADD_ENTRY")%>'>
		<portlet:renderURL var="addEntryURL">
			<portlet:param name="mvcPath"
				value="/guestbookwebportlet/edit_entry.jsp" />
			<portlet:param name="guestbookId"
				value="<%=String.valueOf(guestbookId)%>" />
		</portlet:renderURL>

		<aui:button onClick="<%=addEntryURL.toString()%>" value="Add Entry"></aui:button>
	</c:if>
</aui:button-row>

<liferay-ui:search-container
	total="<%=EntryLocalServiceUtil.getEntriesCount()%>">
	<liferay-ui:search-container-results
		results="<%=EntryLocalServiceUtil.getEntries(scopeGroupId.longValue(), guestbookId,
			searchContainer.getStart(), searchContainer.getEnd(), orderByComparator)%>" />

	<liferay-ui:search-container-row
		className="com.liferay.docs.guestbook.model.Entry" modelVar="entry">
		<%
			User userDisplay = UserLocalServiceUtil.fetchUserById(entry.getUserId());
					String content = entry.getMessage();
		%>

		<c:choose>
			<c:when test='<%=Objects.equals(displayStyle, "icon")%>'>
				<%
					row.setCssClass("entry-card lfr-asset-item");
				%>

				<liferay-ui:search-container-column-text>
					<liferay-frontend:vertical-card cssClass="entry-display-style"
						imageUrl="<%=(userDisplay != null) ? userDisplay.getPortraitURL(themeDisplay)
											: UserConstants.getPortraitURL(themeDisplay.getPathImage(), true, 0, null)%>"
						resultRow="<%=row%>">
						<liferay-frontend:vertical-card-header>
							<liferay-ui:message
								arguments="<%=new String[] {
														LanguageUtil.getTimeDescription(locale,
																System.currentTimeMillis()
																		- entry.getModifiedDate().getTime(),
																true),
														HtmlUtil.escape(entry.getUserName()) }%>"
								key="x-ago-by-x" translateArguments="<%=false%>" />
						</liferay-frontend:vertical-card-header>

						<liferay-frontend:vertical-card-footer>
							<%=HtmlUtil.extractText(content)%>
						</liferay-frontend:vertical-card-footer>
					</liferay-frontend:vertical-card>
				</liferay-ui:search-container-column-text>
			</c:when>
			<c:when test='<%=Objects.equals(displayStyle, "descriptive")%>'>
				<liferay-ui:search-container-column-text>
					<liferay-ui:search-container-column-icon icon="user" />
				</liferay-ui:search-container-column-text>
				<liferay-ui:search-container-column-text colspan="<%=2%>">
					<h5 class="">
						Name:
						<%=HtmlUtil.extractText(content)%>
						Message :
						<%=entry.getMessage()%>
						Email :
						<%=entry.getEmail()%>
					</h5>
					<h6 class="">
						<strong><liferay-ui:message key="last-updated" />:</strong>

						<liferay-ui:message
							arguments="<%=new String[] {
										LanguageUtil.getTimeDescription(locale,
												System.currentTimeMillis() - entry.getModifiedDate().getTime(), true),
										HtmlUtil.escape(entry.getUserName()) }%>"
							key="x-ago-by-x" translateArguments="<%=false%>" />
					</h6>
				</liferay-ui:search-container-column-text>
				<liferay-ui:search-container-column-jsp
					path="/guestbookwebportlet/entry_actions.jsp" />
				
			</c:when>
			<c:otherwise>
				<liferay-ui:search-container-column-text property="name" />

				<liferay-ui:search-container-column-text property="email" />

				<liferay-ui:search-container-column-text property="message" />
			
				
				<liferay-ui:search-container-column-jsp
					path="/guestbookwebportlet/entry_actions.jsp" align="center" />
			</c:otherwise>
		</c:choose>

	</liferay-ui:search-container-row>

	<liferay-ui:search-iterator displayStyle="<%=displayStyle%>"
		markupView="lexicon" />

</liferay-ui:search-container>

<liferay-ddm:template-renderer
	className="<%= Guestbook.class.getName() %>"
	contextObjects="<%= new HashMap<String, Object>() %>"
	displayStyle="<%= displayStyle1 %>"
	displayStyleGroupId="<%= displayStyleGroupId %>"
	entries="${guestbooks}">
	<c:if test="${not empty guestbooks}">
		<aui:row>
			<aui:col md="6">
				<b>Name:</b>
			</aui:col>
			<aui:col md="6">${guestbooks.get(0).getName() }</aui:col>
		</aui:row>
		<aui:row>
			<aui:col md="6">
				<b>Email:</b>
			</aui:col>
			<aui:col md="6">${guestbooks.get(0).getEmail()}</aui:col>
		</aui:row>
		<aui:row>
			<aui:col md="6">
				<b>Message:</b>
			</aui:col>
			<aui:col md="6">${guestbooks.get(0).getMessage() }</aui:col>
		</aui:row>
	</c:if>
	<c:if test="${empty guestbooks}">
		No products Available.
	</c:if>
</liferay-ddm:template-renderer>