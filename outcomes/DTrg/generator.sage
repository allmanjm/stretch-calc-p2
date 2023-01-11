class Generator(BaseGenerator):
    def data(self):
        x = var('x')
        
        f = choice([tan(x),cot(x),sec(x),csc(x)]);
        
        if f==tan(x):
            df = r'\sec^2(x)';
        elif f==cot(x):
            df = r'-\csc^2(x)';
        elif f==sec(x):
            df = r'\sec(x)\tan(x)';
        else:
            df = r'-\csc(x)\cot(x)';


        return {
            "f": f,
            "df": df,
        }
