Received: by 10.25.150.194 with SMTP id y185csp2514383lfd;
        Tue, 29 Nov 2016 11:17:50 -0800 (PST)
X-Received: by 10.200.40.204 with SMTP id j12mr26076764qtj.284.1480447070141;
        Tue, 29 Nov 2016 11:17:50 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d13si28262412qte.229.2016.11.29.11.17.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Nov 2016 11:17:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38913 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cBnuX-0001oJ-Gy
	for alex.bennee@linaro.org; Tue, 29 Nov 2016 14:17:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50844)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cBnuP-0001nX-7p
	for qemu-arm@nongnu.org; Tue, 29 Nov 2016 14:17:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cBnuM-0005sE-04
	for qemu-arm@nongnu.org; Tue, 29 Nov 2016 14:17:41 -0500
Received: from 2.mo69.mail-out.ovh.net ([178.33.251.80]:36587)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1cBnuL-0005rf-QA
	for qemu-arm@nongnu.org; Tue, 29 Nov 2016 14:17:37 -0500
Received: from player699.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo69.mail-out.ovh.net (Postfix) with ESMTP id 60AEAC60B
	for <qemu-arm@nongnu.org>; Tue, 29 Nov 2016 20:17:36 +0100 (CET)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: postmaster@kaod.org)
	by player699.ha.ovh.net (Postfix) with ESMTPSA id 1093B24007C;
	Tue, 29 Nov 2016 20:17:31 +0100 (CET)
To: qemu-devel@nongnu.org
References: <1480434248-27138-1-git-send-email-clg@kaod.org>
	<1480435656-28497-1-git-send-email-clg@kaod.org>
	<1480435656-28497-2-git-send-email-clg@kaod.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <212152e2-2cb9-9dae-d04a-9d68c7cf2c2e@kaod.org>
Date: Tue, 29 Nov 2016 20:17:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1480435656-28497-2-git-send-email-clg@kaod.org>
Content-Type: text/plain; charset=utf-8
X-Ovh-Tracer-Id: 15298727935969954642
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrfeejgddvhedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 178.33.251.80
Subject: Re: [Qemu-arm] [PATCH for-2.9 30/30] wdt: aspeed: use scu to get
 clock freq
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org, Marcin Krzeminski <marcin.krzeminski@nokia.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YbiFILGSX0Te

This is a duplicate also.

Sorry for the noise.

C.=20

11/29/2016 05:07 PM, C=C3=A9dric Le Goater wrote:
> Add a link to the object model and a helper routine to retrieve the
> value instead of using a constant value.
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> ---
>  hw/arm/aspeed_soc.c              |  2 ++
>  hw/watchdog/wdt_aspeed.c         | 19 +++++++++++++++----
>  include/hw/watchdog/wdt_aspeed.h |  2 ++
>  3 files changed, 19 insertions(+), 4 deletions(-)
>=20
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index 6df76382f007..712ae9d6c54d 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -175,6 +175,8 @@ static void aspeed_soc_init(Object *obj)
>      object_initialize(&s->wdt, sizeof(s->wdt), TYPE_ASPEED_WDT);
>      object_property_add_child(obj, "wdt", OBJECT(&s->wdt), NULL);
>      qdev_set_parent_bus(DEVICE(&s->wdt), sysbus_get_default());
> +    object_property_add_const_link(OBJECT(&s->wdt), "scu", OBJECT(&s->=
scu),
> +                                   NULL);
>  }
> =20
>  static void aspeed_soc_realize(DeviceState *dev, Error **errp)
> diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
> index cdba3983b7af..01266fb1b76b 100644
> --- a/hw/watchdog/wdt_aspeed.c
> +++ b/hw/watchdog/wdt_aspeed.c
> @@ -7,10 +7,12 @@
> =20
>  #include "qemu/osdep.h"
>  #include "qemu/log.h"
> +#include "qapi/error.h"
>  #include "sysemu/watchdog.h"
>  #include "hw/sysbus.h"
>  #include "qemu/timer.h"
>  #include "hw/watchdog/wdt_aspeed.h"
> +#include "hw/misc/aspeed_scu.h"
> =20
>  #define WDT_IO_REGION_SIZE      0x20
> =20
> @@ -56,8 +58,6 @@ static uint64_t aspeed_wdt_read(void *opaque, hwaddr =
offset, unsigned size)
> =20
>  }
> =20
> -#define PCLK_HZ 24000000
> -
>  static void aspeed_wdt_write(void *opaque, hwaddr offset, uint64_t dat=
a,
>                               unsigned size)
>  {
> @@ -82,7 +82,7 @@ static void aspeed_wdt_write(void *opaque, hwaddr off=
set, uint64_t data,
> =20
>              if (pclk) {
>                  reload =3D muldiv64(s->reg_reload_value, NANOSECONDS_P=
ER_SECOND,
> -                                  PCLK_HZ) ;
> +                                  s->pclk_freq);
>              } else {
>                  reload =3D s->reg_reload_value * 1000;
>              }
> @@ -99,7 +99,7 @@ static void aspeed_wdt_write(void *opaque, hwaddr off=
set, uint64_t data,
> =20
>              if (pclk) {
>                  reload =3D muldiv64(s->reg_reload_value, NANOSECONDS_P=
ER_SECOND,
> -                                  PCLK_HZ);
> +                                  s->pclk_freq);
>              } else {
>                  reload =3D s->reg_reload_value * 1000;
>              }
> @@ -177,10 +177,21 @@ static void aspeed_wdt_realize(DeviceState *dev, =
Error **errp)
>  {
>      SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
>      AspeedWDTState *s =3D ASPEED_WDT(dev);
> +    Object *obj;
> +    Error *err =3D NULL;
> =20
>      s->timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, aspeed_wdt_timer_exp=
ired,
>                              dev);
> =20
> +    obj =3D object_property_get_link(OBJECT(dev), "scu", &err);
> +    if (!obj) {
> +        error_setg(errp, "%s: required link 'scu' not found: %s",
> +                   __func__, error_get_pretty(err));
> +        return;
> +    }
> +
> +    s->pclk_freq =3D aspeed_scu_get_clk(ASPEED_SCU(obj));
> +
>      memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_wdt_ops, s,
>                            TYPE_ASPEED_WDT, WDT_IO_REGION_SIZE);
>      sysbus_init_mmio(sbd, &s->iomem);
> diff --git a/include/hw/watchdog/wdt_aspeed.h b/include/hw/watchdog/wdt=
_aspeed.h
> index dbf45ae968db..0483335ecee5 100644
> --- a/include/hw/watchdog/wdt_aspeed.h
> +++ b/include/hw/watchdog/wdt_aspeed.h
> @@ -36,6 +36,8 @@ typedef struct AspeedWDTState {
>      uint32_t reg_reload_value;
>      uint32_t reg_restart;
>      uint32_t reg_ctrl;
> +
> +    uint32_t pclk_freq;
>  } AspeedWDTState;
> =20
>  #endif  /* ASPEED_WDT_H */
>=20

