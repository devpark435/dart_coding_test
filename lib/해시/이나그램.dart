// ===================================================
// 문제: 아나그램 그룹화 (해시)
// ===================================================
// 문제 설명:
// 문자열 배열이 주어졌을 때, 서로 아나그램인 문자열들을 그룹화하세요.
// 아나그램이란 문자의 종류와 개수는 같지만 순서가 다른 문자열을 말합니다.
// 예를 들어, "eat"와 "tea"는 아나그램입니다.
//
// 제한 사항:
// - 입력 배열의 길이는 1 이상 10,000 이하입니다.
// - 각 문자열의 길이는 1 이상 100 이하입니다.
// - 문자열은 모두 소문자 알파벳으로만 이루어져 있습니다.
//
// 입출력 예시:
// 입력: ["eat", "tea", "tan", "ate", "nat", "bat"]
// 출력: [["ate", "eat", "tea"], ["nat", "tan"], ["bat"]]
// 설명: "ate", "eat", "tea"는 서로 아나그램이고, "nat"와 "tan"은 서로 아나그램입니다.
//      "bat"는 다른 문자열과 아나그램 관계가 아닙니다.
// ===================================================

// 함수 설명: 문자열 배열을 입력받아 아나그램 그룹을 반환합니다.
// strs: 문자열 배열
// 반환값: 아나그램 그룹이 담긴 2차원 배열
List<List<String>> groupAnagrams(List<String> strs) {
  Map<String, List<String>> anagramMap = {};

  for (String word in strs) {
    // 문자열을 문자 배열로 변환하고 정렬
    List<String> charArray = word.split('');
    charArray.sort();
    String sortedWord = charArray.join('');

    // 정렬된 문자열을 키로 사용하여 해시맵에 추가
    if (!anagramMap.containsKey(sortedWord)) {
      anagramMap[sortedWord] = [];
    }
    anagramMap[sortedWord]!.add(word);
  }

  // 해시맵의 값들(아나그램 그룹)을 리스트로 변환하여 반환
  return anagramMap.values.toList();
}

// 테스트 코드
void main() {
  final strs = ["eat", "tea", "tan", "ate", "nat", "bat"];
  final result = groupAnagrams(strs);

  // 결과 출력
  for (var group in result) {
    print(group);
  }
  // 예상 출력:
  // [ate, eat, tea]
  // [nat, tan]
  // [bat]
}
