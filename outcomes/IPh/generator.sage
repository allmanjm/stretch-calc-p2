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

        if abs(-vC/a)>1:
            ans2 = "does not exist"
        elif f==sin(t):
            tstar=t.subs(solve(v==0,t)[0])
            ans2 = "is approximately "+str(round(tstar,2))
        else:
            tstar=t.subs(solve(v==0,t)[0])
            if round(tstar,2)<0:
                ans2 = "is approximately "+str(round(tstar+pi,2))
            else:
                ans2 = "is approximately "+str(round(tstar,2))



        return {
            "val1": v0,
            "val2": s0,
            "acc": acc,
            "v": v,
            "s": s,
            "ans2": ans2,
        }
