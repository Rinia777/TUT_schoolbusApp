import SwiftUI

enum Affiliation: String, CaseIterable, Identifiable {
    case university
    case graduate
    case specialty
    case TUT
    case JT
    case n
    
    var title: String {
        switch self {
        case .n:
            return "選択してください"
        case .university:
            return "東京工科大学"
        case .graduate:
            return "東京工科大学院"
        case .specialty:
            return "日本工学院専門学校"
        case .TUT:
            return "東京工科大学職員"
        case .JT:
            return "日本工学院専門学校職員"
        }
    }
    
    var id: String { rawValue }
    
    var undergraduate: [Undergraduate] {
        switch self {
        case .n:
            return [.n]
        case .university:
            return [.es, .ms, .cs, .bs,.n]
        case .graduate:
            return [.Es, .BMs,.n]
        case .specialty:
            return [.cc, .mc, .ic, .tc, .sc,.n]
        case .TUT:
            return [.es, .ms, .cs, .bs,.n]
        case .JT:
            return [.cc, .mc, .ic, .tc, .sc,.n]
        }
    }
}

let enrollmentYear: [Int] = (0...7).map {
      Calendar.current.component(.year, from: Date()) - $0
  }

var enrollmentYearList: [String] {
    ["選択してください"] + enrollmentYear.map(\.description) + ["職員"]
}

enum Undergraduate: String, Identifiable {
    case es
    case ms
    case cs
    case bs
    case Es
    case BMs
    case cc
    case dc
    case mc
    case ic
    case tc
    case sc
    case none
    case n
    
    var id: String { rawValue }
    
    var title: String {
        switch self {
        case .n:
            return "選択してください"
        case .es:
            return "工学部"
            
        case .ms:
            return "メディア学部"
            
        case .cs:
            return "コンピューターサイエンス学部"
            
        case .bs:
            return "応用生物学部"
            
        case .Es:
            return "工学研究科"
            
        case .BMs:
            return "バイオ・情報メディア研究科"
            
        case .cc:
            return "クリエイターズカレッジ"
            
        case .dc:
            return "デザインカレッジ"
            
        case .mc:
            return "ミュージックカレッジ"
            
        case .ic:
            return "ITカレッジ"
            
        case .tc:
            return "テクノロジーカレッジ"
            
        case .sc:
            return "スポーツ・医療カレッジ"
        
        case .none:
            return "なし"
        }
    }
}

enum StationInfo: String, CaseIterable{
    case hachi
    case minamino
    case studenthall
    case n
    
    var id: String { rawValue }
    
    var title: String {
        switch self {
        case .n:
            return "選択してください"
        case .hachi:
            return "八王子駅"
        case .minamino:
            return "八王子みなみ野駅"
        case .studenthall:
            return "学生会館"
        }
    }

}

struct MyInfoView: View {
    @Environment(\.dismiss) var dismiss
    @AppStorage("Affiliation") var affiliation: Affiliation = .n
    @AppStorage("Enrollment") var enrollment: String = ""
    @AppStorage("Undergraduate") var undergraduate: Undergraduate = .n
    @AppStorage("StationInfo") var stationInfo: StationInfo = .n
    
    
    
    
    var body: some View {
        
        VStack{
            List {
                Section {
                    Picker("所属を選択", selection: $affiliation) {
                        ForEach(Affiliation.allCases, id: \.id) { value in
                            Text(value.title)
                                .tag(value)
                        }
                    }
                    .pickerStyle(.automatic)
                } header: {
                    Text("所属")
                }

                Section {
                    Picker("入学年度を選択",selection: $enrollment) {
                        ForEach(enrollmentYearList, id: \.self) { value in
                            Text(value.description)
                                .tag(value)
                        }
                    }
                    .pickerStyle(.automatic)
                } header: {
                    Text("入学年度")
                }

                Section {
                    Picker("学部を選択",selection: $undergraduate) {
                        ForEach(affiliation.undergraduate, id: \.id) { value in
                            Text(value.title)
                                .tag(value)
                        }
                    }
                    .pickerStyle(.automatic)
                } header: {
                    Text("学部")
                }
                
                Section {
                    Picker("よく利用するバス停を選択",selection: $stationInfo) {
                        ForEach(StationInfo.allCases, id: \.self) { value in
                            Text(value.title)
                                .tag(value)
                        }
                    }
                    .pickerStyle(.automatic)
                } header: {
                    Text("よく利用する駅")
                }
                 
            }
        }
        .background(Color.backGray)
        .navigationBarBackButtonHidden(true)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(
                            action: {
                                dismiss()
                            }, label: {
                                Image(systemName: "arrow.backward")
                            }
                        ).tint(Color.tutGray)
                    }
                }
    }
}

#Preview {
    MyInfoView()
}

