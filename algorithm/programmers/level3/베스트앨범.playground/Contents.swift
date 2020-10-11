//문제 설명
//
//스트리밍 사이트에서 장르 별로 가장 많이 재생된 노래를 두 개씩 모아 베스트 앨범을 출시하려 합니다. 노래는 고유 번호로 구분하며, 노래를 수록하는 기준은 다음과 같습니다.
//속한 노래가 많이 재생된 장르를 먼저 수록합니다.
//장르 내에서 많이 재생된 노래를 먼저 수록합니다.
//장르 내에서 재생 횟수가 같은 노래 중에서는 고유 번호가 낮은 노래를 먼저 수록합니다.
//노래의 장르를 나타내는 문자열 배열 genres와 노래별 재생 횟수를 나타내는 정수 배열 plays가 주어질 때, 베스트 앨범에 들어갈 노래의 고유 번호를 순서대로 return 하도록 solution 함수를 완성하세요.
//제한사항
//genres[i]는 고유번호가 i인 노래의 장르입니다.
//plays[i]는 고유번호가 i인 노래가 재생된 횟수입니다.
//genres와 plays의 길이는 같으며, 이는 1 이상 10,000 이하입니다.
//장르 종류는 100개 미만입니다.
//장르에 속한 곡이 하나라면, 하나의 곡만 선택합니다.
//모든 장르는 재생된 횟수가 다릅니다.

import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    var dict = [String : [(play: Int, index: Int)]]()
    var playsDict = [String : Int]()
    let _zip = zip(genres, plays)
    
    var index: Int = 0
    for (genre, play) in _zip {
        if let totPlay = playsDict[genre] {
            playsDict[genre] = totPlay + play
        } else {
            playsDict[genre] = play
        }
        
        if dict[genre] == nil {
            dict[genre] = [(play: Int, index: Int)]()
        }
        
        dict[genre]?.append((play: play,
                             index: index))
        
        index += 1
    }
    
    var retValue = [Int]()
    let arr = playsDict.sorted(by: { $0.value > $1.value })
    
    for item in arr {
        guard let genres = dict[item.key]?.sorted(by: { $0.play > $1.play }) else {
            continue
        }
        
        retValue.append(genres.first!.index)
        if genres.count > 1 {
            retValue.append(genres[1].index)
        }
    }
    
    return retValue
}

