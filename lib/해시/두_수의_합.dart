// ===================================================
// 문제: 두 수의 합 (해시)
// ===================================================
// 문제 설명:
// 정수 배열 nums와 정수 target이 주어집니다.
// nums에서 두 수를 더해서 target이 되는 두 수의 인덱스를 반환하세요.
// 각 입력에 정확히 하나의 솔루션이 있다고 가정하며, 같은 요소를 두 번 사용할 수 없습니다.
//
// 제한 사항:
// - 2 <= nums.length <= 10^4
// - -10^9 <= nums[i] <= 10^9
// - -10^9 <= target <= 10^9
// - 정확히 하나의 유효한 답이 존재합니다.
//
// 입출력 예시:
// 입력: nums = [2, 7, 11, 15], target = 9
// 출력: [0, 1] (nums[0] + nums[1] = 2 + 7 = 9)
//
// 입력: nums = [3, 2, 4], target = 6
// 출력: [1, 2] (nums[1] + nums[2] = 2 + 4 = 6)
//
// 입력: nums = [3, 3], target = 6
// 출력: [0, 1] (nums[0] + nums[1] = 3 + 3 = 6)
// ===================================================

// 함수 설명: 두 수의 합이 target이 되는 두 수의 인덱스를 찾습니다.
// nums: 정수 배열
// target: 목표 합
// 반환값: 두 수의 인덱스를 담은 배열
List<int> twoSum(List<int> nums, int target) {
  // 값과 인덱스를 저장할 해시맵
  Map<int, int> numMap = {};

  for (int i = 0; i < nums.length; i++) {
    int complement = target - nums[i];

    if (numMap.containsKey(complement)) {
      return [numMap[complement]!, i];
    }

    numMap[nums[i]] = i;
  }

  return []; // 해답이 없는 경우 (문제 조건에 따르면 발생하지 않음)
}

// 테스트 코드
void main() {
  print(twoSum([2, 7, 11, 15], 9)); // [0, 1]
  print(twoSum([3, 2, 4], 6)); // [1, 2]
  print(twoSum([3, 3], 6)); // [0, 1]
}
