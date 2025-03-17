// ===================================================
// 문제: 괄호 검사기 (스택)
// ===================================================
// 문제 설명:
// 괄호로만 이루어진 문자열이 주어졌을 때, 해당 문자열이 유효한지 판단하세요.
// 유효한 괄호는 다음 규칙을 따릅니다:
// 1. 열린 괄호는 같은 종류의 괄호로 닫혀야 합니다.
// 2. 열린 괄호는 올바른 순서로 닫혀야 합니다.
//
// 제한 사항:
// - 입력 문자열의 길이는 1 이상 10,000 이하입니다.
// - 입력 문자열은 '(', ')', '{', '}', '[', ']' 문자로만 구성됩니다.
//
// 입출력 예시:
// 입력: "()"
// 출력: true
//
// 입력: "()[]{}"
// 출력: true
//
// 입력: "(]"
// 출력: false
//
// 입력: "([)]"
// 출력: false
//
// 입력: "{[]}"
// 출력: true
// ===================================================

// 함수 설명: 괄호 문자열이 유효한지 검사합니다.
// s: 괄호로 이루어진 문자열
// 반환값: 유효한 괄호면 true, 아니면 false
bool isValidParentheses(String s) {
  // 괄호 쌍을 매칭하기 위한 맵 생성
  final Map<String, String> bracketPairs = {')': '(', '}': '{', ']': '['};

  // 스택 생성
  List<String> stack = [];

  for (var i = 0; i < s.length; i++) {
    String char = s[i];

    if (bracketPairs.containsKey(char)) {
      // 스택이 비어있거나 최상단 괄호가 짝이 맞지 않으면 false
      if (stack.isEmpty || stack.last != bracketPairs[char]) {
        return false;
      }
      // 짝이 맞으면 스택에서 제거
      stack.removeLast();
    }
    // 여는 괄호인 경우 스택에 추가
    else {
      stack.add(char);
    }
  }

  // 모든 처리 후 스택이 비어있으면 모든 괄호가 올바르게 짝지어진 것
  return stack.isEmpty;
}

// 테스트 코드
void main() {
  print(isValidParentheses("()")); // true
  print(isValidParentheses("()[]{}")); // true
  print(isValidParentheses("(]")); // false
  print(isValidParentheses("([)]")); // false
  print(isValidParentheses("{[]}")); // true
}
