//
//  KakaoMapView.swift
//  AlwaysBeThere
//
//  Created by cse on 2020/08/04.
//  Copyright © 2020 cse. All rights reserved.
//

import SwiftUI

struct KakaoMapView: UIViewRepresentable {
    @EnvironmentObject var userData: UserData
    
    let defaultMapPoint = MTMapPoint(geoCoord: MTMapPointGeo(latitude: 36.366862, longitude: 127.344279)) // 충남대학교 공대 5호관 좌표
    let defaultZoomLevel:Int32 = 3
    
    func makeUIView(context: Context) -> MTMapView {
        let view = MTMapView(frame: .zero)
        view.baseMapType = MTMapType.standard
        view.setMapCenter(defaultMapPoint, zoomLevel: defaultZoomLevel, animated: true)
        return view
    }
    
    func updateUIView(_ view: MTMapView, context: Context) {
//        uiView.showCurrentLocationMarker = true
        if self.userData.moveToCurrentLocation {
            view.currentLocationTrackingMode = .onWithoutHeading
            view.setMapCenter(defaultMapPoint, zoomLevel: defaultZoomLevel, animated: true)
            self.userData.moveToCurrentLocation.toggle()
        } else if self.userData.refresh {
            MTMapView.clearMapTilePersistentCache()
            self.userData.refresh.toggle()
        }
    }
}

struct KakaoMapView_Previews: PreviewProvider {
    static var previews: some View {
        KakaoMapView()
        .environmentObject(UserData())
    }
}
