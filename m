Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp4848915lfi;
        Mon, 6 Apr 2020 23:47:56 -0700 (PDT)
X-Google-Smtp-Source: APiQypIIYfxm3SZ7E10OxRBGv2/jx8xEicLQx+/kG21fRK0bO1sGDiOJN5CX2k4S16T+myccfQ+H
X-Received: by 2002:a37:4a14:: with SMTP id x20mr721823qka.357.1586242076210;
        Mon, 06 Apr 2020 23:47:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586242076; cv=none;
        d=google.com; s=arc-20160816;
        b=mw6P/WW5+x7gJEyRoOOlEkxpqKXYz62uH0jEd0epQgkCRO/c5A1udAaieom0198IpS
         nbk5Jd898rI1DH9jbY3a6tPFxVAHtawu5OpSi3Xunlg8wQaFnlSvshHlMTv91nw9PRK8
         k2cnKovnFDgK4GsecStJNohDP8wnwuG4LTwNr2BsE+1udADKV1f2Kxj+tAeZoW9Q0OCy
         0JHNGInnAMs3FXqjUevdCrjQlsbKI1lQfwliFN20ix8UmmGKS2b27U8CMX+6p5x/Ye6a
         5J6I1VRdwtpPDEmH7vZCtS5ajo844GSIKPgePP0LE+3GHUNEjxsWOXZ02XvaEnA0+lYf
         IqaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=bYNtELd1g1/msMWi4ZXfGAWXBBBiNmTqvVNNRrn6ssE=;
        b=qRUsy9H9cSEcBB2dUscrpnLDGQkwdy5Ixw3qZQHkx9z0KxDLBHjAgBqZlw+N00tWPh
         4JGZBPSugJjilCB24hYwTJ8ezanz3IRQjJeSKtC3IbO5eq5NTlaodsKnF5L+aFSTD9pj
         nE8zgDzmaKIPpwfCffiHbmo002qQSNvH1bVli4GP2AGQqOt3jGNwQTbAwrSzvxaqlV7c
         wUHdLYACTlaTjMbhNb/Zj9bkTs9X59kcMcSypWs1w9yKsu4sqS9Eeeo0lpgiFDVzK3QH
         meNdMllCavNpDj1DGk9/PLhw73Xv0REoTVRmI3ymrPh3askszEEoITwngbxyRDPPWN8J
         TvTw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j2si1355491qka.21.2020.04.06.23.47.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Apr 2020 23:47:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jLi1b-00085h-4B
	for alex.bennee@linaro.org; Tue, 07 Apr 2020 02:47:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37233)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1jLi1D-00080w-On
 for qemu-arm@nongnu.org; Tue, 07 Apr 2020 02:47:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1jLi1C-0006GD-I6
 for qemu-arm@nongnu.org; Tue, 07 Apr 2020 02:47:31 -0400
Received: from 4.mo3.mail-out.ovh.net ([178.33.46.10]:35131)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1jLi1C-0006FK-Cp
 for qemu-arm@nongnu.org; Tue, 07 Apr 2020 02:47:30 -0400
Received: from player690.ha.ovh.net (unknown [10.108.57.139])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id C65C324B81C
 for <qemu-arm@nongnu.org>; Tue,  7 Apr 2020 08:47:28 +0200 (CEST)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player690.ha.ovh.net (Postfix) with ESMTPSA id 850AA110F0479;
 Tue,  7 Apr 2020 06:47:16 +0000 (UTC)
Subject: Re: [PATCH-for-5.1 v2 28/54] hw/arm/aspeed: Add missing
 error-propagation code
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
References: <20200406174743.16956-1-f4bug@amsat.org>
 <20200406174743.16956-29-f4bug@amsat.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <f2b449ec-9254-4f71-eb6f-9d97e6c05ab0@kaod.org>
Date: Tue, 7 Apr 2020 08:47:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200406174743.16956-29-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 2449958197395753904
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrudeggdduuddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpkedvrdeigedrvdehtddrudejtdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrheiledtrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrgh
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 178.33.46.10
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Joel Stanley <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2QkmHV4VGw/e

On 4/6/20 7:47 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> Patch created mechanically by running:
>=20
>   $ spatch \
>     --macro-file scripts/cocci-macro-file.h --include-headers \
>     --sp-file scripts/coccinelle/use-error_propagate-in-realize.cocci \
>     --keep-comments --smpl-spacing --in-place --dir hw
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>

The 'return' are correct this time.=20

Thanks,

C.=20


> ---
>  hw/arm/aspeed_ast2600.c | 36 ++++++++++++++++++++++++++++++------
>  hw/arm/aspeed_soc.c     | 12 ++++++++++--
>  2 files changed, 40 insertions(+), 8 deletions(-)
>=20
> diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
> index c8e0171824..d810df928c 100644
> --- a/hw/arm/aspeed_ast2600.c
> +++ b/hw/arm/aspeed_ast2600.c
> @@ -277,7 +277,11 @@ static void aspeed_soc_ast2600_realize(DeviceState=
 *dev, Error **errp)
>          if (s->num_cpus > 1) {
>              object_property_set_int(OBJECT(&s->cpu[i]),
>                                      ASPEED_A7MPCORE_ADDR,
> -                                    "reset-cbar", &error_abort);
> +                                    "reset-cbar", &err);
> +            if (err) {
> +                error_propagate(errp, err);
> +                return;
> +            }
>          }
>          /*
>           * TODO: the secondary CPUs are started and a boot helper
> @@ -293,10 +297,18 @@ static void aspeed_soc_ast2600_realize(DeviceStat=
e *dev, Error **errp)
> =20
>      /* A7MPCORE */
>      object_property_set_int(OBJECT(&s->a7mpcore), s->num_cpus, "num-cp=
u",
> -                            &error_abort);
> +                            &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> =20
>      object_property_set_bool(OBJECT(&s->a7mpcore), true, "realized",
> -                             &error_abort);
> +                             &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
>      sysbus_mmio_map(SYS_BUS_DEVICE(&s->a7mpcore), 0, ASPEED_A7MPCORE_A=
DDR);
> =20
>      for (i =3D 0; i < s->num_cpus; i++) {
> @@ -343,7 +355,11 @@ static void aspeed_soc_ast2600_realize(DeviceState=
 *dev, Error **errp)
> =20
>      /* Timer */
>      object_property_set_link(OBJECT(&s->timerctrl),
> -                             OBJECT(&s->scu), "scu", &error_abort);
> +                             OBJECT(&s->scu), "scu", &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
>      object_property_set_bool(OBJECT(&s->timerctrl), true, "realized", =
&err);
>      if (err) {
>          error_propagate(errp, err);
> @@ -459,7 +475,11 @@ static void aspeed_soc_ast2600_realize(DeviceState=
 *dev, Error **errp)
>          AspeedWDTClass *awc =3D ASPEED_WDT_GET_CLASS(&s->wdt[i]);
> =20
>          object_property_set_link(OBJECT(&s->wdt[i]),
> -                                 OBJECT(&s->scu), "scu", &error_abort)=
;
> +                                 OBJECT(&s->scu), "scu", &err);
> +        if (err) {
> +            error_propagate(errp, err);
> +            return;
> +        }
>          object_property_set_bool(OBJECT(&s->wdt[i]), true, "realized",=
 &err);
>          if (err) {
>              error_propagate(errp, err);
> @@ -490,7 +510,11 @@ static void aspeed_soc_ast2600_realize(DeviceState=
 *dev, Error **errp)
>                             aspeed_soc_get_irq(s, ASPEED_ETH1 + i));
> =20
>          object_property_set_link(OBJECT(&s->mii[i]), OBJECT(&s->ftgmac=
100[i]),
> -                                 "nic", &error_abort);
> +                                 "nic", &err);
> +        if (err) {
> +            error_propagate(errp, err);
> +            return;
> +        }
>          object_property_set_bool(OBJECT(&s->mii[i]), true, "realized",
>                                   &err);
>          if (err) {
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index aa6d739ad0..5f90215187 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -301,7 +301,11 @@ static void aspeed_soc_realize(DeviceState *dev, E=
rror **errp)
> =20
>      /* Timer */
>      object_property_set_link(OBJECT(&s->timerctrl),
> -                             OBJECT(&s->scu), "scu", &error_abort);
> +                             OBJECT(&s->scu), "scu", &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
>      object_property_set_bool(OBJECT(&s->timerctrl), true, "realized", =
&err);
>      if (err) {
>          error_propagate(errp, err);
> @@ -398,7 +402,11 @@ static void aspeed_soc_realize(DeviceState *dev, E=
rror **errp)
>          AspeedWDTClass *awc =3D ASPEED_WDT_GET_CLASS(&s->wdt[i]);
> =20
>          object_property_set_link(OBJECT(&s->wdt[i]),
> -                                 OBJECT(&s->scu), "scu", &error_abort)=
;
> +                                 OBJECT(&s->scu), "scu", &err);
> +        if (err) {
> +            error_propagate(errp, err);
> +            return;
> +        }
>          object_property_set_bool(OBJECT(&s->wdt[i]), true, "realized",=
 &err);
>          if (err) {
>              error_propagate(errp, err);
>=20

