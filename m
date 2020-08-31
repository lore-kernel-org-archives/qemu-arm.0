Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp3485045lfc;
        Mon, 31 Aug 2020 00:52:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwv1xG9BvaaRLOJwkUGP37F/o7cjSX+NsCPU0dzOi7RLI9vxapIZvq67xcCs5Wl/haq4VEU
X-Received: by 2002:a17:90a:af82:: with SMTP id w2mr267312pjq.185.1598860357206;
        Mon, 31 Aug 2020 00:52:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598860357; cv=none;
        d=google.com; s=arc-20160816;
        b=rWwYE6hL+bgNLBQXZnHiV3+AUX3ePVb4GfuArl7EPee56YRMFg84VUhqpdq/LhC6RH
         xPff/4JRofyHqQcduCCRa6s+RLwISgH9GCyDI9epRV6t/J3jp50GZNFggGE73A3xKX8L
         bKNqPed9yYIxMo/sgGbgruhI1M/8rv/TjayveRZXL0pbg50U+b5+5EQgtNfh8N77kQIB
         TpybkTbdSVASUrHA7PQ9HrdrYgOE2NUm2w0WYIgku2+Ztjo2ZGzIc3MXeuXC7P+lRTAg
         /pHCzKb/V+CeyARfzj0fT238XSZUONkBoxiFvsLc+YeYCNd4PX20ehce8dhjqWVKfLnz
         zn3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=q6RYifNuCeeD8ZaatiJrSQEwz+sAVZUBSfVjwS4MJ/g=;
        b=YN1P1LJdG6xO1MXPw+1mciCSIyKwYg2MWZa4F/1kGyzcRbeD/aW5g1o8YLN3zDDXC1
         8ctUTeAj4u0cdJLinwNJlyZLFTdzbBQg1QU1qxRMM8HmuWzjMxuhVGLFMvUgVxd4kuiN
         K7u09ORlun5t/OJCknwAqvstk3iZ+wkMeuljfVC5T5RFOLyAhLS0wpNWW2haCJqJ6WNE
         QC3mArZyAVoYJIHawNLe5z2SjpcThhKCgao4IzoKHkbm6hjtMyzu/4oacnKTsAolDaFZ
         f6tGhx1XoiLVGsF6Br99hf/KLtNHSB6QWcz7PmAdNRIXLkH04YqZE+fdGQAlFAX0EWH0
         0iZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gibson.dropbear.id.au header.s=201602 header.b=l0CeQ2gr;
       spf=pass (google.com: domain of dgibson@ozlabs.org designates 2401:3900:2:1::2 as permitted sender) smtp.mailfrom=dgibson@ozlabs.org
Return-Path: <dgibson@ozlabs.org>
Received: from ozlabs.org (ozlabs.org. [2401:3900:2:1::2])
        by mx.google.com with ESMTPS id f1si5257237pln.406.2020.08.31.00.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2020 00:52:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of dgibson@ozlabs.org designates 2401:3900:2:1::2 as permitted sender) client-ip=2401:3900:2:1::2;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gibson.dropbear.id.au header.s=201602 header.b=l0CeQ2gr;
       spf=pass (google.com: domain of dgibson@ozlabs.org designates 2401:3900:2:1::2 as permitted sender) smtp.mailfrom=dgibson@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1007)
	id 4Bg2VR3TSyz9sTR; Mon, 31 Aug 2020 17:52:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1598860351;
	bh=j7Pg/+o+2Zl1CQBnDPEYvhh4lLMgzDlyUg1wtA2geHA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l0CeQ2grdjx2AkEG48fI9GnX1UwmaHnwOfo034ZSnoSxscSBkn2nitUDadVzeZqKf
	 tqFYwbCZpGvz5n0DS8gJxA8uZBwS9Lv10QMrX9DhuEuj8kNOs0E78aB8Jf7cSivN90
	 H8dms3dosZYVGvNY2H1Ey137+FgrpBCRgg8JwX3I=
Date: Mon, 31 Aug 2020 16:50:10 +1000
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
	Greg Kurz <groug@kaod.org>, Igor Mammedov <imammedo@redhat.com>,
	=?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH v7 0/8] Generalize start-powered-off property from ARM
Message-ID: <20200831065010.GB36360@yekko.fritz.box>
References: <20200826055535.951207-1-bauerman@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BwCQnh7xodEAoBMC"
Content-Disposition: inline
In-Reply-To: <20200826055535.951207-1-bauerman@linux.ibm.com>
X-TUID: eLP6SPBeDkE1


--BwCQnh7xodEAoBMC
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2020 at 02:55:27AM -0300, Thiago Jung Bauermann wrote:
> This version fixes `make check` failures in ppc/e500.c, mips/cps.c and
> sparc/sun4m.c. This was done by moving the qdev_realize_and_unref() call =
as
> close as possible to the object_new() call, in order to keep the CPU obje=
ct
> construction as similar as possible to the earlier version which used
> cpu_create().
>=20
> I also had to change the patch which removed the main_cpu_reset() function
> from sparc/sun4m.c. It was causing a `make check` failure but I can't
> really explain why. See this message for a few more details:
>=20
> https://lists.nongnu.org/archive/html/qemu-ppc/2020-08/msg00419.html
>=20
> I dropped the Reviewed-by's on the changed patches because of these
> changes.
>=20
> Original cover letter below, followed by changelog:
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

Applied to ppc-for-5.2, thanks.

> Changes since v6:
>=20
> Patch "ppc/e500: Use start-powered-off CPUState property"
> Patch "mips/cps: Use start-powered-off CPUState property"
> - Moved setting of start-powered-off property and qdev_realize_and_unref()
>   to right after object_new(machine->cpu_type).
> - Dropped Philippe's Reviewed-by due to this change.
>=20
> Patch "sparc/sun4m: Remove main_cpu_reset()"
> - Dropped.
>=20
> Patch "sparc/sun4m: Don't set cs->halted =3D 0 in main_cpu_reset()"
> - New patch.
>=20
> Patch "sparc/sun4m: Use start-powered-off CPUState property"
> - Merged secondary_cpu_reset() with main_cpu_reset().
> - Dropped Philippe's Reviewed-by due to this change.
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
>   sparc/sun4m: Don't set cs->halted =3D 0 in main_cpu_reset()
>   sparc/sun4m: Use start-powered-off CPUState property
>   target/s390x: Use start-powered-off CPUState property
>=20
>  exec.c                  |  1 +
>  hw/core/cpu.c           |  2 +-
>  hw/mips/cps.c           | 15 +++++++++++----
>  hw/ppc/e500.c           | 13 +++++++++----
>  hw/ppc/spapr_cpu_core.c | 10 +++++-----
>  hw/sparc/sun4m.c        | 26 ++++++--------------------
>  include/hw/core/cpu.h   |  4 ++++
>  target/arm/cpu.c        |  4 +---
>  target/arm/cpu.h        |  3 ---
>  target/arm/kvm32.c      |  2 +-
>  target/arm/kvm64.c      |  2 +-
>  target/s390x/cpu.c      |  2 +-
>  12 files changed, 41 insertions(+), 43 deletions(-)
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--BwCQnh7xodEAoBMC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl9MnaIACgkQbDjKyiDZ
s5IEkQ/8DMCeUYBs+hfS6Prc5Kt9ibKYTqT1tW5hDXCAJmwFpkD28HX3QJ04vL+Y
mbS6brjdVTvBqDY5SPg/yRyZf5CB9vwoWCzuJLgx8SeACx3QOGMXRvTR/Of5QcOk
5cOA4txCmh53dVjgwtO/0b7uF+6zuyx/cWKVIUBk/p1bGdzGLdK0HErF9nci/hWw
Zg5AydULep8TojWaWv5uRRBsLvhxjRgqY9T/DOcjbs5Ia3WluDhjZmYwLu8NKUK4
TpDeQdQUo0aw8p1mSp24PMbF4NlxUmb7ZGH2LfUskIUDi4p4PJXInVC2oSibsl4q
zb1eJ4y0OxP8lscP9JobFHtre9GRNe1NpHKm5UImkWfiMT8vFwPFYwjPikAMPVNO
qjK6mTX6OSc+Z/36coZEueV6G9RTS4CLXfnt4tp8QMND4JtUP+jhX6/PIve7Q2xg
Bh74eYtd5nYnhMv/fuwlQiGWcODeI6C65Zqta3gWUAKu/bSuPn7Wb62+dET17He1
UNNob8zUmROhUp2BoHl80GIiy4sFCItajK+f6KK4QHsoCAdhM8lcZKBHXIrXuQGQ
3pvQ5wFtpZnQOjBdYEGaq3mx3hPrzPbDE9FYLTHHv8qCxO5/vRLVopwmTW1Ty0bW
skkn+cpNLTqE+v9UqWbuzVgyR2GzOCbJLQoNV6IPbHA8rfLU3oM=
=yZCC
-----END PGP SIGNATURE-----

--BwCQnh7xodEAoBMC--
