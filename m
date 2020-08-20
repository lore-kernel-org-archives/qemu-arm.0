Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp941805lfy;
        Wed, 19 Aug 2020 18:43:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxfERmCuq4svED8SZwnOufxD6tl6b/BICFNniDVTDavPrmSG7ecuM/pj8mB32QYU7HeQyD2
X-Received: by 2002:a17:90a:1f8c:: with SMTP id x12mr561272pja.186.1597887782287;
        Wed, 19 Aug 2020 18:43:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597887782; cv=none;
        d=google.com; s=arc-20160816;
        b=R8Sc2l3H1ZuA9IcC6XORPPqjUsUS80+ikEEUtfRKAIMjeA16GTDgSkWy6mr2aUaMBg
         esDOyqvXY6XSnYuvOs4/03NpMD6jtdWb1VWNNU6C5eEOSn81yzb0VNrDb/AnN/r+Qebr
         toxkoEVc/+dSuncDhhJaY1IdOLPLyWWvku3CY6yf1+v7EIPPpeuXxcRwmUYqVieuU9bQ
         VrBjMomM6CAVK+yFnr2VhC4lozBcIBEt93u6O3PTaYhIftLMfE+kCZ9eWITmarlPg5Hd
         5LkpLzoRbwCFodWHiN98UXNLm9gMejdxAGo6+BukFw1v+BnFt17oyCP5HWf2+q69zU1Y
         860w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=6H4YyXh2+zAW5m8OF8xiftYLRCehzczJkgnFJpv9UqI=;
        b=lCROP62v/xT/Gobc72GJS+dZlHyrJo0ExeasMCvtwvoxl1/n/OM4mZpoCIO2RjQc8T
         ybh4XLl6L71oNR1lmS8x8JmG+LSO1IY9lCfLy5pfC1P4PdfLgj7Jq1ucQcaeoMRaMRv6
         6Su6gBxII6/K4SRwOtVD68oV6pqh2Q8J6rgmSK1wFh2VOSQzNX1+iGfozVyiljhyThnU
         JpRokDA5P8qGYbKhOsoA683by+0t1RGIOkGrevOPW0dRNEwQl8gatGe9DYdmjJq9yqUa
         F334MIPmoJ15DuLcaD+/nfTz41es9x/Yd+1Bt3NLoU54R5wZqyWmb5RkTfcuE39LCKX5
         OUtA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gibson.dropbear.id.au header.s=201602 header.b=n2yrrZou;
       spf=pass (google.com: domain of dgibson@ozlabs.org designates 2401:3900:2:1::2 as permitted sender) smtp.mailfrom=dgibson@ozlabs.org
Return-Path: <dgibson@ozlabs.org>
Received: from ozlabs.org (bilbo.ozlabs.org. [2401:3900:2:1::2])
        by mx.google.com with ESMTPS id n2si429945pgp.171.2020.08.19.18.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2020 18:43:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of dgibson@ozlabs.org designates 2401:3900:2:1::2 as permitted sender) client-ip=2401:3900:2:1::2;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gibson.dropbear.id.au header.s=201602 header.b=n2yrrZou;
       spf=pass (google.com: domain of dgibson@ozlabs.org designates 2401:3900:2:1::2 as permitted sender) smtp.mailfrom=dgibson@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1007)
	id 4BX6q543bwz9sTR; Thu, 20 Aug 2020 11:42:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1597887777;
	bh=iuIpG/F8UrzE4lEermCKFopXr2gJt10aW1SE2pBmWe4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n2yrrZouE29lyrigx+mk7CFoZ/CrGdn3UszPT6VeXrObvFIzLwgBwqJAkbPdlBZ3S
	 EolxzTlzOf6oaakKDlEQqSgvrQPFRA45vVvqZME78OZqfkxWN+Ww36KNt1+5Rmf2uY
	 SiNDDAOu7Q5qa24DVjwII9MiISeuQP79qZ4yVp9c=
Date: Thu, 20 Aug 2020 11:42:38 +1000
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
	Greg Kurz <groug@kaod.org>, Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v6 0/8] Generalize start-powered-off property from ARM
Message-ID: <20200820014238.GI271315@yekko.fritz.box>
References: <20200819164306.625357-1-bauerman@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MFZs98Tklfu0WsCO"
Content-Disposition: inline
In-Reply-To: <20200819164306.625357-1-bauerman@linux.ibm.com>
X-TUID: NJpqygyhhWM3


--MFZs98Tklfu0WsCO
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 19, 2020 at 01:42:58PM -0300, Thiago Jung Bauermann wrote:
> This version has one small fix in patch 7, and adds Philippe's Reviewed-b=
ys.
>=20
> Applies cleanly on dgibson/ppc-for-5.2.
>=20
> Original cover letter below, followed by changelog:
>=20
>=20
> The ARM code has a start-powered-off property in ARMCPU, which is a
> subclass of CPUState. This property causes arm_cpu_reset() to set
> CPUState::halted to 1, signalling that the CPU should start in a halted
> state. Other architectures also have code which aim to achieve the same
> effect, but without using a property.
>=20
> The ppc/spapr version has a bug where QEMU does a KVM_RUN on the vcpu
> before cs->halted is set to 1, causing the vcpu to run while it's still in
> an unitialized state (more details in patch 3).
>=20
> Peter Maydell mentioned the ARM start-powered-off property and
> Eduardo=A0Habkost suggested making it generic, so this patch series does
> that, for all cases which I was able to find via grep in the code.
>=20
> The only problem is that I was only able to test these changes on a ppc64=
le
> pseries KVM guest, so except for patches 2 and 3, all others are only
> build-tested. Also, my grasp of QOM lifecycle is basically non-existant so
> please be aware of that when reviewing this series.
>=20
> The last patch may be wrong, as pointed out by Eduardo, so I marked it as
> RFC. It may make sense to drop it.

Applied to ppc-for-5.2.

>=20
> Changes since v5:
>=20
> Patch "ppc/e500: Use start-powered-off CPUState property"
> Patch "mips/cps: Use start-powered-off CPUState property"
> Patch "sparc/sun4m: Remove main_cpu_reset()"
> Patch "target/s390x: Use start-powered-off CPUState property"
> - Added Philippe's Reviewed-by.
>=20
> Patch "sparc/sun4m: Use start-powered-off CPUState property"
> - Move call to qdev_realize_and_unref() right after object_property_set_b=
ool(),
>   as suggested by Philippe.
>=20
> Changes since v4:
>=20
> Patch "ppc/e500: Use start-powered-off CPUState property"
> Patch "sparc/sun4m: Use start-powered-off CPUState property"
> - Use qdev_realize_and_unref() instead of qdev_realize(), as suggested
>   by=A0Igor.
> - Pass &error_fatal to qdev_realize_and_unref() instead of manually
>   reporting the error and exiting QEMU, as suggested by Philippe.
> - Changed object_property_set_bool() to use &error_fatal instead of
>   &error_abort.
>=20
> Patch "mips/cps: Use start-powered-off CPUState property"
> - Use qdev_realize_and_unref() instead of qdev_realize(), as suggested
>   by=A0Igor.
> - Use existing errp argument to propagate error back to the caller, as
>   suggested by Philippe.
> - Changed object_property_set_bool() to use existing errp argument to
>   propagate error back to the caller instead of using &error_abort.
>=20
> Changes since v3:
>=20
> General:
> - Added David's, Greg's and Cornelia's Reviewed-by and Acked-by to some
>   of the patches.
> - Rebased on top of dgibson/ppc-for-5.2.
>=20
> Patch "ppc/e500: Use start-powered-off CPUState property"
> Patch "mips/cps: Use start-powered-off CPUState property"
> Patch "sparc/sun4m: Use start-powered-off CPUState property"
> - Initialize CPU object with object_new() and qdev_realize() instead
>   of cpu_create().
> - Removed Reviewed-by's and Acked-by's from these patches because of
>   these changes.
>=20
> Changes since v2:
>=20
> General:
> - Added Philippe's Reviewed-by to some of the patches.
>=20
> Patch "ppc/spapr: Use start-powered-off CPUState property"
> - Set the CPUState::start_powered_off variable directly rather than using
>   object_property_set_bool(). Suggested by Philippe.
>=20
> Patch "sparc/sun4m: Remove main_cpu_reset()"
> - New patch. Suggested by Philippe.
>=20
> Patch "sparc/sun4m: Use start-powered-off CPUState property"
> - Remove secondary_cpu_reset(). Suggested by Philippe.
> - Remove setting of `cs->halted =3D 1` from cpu_devinit(). Suggested by P=
hilippe.
>=20
> Patch "Don't set CPUState::halted in cpu_devinit()"
> - Squashed into previous patch. Suggested by Philippe.
>=20
> Patch "sparc/sun4m: Use one cpu_reset() function for main and secondary C=
PUs"
> - Dropped.
>=20
> Patch "target/s390x: Use start-powered-off CPUState property"
> - Set the CPUState::start_powered_off variable directly rather than using
>   object_property_set_bool(). Suggested by Philippe.
> - Mention in the commit message Eduardo's observation that before this
>   patch, the code didn't set cs->halted on reset.
>=20
> Thiago Jung Bauermann (8):
>   target/arm: Move start-powered-off property to generic CPUState
>   target/arm: Move setting of CPU halted state to generic code
>   ppc/spapr: Use start-powered-off CPUState property
>   ppc/e500: Use start-powered-off CPUState property
>   mips/cps: Use start-powered-off CPUState property
>   sparc/sun4m: Remove main_cpu_reset()
>   sparc/sun4m: Use start-powered-off CPUState property
>   target/s390x: Use start-powered-off CPUState property
>=20
>  exec.c                  |  1 +
>  hw/core/cpu.c           |  2 +-
>  hw/mips/cps.c           | 14 ++++++++++----
>  hw/ppc/e500.c           | 14 ++++++++++----
>  hw/ppc/spapr_cpu_core.c | 10 +++++-----
>  hw/sparc/sun4m.c        | 31 ++++---------------------------
>  include/hw/core/cpu.h   |  4 ++++
>  target/arm/cpu.c        |  4 +---
>  target/arm/cpu.h        |  3 ---
>  target/arm/kvm32.c      |  2 +-
>  target/arm/kvm64.c      |  2 +-
>  target/s390x/cpu.c      |  2 +-
>  12 files changed, 39 insertions(+), 50 deletions(-)
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--MFZs98Tklfu0WsCO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl891Q4ACgkQbDjKyiDZ
s5Ln+Q//ej17/yk3foCu19l8rVPvvPIR6cf0KzAFa0NjildGpMbU3VJ8MMBSoMrP
HVFfD66xgPXEFhsmv+0DmQxOds2eAFLREnvRslNCee/RK1tHjiJ3S9lxrmFJN24V
NHMJwx/1iitfNGX5MYaXTC68goiP6YHAwiHsgOzhIHGDHqc9Ue+mYQk9whaHnZY4
vzOMIgnlJ2+B1+MkNBm0IlVu0FCJGVdpm7zsTOM3Lr/9PZV43BmUb2ItytrBnruM
CRrLahXRHUAyibpiTG6t+dhiB1iZlq/tNlozN26JZVYXNe5OLpy+gnu/0Hp/+38Y
rVa0k9aMT3MH6wnJavlqB+jaqvNvKtdqKzq8obMzZ1HZbZnWo4gV/7J/I9uSA4wx
1S4J4Oe2AwcISH1KrMeSm7UdL6zywT9ZrheCyzGifFBOqR96IWpeUjdPk+QsJ/W7
MyayVlUWg0dZpMmpagSW0D+9yc6r0e/OGQ8CeKByl1Wx8am0uHdnax7mL63RWXvl
q3oMZ/M04gP0YI+SKAa6hL699K8Ms/nqGSzg6QqQLMqP5LlufnRDetlFTsa27j6I
0Cd4+CEMeFnEcGRPelgKq9iynjexfe0vR1AdGW1/n51EsJv54G70GQ70RPG/RSUI
Z/7zt76NMvIpDL3RNASXrjpwlj8oPwBzM3ftj1PR40zcxD4SpsY=
=fFNL
-----END PGP SIGNATURE-----

--MFZs98Tklfu0WsCO--
