//
//  NavigationBar.swift
//  WeatheriOSApp
//
//  Created by Daniel Yeboah on 26.6.2023.
//

import SwiftUI

struct NavigationBar: View {
    @Binding var searchText: String
    @Environment(\.dismiss) var dismiss // this remove the current stack to go back to the previous view
    
    var body: some View {
        VStack(spacing: 8) {
            HStack {
                // MARK: Back Button
                Button {
                    dismiss()
                } label: {
                    HStack(spacing: 5) {
                        // MARK: Back Button Icon
                        Image(systemName: "chevron.left")
                            .font(.system(size: 23).weight(.medium))
                        .foregroundColor(.secondary)
                        
                        // MARK: Back Button Label
                        Text("Weather")
                            .font(.title)
                            .foregroundColor(.primary)
                    }
                    .frame(height: 44)
                }
                
                Spacer()
                
                // MARK: More Button
                Image(systemName: "ellipsis.circle")
                    .font(.system(size: 28))
                    .frame(width: 44, height: 44, alignment: .trailing)
            }
            .frame(height: 52)

            // MARK: Search Bar
            HStack(spacing: 2)  {
                Image(systemName: "magnifyingglass")
                
                TextField("Search for a city or airport", text: $searchText)
            }
            .foregroundColor(.secondary)
            .padding(.horizontal, 6)
            .padding(.vertical, 7)
            .frame(height: 36, alignment: .leading)
            .background(Color.bottomSheetBackground, in: RoundedRectangle(cornerRadius: 10))
            .innerShadow(shape: RoundedRectangle(cornerRadius: 10), color: .black.opacity(0.25), lineWidth: 2, offsetX: 0, offsetY: 2, blur: 2)
        }
        .frame(height: 106, alignment: .top)
        .padding(.horizontal, 16)
        .padding(.top, 49)
        .backgroundBlur(radius: 20, opaque: true)
        .background(Color.navBarBackground)
        .frame(maxHeight: .infinity, alignment: .top) // this gives a content area for other view interaction
        .ignoresSafeArea()
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar(searchText: .constant(""))
    }
}
