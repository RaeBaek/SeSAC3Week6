//
//  CodeFlixView.swift
//  SeSAC3Week6
//
//  Created by 백래훈 on 2023/09/13.
//

import UIKit
import SnapKit

class CodeFilxView: UIView {
    
    let hoonFlix = {
        let label = UILabel()
        label.text = "HOONFLIX"
        label.textColor = .red
        label.font = .systemFont(ofSize: 30, weight: .heavy)
        return label
    }()
    
    let emailTextField = {
        let textField = GrayTextField()
        textField.attributedPlaceholder = NSAttributedString(string: "이메일 주소 또는 전화번호", attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray6])
        return textField
    }()
    
    let passwordTextField = {
        let textField = GrayTextField()
        textField.attributedPlaceholder = NSAttributedString(string: "비밀번호", attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray6])
        return textField
    }()
    
    let nicknameTextField = {
        let textField = GrayTextField()
        textField.attributedPlaceholder = NSAttributedString(string: "닉네임", attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray6])
        return textField
    }()
    
    let locationTextField = {
        let textField = GrayTextField()
        textField.attributedPlaceholder = NSAttributedString(string: "위치", attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray6])
        return textField
    }()
    
    let recommendCodeTextField = {
        let textField = GrayTextField()
        textField.attributedPlaceholder = NSAttributedString(string: "추천 코드 입력", attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray6])
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
        button.isEnabled = false
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
    
    let emailStateLabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "안녕하세요."
        return label
    }()
    
    let passwordStateLabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "안녕하세요."
        return label
    }()
    
    let nicknameStateLabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "안녕하세요."
        return label
    }()
    
    let locationStateLabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "안녕하세요."
        return label
    }()
    
    let recommendCodeStateLabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "안녕하세요."
        return label
    }()
    
    func configureView() {
        [hoonFlix, emailTextField, passwordTextField, nicknameTextField, locationTextField, recommendCodeTextField, signUpButton, addInfo, redSwitch, emailStateLabel, passwordStateLabel, nicknameStateLabel, locationStateLabel, recommendCodeStateLabel].forEach {
            addSubview($0)
        }
        
        hoonFlix.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide).offset(20)
            $0.centerX.equalToSuperview()
        }
        
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(hoonFlix.snp.bottom).offset(30)
            $0.horizontalEdges.equalToSuperview().inset(30)
            $0.height.equalTo(40)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(20)
            $0.horizontalEdges.equalTo(emailTextField)
            $0.height.equalTo(emailTextField)
        }
        
        nicknameTextField.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(20)
            $0.horizontalEdges.equalTo(passwordTextField)
            $0.height.equalTo(passwordTextField)
        }
        
        locationTextField.snp.makeConstraints {
            $0.top.equalTo(nicknameTextField.snp.bottom).offset(20)
            $0.horizontalEdges.equalTo(nicknameTextField)
            $0.height.equalTo(nicknameTextField)
        }
        
        recommendCodeTextField.snp.makeConstraints {
            $0.top.equalTo(locationTextField.snp.bottom).offset(20)
            $0.horizontalEdges.equalTo(locationTextField)
            $0.height.equalTo(locationTextField)
        }
        
        signUpButton.snp.makeConstraints {
            $0.top.equalTo(recommendCodeTextField.snp.bottom).offset(20)
            $0.horizontalEdges.equalTo(recommendCodeTextField)
            $0.height.equalTo(50)
        }
        
        addInfo.snp.makeConstraints {
            $0.top.equalTo(signUpButton.snp.bottom).offset(25)
            $0.leading.equalTo(self.safeAreaLayoutGuide).offset(30)
            
        }
        
        redSwitch.snp.makeConstraints {
            $0.top.equalTo(signUpButton.snp.bottom).offset(20)
            $0.trailing.equalTo(self.safeAreaLayoutGuide).offset(-30)
        }
        
        emailStateLabel.snp.makeConstraints {
            $0.top.equalTo(addInfo.snp.bottom).offset(20)
            $0.horizontalEdges.equalTo(signUpButton)
        }
        
        passwordStateLabel.snp.makeConstraints {
            $0.top.equalTo(emailStateLabel.snp.bottom).offset(20)
            $0.horizontalEdges.equalTo(emailStateLabel)
        }
        
        nicknameStateLabel.snp.makeConstraints {
            $0.top.equalTo(passwordStateLabel.snp.bottom).offset(20)
            $0.horizontalEdges.equalTo(passwordStateLabel)
        }
        
        locationStateLabel.snp.makeConstraints {
            $0.top.equalTo(nicknameStateLabel.snp.bottom).offset(20)
            $0.horizontalEdges.equalTo(nicknameStateLabel)
        }
        
        recommendCodeStateLabel.snp.makeConstraints {
            $0.top.equalTo(locationStateLabel.snp.bottom).offset(20)
            $0.horizontalEdges.equalTo(locationStateLabel)
        }

        
    }
}
