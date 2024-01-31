import heapq

class PuzzleNode:
    def __init__(self, state, parent=None, move=None, cost=0):
        self.state, self.parent, self.move, self.cost = state, parent, move, cost
        self.priority = cost + sum(abs(i // 3 - state[i] // 3) + abs(i % 3 - state[i] % 3) for i in range(1, 9))

    def __lt__(self, other):
        return self.priority < other.priority

    def __eq__(self, other):
        return self.state == other.state

    def __hash__(self):
        return hash(str(self.state))

    def get_neighbors(self):
        zero_row, zero_col = divmod(self.state.index(0), 3)
        moves = [(0, 1), (0, -1), (1, 0), (-1, 0)]
        neighbors = []

        for move in moves:
            new_row, new_col = zero_row + move[0], zero_col + move[1]
            if 0 <= new_row < 3 and 0 <= new_col < 3:
                new_state = self.state.copy()
                new_state[zero_row * 3 + zero_col], new_state[new_row * 3 + new_col] = new_state[new_row * 3 + new_col], 0
                neighbors.append(PuzzleNode(new_state, self, move, self.cost + 1))

        return neighbors

def solve_8_puzzle(initial_state):
    goal_state, visited, heap = [0, 1, 2, 3, 4, 5, 6, 7, 8], set(), [PuzzleNode(initial_state)]

    while heap:
        current_node = heapq.heappop(heap)

        if current_node.state == goal_state:
            path = []
            while current_node:
                path.append((current_node.move, current_node.state))
                current_node = current_node.parent
            return path[::-1]

        visited.add(current_node)

        heap.extend(n for n in current_node.get_neighbors() if n not in visited)

    return None

# Example usage:
initial_state = [1, 2, 3, 4, 0, 5, 6, 7, 8]
solution_path = solve_8_puzzle(initial_state)

if solution_path:
    for move, state in solution_path:
        print(f"Move: {move}, State: {state}")
else:
    print("No solution found.")
