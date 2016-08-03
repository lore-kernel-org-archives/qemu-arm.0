Received: by 10.25.21.156 with SMTP id 28csp465494lfv;
        Tue, 2 Aug 2016 17:24:54 -0700 (PDT)
X-Received: by 10.237.37.99 with SMTP id w32mr102168044qtc.59.1470183893932;
        Tue, 02 Aug 2016 17:24:53 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g2si606631qkf.151.2016.08.02.17.24.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 Aug 2016 17:24:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au;
       dkim=fail header.i=@messagingengine.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59518 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bUjzR-0004K6-Ag
	for alex.bennee@linaro.org; Tue, 02 Aug 2016 20:24:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51017)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1bUjy6-0002vP-Hw
	for qemu-arm@nongnu.org; Tue, 02 Aug 2016 20:23:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1bUjy0-0007HX-IV
	for qemu-arm@nongnu.org; Tue, 02 Aug 2016 20:23:29 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:48914)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>)
	id 1bUjxz-0007BJ-Ts; Tue, 02 Aug 2016 20:23:24 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 61866204C2;
	Tue,  2 Aug 2016 20:23:11 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
	by compute7.internal (MEProxy); Tue, 02 Aug 2016 20:23:11 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=VtsAg
	56kraub3xxmnH4ma2I/EoE=; b=ZZaCq9eu2MwiOIAcIlFXYUsmas+FI1GM8a9gm
	yfhS04T1P2vQgmwSZz0knxNLk7je44YycSUY9Hp0+77xw27bb8EL/d04ZQ34OXDB
	ak3nIEUr9YJRtIh93SLW/act7IdtTK3EAIjms2M6er7RPuUd2X9dQPJwSFurh22M
	PrXVV8=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-sasl-enc
	:x-sasl-enc; s=smtpout; bh=VtsAg56kraub3xxmnH4ma2I/EoE=; b=QpTBr
	orAkeSaWTPcK0Clbs8O13ALchIQBSYxWTNW9QjhcifHwXqc3ckHebetAt8bvf4ra
	V0MTLEqubhKyK56GUWRFlVx6ylKpq8sqrf+ewzxWWe28IgZvvcd+ekJ56aQgc43K
	s/Nmc8JLWxyE+7FGylsZfapNe4Zc0apKC51Eww=
X-Sasl-enc: 75g+u5tpfyxd4NgqIaktjqAvvbWsZxP5aEa/xr1C2Q+L 1470183790
Received: from keelia (unknown [203.0.153.9])
	by mail.messagingengine.com (Postfix) with ESMTPA id 6763ACCDCC;
	Tue,  2 Aug 2016 20:23:09 -0400 (EDT)
Message-ID: <1470183785.4428.45.camel@aj.id.au>
From: Andrew Jeffery <andrew@aj.id.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, Peter Maydell
	<peter.maydell@linaro.org>
Date: Wed, 03 Aug 2016 09:53:05 +0930
In-Reply-To: <1470158147-16378-11-git-send-email-clg@kaod.org>
References: <1470158147-16378-1-git-send-email-clg@kaod.org>
	<1470158147-16378-11-git-send-email-clg@kaod.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-vGi9XBhSfvpJx6j5uXym"
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.111.4.29
Subject: Re: [Qemu-arm] [PATCH v3 10/10] palmetto-bmc: remove extra
 no_sdcard assignement
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7I0pV9i0Tutk


--=-vGi9XBhSfvpJx6j5uXym
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2016-08-02 at 19:15 +0200, C=C3=A9dric Le Goater wrote:
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> =C2=A0hw/arm/aspeed.c | 1 -
> =C2=A01 file changed, 1 deletion(-)
>=20
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index e71500c64bd3..6d7b70df70da 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -145,7 +145,6 @@ static void palmetto_bmc_class_init(ObjectClass *oc, =
void *data)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mc->no_sdcard =3D 1;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mc->no_floppy =3D 1;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mc->no_cdrom =3D 1;
> -=C2=A0=C2=A0=C2=A0=C2=A0mc->no_sdcard =3D 1;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mc->no_parallel =3D 1;
> =C2=A0}
> =C2=A0
--=-vGi9XBhSfvpJx6j5uXym
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXoTlqAAoJEJ0dnzgO5LT5sscQAJA7oHfd8ctLE3HEdib+NdEn
2v4NyFrx9LpV/LaRTIeiP+N+ICHnqGOQ/ijifnSZO5w01Z9owxKeI+OTcy6gwMDT
nqXoYnp9gQFuYJJVCU45NotTOr4jq2qrfkTdfswr9UZiQOdOMwz0th7lh4pYoBWt
OAoy5mF3l4dAGIACdJlhMAmTxaSve50gvAlqZYGIaeYDfmI/O1KIR8+qUHBpenSu
SvXxI4Ux1G3wkTEAGZwurYentKWSMruiListo7JfZkVSAMjiT4VzrfcdrQDv75uP
X1c+VQi9a4j4SkYvPOPLlB3Oclv0j+zxWHMC0jv++j0ctBR3mpmCToVOpfJkv112
15JFw9PABt8sndYgJRGIf9l11AamwIaAOkxPtOI27kcEtGGRAmPQXzgj1jZO0b3D
GbGSSoCEWuklZRaaxM12CKZocgSxuO2C46IVir4zlrWadfsqFM1jmZiuW3dDDmU/
TmdCUFM/nM+ylEMdsgBUzVhYQJu8wrgFDo9Qnap73ZbVEihTX0ETh22Jb7n79OXI
jCVdLt8XqHls9grHAXhPh/ZvVDQhDqMi6B2h6lNnYIXP4iDo4bvmrx9/fFSWYkUV
HlI9+vVq6uXFKrHFAdRcaYDIkHqccnyQjtGdv0sCrqo56i6VeD2RWs7pGB9A/dVs
K4COIr2sjMtbmZNxLy3p
=lG63
-----END PGP SIGNATURE-----

--=-vGi9XBhSfvpJx6j5uXym--

