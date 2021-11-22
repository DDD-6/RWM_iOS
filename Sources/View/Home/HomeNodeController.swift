//
//  HomeNodeController.swift
//  RWM
//
//  Created by 김수완 on 2021/11/20.
//  Copyright © 2021 com.6hc. All rights reserved.
//

import AsyncDisplayKit

class HomeNodeController: ASDKViewController<ASDisplayNode> {

    // MARK: UI
    private let topBarNode = TopBarNode()
    private let toolbarNode = ToolbarNode()
    private lazy var roomListCollectionNode = ASCollectionNode(
        collectionViewLayout: self.collectionViewLayout
    ).then {
        $0.backgroundColor = .clear
    }
    private lazy var bottomGradientDisplayNode = ASDisplayNode()
    private let generateRoomButtonNode = ASButtonNode().then {
        $0.layer.cornerRadius = 10
        $0.backgroundColor = .keyColor
        $0.setTitle(
            "방생성",
            with: .boldSystemFont(ofSize: 16),
            with: .black,
            for: .normal
        )
    }

    private let collectionViewLayout = UICollectionViewFlowLayout()

    override init() {
        super.init(node: ASDisplayNode())
        self.node.automaticallyManagesSubnodes = true
        self.node.automaticallyRelayoutOnSafeAreaChanges = true
        self.node.layoutSpecBlock = { [weak self] (_, constraintedSize) -> ASLayoutSpec in
            return self?.layoutSpecThatFits(constraintedSize) ?? ASLayoutSpec()
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func layoutSpecThatFits(_ constraintedSize: ASSizeRange) -> ASLayoutSpec {
        var containerInsets: UIEdgeInsets = self.node.safeAreaInsets
        containerInsets.left = 28.0
        containerInsets.right = 28.0
        containerInsets.top = 28.0
        containerInsets.bottom = 49.0
        return ASStackLayoutSpec(
            direction: .vertical,
            spacing: 0,
            justifyContent: .start,
            alignItems: .stretch,
            children: [
                topBarNode,
                ASInsetLayoutSpec(
                    insets: containerInsets,
                    child: self.mainStackLayoutSpec()
                ).styled {
                    $0.flexGrow = 1
                }
            ]
        )
    }

    private func mainStackLayoutSpec() -> ASLayoutSpec {
        return ASStackLayoutSpec(
            direction: .vertical,
            spacing: 0,
            justifyContent: .spaceBetween,
            alignItems: .stretch,
            children: [
                toolbarNode,
                roomListCollectionNode.styled {
                    $0.flexGrow = 1
                    $0.spacingBefore = 22
                    $0.spacingAfter = -5
                },
                generateRoomButtonNode.styled {
                    $0.preferredSize.height = 54
                }
            ]
        )
    }
}
