//
//  GrayTextField.swift
//  SeSAC3Week6
//
//  Created by 백래훈 on 2023/08/24.
//

import UIKit

class GrayTextField: UITextField {
    
    // Interface Builder를 사용하지 않고, UIView를 상속받은 Custom Class를 코드로 구성할 때 사용되는 초기화 구문
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTextField()
    }
    
    // NSCoding
    // Xib -> Nib 변환 과정에서 객체 생성 시 필요한 init 구문 (storyboard)
    // Interface Builder에서 생성된 뷰들이 초기화될 때 실행되는 구문
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupTextField() {
        backgroundColor = .darkGray
        borderStyle = .none
        layer.cornerRadius = 5
        textColor = .white
        textAlignment = .center
        
        font = .systemFont(ofSize: 15, weight: .medium)
    }
}
