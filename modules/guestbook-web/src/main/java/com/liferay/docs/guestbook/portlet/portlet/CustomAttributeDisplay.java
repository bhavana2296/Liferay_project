package com.liferay.docs.guestbook.portlet.portlet;

import org.osgi.service.component.annotations.Component;

import com.liferay.docs.guestbook.model.Guestbook;
import com.liferay.docs.guestbook.portlet.constants.GuestbookPortletKeys;
import com.liferay.expando.kernel.model.BaseCustomAttributesDisplay;
import com.liferay.expando.kernel.model.CustomAttributesDisplay;
import com.liferay.portal.kernel.theme.ThemeDisplay;


@Component(immediate = true, property = {
		"javax.portlet.name=" + GuestbookPortletKeys.GUESTBOOK, }, service = CustomAttributesDisplay.class)

public class CustomAttributeDisplay extends BaseCustomAttributesDisplay {

	public static final String CLASS_NAME = Guestbook.class.getName();
	 

	@Override
	public String getClassName() {
		// TODO Auto-generated method stub
		return CLASS_NAME;
	}
	@Override
	public String getIconPath(ThemeDisplay themeDisplay) {
	 
	return themeDisplay.getPathThemeImages() + "/common/pages.png";
	}

}
