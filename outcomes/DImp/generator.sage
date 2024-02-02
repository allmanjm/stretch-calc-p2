class Generator(BaseGenerator):
    def data(self):
        x,y,z = var('x,y,z');

        # task1
        z = function('z')(x);

        a = randrange(1,41)*choice([-1,1]);
        b = randrange(1,10)*choice([-1,1]);
        p = randrange(1,12);
        q = randrange(1,12);

        sce = choice([sin(x*z),cos(x*z),exp(x*z)]);

        lhs = a*sce;
        rhs = b*x^p*z^q;


        sols = solve(diff(lhs-rhs),diff(z));

        # task2
        B = randrange(1,4);
        C = randrange(-3,4);
        x_star = randrange(max(B,C)+1,10);
        y_star = randrange(1,6)*choice([-1,1]);

        A = QQ((x_star-C)*((x_star)^2 - B^2)/(y_star)^2);
        slope = 1/(2*A)*((3*x^2-2*C*x-B^2)/y);
        m2 = 1/(2*A)*((3*x_star^2 - 2*C*x_star - B^2)/y_star);


        return {
            "lhs": lhs.subs(z==y),
            "rhs": rhs.subs(z==y),
            "result": (diff(z).subs(sols[0])).subs(z==y),
            "xstar": x_star,
            "ystar": y_star,
            "A": A,
            "rhs2_factor1": x-C,
            "rhs2_factor2": x^2 - B^2,
            "result2": slope,
            "m2": m2,
        }
