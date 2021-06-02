//
//  Extensions.swift
//  Twitter Clone
//
//  Created by Ahmed Mahmoud on 30/05/2021.
//

import UIKit
import FontAwesomeKit

extension UIView {
    public var width: CGFloat {
        return frame.size.width
    }
    
    public var height: CGFloat {
        return frame.size.height
    }
    
    public var top: CGFloat {
        return frame.origin.y
    }
    
    public var bottom: CGFloat {
        let frame = self.frame
        return frame.size.height + frame.origin.y
    }
    
    public func bottomFrameAncher(to view: UIView, constant: CGFloat? = nil) {
        var constant: CGFloat!
        if constant == nil {
            constant = height
        }
        frame.origin.y = view.height - constant!
    }
    
    public var left: CGFloat {
        return frame.origin.x
    }
    
    
    public var right: CGFloat {
        let frame = self.frame
        return frame.origin.x + frame.size.width
    }
    
    public func makeCirculer() -> Void {
        let width = frame.width
        layer.cornerRadius = width / 2
    }
    
    
    public enum CenterType {
        case x
        case y
        case all
    }
    
    public func setCenter(to view: UIView, with type: CenterType = .all) {
        let center = view.center
        switch type {
        case .x:
            self.center.x = center.x
        case .y:
            self.center.y = center.y
        case .all:
            self.center = center
        }
    }
    
    func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }
        
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
        }
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
    
    enum Anchor {
        case top
        case bottom
        case leading
        case trailing
    }
    
    func anchor(to view: UIView,
                top: Anchor?, leading: Anchor?, bottom: Anchor?, trailing: Anchor?,
                padding: UIEdgeInsets = .zero, size: CGSize = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        
        let topViewAnchor = view.topAnchor
        let leadingViewAnchor = view.leadingAnchor
        let bottomViewAnchor = view.bottomAnchor
        let trailingViewAnchor = view.trailingAnchor
        
        var constraints = [NSLayoutConstraint]()
        
        if top != nil {
            constraints.append(topAnchor.constraint(equalTo: topViewAnchor, constant: padding.top))
        }
        
        if leading != nil {
            constraints.append(leadingAnchor.constraint(equalTo: leadingViewAnchor, constant: padding.left))
        }
        
        if bottom != nil {
            constraints.append(bottomAnchor.constraint(equalTo: bottomViewAnchor, constant: -padding.bottom))
        }
        
        if trailing != nil {
            constraints.append(trailingAnchor.constraint(equalTo: trailingViewAnchor, constant: -padding.right))
        }
        
        if size.width != 0 {
            constraints.append(widthAnchor.constraint(equalToConstant: size.width))
        }
        
        if size.height != 0 {
            constraints.append(heightAnchor.constraint(equalToConstant: size.height))
        }
        
        NSLayoutConstraint.activate(constraints)
    }
}

extension FAKIcon {
    public func getImage(with size: CGFloat? = nil, color: UIColor? = nil) -> UIImage {
        changeColor(with: color ?? .white)
        let size = size ?? CGFloat(iconFontSize)
        return self.image(with: CGSize(width: size, height: size))
    }
    
    public func changeColor(with color: UIColor) {
        self.addAttribute(NSAttributedString.Key.foregroundColor.rawValue, value: color)
    }
    
    public func getBlueAccentImage() -> UIImage {
        changeColor(with: UIColor.darkBlueAccentColor!)
        let size = CGFloat(iconFontSize)
        return self.image(with: CGSize(width: size, height: size))
    }
}


extension UIColor {

    convenience init?(hex: String) {
        var hexString = hex

        if hexString.hasPrefix("#") { // Remove the '#' prefix if added.
            let start = hexString.index(hexString.startIndex, offsetBy: 1)
            hexString = String(hexString[start...])
        }

        if hexString.lowercased().hasPrefix("0x") { // Remove the '0x' prefix if added.
            let start = hexString.index(hexString.startIndex, offsetBy: 2)
            hexString = String(hexString[start...])
        }

        let r, g, b, a: CGFloat
        let scanner = Scanner(string: hexString)
        var hexNumber: UInt64 = 0
        guard scanner.scanHexInt64(&hexNumber) else { return nil } // Make sure the strinng is a hex code.

        switch hexString.count {
        case 3, 4: // Color is in short hex format
            var updatedHexString = ""
            hexString.forEach { updatedHexString.append(String(repeating: String($0), count: 2)) }
            hexString = updatedHexString
            self.init(hex: hexString)

        case 6: // Color is in hex format without alpha.
            r = CGFloat((hexNumber & 0xFF0000) >> 16) / 255.0
            g = CGFloat((hexNumber & 0x00FF00) >> 8) / 255.0
            b = CGFloat(hexNumber & 0x0000FF) / 255.0
            a = 1.0
            self.init(red: r, green: g, blue: b, alpha: a)

        case 8: // Color is in hex format with alpha.
            r = CGFloat((hexNumber & 0xFF000000) >> 24) / 255.0
            g = CGFloat((hexNumber & 0x00FF0000) >> 16) / 255.0
            b = CGFloat((hexNumber & 0x0000FF00) >> 8) / 255.0
            a = CGFloat(hexNumber & 0x000000FF) / 255.0
            self.init(red: r, green: g, blue: b, alpha: a)

        default: // Invalid format.
            return nil
        }
    }

}
