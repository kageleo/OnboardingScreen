//
//  PageControl.swift
//  OnboardingScreen
//
//  Created by 吉郷景虎 on 2020/08/07.
//  Copyright © 2020 Kagetora Yoshigo. All rights reserved.
//

import Foundation
import SwiftUI
import UIKit

struct PageCotnrol: UIViewRepresentable {
    
    @Binding var currentPageIndex: Int
    var numberOfPages: Int
    
    func makeUIView(context: Context) ->  UIPageControl {
        let control = UIPageControl()
        control.numberOfPages = numberOfPages
        control.currentPageIndicatorTintColor = UIColor.orange
        control.pageIndicatorTintColor = UIColor.gray
        
        return control
    }
    
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPageIndex
    }
    
}
