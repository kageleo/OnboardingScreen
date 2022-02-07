//
//  Subview.swift
//  OnboardingScreen
//
//  Created by 吉郷景虎 on 2020/08/06.
//  Copyright © 2020 Kagetora Yoshigo. All rights reserved.
//

import SwiftUI

struct Subview: View {
    
    var imageString: String
    
    var body: some View {
        Image(imageString)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .clipped()
    }
}

struct Subview_Previews: PreviewProvider {
    static var previews: some View {
        Subview(imageString: "meditating")
    }
}
