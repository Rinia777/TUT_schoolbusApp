//
//  JsonModelIndex.swift
//  TUTSchoolBusApp
//
//  Created by Rin Ichikawa on 2025-08-15.
//

import Foundation
import SwiftUI

final class JsonModelIndex: ObservableObject {
    @Published var resource: String
    @Published var schoolBusTimes: SchoolBusTime
    @Published var hCount: Int
    
    init(resource: String = "/test.json", schoolBusTimes: SchoolBusTime = .init(hachioji: [], minamino: [], gakuseikaikan: []), hCount: Int = 0) {
        self.resource = "/test.json"
        self.schoolBusTimes = .init(hachioji: [], minamino: [], gakuseikaikan: [])
        self.hCount = 0
    }
    
    func busIndex( _ date:Date ) -> Int {
        //日付
        let date : Date = Date()
        print(date)
        
        let components = Calendar.current.dateComponents([.weekday], from: Date())
        let day = components.weekday!
        resource = "/test.json"
        switch day {
        case 1:
            self.resource = "/bustimeSun.json"
            print(day)
            print("======")
        case 7:
            self.resource = "/bustimeSat.json"
            print(day)
            print("======")
        default:
            self.resource = "/bustime.json"
            print(day)
            print("======")
        }
        
        schoolBusTimes = SchoolBusTime.load( path:Bundle.main.bundlePath +  resource )
        //今日の日付
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateFormatter.locale = Locale(identifier: "ja_JP")
        dateFormatter.dateFormat = "yyyy-MM-dd "
        let formatDay = dateFormatter.string(from: date)
        print(formatDay) //2024-00-00
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        // ファイルの中の数
        
        //ここから繰り返す
        var now_idx = 0
        for i in 0 ..< hCount {
            //今日の日付とバスの時間を合わせる
            let str = formatDay + (schoolBusTimes.hachioji[i].station) + ":00"
            print(str)
            //シャトル運行を飛ばす
            guard let strToDate = dateFormatter.date(from: str)else {
                continue
            }
            print(strToDate)
            
            //現在の日時とバスの時刻を比較
            if date >= strToDate {
                print("過去")
            }else{
                print("現在")
                
                now_idx = i
                break
            }
        }
        //繰り返しここまで
        print( now_idx )
        return now_idx
    }
}
