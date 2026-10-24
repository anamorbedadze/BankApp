import XCTest

class BankingFlowTests: BaseClass {
    
    let steps = EasyBankSteps()
    
    func testInvalidEmailFormat() {
        steps.tapOnboardingLogin()
        
        steps.enterLoginEmail("invalid-email")
        steps.enterLoginPassword("TestPassword123")
        steps.tapLoginSubmit()
        
        steps.verifyLoginErrorMessageContains("badly formatted")
    }
    
    func testInvalidLoginCredentials() {
        steps.tapOnboardingLogin()
        
        steps.enterLoginEmail("notregistered@example.com")
        steps.enterLoginPassword("TestPassword123")
        steps.tapLoginSubmit()
        
        steps.verifyLoginErrorMessageContains("malformed or has expired")
    }
    
    func testRegisterLogoutLogin() {
        steps.tapOnboardingRegister()
        
        let uniqueEmail = "\(UUID().uuidString)@test.com"
        let strongPassword = "StrongPassword123!"
        
        steps.enterRegistrationEmail(uniqueEmail)
        steps.enterRegistrationPassword(strongPassword)
        steps.enterRegistrationRepeatPassword(strongPassword)
        steps.tapRegistrationSubmit()
        
        steps.verifyHomeScreenIsDisplayed()
        
        steps.tapLogout()
        steps.confirmLogout()
        
        steps.enterLoginEmail(uniqueEmail)
        steps.enterLoginPassword(strongPassword)
        steps.tapLoginSubmit()
        
        steps.verifyHomeScreenIsDisplayed()
    }
}