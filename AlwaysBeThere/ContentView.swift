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
    @State var search = false
    @State var recommandation = false;
    @EnvironmentObject private var userData: UserData // user 이벤트 변수
    
    let buttonSize: CGFloat = 30.0
    let offset: CGFloat = 10.0
    
    var kakaoMapView: some View {
        KakaoMapView()
        .environmentObject(self.userData)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .edgesIgnoringSafeArea(.top)
    }
    
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
            Image(systemName: "magnifyingglass")
                .imageScale(.large)
                .frame(width: self.buttonSize, height: self.buttonSize, alignment: .center)
                .accessibility(label: Text("additional actions"))
                .foregroundColor(.black)
                .padding()
        }
    }
    
    var moveToCurrentLocationButton: some View {
        ZStack {
            buttonBackground
            // true로 하든 false로 하든 크게 상관없고, 의미상 true로 설정한다.
            // 이벤트 발생했다는 것만 KaKaoMapView에게 전달할 수 있으면 충분하다.
            Button(action: { self.userData.moveToCurrentLocation.toggle() }) {
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
            Button(action: { self.userData.refresh.toggle() }) {
                Image(systemName: "arrow.clockwise")
                    .imageScale(.large)
                    .frame(width: self.buttonSize, height: self.buttonSize, alignment: .center)
                    .accessibility(label: Text("Refresh"))
                    .foregroundColor(.black)
                    .padding()
            }
        }
    }
    
//    var searchOptionModal: some View {
//        VStack {
//            HStack {
//                Button(action: { self.search.toggle() }) {
//                    Text("지역/주소명 충전소 검색")
//                }
//                Button(action: {}) {
//                    Text("경로 기반 충전소 추천")
//                }
//            }.background(Color.red)
//            Spacer()
//        }
//        .animation(.easeIn)
//    }
    
    var body: some View {
        NavigationView {
            VStack {
                kakaoMapView
//            if self.showingSearchBar {
//                searchOptionModal
//            }
//                HStack { // for debug
//                    Text("move: ".appending(self.userData.moveToCurrentLocation ? "On" : "Off"))
//                    Text("refresh: ".appending(self.userData.refresh ? "On" : "Off"))
//                }
            }
            .navigationBarItems(leading: HStack {
                additionalActionsButton
                Spacer()
                bookMarkButton
                Spacer()
                NavigationLink(destination: SearchChargingStation()) {
                    searchButton
                }
                Spacer()
                moveToCurrentLocationButton
                Spacer()
                refreshButton
                Spacer()
            })
        }
        
//        .sheet(isPresented: $showingSearchBar) {
//            Text("Hello, world!")
//        }
//        .actionSheet(isPresented: $showingSearchBar) {
//            ActionSheet(title: Text("hi"))
//        }
//        .popover(isPresented: $showingSearchBar, arrowEdge: .top) {
//            Text("Hello, world!123")
//        }
        // sheet 인가
        // 지도 유지하고 위에서 버튼 2개 내려오면서 네비게이션바 감추고
        // 위아래 드래그해서 움직일 수 있다고 알리기 위해 가운데에 가로줄 세개
        // 버튼 누르면 위로 올라가서 버튼 시트 사라지고 새로운 시트가 아래에서 올라오는겨
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        .environmentObject(UserData())
    }
}
