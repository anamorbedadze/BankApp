//
//  PageClasss.swift
//  EasyBankUITests
//
//  Created by lmosakhlishvili on 10.02.25.
//

import XCTest

class EasyBankPage {
    let app = XCUIApplication()

    // MARK: - 1. Onboarding Screen
    var onboardingLoginButton: XCUIElement { app.buttons["onboarding.login"] }
    var onboardingRegisterButton: XCUIElement { app.buttons["onboarding.register"] }

    // MARK: - 2. Login Screen
    var loginEmailTextField: XCUIElement { app.textFields["login.email"] }
    var loginPasswordSecureField: XCUIElement { app.secureTextFields["login.password"] }
    var loginSubmitButton: XCUIElement { app.buttons["login.submit"] }
    var loginRegisterButton: XCUIElement { app.buttons["login.register"] }
    var loginErrorText: XCUIElement { app.staticTexts["login.error"] }

    // MARK: - 3. Registration Screen
    var registrationEmailTextField: XCUIElement { app.textFields["registration.email"] }
    var registrationPasswordSecureField: XCUIElement { app.secureTextFields["registration.password"] }
    var registrationRepeatPasswordSecureField: XCUIElement { app.secureTextFields["registration.repeatPassword"] }
    var registrationSubmitButton: XCUIElement { app.buttons["registration.submit"] }
    var registrationLoginButton: XCUIElement { app.buttons["registration.login"] }
    var registrationErrorText: XCUIElement { app.staticTexts["registration.error"] }

    // MARK: - 4. Home Screen
    var homeTabButton: XCUIElement { app.tabBars.buttons["Home"] }
    var homeSendMoneyButton: XCUIElement { app.buttons["home.sendMoney"] }
    var homeLogoutButton: XCUIElement { app.buttons["home.logout"] }

    // MARK: - 5. Logout Confirmation Alert
    var logoutAlert: XCUIElement { app.alerts["Logging Out"] }
    var logoutConfirmButton: XCUIElement { logoutAlert.buttons["Yes"] }
    var logoutCancelButton: XCUIElement { logoutAlert.buttons["No"] }
}