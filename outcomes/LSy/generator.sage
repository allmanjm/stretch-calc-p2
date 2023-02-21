class Generator(BaseGenerator):
    def data(self):
        x = var('x');

        # continuous problem
        roots = sample(range(-10,9),4);
        cont_f = expand((x-roots[0])*(x-roots[1]))/expand((x-roots[2])*(x-roots[3]));
        cont_a = choice([t for t in range(-10,9) if t!=roots[2] and t!=roots[3]]);
        cont_L = cont_f.subs(x==cont_a);
        cont_tuple = (cont_f,cont_a,cont_L);

        # L'Hospital 1
        r1 = randrange(1,9)*choice([-1,1]);
        r2 = randrange(1,9)*choice([-1,1]);
        lh1_a = choice([t for t in range(-10,9) if t!=r1 and t!=r2]);
        lh1_f = expand((x-r1)*(x-lh1_a))/expand((x-r2)*(x-lh1_a));
        lh1_L = ((x-r1)/(x-r2)).subs(x==lh1_a);
        lh1_tuple = (lh1_f,lh1_a,lh1_L);

        # L'Hospital 2
        p = randrange(4);
        transc = sample([ln(x^2+1),arctan(x),sin(x),tan(x)],2)
        numer = x^p*transc[0];
        denom = transc[1];
        lh2_f = numer/denom;
        lh2_a = 0;
        lh2_Lhelp = limit(lh2_f,x=0);
        if lh2_Lhelp == Infinity:
            lh2_L = r'\text{DNE}';
        else:
            lh2_L = lh2_Lhelp;
        lh2_tuple = (lh2_f,lh2_a,lh2_L);

        # infinity example
        other = choice([x^(randrange(1,4)),log(x),arctan(x)]);
        er = randrange(1,10);
        inf_f = exp(-er*x)*other;
        inf_a = Infinity;
        inf_L = 0;
        inf_tuple = (inf_f,inf_a,inf_L);

        # select 3 of these in a random order
        probs = sample([cont_tuple,choice([lh1_tuple,lh2_tuple]),inf_tuple],3)

        return {
            "f1": probs[0][0],
            "a1": probs[0][1],
            "L1": probs[0][2],
            "f2": probs[1][0],
            "a2": probs[1][1],
            "L2": probs[1][2],
            "f3": probs[2][0],
            "a3": probs[2][1],
            "L3": probs[2][2],
        }
