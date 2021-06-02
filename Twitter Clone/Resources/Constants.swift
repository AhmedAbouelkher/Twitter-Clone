//
//  Constants.swift
//  Twitter Clone
//
//  Created by Ahmed Mahmoud on 30/05/2021.
//

import UIKit

struct K {

    struct Urls {
        static let personalImage = URL(string: "https://scontent.fcai10-1.fna.fbcdn.net/v/t1.6435-9/185031747_2222620371206400_88240985337874802_n.jpg?_nc_cat=101&ccb=1-3&_nc_sid=09cbfe&_nc_ohc=7NvfGaZvHfoAX-F3_nX&tn=YBVD6yR4FySm-w2s&_nc_ht=scontent.fcai10-1.fna&oh=1f73411017729256d0d426688eea0b1c&oe=60D9FA80")
    }
}


extension UIColor {
    static var accentColor: UIColor? {
        get { UIColor(named: "accent_color") }
    }
    
    static var blueColor: UIColor? {
        get { UIColor(named: "blue") }
    }
    
    static var darkBlueAccentColor: UIColor? {
        get { UIColor(named: "dark_blue_accent") }
    }
    
    
    static var blueAccent: UIColor? {
        get { UIColor(named: "blue_accent") }
    }
    
    static var reverser: UIColor? {
        get { UIColor(named: "reverser") }
    }
}
