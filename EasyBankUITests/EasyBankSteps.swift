import XCTest

class EasyBankSteps {
    let app = XCUIApplication()
    let page = EasyBankPage()

    // MARK: - Onboarding Actions
    func tapOnboardingLogin() {
        page.onboardingLoginButton.tap()
    }
    
    func tapOnboardingRegister() {
        page.onboardingRegisterButton.tap()
    }

    // MARK: - Login Actions
    func enterLoginEmail(_ email: String) {
        page.loginEmailTextField.tap()
        page.loginEmailTextField.typeText(email)
    }

    func enterLoginPassword(_ password: String) {
        page.loginPasswordSecureField.tap()
        page.loginPasswordSecureField.typeText(password)
    }

    func tapLoginSubmit() {
        page.loginSubmitButton.tap()
    }

    func verifyLoginErrorMessageContains(_ text: String) {
        let errorIsDisplayed = page.loginErrorText.waitForExistence(timeout: 5.0)
        XCTAssertTrue(errorIsDisplayed, "Login error message should be displayed")
        XCTAssertTrue(page.loginErrorText.label.contains(text), "Error message should contain '\(text)', but got '\(page.loginErrorText.label)'")
    }
    
    // MARK: - Registration Helper
    private func typePasswordWithPromptHandling(field: XCUIElement, password: String) {
        field.tap()
        
        let alertCloseButton = app.alerts.buttons["Close"]
        if alertCloseButton.waitForExistence(timeout: 1.5) {
            alertCloseButton.tap()
        } else {
            let normalCloseButton = app.buttons["Close"]
            if normalCloseButton.waitForExistence(timeout: 0.5) {
                normalCloseButton.tap()
            }
        }
        
        // კრიტიკული შესწორება: ყოველთვის ვაჭერთ ველს მეორედ ტექსტის შეყვანამდე.
        // ეს აიგნორებს iOS-ის ავტომატურ ყვითელ ფენას და გარანტირებულად სვამს კურსორს ველში.
        field.tap()
        
        field.typeText(password)
    }
    
    // MARK: - Registration Actions
    func enterRegistrationEmail(_ email: String) {
        page.registrationEmailTextField.tap()
        page.registrationEmailTextField.typeText(email)
    }
    
    func enterRegistrationPassword(_ password: String) {
        typePasswordWithPromptHandling(field: page.registrationPasswordSecureField, password: password)
    }
    
    func enterRegistrationRepeatPassword(_ password: String) {
        typePasswordWithPromptHandling(field: page.registrationRepeatPasswordSecureField, password: password)
    }
    
    func tapRegistrationSubmit() {
        page.registrationSubmitButton.tap()
    }
    
    // MARK: - Home Actions
    func verifyHomeScreenIsDisplayed() {
        let isSendMoneyVisible = page.homeSendMoneyButton.waitForExistence(timeout: 10.0) 
        XCTAssertTrue(isSendMoneyVisible, "Home screen should be displayed (Send Money button missing)")
    }
    
    func tapLogout() {
        page.homeLogoutButton.tap()
    }

    // MARK: - Logout Alert Actions
    func confirmLogout() {
        let isAlertVisible = page.logoutAlert.waitForExistence(timeout: 2.0)
        XCTAssertTrue(isAlertVisible, "Logout confirmation alert should be visible")
        page.logoutConfirmButton.tap()
    }
}