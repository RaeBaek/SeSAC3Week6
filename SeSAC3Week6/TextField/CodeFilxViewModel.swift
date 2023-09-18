//
//  CodeFilxViewModel.swift
//  SeSAC3Week6
//
//  Created by 백래훈 on 2023/09/13.
//

import Foundation

struct SignUpButtonState {
    var email: Bool
    var password: Bool
    var nickname: Bool
    var location: Bool
    var recommendCode: Bool
}

class CodeFilxViewModel {
    
    var emailValue: Observable<String?> = Observable("")
    var passwordValue: Observable<String?> = Observable("")
    var nicknameValue: Observable<String?> = Observable("")
    var locationValue: Observable<String?> = Observable("")
    var recommendCodeValue: Observable<String?> = Observable("")
    
    var isValidArray: Observable<SignUpButtonState> = Observable(SignUpButtonState(email: false, password: false, nickname: false, location: false, recommendCode: false))
    
    var emailResult = Observable("이메일을 입력해주세요!")
    var passwordResult = Observable("비밀번호를 입력해주세요!")
    var nicknameResult = Observable("닉네임을 입력해주세요!")
    var locationResult = Observable("위치를 입력해주세요!")
    var recommendCodeResult = Observable("추천코드를 입력해주세요!")
    
    func convertEmail() {
        
        // 빈 값, '@' 포함
        guard let text = emailValue.value else {
            emailResult.value = "값을 입력해주세요."
            isValidArray.value.email = false
            return
        }
        
        if !text.contains("@") {
            emailResult.value = "이메일 형식을 준수하여주세요."
            isValidArray.value.email = false
            return
        } else {
            emailResult.value = "이메일을 정상적으로 입력하였습니다!"
            isValidArray.value.email = true
        }
        
    }
    
    func convertPassword() {
        // 빈 값
        guard let text = passwordValue.value else {
            passwordResult.value = "값을 입력해주세요."
            isValidArray.value.password = false
            return
        }
        
        if text.count >= 6 && text.count <= 10 {
            passwordResult.value = "비밀번호를 정상적으로 입력하였습니다!"
            isValidArray.value.password = true
        } else {
            passwordResult.value = "비밀번호는 최소 6자리부터 최대 10자리 입니다."
            isValidArray.value.password = false
            return
        }
        
    }
    
    func convertNickname() {
        // 빈 값
        guard let text = nicknameValue.value else {
            nicknameResult.value = "값을 입력해주세요."
            isValidArray.value.nickname = false
            return
        }
        
        if text.count >= 2 && text.count <= 6 {
            nicknameResult.value = "닉네임을 정상적으로 입력하였습니다!"
            isValidArray.value.nickname = true
        } else {
            nicknameResult.value = "닉네임은 최소 2글자부터 최대 6글자입니다."
            isValidArray.value.nickname = false
            return
        }
        
    }
    
    func convertLocation() {
        // 빈 값
        guard let text = locationValue.value else {
            locationResult.value = "값을 입력해주세요."
            isValidArray.value.location = false
            return
        }
        
        if !text.contains("서울특별시") {
            locationResult.value = "위치는 '서울특별시'를 포함해야합니다."
            isValidArray.value.location = false
            return
        } else {
            locationResult.value = "위치를 정상적으로 입력하였습니다!"
            isValidArray.value.location = true
        }
    }
    
    func convertRecommendCode() {
        // 빈 값
        guard let text = recommendCodeValue.value else {
            recommendCodeResult.value = "값을 입력해주세요."
            isValidArray.value.recommendCode = false
            return
        }
        
        guard let textToNumber = Int(text) else {
            recommendCodeResult.value = "추천코드는 숫자만 기입해주세요."
            isValidArray.value.recommendCode = false
            return
        }
        
        if !(text.count == 6) {
            recommendCodeResult.value = "추천코드는 숫자 6자리입니다."
            isValidArray.value.recommendCode = false
            return
        } else {
            recommendCodeResult.value = "추천코드를 정상적으로 입력하였습니다!"
            isValidArray.value.recommendCode = true
        }
        
    }
    
    func signUp(completion: @escaping () -> Void) {
        completion()
    }
    
}
