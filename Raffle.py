import random
random.seed(749414)

x = ["Cassius"] * 3 + ["Nullfame"] * 2 + ["19Michaelaap"] * 3 + ["Trian"] * 2

random.shuffle(x)

print(x[random.randint(0, len(x))])

# Winner: 19Michaelapp