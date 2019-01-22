package com.liferay.docs.guestbook.portlet.portlet;

import java.util.Locale;
import java.util.Map;

import org.osgi.service.component.annotations.Component;

import com.liferay.docs.guestbook.model.Guestbook;
import com.liferay.docs.guestbook.portlet.constants.GuestbookPortletKeys;
import com.liferay.portal.kernel.portletdisplaytemplate.BasePortletDisplayTemplateHandler;
import com.liferay.portal.kernel.template.TemplateHandler;
import com.liferay.portal.kernel.template.TemplateVariableGroup;

@Component(immediate = true, 
			property = {"javax.portlet.name=" + GuestbookPortletKeys.GUESTBOOK },
			service = TemplateHandler.class)
public class GenelecProductDisplayTemplateHandler extends BasePortletDisplayTemplateHandler {

	@Override
	public String getClassName() {
		// TODO Auto-generated method stub
		return Guestbook.class.getName();
	}

	@Override
	public String getName(Locale locale) {
		// TODO Auto-generated method stub
		return GuestbookPortletKeys.GUESTBOOK_TEMPLATE;
	}

	@Override
	public String getResourceName() {
		// TODO Auto-generated method stub
		return GuestbookPortletKeys.GUESTBOOK;
	}

	@Override
	public Map<String, TemplateVariableGroup> getTemplateVariableGroups(long classPK, String language, Locale locale)
			throws Exception {

		Map<String, TemplateVariableGroup> templateVariableGroups = super.getTemplateVariableGroups(classPK, language,
				locale);

		TemplateVariableGroup templateVariableGroup = templateVariableGroups.get("fields");

		templateVariableGroup.empty();
		// add product field into the templateVariableGroup
		templateVariableGroup.addVariable("guestbook", Guestbook.class, "entry");

		return templateVariableGroups;
	}
}
