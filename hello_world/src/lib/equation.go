package lib

func SolveEqua2(a, b, c float64) (string, map[string]float64) {
	if a == 0 {
		desc, result := solveEqua1(b, c)
		r := map[string]float64{}
		r["x"] = result
		return desc, r
	}

	delta := b*b - 4*a*c

	if delta < 0 {
		return "PT vo nghiem", nil
	} else if delta == 0 {
		return "PT co nghiem kep", map[string]float64{"x1": -b / (2 * a), "x2": -b / (2 * a)}
	} else {

	}

	return "", nil
}

func solveEqua1(a, b float64) (string, float64) {
	if a != 0 {
		return "PT co 1 nghiem", -b / a
	} else if b != 0 {
		return "PT vo nghiem", 0
	} else {
		return "PT vo so nghiem", 0
	}
}
