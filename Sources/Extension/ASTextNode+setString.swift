//
//  ASTextNode+setString.swift
//  RWM
//
//  Created by 김수완 on 2021/11/22.
//  Copyright © 2021 com.6hc. All rights reserved.
//

import AsyncDisplayKit

extension ASTextNode {
    public func setString(_ string: String) {
        self.attributedText = NSAttributedString(
            string: string,
            attributes: self.attributedText?.attributes(at: 0, effectiveRange: nil)
        )
    }
}
