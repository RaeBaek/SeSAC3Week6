//
//  CustomViewController.swift
//  SeSAC3Week6
//
//  Created by 백래훈 on 2023/08/24.
//

import UIKit
import SnapKit

class CustomViewController: UIViewController {

    let idTextField = {
        let textField = BlackRadiusTextField()
        textField.placeholder = "아이디를 입력해주세요."
        return textField
    }()
    
    let pwTextField = {
        let textField = BlackRadiusTextField()
        textField.placeholder = "비밀번호를 입력해주세요."
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        [idTextField, pwTextField].forEach {
            view.addSubview($0)
        }
        
        idTextField.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalTo(300)
            $0.height.equalTo(50)
        }
        
        pwTextField.snp.makeConstraints {
            $0.center.equalToSuperview().offset(100)
            $0.width.equalTo(300)
            $0.height.equalTo(50)
        }
    }

}
