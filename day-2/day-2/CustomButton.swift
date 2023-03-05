//
//  CustomButton.swift
//  day-2
//
//  Created by Timofey Privalov on 05.03.2023.
//

import UIKit

final class BounceButton: UIButton {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        UIView.animate(withDuration: 0.2, delay: 0,
                       usingSpringWithDamping: 1, initialSpringVelocity: 1,
                       options: .allowUserInteraction) {
            self.transform = CGAffineTransform(scaleX: 0.85, y: 0.85)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        UIView.animate(withDuration: 0.2, delay: 0,
                       usingSpringWithDamping: 1, initialSpringVelocity: 1,
                       options: .allowUserInteraction) {
            self.transform = CGAffineTransform.identity
        }
    }
}
