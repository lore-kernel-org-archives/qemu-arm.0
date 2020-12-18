Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id d191sm11790680wmd.24.2020.12.18.07.19.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Dec 2020 07:19:48 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 2E9CE1FF7E;
	Fri, 18 Dec 2020 15:19:47 +0000 (GMT)
References: <20201218112707.28348-1-alex.bennee@linaro.org>
 <20201218112707.28348-10-alex.bennee@linaro.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, Luis Machado
 <luis.machado@linaro.org>, Peter Maydell <peter.maydell@linaro.org>, "open
 list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Subject: Re: [PATCH  v2 9/9] target/arm: use official
 org.gnu.gdb.aarch64.sve layout for registers
Date: Fri, 18 Dec 2020 15:17:26 +0000
In-reply-to: <20201218112707.28348-10-alex.bennee@linaro.org>
Message-ID: <87k0tfqgz0.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: AIUS4cUuZDp9


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> While GDB can work with any XML description given to it there is
> special handling for SVE registers on the GDB side which makes the
> users life a little better. The changes aren't that major and all the
> registers save the $vg reported the same. All that changes is:
>
>   - report org.gnu.gdb.aarch64.sve
>   - use gdb nomenclature for names and types
>   - minor re-ordering of the types to match reference
>   - re-enable ieee_half (as we know gdb supports it now)
>   - $vg is now a 64 bit int
>   - check $vN and $zN aliasing in test
>
> [NOTE: there seems a limitation on the indexing of the pseudo $vN
> registers which I'm not sure if it's intentional]

It is (v registers are the aliased vector registers, not an alternative
to the z register).
>=20=20
> +        # check the v pseudo regs - I'm not sure if them capping out
> +        # at [15] is intentional though.

I'm going to change this comment to:

  Check the aliased V registers are set and GDB has correctly
  created them for us having recognised and handled SVE.

> +        try:
> +            for i in range(0, 16):
> +                val_z =3D gdb.parse_and_eval("$z0.b.u[%d]" % i)
> +                val_v =3D gdb.parse_and_eval("$v0.b.u[%d]" % i)
> +                report(int(val_z) =3D=3D int(val_v),
> +                       "v0.b.u[%d] =3D=3D z0.b.u[%d]" % (i, i))
> +        except gdb.error:
> +            report(False, "checking vregs (out of range)")
> +
>=20=20
>  def run_test():
>      "Run through the tests one by one"


--=20
Alex Benn=C3=A9e
