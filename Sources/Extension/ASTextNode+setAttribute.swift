//
//  ASTextNode+setAttribute.swift
//  RWM
//
//  Created by 김수완 on 2021/11/22.
//  Copyright © 2021 com.6hc. All rights reserved.
//

import AsyncDisplayKit

extension ASTextNode {
    public func setAttribute(
        font: UIFont,
        color: UIColor
    ) {
        self.attributedText = NSAttributedString(
            string: " ",
            attributes: [
                .font: font,
                .foregroundColor: color
            ]
        )
    }
}
