Received: by 10.25.21.156 with SMTP id 28csp564007lfv;
        Wed, 27 Jul 2016 19:37:47 -0700 (PDT)
X-Received: by 10.55.57.134 with SMTP id g128mr7471378qka.10.1469673467533;
        Wed, 27 Jul 2016 19:37:47 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 6si6458453qkp.262.2016.07.27.19.37.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 27 Jul 2016 19:37:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au;
       dkim=fail header.i=@messagingengine.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50514 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bSbCk-0000xu-To
	for alex.bennee@linaro.org; Wed, 27 Jul 2016 22:37:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40427)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1bSbCh-0000xb-2h
	for qemu-arm@nongnu.org; Wed, 27 Jul 2016 22:37:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1bSbCc-0007St-Ss
	for qemu-arm@nongnu.org; Wed, 27 Jul 2016 22:37:42 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:36291)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>)
	id 1bSbCa-0007QA-JX; Wed, 27 Jul 2016 22:37:38 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
	by mailnew.nyi.internal (Postfix) with ESMTP id B90351B65;
	Wed, 27 Jul 2016 22:37:24 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
	by compute7.internal (MEProxy); Wed, 27 Jul 2016 22:37:24 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=KS6Tp
	U1edpk0IozQjmvD9yt0WNo=; b=P/lB3P+ymLQk8RHOaIzEL+bpY4rrisnejdUk6
	a4BpElsVl4mTJ4NfFzzFcDaLxKDLUBhiBCZ/vD5fhQWkAuYEYYW2EoVuITvnvvHb
	vz9KZy+vuEGAj8OqMcD0LN07YWTnHlSQDLWJbBzU/EWH3wFi4AAbr0yPbwvFTljk
	ZtoVes=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-sasl-enc
	:x-sasl-enc; s=smtpout; bh=KS6TpU1edpk0IozQjmvD9yt0WNo=; b=qB/g/
	98fuMwA/GoGqA1OM8wKotj1AOCDwjvCt7NyTqvG9t1Unw4+ooRAQ3V6USXUl6hnw
	FjauSDSCcswf2puL6G7GrIeyOomzuzUkM4yw+NbdPgicVHmiTMhU0FyN10RK62l2
	yBVVbO+/raYIdV9KwsCEDSYHytUrpQ9umnoORA=
X-Sasl-enc: THtpOPYwlMtSQ/plxzouKSAVqe1CxIFpO9B21PEn5VCq 1469673443
Received: from keelia (unknown [203.0.153.9])
	by mail.messagingengine.com (Postfix) with ESMTPA id E881ECCDB1;
	Wed, 27 Jul 2016 22:37:21 -0400 (EDT)
Message-ID: <1469673438.5468.89.camel@aj.id.au>
From: Andrew Jeffery <andrew@aj.id.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, Peter Maydell
	<peter.maydell@linaro.org>
Date: Thu, 28 Jul 2016 12:07:18 +0930
In-Reply-To: <1469638018-17590-4-git-send-email-clg@kaod.org>
References: <1469638018-17590-1-git-send-email-clg@kaod.org>
	<1469638018-17590-4-git-send-email-clg@kaod.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-jVozKiq5XacEIpj6ikXJ"
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.111.4.221
Subject: Re: [Qemu-arm] [PATCH 3/6] ast2400: use machine cpu_model to
 initialize the soc cpu
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
X-TUID: y5T6SuAMZf/7


--=-jVozKiq5XacEIpj6ikXJ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2016-07-27 at 18:46 +0200, C=C3=A9dric Le Goater wrote:
> It will be easier to specify a different cpu for other soc derived
> from the ast2400 soc.
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
> =C2=A0hw/arm/ast2400.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 8 +++++++-
> =C2=A0hw/arm/palmetto-bmc.c | 1 +
> =C2=A02 files changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/arm/ast2400.c b/hw/arm/ast2400.c
> index fa535065f765..7f3517a2c6c6 100644
> --- a/hw/arm/ast2400.c
> +++ b/hw/arm/ast2400.c
> @@ -15,6 +15,7 @@
> =C2=A0#include "qemu-common.h"
> =C2=A0#include "cpu.h"
> =C2=A0#include "exec/address-spaces.h"
> +#include "hw/boards.h"
> =C2=A0#include "hw/arm/ast2400.h"
> =C2=A0#include "hw/char/serial.h"
> =C2=A0#include "qemu/log.h"
> @@ -65,9 +66,14 @@ static const MemoryRegionOps ast2400_io_ops =3D {
> =C2=A0
> =C2=A0static void ast2400_init(Object *obj)
> =C2=A0{
> +=C2=A0=C2=A0=C2=A0=C2=A0const char *cpu_model =3D current_machine->cpu_m=
odel;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0AST2400State *s =3D AST2400(obj);
> =C2=A0
> -=C2=A0=C2=A0=C2=A0=C2=A0s->cpu =3D cpu_arm_init("arm926");
> +=C2=A0=C2=A0=C2=A0=C2=A0if (!cpu_model) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0cpu_model =3D "arm926";
> +=C2=A0=C2=A0=C2=A0=C2=A0}
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0s->cpu =3D cpu_arm_init(cpu_model);

I did a similar thing in the series introducing the AST2400 SoC, and
Peter had a comment on the approach[1]:

    What we do now is not let the user override the cpu model at all;
    presumably this SoC only ever has an ARM926 and it doesn't make
    any sense to have some frankenstein "this SoC but with a different
    CPU in it" config.

Given this is the ast2400_init() it looks to me like we should be
hardwiring the CPU rather than leaving it to the machine to define.

[1]=C2=A0https://patchwork.kernel.org/patch/8325651/=C2=A0

> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0object_initialize(&s->vic, sizeof(s->vic), =
TYPE_ASPEED_VIC);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0object_property_add_child(obj, "vic", OBJEC=
T(&s->vic), NULL);
> diff --git a/hw/arm/palmetto-bmc.c b/hw/arm/palmetto-bmc.c
> index f80a15733864..8a3ff5568575 100644
> --- a/hw/arm/palmetto-bmc.c
> +++ b/hw/arm/palmetto-bmc.c
> @@ -91,6 +91,7 @@ static void aspeed_init(MachineState *machine)
> =C2=A0
> =C2=A0static void palmetto_bmc_init(MachineState *machine)
> =C2=A0{
> +=C2=A0=C2=A0=C2=A0=C2=A0machine->cpu_model =3D "arm926";
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0aspeed_init(machine);
> =C2=A0}
> =C2=A0
--=-jVozKiq5XacEIpj6ikXJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXmW/eAAoJEJ0dnzgO5LT5neYQAIqvF9yXmd4BqX5YEDgOFTxB
2HS/LQVr/g73yG1aZEvKgtwKz8jFw1WJ8j6l/YbnbStoov/Lh7I1ZCrWYmBVepeh
MxIYPhi85DQfX9N0KF0EiLREZhjys6XLw6F7lTiSI39iD9id8Pwm8STr3u0Je81l
AQ0Cr4Uj7e7wFB/rtAbeZsmSpgroAUh2tnL6/ua4jF/XIuxyHxR6BlREo5tCDBLI
bCFC395lc+o6KDguxKD4ryRtcAJB1AdtFmRqvDY3Gel++bBMroB9EMGVBZR29ALp
szo8B3K1IACz7Fw8NxgDNR1TjFLk7yF1FRLqvuqwuAANjpHsVbfx/5fXVaGU5Ksn
Kbc3PYB3xJ2RabtbzecIE0fvUBkZGNTyDfBZmkRtCaWvX5Cw2lbUhJTDcqC+ssir
mGVqsoDqJxp+xKEfxVvpyCyoZZGlmiF3SeVggLYFkOoFMgJs+M1iMz3sbH5cKppL
odpTjwEwy5FOwFKUNKS52nameETt2q5x/W0fc7KkgLvFOwlcWQBVDIE+t3TmPd5N
92eu1won9sCNJelCMB6lncFpk606cA1SMTj1Ui/TTO5kpeQAyw2GFLRlVgvFksZV
dUgOlx2c4s5vKvFv6DWZAtyp8s4vvAED+4TBg0DybTEZaI28NR+cKGm/vmNifFwt
Yolfoc99uRigpL7ykbDU
=MOTU
-----END PGP SIGNATURE-----

--=-jVozKiq5XacEIpj6ikXJ--

