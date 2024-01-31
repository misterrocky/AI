from collections import deque

class State:
    def __init__(self, jug1, jug2, parent=None):
        self.jug1 = jug1
        self.jug2 = jug2
        self.parent = parent

    def __eq__(self, other):
        return self.jug1 == other.jug1 and self.jug2 == other.jug2

    def __hash__(self):
        return hash((self.jug1, self.jug2))

def water_jug_problem(capacity_jug1, capacity_jug2, target):
    initial_state = State(0, 0)
    visited = set()
    queue = deque([initial_state])

    while queue:
        current_state = queue.popleft()

        # Check if the target amount of water is reached
        if current_state.jug1 == target or current_state.jug2 == target:
            return current_state

        # Generate next possible states
        next_states = set()

        # Fill jug1
        next_states.add(State(capacity_jug1, current_state.jug2, current_state))

        # Fill jug2
        next_states.add(State(current_state.jug1, capacity_jug2, current_state))

        # Empty jug1
        next_states.add(State(0, current_state.jug2, current_state))

        # Empty jug2
        next_states.add(State(current_state.jug1, 0, current_state))

        # Pour water from jug1 to jug2
        pour_amount = min(current_state.jug1, capacity_jug2 - current_state.jug2)
        next_states.add(State(current_state.jug1 - pour_amount, current_state.jug2 + pour_amount, current_state))

        # Pour water from jug2 to jug1
        pour_amount = min(current_state.jug2, capacity_jug1 - current_state.jug1)
        next_states.add(State(current_state.jug1 + pour_amount, current_state.jug2 - pour_amount, current_state))

        # Add valid next states to the queue
        for state in next_states:
            if state not in visited:
                visited.add(state)
                queue.append(state)

    return None  # No solution found

def extract_solution_sequence(solution_state):
    sequence = []
    while solution_state:
        sequence.append((solution_state.jug1, solution_state.jug2))
        solution_state = solution_state.parent
    return sequence[::-1]

def print_solution(sequence):
    if sequence:
        print("Solution found:")
        for step, (jug1, jug2) in enumerate(sequence):
            print(f"Step {step + 1}: Jug 1: {jug1}, Jug 2: {jug2}")
    else:
        print("No solution found.")

if __name__ == "__main__":
    capacity_jug1 = 4
    capacity_jug2 = 3
    target_amount = 2

    solution_state = water_jug_problem(capacity_jug1, capacity_jug2, target_amount)
    solution_sequence = extract_solution_sequence(solution_state)
    print_solution(solution_sequence)
