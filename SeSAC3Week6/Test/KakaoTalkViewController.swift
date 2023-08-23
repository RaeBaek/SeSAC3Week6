//
//  KakaoTalkViewController.swift
//  SeSAC3Week6
//
//  Created by 백래훈 on 2023/08/22.
//

import UIKit
import SnapKit

class KakaoTalkViewController: UIViewController {
    
    let xImage = {
        let image = UIImageView()
        image.image = UIImage(named: "엑스마크")
        return image
    }()
    
    let setButton = {
       let button = UIButton()
        button.setImage(UIImage(named: "설정"), for: .normal)
        return button
    }()
    
    let payButton = {
       let button = UIButton()
        button.setImage(UIImage(named: "송금"), for: .normal)
        return button
    }()
    
    let presentButton = {
       let button = UIButton()
        button.setImage(UIImage(named: "선물하기"), for: .normal)
        return button
    }()
    
    let backgroundImage = {
       let image = UIImageView()
        image.image = UIImage(named: "배경사진")
        image.contentMode = .scaleToFill
        return image
    }()
    
    let profileImage = {
       let image = UIImageView()
        image.image = UIImage(named: "프로필사진")
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 30
        return image
    }()
    
    let username = {
        let label = UILabel()
        label.text = "백래훈"
        label.textColor = .white
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        return label
    }()
    
    let statusMessage = {
        let label = UILabel()
        label.text = "오늘도 화이팅!"
        label.textColor = .white
        label.font = .systemFont(ofSize: 13, weight: .regular)
        return label
    }()
    
    let lineView = {
       let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let chatImage = {
        let image = UIImageView()
        image.image = UIImage(named: "나와의채팅")
        return image
        
    }()
    
    let chatLabel = {
        let label = UILabel()
        label.text = "나와의 채팅"
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.textColor = .white
        return label
        
    }()
    
    let editImage = {
        let image = UIImageView()
        image.image = UIImage(named: "프로필편집")
        return image
        
    }()
    
    let editLabel = {
        let label = UILabel()
        label.text = "프로필 편집"
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.textColor = .white
        return label
        
    }()
    
    let kakaoStoryImage = {
        let image = UIImageView()
        image.image = UIImage(named: "카카오스토리")
        return image
        
    }()
    
    let kakaoStoryLabel = {
        let label = UILabel()
        label.text = "카카오스토리"
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.textColor = .white
        return label
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
        
        [backgroundImage, xImage, setButton, payButton, presentButton, chatLabel, chatImage, editLabel, editImage, kakaoStoryImage, kakaoStoryLabel, lineView, statusMessage, username, profileImage].forEach {
            view.addSubview($0)
        }
        
        setConstraints()
    }
    
    func setConstraints() {
        backgroundImage.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
        }
        
        xImage.snp.makeConstraints {
            $0.topMargin.leadingMargin.equalTo(view.safeAreaLayoutGuide).offset(25)
            $0.width.height.equalTo(20)
        }
        
        setButton.snp.makeConstraints {
            $0.topMargin.equalTo(view.safeAreaLayoutGuide).offset(25)
            $0.trailingMargin.equalTo(view.safeAreaLayoutGuide).inset(25)
            $0.width.height.equalTo(30)
        }
        
        payButton.snp.makeConstraints {
            $0.topMargin.equalTo(setButton.snp.topMargin)
            $0.trailingMargin.equalTo(setButton.snp.leading).offset(-20)
            $0.width.height.equalTo(30)
        }
        
        presentButton.snp.makeConstraints {
            $0.topMargin.equalTo(payButton.snp.topMargin)
            $0.trailingMargin.equalTo(payButton.snp.leading).offset(-20)
            $0.width.height.equalTo(33)
        }
        
        chatLabel.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(30)
            $0.centerX.equalTo(view).multipliedBy(0.45)
        }
        
        chatImage.snp.makeConstraints {
            $0.bottom.equalTo(chatLabel.snp.top).offset(-20)
            $0.centerX.equalTo(chatLabel.snp.centerX)
            $0.width.equalTo(23)
            $0.height.equalTo(23)
        }
        
        editLabel.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(30)
            $0.centerX.equalTo(view).multipliedBy(1)
            
        }
        
        editImage.snp.makeConstraints {
            $0.top.equalTo(chatImage.snp.top)
            $0.centerX.equalTo(editLabel.snp.centerX)
            $0.width.equalTo(23)
            $0.height.equalTo(23)
        }
        
        kakaoStoryLabel.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(30)
            $0.centerX.equalTo(view).multipliedBy(1.55)
            
        }
        
        kakaoStoryImage.snp.makeConstraints {
            $0.top.equalTo(editImage.snp.top)
            $0.centerX.equalTo(kakaoStoryLabel.snp.centerX)
            $0.width.equalTo(16)
            $0.height.equalTo(24)
        }
        
        lineView.snp.makeConstraints {
            $0.bottom.equalTo(editImage.snp.top).offset(-30)
            $0.width.equalToSuperview()
            $0.height.equalTo(0.3)
        }

        statusMessage.snp.makeConstraints {
            $0.centerX.equalTo(view)
            $0.bottom.equalTo(lineView.snp.top).offset(-30)
        }

        username.snp.makeConstraints {
            $0.centerX.equalTo(statusMessage.snp.centerX)
            $0.bottom.equalTo(statusMessage.snp.top).offset(-10)
        }

        profileImage.snp.makeConstraints {
            $0.centerX.equalTo(username.snp.centerX)
            $0.bottom.equalTo(username.snp.top).offset(-20)
            $0.width.height.equalTo(80)
        }
    }
}
