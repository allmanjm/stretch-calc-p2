class Generator(BaseGenerator):
    def data(self):

        scenario = choice(["fixA","fixV"])
        topQ = choice(["."," with no top."])

        #fixA scenario
        if scenario=="fixA":
            A = 6*randrange(1,25)
            xcrit = sqrt(A/6)
            if topQ==".":
                ycrit = (A-2*xcrit^2)/(4*xcrit)
            else:
                ycrit = (A-2*xcrit^2)/(3*xcrit)

            return {
                scenario: True,
                "A": A,
                "topQ": topQ,
                "Vmax": xcrit^2*ycrit,
            }



        #fixV scenario
        if scenario=="fixV":
            c = randrange(2,10)
            if topQ==".":
                eps=0
            else:
                eps=1
            V0 = c*randrange(1,20)
            return {
                scenario: True,
                "c":c,
                "V0":V0,
                "Amin": (c*V0*(eps+1)^2/(c+1)^2)^(1/3),
            }