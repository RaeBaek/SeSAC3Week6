//
//  CodeFlixViewController.swift
//  SeSAC3Week6
//
//  Created by 백래훈 on 2023/08/24.
//

import UIKit
import SnapKit

class CodeFlixViewController: UIViewController {
    
    let hoonFlix = {
        let label = UILabel()
        label.text = "HOONFLIX"
        label.textColor = .red
        label.font = .systemFont(ofSize: 30, weight: .heavy)
        return label
    }()
    
    let emailTextField = {
        let textField = GrayTextField()
        textField.attributedPlaceholder = NSAttributedString(string: "이메일 주소 또는 전화번호", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        return textField
    }()
    
    let passwordTextField = {
        let textField = GrayTextField()
        textField.attributedPlaceholder = NSAttributedString(string: "비밀번호", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        return textField
    }()
    
    let nicknameTextField = {
        let textField = GrayTextField()
        textField.attributedPlaceholder = NSAttributedString(string: "닉네임", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        return textField
    }()
    
    let locationTextField = {
        let textField = GrayTextField()
        textField.attributedPlaceholder = NSAttributedString(string: "위치", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        return textField
    }()
    
    let recommendCodeTextField = {
        let textField = GrayTextField()
        textField.attributedPlaceholder = NSAttributedString(string: "추천 코드 입력", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        return textField
    }()
    
    let signUpButton = {
        var configuration = UIButton.Configuration.filled()
        var titleContainer = AttributeContainer()
        titleContainer.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        // 버튼 Contents 커스텀
        configuration.attributedTitle = AttributedString("회원가입", attributes: titleContainer)
        configuration.baseBackgroundColor = .white
        configuration.baseForegroundColor = .black
        let button = UIButton(configuration: configuration)
        return button
    }()
    
    let addInfo = {
        let label = UILabel()
        label.text = "추가 정보 입력"
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.textColor = .white
        return label
    }()
    
    let redSwitch = {
        let toggle = UISwitch()
        toggle.onTintColor = .red
        return toggle
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        [hoonFlix, emailTextField, passwordTextField, nicknameTextField, locationTextField, recommendCodeTextField, signUpButton, addInfo, redSwitch].forEach {
            view.addSubview($0)
        }
        
        hoonFlix.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.centerX.equalToSuperview()
        }
        
        emailTextField.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(30)
            $0.height.equalTo(40)
            $0.centerY.equalToSuperview().multipliedBy(0.6)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.horizontalEdges.equalTo(emailTextField)
            $0.top.equalTo(emailTextField.snp.bottom).offset(20)
            $0.height.equalTo(emailTextField)
        }
        
        nicknameTextField.snp.makeConstraints {
            $0.horizontalEdges.equalTo(passwordTextField)
            $0.top.equalTo(passwordTextField.snp.bottom).offset(20)
            $0.height.equalTo(passwordTextField)
        }
        
        locationTextField.snp.makeConstraints {
            $0.horizontalEdges.equalTo(nicknameTextField)
            $0.top.equalTo(nicknameTextField.snp.bottom).offset(20)
            $0.height.equalTo(nicknameTextField)
        }
        
        recommendCodeTextField.snp.makeConstraints {
            $0.horizontalEdges.equalTo(locationTextField)
            $0.top.equalTo(locationTextField.snp.bottom).offset(20)
            $0.height.equalTo(locationTextField)
        }
        
        signUpButton.snp.makeConstraints {
            $0.horizontalEdges.equalTo(recommendCodeTextField)
            $0.top.equalTo(recommendCodeTextField.snp.bottom).offset(20)
            $0.height.equalTo(50)
        }
        
        addInfo.snp.makeConstraints {
            $0.top.equalTo(signUpButton.snp.bottom).offset(20)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(30)
            
        }
        
        redSwitch.snp.makeConstraints {
            $0.top.equalTo(signUpButton.snp.bottom).offset(20)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-30)
        }
        
    }
    
}
