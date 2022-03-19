//
//  TextFieldContentView.swift
//  Today
//
//  Created by 하늘이 on 2022/03/19.
//

import UIKit

class TextFieldContentView: UIView {
    let textField = UITextField()
    
    override var intrinsicContentSize: CGSize {
        CGSize(width: 0, height: 44)
    }
    
    init() {
        super.init(frame: .zero)
        addPinnedSubview(textField, insets: UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16))
        textField.clearButtonMode = .whileEditing
    }
    
    // UIView의 서브클래스인 custom view를 구현할 때는 필수로 구현해야한다.
    required init?(coder: NSCoder) {
        fatalError("init(code:) has not been implemented")
    }
}
