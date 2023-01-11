class Generator(BaseGenerator):
    def data(self):
        x = var('x')
        
        # task1
        A1 = randrange(1,13);
        B1 = randrange(1,13)*choice([1,-1]);
        p1_str = choice(["","2"]);
        p1_dict = {"":1,"2":2};
        Z1 = randrange(2,26);

        denom1 = A1*x^3+B1*x^2

        ans1 = p1_dict[p1_str]*Z1/(2*B1);


        # task2
        option = choice(["exp","log"]);

        A2 = randrange(1,13);
        B2 = randrange(1,6)*choice([1,-1]);
        p2 = randrange(2,10);
        d2 = randrange(2,4);
        C2 = randrange(1,13)*choice([1,-1]);
        Z2 = randrange(2,13)*choice([1,-1]);

        arg2 = x^p2+d2^2;

        denom2_dict = {"exp":A2*x^(d2)+B2*x+C2,"log":A2*x^2+B2*x+C2};
        denom2 = denom2_dict[option];

        num2_dict = {"exp": e^x+p2*Z2, "log": str(Z2)+r'\ln\left('+str(arg2)+r'\right)'};
        num2 = num2_dict[option];

        ans2_dict = {"exp":r'\infty',"log":0};
        ans2 = ans2_dict[option];
        


        return {
            "p1": p1_str,
            "Z1": Z1,
            "denom1": denom1,
            "ans1": ans1,
            "denom2": denom2,
            "num2": num2,
            "ans2": ans2,
        }
