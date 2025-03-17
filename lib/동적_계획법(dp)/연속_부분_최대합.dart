/**
 * 연속 부분 최대합 (Maximum Subarray)
 * 
 * 문제 설명:
 * 정수 배열이 주어졌을 때, 합이 최대가 되는 연속된 부분 배열의 합을 구하세요.
 * 
 * 접근 방법:
 * 1. Kadane의 알고리즘을 사용합니다.
 * 2. 각 위치마다 해당 위치에서 끝나는 부분 배열의 최대합을 계산합니다.
 * 3. 현재 원소를 이전 최대합에 더한 값과 현재 원소 중 더 큰 값을 선택합니다.
 */

int maxSubArray(List<int> nums) {
  if (nums.isEmpty) return 0;

  int currentMax = nums[0];
  int globalMax = nums[0];

  for (int i = 1; i < nums.length; i++) {
    // 현재 위치에서 끝나는 최대 부분합 계산
    currentMax = max(nums[i], currentMax + nums[i]);
    // 전체 최대값 갱신
    globalMax = max(globalMax, currentMax);
  }

  return globalMax;
}

int max(int a, int b) => a > b ? a : b;

// 사용 예시
void main() {
  List<int> nums = [-2, 1, -3, 4, -1, 2, 1, -5, 4];
  print('최대 부분 배열 합: ${maxSubArray(nums)}'); // 6 (부분 배열 [4, -1, 2, 1])
}
