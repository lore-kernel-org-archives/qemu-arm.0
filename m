Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1288888lfm;
        Wed, 22 Jul 2020 20:08:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzc2FR4xEcMinHL9Kz3CyOzXK5mlmpTDTHrMPJNBeCSca9TtNk7Bt2GLevK+iukeeoBieUp
X-Received: by 2002:a17:90a:154c:: with SMTP id y12mr2338062pja.158.1595473724888;
        Wed, 22 Jul 2020 20:08:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595473724; cv=none;
        d=google.com; s=arc-20160816;
        b=pt4TRJmDIWBTroS8S7bmDFeiUZkW3C6DilLsi9ZD4WiniXQPY4LKyG2xQi9YsIhmP6
         FCb4FewAyBJTJnYTharzWjXXLTy4z4dWEmepqVrxMxf21cxnM1E1UJaUq/P0PPJ/b03h
         a9TEDjJza+MP+ZuARBz475g1K/K9PuPXPseFh7AMpQlyAi3uDwPLOUeTh+yVuNUEsPEs
         13mLbCbpnhC9Pb/JaUTb543YpCnGJgIqrGn/92RkZzQgW8Z2fSmtKNfWANiio0J2usr/
         f9MazymOVIUkqejIvGyBMx1H/dAFIblUyKOCm/k+CbEtr2nNkaFIDv9Us5ufYtohXYmJ
         IR8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=IkRk5TMPs++R2xEq+UHmEsC1XUf1QNBQDmXtTxrYiOU=;
        b=kdNHwmYZqwncPAnGyPjZevMOx6ASTiXRnhOKmWDyyQQ7FwwQ8obgemtsgFplUSrL9t
         RI2rpxfagIsneMCebMf85zgavQ62eRfJgc/cc2tFyz46MxD25m3QLitNVQJ3uW2kaoyR
         TlpuTlot+bM+P4as51NQL/XlA1mD4mnvp8ah0hdPBS5wjl2ElUOkbJWTWwZQ34a9vP2X
         jVwbSF4z+LoVy0WFD+ufEk5PRUG9/Voe1uBjmKSWLbZvDy7H5by7n8O+wJaHjqZkmByi
         vsRaHqlN7zRV9zB+A8qLRMbW6Kd+wiOq1f7effSUT4NNPPzjzz8QkpISegddGengTzGe
         nTKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gibson.dropbear.id.au header.s=201602 header.b=Tn5K2CNJ;
       spf=pass (google.com: domain of dgibson@ozlabs.org designates 2401:3900:2:1::2 as permitted sender) smtp.mailfrom=dgibson@ozlabs.org
Return-Path: <dgibson@ozlabs.org>
Received: from ozlabs.org (bilbo.ozlabs.org. [2401:3900:2:1::2])
        by mx.google.com with ESMTPS id e9si868818pgv.293.2020.07.22.20.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2020 20:08:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of dgibson@ozlabs.org designates 2401:3900:2:1::2 as permitted sender) client-ip=2401:3900:2:1::2;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gibson.dropbear.id.au header.s=201602 header.b=Tn5K2CNJ;
       spf=pass (google.com: domain of dgibson@ozlabs.org designates 2401:3900:2:1::2 as permitted sender) smtp.mailfrom=dgibson@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1007)
	id 4BBy2v3xSFz9sRf; Thu, 23 Jul 2020 13:08:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1595473719;
	bh=8gO8lrXm9Zs06bXFiLzN1vzF+m8bshGnphaA+b13KCA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tn5K2CNJ5aUz8S411SpZaQbNzRgyxKuhLV+kQOmsTz5/4lM7ElYWXQnDfNSOIKLzq
	 vJkjPiiBpD6QEud4HJ9fBRkr0h3hr6yNnqn5qmU3YHJgdmj4bZF4gzUWR7dOfSFYc8
	 TdL/vK1EIDMIpqF08oOWYM6u1HN+uOJ0vQ3PHFC4=
Date: Thu, 23 Jul 2020 13:07:11 +1000
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
Subject: Re: [PATCH v3 4/8] ppc/e500: Use start-powered-off CPUState property
Message-ID: <20200723030711.GO5513@umbus.fritz.box>
References: <20200723025657.644724-1-bauerman@linux.ibm.com>
 <20200723025657.644724-5-bauerman@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+wSiqF7c0ySQ2tNi"
Content-Disposition: inline
In-Reply-To: <20200723025657.644724-5-bauerman@linux.ibm.com>
X-TUID: ozip5yGiZVIZ


--+wSiqF7c0ySQ2tNi
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 22, 2020 at 11:56:53PM -0300, Thiago Jung Bauermann wrote:
> Instead of setting CPUState::halted to 1 in ppce500_cpu_reset_sec(), use
> the start-powered-off property which makes cpu_common_reset() initialize =
it
> to 1 in common code.
>=20
> Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>

Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/ppc/e500.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>=20
> NB: I was only able to test that this patch builds. I wasn't able to
> run it.
>=20
> diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
> index ab9884e315..dda71bc05d 100644
> --- a/hw/ppc/e500.c
> +++ b/hw/ppc/e500.c
> @@ -704,9 +704,6 @@ static void ppce500_cpu_reset_sec(void *opaque)
> =20
>      cpu_reset(cs);
> =20
> -    /* Secondary CPU starts in halted state for now. Needs to change when
> -       implementing non-kernel boot. */
> -    cs->halted =3D 1;
>      cs->exception_index =3D EXCP_HLT;
>  }
> =20
> @@ -897,6 +894,13 @@ void ppce500_init(MachineState *machine)
>          } else {
>              /* Secondary CPUs */
>              qemu_register_reset(ppce500_cpu_reset_sec, cpu);
> +
> +            /*
> +             * Secondary CPU starts in halted state for now. Needs to ch=
ange
> +             * when implementing non-kernel boot.
> +             */
> +            object_property_set_bool(OBJECT(cs), "start-powered-off", tr=
ue,
> +                                     &error_abort);
>          }
>      }
> =20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--+wSiqF7c0ySQ2tNi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl8Y/t8ACgkQbDjKyiDZ
s5IrjxAAj8w1dlpy4ndOgDi84moUQXy+GpWtzsFjdyjozBcz3RxkW8RVZVDBQiG3
fz+IFQqf0BKgOiKX5gM6s69g0AFl3y632eq4aOViJZJHnEdsn/V2Prl50yKZHD14
MabdK7GjI6hv9ird5V6Gmv2mI+Yhfz9+9woz5S6y7ZTWWwx8LyynvLzFJR1D+3eF
5ETb8fBXri4jeFqfy1upW0miKJrn/BaKbx1f0Wk0RJ793AbhHgO9f/X5xRIb8sZG
9k2U1cLP6VClKQ0Y0zKq6kMyFikSiiC+Iyj9jgO2w+SOCFoSKD3U3T4ehum7n+d8
OY9Tt3JdUGQU/oa5HwJleON/da0hzEtGdjBR2M4Ozmzv4JLtKS1P0kgDd6c5U/00
kzIT2eS/mM7nG6E2WEgd78EswDdqwcrdZA/fNtJYkAf/ghrSpk+RolYAkikpLIiZ
9KXZwUBv99DelCl1rbFSKhidmgirzTQIh1WtkbTlXfXLAUKo2RLDj8513O8klxh4
yBnw2TmjQ0GJbc/nOOvDuqMT9VfsLmVxSdzBEIRbl9XgMX6aHxxOjVOH5J17JPIp
DNoaax7ybgEMFhBmPYdOD0ZmYCjK9WhROZzR4jowO8k79Am58eZo2IizzGvo6MiZ
WUZAJTghW5nDlBbCKsr68/QeVB45Hqn36MwkiKcDkklKJkUlr3c=
=Qpx7
-----END PGP SIGNATURE-----

--+wSiqF7c0ySQ2tNi--
