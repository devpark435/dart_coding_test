/*
정수 배열 nums가 주어졌을 때, 가장 긴 증가하는 부분 수열의 길이를 반환하세요.
부분 수열은 배열에서 몇몇 원소를 제거하거나 제거하지 않고 남은 원소들의 상대적 순서를 유지하는 수열입니다. 증가하는 부분 수열은 각 원소가 이전 원소보다 큰 경우를 말합니다.
입력:

배열 nums의 길이는 1 이상 2,500 이하입니다.
nums 배열의 각 원소는 -10,000 이상 10,000 이하의 정수입니다.

예시 1:
Input: nums = [10, 9, 2, 5, 3, 7, 101, 18]
Output: 4
설명: 가장 긴 증가하는 부분 수열은 [2, 3, 7, 101]이며, 길이는 4입니다.
*/

int lengthOfLIS(List<int> nums) {
  if (nums.isEmpty) return 0;

  List<int> dp = List<int>.filled(nums.length, 1);

  int maxLength = 1;

  for (int i = 1; i < nums.length; i++) {
    for (int j = 0; j < i; j++) {
      if (nums[i] > nums[j]) {
        dp[i] = max(dp[i], dp[j] + 1);
      }
    }
    maxLength = max(maxLength, dp[i]);
  }

  return maxLength;
}

int max(int a, int b) {
  return a > b ? a : b;
}
