Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp453466lff;
        Thu, 12 Dec 2019 23:30:18 -0800 (PST)
X-Google-Smtp-Source: APXvYqxSFkvKx8n31M3K0L4oFQGNaEkQtUIoXwT9Q2apJsWIkMM8VYip6dFwroEd/TNyFBFWP8Kk
X-Received: by 2002:aed:3f94:: with SMTP id s20mr10847755qth.325.1576222218843;
        Thu, 12 Dec 2019 23:30:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576222218; cv=none;
        d=google.com; s=arc-20160816;
        b=Sshn5PbzV5oCyYJ8YenV06P/4AOXGQcPyWmbV3Ak0OPsaqBFBrvYDvKmYkQdTLcbK2
         4wH5tbv+XW4QsjIAox8p6KeFKwc8xscbDSPSMcoK2DWClZJpdmvtUR/0X+P948hwfv31
         fyU3FQSuRV4IaU9BIR1zybwKYSULB39jABAEy40IElTR0EYqINHfp/aDvfp1nEKqmH/L
         q+bf1Bt7LD+oQtm/59J7qS0snUIJAbUDxuW2MqUVYztJ23js9ousFEJBG9C6aimsqvQA
         DS19B3Lon/5zsahnscqLbbm1xkqynvmlyGUYE/6jyT+NTu2hEO+ZuIOs5F1TO3SiiKeg
         gBZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=rU85kP4Lpns/ZwP1AqhKgcIWasMulrBJmBP7NI0RRs0=;
        b=gSqHUM8gEkpot6Dd4rMKZigYo2wCoIOp3ej6Zrbid/30Bq8GdaKpXoDx6xPCVbNyNl
         ddgJwybs0yoHDtZzfQNP2r+bD3ze/wmFxZ0gg1nomtZ2oL6jlWV1W1OGcDcAxQgPshDB
         jz9VOWvSMqTDhIT6SFT9me54NAX6gJkUIXi7cYfqsiNoPkMd9lFf6gGIWz7x4R4Ge+MY
         yOn/I95Y0ok6XbMDGMF/39ZEs4Mf3MPuCdknufyvJibdjgpCYiyiKHTAn7IYkVacl93c
         9SWWQoLc07Bv9VKAPLpZekZmrBPlDL6IzeXOUu21D7MlCJ7gXemls3xH215DyXubh/+z
         E6xQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b23si4122513qtq.351.2019.12.12.23.30.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Dec 2019 23:30:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iffP0-0003eP-55
	for alex.bennee@linaro.org; Fri, 13 Dec 2019 02:30:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36855)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iffOo-0003aB-Ul
 for qemu-arm@nongnu.org; Fri, 13 Dec 2019 02:30:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iffOn-00057z-D1
 for qemu-arm@nongnu.org; Fri, 13 Dec 2019 02:30:06 -0500
Received: from 19.mo1.mail-out.ovh.net ([178.32.97.206]:43261)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iffOn-0004sA-5k
 for qemu-arm@nongnu.org; Fri, 13 Dec 2019 02:30:05 -0500
Received: from player726.ha.ovh.net (unknown [10.108.16.88])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id E80081A4809
 for <qemu-arm@nongnu.org>; Fri, 13 Dec 2019 08:29:51 +0100 (CET)
Received: from kaod.org (lfbn-tou-1-1227-223.w90-76.abo.wanadoo.fr
 [90.76.50.223]) (Authenticated sender: clg@kaod.org)
 by player726.ha.ovh.net (Postfix) with ESMTPSA id 4D5CBD2C0463;
 Fri, 13 Dec 2019 07:29:44 +0000 (UTC)
Subject: Re: [PATCH v2 1/2] hw/sd: Configure number of slots exposed by the
 ASPEED SDHCI model
To: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org
References: <cover.fc3e5e495d85ebd919c1f06a1a2c7c7730518f9c.1576211124.git-series.andrew@aj.id.au>
 <6281ebb475f652838d10dc48ec70fa5113b1f029.1576211124.git-series.andrew@aj.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <863368db-1056-81eb-d52f-d033002b4650@kaod.org>
Date: Fri, 13 Dec 2019 08:29:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <6281ebb475f652838d10dc48ec70fa5113b1f029.1576211124.git-series.andrew@aj.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 4462785757740501795
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudelkedguddtjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdeltddrjeeirdehtddrvddvfeenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjedviedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 178.32.97.206
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>, joel@jms.id.au,
 qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vvy7SnrhLJSs

On 13/12/2019 05:28, Andrew Jeffery wrote:
> The AST2600 includes a second cut-down version of the SD/MMC controller
> found in the AST2500, named the eMMC controller. It's cut down in the
> sense that it only supports one slot rather than two, but it brings the
> total number of slots supported by the AST2600 to three.
>=20
> The existing code assumed that the SD controller always provided two
> slots. Rework the SDHCI object to expose the number of slots as a
> property to be set by the SoC configuration.
>=20
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>

> ---
>  hw/arm/aspeed.c              |  2 +-
>  hw/arm/aspeed_ast2600.c      |  2 ++
>  hw/arm/aspeed_soc.c          |  2 ++
>  hw/sd/aspeed_sdhci.c         | 11 +++++++++--
>  include/hw/sd/aspeed_sdhci.h |  1 +
>  5 files changed, 15 insertions(+), 3 deletions(-)
>=20
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 028191ff36fc..862549b1f3a9 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -259,7 +259,7 @@ static void aspeed_board_init(MachineState *machine=
,
>          cfg->i2c_init(bmc);
>      }
> =20
> -    for (i =3D 0; i < ARRAY_SIZE(bmc->soc.sdhci.slots); i++) {
> +    for (i =3D 0; i < bmc->soc.sdhci.num_slots; i++) {
>          SDHCIState *sdhci =3D &bmc->soc.sdhci.slots[i];
>          DriveInfo *dinfo =3D drive_get_next(IF_SD);
>          BlockBackend *blk;
> diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
> index 931887ac681f..931ee5aae183 100644
> --- a/hw/arm/aspeed_ast2600.c
> +++ b/hw/arm/aspeed_ast2600.c
> @@ -208,6 +208,8 @@ static void aspeed_soc_ast2600_init(Object *obj)
>      sysbus_init_child_obj(obj, "sdc", OBJECT(&s->sdhci), sizeof(s->sdh=
ci),
>                            TYPE_ASPEED_SDHCI);
> =20
> +    object_property_set_int(OBJECT(&s->sdhci), 2, "num-slots", &error_=
abort);
> +
>      /* Init sd card slot class here so that they're under the correct =
parent */
>      for (i =3D 0; i < ASPEED_SDHCI_NUM_SLOTS; ++i) {
>          sysbus_init_child_obj(obj, "sdhci[*]", OBJECT(&s->sdhci.slots[=
i]),
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index f4fe243458fd..c39a42f914d4 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -215,6 +215,8 @@ static void aspeed_soc_init(Object *obj)
>      sysbus_init_child_obj(obj, "sdc", OBJECT(&s->sdhci), sizeof(s->sdh=
ci),
>                            TYPE_ASPEED_SDHCI);
> =20
> +    object_property_set_int(OBJECT(&s->sdhci), 2, "num-slots", &error_=
abort);
> +
>      /* Init sd card slot class here so that they're under the correct =
parent */
>      for (i =3D 0; i < ASPEED_SDHCI_NUM_SLOTS; ++i) {
>          sysbus_init_child_obj(obj, "sdhci[*]", OBJECT(&s->sdhci.slots[=
i]),
> diff --git a/hw/sd/aspeed_sdhci.c b/hw/sd/aspeed_sdhci.c
> index cff3eb7dd21e..939d1510dedb 100644
> --- a/hw/sd/aspeed_sdhci.c
> +++ b/hw/sd/aspeed_sdhci.c
> @@ -13,6 +13,7 @@
>  #include "qapi/error.h"
>  #include "hw/irq.h"
>  #include "migration/vmstate.h"
> +#include "hw/qdev-properties.h"
> =20
>  #define ASPEED_SDHCI_INFO            0x00
>  #define  ASPEED_SDHCI_INFO_RESET     0x00030000
> @@ -120,14 +121,14 @@ static void aspeed_sdhci_realize(DeviceState *dev=
, Error **errp)
> =20
>      /* Create input irqs for the slots */
>      qdev_init_gpio_in_named_with_opaque(DEVICE(sbd), aspeed_sdhci_set_=
irq,
> -                                        sdhci, NULL, ASPEED_SDHCI_NUM_=
SLOTS);
> +                                        sdhci, NULL, sdhci->num_slots)=
;
> =20
>      sysbus_init_irq(sbd, &sdhci->irq);
>      memory_region_init_io(&sdhci->iomem, OBJECT(sdhci), &aspeed_sdhci_=
ops,
>                            sdhci, TYPE_ASPEED_SDHCI, 0x1000);
>      sysbus_init_mmio(sbd, &sdhci->iomem);
> =20
> -    for (int i =3D 0; i < ASPEED_SDHCI_NUM_SLOTS; ++i) {
> +    for (int i =3D 0; i < sdhci->num_slots; ++i) {
>          Object *sdhci_slot =3D OBJECT(&sdhci->slots[i]);
>          SysBusDevice *sbd_slot =3D SYS_BUS_DEVICE(&sdhci->slots[i]);
> =20
> @@ -174,6 +175,11 @@ static const VMStateDescription vmstate_aspeed_sdh=
ci =3D {
>      },
>  };
> =20
> +static Property aspeed_sdhci_properties[] =3D {
> +    DEFINE_PROP_UINT8("num-slots", AspeedSDHCIState, num_slots, 0),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
>  static void aspeed_sdhci_class_init(ObjectClass *classp, void *data)
>  {
>      DeviceClass *dc =3D DEVICE_CLASS(classp);
> @@ -181,6 +187,7 @@ static void aspeed_sdhci_class_init(ObjectClass *cl=
assp, void *data)
>      dc->realize =3D aspeed_sdhci_realize;
>      dc->reset =3D aspeed_sdhci_reset;
>      dc->vmsd =3D &vmstate_aspeed_sdhci;
> +    dc->props =3D aspeed_sdhci_properties;
>  }
> =20
>  static TypeInfo aspeed_sdhci_info =3D {
> diff --git a/include/hw/sd/aspeed_sdhci.h b/include/hw/sd/aspeed_sdhci.=
h
> index dfdab4379021..dffbb46946b9 100644
> --- a/include/hw/sd/aspeed_sdhci.h
> +++ b/include/hw/sd/aspeed_sdhci.h
> @@ -24,6 +24,7 @@ typedef struct AspeedSDHCIState {
>      SysBusDevice parent;
> =20
>      SDHCIState slots[ASPEED_SDHCI_NUM_SLOTS];
> +    uint8_t num_slots;
> =20
>      MemoryRegion iomem;
>      qemu_irq irq;
>=20

