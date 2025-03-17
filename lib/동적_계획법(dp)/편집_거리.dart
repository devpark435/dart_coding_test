// ===================================================
// 문제: 편집 거리 (Edit Distance) (DP/문자열)
// ===================================================
// 문제 설명:
// 두 문자열 word1과 word2가 주어졌을 때, word1을 word2로 변환하기 위한 최소 연산 횟수를 구하세요.
// 가능한 연산은 다음과 같습니다:
// 1. 문자 삽입
// 2. 문자 삭제
// 3. 문자 교체
//
// 제한 사항:
// - 0 <= word1.length, word2.length <= 500
// - word1과 word2는 소문자로만 구성됩니다.
//
// 입출력 예시:
// 입력: word1 = "horse", word2 = "ros"
// 출력: 3
// 설명:
// - horse -> rorse (h를 r로 교체)
// - rorse -> rose (r 삭제)
// - rose -> ros (e 삭제)
//
// 입력: word1 = "intention", word2 = "execution"
// 출력: 5
// 설명:
// - intention -> inention (t 삭제)
// - inention -> enention (i를 e로 교체)
// - enention -> exention (n을 x로 교체)
// - exention -> exection (n을 c로 교체)
// - exection -> execution (삽입 u)
// ===================================================

// 함수 설명: 두 문자열 간의 최소 편집 거리를 계산합니다.
// word1: 첫 번째 문자열
// word2: 두 번째 문자열
int minDistance(String word1, String word2) {
  // 여기에 코드를 작성하세요
  return 0; // 기본 반환값
}

// 사용 예시
void main() {
  String word1 = "horse";
  String word2 = "ros";
  // 결과: 3
}
