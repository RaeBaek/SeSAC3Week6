//
//  SnapViewController.swift
//  SeSAC3Week6
//
//  Created by 백래훈 on 2023/08/22.
//

import UIKit
import SnapKit

/*
 addSubview
 superView
 offset inset
 RTL, LTR: leading vs left, trailing vs right
 
 */

class SnapViewController: UIViewController {
    
    let redView = UIView()
    let whiteView = UIView()
    let blueView = UIView()
    let yellowView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
        
        view.addSubview(redView)
        redView.backgroundColor = .red
        redView.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(150)
            make.centerX.equalTo(view)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        view.addSubview(whiteView)
        whiteView.backgroundColor = .white
        whiteView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            
            // 1.
            make.leading.equalTo(view.safeAreaLayoutGuide)
            make.trailing.equalTo(view.safeAreaLayoutGuide)
            
            // 2.
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            
            // 3.
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            
            make.height.equalTo(200)
        }
        
        view.addSubview(blueView)
        blueView.backgroundColor = .blue
        blueView.snp.makeConstraints { make in
//            make.width.height.equalTo(200)
            make.size.equalTo(200)
//            make.centerX.centerY.equalTo(view)
            make.center.equalTo(view)
        }

        blueView.addSubview(yellowView)
        yellowView.backgroundColor = .yellow
        yellowView.snp.makeConstraints { make in
//            make.size.equalTo(150)
//            make.leading.top.equalToSuperview()
            
//            make.leading.trailing.top.bottom.equalToSuperview()
            make.edges.equalTo(blueView).offset(50)
//            make.edges.equalTo(blueView).inset(50)
        }
        
        
    }

}
