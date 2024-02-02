class Generator(BaseGenerator):
    def data(self):
        x=var("x")

        scenario = choice(["ladder","oilslick","shadow","rocket"])

        #ladder scenario
        if scenario=="ladder":
            ladderlength = randint(10,30)
            distancex = randint(1,ladderlength-2)
            velocityx= randint(1,6)

            distancey=sqrt(ladderlength^2-distancex^2)
            velocityy=-distancex*velocityx/distancey
            velyround=round(velocityy*1.0,2)
            numeratorladder=distancex*velocityx

            return {
                scenario: True,
                "ladderlength": ladderlength,
                "distancex": distancex,
                "velocityx": velocityx,
                "distancey": distancey,
                "numerator": numeratorladder,
                "velyround": velyround,
            }



        #oilslick scenario
        if scenario=="oilslick":
            radiusoil=randint(20, 100)
            dadt=randint(40, 90)
            denomoil=2*pi*radiusoil
            drdtround=round(dadt/denomoil,2)
            return {
                scenario: True,
                "radius": radiusoil,
                "dadt": dadt,
                "denomoil": denomoil,
                "drdtround": drdtround,
            }


        #shadow scenario
        if scenario=="shadow":
            disttolight = randint(2, 10)*5
            disttowall = randint(2, 10)*5
            lighttowall=disttolight+disttowall
            heightperson=round(uniform(4.8,6.5),1)
            personspeed=round(uniform(1,3),1)

            shadowdirection="up"
            persondirection=choice(["light", "wall"])
            if persondirection=="wall":
                shadowdirection="down"

            dHdtround=round(lighttowall*personspeed*heightperson/disttolight^2,2)
    #         numshadow=lighttowall*personspeed
    #         denomshadow=disttolight^2

            return {
                scenario: True,
                "disttolight": disttolight,
                "disttowall": disttowall,
                "heightperson": heightperson,
                "personspeed": personspeed,
                "persondirection": persondirection,
                "shadowdirection": shadowdirection,
                "dHdtround": dHdtround,
    #             "numshadow": numshadow,
    #             "denomshadow": denomshadow,
            }

        #rocket scenario
        if scenario=="rocket":
            h = round((0.24*randrange(46)+3.03)*1000/5280,2)
            X = 13*randrange(21)+73
            dhdt = round(0.02*randrange(36)+0.16,2)

            

            return {
                scenario: True,
                "h": h,
                "X": X,
                "dhdt": dhdt,
                "dThetadt": round(X*dhdt/(h^2+X^2)*180/pi,3),
            }