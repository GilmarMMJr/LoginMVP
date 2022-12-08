//
//  LoginPresenter.swift
//  LoginMVP
//
//  Created by Gilmar Junior on 06/12/22.
//

import Foundation

protocol LoginPresenterDelegate {
    func showMessage(title: String, message: String)
    func goHome()
    func goRegister()
}

class LoginPresenter {
    
    var delegate: LoginPresenterDelegate?
    
    func login(userModel: UserModel) {
        let manager = UserManager(business: UserBusiness())
        manager.login(email: userModel.email,
                      password: userModel.password) {[weak self] model in
            self?.delegate?.goHome()
        } failureHandler: {[weak self] error in
            self?.delegate?.showMessage(title: "Error", message: error?.localizedDescription ?? "")
        }

    }
    
}
