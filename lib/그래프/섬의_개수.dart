// ===================================================
// 문제: 섬의 개수 (Number of Islands) (그래프/DFS/BFS)
// ===================================================
// 문제 설명:
// '1'(육지)과 '0'(물)로 이루어진 2D 그리드 맵이 주어졌을 때, 섬의 개수를 세는 문제입니다.
// 섬은 사방이 물로 둘러싸인 육지이며, 가로나 세로로 인접한 육지는 같은 섬으로 간주합니다.
//
// 제한 사항:
// - m == grid.length
// - n == grid[i].length
// - 1 <= m, n <= 300
// - grid[i][j]는 '0' 또는 '1'입니다.
//
// 입출력 예시:
// 입력: [
//   ["1", "1", "1", "1", "0"],
//   ["1", "1", "0", "1", "0"],
//   ["1", "1", "0", "0", "0"],
//   ["0", "0", "0", "0", "0"]
// ]
// 출력: 1
//
// 입력: [
//   ["1", "1", "0", "0", "0"],
//   ["1", "1", "0", "0", "0"],
//   ["0", "0", "1", "0", "0"],
//   ["0", "0", "0", "1", "1"]
// ]
// 출력: 3
// ===================================================

// 함수 설명: 주어진 그리드에서 섬의 개수를 계산합니다.
// grid: 2D 그리드 맵
int numIslands(List<List<String>> grid) {
  if (grid.isEmpty || grid[0].isEmpty) return 0;

  int rows = grid.length;
  int cols = grid[0].length;
  int islands = 0;

  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      if (grid[i][j] == "1") {
        islands++; // 새로운 섬 발견
        dfs(grid, i, j, rows, cols); // DFS로 연결된 모든 육지 방문
      }
    }
  }

  return islands;
}

// DFS를 사용하여 현재 위치에서 연결된 모든 육지를 방문 표시
void dfs(List<List<String>> grid, int i, int j, int rows, int cols) {
  // 그리드 범위를 벗어나거나 물이거나 이미 방문한 경우 종료
  if (i < 0 || i >= rows || j < 0 || j >= cols || grid[i][j] != "1") {
    return;
  }

  // 현재 위치를 방문 표시 (물로 변경)
  grid[i][j] = "0";

  // 상하좌우 네 방향 탐색
  dfs(grid, i + 1, j, rows, cols);
  dfs(grid, i - 1, j, rows, cols);
  dfs(grid, i, j + 1, rows, cols);
  dfs(grid, i, j - 1, rows, cols);
}

// 사용 예시
void main() {
  List<List<String>> grid1 = [
    ["1", "1", "1", "1", "0"],
    ["1", "1", "0", "1", "0"],
    ["1", "1", "0", "0", "0"],
    ["0", "0", "0", "0", "0"],
  ];

  List<List<String>> grid2 = [
    ["1", "1", "0", "0", "0"],
    ["1", "1", "0", "0", "0"],
    ["0", "0", "1", "0", "0"],
    ["0", "0", "0", "1", "1"],
  ];

  print("섬의 개수: ${numIslands(grid1)}"); // 1
  print("섬의 개수: ${numIslands(grid2)}"); // 3
}
