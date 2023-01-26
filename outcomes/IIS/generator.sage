class Generator(BaseGenerator):
    def data(self):
        x = var('x');
        a = randrange(1,41)*choice([-1,1]);
        b = randrange(1,10)*choice([-1,1]);
        c = randrange(-9,10);

        power = randrange(2,12);
        z = randrange(2,10);

        f = choice([(x)^power,exp(x),sin(x),cos(x),sec(x)*tan(x),csc(x)*cot(x),1/x]);
        g = choice([x^2+z^2,exp(x),sin(x),cos(x),b*x+c,arctan(x)]);

        dg = derivative(g,x);

        

        return {
            "integrand": a*dg*(f.subs(x==g)),
            "result": integral(a*f,x).subs(x==g),
        }
