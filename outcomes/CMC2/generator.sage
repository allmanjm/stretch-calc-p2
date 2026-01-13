class Generator(BaseGenerator):
    def data(self):
        x = var('x')

        #poly * exp function
        b = randrange(1,10)*choice([-1,1]);
        r = randrange(2,6)*choice([-1,1]);
        a = choice([t for t in range(-11,12) if t!=0 and t!=b*r and t!=2-b*r and t!=(b*r-2)/(b*r-1)]);

        coeff1 = (b*r^2+a*r-2*r)/r^2;
        coeff0 = (a*b*r-b*r-a+2)/r^2;
        poly = x^2 + coeff1*x + coeff0; #conditions on choice of "a" guarantee that coeff1!=0 and coeff2!=0

        cp1 = -a/r;
        cp2 = -b; # conditions on choice of "a" guarantee cp1 != cp2

        # for a root-y function
        s = sample([3,5,7,11],2)
        n = s[0]
        m = choice([2,s[1],s[1]])
        q = randrange(1,5)*choice([-1,1])

        p = q*(n+m)

        f(x) = x^((m+n)/n)-p*x^(m/n)
        f_prime(x) = derivative(f(x),x)

        ticks2 = sorted([0,q*m])
        df = abs(q*m)
        m2 = ticks2[0]-df
        M2 = ticks2[1]+df
        feps = 3*df/120

        if q>0:
            if (m-n)%2==0:
                pos_x2 = [q*m+df/2]
                neg_x2 = [-df/2,q*m/2]
            else: # so (m-n) is odd
                pos_x2 = [-df/2,q*m+df/2]
                neg_x2 = [q*m/2]
        else: # so q<0
            if (m-n)%2==0:
                pos_x2 = [q*m/2 , df/2]
                neg_x2 = [q*m-df/2]
            else: # so (m-n) is odd
                pos_x2 = [q*m-df/2, df/2]
                neg_x2 = [q*m/2]
        
        pos_pts2 = [(x,0.75*feps) for x in pos_x2]
        neg_pts2 = [(x,0.75*feps) for x in neg_x2]


        return {
            "poly": poly,
            "exponent": r*x,
            "cp1": cp1,
            "cp2": cp2,
            "deriv": factor(derivative( poly*exp(r*x),x )),

            "f": f(x),
            "f_prime": factor(f_prime(x)),
            "tm2": ticks2,
            "feps": feps,
            "pp2": pos_pts2,
            "np2": neg_pts2,
            "m2": m2,
            "M2": M2,
        }

    @provide_data
    def graphics(data):

        f1(x) = data["deriv"]

        tm = sorted([data["cp1"],data["cp2"]]);
        d = tm[1]-tm[0];
        m = tm[0]-d;
        M = tm[1]+d;
        eps = 3*d/120;

        testpts = [(m + tm[0])/2, (tm[0]+tm[1])/2, (tm[1]+M)/2];

        pos_pts = []
        neg_pts = []

        for t in testpts:
            if f1(t)>0:
                pos_pts += [(t,0.75*eps)]
            else:
                neg_pts += [(t,0.75*eps)]

        return {
            "Show1": plot(0, (m,M), ticks = [tm,[]], ymin = -eps, ymax = eps, aspect_ratio = 1) + point(pos_pts, size = 35, marker = "$+$")+point(neg_pts, size = 35, marker = "$-$")+point((M,0), size = 50, marker = ">")+point((m,0),size = 50, marker = "<"),
            "Show2": plot(0, (data["m2"],data["M2"]), ticks = [data["tm2"],[]], ymin = -1.2*data["feps"], ymax = 1.2*data["feps"], aspect_ratio = 1) + point(data["pp2"], size = 35, marker = "$+$")+point(data["np2"], size = 35, marker = "$-$")+point((data["m2"],0), size = 50, marker = "<")+point((data["M2"],0), size = 50, marker = ">"),
        }


