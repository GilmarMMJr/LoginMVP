//
//  LoginPresenter.swift
//  LoginMVP
//
//  Created by Gilmar Junior on 06/12/22.
//

import Foundation

protocol LoginPresenterDelegate {
    func showMessage(title: String, message: String)
    func gotHome()
}

class LoginPresenter {
    
    var delegate: LoginPresenterDelegate?
    
    func login(userModel: UserModel) {
        let manager = UserManager(business: UserBusiness())
        manager.login(email: userModel.email,
                      password: userModel.password) {[weak self] model in
//            self?.delegate?.showMessage(title: "DEU BOM!!!", message: "Login com Sucesso!!!")
            self?.delegate?.gotHome()
        } failureHandler: {[weak self] error in
            self?.delegate?.showMessage(title: "Error", message: error?.localizedDescription ?? "")
        }

    }
    
}
