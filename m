Received: by 10.25.159.131 with SMTP id i125csp44335lfe;
        Tue, 29 Nov 2016 18:01:31 -0800 (PST)
X-Received: by 10.200.58.65 with SMTP id w59mr26198640qte.54.1480471291118;
        Tue, 29 Nov 2016 18:01:31 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e70si36350272qkh.139.2016.11.29.18.01.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Nov 2016 18:01:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au;
       dkim=fail header.i=@messagingengine.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40411 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cBuDC-0004YC-Fx
	for alex.bennee@linaro.org; Tue, 29 Nov 2016 21:01:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44601)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1cBuD6-0004Xs-0a
	for qemu-arm@nongnu.org; Tue, 29 Nov 2016 21:01:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1cBuD1-0007Pk-Et
	for qemu-arm@nongnu.org; Tue, 29 Nov 2016 21:01:24 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:47267)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <andrew@aj.id.au>)
	id 1cBuD1-0007PC-8x; Tue, 29 Nov 2016 21:01:19 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 4C0BD207DC;
	Tue, 29 Nov 2016 21:01:17 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
	by compute4.internal (MEProxy); Tue, 29 Nov 2016 21:01:17 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
	:x-sasl-enc; s=mesmtp; bh=NwJRozU3QDH/HS5w9jykfwNjrvg=; b=eKJfyc
	e7dqCzSLgXBAiw/F/fa9xzgQa6Vb42Z8bcHy7cfD7P+qavt7Kfi8FoNbjAN6EdKR
	XDkwLbyY+uwAssy5n+59kFYnj6paYJkZZ675QFXqwmddtaQfw13/zfjcVLqQ5Rwk
	KnJvzh1p4Yembpj9oIIxD9O+nyrgNHRoupegQ=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=NwJRozU3QDH/HS
	5w9jykfwNjrvg=; b=C2P2kEc9JIFc3OIxIIDIAzUu924BNI5rXTYDmY4FBD4NaP
	K5zR+6NhV+Je2Ucpo2z2Nc8npv15PNJTuH3EaTKcfUKKuWR+PXtg9/mM9gS9Nvod
	m57FFgCFF5LsmhiEHmSqsZ3E+rqxeMPndOJa54rnk66+qsQbvCJpcejapK5X4=
X-ME-Sender: <xms:7TI-WINgOuEQd-Dyr6OtmEqvMomtU6pWR_r7OVgZvXmcEtOS40t6Xw>
X-Sasl-enc: U51fM4g84VzhzeBXbXfuTi0NMnumzZKA4fVEE2dk+fEe 1480471276
Received: from [10.104.0.15] (unknown [203.0.153.9])
	by mail.messagingengine.com (Postfix) with ESMTPA id 8D0167E456;
	Tue, 29 Nov 2016 21:01:14 -0500 (EST)
Message-ID: <1480471266.2503.103.camel@aj.id.au>
From: Andrew Jeffery <andrew@aj.id.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, Peter Maydell
	<peter.maydell@linaro.org>
Date: Wed, 30 Nov 2016 12:31:06 +1030
In-Reply-To: <1480434248-27138-29-git-send-email-clg@kaod.org>
References: <1480434248-27138-1-git-send-email-clg@kaod.org>
	<1480434248-27138-29-git-send-email-clg@kaod.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-g/EZdLGL20cGmki9jwUr"
X-Mailer: Evolution 3.22.1-0ubuntu2 
Mime-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.111.4.29
Subject: Re: [Qemu-arm] [PATCH for-2.9 28/30] aspeed: add a watchdog
 controller
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	Marcin Krzeminski <marcin.krzeminski@nokia.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bQDDkV7HB2K5


--=-g/EZdLGL20cGmki9jwUr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2016-11-29 at 16:44 +0100, C=C3=A9dric Le Goater wrote:
> This enables reboot of a guest from U-Boot and Linux.
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Reviewed-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> =C2=A0hw/arm/aspeed_soc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0| 13 +++++++++++++
> =C2=A0include/hw/arm/aspeed_soc.h |=C2=A0=C2=A02 ++
> =C2=A02 files changed, 15 insertions(+)
>=20
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index 4fb777e6df6e..6df76382f007 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -31,6 +31,7 @@
> =C2=A0#define ASPEED_SOC_SCU_BASE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A00x1E6E2000
> =C2=A0#define ASPEED_SOC_SRAM_BASE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A00x1E720000
> =C2=A0#define ASPEED_SOC_TIMER_BASE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A00x1E782000
> +#define ASPEED_SOC_WDT_BASE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A00x1E785000
> =C2=A0#define ASPEED_SOC_I2C_BASE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A00x1E78A000
> =C2=A0
> =C2=A0static const int uart_irqs[] =3D { 9, 32, 33, 34, 10 };
> @@ -170,6 +171,10 @@ static void aspeed_soc_init(Object *obj)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0sc->info->silicon_rev);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0object_property_add_alias(obj, "ram-size", =
OBJECT(&s->sdmc),
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0"ram-size", &error_abort);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0object_initialize(&s->wdt, sizeof(s->wdt), TYPE_=
ASPEED_WDT);
> +=C2=A0=C2=A0=C2=A0=C2=A0object_property_add_child(obj, "wdt", OBJECT(&s-=
>wdt), NULL);
> +=C2=A0=C2=A0=C2=A0=C2=A0qdev_set_parent_bus(DEVICE(&s->wdt), sysbus_get_=
default());
> =C2=A0}
> =C2=A0
> =C2=A0static void aspeed_soc_realize(DeviceState *dev, Error **errp)
> @@ -289,6 +294,14 @@ static void aspeed_soc_realize(DeviceState *dev,
> Error **errp)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sysbus_mmio_map(SYS_BUS_DEVICE(&s->sdmc), 0=
,
> ASPEED_SOC_SDMC_BASE);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0/* Watch dog */
> +=C2=A0=C2=A0=C2=A0=C2=A0object_property_set_bool(OBJECT(&s->wdt), true, =
"realized",
> &err);
> +=C2=A0=C2=A0=C2=A0=C2=A0if (err) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0error_propagate(errp, er=
r);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return;
> +=C2=A0=C2=A0=C2=A0=C2=A0}
> +=C2=A0=C2=A0=C2=A0=C2=A0sysbus_mmio_map(SYS_BUS_DEVICE(&s->wdt), 0,
> ASPEED_SOC_WDT_BASE);
> =C2=A0}
> =C2=A0
> =C2=A0static void aspeed_soc_class_init(ObjectClass *oc, void *data)
> diff --git a/include/hw/arm/aspeed_soc.h
> b/include/hw/arm/aspeed_soc.h
> index 1ab5deaa0813..dbec0c159885 100644
> --- a/include/hw/arm/aspeed_soc.h
> +++ b/include/hw/arm/aspeed_soc.h
> @@ -19,6 +19,7 @@
> =C2=A0#include "hw/timer/aspeed_timer.h"
> =C2=A0#include "hw/i2c/aspeed_i2c.h"
> =C2=A0#include "hw/ssi/aspeed_smc.h"
> +#include "hw/watchdog/wdt_aspeed.h"
> =C2=A0
> =C2=A0#define ASPEED_SPIS_NUM=C2=A0=C2=A02
> =C2=A0
> @@ -37,6 +38,7 @@ typedef struct AspeedSoCState {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0AspeedSMCState fmc;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0AspeedSMCState spi[ASPEED_SPIS_NUM];
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0AspeedSDMCState sdmc;
> +=C2=A0=C2=A0=C2=A0=C2=A0AspeedWDTState wdt;
> =C2=A0} AspeedSoCState;
> =C2=A0
> =C2=A0#define TYPE_ASPEED_SOC "aspeed-soc"
--=-g/EZdLGL20cGmki9jwUr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYPjLjAAoJEJ0dnzgO5LT5fMYP/jCKztHiRPX60ORO7x7LuRgn
N6tXzFt9xM6NAVxIAWUzR71qYDIaLd5A/KUnfo56uQiEtFJjjsvHbcnTCIP9j6Wm
b1blwadCdyNZw2WjT32GnJsOaJp2kiF/i6Ztlg0l5VbhUV2D5z/jWaE8Tz8ihN6L
MhnAoxPnul5iITQgfwwmwsGtnRxSbv1cX2YtM66cipgj5i0FFdQDre64VWkf5ulr
w5LA5Jc8PZzitDHVp0g+ICtKSNUW8pWgyUXj2hpzUcII5ULUE6rCUfxXP4Xrzhj7
fhFc9oPocjNAaVISzYw/RpDTA7WaV3cxYGAgbBzcglLfBDK0IKy06cZbaDpxjK5o
RBr/qFJDopV3nsmUzIC50rvkfaSu7AssD1mv0Nt4kDTAxqoOQ7dU3K9wm88mWpth
xVlOpFsGCVIjQotoU3ahIiO+DCgB8Sq5hhRaVjBno4sKo9iLZRbUJ/b9Cbq6T/La
v1JRgSydTHbkCCsGzffxO3DLL2TnJzqQI8vdiLj39gJB+F3GLEmnd1Qu/Umluad7
W/sPxg9fcgSQKjcmZFJ7Cwz4gCZ6ZDlXhfKTUNnIHwFdsiDBp/MyyauHzJndIlqE
8CJ0RqdcTI+LNGsNGDEbjk8FxYHTQUDE9CYHFwbqefrxVD3qR7jWN1u44zSRFvtT
J6zHyRZGbcFFdHSdtLUv
=pJGR
-----END PGP SIGNATURE-----

--=-g/EZdLGL20cGmki9jwUr--

