package com.liferay.docs.guestbook.asset;

import javax.portlet.PortletRequest;
import javax.portlet.PortletURL;
import javax.servlet.ServletContext;

import org.osgi.service.component.annotations.Component;
import org.osgi.service.component.annotations.Reference;

import com.liferay.asset.kernel.model.AssetRenderer;
import com.liferay.asset.kernel.model.AssetRendererFactory;
import com.liferay.asset.kernel.model.BaseAssetRendererFactory;
import com.liferay.docs.guestbook.model.Guestbook;
import com.liferay.docs.guestbook.portlet.constants.GuestbookPortletKeys;
import com.liferay.docs.guestbook.service.GuestbookLocalService;
import com.liferay.docs.guestbook.service.permission.GuestbookPermission;
import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.portlet.LiferayPortletRequest;
import com.liferay.portal.kernel.portlet.LiferayPortletResponse;
import com.liferay.portal.kernel.security.permission.PermissionChecker;
import com.liferay.portal.kernel.theme.ThemeDisplay;
import com.liferay.portal.kernel.util.WebKeys;

@Component(immediate = true, property = {
		"javax.portlet.name=" + GuestbookPortletKeys.GUESTBOOK }, service = AssetRendererFactory.class)
public class GuestbookAssetRendererFactory extends BaseAssetRendererFactory<Guestbook> {

	public GuestbookAssetRendererFactory() {
		setClassName(CLASS_NAME);
		setLinkable(_LINKABLE);
		setPortletId(GuestbookPortletKeys.GUESTBOOK);
		setSearchable(true);
		setSelectable(true);
	}

	@Override
	public AssetRenderer<Guestbook> getAssetRenderer(long classPK, int type) throws PortalException {
		// TODO Auto-generated method stub

		Guestbook guestbook = _guestbookLocalService.getGuestbook(classPK);

		GuestbookAssetRenderer guestbookAssetRenderer = new GuestbookAssetRenderer(guestbook);

		guestbookAssetRenderer.setAssetRendererType(type);
		guestbookAssetRenderer.setServletContext(_servletContext);

		return guestbookAssetRenderer;
	}

	@Override
	public String getClassName() {
		// TODO Auto-generated method stub
		return CLASS_NAME;
	}

	@Override
	public String getType() {
		// TODO Auto-generated method stub
		return TYPE;
	}

	@Override
	public boolean hasPermission(PermissionChecker permissionChecker, long classPK, String actionId) throws Exception {

		Guestbook guestbook = _guestbookLocalService.getGuestbook(classPK);
		return GuestbookPermission.contains(permissionChecker, guestbook, actionId);
	}

	@Override
	public PortletURL getURLAdd(LiferayPortletRequest liferayPortletRequest,
			LiferayPortletResponse liferayPortletResponse, long classTypeId) {
		PortletURL portletURL = null;

		try {
			ThemeDisplay themeDisplay = (ThemeDisplay) liferayPortletRequest.getAttribute(WebKeys.THEME_DISPLAY);

			portletURL = liferayPortletResponse.createLiferayPortletURL(getControlPanelPlid(themeDisplay),
					GuestbookPortletKeys.GUESTBOOK, PortletRequest.RENDER_PHASE);
			portletURL.setParameter("mvcRenderCommandName", "/guestbookwebportlet/edit_guestbook");
			portletURL.setParameter("showback", Boolean.FALSE.toString());
		} catch (PortalException e) {
		}

		return portletURL;
	}

	@Override
	public boolean isLinkable() {
		// TODO Auto-generated method stub
		return _LINKABLE;
	}

	@Override
	public String getIconCssClass() {
		// TODO Auto-generated method stub
		return "bookmarks";
	}

	@Reference(target = "(osgi.web.symbolicname=com.liferay.docs.guestbook.portlet)", unbind = "-")
	public void setServletContext(ServletContext servletContext) {
		_servletContext = servletContext;
	}

	private ServletContext _servletContext;

	@Reference(unbind = "-")
	protected void setGuestbookLocalService(GuestbookLocalService guestbookLocalService) {
		_guestbookLocalService = guestbookLocalService;
	}

	private GuestbookLocalService _guestbookLocalService;
	private static final boolean _LINKABLE = true;
	public static final String CLASS_NAME = Guestbook.class.getName();
	public static final String TYPE = "guestbook";
}
