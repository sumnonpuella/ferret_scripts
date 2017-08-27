      program test
        real invtk,is,is2
        real k0,k1,k2,kw,kb,ks,kf,k1p,k2p,k3p,ksi
        
      t=25.
      s=35.
      ocnpres=300.

        tk = 273.15 + t
        tk100 = tk/100.0
        tk1002=tk100*tk100
        invtk=1.0/tk
        dlogtk=log(tk)
        is=19.924*s/(1000.-1.005*s)
        is2=is*is
        sqrtis=sqrt(is)
        s2=s*s
        sqrts=sqrt(s)
        s15=s**1.5
        scl=s/1.80655

      kb=exp((-8966.90 - 2890.53*sqrts - 77.942*s +
     &                1.728*s15 - 0.0996*s2)*invtk +
     &                (148.0248 + 137.1942*sqrts + 1.62142*s) +
     &                (-24.4344 - 25.085*sqrts - 0.2474*s) *
     &                dlogtk + 0.053105*sqrts*tk)

        R = 83.131
      t2 = t*t
      dvb = -29.48 + 0.1622*t + 2.608e-3*t2
      dkb = -2.84e-3
      kb = kb*exp((-dvb*ocnpres+0.5*dkb*ocnpress**2)/(R*tk))
      print*,-log10(kb)
      end
