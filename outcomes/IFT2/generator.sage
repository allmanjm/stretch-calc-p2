class Generator(BaseGenerator):
    def data(self):
        x = var('x')
        
        #polynomial integral from 0 to 1
        poly_coeff = sample(range(-9,10),3);
        poly = sum([QQ(poly_coeff[i]/randrange(1,5))*x^(i+1) for i in range(3)]);
        
        Ipoly = [poly,0,1,integral(poly,x,0,1)];



        #substitution required
        outside(x) = choice([x^choice([3/2,2/3]),exp(x)]);
        p = choice([2,3]);
        inside = x^p + randrange(1,4);
        subf = choice([-1,1])*randrange(1,8)*x^(p-1)*outside(inside);
        a = choice([0,1]);
        b = choice([2,3]);
        Isub = [subf,a,b,integral(subf,x,a,b)];

        
        which_one = sample([Ipoly,Isub],2);



        return {
            "f1": which_one[0][0],
            "a1": which_one[0][1],
            "b1": which_one[0][2],
            "ans1": which_one[0][3],
            "f2": which_one[1][0],
            "a2": which_one[1][1],
            "b2": which_one[1][2],
            "ans2": which_one[1][3],
        }
