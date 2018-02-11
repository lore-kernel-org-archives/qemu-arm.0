Received: by 10.28.71.27 with SMTP id u27csp3797645wma;
        Sun, 11 Feb 2018 15:47:06 -0800 (PST)
X-Google-Smtp-Source: AH8x224dOvqaDE9T/Qf/B/HkcdPa4MvqPi5PstUy6j+YyK5T/kRxPmTf8eXLeGjrGU8PcHoLuQOF
X-Received: by 10.13.197.131 with SMTP id h125mr6756518ywd.151.1518392826263;
        Sun, 11 Feb 2018 15:47:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518392826; cv=none;
        d=google.com; s=arc-20160816;
        b=k/rOWM3S0Cez9CwKSS6SMH3TBko3I+NaNoUrFQQfF5EBotzG2ysHhAlD5ICtZGj1xG
         0MpQRcS+Rc5YlH1EkBa2SjeLD/v2maMBiK8oJwAdTDhTdOlILLQCRI3utAt8anAGFq+c
         reslQ9FWp2UqahREl2GtSyDpnB4E06o3ohZKMtyL8WU1z+zz8SinWiRZ9U4WB4bPrXCy
         Qrt+bpvSiZjiFC2IXV316fLWqqaryZnDfexv5haHselElPF1nWM/GIW63lWe5SWsXcyW
         mhGvQQtBx3PCSzKE8ylmaeEA7qoLbJb2E5eb/Lhy7hOUFImocrUAOaY4XtDqySU6Y9na
         lqrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:date:to:from:message-id:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=t5PvMOWewPsg87b0godjf1G//1aZruxzbMEx/fEZ3n4=;
        b=dIvoft52XsNIglJMrrDQzQB6M73K4M38vWIZV5OUIklFgIchiGBILm2EgRJ/NYcxbO
         qV6aN/ukGv0WrsWEgf5arUQDB19Nxf6cf8RBwbR5tgLzj/RWWMj2ZAbM5vm+hwJDFNN3
         QCS4/M73C9GJ0n3iubu+XrG3DfKdm0eArXv3dAmVqTPQvutx0dPPZ/6mRgo+j+PGpLcD
         kG06TMxUSHBRF4lHVY4AKBJ4r0L+lrbIoTzsjuO/P78Pn8w5mtUpxQktcqbceoBZlFX1
         zOUQW80vtiQrWNEVT/Ct+AE9rwhg5d2lS7REbk9SWt8y2s19X7eA8gdYOlEiDmgEZb1t
         OJkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm1 header.b=YNm4RmB7;
       dkim=fail header.i=@messagingengine.com header.s=fm2 header.b=eJPhxu+i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u190si841464ybf.20.2018.02.11.15.47.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 11 Feb 2018 15:47:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm1 header.b=YNm4RmB7;
       dkim=fail header.i=@messagingengine.com header.s=fm2 header.b=eJPhxu+i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42312 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1el1Kr-00066Z-Nu
	for alex.bennee@linaro.org; Sun, 11 Feb 2018 18:47:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45071)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1el1Kg-00065P-Cp
	for qemu-arm@nongnu.org; Sun, 11 Feb 2018 18:46:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1el1Kc-00069F-E0
	for qemu-arm@nongnu.org; Sun, 11 Feb 2018 18:46:54 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:51055)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <andrew@aj.id.au>)
	id 1el1Kc-00067s-AC; Sun, 11 Feb 2018 18:46:50 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 6290C20AE7;
	Sun, 11 Feb 2018 18:46:49 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
	by compute4.internal (MEProxy); Sun, 11 Feb 2018 18:46:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; bh=t5PvMOWewPsg87b0godjf1G//1aZruxzbMEx/fEZ3n4=; b=YNm4RmB7
	gPayVyJDxZtVvPZjgnIDncNmdjoh5WkUftOnFgI1ZH8s5WuBOKOjRVOzlXa50dHB
	n7HGGLwFPruyfCXKJrJSfidyFI2UJJW8xak2L+hzwQicHtou8CC6MiwD3C1awmen
	NDWkO4CkcX3ZUnsLYWVqvnWWedl5zmYKGHn6pwMxgwRhPOcXIqQnUyrFhcd0HxZQ
	/jZMyHiGNyl7zdy1TIwlAQj4WBLT1t+w9RKCxBCJbjPXfaik3nwxQ717a6RAyKkd
	nS7tqJVIaXgilCg6hU269ROT7rsw8QZPATPeL9bSx6bIKkJpIPBNuzRfLFTJvRSH
	MN+aT723r6DTRg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; bh=t5PvMOWewPsg87b0godjf1G//1aZr
	uxzbMEx/fEZ3n4=; b=eJPhxu+i+ghPt+Lho52/V7KGdGSzIjwV26K7X2MuZhxkx
	XvrZUM/hF9X6nCBDfRpxqT7YZ7pgKSgH+xLAD5s1ru04I8Lc85+62mZy3NCRTrtm
	APGAExdXkdrZFCf2iq8ltI2cfVzxYXnnrUpoZ4ghr/zwrxxfw8zDPn7uVVVax0VE
	zpsSsJhuoIB7cngxcrm1ISQBizs4pHDs+hs/7FmeHLxdCX6etalMBtgKNUdTZWFl
	uAwDaIm5PzD5vajCA5U7Gifvf/aJSzs8fe85Zu+XIJoeWXnyLKQEQS+ld3xKxSfp
	Dk7Q8S23pJtusbP6/xi6cYW6ESgBStlVh9Isx5KPg==
X-ME-Sender: <xms:6dWAWhTchky5HFnXy-7WGwzvgYvRkwhUKmHryUQ_iW4QqZkYRR0kHg>
Received: from dave (ppp118-210-154-2.bras1.adl6.internode.on.net
	[118.210.154.2])
	by mail.messagingengine.com (Postfix) with ESMTPA id 18FC3246D5;
	Sun, 11 Feb 2018 18:46:46 -0500 (EST)
Message-ID: <1518392803.10440.4.camel@aj.id.au>
From: Andrew Jeffery <andrew@aj.id.au>
To: Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>, Peter
	Maydell <peter.maydell@linaro.org>, =?ISO-8859-1?Q?C=E9dric?= Le Goater
	<clg@kaod.org>
Date: Mon, 12 Feb 2018 10:16:43 +1030
In-Reply-To: <20180209085755.30414-3-f4bug@amsat.org>
References: <20180209085755.30414-1-f4bug@amsat.org>
	<20180209085755.30414-3-f4bug@amsat.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-TpvD1ofaHkNBfHlCabic"
X-Mailer: Evolution 3.26.1-1 
Mime-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.111.4.26
Subject: Re: [Qemu-arm] [PATCH v2 2/2] hw/arm/aspeed: simplify using the
 'unimplemented device' for aspeed_soc.io
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
X-TUID: evSTRX0SEoyq


--=-TpvD1ofaHkNBfHlCabic
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2018-02-09 at 05:57 -0300, Philippe Mathieu-Daud=C3=A9 wrote:
> (qemu) info mtree
>  address-space: cpu-memory-0
>    0000000000000000-ffffffffffffffff (prio 0, i/o): system
>      0000000000000000-0000000007ffffff (prio 0, rom): aspeed.boot_rom
> -    000000001e600000-000000001e7fffff (prio -1, i/o): aspeed_soc.io
> +    000000001e600000-000000001e7fffff (prio -1000, i/o): aspeed_soc.io
>      000000001e620000-000000001e6200ff (prio 0, i/o): aspeed.smc.ast2500-=
fmc
>      000000001e630000-000000001e6300ff (prio 0, i/o): aspeed.smc.ast2500-=
spi1
>      000000001e631000-000000001e6310ff (prio 0, i/o): aspeed.smc.ast2500-=
spi2
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
>  include/hw/arm/aspeed_soc.h |  1 -
>  hw/arm/aspeed_soc.c         | 32 +++-----------------------------
>  2 files changed, 3 insertions(+), 30 deletions(-)
>=20
> diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
> index f26914a2b9..11ec0179db 100644
> --- a/include/hw/arm/aspeed_soc.h
> +++ b/include/hw/arm/aspeed_soc.h
> @@ -31,7 +31,6 @@ typedef struct AspeedSoCState {
> =20
>      /*< public >*/
>      ARMCPU cpu;
> -    MemoryRegion iomem;
>      MemoryRegion sram;
>      AspeedVICState vic;
>      AspeedTimerCtrlState timerctrl;
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index 2a5d041b3b..30d25f8b06 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -15,6 +15,7 @@
>  #include "qemu-common.h"
>  #include "cpu.h"
>  #include "exec/address-spaces.h"
> +#include "hw/misc/unimp.h"
>  #include "hw/arm/aspeed_soc.h"
>  #include "hw/char/serial.h"
>  #include "qemu/log.h"
> @@ -99,31 +100,6 @@ static const AspeedSoCInfo aspeed_socs[] =3D {
>      },
>  };
> =20
> -/*
> - * IO handlers: simply catch any reads/writes to IO addresses that aren'=
t
> - * handled by a device mapping.
> - */
> -
> -static uint64_t aspeed_soc_io_read(void *p, hwaddr offset, unsigned size=
)
> -{
> -    qemu_log_mask(LOG_UNIMP, "%s: 0x%" HWADDR_PRIx " [%u]\n",
> -                  __func__, offset, size);
> -    return 0;
> -}
> -
> -static void aspeed_soc_io_write(void *opaque, hwaddr offset, uint64_t va=
lue,
> -                unsigned size)
> -{
> -    qemu_log_mask(LOG_UNIMP, "%s: 0x%" HWADDR_PRIx " <- 0x%" PRIx64 " [%=
u]\n",
> -                  __func__, offset, value, size);
> -}
> -
> -static const MemoryRegionOps aspeed_soc_io_ops =3D {
> -    .read =3D aspeed_soc_io_read,
> -    .write =3D aspeed_soc_io_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN,
> -};
> -
>  static void aspeed_soc_init(Object *obj)
>  {
>      AspeedSoCState *s =3D ASPEED_SOC(obj);
> @@ -199,10 +175,8 @@ static void aspeed_soc_realize(DeviceState *dev, Err=
or **errp)
>      Error *err =3D NULL, *local_err =3D NULL;
> =20
>      /* IO space */
> -    memory_region_init_io(&s->iomem, NULL, &aspeed_soc_io_ops, NULL,
> -            "aspeed_soc.io", ASPEED_SOC_IOMEM_SIZE);
> -    memory_region_add_subregion_overlap(get_system_memory(),
> -                                        ASPEED_SOC_IOMEM_BASE, &s->iomem=
, -1);
> +    create_unimplemented_device("aspeed_soc.io",
> +                                ASPEED_SOC_IOMEM_BASE, ASPEED_SOC_IOMEM_=
SIZE);
> =20
>      /* CPU */
>      object_property_set_bool(OBJECT(&s->cpu), true, "realized", &err);
--=-TpvD1ofaHkNBfHlCabic
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJagNXjAAoJEJ0dnzgO5LT5/LQQAIn/fCv07xrGvbCdMHuMppvU
699TnfphyNyrL0NzCOBHa77X5X5BShHfoAav8v4HPKaWIK1Exm3AV302GezZ0/hy
qwW2AyV332HqvjzcoEPj8kNAh8skcq8EhuclebJPcSWt50eQeE6ep8uA5sBqGMe+
M0cPxs+mDCDi/YsbSFUwAJ1X5ACgBFh89867Z/42oqHHo6vtwmEGIvEaKtX1VW9C
Fh7ziHjhecyDQvntQ9Ms4a/ZuKoOA7nSCx93nLv8Kens8qXpyNu6lZ8rtM2iZt7b
XISMdM98ymxhebbFHIpLowj8MAPp0vVyPhdtb85PEiRqE+2EdYujOQngBK62ACeR
jrq29dhuKCBxF3LGm9y3EV1zGNOCHIQCRHnYjzkh763NOECwTsAE/FqedtummTe8
IYiot3v9TkDsKOV6h0owqDWXInqynk5xpLBCqtm0WJmg02+ol7dhjUEYptsarKNr
GJ7KJyMC+qrbP6u89BCDQrjgJoNyfV12R5D7A7MaadlbVCK5ct6RrbrcITjWi/1i
KJ4AJyJSxttooGQMhhM1h1SIA74VKhiMYlbbhchtqHWV4ZuqVE1wrxXHfLE8TN4e
mXr6KMe8JNVnzv+65trcZ0lvdnDVckEDX9LApPXmtf4ykLJK+urt1xhjiJXQtzYw
wNX4cQRNmMq+ubMsGaiJ
=rM6u
-----END PGP SIGNATURE-----

--=-TpvD1ofaHkNBfHlCabic--

