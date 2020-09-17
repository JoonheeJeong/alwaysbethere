//
//  ChargingStationRow.swift
//  AlwaysBeThere
//
//  Created by cse on 2020/09/08.
//  Copyright © 2020 cse. All rights reserved.
//

import SwiftUI

struct ChargingStationRow: View {
    var charger: Charger
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("충전소 이름")
                Spacer()
                Image(systemName: "folder.badge.plus")
            }
            HStack {
                Text("충전소 주소")
            }
            HStack {
                Text("충전 가능 여부")
                Spacer()
                Text("충전 포트 타입")
            }
        }
    }
}

struct ChargingStationRow_Previews: PreviewProvider {
    static var previews: some View {
        ChargingStationRow()
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
