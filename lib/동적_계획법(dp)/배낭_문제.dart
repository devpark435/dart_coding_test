/**
 * 배낭 문제 (Knapsack Problem)
 * 
 * 문제 설명:
 * 여러 물건이 있고, 각 물건은 무게와 가치를 가지고 있습니다.
 * 배낭의 최대 무게가 주어질 때, 배낭에 넣을 수 있는 물건들의 가치 합의 최댓값을 구하세요.
 * 
 * 접근 방법:
 * 1. 2차원 DP 배열을 사용합니다. dp[i][w]는 처음 i개의 물건과 최대 무게 w일 때의 최대 가치입니다.
 * 2. 각 물건마다 선택하거나 선택하지 않는 두 가지 경우를 비교합니다.
 * 3. 점화식: dp[i][w] = max(dp[i-1][w], dp[i-1][w-weights[i-1]] + values[i-1])
 */

int knapsack(List<int> weights, List<int> values, int maxWeight) {
  int n = weights.length;
  List<List<int>> dp = List.generate(
    n + 1,
    (_) => List.filled(maxWeight + 1, 0),
  );

  for (int i = 1; i <= n; i++) {
    for (int w = 0; w <= maxWeight; w++) {
      if (weights[i - 1] <= w) {
        dp[i][w] = max(
          dp[i - 1][w],
          dp[i - 1][w - weights[i - 1]] + values[i - 1],
        );
      } else {
        dp[i][w] = dp[i - 1][w];
      }
    }
  }

  return dp[n][maxWeight];
}

int max(int a, int b) => a > b ? a : b;

// 사용 예시
void main() {
  List<int> weights = [2, 3, 4, 5];
  List<int> values = [3, 4, 5, 6];
  int maxWeight = 8;

  print('배낭에 담을 수 있는 최대 가치: ${knapsack(weights, values, maxWeight)}');
}
