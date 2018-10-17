//
//  GSAlert.swift
//  GSAlert
//
//  Created by zyj on 2018/10/17.
//  Copyright © 2018年 zyj. All rights reserved.
//

import UIKit

/**
 弹框类型
 
 - ActionSheet: 任务框
 - Alert:       提示框
 */
@objc enum AlertType: Int {
    case actionSheet
    case alert
}

/**
 弹框动作的类型
 
 - Default:     默认
 - Cancel:      取消
 - Destructive: 警告
 */
@objc enum AlertActionType: Int {
    case `default`
    case cancel
    case destructive
}

/**
 弹框动作
 */
class AlertAction: NSObject {
    
    typealias ClickHandler = (() -> Void)?
    
    /// 按钮标题
    var title: String
    
    /// 按钮类型
    var type: AlertActionType
    
    /// 按钮事件
    var handler: ClickHandler
    
    init(title: String, type: AlertActionType, handler: ClickHandler) {
        self.title = title
        self.type = type
        self.handler = handler
        super.init()
    }
}
