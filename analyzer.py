import subprocess

def run_clingo(puzzle):
    result = subprocess.run(['clingo', puzzle, 'program.lp', '--stats'], capture_output=True, text=True)
    output = result.stdout

    return output


def analyze_output(output):
    lines = output.split('\n')
    stats = {}
    for line in lines:
        if "CPU Time" in line:
            stats["time"] = float((line.split(":")[1].strip()).split("s")[0])
        elif "Rules" in line:
            stats["rules"] = int((line.split(":")[1].strip()).split(" ")[0])
        elif "Atoms" in line:
            stats["atoms"] = int((line.split(":")[1].strip()).split(" ")[0])

    stats["size"] = stats["rules"] + stats["atoms"]        

    return stats

def classify_puzzle(stats):
    if stats["time"] < 1 and stats["atoms"] < 3000:
        return "Very easy"
    elif stats["time"] < 2:
        return "Easy"
    elif stats["atoms"] < 6000:
        return "Medium"
    elif stats["atoms"] < 10000:
        return "Hard"
    else:
        return "Harder"

def analyze_puzzles(puzzles):
    results = []
    for puzzle in puzzles:
        output = run_clingo(puzzle)
        stats = analyze_output(output)
        difficulty = classify_puzzle(stats)
        results.append((puzzle, stats, difficulty))

    return results


if __name__ == "__main__":
    puzzles  = ["program.db"]
    puzzles_results = analyze_puzzles(puzzles)
    print(puzzles_results)
