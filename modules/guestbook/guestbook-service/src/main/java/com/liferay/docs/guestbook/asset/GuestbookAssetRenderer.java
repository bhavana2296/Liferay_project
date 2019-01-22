package com.liferay.docs.guestbook.asset;

import java.util.Locale;

import javax.portlet.PortletRequest;
import javax.portlet.PortletResponse;
import javax.portlet.PortletURL;
import javax.portlet.WindowState;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.liferay.asset.kernel.model.BaseJSPAssetRenderer;
import com.liferay.docs.guestbook.model.Guestbook;
import com.liferay.docs.guestbook.portlet.constants.GuestbookPortletKeys;
import com.liferay.docs.guestbook.service.permission.GuestbookPermission;
import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.model.LayoutConstants;
import com.liferay.portal.kernel.portlet.LiferayPortletRequest;
import com.liferay.portal.kernel.portlet.LiferayPortletResponse;
import com.liferay.portal.kernel.portlet.PortletURLFactoryUtil;
import com.liferay.portal.kernel.security.permission.ActionKeys;
import com.liferay.portal.kernel.security.permission.PermissionChecker;
import com.liferay.portal.kernel.util.HtmlUtil;
import com.liferay.portal.kernel.util.PortalUtil;
import com.liferay.portal.kernel.util.StringUtil;

public class GuestbookAssetRenderer extends BaseJSPAssetRenderer<Guestbook> {

	public GuestbookAssetRenderer(Guestbook guestbook) {

		_guestbook = guestbook;
	}

	private Guestbook _guestbook;

	@Override
	public boolean hasEditPermission(PermissionChecker permissionChecker) throws PortalException {
		// TODO Auto-generated method stub

		long guestbookId = _guestbook.getGuestbookId();

		return GuestbookPermission.contains(permissionChecker, guestbookId, ActionKeys.UPDATE);
	}

	@Override
	public boolean hasViewPermission(PermissionChecker permissionChecker) throws PortalException {
		// TODO Auto-generated method stub

		long guestbookId = _guestbook.getGuestbookId();

		return GuestbookPermission.contains(permissionChecker, guestbookId, ActionKeys.VIEW);

	}

	@Override
	public Guestbook getAssetObject() {
		// TODO Auto-generated method stub
		return _guestbook;
	}

	@Override
	public long getGroupId() {
		// TODO Auto-generated method stub
		return _guestbook.getGroupId();
	}

	@Override
	public long getUserId() {
		// TODO Auto-generated method stub
		return _guestbook.getUserId();
	}

	@Override
	public String getUserName() {
		// TODO Auto-generated method stub
		return _guestbook.getUserName();
	}

	@Override
	public String getUuid() {
		// TODO Auto-generated method stub
		return _guestbook.getUuid();
	}

	@Override
	public String getClassName() {
		// TODO Auto-generated method stub
		return Guestbook.class.getName();
	}

	@Override
	public long getClassPK() {
		// TODO Auto-generated method stub
		return _guestbook.getGuestbookId();
	}

	@Override
	public String getSummary(PortletRequest portletRequest, PortletResponse portletResponse) {
		// TODO Auto-generated method stub
		return "Name : " + _guestbook.getName();
	}

	@Override
	public String getTitle(Locale locale) {
		// TODO Auto-generated method stub
		return _guestbook.getName();
	}

	@Override
	public String getJspPath(HttpServletRequest request, String template) {
		// TODO Auto-generated method stub

		if (template.equals(TEMPLATE_FULL_CONTENT)) {
			request.setAttribute("gb_guestbook", _guestbook);

			return "/asset/guestbook/" + template + ".jsp";
		} else {

			return null;
		}
	}

	@Override
	public boolean include(HttpServletRequest request, HttpServletResponse response, String template) throws Exception {
		// TODO Auto-generated method stub

		request.setAttribute("GUESTBOOK", _guestbook);
		request.setAttribute("HtmlUtil", HtmlUtil.getHtml());
		request.setAttribute("StringUtil", new StringUtil());
		return super.include(request, response, template);
	}

	@Override
	public PortletURL getURLEdit(LiferayPortletRequest liferayPortletRequest,
			LiferayPortletResponse liferayPortletResponse) throws Exception {
		// TODO Auto-generated method stub

		PortletURL portletURL = liferayPortletResponse.createLiferayPortletURL(
				getControlPanelPlid(liferayPortletRequest), GuestbookPortletKeys.GUESTBOOK,
				PortletRequest.RENDER_PHASE);
		portletURL.setParameter("mvcRenderCommandName", "/guestbookwebportlet/edit_guestbook");
		portletURL.setParameter("guestbookId", String.valueOf(_guestbook.getGuestbookId()));
		portletURL.setParameter("showback", Boolean.FALSE.toString());

		return portletURL;

	}

	@Override
	public String getURLViewInContext(LiferayPortletRequest liferayPortletRequest,
			LiferayPortletResponse liferayPortletResponse, String noSuchEntryRedirect) throws Exception {
		// TODO Auto-generated method stub

		try {
			long plid = PortalUtil.getPlidFromPortletId(_guestbook.getGroupId(), GuestbookPortletKeys.GUESTBOOK);

			PortletURL portletURL;
			if (plid == LayoutConstants.DEFAULT_PLID) {
				portletURL = liferayPortletResponse.createLiferayPortletURL(getControlPanelPlid(liferayPortletRequest),
						GuestbookPortletKeys.GUESTBOOK, PortletRequest.RENDER_PHASE);
			} else {
				portletURL = PortletURLFactoryUtil.create(liferayPortletRequest, GuestbookPortletKeys.GUESTBOOK, plid,
						PortletRequest.RENDER_PHASE);
			}

			portletURL.setParameter("mvcRenderCommandName", "/guestbookwebportlet/view");
			portletURL.setParameter("guestbookId", String.valueOf(_guestbook.getGuestbookId()));

			String currentUrl = PortalUtil.getCurrentURL(liferayPortletRequest);

			portletURL.setParameter("redirect", currentUrl);

			return portletURL.toString();

		} catch (PortalException e) {

		} catch (SystemException e) {
		}

		return noSuchEntryRedirect;
	}

	@Override
	public String getURLView(LiferayPortletResponse liferayPortletResponse, WindowState windowState) throws Exception {

		return super.getURLView(liferayPortletResponse, windowState);
	}
}
