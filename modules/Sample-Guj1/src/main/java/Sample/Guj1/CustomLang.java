package Sample.Guj1;

import java.util.Enumeration;

import java.util.ResourceBundle;

import org.osgi.service.component.annotations.Component;

import com.liferay.portal.kernel.language.UTF8Control;

@Component(
		immediate = true,
		property = {
			"language.id=gu_IN"
		},
		service = ResourceBundle.class
	)
public class CustomLang extends ResourceBundle {

	@Override
	public Enumeration<String> getKeys() {
		// TODO Auto-generated method stub
		return  _resourceBundle.getKeys();
	}

	@Override
	protected Object handleGetObject(String arg0) {
		// TODO Auto-generated method stub
		return _resourceBundle.getObject(arg0);
	}
	private final ResourceBundle _resourceBundle = ResourceBundle.getBundle(
			"content.language_gu_IN", UTF8Control.INSTANCE);

}
