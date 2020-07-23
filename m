Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1288893lfm;
        Wed, 22 Jul 2020 20:08:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx3s8R7wCBzs7+uQmtBfsM27mqbezTwUC03XTfvoWWwgYRgF3EtDbp8OTyhjPijBtOa7TB1
X-Received: by 2002:a63:d605:: with SMTP id q5mr2572412pgg.344.1595473725398;
        Wed, 22 Jul 2020 20:08:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595473725; cv=none;
        d=google.com; s=arc-20160816;
        b=ZPYCarT8CYwzeEIjDlnWOrJHYotHmI4XYEwa47Od7q+KZcnL5CI+KJVdXdqIjZAI6G
         f087QIUjv0aW6O+fTRvb8XTx8QbfI8pJL+t6xy2QO5jBsccCPqHZ5Ui13NdOji1DrhEj
         rNNSApJ0zs5W0EVs91HfogptMux0c9HyDn4kayiHlkpkfbtjgjH5sE8QU/o2Y9Abx0Mj
         8joU8piQX5nJGQppwux2/D0b8ohPfMatzuyXLLKE+jy0dZZVm6cOUAX0aXWUx14jiA1m
         HbVWUPpckfVEhtwTUerbckX9C48LPWsfGmFGIkl0CMjHYfB07LZIMEFe8spazheMj1zi
         oluA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=EXPVFq5KzJITtqCv3sA5R9HQ/q9sssRR43+O/sCtjn8=;
        b=QdkIUbiXqkRpqqPBbBe9OuWTN2+6tMMCriU/FRdBAXyRmeCelY0eqCQLcYunto1RNC
         lqTbaCCz/FJVM//1V85XjJN/ArcBslZsSb4M8pJzSPZoTS6+iOLQTQlz0rSlD29WPVnz
         xlJ1jYNjNbM6/OuX3Di9YQz/bbaUxSDOrVahD6qvdwnWiw2EIfVxSbcxTJ2lRk0JhjXo
         aNqsAVc00uX4gpM7GuyfFnIlidLXPUjBU+by8NBhwdvvuVRIjzlTKzburBeHAsLZgy+6
         8PTXKGvIbp96l90JjXHYISECZTQN/SzWf9KSAh4ZX9yjtBN87NsRZzWlhb0DSCx1HuG9
         Dw9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gibson.dropbear.id.au header.s=201602 header.b=UdCDtxZh;
       spf=pass (google.com: domain of dgibson@ozlabs.org designates 203.11.71.1 as permitted sender) smtp.mailfrom=dgibson@ozlabs.org
Return-Path: <dgibson@ozlabs.org>
Received: from ozlabs.org (ozlabs.org. [203.11.71.1])
        by mx.google.com with ESMTPS id ds18si1011777pjb.76.2020.07.22.20.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2020 20:08:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of dgibson@ozlabs.org designates 203.11.71.1 as permitted sender) client-ip=203.11.71.1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gibson.dropbear.id.au header.s=201602 header.b=UdCDtxZh;
       spf=pass (google.com: domain of dgibson@ozlabs.org designates 203.11.71.1 as permitted sender) smtp.mailfrom=dgibson@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1007)
	id 4BBy2v3Cymz9sQt; Thu, 23 Jul 2020 13:08:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1595473719;
	bh=uwSl+GwHYfKDJff/le3cud8w1j8l6dZTEu3QU+04iyQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UdCDtxZhLNrZIGKVQL3oQdpafcuVVRfo4NsRo9i0ECAh1tkEF6GO/A+jQtg1dptaw
	 g7CuZjnd70ozyKINr4aCfIbndHi4PNHZIxFkDiuNDdHzcTywgI2kVs4VjxArIIAyhr
	 59cv/sotWYO1O2I2NijyUQZnLVvrJQU/kqAIGc1k=
Date: Thu, 23 Jul 2020 13:06:25 +1000
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
Subject: Re: [PATCH v3 2/8] target/arm: Move setting of CPU halted state to
 generic code
Message-ID: <20200723030625.GM5513@umbus.fritz.box>
References: <20200723025657.644724-1-bauerman@linux.ibm.com>
 <20200723025657.644724-3-bauerman@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="egxrhndXibJAPJ54"
Content-Disposition: inline
In-Reply-To: <20200723025657.644724-3-bauerman@linux.ibm.com>
X-TUID: 3Wl1UmR225dm


--egxrhndXibJAPJ54
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 22, 2020 at 11:56:51PM -0300, Thiago Jung Bauermann wrote:
> This change is in a separate patch because it's not so obvious that it
> won't cause a regression.
>=20
> Suggested-by: Eduardo Habkost <ehabkost@redhat.com>
> Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/core/cpu.c    | 2 +-
>  target/arm/cpu.c | 1 -
>  2 files changed, 1 insertion(+), 2 deletions(-)
>=20
> NB: I wasn't able to run this patch on an ARM machine. I did run it on
> a ppc64le pseries KVM guest.
>=20
> diff --git a/hw/core/cpu.c b/hw/core/cpu.c
> index 594441a150..71bb7859f1 100644
> --- a/hw/core/cpu.c
> +++ b/hw/core/cpu.c
> @@ -258,7 +258,7 @@ static void cpu_common_reset(DeviceState *dev)
>      }
> =20
>      cpu->interrupt_request =3D 0;
> -    cpu->halted =3D 0;
> +    cpu->halted =3D cpu->start_powered_off;
>      cpu->mem_io_pc =3D 0;
>      cpu->icount_extra =3D 0;
>      atomic_set(&cpu->icount_decr_ptr->u32, 0);
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index ec65c7653f..b6c65e4df6 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -175,7 +175,6 @@ static void arm_cpu_reset(DeviceState *dev)
>      env->vfp.xregs[ARM_VFP_MVFR2] =3D cpu->isar.mvfr2;
> =20
>      cpu->power_state =3D s->start_powered_off ? PSCI_OFF : PSCI_ON;
> -    s->halted =3D s->start_powered_off;
> =20
>      if (arm_feature(env, ARM_FEATURE_IWMMXT)) {
>          env->iwmmxt.cregs[ARM_IWMMXT_wCID] =3D 0x69051000 | 'Q';
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--egxrhndXibJAPJ54
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl8Y/rEACgkQbDjKyiDZ
s5IIsA//eOFnOoHl1OZXOiItrQwlda93YeDHi/KpkGzKa3XXoeklYuNsHpaOLkzZ
0Sw9Vem2BvsLTkcVfRFkNwSBX6sk2XGkM2d54NUgJO83q2UM40GPl2gqIDqxGUuJ
9luaHBseZzwUJi7D4IHsWuzaMbPJP2iT1QSgAGYXwt9PdDCT+foOph6QEuwLSXHo
nMI9llrpyRUr3SRyohYqRRm2eN8KoN9h2XAN5kEa9jELFOIN3DZdYRlp08lstHiY
ZBbjHal2GNJeWaqXyO6sN6sC0epTL0/LF6cRFA7s1+PqzYQVKCrRq+YZ/2Mvk+CN
jbvtlHN/vLDRDmPYinhYrHGtcj2leyPMYf8eYG1ghTt2CpXmzw1hG443lw98KtMz
EVtRxmnP/E9ln3GX6ZbSOOdUOFNyj/o6GoPKf6ZTIY12sGP6VxGTrnOq83vYp+FN
IzvOXbaagxJCNhR1SbSCBE3N0ifW9ayqWQcXDgJXNK2qqRiXbgi4qQwuOsg4T1vk
iPbaW+YPBveXkw1ASMnyjZ90GXU4DJHf0ISUvm6rGunp7znDB/bBYbOBWc3WVbJZ
iDmZ85ECoeqLRPs+XVaZJJCf+Tf2/qqfXy7x1GRkli73ndm2TyKZ7SyU7/LArO6K
ZcTk8oGZ8WMHEbnoSH4vowIbgz69+PHKHYWjq1+TWIen/8OEgkI=
=SfHI
-----END PGP SIGNATURE-----

--egxrhndXibJAPJ54--
