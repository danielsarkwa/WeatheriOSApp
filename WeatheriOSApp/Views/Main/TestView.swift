//
//  TestView.swift
//  WeatheriOSApp
//
//  Created by Daniel Yeboah on 15.6.2023.
//

import SwiftUI

struct TestView: View {
    var body: some View {
        ZStack {
            Color.blue
            
            Color.background
                .edgesIgnoringSafeArea(.bottom)
        }
        .ignoresSafeArea()
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
