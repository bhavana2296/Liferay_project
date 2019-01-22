package sample.portlet;

import java.util.Enumeration;
import java.util.ResourceBundle;

import org.osgi.service.component.annotations.Component;

import com.liferay.portal.kernel.language.UTF8Control;

@Component(
		property={"language.id=es_ES"},
		service = ResourceBundle.class
		)


public class MyEnResouceBundle extends ResourceBundle {

	@Override
	public Enumeration<String> getKeys() {
		// TODO Auto-generated method stub
		return _resourceBundle.getKeys();
	}

	@Override
	protected Object handleGetObject(String arg0) {
		// TODO Auto-generated method stub
		return _resourceBundle.getObject(arg0);
	}
	private final ResourceBundle _resourceBundle = ResourceBundle.getBundle(
	        "content.Language_es_ES", UTF8Control.INSTANCE);


}
