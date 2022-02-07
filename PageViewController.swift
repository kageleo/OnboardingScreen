//
//  PageViewController.swift
//  OnboardingScreen
//
//  Created by 吉郷景虎 on 2020/08/07.
//  Copyright © 2020 Kagetora Yoshigo. All rights reserved.
//

import Foundation
import SwiftUI
import UIKit

struct PageViewController: UIViewControllerRepresentable {
    
    @Binding var currentPageIndex: Int
    
    var viewControllers: [UIViewController]
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        
        pageViewController.dataSource = context.coordinator
        pageViewController.delegate = context.coordinator
        
        return pageViewController
    }
    
    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        pageViewController.setViewControllers([viewControllers[currentPageIndex]], direction: .forward, animated: true)
    }
    
    class Coordinator: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
        
        var parent: PageViewController
        
        init(_ pageViewController: PageViewController) {
            self.parent = pageViewController
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            //　viewContllerのindexを取得
            guard let index = parent.viewControllers.firstIndex(of: viewController) else {
                return nil
            }
            //　最初のviewControllerからスワイプバックした時、最後のviewControllerを表示する
            if index == 0 {
                return parent.viewControllers.last
            }
            //　現在表示されているviewControllerの前にviewControllerを表示する
            return parent.viewControllers[index - 1]
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            //　viewContllerのindexを取得
            guard let index = parent.viewControllers.firstIndex(of: viewController) else {
                return nil
            }
            // 最後のviewControllerからさらにスワイプスると最初のviewControllerを表示する
            if index + 1 == parent.viewControllers.count {
                return parent.viewControllers.first
            }
            //　現在表示されているviewControllerの後にviewControllerを表示する
            return parent.viewControllers[index + 1]
        }
        
        // このメソッドはスワイプが終了した時に呼び出される。
        func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
            if completed,
                let visibleViewController = pageViewController.viewControllers?.first,
                let index = parent.viewControllers.firstIndex(of: visibleViewController)
            {
                parent.currentPageIndex = index
            }
        }
        
    }
}
