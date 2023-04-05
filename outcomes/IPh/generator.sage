class Generator(BaseGenerator):
    def data(self):
        t = var('t')
        a = randrange(1,11)*choice([-1,1])
        f = choice([cos(t),sin(t)])
        v0 = randrange(-10,10)
        s0 = randrange(-10,10)
        acc = a*f

        F = integrate(acc,t)

        vC = v0-F.subs(t==0)
        v = F + vC

        G = integrate(v,t)

        sC = s0-G.subs(t==0)
        s = G + sC

        if f==cos(t):
            disc = -vC/a
        else:
            disc = -vC/(-a)

        if abs(disc)>1:
            ans2 = "does not exist"
        elif disc==0 and f==cos(t):
            ans2 = "is approximately " + str(round(pi,2))
        elif disc==0 and f==sin(t):
            ans2 = "is approximately " + str(round(pi/2,2))
        else:
            if disc<0 and f==cos(t):
                ans2="is approximately " + str(round((v==0).find_root(pi,3*pi/2),2))
            elif disc<0 and f==sin(t):
                ans2="is approximately " + str(round((v==0).find_root(pi/2,pi),2))
            else:
                ans2="is approximately " + str(round((v==0).find_root(0,pi/2),2))
            



        return {
            "val1": v0,
            "val2": s0,
            "acc": acc,
            "v": v,
            "s": s,
            "ans2": ans2,
        }
