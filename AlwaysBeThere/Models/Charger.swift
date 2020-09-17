//
//  Charger.swift
//  AlwaysBeThere
//
//  Created by cse on 2020/09/08.
//  Copyright © 2020 cse. All rights reserved.
//

import SwiftUI

struct Charger: Hashable, Codable, Identifiable {
    var id: Int
    
    var statNm: String // 충전소 이름
    var statID: Int // 충전소ID
    var chgerID: Int // 충전기ID
    /*
     01: DC차데모,
     02: AC완속,
     03: DC차데모+AC3상,
     04: DC콤보,
     05: DC차데모+DC콤보
     06: DC차데모+AC3상+DC콤보
     07: AC3상
     */
    var chgerType: String // 충전기 타입
    var addr: String // 주소
    var lat: CGFloat // 위도
    var lng: CGFloat // 경도
    var useTime: String // 사용시간 ex) 24시간 이용가능
    
    var busiID: String // 운영기관 ID
    var busiNm: String // 기관명
    var busiCall: String // 기관 연락처
    
    /*
     1: 통신이상
     2: 충전대기,
     3: 충전중,
     4: 운영중지,
     5: 점검중,
     9: 상태미확인
     */
    var stat: Int // 충전기 상태
    var statUpdDt: String // 상태갱신일시
    
    // option
    var powerType: String // 충전량
}
