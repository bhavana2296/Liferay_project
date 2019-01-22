package com.liferay.docs.serviceoverride;

import java.util.List;
import java.util.Locale;

import org.osgi.service.component.annotations.Component;
import org.osgi.service.component.annotations.Reference;

import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.model.User;
import com.liferay.portal.kernel.model.UserGroupRole;
import com.liferay.portal.kernel.service.ServiceContext;
import com.liferay.portal.kernel.service.ServiceWrapper;
import com.liferay.portal.kernel.service.UserLocalServiceWrapper;

/**
 * @author inexture
 */
@Component(
	immediate = true,
	property = {
	},
	service = ServiceWrapper.class
)
public class UserLocalService extends UserLocalServiceWrapper {

	public UserLocalService(UserLocalService userLocalService) {
		super(userLocalService);
	}
	
	
	
	@Override
	public User updateUser(long userId,String oldPassword,
            String newPassword1,
            String newPassword2, boolean passwordReset,String reminderQueryQuestion,String reminderQueryAnswer,
            String screenName,String emailAddress,
            long facebookId,String openId,
            boolean portrait, byte[] portraitBytes,String languageId,
            String timeZoneId,String greeting,String comments,String firstName,
            String middleName, String lastName,
            long prefixId,long suffixId,boolean male,int birthdayMonth,
            int birthdayDay,int birthdayYear,String smsSn,String facebookSn,
            String jabberSn,String skypeSn,String twitterSn,
            String jobTitle,long[] groupIds,long[] organizationIds,long[] roleIds,List<UserGroupRole> userGroupRoles,long[] userGroupIds,
            ServiceContext serviceContext) throws PortalException {
	    
		firstName="Bhavana";
		lastName="Sewkani";
		
	    return super.updateUser(userId, oldPassword, newPassword1, newPassword2,
                passwordReset, reminderQueryQuestion, reminderQueryAnswer, screenName,
                emailAddress, facebookId, openId, portrait,portraitBytes,languageId, timeZoneId, greeting,
                comments, firstName, middleName, lastName, prefixId, suffixId, male,
                birthdayMonth, birthdayDay, birthdayYear, smsSn, facebookSn,
                 jabberSn, skypeSn, twitterSn,jobTitle,
                groupIds, organizationIds, roleIds, userGroupRoles, userGroupIds,
                serviceContext);
	}
	public User addDefaultAdminUser(long companyId, String screenName, String emailAddress, Locale locale, String firstName, String middleName, String lastName) throws PortalException{
		
		firstName="bhavana";
		lastName="Sewkani";
		
		return super.addDefaultAdminUser(companyId, screenName, emailAddress, locale, firstName, middleName, lastName);
	}
	
	
	public User addUser(long creatorUserId, long companyId, boolean autoPassword, String password1, String password2, boolean autoScreenName, String screenName, String emailAddress, long facebookId, String openId, Locale locale, String firstName, String middleName, String lastName, long prefixId, long suffixId, boolean male, int birthdayMonth, int birthdayDay, int birthdayYear, String jobTitle, long[] groupIds, long[] organizationIds, long[] roleIds, long[] userGroupIds, boolean sendEmail, ServiceContext serviceContext) throws PortalException
	{
		
		firstName="Bhavana";
		lastName="sewkani";
		
		return super.addUser(creatorUserId, companyId, autoPassword, password1, password2, autoScreenName, screenName, emailAddress, facebookId, openId, locale, firstName, middleName, lastName, prefixId, suffixId, male, birthdayMonth, birthdayDay, birthdayYear, jobTitle, groupIds, organizationIds, roleIds, userGroupIds, sendEmail, serviceContext);
		
		
	}
	@Reference(unbind = "-")
	private void serviceSetter(UserLocalService userLocalService) {
	    setWrappedService(userLocalService);
	}

}