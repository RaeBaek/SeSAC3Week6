//
//  Observable.swift
//  SeSAC3Week6
//
//  Created by 백래훈 on 2023/09/13.
//

import Foundation

class Observable<T> {
    
    private var listener: ((T) -> Void)?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(_ completion: @escaping (T) -> Void) {
        print(#function)
        completion(value)
        listener = completion
    }
    
}
