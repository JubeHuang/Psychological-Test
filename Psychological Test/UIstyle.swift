//
//  UIstyle.swift
//  Psychological Test
//
//  Created by Jube on 2022/12/14.
//

import Foundation
import UIKit

func bgShadowStyle(view: UIView, shadowColor: CGColor, shadowOpacity: Float, shadowRadius: CGFloat) {
    view.layer.shadowOpacity = shadowOpacity
    view.layer.shadowColor = shadowColor
    view.layer.shadowRadius = shadowRadius
}
