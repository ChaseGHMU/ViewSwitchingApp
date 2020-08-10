//
//  UIViewExtension.swift
//  ViewSwitchingApp
//
//  Created by Chase Allen on 8/6/20.
//  Copyright © 2020 Chase Allen. All rights reserved.
//

import UIKit

extension UIView {
    func removeAllSubviews() {
        for view in subviews {
            view.removeFromSuperview()
        }
    }
}
