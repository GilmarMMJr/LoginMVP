//
//  RegisterPresenter.swift
//  LoginMVP
//
//  Created by Gilmar Junior on 07/12/22.
//

import Foundation

protocol RegisterPresenterDelegate {
    func showMessage(title: String, message: String)
    func goHome()
}

class RegisterPresenter {
    
    var delegate: RegisterPresenterDelegate?
    
    func register(userModel: UserModel) {
        let manager = UserManager(business: UserBusiness())
        manager.register(email: userModel.email, password: userModel.password) {[weak self] model in
            self?.delegate?.goHome()
        } failureHandler: { [weak self] error in
            self?.delegate?.showMessage(title: "Error", message: error?.localizedDescription ?? "")
        }


    }
    
}
