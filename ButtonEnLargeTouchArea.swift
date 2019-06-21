//
//  ButtonEnLargeTouchArea.swift
//  CocoaPodsManager
//
//  Created by Sunrise on 2019/6/21.
//  Copyright © 2019 ANSO. All rights reserved.
//

import UIKit

// MARK: - 按钮扩展类，扩大按钮响应范围
extension UIButton {
    
    static var topNameKey:Character?
    static var rightNameKey:Character?
    static var leftNameKey:Character?
    static var bottomNameKey:Character?
    
    /// 四个方向扩大等值响应范围
    ///
    /// - Parameter size: 扩大的范围值
    public func setEnLargeEdge(_ size:Float) {
        
        objc_setAssociatedObject(self, &UIButton.topNameKey, NSNumber(value: size), objc_AssociationPolicy.OBJC_ASSOCIATION_COPY_NONATOMIC)
        objc_setAssociatedObject(self, &UIButton.rightNameKey, NSNumber(value: size), objc_AssociationPolicy.OBJC_ASSOCIATION_COPY_NONATOMIC)
        objc_setAssociatedObject(self, &UIButton.bottomNameKey, NSNumber(value: size), objc_AssociationPolicy.OBJC_ASSOCIATION_COPY_NONATOMIC)
        objc_setAssociatedObject(self, &UIButton.leftNameKey, NSNumber(value: size), objc_AssociationPolicy.OBJC_ASSOCIATION_COPY_NONATOMIC)
    }
    
    /// 四个方向扩大不等值响应范围
    ///
    /// - Parameters:
    ///   - top: 向上扩大h值
    ///   - right: 向右扩大值
    ///   - bottom: 向下扩大值
    ///   - left: 向左扩大值
    public func setEnLargeEdge(_ top:Float, _ right:Float, _ bottom:Float, _ left:Float) {
        
        objc_setAssociatedObject(self, &UIButton.topNameKey, NSNumber(value: top), objc_AssociationPolicy.OBJC_ASSOCIATION_COPY_NONATOMIC)
        objc_setAssociatedObject(self, &UIButton.rightNameKey, NSNumber(value: right), objc_AssociationPolicy.OBJC_ASSOCIATION_COPY_NONATOMIC)
        objc_setAssociatedObject(self, &UIButton.bottomNameKey, NSNumber(value: bottom), objc_AssociationPolicy.OBJC_ASSOCIATION_COPY_NONATOMIC)
        objc_setAssociatedObject(self, &UIButton.leftNameKey, NSNumber(value: left), objc_AssociationPolicy.OBJC_ASSOCIATION_COPY_NONATOMIC)
    }
    
    private func enLargeRect() -> CGRect {
        
        let topEdge = objc_getAssociatedObject(self, &UIButton.topNameKey)
        let rightEdge = objc_getAssociatedObject(self, &UIButton.rightNameKey)
        let bottomEdge = objc_getAssociatedObject(self, &UIButton.bottomNameKey)
        let leftEdge = objc_getAssociatedObject(self, &UIButton.leftNameKey)
        
        if ((topEdge != nil) && (rightEdge != nil) && (bottomEdge != nil) && (leftEdge != nil)) {
            
            return CGRect(x: self.bounds.origin.x-CGFloat(truncating: leftEdge as! NSNumber),
                          y: self.bounds.origin.y - CGFloat(truncating: topEdge as! NSNumber),
                          width: self.bounds.size.width + CGFloat(truncating: leftEdge as! NSNumber) + CGFloat(truncating: rightEdge as! NSNumber),
                          height: self.bounds.size.height + CGFloat(truncating: topEdge as! NSNumber) + CGFloat(truncating: bottomEdge as! NSNumber))
        }
        
        return self.bounds
    }
    
    /// 重写触发响应
    open override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        
        let rect = self.enLargeRect()
        
        if rect == self.bounds {
            
            return super.hitTest(point, with: event)
        }
        
        return rect.contains(point) ? self : nil
    }
}
