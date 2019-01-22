<%@page import="com.liferay.portal.kernel.util.Constants"%>
<%@page import="com.liferay.docs.guestbook.model.Guestbook"%>
<%@ include file="../init.jsp"%>

<liferay-portlet:actionURL portletConfiguration="<%=true%>"
	var="configurationActionURL" />
<liferay-portlet:renderURL portletConfiguration="<%=true%>"
	var="configurationRenderURL" />
<aui:form action="<%=configurationActionURL%>" method="post" name="fm">
	<aui:input name="<%=Constants.CMD%>" type="hidden"
		value="<%=Constants.UPDATE%>" />
	<aui:input name="redirect" type="hidden"
		value="<%=configurationRenderURL%>" />

	<div class="portlet-configuration-body-content">
		<div class="container-fluid-1280">
			<aui:fieldset-group markupView="lexicon">
				<aui:fieldset>
					<div class="display-template">
						<liferay-ddm:template-selector
							className="<%=Guestbook.class.getName()%>"
							displayStyle="<%=displayStyle1%>"
							displayStyleGroupId="<%=displayStyleGroupId%>"
							refreshURL="<%=configurationRenderURL%>"
							showEmptyOption="<%=true%>" />
					</div>
				</aui:fieldset>
			</aui:fieldset-group>
		</div>
	</div>
	<aui:button-row>
		<aui:button cssClass="btn-lg" type="submit" />
	</aui:button-row>
</aui:form>
