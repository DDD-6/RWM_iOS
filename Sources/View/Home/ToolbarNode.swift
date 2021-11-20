//
//  ToolbarNode.swift
//  RWM
//
//  Created by 김수완 on 2021/11/21.
//  Copyright © 2021 com.6hc. All rights reserved.
//

import AsyncDisplayKit
import Then

class ToolbarNode: ASDisplayNode {

    // MARK: UI
    private lazy var refreshButton = ASButtonNode().then {
        $0.layer.cornerRadius = 18
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.cardColor.cgColor
        $0.imageNode.image = .refreshIcon
    }
    private lazy var selectModeButton = ASButtonNode().then {
        $0.layer.cornerRadius = 18
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.cardColor.cgColor
        $0.imageNode.image = .dropDownIcon
        $0.contentHorizontalAlignment = .middle
        $0.contentSpacing = 3
        $0.imageAlignment = .end
        $0.setTitle(
            "전체 모드",
            with: .systemFont(ofSize: 14),
            with: .gray02,
            for: .normal
        )
    }
    private let selectSortButton = ASButtonNode().then {
        $0.layer.cornerRadius = 18
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.cardColor.cgColor
        $0.imageNode.image = .dropDownIcon
        $0.contentHorizontalAlignment = .middle
        $0.contentSpacing = 3
        $0.imageAlignment = .end
        $0.setTitle(
            "빠른 참여",
            with: .systemFont(ofSize: 14),
            with: .gray02,
            for: .normal
        )
    }

    // MARK: Initializing
    override init() {
        super.init()
        self.automaticallyManagesSubnodes = true
        self.automaticallyRelayoutOnSafeAreaChanges = true
    }

    // MARK: Layout
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        return ASStackLayoutSpec(
            direction: .horizontal,
            spacing: 0,
            justifyContent: .spaceBetween,
            alignItems: .center,
            children: [
                refreshButton.styled {
                    $0.preferredSize = .init(width: 36, height: 36)
                },
                selectButtonsLayoutSpec()
            ]
        )
    }

    private func selectButtonsLayoutSpec() -> ASLayoutSpec {
        return ASStackLayoutSpec(
            direction: .horizontal,
            spacing: 14,
            justifyContent: .end,
            alignItems: .center,
            children: [
                selectModeButton.styled {
                    $0.preferredSize = .init(width: 89, height: 36)
                },
                selectSortButton.styled {
                    $0.preferredSize = .init(width: 89, height: 36)
                }
            ]
        )
    }

}
