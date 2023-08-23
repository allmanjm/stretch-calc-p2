class Generator(BaseGenerator):
    def data(self):
        t = var('t')
        aa = [randrange(1,11)*choice([-1,1]) for i in range(2)]
        ww = [randrange(1,5) for i in range(2)]
        acc = aa[0]*cos(ww[0]*t)+aa[1]*sin(ww[1]*t)
        v0 = randrange(-10,10)
        s0 = randrange(-10,10)

        F = integrate(acc,t)

        vC = v0-F.subs(t==0)
        v = F + vC

        G = integrate(v,t)

        sC = s0-G.subs(t==0)
        s = G + sC



        return {
            "val1": v0,
            "val2": s0,
            "acc": acc,
            "v": v,
            "s": s,
        }