//
//  CodeFilxViewModel.swift
//  SeSAC3Week6
//
//  Created by 백래훈 on 2023/09/13.
//

import Foundation

class CodeFilxViewModel {
    
    var emailValue = Observable("")
    var passwordValue = Observable("")
    var nicknameValue = Observable("")
    var locationValue = Observable("")
    var recommendCodeValue = Observable("")
    var isValid = Observable(false)
    
    func checkValidation() {
        if emailValue.value.count > 0 && passwordValue.value.count > 0 && nicknameValue.value.count > 0 && locationValue.value.count > 0 {
            print(emailValue.value.count > 0)
            isValid.value = true
        } else {
            isValid.value = false
        }
    }
    
    func signUp(completion: @escaping () -> Void) {
        completion()
    }
    
}
