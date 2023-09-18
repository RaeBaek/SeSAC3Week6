//
//  CodeFlixViewController.swift
//  SeSAC3Week6
//
//  Created by 백래훈 on 2023/08/24.
//

import UIKit
import SnapKit

class CodeFlixViewController: UIViewController {
    
    let mainView = CodeFilxView()
    var viewModel = CodeFilxViewModel()
    
    override func loadView() {
        self.view = mainView
        mainView.backgroundColor = .systemBackground
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindData()

        mainView.configureView()
        
        mainView.emailTextField.addTarget(self, action: #selector(emailTextFieldChanged), for: .editingChanged)
        
        mainView.passwordTextField.addTarget(self, action: #selector(passwordTextFieldChanged), for: .editingChanged)
        
        mainView.nicknameTextField.addTarget(self, action: #selector(nicknameTextFieldChanged), for: .editingChanged)
        
        mainView.locationTextField.addTarget(self, action: #selector(locationTextFieldChanged), for: .editingChanged)
        
        mainView.recommendCodeTextField.addTarget(self, action: #selector(recommendCodeTextFieldChanged), for: .editingChanged)
        
        mainView.signUpButton.addTarget(self, action: #selector(signUpButtonClicked), for: .touchUpInside)
        
    }
    
    func bindData() {
        viewModel.emailValue.bind { text in
            self.mainView.emailTextField.text = text
        }
        
        viewModel.passwordValue.bind { text in
            self.mainView.passwordTextField.text = text
        }
        
        viewModel.nicknameValue.bind { text in
            self.mainView.nicknameTextField.text = text
        }
        
        viewModel.locationValue.bind { text in
            self.mainView.locationTextField.text = text
        }
        
        viewModel.recommendCodeValue.bind { text in
            self.mainView.recommendCodeTextField.text = text
        }
        
        viewModel.emailResult.bind { text in
            self.mainView.emailStateLabel.text = text
        }
        
        viewModel.passwordResult.bind { text in
            self.mainView.passwordStateLabel.text = text
        }
        
        viewModel.nicknameResult.bind { text in
            self.mainView.nicknameStateLabel.text = text
        }
        
        viewModel.locationResult.bind { text in
            self.mainView.locationStateLabel.text = text
        }
        
        viewModel.recommendCodeResult.bind { text in
            self.mainView.recommendCodeStateLabel.text = text
        }
        
        viewModel.isValidArray.bind { state in
            
            if state.email == true && state.password == true && state.nickname == true && state.location == true && state.recommendCode {
                
                self.mainView.signUpButton.isEnabled = true
            } else {
                return
            }
        }
        
    }
    
    @objc func emailTextFieldChanged() {
        guard let text = mainView.emailTextField.text else { return }
        viewModel.emailValue.value = text
        viewModel.convertEmail()
    }
    
    @objc func passwordTextFieldChanged() {
        guard let text = mainView.passwordTextField.text else { return }
        viewModel.passwordValue.value = text
        viewModel.convertPassword()
    }
    
    @objc func nicknameTextFieldChanged() {
        guard let text = mainView.nicknameTextField.text else { return }
        viewModel.nicknameValue.value = text
        viewModel.convertNickname()
    }
    
    @objc func locationTextFieldChanged() {
        guard let text = mainView.locationTextField.text else { return }
        viewModel.locationValue.value = text
        viewModel.convertLocation()
        
    }
    
    @objc func recommendCodeTextFieldChanged() {
        guard let text = mainView.recommendCodeTextField.text else { return }
        viewModel.recommendCodeValue.value = text
        viewModel.convertRecommendCode()
        
    }
    
    @objc func signUpButtonClicked() {
        viewModel.signUp {
            print("회원가입에 성공했기 때문에 얼럿 띄우기!")
            let alert = UIAlertController(title: "경 축", message: "MVVM 패턴을 이해하셨습니다~", preferredStyle: .alert)
            
            let ok = UIAlertAction(title: "확인", style: .default)
            let cancel = UIAlertAction(title: "취소", style: .cancel)
            
            alert.addAction(ok)
            alert.addAction(cancel)
            
            self.present(alert, animated: true)
            
        }
    }
}
