Received: by 10.25.21.156 with SMTP id 28csp610639lfv;
        Wed, 27 Jul 2016 22:12:26 -0700 (PDT)
X-Received: by 10.55.98.205 with SMTP id w196mr41298920qkb.65.1469682746885;
        Wed, 27 Jul 2016 22:12:26 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p145si3189894qke.290.2016.07.27.22.12.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 27 Jul 2016 22:12:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au;
       dkim=fail header.i=@messagingengine.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50894 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bSdcP-0006ZC-Oh
	for alex.bennee@linaro.org; Thu, 28 Jul 2016 01:12:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36448)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1bSdcM-0006Z1-3N
	for qemu-arm@nongnu.org; Thu, 28 Jul 2016 01:12:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1bSdcH-000339-O5
	for qemu-arm@nongnu.org; Thu, 28 Jul 2016 01:12:20 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:34495)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>)
	id 1bSdcF-0002yp-EG; Thu, 28 Jul 2016 01:12:17 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
	by mailnew.nyi.internal (Postfix) with ESMTP id 95DAC19F1;
	Thu, 28 Jul 2016 01:12:03 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
	by compute7.internal (MEProxy); Thu, 28 Jul 2016 01:12:03 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=5SBpc
	TA/ni0pADBUss84pLzpF+I=; b=ShGd+cAY7nGqxa/IaKSG+5prciFZ9nZaTZoy2
	D099eyB3R12LZC8s6x15wC8EXE35lhEZCv5oTA2aq8tLsrq0LMLD0wjrzvCAjyRK
	B26clJi7lFcMh0zIYeXvseJNN5tKNvRn8aUPd4IKn+tCoX1D5fvW8tD9U84vQYqB
	CwZUM0=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-sasl-enc
	:x-sasl-enc; s=smtpout; bh=5SBpcTA/ni0pADBUss84pLzpF+I=; b=sMSU/
	+WKJ72hLSsMJFmqn/kmUk9cKwmx+L1a0XCJCeQ+pctTH3ENxClifrQHj84n9m+pX
	xklxFH6ReNvVtSA5zM8pfuyBuk0l3JVmZhKqezo2CRZIIDKp7H0KQ7hULsR7Qjvz
	6q5l+gjghbE9SjsEvdiXsL1GE8U0mmSyEhzTPA=
X-Sasl-enc: KVVtS/Ww5t6J6V9s/7Qp+EQ6xmR6GsSKtrCt80SoCW/3 1469682722
Received: from keelia (unknown [203.0.153.9])
	by mail.messagingengine.com (Postfix) with ESMTPA id E517AF29F7;
	Thu, 28 Jul 2016 01:12:00 -0400 (EDT)
Message-ID: <1469682716.5468.114.camel@aj.id.au>
From: Andrew Jeffery <andrew@aj.id.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, Peter Maydell
	<peter.maydell@linaro.org>
Date: Thu, 28 Jul 2016 14:41:56 +0930
In-Reply-To: <1469638018-17590-7-git-send-email-clg@kaod.org>
References: <1469638018-17590-1-git-send-email-clg@kaod.org>
	<1469638018-17590-7-git-send-email-clg@kaod.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-4U60mcXmBmbGTPHJeRTg"
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.111.4.221
Subject: Re: [Qemu-arm] [PATCH 6/6] arm: add support for an ast2500
 evaluation board
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
X-TUID: 0AKu8pEJLRSW


--=-4U60mcXmBmbGTPHJeRTg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2016-07-27 at 18:46 +0200, C=C3=A9dric Le Goater wrote:
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
> =C2=A0hw/arm/palmetto-bmc.c=C2=A0=C2=A0=C2=A0=C2=A0| 32 +++++++++++++++++=
++++++++++++++-
> =C2=A0include/hw/arm/ast2400.h |=C2=A0=C2=A05 +++++
> =C2=A02 files changed, 36 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/arm/palmetto-bmc.c b/hw/arm/palmetto-bmc.c
> index cd8aa59756b9..8d8bfeb571e2 100644
> --- a/hw/arm/palmetto-bmc.c
> +++ b/hw/arm/palmetto-bmc.c
> @@ -37,12 +37,15 @@ typedef struct AspeedBoardConfig {
> =C2=A0} AspeedBoardConfig;
> =C2=A0
> =C2=A0enum {
> -=C2=A0=C2=A0=C2=A0=C2=A0PALMETTO_BMC
> +=C2=A0=C2=A0=C2=A0=C2=A0PALMETTO_BMC,
> +=C2=A0=C2=A0=C2=A0=C2=A0AST2500_EDK

It was called 'ast2500-edk' in the out-of-tree patches, but can we
rename it 'ast2500-evb'? This would make it consistent with patches we
have in our Linux trees.

> =C2=A0};
> =C2=A0
> =C2=A0static const AspeedBoardConfig aspeed_boards[] =3D {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0[ PALMETTO_BMC ] =3D { 0x120CE416, AST2400_=
A0_SILICON_REV,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0AST2400_SDRAM_BASE },
> +=C2=A0=C2=A0=C2=A0=C2=A0[ AST2500_EDK ]=C2=A0=C2=A0=3D { 0x00000200, AST=
2500_A1_SILICON_REV,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0AST2500_SDRAM_BASE },

Can we include the strap value from the board for completeness?

Also, the meaning of the bits have changed from the AST2400 - they
probably should be documented somewhere?

Finally, checkpatch complained here too regarding the whitespace, I ran
into the issue replacing the strap value.

> =C2=A0};
> =C2=A0
> =C2=A0static void aspeed_init_flashes(AspeedSMCState *s, const char *flas=
htype,
> @@ -133,9 +136,36 @@ static const TypeInfo palmetto_bmc_type =3D {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.class_init =3D palmetto_bmc_class_init,
> =C2=A0};
> =C2=A0
> +static void ast2500_edk_init(MachineState *machine)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0machine->cpu_model =3D "arm1176";
> +=C2=A0=C2=A0=C2=A0=C2=A0aspeed_init(machine, AST2500_EDK);
> +}
> +
> +static void ast2500_edk_class_init(ObjectClass *oc, void *data)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0MachineClass *mc =3D MACHINE_CLASS(oc);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0mc->desc =3D "Aspeed AST2500 EDK (ARM1176)";
> +=C2=A0=C2=A0=C2=A0=C2=A0mc->init =3D ast2500_edk_init;
> +=C2=A0=C2=A0=C2=A0=C2=A0mc->max_cpus =3D 1;
> +=C2=A0=C2=A0=C2=A0=C2=A0mc->no_sdcard =3D 1;
> +=C2=A0=C2=A0=C2=A0=C2=A0mc->no_floppy =3D 1;
> +=C2=A0=C2=A0=C2=A0=C2=A0mc->no_cdrom =3D 1;
> +=C2=A0=C2=A0=C2=A0=C2=A0mc->no_sdcard =3D 1;

mc->no_sdcard is already assigned a couple of lines up. I think this
may be the case for palmetto config as well...

Cheers,

Andrew

> +=C2=A0=C2=A0=C2=A0=C2=A0mc->no_parallel =3D 1;
> +}
> +
> +static const TypeInfo ast2500_edk_type =3D {
> +=C2=A0=C2=A0=C2=A0=C2=A0.name =3D MACHINE_TYPE_NAME("ast2500-edk"),
> +=C2=A0=C2=A0=C2=A0=C2=A0.parent =3D TYPE_MACHINE,
> +=C2=A0=C2=A0=C2=A0=C2=A0.class_init =3D ast2500_edk_class_init,
> +};
> +
> =C2=A0static void aspeed_machine_init(void)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0type_register_static(&palmetto_bmc_type);
> +=C2=A0=C2=A0=C2=A0=C2=A0type_register_static(&ast2500_edk_type);
> =C2=A0}
> =C2=A0
> =C2=A0type_init(aspeed_machine_init)
> diff --git a/include/hw/arm/ast2400.h b/include/hw/arm/ast2400.h
> index e68807d475b7..2e6864f88790 100644
> --- a/include/hw/arm/ast2400.h
> +++ b/include/hw/arm/ast2400.h
> @@ -41,4 +41,9 @@ typedef struct AST2400State {
> =C2=A0
> =C2=A0#define AST2400_SDRAM_BASE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A00x40000000
> =C2=A0
> +/*
> + * for Aspeed AST2500 SOC and higher
> + */
> +#define AST2500_SDRAM_BASE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00x80=
000000
> +
> =C2=A0#endif /* AST2400_H */
--=-4U60mcXmBmbGTPHJeRTg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXmZQcAAoJEJ0dnzgO5LT5/xYP/RGi0iLXBNak0CVfFw9qKZ84
g5dUtxW7SmKanSmLqE7Ttwb7b1GUgaGegU6EDAOnySBvc02GSVczcMVxw0bRVhuO
ZvRZtFR94DRgtWtrYvfCLmU0yqtHcCpbdqx4dviXCo/rlLIssDRZI+0AZpSVdgyi
w9E49RNXXN1D/5uf+Iwq2RS5syVSlWIXe2G0yScA42QEpKTEeQFGtbLaUY0Dt+Yz
CdjYxCPIHi0H1lnkVbFX8r+DtpddGqm9JDv+5YjO8vU/eY2KE4wniNXLzC4SBvYF
UpOvXRsaWgU4bkL3FyZ97vByhx6i3cAiP0nNZ+pEaChLVzS/l528/o/UsuaAb1Bq
u8PDYrXTh4cMsB34NAOk8NlCG6u+YvEVP9dKMm7QYl6NE3FsAxNYmvwmINTMMSLb
luGMkomOwSH8Zzd4pRcjwbvUbBXhySmKGJurjFgCbyRTztCj7fqf/WrcOmJN/kX8
CAeSoOzoIIALA8tpKTIluWANSWIbodFzjD2FbKqeCR8kgTUlO1qHqMMo6ev/7T3b
C1tUvVtswe4QPCNDqABqbkEeOaiHwbNlcfoJJjAVlshswWHiEQROdJaLQ4VDM0gX
2DyuOLt3k7vTE/VH/4/8nnnbtSAdmI4aFEhnoQxHwucR5gDdSzA9M/nPRKWRgDnM
8RzWx3qYjDdAUHgS9xUY
=gyGR
-----END PGP SIGNATURE-----

--=-4U60mcXmBmbGTPHJeRTg--

