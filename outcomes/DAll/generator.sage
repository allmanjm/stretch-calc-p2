class Generator(BaseGenerator):
    def data(self):
        x = var('x')
        
        
        # task1. Product rule (polynomial times transcendental)
        t1 = choice([sin(x),cos(x),sec(x),csc(x),e^x]);
        p1 = sum([randrange(1,26)*choice([-1,1])*x^i for i in range(3)]);

        # task2. Quotient rule (logistic)
        r = randrange(2,21);
        A = randrange(1,501);
        b = randrange(1,11);
        f2 = A/(b+exp(-x/r));


        # task3. Chain rule (with tricky "outside")
        outside = choice([exp(x),csc(x),log(x)]);
        insides = sample([0,randrange(1,10)*sin(x)*choice([-1,1]),randrange(1,10)*cos(x)*choice([-1,1]),sum([randrange(1,11)*choice([-1,1])*x^j for j in range(3)])],2);
        inside = insides[0]+insides[1];
        
        if outside == exp(x):
            f3 = exp(inside);
            f3str = r'\exp';
        elif outside == csc(x):
            f3 = csc(inside);
            f3str = r'\csc';
        else:
            f3 = log(inside);
            f3str = r'\ln';


        # task4. Product rule + chain rule
        p4 = sum([randrange(1,26)*choice([-1,1])*x^i for i in range(3)]);
        t4 = choice([sin(p4),cos(p4),sec(p4),csc(p4),log(p4),exp(p4)]);
        power = randrange(1,13)*choice([-1,1])*x^(randrange(2,13));


        return {
            "t1": t1,
            "p1": p1,
            "d1": derivative(t1*p1,x),
            "r": r,
            "A": A,
            "b": b,
            "d2": derivative(f2,x),
            "f3str": f3str,
            "inside": inside,
            "d3": derivative(f3,x),
            "t4": t4,
            "power": power,
            "d4": derivative(power*t4,x),
        }
