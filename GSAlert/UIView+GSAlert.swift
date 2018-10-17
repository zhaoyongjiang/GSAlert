//
//  UIView+GSAlert.swift
//  GSAlert
//
//  Created by zyj on 2018/10/17.
//  Copyright © 2018年 zyj. All rights reserved.
//

import UIKit

extension UIView {
    
    /**
     显示提示框
     
     - parameter type:       ActionSheet/Alert
     - parameter title:      标题
     - parameter message:    内容
     - parameter sourceView: iPad中，弹窗指向的View
     - parameter actions:    动作数组
     */
    func showAlert(_ type: AlertType, title: String?, message: String?, sourceView: UIView?, actions: [AlertAction]) {
        
        if #available(iOS 8.0, *) {
            
            UIAlertController.alertWithType(type, title: title, message: message, sourceView: sourceView, actions: actions).show()
            
        } else {
            
            switch type {
            case .actionSheet: BlockActionSheet.actionSheetWithActions(actions, title: title).show(in: self)
            case .alert: BlockAlertView.alertViewWithActions(actions, title: title, message: message).show()
            }
            
        }
        
    }
    
}
