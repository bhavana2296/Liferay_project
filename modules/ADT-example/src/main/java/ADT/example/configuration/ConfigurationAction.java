package ADT.example.configuration;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.osgi.service.component.annotations.Component;
import org.osgi.service.component.annotations.ConfigurationPolicy;
import org.osgi.service.component.annotations.Reference;

import com.liferay.portal.kernel.portlet.DefaultConfigurationAction;

import ADT.example.constants.ADTPortletKeys;


@Component(
		configurationPolicy=ConfigurationPolicy.OPTIONAL,
		immediate=true,
		property={
				"javax.portlet.name="+ ADTPortletKeys.ADT
		},
		service=ConfigurationAction.class
		)
public class ConfigurationAction extends DefaultConfigurationAction {
	@Override
	public String getJspPath(HttpServletRequest request)
	{
		return "/configuration.jsp";
	}
	
	
	
	@Override
	@Reference(target="(osgi.web.symbolicname=ADT.example)" , unbind="-")
	public void setServletContext(ServletContext servletContext) {
		super.setServletContext(servletContext);
	}

}
