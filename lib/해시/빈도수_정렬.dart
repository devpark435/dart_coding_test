// ===================================================
// 문제: 빈도수 정렬 (Sort Characters By Frequency) (해시/정렬)
// ===================================================
// 문제 설명:
// 문자열이 주어졌을 때, 문자의 빈도수가 큰 순서대로 정렬하여 새로운 문자열을 반환하세요.
// 빈도수가 같은 경우 순서는 상관없습니다.
//
// 제한 사항:
// - 1 <= s.length <= 5 * 10^5
// - s는 영문 대소문자, 숫자로 구성됩니다.
//
// 입출력 예시:
// 입력: "tree"
// 출력: "eert" 또는 "eetr" (e가 2번, t와 r이 1번씩 등장)
//
// 입력: "cccaaa"
// 출력: "cccaaa" 또는 "aaaccc" (c와 a 모두 3번씩 등장)
//
// 입력: "Aabb"
// 출력: "bbAa" (b가 2번, A와 a가 1번씩 등장. 대소문자는 다른 문자로 간주)
// ===================================================

// 함수 설명: 문자열을 빈도수 기준으로 내림차순 정렬합니다.
// s: 입력 문자열
String frequencySort(String s) {
  // 1. 문자별 빈도수 계산
  Map<String, int> freq = {};
  for (var char in s.split('')) {
    freq[char] = (freq[char] ?? 0) + 1;
  }

  // 2. 빈도수로 정렬
  List<MapEntry<String, int>> sortedEntries = freq.entries.toList();
  sortedEntries.sort((a, b) => b.value - a.value);

  // 3. 결과 문자열 생성
  StringBuffer result = StringBuffer();
  for (var entry in sortedEntries) {
    String char = entry.key;
    int count = entry.value;
    for (int i = 0; i < count; i++) {
      result.write(char);
    }
  }

  return result.toString();
}

// 사용 예시
void main() {
  print(frequencySort("tree")); // "eert" 또는 "eetr"
  print(frequencySort("cccaaa")); // "cccaaa" 또는 "aaaccc"
  print(frequencySort("Aabb")); // "bbAa"
}
