class Generator(BaseGenerator):
    def data(self):
        x,t,u,v = var('x,t,u,v')
        
        # Task1
        v1 = choice([x,t,u,v]);
        coeffs1 = sample(range(-15,16),4);
        exponents1 = sample([e for e in range(-8,9) if e!=-1],4);
        poly1 = sum(coeffs1[i]*v1^(exponents1[i]) for i in range(4));

        # Task2
        v2 = choice([x,t,u,v]);
        root_options = sample(range(2,6),2);
        ratl_options = sample([t for t in [2,3,5,7,11,13,17] if t!=root_options[0] and t!=root_options[1]],2);
        exponent2 = choice([1,-1])*ratl_options[0]/ratl_options[1];
        coeffs2 = sample([a for a in range(-15,16) if a!=0],3);
        
        f2_alg = coeffs2[0]*v2^(1/root_options[0])+coeffs2[1]*v2^(1/root_options[1]) + coeffs2[2]*v2^exponent2;
        F2_alg = integral(f2_alg,v2);

        trans_deriv_options = sample([1/v2,1/(v2^2+1),cos(v2),-sin(v2),sec(v2)*tan(v2),-csc(v2)*cot(v2)],2)

        A = randrange(1,31)*choice([-1,1]);
        B = randrange(1,31)*choice([-1,1]);

        f2_trans_sage = A*trans_deriv_options[0]+B*trans_deriv_options[1];
        F2_trans_sage = integral(f2_trans_sage,v2);

        


        return {
            "v1": v1,
            "poly1": poly1,
            "int1": integral(poly1,v1),
            "v2": v2,
            "deriv2": f2_alg + f2_trans_sage,
            "int2": F2_alg + F2_trans_sage,
        }
