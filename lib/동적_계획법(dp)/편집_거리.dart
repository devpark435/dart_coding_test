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
  int m = word1.length;
  int n = word2.length;

  // 특수 케이스 처리
  if (m == 0) return n;
  if (n == 0) return m;

  // DP 테이블 초기화
  List<List<int>> dp = List.generate(m + 1, (_) => List.filled(n + 1, 0));

  // 기본 케이스 설정
  for (int i = 0; i <= m; i++) {
    dp[i][0] = i; // word1의 i개 문자를 모두 삭제
  }

  for (int j = 0; j <= n; j++) {
    dp[0][j] = j; // word2의 j개 문자를 모두 삽입
  }

  // DP 테이블 채우기
  for (int i = 1; i <= m; i++) {
    for (int j = 1; j <= n; j++) {
      if (word1[i - 1] == word2[j - 1]) {
        // 문자가 같으면 연산 필요 없음
        dp[i][j] = dp[i - 1][j - 1];
      } else {
        // 삭제, 삽입, 교체 중 최소값에 1을 더함
        dp[i][j] =
            1 +
            min3(
              dp[i - 1][j], // 삭제
              dp[i][j - 1], // 삽입
              dp[i - 1][j - 1], // 교체
            );
      }
    }
  }

  return dp[m][n];
}

// 세 값 중 최소값을 반환
int min3(int a, int b, int c) {
  return min(a, min(b, c));
}

// 두 값 중 최소값을 반환
int min(int a, int b) {
  return a < b ? a : b;
}

// 사용 예시
void main() {
  print(minDistance("horse", "ros")); // 3
  print(minDistance("intention", "execution")); // 5
}
