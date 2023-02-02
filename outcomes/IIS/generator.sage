class Generator(BaseGenerator):
    def data(self):
        x = var('x');
        a = randrange(1,6)*choice([-1,1]);
        b = randrange(2,10)*choice([-1,1]);
        d = randrange(1,10);
        c = randrange(1,10)*choice([-1,1]);

        power = randrange(2,12);
        z = randrange(2,10);

        f = choice([(x)^power,exp(x),sin(x),cos(x),sec(x)*tan(x),csc(x)*cot(x),1/x]);
        
        if f == sin(x) or f == cos(x) or f == sec(x)*tan(x) or f == csc(x)*cot(x):
            g = choice([x^2+z^2,exp(x),sin(x),cos(x),b*x+c]);
        elif f==(x)^power:
            g = choice([x^2+z^2,c+exp(x),x^d+c,c+sin(x),c+cos(x),c+log(x)]);
        else:
            g = choice([x^2+z^2,exp(x),sin(x),cos(x),b*x+c,arctan(x)]);

        dg = derivative(g,x);

        

        return {
            "integrand": a*dg*(f.subs(x==g)),
            "result": integral(a*f,x).subs(x==g),
        }
