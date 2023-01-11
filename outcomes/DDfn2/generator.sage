class Generator(BaseGenerator):
    def data(self):
        x = var('x')
        a = randrange(1,51);
        pi_opt = choice([1,pi])*choice([1,-1]);
        f = a*pi_opt*choice([sin(x),cos(x)]);

        return {
            "f": f,
            "df": derivative(f,x),
        }
