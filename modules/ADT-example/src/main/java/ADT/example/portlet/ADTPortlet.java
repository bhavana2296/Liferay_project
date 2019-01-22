package ADT.example.portlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.portlet.Portlet;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import org.osgi.service.component.annotations.Component;


import com.liferay.portal.kernel.portlet.bridges.mvc.MVCPortlet;
import javax.portlet.PortletException;
import ADT.example.constants.ADTPortletKeys;
import ADT.example.model.Entry;

/**
 * @author inexture
 */
@Component(
	immediate = true,
	property = {
		"com.liferay.portlet.display-category=category.sample",
		"com.liferay.portlet.instanceable=true",
		"javax.portlet.display-name=ADT-example Portlet",
		"javax.portlet.init-param.template-path=/",
		"javax.portlet.init-param.view-template=/view.jsp",
		"javax.portlet.name=" + ADTPortletKeys.ADT,
		"javax.portlet.resource-bundle=content.Language",
		"javax.portlet.security-role-ref=power-user,user"
	},
	service = Portlet.class
)
public class ADTPortlet extends MVCPortlet {
	
	@Override
	public void render(RenderRequest renderRequest,RenderResponse renderResponse) 
			throws IOException, PortletException {
		Entry entry =new Entry();
		entry.setName("Bhavana");
		entry.setMessage("hello how are you");
		List<Entry> entries= new ArrayList<Entry>();
		entries.add(entry);
		renderRequest.setAttribute("entry", entries);
		super.render(renderRequest, renderResponse);
		
	}
}