//
//  ContentView.swift
//  AlwaysBeThere
//
//  Created by cse on 2020/08/03.
//  Copyright © 2020 cse. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var showingAdditionalActions = false
    @State var showingBookmark = false
    @State var showingSearchBar = false
    @State var refresh = false
    @EnvironmentObject private var userData: UserData // user 이벤트 변수
    
    let buttonSize: CGFloat = 30.0
    let offset: CGFloat = 10.0
    
    var buttonBackground: some View {
        Image(systemName: "circle.fill").resizable()
            .imageScale(.large)
            .frame(width: self.buttonSize + self.offset,
                   height: self.buttonSize + self.offset, alignment: .center)
            .accessibility(label: Text("Additional actions"))
            .foregroundColor(.white)
            .padding()
    }
    
    var additionalActionsButton: some View {
        ZStack {
            buttonBackground
            Button(action: { self.showingAdditionalActions.toggle() }) {
                Image(systemName: "list.bullet")
                    .imageScale(.large)
                    .frame(width: self.buttonSize, height: self.buttonSize, alignment: .center)
                    .accessibility(label: Text("Additional actions"))
                    .foregroundColor(.black)
                    .padding()
            }
        }
    }
    
    var bookMarkButton: some View {
        ZStack {
            buttonBackground
            Button(action: { self.showingBookmark.toggle() }) {
                Image(systemName: "bookmark")
                    .imageScale(.large)
                    .frame(width: self.buttonSize, height: self.buttonSize, alignment: .center)
                    .accessibility(label: Text("Reservation & Bookmarks"))
                    .foregroundColor(.black)
                    .padding()
            }
        }
    }
    
    var searchButton: some View {
        ZStack {
            buttonBackground
            Button(action: { self.showingSearchBar.toggle() }) {
                Image(systemName: "magnifyingglass")
                    .imageScale(.large)
                    .frame(width: self.buttonSize, height: self.buttonSize, alignment: .center)
                    .accessibility(label: Text("additional actions"))
                    .foregroundColor(.black)
                    .padding()
            }
        }
    }
    
    var moveToCurrentLocationButton: some View {
        ZStack {
            buttonBackground
            // true로 하든 false로 하든 크게 상관없고, 의미상 true로 설정한다.
            // 이벤트 발생했다는 것만 KaKaoMapView에게 전달할 수 있으면 충분하다.
            Button(action: { self.userData.moveToCurrentLocation = true }) {
                Image(systemName: "mappin.and.ellipse")
                    .imageScale(.large)
                    .frame(width: self.buttonSize, height: self.buttonSize, alignment: .center)
                    .accessibility(label: Text("Move the window to the current location"))
                    .foregroundColor(.black)
                    .padding()
            }
        }
    }
    
    var refreshButton: some View {
        ZStack {
            buttonBackground
            Button(action: { self.refresh.toggle() }) {
                Image(systemName: "arrow.clockwise")
                    .imageScale(.large)
                    .frame(width: self.buttonSize, height: self.buttonSize, alignment: .center)
                    .accessibility(label: Text("Refresh"))
                    .foregroundColor(.black)
                    .padding()
            }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                KakaoMapView()
                    .environmentObject(self.userData)
                    .edgesIgnoringSafeArea(.top)
                    .frame(minWidth: 0,
                           maxWidth: .infinity,
                           minHeight: 0,
                           maxHeight: .infinity,
                           alignment: .topLeading)
//                Text(self.userData.moveToCurrentLocation ? "On" : "Off") // for debug
            }
            .navigationBarItems(
                leading: HStack {
                    additionalActionsButton
                    Spacer()
                    bookMarkButton
                    Spacer()
                    searchButton
                    Spacer()
                    moveToCurrentLocationButton
                    Spacer()
                    refreshButton
                    Spacer()
                }.padding())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        .environmentObject(UserData())
    }
}
