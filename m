Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp1651542lfy;
        Sun, 23 Aug 2020 00:26:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzVHphH4HZ/bxq5yH+8lHqWgH4g4B8Oz120pF8rbVWE5+Np9FsA/7u5R4qVzflIi+MaehNP
X-Received: by 2002:a63:fa09:: with SMTP id y9mr248503pgh.0.1598167574017;
        Sun, 23 Aug 2020 00:26:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598167574; cv=none;
        d=google.com; s=arc-20160816;
        b=u/PjQHos0jqi2tyP24utVr9atzuy3uEWRYwyRSe9fFdhLIL7MtmWnFm/EesQqVB7nP
         u2KrruOgaHPqrMQO1n5UaLqNQ562X54AuHtqHtVeZ6iAaTX3Alz3Bm9z5i5lY5b+y8tg
         T6WQc85Bvpuhce+ilFePyGaflNl1hbJXjNIG9HOIAWK0Jgi12Pwt2F+GKa40CYPgYXYc
         0+0DEvIqI9Af4ewEV20H2mqZtc7hpJrfj/6LxufD2CQyeMTAzgdvFSm4rEeaOqfZIeV+
         OGfsx9c3F2bW6oez06TPIaNj/wdd9kPzw6/BJiHJuZ8EVY5eIpjiEQ0N5cH/FFW5jF5y
         kNbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=VdaqAflI/QK71EtT3AEENUAdnXv+gcfCusvWkXAgB10=;
        b=g4vO0qaI3cYpudoLad32QAm/3eY+xMju0n4EA1nDaPO/AK69AouIO8PB2C6Vzyg+oq
         YySin5uYlAUMjOhxT9+ojKtvVOjEGkuCz/pxOkbJ7teFXx459VRdghQGcUPhttFNki4K
         7ppuQ3/U7GnqC4UsGdNXBb1/Sgkv91tPaC7+KK0YXptmLC71Wf29Utq05Y7uZqzqBVz1
         ljJdc9P0E/S4uZn5oRd3PRQAsCNcDpah3YbtmkCcHtEcInrAuPMtf1V5uAZWTaCCqxcj
         1mjmiCUwibraoMQNpXLQaSwRITv6zB9WbPu+t5yvIeeUW0yN5ryFAxNBL5ZoynzQRbLN
         2YqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gibson.dropbear.id.au header.s=201602 header.b=YwX7zGAF;
       spf=pass (google.com: domain of dgibson@ozlabs.org designates 2401:3900:2:1::2 as permitted sender) smtp.mailfrom=dgibson@ozlabs.org
Return-Path: <dgibson@ozlabs.org>
Received: from ozlabs.org (bilbo.ozlabs.org. [2401:3900:2:1::2])
        by mx.google.com with ESMTPS id j4si5482939pgq.351.2020.08.23.00.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2020 00:26:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of dgibson@ozlabs.org designates 2401:3900:2:1::2 as permitted sender) client-ip=2401:3900:2:1::2;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gibson.dropbear.id.au header.s=201602 header.b=YwX7zGAF;
       spf=pass (google.com: domain of dgibson@ozlabs.org designates 2401:3900:2:1::2 as permitted sender) smtp.mailfrom=dgibson@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1007)
	id 4BZ6Hk23MLz9sTS; Sun, 23 Aug 2020 17:26:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1598167570;
	bh=Taygr7WHvI0fOQO8fF+eIY5bJ5dGP6vegjaZBDNI5kQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YwX7zGAFtOHIOWrc9ix926pnUGQbn5c3qdWMdOeCgFRJd87wrYjiOWX0dvTgz2hdy
	 CZCA9Ora8hKddwruiAA7agU+JznMuIY61fVJJqg7vsarPm/+a6hLeeB0PyoBQlBFGj
	 DHfsOAEFI88DHyrckNTKVkYRw+N6SH5MvOWVpPCU=
Date: Sun, 23 Aug 2020 17:14:13 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Cc: Thiago Jung Bauermann <bauerman@linux.ibm.com>, qemu-ppc@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	David Hildenbrand <david@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-devel@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Greg Kurz <groug@kaod.org>,
	qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Richard Henderson <rth@twiddle.net>,
	Cornelia Huck <cohuck@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [PATCH v6 4/8] ppc/e500: Use start-powered-off CPUState property
Message-ID: <20200823071413.GB4734@yekko.fritz.box>
References: <20200819164306.625357-1-bauerman@linux.ibm.com>
 <20200819164306.625357-5-bauerman@linux.ibm.com>
 <3dd050ad-147e-c365-883a-3384130b0d2f@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MfFXiAuoTsnnDAfZ"
Content-Disposition: inline
In-Reply-To: <3dd050ad-147e-c365-883a-3384130b0d2f@kaod.org>
X-TUID: LEsUYNE0XfJh


--MfFXiAuoTsnnDAfZ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 22, 2020 at 10:59:56AM +0200, C=E9dric Le Goater wrote:
> Hello,
>=20
> On 8/19/20 6:43 PM, Thiago Jung Bauermann wrote:
> > Instead of setting CPUState::halted to 1 in ppce500_cpu_reset_sec(), use
> > the start-powered-off property which makes cpu_common_reset() initializ=
e it
> > to 1 in common code.
> >=20
> > Also change creation of CPU object from cpu_create() to object_new() and
> > qdev_realize_and_unref() because cpu_create() realizes the CPU and it's=
 not
> > possible to set a property after the object is realized.
> >=20
> > Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> > Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
>=20
>=20
> This is breaking make check :=20
>=20
>     tests/qtest/libqtest.c:175: kill_qemu() detected QEMU death from sign=
al 11 (Segmentation fault) (core dumped)
>     ERROR boot-serial-test - too few tests run (expected 7, got 0)
>     make: *** [/home/legoater/work/qemu/qemu-powernv-5.2.git/tests/Makefi=
le.include:650: check-qtest-ppc64] Error 1
>     make: *** Waiting for unfinished jobs....
>    =20
>    =20
>     gdb --args build/ppc64-softmmu/qemu-system-ppc64  -display none   -M =
ppce500
>     ...
>     Thread 1 "qemu-system-ppc" received signal SIGSEGV, Segmentation faul=
t.
>     0x000055555596ebf2 in ppce500_init (machine=3D0x5555567aa6e0)
>         at /home/legoater/work/qemu/qemu-powernv-5.2.git/hw/ppc/e500.c:880
>     880	        irqs[i].irq[OPENPIC_OUTPUT_INT] =3D input[PPCE500_INPUT_I=
NT];
> =20
>    =20
>     AFAIUI, 'input is not initialized since the CPU is not yet
>     realized.

Sigh.  For future reference, Thiago, running an all-targets make check
is pretty much a minimum bar to test before posting.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--MfFXiAuoTsnnDAfZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl9CF0MACgkQbDjKyiDZ
s5JTLQ/+Lg+3IJI8SUhL6CEBtvG7ocdZkQGhlKeJMIYI8+9KZgB+2F491dDeX8zj
VVGvwzaLB9o3TmYM9ZXy+/Z8OTm+qgpboHcgMF/BpUaYuB+/besDJ8Q/hWEEaNbw
i/Xh750DWFNjtDMfsBK7uv8jkElOzUv/bpt4OVyouZvd1EDPCZH2BsRJjeew4R+s
q/JL/S2xTVA5Yr5oCCdA8YQAECNOnbSxUzA+EZX9jNvNrxMUntGoayKLdrRF4O4P
KAOxn+le+rSthd9iHBUadk5Rb9Fe1Z2oQ1JObQj07YOtu+fpwC+KkVGyrTeiMpUp
qxvs61GivAxloCC545mxoGdqOGtHteNN3UKU25fJG5QYekLh3+Cy3LlAuoqMoJ8n
2qBZRIDKCrHEzxFS1CN5wtPSNno+0PCMvhGhqaIP648DS++kxM1gON1eFgHm6HPb
xZc8E3cVHou2pzvBRYZ3fyfhL74zAIxa0VAInWIQcz+Ni/SwqJ3BYaCRMRvw/rT7
wa2ZnnrHtX1wzaDXdyDYkQ6HktysOVv61imR8v2kjaDdA9uPqSU/kVO4HVhPwPRQ
TTurBkvpKA/PNQZbM2qIOFMYbfS0NKsyBVeVvKlW8ssEBaIPU5d//lJ4shLK1C/P
VR3lrkM82/VKP+cxuTGdc7X1kOHZIjSrYGt4gZvC/vfCbXFLOUk=
=iifx
-----END PGP SIGNATURE-----

--MfFXiAuoTsnnDAfZ--
