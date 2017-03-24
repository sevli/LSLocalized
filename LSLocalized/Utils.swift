//
//  Utils.swift
//  LSLocalized
//
//  Created by sevli on 2017/3/24.
//  Copyright © 2017年 李文博. All rights reserved.
//

import UIKit

class Utils: NSObject {

    // MARK: 文件目录
    static let CHINESE = "zh-Hans"
    static let ENGLISH = "en"

    // MARK: FUNC
    class func language() -> String {

        let languages : [String] = UserDefaults.standard.object(forKey: "AppleLanguages") as! Array
        let language : String = languages[0]

        if language.hasPrefix(CHINESE) {
            return CHINESE
        }
        return ENGLISH
    }

    class func bundle() -> Bundle {

        guard let path = Bundle.main.path(forResource: self.language(), ofType: "lproj"),
            let bundle = Bundle(path :path)
            else { return Bundle.main }
        
        return bundle
    }
}
