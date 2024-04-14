class Generator(BaseGenerator):
    def data(self):
        x,t = var('x,t')

        # build I1 
        a1=randrange(-15,15);
        f1(t) = choice([cos(randrange(1,7)*t),sin(randrange(1,7)*t),arctan(randrange(1,7)*t),(t^randrange(1,5)+randrange(1,8))^randrange(2,5),e^(choice([-1,1])*randrange(2,9)*t)]);
        
        # build I2
        a2=randrange(-15,15);
        f2(t) = choice([cos(randrange(1,7)*t),sin(randrange(1,7)*t),arctan(randrange(1,7)*t),(t^randrange(1,5)+randrange(1,8))^randrange(2,5),e^(choice([-1,1])*randrange(2,9)*t)]);
        g2(x) = choice([cos(x),sin(x),e^x,x^2+randrange(-5,5)*x+randrange(-5,5),arctan(x)])

        #build I3
        b3=randrange(-15,15);
        f3(t) = choice([cos(randrange(1,7)*t),sin(randrange(1,7)*t),arctan(randrange(1,7)*t),(t^randrange(1,5)+randrange(1,8))^randrange(2,5),e^(choice([-1,1])*randrange(2,9)*t)]);
        g3(x) = choice([cos(x),sin(x),e^x,x^2+randrange(-5,5)*x+randrange(-5,5),arctan(x)])

        #build I4
        f4(t) = choice([cos(randrange(1,7)*t),sin(randrange(1,7)*t),arctan(randrange(1,7)*t),(t^randrange(1,5)+randrange(1,8))^randrange(2,5),e^(choice([-1,1])*randrange(2,9)*t)]);
        g4_list = sample([cos(x),sin(x),e^x,x^2+randrange(-5,5)*x+randrange(-5,5),arctan(x)],2);


        
        
        return {
            "a1": a1,
            "b1": x,
            "int1": f1(t),
            "ans1": f1(x),
            "a2": a2,
            "b2": g2(x),
            "int2": f2(t),
            "ans2": derivative(g2(x),x)*f2(g2(x)),
            "a3": g3(x),
            "b3": b3,
            "int3": f3(t),
            "ans3": -derivative(g3(x),x)*f3(g3(x)),
            "a4": g4_list[0],
            "b4": g4_list[1],
            "int4": f4(t),
            "ans4": derivative(g4_list[1],x)*f4(g4_list[1])-derivative(g4_list[0],x)*f4(g4_list[0]),
        }
