Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2562344lfy;
        Sun, 16 Aug 2020 21:48:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyFe4UGM4re6hm+QE1PShYpaDR6clGKwSiR8MvsTjf9haABVZHi+Mp4yD4XlYFJZN0eJgwn
X-Received: by 2002:a17:90a:950a:: with SMTP id t10mr11037665pjo.107.1597639709453;
        Sun, 16 Aug 2020 21:48:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597639709; cv=none;
        d=google.com; s=arc-20160816;
        b=eAHLSzRbdo3mCy4kr2dwXMZMPYRJKJB41SSObNR24rt5sumTj3PwWo1zZEmY8YBFgs
         j5ESKz96zg8y8fZErr5N0JKmdZG8/I1lEIZaV/1D5FoXc0WENGrEJYc0QfvM3yPkIjLS
         seBafcYniE3dWX4UIrcNeWSiRwW+olzMOQkZb6OoYLlJhKCf1mZmHRp5sWqMZZXNrw1k
         dRkliXyHY3f/PEwFVC1tmnK5AJomygCXB5cFZetAc+5qbq6nWmalN7eHq1JfcydNmca6
         ldZ9tdgkpyZOGWSPgHrs4WookavrP1n4YojRJTjxJ5LSbbtbF+Ei2+wg7NjpSn7x50SC
         PhSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=zUDDh+2d6cVhqKOsy6oefDaLzB4j2HCDFw4g0WcrbqI=;
        b=w9V/SnwH/ggVkXSzEJD7kcrnKRm5Y0SBgsZAV07pnZJNePg8ZhyOIuBNUn3RnV+lIC
         csI6pPjZbW5m1Ae2mCxBXRmvuGEaxBLxxP8nUK8sOk5rQkqruL6UlAQq3mrHDrut/Y9y
         WeGDiIiw701Dyz4hZUW9MCeZmv8OKeB5M5rmC+//linAyt3gGFSPg2iRY7AH7szw0N8I
         bWJEe1QzEOZTfG4Qd/vsbW6pCKwApIa9lR3RGgeaAdHD6jrqpJC4zMEtYQlHSdQeYMRp
         QlQdquFzPERXcXcl1QbiZCWwxtEsgaOUr2dS5WUmqCJJYSKbGXZKg6BiGF1/hPhlF5+P
         cLZg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gibson.dropbear.id.au header.s=201602 header.b=EBYRjiq8;
       spf=pass (google.com: domain of dgibson@ozlabs.org designates 2401:3900:2:1::2 as permitted sender) smtp.mailfrom=dgibson@ozlabs.org
Return-Path: <dgibson@ozlabs.org>
Received: from ozlabs.org (ozlabs.org. [2401:3900:2:1::2])
        by mx.google.com with ESMTPS id y12si12132439pfp.341.2020.08.16.21.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2020 21:48:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of dgibson@ozlabs.org designates 2401:3900:2:1::2 as permitted sender) client-ip=2401:3900:2:1::2;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gibson.dropbear.id.au header.s=201602 header.b=EBYRjiq8;
       spf=pass (google.com: domain of dgibson@ozlabs.org designates 2401:3900:2:1::2 as permitted sender) smtp.mailfrom=dgibson@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1007)
	id 4BVM4R5hHpz9sPC; Mon, 17 Aug 2020 14:48:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1597639703;
	bh=VXX1nkfPf1296LwI59CJofxvm7VBziZ/FvWkzXpbIoI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EBYRjiq8fwLudq36WfqbF/K9VG3UqWf/qsByafZxEXN0nCIY4yUBfe7KFno9Cudqy
	 6sw58jeN0jD8Mq9ULbXKvP37SEZGgl5MDylSmuVI/oCCh0wdR2zah3MkJMcT6Pw4W6
	 aTfhzQHqOMVlJpjdLxHVe40KifLqVkiY/UqO6jIU=
Date: Mon, 17 Aug 2020 14:47:30 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Thiago Jung Bauermann <bauerman@linux.ibm.com>
Cc: qemu-ppc@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Greg Kurz <groug@kaod.org>,
	qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Richard Henderson <rth@twiddle.net>,
	Cornelia Huck <cohuck@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v3 0/8] Generalize start-powered-off property from ARM
Message-ID: <20200817044730.GK12805@yekko.fritz.box>
References: <20200723025657.644724-1-bauerman@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="08ATZu8fEq0x2T3M"
Content-Disposition: inline
In-Reply-To: <20200723025657.644724-1-bauerman@linux.ibm.com>
X-TUID: Fh1rD5mq592Q


--08ATZu8fEq0x2T3M
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 22, 2020 at 11:56:49PM -0300, Thiago Jung Bauermann wrote:
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
>=20
> Applies cleanly on yesterday's master.

This series appears to break the Travis build for a MIPS target:

Unexpected error in qdev_prop_set_after_realize() at /home/travis/build/dgi=
bson/qemu/hw/core/qdev-properties.c:30:
qemu-system-mips64el: Attempt to set property 'start-powered-off' on anonym=
ous device (type 'I6400-mips64-cpu') after it was realized
Broken pipe
/home/travis/build/dgibson/qemu/tests/qtest/libqtest.c:175: kill_qemu() det=
ected QEMU death from signal 6 (Aborted) (core dumped)
Aborted (core dumped)
ERROR qom-test - too few tests run (expected 8, got 0)
/home/travis/build/dgibson/qemu/tests/Makefile.include:650: recipe for targ=
et 'check-qtest-mips64el' failed

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
>  hw/mips/cps.c           |  6 +++---
>  hw/ppc/e500.c           | 10 +++++++---
>  hw/ppc/spapr_cpu_core.c | 10 +++++-----
>  hw/sparc/sun4m.c        | 28 ++--------------------------
>  include/hw/core/cpu.h   |  4 ++++
>  target/arm/cpu.c        |  4 +---
>  target/arm/cpu.h        |  3 ---
>  target/arm/kvm32.c      |  2 +-
>  target/arm/kvm64.c      |  2 +-
>  target/s390x/cpu.c      |  2 +-
>  12 files changed, 27 insertions(+), 47 deletions(-)
>=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--08ATZu8fEq0x2T3M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl86C+AACgkQbDjKyiDZ
s5IasA//UAzW7n1nwIF+zVjma/VBtVTA0QH1jDCDAOAnXO8qXxK1Gq6ElUB4DMZv
ZwsrjMYNfTChbmj1rioJ6MX5kkgKARceOaYoNFmlvXHOHcu1nzVqLWQAx8ffdOWK
p6pA/XYhs9SEHh7rhF1I2jhg3L9T9Y4HLjOgn64AjKVBzFHuHZAE+uBBjBryqzPY
OpztM0/b50Xai/4pfuueY98aGJPDtQ0EOvc6VPqfLUhbepypEKGNEv9mStACGDs5
X4b8Qz9vxbEmhbh+hgK/vps9/qNX8X7QuGWmI3OB69Yo4jVgn5F/LnB8a6brj4Mf
8+NA0T8USG1++p7BYfeqqJKGMwIzwXo81nxv6l8eFnnDgotxFL11JVDML+tXnrVu
KSZAN6uQqQsj1lwglBEN3/t2tHv35r3zLQV67iMbcXU1sO+J6XC/3FfnbldtORuE
hGVok9kAYb9/KkKnSwLdeE+Nx6XURBtkr2cQuBxk/opDcNn9wF2O9VhjMHpajcc5
d/MffC6w+riYG066P1BRsBHozJB9EQL0Vinq8d5hKCFm6vizQH0x1ExxG4lkVTLC
hhANZtS5sZMJD7ycCdeMgtqnLNX+Bv48nQCiYjphja0p3U0Wl8XxQbz9gnmIEp4I
28Jv+fmowW0/UNVJDJU2NlwRlGSmqr0ctSjKwT9cOPWaKDHIS28=
=my/u
-----END PGP SIGNATURE-----

--08ATZu8fEq0x2T3M--
