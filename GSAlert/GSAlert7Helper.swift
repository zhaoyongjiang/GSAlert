//
//  GSAlert7Helper.swift
//  GSAlert
//
//  Created by zyj on 2018/10/17.
//  Copyright © 2018年 zyj. All rights reserved.
//

import UIKit

@available(iOS 7.0, *)
class BlockActionSheet: UIActionSheet, UIActionSheetDelegate, iOS7AlertProtocol {
    
    var actions: [AlertAction]!
    
    /**
     快速创建BlockActionSheet
     
     - parameter actions: 动作集合
     - parameter title:   标题
     
     - returns: BlockActionSheet
     */
    class func actionSheetWithActions(_ actions: [AlertAction], title: String?) -> BlockActionSheet {
        var actionSheet = BlockActionSheet()
        if let title = title { actionSheet.title = title }
        actionSheet.delegate = actionSheet
        actionSheet.setupActions(actions)
        return actionSheet
    }
    
    /**
     在某个控制中显示
     
     - parameter viewController: 控制器
     - parameter sourceView:     iPad中指向的视图（使用iPad时必须指定）
     */
    func showInViewController(_ viewController: UIViewController, sourceView: UIView?) {
        switch UIDevice.current.userInterfaceIdiom {
        case .phone:
            if let tabBar = viewController.tabBarController?.tabBar {
                show(from: tabBar)
            } else {
                show(in: viewController.view)
            }
        case .pad:
            show(from: sourceView!.bounds, in: viewController.view, animated: true)
        default: break
        }
    }
    
    /**
     处理点击后的回调
     */
    func actionSheet(_ actionSheet: UIActionSheet, clickedButtonAt buttonIndex: Int) {
        actions[buttonIndex].handler?()
    }
    
}

@available(iOS 7.0, *)
class BlockAlertView: UIAlertView, UIAlertViewDelegate, iOS7AlertProtocol {
    
    var actions: [AlertAction]!
    
    /**
     快速创建BlockAlertView
     
     - parameter actions: 动作集合
     - parameter title:   标题
     - parameter message: 内容
     
     - returns: BlockAlertView
     */
    class func alertViewWithActions(_ actions: [AlertAction], title: String?, message: String?) -> BlockAlertView {
        var alertView = BlockAlertView()
        alertView.title = title ?? ""
        alertView.message = message
        alertView.delegate = alertView
        alertView.setupActions(actions)
        return alertView
    }
    
    /**
     处理点击后的回调
     */
    func alertView(_ alertView: UIAlertView, clickedButtonAt buttonIndex: Int) {
        actions[buttonIndex].handler?()
    }
    
}

protocol iOS7AlertProtocol {
    
    var actions: [AlertAction]! { get set }
    var cancelButtonIndex: Int { get set }
    
    func addButtonWithTitle(_ title: String?) -> Int
    mutating func setupActions(_ actions: [AlertAction])
    
}

extension iOS7AlertProtocol {
    
    mutating func setupActions(_ actions: [AlertAction]) {
        for action in actions {
            addButtonWithTitle(action.title)
            if action.type == .cancel {
                cancelButtonIndex = actions.index(of: action)!
            }
        }
        self.actions = actions
    }
    
}
