//
//  SchoolBusTime.swift
//  TUTSchoolBusApp
//
//  Created by Rin Ichikawa on 2025-08-03.
//
import SwiftUI

struct SchoolBusTime:Codable {
    struct HachiTime: Identifiable, Codable {
        var id = UUID()
        var start:String
        var station:String
        var stop:String
        var status: String
    }
    let hachioji: [HachiTime]
    
    struct MinaminoTime: Identifiable, Codable {
        var id = UUID()
        var start:String
        var station:String
        var stop:String
        var status: String
    }
    let minamino: [MinaminoTime]
    
    struct GakkanTime: Identifiable, Codable {
        var id = UUID()
        var start:String
        var station:String
        var stop:String
        var status: String
    }
    let gakuseikaikan: [GakkanTime]
    
    static func parse( json:Data ) -> SchoolBusTime {
        do {
            let bustimes = try JSONDecoder().decode( SchoolBusTime.self, from:json)
            return bustimes
        }
        catch {
            print( "JSONをbustimeData配列に変換できませんでした." )
            print( error.localizedDescription )
            return .init(hachioji: [], minamino: [], gakuseikaikan: [])
        }
    }
    static func load( path:String ) -> SchoolBusTime {
        if FileManager.default.fileExists( atPath:path ) == false {
            return .init(hachioji: [], minamino: [], gakuseikaikan: [])
        }
        do {
            let url = URL( fileURLWithPath: path )
            let user_json = try Data(contentsOf:url)
            return SchoolBusTime.parse(json: user_json )
        }catch {
            print( "ファイルの読み込みに失敗しました" )
            print( error.localizedDescription )
            return .init(hachioji: [], minamino: [], gakuseikaikan: [])
        }
    }
}
