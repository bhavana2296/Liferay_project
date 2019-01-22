package com.liferay.docs.guestbook.configuration;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.osgi.service.component.annotations.Component;
import org.osgi.service.component.annotations.ConfigurationPolicy;
import org.osgi.service.component.annotations.Reference;

import com.liferay.docs.guestbook.portlet.constants.GuestbookPortletKeys;
import com.liferay.portal.kernel.portlet.ConfigurationAction;
import com.liferay.portal.kernel.portlet.DefaultConfigurationAction;

@Component(configurationPolicy = ConfigurationPolicy.OPTIONAL, 
			immediate = true, 
			property = {"javax.portlet.name=" + GuestbookPortletKeys.GUESTBOOK },
			service = ConfigurationAction.class)

public class GenelecConfigurationAction extends DefaultConfigurationAction {

	@Override
	public String getJspPath(HttpServletRequest request) {
		// TODO Auto-generated method stub
		return "/guestbookwebportlet/configuration.jsp";
	}

	@Override
	@Reference(target = "(osgi.web.symbolicname=com.liferay.docs.guestbook.portlet)", unbind = "-")
	public void setServletContext(ServletContext servletContext) {
		super.setServletContext(servletContext);
	}
}
