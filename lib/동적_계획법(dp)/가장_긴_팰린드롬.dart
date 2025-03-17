// ===================================================
// 문제: 가장 긴 팰린드롬 부분 문자열 (문자열/DP)
// ===================================================
// 문제 설명:
// 문자열 s가 주어졌을 때, s의 부분 문자열 중에서 가장 긴 팰린드롬을 찾으세요.
// 팰린드롬이란 앞에서부터 읽으나 뒤에서부터 읽으나 같은 문자열을 말합니다.
//
// 제한 사항:
// - 1 <= s.length <= 1000
// - s는 영문 소문자로만 구성됩니다.
//
// 입출력 예시:
// 입력: "babad"
// 출력: "bab" 또는 "aba" (둘 다 정답)
//
// 입력: "cbbd"
// 출력: "bb"
//
// 입력: "a"
// 출력: "a"
//
// 입력: "ac"
// 출력: "a" 또는 "c" (둘 다 정답)
// ===================================================

// 함수 설명: 주어진 문자열에서 가장 긴 팰린드롬 부분 문자열을 찾습니다.
// s: 입력 문자열
// 반환값: 가장 긴 팰린드롬 부분 문자열
String longestPalindrome(String s) {
  if (s.length < 2) return s;

  String longest = s[0]; // 최소한 한 글자는 팰린드롬

  for (int i = 0; i < s.length; i++) {
    // 모든 가능한 시작점에서
    for (int j = i + 1; j < s.length; j++) {
      // 모든 가능한 끝점까지
      // 현재 부분 문자열이 팰린드롬이고 현재 최장 팰린드롬보다 길면 업데이트
      if (j - i + 1 > longest.length && isPalindrome(s, i, j)) {
        longest = s.substring(i, j + 1);
      }
    }
  }

  return longest;
}

// 문자열의 부분이 팰린드롬인지 확인하는 함수
bool isPalindrome(String s, int start, int end) {
  while (start < end) {
    if (s[start] != s[end]) {
      return false;
    }
    start++;
    end--;
  }
  return true;
}

// 테스트 코드
void main() {
  print(longestPalindrome("babad")); // "bab" 또는 "aba"
  print(longestPalindrome("cbbd")); // "bb"
  print(longestPalindrome("a")); // "a"
  print(longestPalindrome("ac")); // "a" 또는 "c"
}
