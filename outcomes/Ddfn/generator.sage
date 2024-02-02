class Generator(BaseGenerator):
    def data(self):
        x,h = var('x,h')

        # task1
        a = randrange(1,51);
        pi_opt = choice([1,pi])*choice([1,-1]);
        f = a*pi_opt*choice([sin(x),cos(x)]);

        L2 = 0;


        # task2
        b = choice([w/5 for w in range(1,101) if w % 5 != 0]);
        a2 = randrange(1,51);

        return {
            "L1_num": sin(h),
            "L1": 1,
            "L2_num": choice([cos(h)-1,1-cos(h)]),
            "L2": 0,
            "f": f,
            "df": derivative(f,x),
            "b": b,
            "L3": round(n(log(b)),3),
            "g": a2*e^x,
            "dg": a2*e^x,
        }
