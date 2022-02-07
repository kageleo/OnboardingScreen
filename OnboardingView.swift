//
//  OnboardingView.swift
//  OnboardingScreen
//
//  Created by 吉郷景虎 on 2020/08/06.
//  Copyright © 2020 Kagetora Yoshigo. All rights reserved.
//

import SwiftUI

struct OnboardingView: View {
    
    var subviews = [
        UIHostingController(rootView: Subview(imageString: "meditating")),
        UIHostingController(rootView: Subview(imageString: "skydiving")),
        UIHostingController(rootView: Subview(imageString: "sitting"))
    ]
    
    var titles = [
        "Take some time out",
        "Conquer personal hindrances",
        "Create a peaceful mind"
    ]
    
    var captions = [
        "Take your time out and bring awareness into your everyday life",
        "Meditating helps you dealing with anxiety and other psychic problems",
        "Regular medidation sessions creates a peaceful inner mind"
    ]
    
    @State var currentPageIndex = 0
    
    var body: some View {
        VStack(alignment: .leading) {
            PageViewController(currentPageIndex: $currentPageIndex, viewControllers: subviews)
                .frame(height: 530)
            Group {
                Text(titles[currentPageIndex])
                    .font(.title)
                Text(captions[currentPageIndex])
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .frame(width: 300, height: 50, alignment: .leading)
                    .lineLimit(nil)
            }
                .padding()
            HStack {
                PageCotnrol(currentPageIndex: $currentPageIndex, numberOfPages: subviews.count)
                Spacer()
                Button(action: {
                    if self.currentPageIndex + 1 == self.subviews.count {
                        self.currentPageIndex = 0
                    } else {
                        self.currentPageIndex += 1
                    }
                }) {
                    ButtonContent()
                }
            }
                .padding()
              // Text("Currently shown page: \(currentPageIndex)")
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}

struct ButtonContent: View {
    var body: some View {
        
            Image(systemName: "arrow.right")
                .resizable()
                .foregroundColor(.white)
                .frame(width: 30, height: 30)
                .padding()
                .background(Color.orange)
                .cornerRadius(30)
        
    }
}
