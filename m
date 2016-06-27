Received: by 10.25.21.96 with SMTP id l93csp1132449lfi;
        Mon, 27 Jun 2016 07:01:59 -0700 (PDT)
X-Received: by 10.129.128.199 with SMTP id q190mr12594813ywf.319.1467036118982;
        Mon, 27 Jun 2016 07:01:58 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a3si17243362qkc.229.2016.06.27.07.01.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 27 Jun 2016 07:01:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au;
       dkim=fail header.i=@messagingengine.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58890 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bHX6s-0007BA-Ei
	for alex.bennee@linaro.org; Mon, 27 Jun 2016 10:01:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46126)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1bHX6k-00076U-LD
	for qemu-arm@nongnu.org; Mon, 27 Jun 2016 10:01:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1bHX6e-0004eT-JL
	for qemu-arm@nongnu.org; Mon, 27 Jun 2016 10:01:50 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:46834)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>)
	id 1bHX6b-0004c7-Vx; Mon, 27 Jun 2016 10:01:44 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
	by mailnew.nyi.internal (Postfix) with ESMTP id C8378EF9;
	Mon, 27 Jun 2016 10:01:28 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
	by compute2.internal (MEProxy); Mon, 27 Jun 2016 10:01:28 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=leunv
	zOqqj3uB8uHCdYbDxyyn/Q=; b=LoEfEy/q513Vk5UUc3BLsryRIn4vH2/lry3mG
	B0O/IVjwByJxrGOqQDqnxh3H0Hw62LgxdkyeSSBX7CKhe3+p7zdYlh0scBvCTWq5
	tqniJJUZFqvPbVkFzwFSDOUeuSZcKMEeRzZgyKVMwRPWdRYp84SgAioFXIgbJGrN
	bkXu2U=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-sasl-enc
	:x-sasl-enc; s=smtpout; bh=leunvzOqqj3uB8uHCdYbDxyyn/Q=; b=LFxvC
	Ipkeu9QTSmQgmuRApgJpji7MKEoqMKbElX2m4R5kwGANWXUUi0KZhHzcVzPu8oyD
	FKAJa3iB1iYSksKy9INMHOvtwY3Pp5TihMPYbWB8GVGqXQpzsdZMfdEDGH8IUuVN
	S3guFxf21oPntctnmt1HkkSoGFmZCXCWEna5sE=
X-Sasl-enc: dv9856UHLb0DNFGDbqnC/eP1zBs6jrmN+2Uc37+06Uuk 1467036086
Received: from keelia (ppp203-122-213-247.static.internode.on.net
	[203.122.213.247])
	by mail.messagingengine.com (Postfix) with ESMTPA id DA4F3F29FA;
	Mon, 27 Jun 2016 10:01:23 -0400 (EDT)
Message-ID: <1467036075.23740.176.camel@aj.id.au>
From: Andrew Jeffery <andrew@aj.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Jun 2016 23:31:15 +0930
In-Reply-To: <CAFEAcA-bDq2aLFdipC2ZGGnCbCG=NB8=S7xw2h1u5BAkL2=MbA@mail.gmail.com>
References: <1466744305-23163-1-git-send-email-andrew@aj.id.au>
	<1466744305-23163-2-git-send-email-andrew@aj.id.au>
	<CAFEAcA-bDq2aLFdipC2ZGGnCbCG=NB8=S7xw2h1u5BAkL2=MbA@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-O3Y7mv8rA+35Xl/P0RPV"
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.111.4.221
Subject: Re: [Qemu-arm] [PATCH v3 1/3] hw/misc: Add a model for the ASPEED
 System Control Unit
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	=?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6AoWwy0o4OSt


--=-O3Y7mv8rA+35Xl/P0RPV
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2016-06-27 at 14:42 +0100, Peter Maydell wrote:
> On 24 June 2016 at 05:58, Andrew Jeffery <andrew@aj.id.au> wrote:
> >=20
> > The SCU is a collection of chip-level control registers that manage the
> > various functions supported by ASPEED SoCs. Typically the bits control
> > interactions with clocks, external hardware or reset behaviour, and we
> > can largly take a hands-off approach to reads and writes.
> >=20
> > Firmware makes heavy use of the state to determine how to boot, but the
> > reset values vary from SoC to SoC (eg AST2400 vs AST2500). A qdev
> > property is exposed so that the integrating SoC model can configure the
> > silicon revision, which in-turn selects the appropriate reset values.
> > Further qdev properties are exposed so the board model can configure th=
e
> > board-dependent hardware strapping.
> >=20
> > Almost all provided AST2400 reset values are specified by the datasheet=
.
> > The notable exception is SOC_SCRATCH1, where we mark the DRAM as
> > successfully initialised to avoid unnecessary dark corners in the SoC's
> > u-boot support.
> >=20
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > ---
> > Since v2:
> >=20
> > * Fix mixing of offsets and register indexes
> > * Sanity check device property values
> > * Move trace event definition to hw/misc/trace-events
> >=20
> > Since v1:
> >=20
> > * Move reset values into SCU implementation (also make register defines=
 private)
> > * Expose silicon-rev property which is used to select appropriate reset=
 values
> > * Expose hw-strap1/hw-strap2 properties for board-specific SoC configur=
ation
> >=20
> > =C2=A0hw/misc/Makefile.objs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0|=C2=A0=C2=A0=C2=A01 +
> > =C2=A0hw/misc/aspeed_scu.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0| 284 +++++++++++++++++++++++++++++++++++++++++++
> > =C2=A0hw/misc/trace-events=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0|=C2=A0=C2=A0=C2=A03 +
> > =C2=A0include/hw/misc/aspeed_scu.h |=C2=A0=C2=A034 ++++++
> > =C2=A04 files changed, 322 insertions(+)
> > =C2=A0create mode 100644 hw/misc/aspeed_scu.c
> > =C2=A0create mode 100644 include/hw/misc/aspeed_scu.h
> >=20
> > diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
> > index ffb49c11aca6..54020aa06c00 100644
> > --- a/hw/misc/Makefile.objs
> > +++ b/hw/misc/Makefile.objs
> > @@ -52,3 +52,4 @@ obj-$(CONFIG_PVPANIC) +=3D pvpanic.o
> > =C2=A0obj-$(CONFIG_EDU) +=3D edu.o
> > =C2=A0obj-$(CONFIG_HYPERV_TESTDEV) +=3D hyperv_testdev.o
> > =C2=A0obj-$(CONFIG_AUX) +=3D aux.o
> > +obj-$(CONFIG_ASPEED_SOC) +=3D aspeed_scu.o
> > diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
> > new file mode 100644
> > index 000000000000..ff231dbb3c17
> > --- /dev/null
> > +++ b/hw/misc/aspeed_scu.c
> > @@ -0,0 +1,284 @@
> > +/*
> > + * ASPEED System Control Unit
> > + *
> > + * Andrew Jeffery <andrew@aj.id.au>
> > + *
> > + * Copyright 2016 IBM Corp.
> > + *
> > + * This code is licensed under the GPL version 2 or later.=C2=A0=C2=A0=
See
> > + * the COPYING file in the top-level directory.
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include=20
> osdep.h provides this, you don't need to include it yourself.
>=20
> Otherwise
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>=20
> so if this is the only problem with the series I'll fix it up
> when I put it in target-arm.next.
>=20

As far as I'm aware that's the only issue aside from the discussion on
patch 3/3.

Cheers,

Andrew
--=-O3Y7mv8rA+35Xl/P0RPV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXcTGrAAoJEJ0dnzgO5LT5iDMP/1hsTKtt4rjxcxEpObrKR/Ks
7g1Iem4bnvudhTYWXjvv80zcWPb//0oL/ClJIAxU+Osyokhqmj959z8+BRBS9Nm2
K1sKKMyApFcpoeJbEL/XkYYztKfAozwW2T7DnyuFsuuU8Uojxl2EE2nuVWmNRaAS
W1m1mKa7w5FVQQ+Lq6yvmC/4fSwTRgk72eOzBTu6wXJdvgTG7FX8CctSHvzzueM4
fJEt/HEBZek/tpjriEJLjh0hNaMCkXNLthi3+GA7MIK3WkN+ISR9rfDiNei3gGSF
WsAYbEzUpzLlNKDMvPS0ieHT2Gahnr5y68bB3s1BrF0PU9l6SfzoWMEqUobQ+oi/
RDRWmKKzNlAQ3KsOxI50bwUQ1kx2xFO4WNcFFwb9h49DKY8XiMvLpO+XIDLDrEIZ
b8wRFkGjTB1CplpiefGwf8UiV6Qp1HHiH9aVfmysslmpBmPOFEERWTBeLCtnw1iM
ILC0L8PfVFP4Lg8omfeGyhjH55+Be6jGdi7RlFGqcvD41apum+P7wpbnUkOMsKJe
PEtA4Qwcf+QGjR46F4lVQP9DiELyzwYRqCLVS/7+qP9F6L2H2pA6Eg7ASOADrv0M
x6rMuA2loWtxdNscScNokCaQmDPX0BeYtteIRyTME1uh7Dz2Eydc8cT4Jn82VZFR
zXuDn86A3307bbuxFhqt
=8yUR
-----END PGP SIGNATURE-----

--=-O3Y7mv8rA+35Xl/P0RPV--

