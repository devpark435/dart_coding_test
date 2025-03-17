// ===================================================
// 문제: 중복 없는 가장 긴 부분 문자열 (해시/슬라이딩 윈도우)
// ===================================================
// 문제 설명:
// 문자열이 주어졌을 때, 중복된 문자가 없는 가장 긴 부분 문자열의 길이를 구하세요.
//
// 제한 사항:
// - 0 <= s.length <= 5 * 10^4
// - s는 영문 알파벳, 숫자, 기호, 공백으로 구성됩니다.
//
// 입출력 예시:
// 입력: "abcabcbb"
// 출력: 3 (설명: "abc"가 중복 없는 가장 긴 부분 문자열)
//
// 입력: "bbbbb"
// 출력: 1 (설명: "b"가 중복 없는 가장 긴 부분 문자열)
//
// 입력: "pwwkew"
// 출력: 3 (설명: "wke"가 중복 없는 가장 긴 부분 문자열, "pwke"는 부분 수열)
// ===================================================

// 함수 설명: 중복 없는 가장 긴 부분 문자열의 길이를 찾습니다.
// s: 입력 문자열
int lengthOfLongestSubstring(String s) {
  // 빈 문자열 처리
  if (s.isEmpty) return 0;

  // 현재 윈도우에 있는 문자와 그 인덱스를 저장하는 맵
  Map<String, int> charMap = {};

  int maxLength = 0; // 최대 길이
  int start = 0; // 현재 윈도우의 시작 인덱스

  for (int end = 0; end < s.length; end++) {
    String currentChar = s[end];

    // 현재 문자가 이미 윈도우 내에 있고, 시작점 이후에 있는 경우
    if (charMap.containsKey(currentChar) && charMap[currentChar]! >= start) {
      // 시작점을 중복 문자 다음 위치로 이동
      start = charMap[currentChar]! + 1;
    }

    // 현재 문자의 위치 업데이트
    charMap[currentChar] = end;

    // 최대 길이 업데이트
    maxLength = max(maxLength, end - start + 1);
  }

  return maxLength;
}

// List 사용 예시 시간복잡도 O(n^2)
// int lengthOfLongestSubstring(String s) {
//   if (s.isEmpty) return 0;

//   int maxLength = 0;
//   List<String> currentWindow = [];

//   for (int i = 0; i < s.length; i++) {
//     String currentChar = s[i];

//     // 문자가 이미 현재 윈도우에 있으면, 중복된 문자가 나올 때까지 제거
//     if (currentWindow.contains(currentChar)) {
//       int duplicateIndex = currentWindow.indexOf(currentChar);
//       currentWindow.removeRange(0, duplicateIndex + 1);
//     }

//     // 현재 문자 추가
//     currentWindow.add(currentChar);

//     // 최대 길이 업데이트
//     maxLength = max(maxLength, currentWindow.length);
//   }

//   return maxLength;
// }

int max(int a, int b) => a > b ? a : b;

// 사용 예시
void main() {
  print(lengthOfLongestSubstring("abcabcbb")); // 3
  print(lengthOfLongestSubstring("bbbbb")); // 1
  print(lengthOfLongestSubstring("pwwkew")); // 3
}
