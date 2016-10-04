Received: by 10.80.163.71 with SMTP id 65csp2383654edn;
        Tue, 4 Oct 2016 16:37:27 -0700 (PDT)
X-Received: by 10.55.179.130 with SMTP id c124mr6709206qkf.295.1475624247638;
        Tue, 04 Oct 2016 16:37:27 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e79si4125426qkj.277.2016.10.04.16.37.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 04 Oct 2016 16:37:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au;
       dkim=fail header.i=@messagingengine.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45755 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1brZH5-0002UL-5W
	for alex.bennee@linaro.org; Tue, 04 Oct 2016 19:37:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54340)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1brZH1-0002Te-41
	for qemu-arm@nongnu.org; Tue, 04 Oct 2016 19:37:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1brZGw-0007Cl-SF
	for qemu-arm@nongnu.org; Tue, 04 Oct 2016 19:37:22 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:35413)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>)
	id 1brZGu-000794-HO; Tue, 04 Oct 2016 19:37:18 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 54BBB20BF5;
	Tue,  4 Oct 2016 19:37:03 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
	by compute7.internal (MEProxy); Tue, 04 Oct 2016 19:37:03 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=rb9tA
	K19Kr6XqtqL61s5Lhye7bM=; b=U3fWX1HQCMHH07lK8PJidSI9rVeMPqfujv7kK
	vTDRs+H7rrxIajggcn48VfNUtNgntT1c5c9nW/anf7sAf5mAX3Rikiv2UrJme+RZ
	RzxZxESkeLUCT+sWNYcDezWgS1zS5VqdcaXkPmZ4IMoKGlinKErsjEk3XIuaD0Xt
	rJYkdE=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-sasl-enc
	:x-sasl-enc; s=smtpout; bh=rb9tAK19Kr6XqtqL61s5Lhye7bM=; b=kTBLZ
	paZ7m0XHnPk57SEG7943WxoycAMtfAKU91I37JZDabvUDLyA5H12QaYefYz1ffVJ
	dJN2C405berLlmX2YtPUmGth3mVecdSLfBFGYBH6EPfFiEkeD/brl46O5jCNISGc
	f0zhWR5gNmd0t+tg+slitwTSzdo6KJOAftrdGM=
X-Sasl-enc: mtO4YfFbgJPO7RwjLwu5XDFnA1jpg+1ptC3P9JFaZpyp 1475624222
Received: from keelia (unknown [203.0.153.9])
	by mail.messagingengine.com (Postfix) with ESMTPA id CE334CC07B;
	Tue,  4 Oct 2016 19:37:00 -0400 (EDT)
Message-ID: <1475624216.5030.8.camel@aj.id.au>
From: Andrew Jeffery <andrew@aj.id.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, Peter Maydell
	<peter.maydell@linaro.org>, Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Wed, 05 Oct 2016 10:06:56 +1030
In-Reply-To: <1474977462-28032-6-git-send-email-clg@kaod.org>
References: <1474977462-28032-1-git-send-email-clg@kaod.org>
	<1474977462-28032-6-git-send-email-clg@kaod.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-xqqjFhBvZx9jNWasP4uN"
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.111.4.28
Subject: Re: [Qemu-arm] [PATCH 5/6] aspeed: create mapping regions for the
 maximum number of slaves
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
X-TUID: oE2KoDh8poPl


--=-xqqjFhBvZx9jNWasP4uN
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2016-09-27 at 13:57 +0200, C=C3=A9dric Le Goater wrote:
> The SMC controller on the Aspeed SoC has a set of registers to
> configure the mapping of each flash module in the SoC address
> space. These mapping windows are configurable even though no SPI slave
> is attached to the controller.
>=20
> Also rewrite a bit the comments in the code on this topic.
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> =C2=A0hw/ssi/aspeed_smc.c | 16 +++++++++++++---
> =C2=A01 file changed, 13 insertions(+), 3 deletions(-)
>=20
> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
> index 21943f4e5dfa..ecf39ccfde0e 100644
> --- a/hw/ssi/aspeed_smc.c
> +++ b/hw/ssi/aspeed_smc.c
> @@ -417,12 +417,15 @@ static void aspeed_smc_realize(DeviceState *dev, Er=
ror **errp)
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0aspeed_smc_reset(dev);
> =C2=A0
> +=C2=A0=C2=A0=C2=A0=C2=A0/* The memory region for the controller register=
s */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0memory_region_init_io(&s->mmio, OBJECT(s), =
&aspeed_smc_ops, s,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0s->ctrl->name, ASPEED_SMC_R_MAX * 4);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sysbus_init_mmio(sbd, &s->mmio);
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/*
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* Memory region where flash modules are re=
mapped
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* The container memory region representing=
 the address space
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* window in which the flash modules are ma=
pped. The size and
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* address depends on the SoC model and con=
troller type.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0*/
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0snprintf(name, sizeof(name), "%s.flash", s-=
>ctrl->name);
> =C2=A0
> @@ -431,9 +434,16 @@ static void aspeed_smc_realize(DeviceState *dev, Err=
or **errp)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0s->ctrl->flash_window_size);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sysbus_init_mmio(sbd, &s->mmio_flash);
> =C2=A0
> -=C2=A0=C2=A0=C2=A0=C2=A0s->flashes =3D g_new0(AspeedSMCFlash, s->num_cs)=
;
> +=C2=A0=C2=A0=C2=A0=C2=A0s->flashes =3D g_new0(AspeedSMCFlash, s->ctrl->m=
ax_slaves);
> =C2=A0
> -=C2=A0=C2=A0=C2=A0=C2=A0for (i =3D 0; i < s->num_cs; ++i) {
> +=C2=A0=C2=A0=C2=A0=C2=A0/*
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* Let's create a sub memory region for eac=
h possible slave. All
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* have a configurable memory segment in th=
e overall flash mapping
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* window of the controller but, there is n=
ot necessarily a flash
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* module behind to handle the memory acces=
ses. This depends on
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* the board configuration.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0*/
> +=C2=A0=C2=A0=C2=A0=C2=A0for (i =3D 0; i < s->ctrl->max_slaves; ++i) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0AspeedSMCFlash *fl =
=3D &s->flashes[i];
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0snprintf(name, size=
of(name), "%s.%d", s->ctrl->name, i);
--=-xqqjFhBvZx9jNWasP4uN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJX9D0YAAoJEJ0dnzgO5LT5aDEQAJO8v0shV/NmmbBrYi7ZqKk9
B2I3KsCl6r6K4u+vzqU2y0zjxTGhSSFumDo3zXBCaPRPG7I93y2KgKcjVfpEOxKO
jJRuwtB4okykDPhNi27Yd5aP5Je7cp1dFmxoxEXZEconTvxpVNUt2h91DA5b6z8p
9Tr1l0NR8quUC2llfj+ia1b3qWrKsE22qS+PKYWhkhfQ53rUgETYecc2pQcbd8hm
wNP2CPhinQOPsE57mFpgtw8BFtIWCswsrv6sI8QmNoemz02lM+czkobRFNf+W1gJ
W8kHRJSc+q5NblQpW/auzna3+/u2YCYz+mLmDA8+00wbzsyPwV7w5awGfmQ6xc7P
KEJTmgHmRb2KivTnjrZMYF1btzaLpIZ/HWv1Dr4tb9Y7cefETbxQdH+pMOxDKY8f
pQf5z6YWDxeV0dcqUt9XZDTUbrutTQ8K1Bsu44I7ShxReBrypzLKKFCuV4bIqdqa
ReAge1RGhLcSG1ys6fTCX4ydflTOCKKvokeMAkCmqgKLDs41oed2i1dlwHxKkRCK
UsPLRh9ZjPiHbhnK78AxsZOTUfCCQLXDGm/wDv3rrgwI5TqewI4yLCAgqTGrycmY
WZYEmoSyQbTbhk30lXLVzQ8yrQTlLyi09j4aiqMYPuTOWbYb/vVN7bsKpnxfx0MI
aMfw1K7zjDjHX9HShN0Y
=lSbr
-----END PGP SIGNATURE-----

--=-xqqjFhBvZx9jNWasP4uN--

