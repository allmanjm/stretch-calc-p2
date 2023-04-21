class Generator(BaseGenerator):
    def data(self):
        x = var('x')

        # build I1 (needs power rule and adding fractions)
        coeffs=sample(range(-11,12),4);
        powers=[QQ(randrange(9)/randrange(1,4)) for i in range(4)];
        F1=sum([coeffs[i]*x^(powers[i]) for i in range(4)]);
        f1=derivative(F1,x);
        a1=0;
        b1=1;
        ans1=F1.subs(x==1)-F1.subs(x==0);
        
        # build I2 (needs a substitution)
        A=randrange(1,4);
        B=randrange(1,3)^2;
        C=randrange(1,5)*choice([-1,1]);
        p=randrange(1,3);
        F2=C*(A*x^2+B)^(-p);
        f2=derivative(F2,x);
        loi=sample(range(-4,5),2);
        a2help=min(loi);
        b2=max(loi);
        if a2help+b2==0:
            a2=a2help-1;
        else:
            a2=a2help;
        ans2=F2.subs(x==b2)-F2.subs(x==a2)

        

        I1 = [f1,a1,b1,ans1]
        I2 = [f2,a2,b2,ans2]
        
        
        DefInts = sample([I1,I2],2);

        return {
            "a1": DefInts[0][1],
            "b1": DefInts[0][2],
            "int1": DefInts[0][0],
            "a2": DefInts[1][1],
            "b2": DefInts[1][2],
            "int2": DefInts[1][0],
            "ans1": DefInts[0][3],
            "ans2": DefInts[1][3],
        }
