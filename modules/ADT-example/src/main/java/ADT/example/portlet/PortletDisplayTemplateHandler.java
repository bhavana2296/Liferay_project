package ADT.example.portlet;

import java.security.GuardedObject;
import java.util.Locale;
import java.util.Map;

import org.osgi.service.component.annotations.Component;

import com.liferay.portal.kernel.portletdisplaytemplate.BasePortletDisplayTemplateHandler;
import com.liferay.portal.kernel.template.TemplateHandler;
import com.liferay.portal.kernel.template.TemplateVariableGroup;

import ADT.example.constants.ADTPortletKeys;
import ADT.example.model.Entry;


@Component(
		immediate=true,
		property={
				"javax.portlet.name=" +ADTPortletKeys.ADT
		},
		service= TemplateHandler.class
		)
public class PortletDisplayTemplateHandler extends BasePortletDisplayTemplateHandler {

	@Override
	public String getClassName() {
		// TODO Auto-generated method stub
		return Entry.class.getName();
	}

	@Override
	public String getName(Locale locale) {
		// TODO Auto-generated method stub
		return ADTPortletKeys.ADT1;
	}

	@Override
	public String getResourceName() {
		// TODO Auto-generated method stub
		return ADTPortletKeys.ADT;
	}
	
	@Override
	public Map<String, TemplateVariableGroup> getTemplateVariableGroups(long classPK, String language, Locale locale)
			throws Exception {

		Map<String, TemplateVariableGroup> templateVariableGroups = super.getTemplateVariableGroups(classPK, language,
				locale);

		TemplateVariableGroup templateVariableGroup = templateVariableGroups.get("fields");

		templateVariableGroup.empty();
		// add product field into the templateVariableGroup
		templateVariableGroup.addVariable("entry", Entry.class, "entry");

		return templateVariableGroups;
	}
	
	
}
