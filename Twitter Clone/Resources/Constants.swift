//
//  Constants.swift
//  Twitter Clone
//
//  Created by Ahmed Mahmoud on 30/05/2021.
//

import UIKit

struct K {
    struct Colors {
        static let accentColor = UIColor(named: "accent_color")
        static let blueColor = UIColor(named: "blue")
    }
    struct Urls {
        static let personalImage = URL(string: "https://scontent.fcai10-1.fna.fbcdn.net/v/t1.6435-9/185031747_2222620371206400_88240985337874802_n.jpg?_nc_cat=101&ccb=1-3&_nc_sid=09cbfe&_nc_ohc=7NvfGaZvHfoAX-F3_nX&tn=YBVD6yR4FySm-w2s&_nc_ht=scontent.fcai10-1.fna&oh=1f73411017729256d0d426688eea0b1c&oe=60D9FA80")
    }
}


extension UIColor {
    static var accentColor: UIColor? {
        get { K.Colors.accentColor }
    }
    
    static var blueColor: UIColor? {
        get { K.Colors.blueColor }
    }
}
