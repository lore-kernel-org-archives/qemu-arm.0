Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1288892lfm;
        Wed, 22 Jul 2020 20:08:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzb1X7wNFM7IuCRESnYxEUpRyl7MWyhj594uChnfv0XNqF/Ebt+tjHZrbuFYAn+bU1/mLeR
X-Received: by 2002:a17:90a:bf09:: with SMTP id c9mr2156598pjs.221.1595473725396;
        Wed, 22 Jul 2020 20:08:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595473725; cv=none;
        d=google.com; s=arc-20160816;
        b=wXCgRT/g5MdAEuUCpHdeH9KKgwSu0vnCGarRWlPYnYjXo4Dx+kQtJTGdqfNHZdIty3
         6husiK6Y4RPL9OcASsMCpE6xMWbLe9miGTD23CsZU0kBUkMxE2igefCLZLGpWZky/7pd
         /dlLmYMIZ9CKjb3PWvkAGegScGyT8VYt3vTQlr+oJBq5wvxny37Gh/blaE2Fc/oO8ybx
         f4JjJzQq2PZ+KP654DRpJ0MAPhR1s3L1tF2MNO9ZBYbdCPDu071ZdV5vho8kI+VSi/H5
         buV6EKU1iXJPWaA3QiTpIJ3ykVeWVhImLO2pb8c1ucCtQxKboMfn/Wi5QAsXW3MyZ0vh
         IjFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=Rq789xZprQiOSsxChPVuDV+JaEb4OQjyrr2t2J2n4Pk=;
        b=ZsgS5ZCGh8lvENZmn4PgKQeM5d3AU0oywZT/omDr2B7vvaIuAr3amjlNvxCw3we0xi
         ohXKciuNW9lvhp242nQpZqDcLGtl7fgjRagABjhPIEFZdK7Z23OAbr6NNHX3KHCB7YFF
         d6H5kXIHfmeortyIoDCqfXFM1RKQhxrK92N1y3/YhKy3W6koUfRMheaKImHbZj72OW+7
         H+7BBMIBZBfj6yvhjxVd73Dr2g9KS20S4T51LfALGTgMeSUerfXPZ1iNGqDtfcMkSCxr
         nDvsHGpT8o0o4NSdNMIQLsjxNvDi3JBjyCh+QtjS4XFd/MTH85ZTcKev5a6fLArEdR1v
         SA2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gibson.dropbear.id.au header.s=201602 header.b=izDzb1gD;
       spf=pass (google.com: domain of dgibson@ozlabs.org designates 203.11.71.1 as permitted sender) smtp.mailfrom=dgibson@ozlabs.org
Return-Path: <dgibson@ozlabs.org>
Received: from ozlabs.org (bilbo.ozlabs.org. [203.11.71.1])
        by mx.google.com with ESMTPS id p67si1053382pjp.77.2020.07.22.20.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2020 20:08:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of dgibson@ozlabs.org designates 203.11.71.1 as permitted sender) client-ip=203.11.71.1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gibson.dropbear.id.au header.s=201602 header.b=izDzb1gD;
       spf=pass (google.com: domain of dgibson@ozlabs.org designates 203.11.71.1 as permitted sender) smtp.mailfrom=dgibson@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1007)
	id 4BBy2v5bhVz9sRk; Thu, 23 Jul 2020 13:08:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1595473719;
	bh=NSGEymlD5gk/g8XY4FPk2eLjlQXVwxFnFpnfdbXwPsk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=izDzb1gDnm5JJkgkhLtpfjm3OLioMgy+3A9pa3pg3ZG/SHKorBUxkeW3lD+kSvoYo
	 un0gZQOVra8VBFBhvj+tQBhaDcgz8CtFHLnDigy9C/YI9nsLf5b9MfrnQzggB/vVcJ
	 GFVLVQb+kGDhmvsxV7Fn4P/7Ghc0SHATHYOUCunw=
Date: Thu, 23 Jul 2020 13:08:06 +1000
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
Subject: Re: [PATCH v3 6/8] sparc/sun4m: Remove main_cpu_reset()
Message-ID: <20200723030806.GQ5513@umbus.fritz.box>
References: <20200723025657.644724-1-bauerman@linux.ibm.com>
 <20200723025657.644724-7-bauerman@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XG0jWBK27HhJN4nS"
Content-Disposition: inline
In-Reply-To: <20200723025657.644724-7-bauerman@linux.ibm.com>
X-TUID: xWZ3dU4XSd0W


--XG0jWBK27HhJN4nS
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 22, 2020 at 11:56:55PM -0300, Thiago Jung Bauermann wrote:
> We rely on cpu_common_reset() to set cs->halted to 0, so main_cpu_reset()
> is pointless.
>=20
> Suggested-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>

Revieed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/sparc/sun4m.c | 13 +------------
>  1 file changed, 1 insertion(+), 12 deletions(-)
>=20
> NB: I was only able to test that this patch builds. I wasn't able to
> run it.
>=20
> diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
> index 9be930415f..f1d92df781 100644
> --- a/hw/sparc/sun4m.c
> +++ b/hw/sparc/sun4m.c
> @@ -218,15 +218,6 @@ static void dummy_cpu_set_irq(void *opaque, int irq,=
 int level)
>  {
>  }
> =20
> -static void main_cpu_reset(void *opaque)
> -{
> -    SPARCCPU *cpu =3D opaque;
> -    CPUState *cs =3D CPU(cpu);
> -
> -    cpu_reset(cs);
> -    cs->halted =3D 0;
> -}
> -
>  static void secondary_cpu_reset(void *opaque)
>  {
>      SPARCCPU *cpu =3D opaque;
> @@ -827,9 +818,7 @@ static void cpu_devinit(const char *cpu_type, unsigne=
d int id,
>      env =3D &cpu->env;
> =20
>      cpu_sparc_set_id(env, id);
> -    if (id =3D=3D 0) {
> -        qemu_register_reset(main_cpu_reset, cpu);
> -    } else {
> +    if (id !=3D 0) {
>          qemu_register_reset(secondary_cpu_reset, cpu);
>          cs =3D CPU(cpu);
>          cs->halted =3D 1;
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--XG0jWBK27HhJN4nS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl8Y/xYACgkQbDjKyiDZ
s5LqkRAAtP6RrKQOrPdqCyervjeCAAFy40nwHcZaoo/OgYhZe7WGhhgCacb2e1iu
upPSAMaHOSx0KkQta4iPKu6s/tyZrCOfk9s4ISeSuDRw8G6SM7OIAKaMliubyz0i
rUGyGjGD+ZN0Pew+Uf/lCW5leWd4r18GSECwLUZHHNIOjiAPivqbR4U9DTG6DrNC
8k6jmVUL5SgP2GIWZy0YvmQjCpJWnsZaTShwIp/IrvNF0LhuaJvinQPDrn9n4bhT
ThGw+VJyHxuuX/XV4ifGUku1uzn7XF+k2dX4bjrdKAztP/w27Obr2JMOFaNiKMjk
+jXjmv2lzG8pZKll045uJMLK0b2GdOFCIG2etUrG0EoOBzuthA/bSH5Sk7F40a54
xvL/Zwwvb7raPtUpFDQ4APKzLDAPsjSOEo9U7Bf53Ee5OFEwH/jNKL+teXZrnLzO
qNnOsgH5oELJbjzruX2eW81RJCt+cPguUsUmsaPMwb7yoqliSyeqrzZ2tdJrQa5S
nrSKlTId6/8aDAxXuejHwRIeanLaULD3zZs9DkEAOzTncqtm4najtaMyQVXGZntZ
QEhf/XHGFXvgUzMRgq+3S6sA8Cn+iZG2KXdXhxbhrQwBc7/tlRe5eFMOSlJpl+go
iGhbFRvlS4UZ2RlAmt2iVUZQDtHKgC7AkHio0qI1eyrsRjx9Jh0=
=M1UU
-----END PGP SIGNATURE-----

--XG0jWBK27HhJN4nS--
