class Generator(BaseGenerator):
    def data(self):
        x,t,h = var('x,t,h')

        # task1
        v1 = choice([x,t,h]);
        L1_num = sin(v1);
        L1 = 1;

        v2 = choice([x,t,h]);
        L2_num = choice([cos(v2)-1,1-cos(v2)]);
        L2 = 0;


        # task2
        b = choice([w/5 for w in range(1,101) if w % 5 != 0]);
        v3 = choice([x,t,h]);
        L3 = round(n(log(b)),3);



        return {
            "v1": v1,
            "v2": v2,
            "v3": v3,
            "L1_num": L1_num,
            "L2_num": L2_num,
            "b": b,
            "L1": L1,
            "L2": L2,
            "L3": L3,
        }
