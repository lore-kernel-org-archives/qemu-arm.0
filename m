Received: by 10.28.71.27 with SMTP id u27csp3789134wma;
        Sun, 11 Feb 2018 15:32:02 -0800 (PST)
X-Google-Smtp-Source: AH8x2246wBc7BQFa6+LcVJkyF/3XnIjq4AfkQFTu0ZctZALK3W9qA49dPvbEVBYAoMV+J1JlM6I4
X-Received: by 10.129.46.213 with SMTP id u204mr1351284ywu.57.1518391922820;
        Sun, 11 Feb 2018 15:32:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518391922; cv=none;
        d=google.com; s=arc-20160816;
        b=Sodfdz9OAXeWhufJ0BJl8C6Fi/IKoTBFiCph3fJ8HcfscRA3gX840FNe6ur4XsILhz
         a6Cgq6Uzj0vQjMRt8C2EPUGSEX7C4cEdWL+eNaxJSe694786Lcs7bg7DXTFltSQLjm8s
         4AsCQdClqwOfQO6/bH4L2QwOWK95NednHDZCUMKUx27fSYMYrx8kiat9S+QpfhXB9ziE
         AVsYUI4bij/XasXywIeV/a5S/GfodvaMbSqacfwCURPfIvvEsHzuwrQ3jPR9FTjex90A
         o/2dffjJ6T3PjNU6VP14ISjqWS2tMzlUiNju0BI12WXrgUffck2dmTqgT6HtVL4Tgmkb
         tfDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:date:to:from:message-id:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=B3VLopuInayyERtXs9aHilitau6M/rFjLc/uE+UL6Bc=;
        b=SCewLZFSxZfBUpESk0EJbAwTc422pawxQ3DzoADc/XVj1nL9IDP3Dxr6OUQGtjfAdf
         end3t1JCJiSrKYPraswKhJQFv2drVlqk0IHyusDlyWI87Gw4DoR1SesGF4UJiwRa0aq5
         rTogWi/LA4uZy8Skr2Mz5wufEZqStyqnDTvCVtYsXTUVnUh+KK1ZPr1JQHk9dU53S2LB
         tJd1yLr3rMKKHoRl6smuWl4oBeKAPEM0EgY1uGYizH0GqezyNUYFE2OQfRdOCTaag8pV
         w+u2Yb24WCb66fhwEsqpItN7baO1svPEeNCefEUUex5sAT9um1Lzq6ohSQHScB3OMAdr
         /TyA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm1 header.b=AXcdqez2;
       dkim=fail header.i=@messagingengine.com header.s=fm2 header.b=lHaD6F8a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r62si1346961ywh.644.2018.02.11.15.32.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 11 Feb 2018 15:32:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm1 header.b=AXcdqez2;
       dkim=fail header.i=@messagingengine.com header.s=fm2 header.b=lHaD6F8a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40937 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1el16I-0007xn-8K
	for alex.bennee@linaro.org; Sun, 11 Feb 2018 18:32:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32859)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1el164-0007wS-Et
	for qemu-arm@nongnu.org; Sun, 11 Feb 2018 18:31:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1el15y-0006el-RU
	for qemu-arm@nongnu.org; Sun, 11 Feb 2018 18:31:47 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:50389)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <andrew@aj.id.au>)
	id 1el15y-0006aj-CC; Sun, 11 Feb 2018 18:31:42 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id C53D720AC6;
	Sun, 11 Feb 2018 18:31:39 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
	by compute4.internal (MEProxy); Sun, 11 Feb 2018 18:31:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; bh=B3VLopuInayyERtXs9aHilitau6M/rFjLc/uE+UL6Bc=; b=AXcdqez2
	GUBKAf0LYvI+PzVzHLIxWKLHWvqNkZKH387GlykVz9IWrnbcgXzTmfl/0P6s6FNE
	ZhRrLlnX0KsbcpBoF+SGlP1QTWUs3Vc6yQF4Fx3PFhy5Dzb7krxBpIJeSxUea4aK
	g3fJViN65N4Ds5DYtHUdgFRTofFxU4jKuOU4bhWg5ezt06BwwHupdbmx+Sg/Bjyw
	D93lVHzinRXHrprbYj44V3ZbKX+DNlZ7cMDFjZLGdtylF2l6INGpYn5jkn3ZpFte
	hWXRTD69iLUtETKpJWhswh+m/uuh5wyuLIFSm6+73lk4fSyrf/FZuFGYpQXQ2KDQ
	MbupJJ7U/mqNaw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; bh=B3VLopuInayyERtXs9aHilitau6M/
	rFjLc/uE+UL6Bc=; b=lHaD6F8ampQmGhWZgZZQkgSr7QwkROZiQhXA89iiPkD80
	jxI43UV//w6FgT/PIRRiw6QIlBSJj9DaVtul+DyH4bSAFiuO5NLoAG3IEqdSuK0K
	krlkbJzoTkHFOtBu/TEpzVRrCL0bbjcA6/koOMCuO5pfc39VANeYDCNZIr8ZEbRa
	Gc1XY+rYuX0u5FthtDEf2TzSWtWiYdkp4O4BgqEZjIn8DVQdzlAMKwNsBfOv0PG6
	RSvjlyFiU+8kYcz+VJrJZGveWLiqekgvVHGQ9Vk/fAFalIejNjzqCdBdUb6cuOR/
	dMb75e4scvm0gi+FV5gHgF6abN/rf5TtdjEhbjyJw==
X-ME-Sender: <xms:W9KAWvRwa0qJHdStGz02iMnUN8kLS1tiAQQCUVuiX4AmD2htlPereQ>
Received: from dave (ppp118-210-154-2.bras1.adl6.internode.on.net
	[118.210.154.2])
	by mail.messagingengine.com (Postfix) with ESMTPA id 7D3507E4C7;
	Sun, 11 Feb 2018 18:31:37 -0500 (EST)
Message-ID: <1518391890.10440.3.camel@aj.id.au>
From: Andrew Jeffery <andrew@aj.id.au>
To: Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>, Peter
	Maydell <peter.maydell@linaro.org>, =?ISO-8859-1?Q?C=E9dric?= Le Goater
	<clg@kaod.org>
Date: Mon, 12 Feb 2018 10:01:30 +1030
In-Reply-To: <20180209085755.30414-2-f4bug@amsat.org>
References: <20180209085755.30414-1-f4bug@amsat.org>
	<20180209085755.30414-2-f4bug@amsat.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-TDJMey167qvL9LdLtzE4"
X-Mailer: Evolution 3.26.1-1 
Mime-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.111.4.26
Subject: Re: [Qemu-arm] [PATCH v2 1/2] hw/arm/aspeed: directly map the
 serial device to the system address space
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
X-TUID: xWc2jEdNaCzD


--=-TDJMey167qvL9LdLtzE4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2018-02-09 at 05:57 -0300, Philippe Mathieu-Daud=C3=A9 wrote:
> (qemu) info mtree
>  address-space: cpu-memory-0
>    0000000000000000-ffffffffffffffff (prio 0, i/o): system
>      0000000000000000-0000000007ffffff (prio 0, rom): aspeed.boot_rom
>      000000001e600000-000000001e7fffff (prio -1, i/o): aspeed_soc.io
> -      000000001e784000-000000001e78401f (prio 0, i/o): serial
>      000000001e620000-000000001e6200ff (prio 0, i/o):
> aspeed.smc.ast2500-fmc
>      000000001e630000-000000001e6300ff (prio 0, i/o):
> aspeed.smc.ast2500-spi1
>      [...]
>      000000001e720000-000000001e728fff (prio 0, ram): aspeed.sram
>      000000001e782000-000000001e782fff (prio 0, i/o): aspeed.timer
> +    000000001e784000-000000001e78401f (prio 0, i/o): serial
>      000000001e785000-000000001e78501f (prio 0, i/o): aspeed.wdt
>      000000001e785020-000000001e78503f (prio 0, i/o): aspeed.wdt
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
>  hw/arm/aspeed_soc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index c83b7e207b..2a5d041b3b 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -257,7 +257,8 @@ static void aspeed_soc_realize(DeviceState *dev,
> Error **errp)
>      /* UART - attach an 8250 to the IO space as our UART5 */
>      if (serial_hds[0]) {
>          qemu_irq uart5 =3D qdev_get_gpio_in(DEVICE(&s->vic),
> uart_irqs[4]);
> -        serial_mm_init(&s->iomem, ASPEED_SOC_UART_5_BASE, 2,
> +        serial_mm_init(get_system_memory(),
> +                       ASPEED_SOC_IOMEM_BASE +
> ASPEED_SOC_UART_5_BASE, 2,
>                         uart5, 38400, serial_hds[0],
> DEVICE_LITTLE_ENDIAN);
>      }
> =20
--=-TDJMey167qvL9LdLtzE4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJagNJSAAoJEJ0dnzgO5LT5DQYP/RlebWcj5CXw4ucpYQbYfioh
2bw9FXCrebmlJ5uM620SOQzAUZrtN+v6zEuNAE21snKThCf/aezitsTpbYg6YYQ0
7nRGeQ2J05LAdEiDLKTbhENOcp+U0ArNiCro0Yk2INN5jhEC33oCOWk20MlFkjrQ
RW1D4VcKuMmTEnv/29WFpLAdORhfqKXZtQG2KY206ZG6qks3kU/NuEipQ9TfM6iL
3JfS+8lp8VULk6/LPE/4+/ad7VX4iHWD7FDVuKZBs6E6JGLp5i4mShY5ULfbSICh
adbs76zF7EkGRUuLhg6phIWlIhEg6kdXVh5N3w+eaHMdVnd1NFfaPtjfBHevHOkB
lClpwtoGtr9KJHFYWYDK60DulZ4AuYcdGPn8/rrFyMuwYoid5siC6i0TV7kjXDRH
NCy+ol+rwJxbMCdr1WZKToYq5Nhgnn9XP5u9CSQPLItAcu6coPwluzD5DXVaa5uj
+a4lxRbV4x9qnKlaIMT22WQZyA0Qmx+4NsIhVujPv2ZvJbUGpMz2GrtkGLZSKhZe
f0jSPNvwCATVqADMPis2yE1rgZW9LRku+L4c8veKyRdFLaU1xAbLOlpMsFxDFMor
b3uCjFot66QITJ54oDf9zMMRfWvu9mzeaBh46SLx/uTePOqPvm5lh2/uxT7fEgTB
E8/G4OfOeQc7FX/LSN4B
=Og61
-----END PGP SIGNATURE-----

--=-TDJMey167qvL9LdLtzE4--

