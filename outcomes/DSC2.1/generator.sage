class Generator(BaseGenerator):
    def data(self):
        x = var('x')
        a = randrange(1,100)*choice([-1,1]);
        b = randrange(1,20)*choice([-2,2]);
        num = choice(["s","c"]);
        den = choice(["s","c"]);
        trig_dict = {"s":sin(x),"c":cos(x)};

        top_math = trig_dict[num];
        den_math = trig_dict[den]+b;

        uc = [0,pi/2,pi,3*pi/2,2*pi];

        v_minus = b/2 - sqrt(b^2+8)/2;
        v_plus = b/2 + sqrt(b^2+8)/2;

        if b>0:
            v = v_minus;
        else:
            v = v_plus;

        if num != den:
            if num == "s":
                tm = [n(pi)];
            else:
                tm = [n(pi/2),n(3*pi/2)];
        elif num == "c":
            ref1 = arccos(v);
            ref2 = 2*pi-arccos(v);
            tm = sorted([n(ref1),n(ref2)]);
        else:
            if n(arcsin(v))>0:
                ref1 = arcsin(v);
            else:
                ref1 = 2*pi+arcsin(v);
            ref2 = pi-arcsin(v);
            tm = sorted([n(ref1),n(ref2)])

        return {
            "a": a,
            "num_math": trig_dict[num],
            "den_math": trig_dict[den]+b,
            "D2": derivative(a*trig_dict[num]/(trig_dict[den]+b),x,2),
            "tm": tm,
        }
    
    @provide_data
    def graphics(data):

        
        m = 0;
        M = n(2*pi);

        test_pts = [(m+data["tm"][0])/2];
        i=1;
        while i<len(data["tm"]):
            test_pts += [(data["tm"][i-1]+data["tm"][i])/2]
            i += 1

        test_pts += [(data["tm"][-1]+M)/2];

        d = M-m;
        eps = 3*d/120;

        pos_pts = [];
        neg_pts = [];

        f(x) = data["D2"];

        for t in test_pts:
            if f(t)>0:
                pos_pts += [(t,0.75*eps)]
            else:
                neg_pts += [(t,0.75*eps)]

        return {
            "Show": plot(0, (m,M), ticks = [data["tm"],[]], ymin = -1.2*eps, ymax = 1.2*eps, aspect_ratio = 1) + point(pos_pts, size = 35, marker = "$+$")+point(neg_pts, size = 35, marker = "$-$")+point((M,0), size = 35)+point((m,0), size = 35),
        }
