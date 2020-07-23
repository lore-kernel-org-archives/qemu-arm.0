Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1288887lfm;
        Wed, 22 Jul 2020 20:08:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwo/m63tiW8ghzFz8IuruERQMSJXDvqrmXPthHFNcNImuJEFya5bSDhCm2wJcJZW4vBVDkI
X-Received: by 2002:a17:902:8204:: with SMTP id x4mr2271193pln.16.1595473724865;
        Wed, 22 Jul 2020 20:08:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595473724; cv=none;
        d=google.com; s=arc-20160816;
        b=Dt2JmIQVn17tEO3PPprK8dbi+2KAMoK9bozhOrLk0HkTAwX0IfgYPJf9hEFQZmZblD
         yqGHSmYpabhKPnmqLGaKxZb4PwavJYOXm8pHsxi6dX+ZgTKi22ZRoROLhwV5lzTOWHQ5
         gDFWC8VR3fpECn4LeSc4clhM8SicaMuh5xsqdfNvCeodUjeujuAHjyZcb6tqXgXM/dkw
         mJOq2SQCljPvaGiBiEfnt9bgjTJ+HY6P3QjnOOvKX5Z53VuUg0Pb5C73OM27Po8R+1WT
         WrfkwKDqLTYFfWkb7auDn05HPSFgPbul1fobjuuMJhAlIvEpLGRynXrgJhYLUa2Iv+bY
         DHqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=qFCpLj+ip4JcE8sJCh4MbwPbtKvRVm8CCCKG8plaw+I=;
        b=IBNLfku4sgHC8aBtD4Vl/sGM52/KD7CIIuIFVRhv/WZrOvJE9zOLG3DzDylItxQBGZ
         WVfFpBpU6r/mIhb+/SJo7WsOgMU9igXwOjVNc1iu5/ug4Wl8vcYarz9kPUptsMO6SfwY
         +LRp6iRp5K1HRN3cDk93b2suSgZVtHadHH6XWP2R3Q057iTOe/cLMX4fpwBzSwRfphcm
         JzhcE4POrvYMYWoFQ6j5UG6j4B2rVCuwq7GPOw1SkyPKNquF+i+FTESQsmOYAsCgPv66
         Ar8oVdrXivw2tmOZnUXgwcAZfxdj9j0hQshkPnBNWFIqxUn/7GD+wg5NL+/TmZ1HZbNy
         dXOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gibson.dropbear.id.au header.s=201602 header.b=gXyYB4f4;
       spf=pass (google.com: domain of dgibson@ozlabs.org designates 203.11.71.1 as permitted sender) smtp.mailfrom=dgibson@ozlabs.org
Return-Path: <dgibson@ozlabs.org>
Received: from ozlabs.org (bilbo.ozlabs.org. [203.11.71.1])
        by mx.google.com with ESMTPS id z1si899081pgc.206.2020.07.22.20.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2020 20:08:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of dgibson@ozlabs.org designates 203.11.71.1 as permitted sender) client-ip=203.11.71.1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gibson.dropbear.id.au header.s=201602 header.b=gXyYB4f4;
       spf=pass (google.com: domain of dgibson@ozlabs.org designates 203.11.71.1 as permitted sender) smtp.mailfrom=dgibson@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1007)
	id 4BBy2v4wbGz9sSJ; Thu, 23 Jul 2020 13:08:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1595473719;
	bh=SuFKnJtCX3Fir48Plm6JLHASs5M1Y7sRHGO+Nub+nCk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gXyYB4f4zZemW/JvVg618Yfl0Vh9m40E4hpkjwLLN7Ze+vJWjHrID6hY8srmQBcfI
	 pq03WecoTTmpqSgCGRJ7iX55AjwXmaLOa662feRF6iCeUPuuDxlgCsvXS7OXdplKtF
	 j57YtXZ6fsKr4N6Li9yL9FWTpzIsdnm5lCRV/bzU=
Date: Thu, 23 Jul 2020 13:06:51 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Thiago Jung Bauermann <bauerman@linux.ibm.com>
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
	qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH v3 3/8] ppc/spapr: Use start-powered-off CPUState property
Message-ID: <20200723030651.GN5513@umbus.fritz.box>
References: <20200723025657.644724-1-bauerman@linux.ibm.com>
 <20200723025657.644724-4-bauerman@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="WeDu0lr7bteb/II5"
Content-Disposition: inline
In-Reply-To: <20200723025657.644724-4-bauerman@linux.ibm.com>
X-TUID: AH/HjnqHdevm


--WeDu0lr7bteb/II5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 22, 2020 at 11:56:52PM -0300, Thiago Jung Bauermann wrote:
65;6003;1c> PowerPC sPAPR CPUs start in the halted state, and spapr_reset_v=
cpu()
> attempts to implement this by setting CPUState::halted to 1. But that's t=
oo
> late for the case of hotplugged CPUs in a machine configure with 2 or more
> threads per core.
>=20
> By then, other parts of QEMU have already caused the vCPU to run in an
> unitialized state a couple of times. For example, ppc_cpu_reset() calls
> ppc_tlb_invalidate_all(), which ends up calling async_run_on_cpu(). This
> kicks the new vCPU while it has CPUState::halted =3D 0, causing QEMU to i=
ssue
> a KVM_RUN ioctl on the new vCPU before the guest is able to make the
> start-cpu RTAS call to initialize its register state.
>=20
> This problem doesn't seem to cause visible issues for regular guests, but
> on a secure guest running under the Ultravisor it does. The Ultravisor
> relies on being able to snoop on the start-cpu RTAS call to map vCPUs to
> guests, and this issue causes it to see a stray vCPU that doesn't belong =
to
> any guest.
>=20
> Fix by setting the start-powered-off CPUState property in
> spapr_create_vcpu(), which makes cpu_common_reset() initialize
> CPUState::halted to 1 at an earlier moment.
>=20
> Suggested-by: Eduardo Habkost <ehabkost@redhat.com>
> Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>

Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/ppc/spapr_cpu_core.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>=20
> NB: Tested on ppc64le pseries KVM guest with two threads per core.=20
> Hot-plugging additional cores doesn't cause the bug described above
> anymore.
>=20
> diff --git a/hw/ppc/spapr_cpu_core.c b/hw/ppc/spapr_cpu_core.c
> index c4f47dcc04..2125fdac34 100644
> --- a/hw/ppc/spapr_cpu_core.c
> +++ b/hw/ppc/spapr_cpu_core.c
> @@ -36,11 +36,6 @@ static void spapr_reset_vcpu(PowerPCCPU *cpu)
> =20
>      cpu_reset(cs);
> =20
> -    /* All CPUs start halted.  CPU0 is unhalted from the machine level
> -     * reset code and the rest are explicitly started up by the guest
> -     * using an RTAS call */
> -    cs->halted =3D 1;
> -
>      env->spr[SPR_HIOR] =3D 0;
> =20
>      lpcr =3D env->spr[SPR_LPCR];
> @@ -274,6 +269,11 @@ static PowerPCCPU *spapr_create_vcpu(SpaprCpuCore *s=
c, int i, Error **errp)
> =20
>      cs =3D CPU(obj);
>      cpu =3D POWERPC_CPU(obj);
> +    /*
> +     * All CPUs start halted. CPU0 is unhalted from the machine level re=
set code
> +     * and the rest are explicitly started up by the guest using an RTAS=
 call.
> +     */
> +    cs->start_powered_off =3D true;
>      cs->cpu_index =3D cc->core_id + i;
>      spapr_set_vcpu_id(cpu, cs->cpu_index, &local_err);
>      if (local_err) {
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--WeDu0lr7bteb/II5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl8Y/ssACgkQbDjKyiDZ
s5KYVxAAv7P27aed2Mohc1UK3Bum8vJaeFcPpfr/EPEfJb78dgyvscEPglAvIBal
Ia2ElTiYxzROnRiD209HoBR432VeEELIvXtaO99yp/u0sF2QRBrNtMVcZ3DyUWr2
MbTcD4BSR4Qq1GiCKBGvXtC6fGQv6R1vy3Z31eMqDdPXwnE67DjoiRuuXjQs+DzY
J2v5BTMhBWcfMJyirzJq02OReKCSZwhRu15l77j/Wyc7LC9nYM/fZxYHxwKGVEL/
D0w0YpBy7wwtioxKUhuqkeO6ONGc/tWrNTzzDTenfZHUyJ/EC2azYFcSj9y24SiI
2NjUOsTTtvekOlD+4lW2mS2ZonkgIzYiTTa0PLPIZdJZ8P50ZEO3jbuFdmyPc7ur
Mz4STuZQT/mPxFuuKU7RPQY04E++cSFIWjYhna3IqTK9K3trICGaC9OhrSQ3EUJp
hBepwmoeA+Ik+xte4HR7/r+xRnVWME0hEuR/v4qhMiQ3FuK4j1mNBal9x47LTsUg
r39CO8a0b6V/t3NKRT5CShsBDjQPikk2DX4wyMheRL697Tw4N3pkzI40Cpx0QZgP
ludgUrzuZ+waEfujZCrPYHac7oRoSrUimV3K54hPoQE4xAAm3rDl97oBpKGHObqk
2AhiTzBtdkoB1ALG9XLNixXU/gExcrfhxYw84SdfbUYd8zdCxBc=
=H/Oe
-----END PGP SIGNATURE-----

--WeDu0lr7bteb/II5--
