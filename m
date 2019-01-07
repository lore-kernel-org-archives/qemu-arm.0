Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3141288wrt;
        Sun, 6 Jan 2019 22:49:05 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4tQx9W5AKIcUIdFN/i48y4rrSUG5Ml+jaMS6FlNKJEzMVl36mZXoWHZScp2gHmbWov0XHE
X-Received: by 2002:a1c:2884:: with SMTP id o126mr8156568wmo.17.1546843745798;
        Sun, 06 Jan 2019 22:49:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546843745; cv=none;
        d=google.com; s=arc-20160816;
        b=u4Eop0xB/6QurggMIXVTatnKe9RbuR/hAgBbfYli8ywDJ4aqJsZTWLAB34QKybi+x7
         Xo1XlrjcTmatIVRo/2tH9+vqCpkhiB0JbsQrmNcxcJEeEn0QZcnnlYCCT+NSl6mjjZcG
         hfX0+9mvMqoTfO/l14Aid7fIsZl2z/xveT45wBaGA8dnS7lXvWnEz9lLUryUyLhW47rn
         6+iW8eHb09APoc6C90fPWMItWJKBYoBFwdjmkNHIuk/T+LburbzxpLRiSqMLc44iRMq1
         3mZzFTw8GsWHz1TgckvYqPpPf1xhbzXNsuurEBu4p3Du6Th/KrdXc9suhNtAAegQWnX7
         hpag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=is7Tj1lFN+TS0kRFj1/tWllQsLE+fKGO75JSIdUTGtQ=;
        b=Jj2NwOsA5yb68ZfrFXBQlv7a30fp+z+vptrpDSAqn+EWDhszFe2IghphVOMvtxki/Z
         6hWip831b8TqK/ocBa+srysyCw7cZu6VQIGYkEbn55IptyOzXkHzDEeRTn4aykr85Lp+
         EHsc8xiAa8Xg/+YzGEUzCzbFt6Z5hhicbTUrQbZbgDRWkMS1YTwibhCd2U9VNEXoubo3
         Q6sUICPNQH8SdsUFTP+vrtQRt9wAFXdf8PyzNB0RpJA5ImynPOkHYYqVpMq42Mb+tpo0
         hu7sMdvmkkSB5ZL4AAa+jfdRRsrNm+YyMzhTHGr5mmGmtlJIV5NTLIoY4cKnpvMeJe+/
         gexQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x8si4625738wmk.200.2019.01.06.22.49.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 06 Jan 2019 22:49:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:50698 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ggOie-0002Nt-UX
	for alex.bennee@linaro.org; Mon, 07 Jan 2019 01:49:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49796)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1ggOiU-0002M7-Vm
	for qemu-arm@nongnu.org; Mon, 07 Jan 2019 01:48:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1ggOiU-0006F2-04
	for qemu-arm@nongnu.org; Mon, 07 Jan 2019 01:48:54 -0500
Received: from 20.mo6.mail-out.ovh.net ([178.32.124.17]:55666)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1ggOiT-0006CU-PU
	for qemu-arm@nongnu.org; Mon, 07 Jan 2019 01:48:53 -0500
Received: from player739.ha.ovh.net (unknown [10.109.160.251])
	by mo6.mail-out.ovh.net (Postfix) with ESMTP id E07381A0277
	for <qemu-arm@nongnu.org>; Mon,  7 Jan 2019 07:48:44 +0100 (CET)
Received: from kaod.org (lfbn-1-10605-110.w90-89.abo.wanadoo.fr
	[90.89.196.110]) (Authenticated sender: clg@kaod.org)
	by player739.ha.ovh.net (Postfix) with ESMTPSA id 2A5D017E5F4B;
	Mon,  7 Jan 2019 06:48:03 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>
References: <20190104175847.6290-1-philmd@redhat.com>
	<20190104175847.6290-2-philmd@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <f8deb758-762b-fc7f-4c54-ef89f7323d99@kaod.org>
Date: Mon, 7 Jan 2019 07:48:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <20190104175847.6290-2-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 17747560235248225218
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtledrvdeigddutddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 178.32.124.17
Subject: Re: [Qemu-arm] [PATCH 01/16] hw/arm/aspeed: Use
 TYPE_TMP105/TYPE_PCA9552 instead of hardcoded string
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
	Peter Chubb <peter.chubb@nicta.com.au>,
	Jan Kiszka <jan.kiszka@web.de>, Rob Herring <robh@kernel.org>,
	Andrew Jeffery <andrew@aj.id.au>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Jason Wang <jasowang@redhat.com>, Magnus Damm <magnus.damm@gmail.com>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Beniamino Galvani <b.galvani@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Michael Walle <michael@walle.cc>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Joel Stanley <joel@jms.id.au>,
	Richard Henderson <rth@twiddle.net>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CPWxgmfb7yXF

On 1/4/19 6:58 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>



Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>  hw/arm/aspeed.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>=20
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 5158985482..817f9e1400 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -19,6 +19,8 @@
>  #include "hw/arm/aspeed_soc.h"
>  #include "hw/boards.h"
>  #include "hw/i2c/smbus.h"
> +#include "hw/misc/pca9552.h"
> +#include "hw/misc/tmp105.h"
>  #include "qemu/log.h"
>  #include "sysemu/block-backend.h"
>  #include "hw/loader.h"
> @@ -267,7 +269,8 @@ static void ast2500_evb_i2c_init(AspeedBoardState *=
bmc)
>                            eeprom_buf);
> =20
>      /* The AST2500 EVB expects a LM75 but a TMP105 is compatible */
> -    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 7), "tmp105=
", 0x4d);
> +    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 7), TYPE_TM=
P105,
> +                     0x4d);
> =20
>      /* The AST2500 EVB does not have an RTC. Let's pretend that one is
>       * plugged on the I2C bus header */
> @@ -288,13 +291,15 @@ static void witherspoon_bmc_i2c_init(AspeedBoardS=
tate *bmc)
>      AspeedSoCState *soc =3D &bmc->soc;
>      uint8_t *eeprom_buf =3D g_malloc0(8 * 1024);
> =20
> -    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 3), "pca955=
2", 0x60);
> +    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 3), TYPE_PC=
A9552,
> +                     0x60);
> =20
>      i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 4), "tmp423=
", 0x4c);
>      i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 5), "tmp423=
", 0x4c);
> =20
>      /* The Witherspoon expects a TMP275 but a TMP105 is compatible */
> -    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 9), "tmp105=
", 0x4a);
> +    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 9), TYPE_TM=
P105,
> +                     0x4a);
> =20
>      /* The witherspoon board expects Epson RX8900 I2C RTC but a ds1338=
 is
>       * good enough */
> @@ -302,7 +307,7 @@ static void witherspoon_bmc_i2c_init(AspeedBoardSta=
te *bmc)
> =20
>      smbus_eeprom_init_one(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 11), 0=
x51,
>                            eeprom_buf);
> -    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 11), "pca95=
52",
> +    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 11), TYPE_P=
CA9552,
>                       0x60);
>  }
> =20
>=20

