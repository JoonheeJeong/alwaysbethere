//
//  SearchChargingStation.swift
//  AlwaysBeThere
//
//  Created by cse on 2020/09/07.
//  Copyright © 2020 cse. All rights reserved.
//

import SwiftUI

struct SearchChargingStation: View {
    let cars = ["Subaru WRX", "Tesla Model 3", "Porsche 911", "Renault Zoe", "DeLorean", "Mitsubishi Lancer", "Audi RS6"]
    @State private var searchText : String = ""
    
//    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
//
//    var btnBack : some View { Button(action: {
//        self.presentationMode.wrappedValue.dismiss()
//        }) {
//            HStack {
//            Image("ic_back") // set image here
//                .aspectRatio(contentMode: .fit)
//                .foregroundColor(.white)
//                Text("Go back")
//            }
//        }
//    }

    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText, placeholder: "검색")
                List {
                    ForEach(self.cars.filter {
                        self.searchText.isEmpty ? true : $0.lowercased().contains(self.searchText.lowercased())
                    }, id: \.self) { car in
                        Text(car)
                    }
                }
                Spacer()
            }
        }
//        .navigationBarBackButtonHidden(true)
//        .navigationBarItems(leading: btnBack)
    }
}

struct SearchBar: UIViewRepresentable {

    @Binding var text: String
    var placeholder: String

    class Coordinator: NSObject, UISearchBarDelegate {

        @Binding var text: String

        init(text: Binding<String>) {
            _text = text
        }

        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
        }
    }

    func makeCoordinator() -> SearchBar.Coordinator {
        return Coordinator(text: $text)
    }

    func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        searchBar.placeholder = placeholder
        searchBar.searchBarStyle = .minimal
        searchBar.autocapitalizationType = .none
        return searchBar
    }

    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBar>) {
        uiView.text = text
    }
}

struct SearchChargingStation_Previews: PreviewProvider {
    static var previews: some View {
        SearchChargingStation()
    }
}
