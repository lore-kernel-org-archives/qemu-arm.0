Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp4848465lfi;
        Mon, 6 Apr 2020 23:47:20 -0700 (PDT)
X-Google-Smtp-Source: APiQypJ8iM6Fw9hCld+jzv+LizIUE4i2MLJ4ro4MyJtHui+268xE563XWC8Ymh2mzzDGKCt+Glkk
X-Received: by 2002:a0c:ed2a:: with SMTP id u10mr559628qvq.3.1586242040022;
        Mon, 06 Apr 2020 23:47:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586242040; cv=none;
        d=google.com; s=arc-20160816;
        b=Pg1IhddqYFx/hr43NPWJt+LrqBCmMGuv5HZB7s5oCPE+OHoA2lZ4s16zsfSbZVPKVG
         UKPzDx9RRAc2WAO7ONkYnJK3+O1IuMDLEkRzG2KWtPySP0RS9IgFYlbdFhbrbRx6rcQ1
         rZfBbPw8e8WLa527AYmFwXZiQt8RpvTsYnAGrSetxdaZ7x9FneU7q9OXKsuKRzEiVBFk
         DUWb4JVeuNdreXmxBWJB9j8NxqWaH/KDriGiUNwjA0ftKNqN5LyeZgfRHIiwmeMtJwim
         k0a/aTp/B0QLr4x8xN92k7n82krBeF3AtVdDBJPOsHPmz/RWciu9c694qVQbqtB259LM
         N9Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=Rl3JwaGlr19pqbfTeKG5Wl7kfB7e7j/6lYYMkspxMrE=;
        b=e3k2EuKUOdQG0fSeCWayvpRrisw3/0nBfzMuq5o8cfL7o0GFbIl9f8Gmo81nffRxQ4
         myo0gJsQS2kcL4pxSi2LkldG6rOsGcgGqNKnN4PJux4v88D7KX+c8IvQR/xVsEwGBw0t
         W17sDQ935p9ZfGD8M5Nt3+Ju3Rmuu6ld+50gg3ZJcu8D5E/o0PwAEWetOVYM1oCq3Y8f
         Z59RK1Rf0UP6n31hqX2v2o87mNPPzTMJIO5G4Z1p5zeJsnZs+zqbPYh/u5I4/Q/0Ii5/
         sHa11wvc8OP2CM5KMiLf5CeTksAO+FE997s3WhUEYTfatxTSb30FeVPhorCUHooh4Bp5
         VQWA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e41si1169665qtk.202.2020.04.06.23.47.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Apr 2020 23:47:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jLi11-0007Mf-Es
	for alex.bennee@linaro.org; Tue, 07 Apr 2020 02:47:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37100)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1jLi0s-0007M3-3C
 for qemu-arm@nongnu.org; Tue, 07 Apr 2020 02:47:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1jLi0q-0005yr-SL
 for qemu-arm@nongnu.org; Tue, 07 Apr 2020 02:47:09 -0400
Received: from 5.mo179.mail-out.ovh.net ([46.105.43.140]:54056)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1jLi0q-0005we-M1
 for qemu-arm@nongnu.org; Tue, 07 Apr 2020 02:47:08 -0400
Received: from player779.ha.ovh.net (unknown [10.108.35.95])
 by mo179.mail-out.ovh.net (Postfix) with ESMTP id 86B9A162BAA
 for <qemu-arm@nongnu.org>; Tue,  7 Apr 2020 08:47:06 +0200 (CEST)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player779.ha.ovh.net (Postfix) with ESMTPSA id 4539811266063;
 Tue,  7 Apr 2020 06:46:57 +0000 (UTC)
Subject: Re: [PATCH-for-5.1 v2 04/54] hw/arm/aspeed_ast2600: Simplify use of
 Error*
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
References: <20200406174743.16956-1-f4bug@amsat.org>
 <20200406174743.16956-5-f4bug@amsat.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <423df879-b5d8-31e5-c911-b67e4283ef7c@kaod.org>
Date: Tue, 7 Apr 2020 08:46:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200406174743.16956-5-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 2443765749797391280
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrudeggdduuddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpkedvrdeigedrvdehtddrudejtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejjeelrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrgh
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.43.140
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
X-TUID: yXgUoMcnU+cO

On 4/6/20 7:46 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> Coccinelle reported:
>=20
>   $ spatch ... --timeout 60 --sp-file \
>     scripts/coccinelle/simplify-init-realize-error_propagate.cocci
>   HANDLING: ./hw/arm/aspeed_ast2600.c
>   >>> possible moves from aspeed_soc_ast2600_init() to aspeed_soc_ast26=
00_realize() in ./hw/arm/aspeed_ast2600.c:243
>=20
> While reviewing we notice we don't need two different Error*,
> drop the one less used.

I think that comes from another pattern we were using at some time=20
which was propagating the second error in the first. Anyhow, this
is better.


Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>

It seems that the 'return' are badly aligned ?

Thanks,

C.=20

>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/arm/aspeed_ast2600.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
>=20
> diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
> index 1a869e09b9..b08359f3ef 100644
> --- a/hw/arm/aspeed_ast2600.c
> +++ b/hw/arm/aspeed_ast2600.c
> @@ -245,7 +245,7 @@ static void aspeed_soc_ast2600_realize(DeviceState =
*dev, Error **errp)
>      int i;
>      AspeedSoCState *s =3D ASPEED_SOC(dev);
>      AspeedSoCClass *sc =3D ASPEED_SOC_GET_CLASS(s);
> -    Error *err =3D NULL, *local_err =3D NULL;
> +    Error *err =3D NULL;
>      qemu_irq irq;
> =20
>      /* IO space */
> @@ -418,9 +418,12 @@ static void aspeed_soc_ast2600_realize(DeviceState=
 *dev, Error **errp)
>              return;
>          }
>          object_property_set_int(OBJECT(&s->spi[i]), 1, "num-cs", &err)=
;
> +        if (err) {
> +            error_propagate(errp, err);
> +           return;
> +        }
>          object_property_set_bool(OBJECT(&s->spi[i]), true, "realized",
> -                                 &local_err);
> -        error_propagate(&err, local_err);
> +                                 &err);
>          if (err) {
>              error_propagate(errp, err);
>              return;
> @@ -472,9 +475,12 @@ static void aspeed_soc_ast2600_realize(DeviceState=
 *dev, Error **errp)
>          qdev_set_nic_properties(DEVICE(&s->ftgmac100[i]), &nd_table[i]=
);
>          object_property_set_bool(OBJECT(&s->ftgmac100[i]), true, "aspe=
ed",
>                                   &err);
> +        if (err) {
> +            error_propagate(errp, err);
> +           return;
> +        }
>          object_property_set_bool(OBJECT(&s->ftgmac100[i]), true, "real=
ized",
> -                                 &local_err);
> -        error_propagate(&err, local_err);
> +                                 &err);
>          if (err) {
>              error_propagate(errp, err);
>             return;
>=20

