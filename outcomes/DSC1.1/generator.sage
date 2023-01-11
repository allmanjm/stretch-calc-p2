class Generator(BaseGenerator):
    def data(self):
        x = var('x')
        b = randrange(1,10)*choice([-1,1]);
        r = randrange(2,6)*choice([-1,1]);
        a = choice([t for t in range(-11,12) if t!=0 and t!=b*r and t!=2-b*r and t!=(b*r-2)/(b*r-1)]);

        coeff1 = (b*r^2+a*r-2*r)/r^2;
        coeff0 = (a*b*r-b*r-a+2)/r^2;
        poly = x^2 + coeff1*x + coeff0; #conditions on choice of "a" guarantee that coeff1!=0 and coeff2!=0

        cp1 = -a/r;
        cp2 = -b; # conditions on choice of "a" guarantee cp1 != cp2

        


        return {
            "poly": poly,
            "exponent": r*x,
            "cp1": cp1,
            "cp2": cp2,
            "deriv": derivative( poly*exp(r*x),x ),
        }

    @provide_data
    def graphics(data):

        g(x) = data["deriv"]

        tm = sorted([data["cp1"],data["cp2"]]);
        d = tm[1]-tm[0];
        m = tm[0]-d;
        M = tm[1]+d;
        eps = 3*d/120;

        testpts = [(m + tm[0])/2, (tm[0]+tm[1])/2, (tm[1]+M)/2];

        pos_pts = []
        neg_pts = []

        for t in testpts:
            if g(t)>0:
                pos_pts += [(t,0.75*eps)]
            else:
                neg_pts += [(t,0.75*eps)]

        return {
            "Show": plot(0, (m,M), ticks = [tm,[]], ymin = -eps, ymax = eps, aspect_ratio = 1) + point(pos_pts, size = 35, marker = "$+$")+point(neg_pts, size = 35, marker = "$-$")+point((M,0), size = 50, marker = ">")+point((m,0),size = 50, marker = "<"),
        }


