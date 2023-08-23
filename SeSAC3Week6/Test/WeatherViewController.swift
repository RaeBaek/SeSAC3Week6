//
//  WeatherViewController.swift
//  SeSAC3Week6
//
//  Created by 백래훈 on 2023/08/23.
//

import UIKit
import SnapKit

class WeatherViewController: UIViewController {
    
    let dateLabel = {
        var label = UILabel()
        label.text = "10월 24일 09시 42분"
        label.textColor = .white
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    let locationImage = {
       let image = UIImageView()
        image.image = UIImage(systemName: "location.fill")
        image.tintColor = .white
        return image
    }()
    
    let locationLabel = {
        var label = UILabel()
        label.text = "서울, 신림동"
        label.textColor = .white
        label.font = .systemFont(ofSize: 20, weight: .regular)
        return label
    }()
    
    let shareButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    let refreshButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "arrow.clockwise"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    let firstChatLabel = {
        var label = PaddingLabel()
        label.backgroundColor = .white
        label.clipsToBounds = true
        label.layer.cornerRadius = 5
        label.text = "지금은 9℃입니다."
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    let secondChatLabel = {
        var label = PaddingLabel()
        label.backgroundColor = .white
        label.clipsToBounds = true
        label.layer.cornerRadius = 5
        label.text = "78% 만큼 습합니다."
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    let thirdChatLabel = {
        var label = PaddingLabel()
        label.backgroundColor = .white
        label.clipsToBounds = true
        label.layer.cornerRadius = 5
        label.text = "1m/s의 바람이 불고 있습니다."
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    let fourthChatImage = {
        var image = UIImageView()
        image.clipsToBounds = true
        image.layer.cornerRadius = 5
        image.image = UIImage(named: "구름이미지")
        return image
    }()
    
    let fifthChatLabel = {
        var label = PaddingLabel()
        label.backgroundColor = .white
        label.clipsToBounds = true
        label.layer.cornerRadius = 5
        label.text = "오늘도 행복한 하루 보내세요."
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
        [dateLabel, locationImage, locationLabel, shareButton, refreshButton, firstChatLabel, secondChatLabel, thirdChatLabel, fourthChatImage, fifthChatLabel].forEach {
            view.addSubview($0)
        }
        
        dateLabel.snp.makeConstraints {
            $0.topMargin.equalTo(view.safeAreaLayoutGuide).inset(30)
            $0.leadingMargin.equalTo(view.safeAreaLayoutGuide).offset(35)
        }
        
        locationImage.snp.makeConstraints {
            $0.top.equalTo(dateLabel.snp.bottom).offset(20)
            $0.leadingMargin.equalTo(view.safeAreaLayoutGuide).offset(30)
            $0.width.height.equalTo(30)
        }
        
        locationLabel.snp.makeConstraints {
            $0.centerY.equalTo(locationImage.snp.centerY)
            $0.leading.equalTo(locationImage.snp.trailing).offset(20)
        }
        
        refreshButton.snp.makeConstraints {
            $0.trailingMargin.equalTo(view.safeAreaLayoutGuide).offset(-30)
            $0.centerY.equalTo(locationLabel.snp.centerY)
            $0.width.height.equalTo(20)
        }
        
        shareButton.snp.makeConstraints {
            $0.trailing.equalTo(refreshButton.snp.leading).offset(-30)
            $0.centerY.equalTo(refreshButton.snp.centerY)
            $0.width.height.equalTo(20)
        }
        
        firstChatLabel.snp.makeConstraints {
            $0.top.equalTo(locationImage.snp.bottom).offset(20)
            $0.leadingMargin.equalTo(locationImage.snp.leadingMargin)
        }
        
        secondChatLabel.snp.makeConstraints {
            $0.top.equalTo(firstChatLabel.snp.bottom).offset(20)
            $0.leadingMargin.equalTo(firstChatLabel.snp.leadingMargin)
        }
        
        thirdChatLabel.snp.makeConstraints {
            $0.top.equalTo(secondChatLabel.snp.bottom).offset(20)
            $0.leadingMargin.equalTo(secondChatLabel.snp.leadingMargin)
        }
        
        fourthChatImage.snp.makeConstraints {
            $0.top.equalTo(thirdChatLabel.snp.bottom).offset(20)
            $0.leadingMargin.equalTo(thirdChatLabel.snp.leadingMargin)
            $0.width.equalTo(220)
            $0.height.equalTo(160)
        }
        
        fifthChatLabel.snp.makeConstraints {
            $0.top.equalTo(fourthChatImage.snp.bottom).offset(20)
            $0.leadingMargin.equalTo(fourthChatImage.snp.leadingMargin)
        }
        
    }
    
    
}
