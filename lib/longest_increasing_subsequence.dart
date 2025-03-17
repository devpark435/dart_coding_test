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
