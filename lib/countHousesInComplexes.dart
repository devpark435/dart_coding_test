// ===================================================
// 문제: 단지 번호 붙이기 (BFS/DFS)
// ===================================================
// 문제 설명:
// N×N 크기의 지도가 있습니다. 지도는 1(집이 있는 곳)과 0(집이 없는 곳)으로 이루어져 있습니다.
// 이 지도에서 연결된 집들의 모임을 단지라고 부릅니다. 연결되었다는 것은 어떤 집이 상하좌우로 다른 집과
// 붙어있는 경우를 말합니다. 지도가 주어질 때, 단지 수와 각 단지에 속하는 집의 수를 오름차순으로 정렬하여 반환하세요.
//
// 제한 사항:
// - 지도의 크기 N (5 ≤ N ≤ 25)
// - 지도는 N개의 줄에 N개의 정수(0 또는 1)로 이루어져 있습니다.
//
// 입출력 예시:
// 입력:
// [
//   [0, 1, 1, 0, 1, 0, 0],
//   [0, 1, 1, 0, 1, 0, 1],
//   [1, 1, 1, 0, 1, 0, 1],
//   [0, 0, 0, 0, 1, 1, 1],
//   [0, 1, 0, 0, 0, 0, 0],
//   [0, 1, 1, 1, 1, 1, 0],
//   [0, 1, 1, 1, 0, 0, 0]
// ]
//
// 출력: [7, 8, 9]
// 설명: 총 3개의 단지가 있으며, 각 단지 내 집의 수는 7, 8, 9개입니다.
// ===================================================

// 함수 설명: 지도 정보를 입력받아 단지 수와 각 단지 내 집의 수를 반환합니다.
// map: N x N 크기의 지도 (0: 집이 없는 곳, 1: 집이 있는 곳)
// 반환값: 단지별 집의 수가 담긴 리스트 (오름차순 정렬됨)
List<int> countHousesInComplexes(List<List<int>> map) {
  final int n = map.length;
  // 방문 여부를 체크하기 위한 2차원 배열
  List<List<bool>> visited = List.generate(n, (_) => List.filled(n, false));

  // 상하좌우 이동을 위한 방향 벡터
  final dx = [-1, 1, 0, 0]; // 상, 하, 좌, 우
  final dy = [0, 0, -1, 1];

  // 각 단지의 집 수를 저장할 리스트
  List<int> complexSizes = [];

  // DFS 함수 정의
  int dfs(int x, int y) {
    // 지도 범위를 벗어나면 0 반환
    if (x < 0 || x >= n || y < 0 || y >= n) {
      return 0;
    }

    // 이미 방문했거나 집이 없는 곳이면 0 반환
    if (visited[x][y] || map[x][y] == 0) {
      return 0;
    }

    // 현재 위치 방문 처리
    visited[x][y] = true;

    // 현재 집을 포함하여 1로 시작
    int count = 1;

    // 상하좌우 탐색
    for (int i = 0; i < 4; i++) {
      int nx = x + dx[i];
      int ny = y + dy[i];
      // 재귀적으로 연결된 집들을 탐색하여 개수를 더함
      count += dfs(nx, ny);
    }

    return count;
  }

  // 모든 위치를 순회하며 방문하지 않은 집을 찾아 DFS 실행
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      if (map[i][j] == 1 && !visited[i][j]) {
        // 새로운 단지 발견 시 DFS로 크기 계산 후 리스트에 추가
        int complexSize = dfs(i, j);
        complexSizes.add(complexSize);
      }
    }
  }

  // 단지 크기를 오름차순으로 정렬
  complexSizes.sort();

  return complexSizes;
}

// 테스트 코드
void main() {
  final map = [
    [0, 1, 1, 0, 1, 0, 0],
    [0, 1, 1, 0, 1, 0, 1],
    [1, 1, 1, 0, 1, 0, 1],
    [0, 0, 0, 0, 1, 1, 1],
    [0, 1, 0, 0, 0, 0, 0],
    [0, 1, 1, 1, 1, 1, 0],
    [0, 1, 1, 1, 0, 0, 0],
  ];

  print(countHousesInComplexes(map)); // 예상 출력: [7, 8, 9]
}
