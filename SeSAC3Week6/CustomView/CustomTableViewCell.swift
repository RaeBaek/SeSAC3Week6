//
//  CustomTableViewCell.swift
//  SeSAC3Week6
//
//  Created by 백래훈 on 2023/08/25.
//

import UIKit
import SnapKit

class CustomTableViewCell: UITableViewCell {
    
    let label = UILabel()
    let button = UIButton()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configure()
        setConstraints() // addSubView 이후에 contstraints 설정
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        contentView.addSubview(label)
        contentView.addSubview(button)
        label.backgroundColor = .yellow
        button.backgroundColor = .green
    }
    
    func setConstraints() {
        button.snp.makeConstraints {
            $0.size.equalTo(30)
            $0.centerY.trailingMargin.equalTo(contentView)
        }
        label.snp.makeConstraints {
            $0.top.leadingMargin.bottom.equalTo(contentView)
            $0.trailing.equalTo(button.snp.leading).inset(8)
        }
    }
    
    //Interface Builder 상에서만 동작하는 함수
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
