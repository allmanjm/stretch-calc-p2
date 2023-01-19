class Generator(BaseGenerator):
    def data(self):
        x,y,z = var('x,y,z');
        z = function('z')(x);

        a = randrange(1,41)*choice([-1,1]);
        b = randrange(1,10)*choice([-1,1]);
        p = randrange(1,12);
        q = randrange(1,12);

        sce = choice([sin(x*z),cos(x*z),exp(x*z)]);

        lhs = a*sce;
        rhs = b*x^p*z^q;


        sols = solve(diff(lhs-rhs),diff(z));

        return {
            "lhs": lhs.subs(z==y),
            "rhs": rhs.subs(z==y),
            "result": (diff(z).subs(sols[0])).subs(z==y),
        }
