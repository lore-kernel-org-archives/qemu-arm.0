Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp4848585lfi;
        Mon, 6 Apr 2020 23:47:30 -0700 (PDT)
X-Google-Smtp-Source: APiQypKO0gUZaiXagQhXsLwzsUwjOkS2qF9qpnC9kFh72MFkfR7yp9IAqEIjU3QPWA73Z1EYtuT6
X-Received: by 2002:a0c:b790:: with SMTP id l16mr757997qve.244.1586242050036;
        Mon, 06 Apr 2020 23:47:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586242050; cv=none;
        d=google.com; s=arc-20160816;
        b=Wsqml3cT7e2viep19xbLH+PA5Kl6fNTiJwisZvI5kcGdAlPKYRO4ezcDdWKEHzneHc
         y5j3xUxrHwHd2e51sh/UWHdOT5RW3neHZ1qadBgPT9N/HBBF0nqxQtakAGfSOgqP4yq4
         PjC0l+b4U6Z9bEz6rp7cTb7U9dYnexXj7+7rX70vlJCn3tuJ2NYPTFPQE1Wb1aKfc7jC
         8vvPwVUGpz5q8B6pcD4wFxDsX0Y6YsBqADVfFKpJXbCIYq4M/jVMh3It6ps7ASbpQWnv
         xLIe4wyDe096LFEerLMQBzUvBAxeYmNSWNSHqQGD401aO//sfFBBNHaFcGMNyP2Vm7Kd
         fHkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=OiYZfJeFY8csEDbFf2xtfrlvKiE6FSmK6WQ3AKCtqCI=;
        b=YGnhauD2kFmeXZ2c7PPSCq3xxLsr+JzcshE1Bdld1egbEaeR3vWO5vWvNrp3aQIIui
         4x9AO5Nkd1nMyIv0HT9brVvop/rXfqVc1hEgxKc94b/FGtGZlXRR2H+2Bvj7cTHVy6mz
         L2bNraefT3cBaECa2rFY5hGRVTySDRHQiPC1rq0E9H7MfCDAdv3DHzIlIRj/jNRDWTg9
         RzXXg5IMCmH9iRAbBUQG3RcENK1oSLq+nqI9cQyQfbTTbYet6Jz/ssgSo/QcJ7AHItqI
         YPh1x7/uJSp+kloc95fWFvJHzhmR/INQloeC5uIZZeGFHmHpHwggV2m8Dfz5cDRApcnY
         yC5w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p6si1199963qvu.178.2020.04.06.23.47.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Apr 2020 23:47:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jLi1B-0007gG-DG
	for alex.bennee@linaro.org; Tue, 07 Apr 2020 02:47:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37126)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1jLi0w-0007Ot-Ve
 for qemu-arm@nongnu.org; Tue, 07 Apr 2020 02:47:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1jLi0v-00061A-U0
 for qemu-arm@nongnu.org; Tue, 07 Apr 2020 02:47:14 -0400
Received: from 6.mo1.mail-out.ovh.net ([46.105.43.205]:41920)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1jLi0v-00060n-Nz
 for qemu-arm@nongnu.org; Tue, 07 Apr 2020 02:47:13 -0400
Received: from player796.ha.ovh.net (unknown [10.108.42.88])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id 2F9D91BA581
 for <qemu-arm@nongnu.org>; Tue,  7 Apr 2020 08:47:11 +0200 (CEST)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player796.ha.ovh.net (Postfix) with ESMTPSA id 06B58111FB81A;
 Tue,  7 Apr 2020 06:47:04 +0000 (UTC)
Subject: Re: [PATCH-for-5.1 v2 06/54] hw/arm/aspeed_soc: Move some code from
 realize() to init()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
References: <20200406174743.16956-1-f4bug@amsat.org>
 <20200406174743.16956-7-f4bug@amsat.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <4f59c4d6-14dd-3751-18ac-aea0052e7179@kaod.org>
Date: Tue, 7 Apr 2020 08:47:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200406174743.16956-7-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 2445173125435329456
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrudeggdduuddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpkedvrdeigedrvdehtddrudejtdenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejleeirdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrgh
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.43.205
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
X-TUID: 7VntpCt4VsVE

On 4/6/20 7:46 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> Coccinelle reported:
>=20
>   $ spatch ... --timeout 60 --sp-file \
>     scripts/coccinelle/simplify-init-realize-error_propagate.cocci
>   HANDLING: ./hw/arm/aspeed_soc.c
>   >>> possible moves from aspeed_soc_init() to aspeed_soc_realize() in =
./hw/arm/aspeed_soc.c:231
>=20
> Move the calls using &error_fatal which don't depend of input
> updated before realize() to init().
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>

Thanks,

C.=20

> ---
>  hw/arm/aspeed_soc.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index 696c7fda14..debd7c8faa 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -183,6 +183,7 @@ static void aspeed_soc_init(Object *obj)
>          snprintf(typename, sizeof(typename), "aspeed.spi%d-%s", i + 1,=
 socname);
>          sysbus_init_child_obj(obj, "spi[*]", OBJECT(&s->spi[i]),
>                                sizeof(s->spi[i]), typename);
> +        object_property_set_int(OBJECT(&s->spi[i]), 1, "num-cs", &erro=
r_abort);
>      }
> =20
>      for (i =3D 0; i < sc->ehcis_num; i++) {
> @@ -360,10 +361,7 @@ static void aspeed_soc_realize(DeviceState *dev, E=
rror **errp)
> =20
>      /* SPI */
>      for (i =3D 0; i < sc->spis_num; i++) {
> -        object_property_set_int(OBJECT(&s->spi[i]), 1, "num-cs", &err)=
;
> -        object_property_set_bool(OBJECT(&s->spi[i]), true, "realized",
> -                                 &local_err);
> -        error_propagate(&err, local_err);
> +        object_property_set_bool(OBJECT(&s->spi[i]), true, "realized",=
 &err);
>          if (err) {
>              error_propagate(errp, err);
>              return;
>=20

