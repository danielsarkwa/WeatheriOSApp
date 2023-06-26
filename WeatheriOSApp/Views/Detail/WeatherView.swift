//
//  WeatherView.swift
//  WeatheriOSApp
//
//  Created by Daniel Yeboah on 26.6.2023.
//

import SwiftUI

struct WeatherView: View {
    var body: some View {
        ZStack {
            // MARK: Background
            Color.background
                .ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    ForEach(Forecast.cities) { forecast in
                        WeatherWidget(forecast: forecast)
                    }
                }
            }
            .safeAreaInset(edge: .top) {
                EmptyView()
                    .frame(height: 110)
            }
        }
        .overlay {
            NavigationBar() // custom navBar -- although it's overlay but the space below the bar is interactive
        }
        .navigationBarHidden(true) // any view placed inside NavigationLink will have iOS custom navigationBar on top of your view
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
            .preferredColorScheme(.dark)
    }
}
