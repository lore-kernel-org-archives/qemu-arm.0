Received: by 10.25.150.194 with SMTP id y185csp1878310lfd;
        Tue, 8 Nov 2016 16:46:31 -0800 (PST)
X-Received: by 10.202.91.193 with SMTP id p184mr9513759oib.99.1478652390910;
        Tue, 08 Nov 2016 16:46:30 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f33si12566401otf.192.2016.11.08.16.46.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 08 Nov 2016 16:46:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36180 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1c4H26-00032h-7U
	for alex.bennee@linaro.org; Tue, 08 Nov 2016 19:46:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35759)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1c4H20-00032a-Ut
	for qemu-arm@nongnu.org; Tue, 08 Nov 2016 19:46:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1c4H1x-0002mH-1p
	for qemu-arm@nongnu.org; Tue, 08 Nov 2016 19:46:24 -0500
Received: from ozlabs.org ([103.22.144.67]:49905)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1c4H1w-0002ln-9N; Tue, 08 Nov 2016 19:46:20 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
	id 3tD6tX2zQlz9t1Q; Wed,  9 Nov 2016 11:46:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1478652372;
	bh=l2WoKOQnYpAxZReuR6aL+9/yo5CJITOYB6mcYk5WFzk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KEiqconZz3hZyOS3AMFfCPAR59kVG/EvkEARTGEZrGPSDy0r30VuZllO8FkjXvjh/
	UTCbeTNujKqKuDft7P3XfHCq3M5IbFkzfCnyQ/OnTVbfCNABS4w3AxNT1p8S0pGuZ1
	JTCx3XQ/HBL/ghvogP1QxD54qLKDzFrq2B9Xi2uk=
Date: Wed, 9 Nov 2016 11:38:18 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Thomas Huth <thuth@redhat.com>
Message-ID: <20161109003818.GZ28688@umbus.fritz.box>
References: <1478607473-25851-1-git-send-email-thuth@redhat.com>
	<1478607473-25851-5-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+vcRm3WFmV0Q/ShD"
Content-Disposition: inline
In-Reply-To: <1478607473-25851-5-git-send-email-thuth@redhat.com>
User-Agent: Mutt/1.7.1 (2016-10-04)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 103.22.144.67
Subject: Re: [Qemu-arm] [PATCH 4/5] MAINTAINERS: Add an entry for the CHRP
 NVRAM files
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <famz@redhat.com>, qemu-devel@nongnu.org,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Laurent Vivier <laurent@vivier.eu>,
	Max Reitz <mreitz@redhat.com>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eHdulE5mGbZ6


--+vcRm3WFmV0Q/ShD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 08, 2016 at 01:17:52PM +0100, Thomas Huth wrote:
> I recently added new files to the source tree that are not
> covered by any maintainer yet -- and since every new source
> file should have a maintainer nowadays, I volunteer to look
> after these files now, too.
>=20
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  MAINTAINERS | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5d8b584..05b1c97 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1093,6 +1093,13 @@ S: Maintained
>  F: hw/core/generic-loader.c
>  F: include/hw/core/generic-loader.h
> =20
> +CHRP NVRAM
> +M: Thomas Huth <thuth@redhat.com>
> +S: Maintained
> +F: hw/nvram/chrp_nvram.c
> +F: include/hw/nvram/chrp_nvram.h
> +F: tests/prom-env-test.c
> +
>  Subsystems
>  ----------
>  Audio

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--+vcRm3WFmV0Q/ShD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYIm/3AAoJEGw4ysog2bOSZeMQAKoRx7kUzdWw9QGQs9V1NBDH
EHkINRBVSUb6K+TDCIuAjt0Lv2el5EuxtAzEGSzf4/U2jYkgjdSQjrU5aTlAT1CN
eVhRfst5+raNdqQ70NlAg9WQORFPaRjSIg8xwVHEbk1jFT0M/Zld3rhLzT40h5VO
RZ3gKrqD0NNht/Oww50ADj4EyaNDrXcMiGx/jKLlVVTpThx+5l41NGnwYh0ZhwE5
7IkxMJyfKvUwJfgak0Ax57cNuDDK6EClrDA5ilfN13jGDx149x51EausNJ5z2Puu
vNRZMvEOl8BUfaKR1cxYI24/pCaLySpcZq0tpntg79/4oQ2wmT6AltxcAeAt+RO1
Cgv4Q4fQY6PTeEoNtmHvVT/VL5/0irI2/ze+zWwEFXFSgkDCxBkCO1Tz3r8b2E8x
Ou/pZg3lV3YtVTDBALvxZqXhQ9tf/TP4ZNXIa6DGfRhD2U5BceGk7UrzAgkSc2ka
aNaPFbIHbg6g3vYs/TNNOfUWx+cLWAgnT+Gq+YhqKZpVQh9X6PF8I7z+QdWxU4Z1
nPVM5vgNoVufliOYewRBZ0QAg16r0PB/1YGtd5jHzBt4gyGGhGJR8NG/1eSbiVIy
PTR6YS53u+BjO3bRcKKU+3jHdWNEM6R0a0nOiFsUsJrQM+fmFmijPPrHarhJvVtU
9RWV/JWhMDd/KTNdOdNl
=6aD+
-----END PGP SIGNATURE-----

--+vcRm3WFmV0Q/ShD--
