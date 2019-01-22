<%@page import="com.liferay.expando.kernel.model.ExpandoBridge"%>
<%@page import="com.liferay.portal.kernel.util.FastDateFormatFactoryUtil"%>
<%@page import="java.text.Format"%>
<%@page import="com.liferay.trash.kernel.util.TrashUtil"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>

<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui"%>
<%@ taglib uri="http://liferay.com/tld/portlet" prefix="liferay-portlet"%>
<%@ taglib uri="http://liferay.com/tld/theme" prefix="liferay-theme"%>
<%@ taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui"%>

<%@ taglib uri="http://liferay.com/tld/frontend"
	prefix="liferay-frontend"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://liferay.com/tld/security"
	prefix="liferay-security"%>
<%@ page import="java.util.List"%>
<%@ page import="com.liferay.portal.kernel.util.ParamUtil"%>
<%@ page import="com.liferay.portal.kernel.util.HtmlUtil"%>
<%@ page import="com.liferay.portal.kernel.util.StringPool"%>
<%@ page import="com.liferay.portal.kernel.model.PersistedModel"%>
<%@ page import="com.liferay.portal.kernel.dao.search.SearchEntry"%>
<%@ page import="com.liferay.portal.kernel.dao.search.ResultRow"%>
<%@ page import="com.liferay.docs.guestbook.model.Guestbook"%>
<%@ page
	import="com.liferay.docs.guestbook.service.EntryLocalServiceUtil"%>
<%@ page
	import="com.liferay.docs.guestbook.service.GuestbookLocalServiceUtil"%>
<%@ page import="com.liferay.docs.guestbook.model.Entry"%>
<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui" %><%@
taglib uri="http://liferay.com/tld/portlet" prefix="liferay-portlet" %><%@
taglib uri="http://liferay.com/tld/theme" prefix="liferay-theme" %><%@
taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui" %>
<%@ taglib prefix="liferay-ddm" uri="http://liferay.com/tld/ddm" %>

<%@ page
	import="com.liferay.docs.guestbook.service.permission.GuestbookModelPermission"%>
<%@ page
	import="com.liferay.docs.guestbook.service.permission.GuestbookPermission"%>
<%@ page
	import="com.liferay.docs.guestbook.service.permission.EntryPermission"%>
<%@ page import="com.liferay.portal.kernel.util.WebKeys"%>
<%@ page
	import="com.liferay.portal.kernel.security.permission.ActionKeys"%>

<%@page import="com.liferay.portal.kernel.log.Log"%>
<%@page import="com.liferay.portal.kernel.log.LogFactoryUtil"%>

<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.liferay.portal.kernel.exception.SystemException"%>
<%@page import="com.liferay.portal.kernel.exception.PortalException"%>
<%@page import="com.liferay.portal.kernel.search.Field"%>
<%@page import="com.liferay.portal.kernel.util.GetterUtil"%>
<%@page import="com.liferay.portal.kernel.search.Document"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.liferay.portal.kernel.search.Hits"%>
<%@page import="com.liferay.portal.kernel.search.Indexer"%>
<%@page import="com.liferay.portal.kernel.search.SearchContextFactory"%>
<%@ page import="com.liferay.portal.kernel.search.SearchContext"%>
<%@ page import="com.liferay.portal.kernel.search.IndexerRegistryUtil"%>

<%@ page
	import="com.liferay.asset.kernel.service.AssetEntryLocalServiceUtil"%>
<%@ page
	import="com.liferay.asset.kernel.service.AssetTagLocalServiceUtil"%>

<%@ page import="com.liferay.asset.kernel.model.AssetEntry"%>
<%@ page import="com.liferay.asset.kernel.model.AssetTag"%>

<%@ page import="com.liferay.portal.kernel.util.ListUtil"%>

<%@page import="com.liferay.portal.kernel.util.PortalUtil"%>
<%@page import="com.liferay.docs.guestbook.filter.EntryNameComparator"%>
<%@page import="com.liferay.portal.kernel.util.OrderByComparator"%>


<%@page import="java.util.Date" %>


<%@page import="com.liferay.expando.kernel.model.ExpandoBridge" %>
<%@page import="com.liferay.expando.kernel.util.ExpandoBridgeFactoryUtil" %>
<%@page import="java.util.Collections" %>
<%@page import="com.liferay.portal.kernel.service.persistence.ResourceActionUtil" %>
<%@ page import="com.liferay.expando.kernel.service.ExpandoColumnLocalServiceUtil" %>
<%@page import="com.liferay.expando.kernel.model.ExpandoColumn" %>
<%@page import="com.liferay.portal.kernel.util.UnicodeProperties" %>
<portlet:defineObjects />


<liferay-theme:defineObjects />

<%
	String displayStyle1 = GetterUtil.getString(portletPreferences.getValue("displayStyle", ""));
	long displayStyleGroupId = GetterUtil.getLong(portletPreferences.getValue("displayStyleGroupId", null),
			scopeGroupId);
%>