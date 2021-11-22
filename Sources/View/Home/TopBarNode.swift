//
//  TopBarNode.swift
//  RWM
//
//  Created by 김수완 on 2021/11/21.
//  Copyright © 2021 com.6hc. All rights reserved.
//

import AsyncDisplayKit
import Then
import RxSwift
import RxTexture2

class TopBarNode: ASDisplayNode {

    // MARK: UI
    private let unlockedEmojiNode = ASTextNode().then {
        $0.attributedText = NSAttributedString(
            string: "🔓",
            attributes: [
                .font: UIFont.systemFont(ofSize: 22),
                .foregroundColor: UIColor.label
            ]
        )
    }
    private let lockedEmojiNode = ASTextNode().then {
        $0.attributedText = NSAttributedString(
            string: "🔒",
            attributes: [
                .font: UIFont.systemFont(ofSize: 22),
                .foregroundColor: UIColor.label
            ]
        )
    }
    private let withFriendButtonNode = ASButtonNode().then {
        $0.hitTestSlop = .init(top: -28, left: -100.0, bottom: -12, right: -10)
        $0.setTitle(
            "친구와 참여",
            with: .systemFont(ofSize: 14),
            with: .gray02,
            for: .normal
        )
        $0.setTitle(
            "친구와 참여",
            with: .boldSystemFont(ofSize: 14),
            with: .white,
            for: .selected
        )
    }
    private let withAnyoneButtonNode = ASButtonNode().then {
        $0.hitTestSlop = .init(top: -28, left: -10, bottom: -12, right: -100)
        $0.setTitle(
            "누구나 참여",
            with: .systemFont(ofSize: 14),
            with: .gray02,
            for: .normal
        )
        $0.setTitle(
            "누구나 참여",
            with: .boldSystemFont(ofSize: 14),
            with: .white,
            for: .selected
        )
    }
    private let withFriendHighlighterNode = ASDisplayNode().then {
        $0.backgroundColor = .white
    }
    private let withAnyoneHighlighterNode = ASDisplayNode().then {
        $0.backgroundColor = .white
        $0.isHidden = true
    }
    private let underLineNode = ASDisplayNode().then {
        $0.backgroundColor = .init(red: 0.196, green: 0.196, blue: 0.196, alpha: 1)
    }

    // MARK: Initializing
    override init() {
        super.init()
        self.automaticallyManagesSubnodes = true
        self.automaticallyRelayoutOnSafeAreaChanges = true
        self.styled {
            $0.preferredSize.height = 120
        }
    }

    // MARK: Public Method

    public func selectWithFriend() {
        withFriendButtonNode.isSelected = true
        withAnyoneButtonNode.isSelected = false
        withAnyoneHighlighterNode.isHidden = true
        withFriendHighlighterNode.isHidden = false
    }

    public func selectWithAnyone() {
        withFriendButtonNode.isSelected = false
        withAnyoneButtonNode.isSelected = true
        withAnyoneHighlighterNode.isHidden = false
        withFriendHighlighterNode.isHidden = true
    }

    // MARK: Layout
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        return ASStackLayoutSpec(
            direction: .vertical,
            spacing: 0,
            justifyContent: .end,
            alignItems: .stretch,
            children: [
                buttonsLayoutSpec(),
                underLineNode.styled {
                    $0.preferredSize.height = 1
                }
            ]
        )
    }

    private func buttonsLayoutSpec() -> ASLayoutSpec {
        return ASStackLayoutSpec(
            direction: .horizontal,
            spacing: 0,
            justifyContent: .spaceAround,
            alignItems: .start,
            children: [
                withFriendLayoutSpec(),
                withAnyoneLayoutSpec()
            ]
        )
    }

    private func withFriendLayoutSpec() -> ASLayoutSpec {
        return ASStackLayoutSpec(
            direction: .vertical,
            spacing: 10,
            justifyContent: .start,
            alignItems: .center,
            children: [
                self.unlockedEmojiNode,
                self.withFriendButtonNode,
                self.withFriendHighlighterNode.styled {
                    $0.preferredSize = .init(width: 68, height: 2)
                }
            ]
        )
    }

    private func withAnyoneLayoutSpec() -> ASLayoutSpec {
        return ASStackLayoutSpec(
            direction: .vertical,
            spacing: 10,
            justifyContent: .center,
            alignItems: .center,
            children: [
                self.lockedEmojiNode,
                self.withAnyoneButtonNode,
                self.withAnyoneHighlighterNode.styled {
                    $0.preferredSize = .init(width: 68, height: 2)
                }
            ]
        )
    }

}
