//
//  TextViewController.swift
//  SeSAC3Week6
//
//  Created by 백래훈 on 2023/08/22.
//

import UIKit
import SnapKit

class TextViewController: UIViewController {

    let photoImageView = {
        let view = UIImageView()
        view.backgroundColor = .systemMint
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    let titleTextField = {
        let view = UITextField()
        view.borderStyle = .none
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        view.placeholder = "제목을 입력해주세요."
        view.textAlignment = .center
        view.font = .systemFont(ofSize: 15, weight: .bold)
        return view
    }()
    
    let dateTextField = {
        let view = UITextField()
        view.borderStyle = .none
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
        view.placeholder = "날짜를 입력해주세요."
        view.textAlignment = .center
        view.font = .systemFont(ofSize: 15, weight: .bold)
        return view
    }()
    
    let dailyTextView = {
        let view = UITextView()
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        view.font = .systemFont(ofSize: 15, weight: .bold)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white

        // 클로저 구문 forEach 문
        [photoImageView, titleTextField, dateTextField, dailyTextView].forEach { item in
            view.addSubview(item)
        }
        
//        [photoImageView, titleTextField].forEach {
//            view.addSubview($0)
//        }
        
        setupConstraints()
        
    }
    
    func setupConstraints() {
        // top, leading, trailing은 0으로 맞추기, 높이는 200
        photoImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leadingMargin.equalTo(20)
            make.trailingMargin.equalTo(-20)
            make.height.equalTo(view).multipliedBy(0.3)
        }
        
        titleTextField.snp.makeConstraints { make in
            make.top.equalTo(photoImageView.snp.bottom).offset(20)
            make.leadingMargin.equalTo(20)
            // margin과 약간의 차이가 있다?!
//            make.leading.equalTo(view).inset(20)
            make.trailingMargin.equalTo(-20)
            make.height.equalTo(50)
        }
        
        dateTextField.snp.makeConstraints { make in
            make.top.equalTo(titleTextField.snp.bottom).offset(20)
            make.leadingMargin.equalTo(20)
            make.trailingMargin.equalTo(-20)
            make.height.equalTo(50)
        }
        
        dailyTextView.snp.makeConstraints {
            $0.top.equalTo(dateTextField.snp.bottom).offset(20)
            $0.leadingMargin.equalTo(20)
            $0.trailingMargin.equalTo(-20)
            $0.bottomMargin.equalTo(view.safeAreaLayoutGuide).offset(-20)
        }
        
    }
}
