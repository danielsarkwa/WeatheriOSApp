//
//  WeatherView.swift
//  WeatheriOSApp
//
//  Created by Daniel Yeboah on 26.6.2023.
//

import SwiftUI

struct WeatherView: View {
    @State private var searchText = ""
    
    var searchResult: [Forecast] {
        if searchText.isEmpty {
            return Forecast.cities
        } else {
            return Forecast.cities.filter { $0.location.contains(searchText) }
        }
    }
    
    var body: some View {
        ZStack {
            // MARK: Background
            Color.background
                .ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    ForEach(searchResult) { forecast in
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
            NavigationBar(searchText: $searchText) // custom navBar -- although it's overlay but the space below the bar is interactive
        }
        .navigationBarHidden(true) // any view placed inside NavigationLink will have iOS custom navigationBar on top of your view
//        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search for a city or airport") // navigationView has a topBar on the child stack to so add a search, add it to the child stack element
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            WeatherView()
                .preferredColorScheme(.dark)
        }
    }
}
