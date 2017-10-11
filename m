Received: by 10.223.197.9 with SMTP id q9csp691498wrf;
        Wed, 11 Oct 2017 07:53:24 -0700 (PDT)
X-Received: by 10.55.215.220 with SMTP id t89mr20519037qkt.34.1507733604737;
        Wed, 11 Oct 2017 07:53:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507733604; cv=none;
        d=google.com; s=arc-20160816;
        b=GvuClN3sno6uNl1nF0JVyN2JQmqy/nei5RU72gKhCoaq6lSv/iBQbpliUeHnSrYBsL
         Xj2I6ZTtdfHRCHpfKvZbSiWI5vhIM1jQ7h7W7snJb96EybSfC/BBP+7iX2VFFEqz87C1
         FSrau+qjwDOHuVfyGGOPb1z6zn26RrFoOR7XM0zHw/iRgWlDt3dN8c0fvoDuvrdK/SnG
         Gq1I6fwUB2oeuHIjWykcr9Uk+ZicOR6Cndam7pwHH73RAr0NZ4qWhQELl2NGfNl2KKZR
         46IFebRVeoduxo8OozMYp+UEW3MvtcNEPYI1jMFfeVXk8Q0zuk9Q/QMZKXVSeVIqHoUn
         e7CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=zWsU226nBam4UM9DKZpzc2i7j5JXowbvcSdRD0Plh7g=;
        b=hlVok3SScqFH6y6w4teF9uzwxhv/hDIzQoPT7ad13wA9tu/wPsxRAPz1iQ8Qu3ZhAK
         2drUGBrRaCbLfJlEg3xr34OJQVtIxLBXiCC9sFXt4QK/nVb1FavKshRPzQ+/02PJ1TtD
         X+DbeC9NPxwYJElMjjKvVev6A3AQo1j7yMAklw2VW3OPorNsYIcivLxYibtkABVUd92m
         xfA9LHZvIvk5pU+Py7RpOoFTn1dZR7yff6ShGyr/r2KrTa6c4bXkf2JbkP62wGdFavvQ
         nNbYUvscoMIKWKl4eUzPD1SJR2tUErtZX07Y3d7ceKiAt7DaFY/EOGA/R2R7NtFbJVwm
         +Pbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bZuNJqsT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b100si3287057qkb.273.2017.10.11.07.53.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 11 Oct 2017 07:53:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bZuNJqsT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41322 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e2INu-0001KP-GA
	for alex.bennee@linaro.org; Wed, 11 Oct 2017 10:53:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54955)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e2INi-0001Js-R2
	for qemu-arm@nongnu.org; Wed, 11 Oct 2017 10:53:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e2INh-0005ba-Lf
	for qemu-arm@nongnu.org; Wed, 11 Oct 2017 10:53:10 -0400
Received: from mail-wm0-x22b.google.com ([2a00:1450:400c:c09::22b]:54370)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e2INh-0005b9-Bs
	for qemu-arm@nongnu.org; Wed, 11 Oct 2017 10:53:09 -0400
Received: by mail-wm0-x22b.google.com with SMTP id i124so5572210wmf.3
	for <qemu-arm@nongnu.org>; Wed, 11 Oct 2017 07:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=zWsU226nBam4UM9DKZpzc2i7j5JXowbvcSdRD0Plh7g=;
	b=bZuNJqsT20n2qAdbL8xMGU9lemkHLl/r3pNS3nv5wObAKq9iTywxNFwjfGpAZStnch
	59BC3SWcANjYitkDqq/YOkDlaNF0HWmMKPTvbT1Jm1uZB2MwdSAKXMcIvvGbeVJlx6ba
	XLugQ1UTlPYPzHYu6tn74DBj1RHto709uZU04=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=zWsU226nBam4UM9DKZpzc2i7j5JXowbvcSdRD0Plh7g=;
	b=i11lzN/4DiBikhLN8QxqP7/Cr/UO33gn9J27QyTRXTVJ3crY/i3pqUvJ/iByVx15Wa
	Rae8IRzkYCiLQNFu7fpD86O8w/Wj52PbXXrUo4op325cqIf5DIUKwh9hfFZGwhn4JxLJ
	cEFtUSp26jxauE4f2KwQVQjwp+bAsOqHhHHzKnlFDfEKwzcUNt16V3o8Xu16uTQUXYeO
	YBgoenTDQXe+RW2fsmzcV5NvsyYOmeotzhTQxe1Wyk/er3Gr/epHwJmOz9Ir5IwqnQoQ
	P/7ueCQbjbii72bC5Wt1ze/vAdUMIyoJKnnkDhJ1io+p2+AJGVC7hBYFfIl9CCxA24La
	/e2w==
X-Gm-Message-State: AMCzsaWKL4F4y/vqg1TAo/tFF5/0O2lrbjYunA67Or41WvTMuJximVz0
	hpivlfUX9b1dfrU6j7ValmWxf3KxfK+ttOeIO3YTtQ==
X-Google-Smtp-Source: AOwi7QCdyqNY1TchOkNBZmbzHAd2VFhNQExkf/biz0xNR643OzIs6XBO1wIu/BVYTHvoa/k20VxhXY8zdLPfi6nFKgk=
X-Received: by 10.28.113.196 with SMTP id d65mr12765492wmi.151.1507733588073; 
	Wed, 11 Oct 2017 07:53:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.128.207 with HTTP; Wed, 11 Oct 2017 07:52:47 -0700 (PDT)
In-Reply-To: <1507728290-6062-1-git-send-email-thomas.venries@gmail.com>
References: <150771862388.288.7275764832812347655@b58463cdfd5f>
	<1507728290-6062-1-git-send-email-thomas.venries@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 11 Oct 2017 15:52:47 +0100
Message-ID: <CAFEAcA_qyyr2tJ4MOTwdeH=bs9eAAgznPox4yCAX7n2p+7ipFw@mail.gmail.com>
To: =?UTF-8?Q?Thomas_Venri=C3=A8s?= <thomas.venries@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22b
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2] bcm2835_armtimer: add
 bcm2835 ARM timer
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FLv2YXAT+zn4

On 11 October 2017 at 14:24, Thomas Venri=C3=A8s <thomas.venries@gmail.com>=
 wrote:
> The ARM Timer is based on a ARM AP804, but it has
> a number of differences with the standard SP804.
> There is only one timer which runs in continuous
> mode with an extra clock pre-divider register
> and a 32-bit free running counter.
>
> The extra stop-in-debug-mode control bit is not
> implemented.
>
> Signed-off-by: Thomas Venri=C3=A8s <thomas.venries@gmail.com>
> ---
>  hw/arm/bcm2835_peripherals.c         |  18 +++
>  hw/timer/Makefile.objs               |   1 +
>  hw/timer/bcm2835_armtimer.c          | 273 +++++++++++++++++++++++++++++=
++++++
>  hw/timer/trace-events                |   4 +
>  include/hw/arm/bcm2835_peripherals.h |   2 +
>  include/hw/timer/bcm2835_armtimer.h  |  35 +++++
>  6 files changed, 333 insertions(+)
>  create mode 100644 hw/timer/bcm2835_armtimer.c
>  create mode 100644 include/hw/timer/bcm2835_armtimer.h
>
> diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
> index 12e0dd1..73deb2e 100644
> --- a/hw/arm/bcm2835_peripherals.c
> +++ b/hw/arm/bcm2835_peripherals.c
> @@ -90,6 +90,11 @@ static void bcm2835_peripherals_init(Object *obj)
>      object_property_add_child(obj, "rng", OBJECT(&s->rng), NULL);
>      qdev_set_parent_bus(DEVICE(&s->rng), sysbus_get_default());
>
> +    /* ARM Timer */
> +    object_initialize(&s->armtimer, sizeof(s->armtimer), TYPE_BCM2835_AR=
MTIMER);
> +    object_property_add_child(obj, "armtimer", OBJECT(&s->armtimer), NUL=
L);
> +    qdev_set_parent_bus(DEVICE(&s->armtimer), sysbus_get_default());
> +
>      /* Extended Mass Media Controller */
>      object_initialize(&s->sdhci, sizeof(s->sdhci), TYPE_SYSBUS_SDHCI);
>      object_property_add_child(obj, "sdhci", OBJECT(&s->sdhci), NULL);
> @@ -254,6 +259,19 @@ static void bcm2835_peripherals_realize(DeviceState =
*dev, Error **errp)
>      memory_region_add_subregion(&s->peri_mr, RNG_OFFSET,
>                  sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->rng), 0));
>
> +    /* ARM Timer */
> +    object_property_set_bool(OBJECT(&s->armtimer), true, "realized", &er=
r);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +
> +    memory_region_add_subregion(&s->peri_mr, ARMCTRL_TIMER0_1_OFFSET,
> +                sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->armtimer), 0))=
;
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->armtimer), 0,
> +        qdev_get_gpio_in_named(DEVICE(&s->ic), BCM2835_IC_ARM_IRQ,
> +                               INTERRUPT_ARM_TIMER));
> +
>      /* Extended Mass Media Controller */
>      object_property_set_int(OBJECT(&s->sdhci), BCM2835_SDHC_CAPAREG, "ca=
pareg",
>                              &err);
> diff --git a/hw/timer/Makefile.objs b/hw/timer/Makefile.objs
> index 8c19eac..268d485 100644
> --- a/hw/timer/Makefile.objs
> +++ b/hw/timer/Makefile.objs
> @@ -29,6 +29,7 @@ obj-$(CONFIG_EXYNOS4) +=3D exynos4210_rtc.o
>  obj-$(CONFIG_OMAP) +=3D omap_gptimer.o
>  obj-$(CONFIG_OMAP) +=3D omap_synctimer.o
>  obj-$(CONFIG_PXA2XX) +=3D pxa2xx_timer.o
> +obj-$(CONFIG_RASPI) +=3D bcm2835_armtimer.o
>  obj-$(CONFIG_SH4) +=3D sh_timer.o
>  obj-$(CONFIG_DIGIC) +=3D digic-timer.o
>  obj-$(CONFIG_MIPS_CPS) +=3D mips_gictimer.o
> diff --git a/hw/timer/bcm2835_armtimer.c b/hw/timer/bcm2835_armtimer.c
> new file mode 100644
> index 0000000..39ff213
> --- /dev/null
> +++ b/hw/timer/bcm2835_armtimer.c
> @@ -0,0 +1,273 @@
> +/*
> + * BCM2835 ARM Timer
> + *
> + * Copyright (C) 2017 Thomas Venri=C3=A8s <thomas.venries@gmail.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/log.h"
> +#include "qapi/error.h"
> +#include "qemu/timer.h"
> +#include "qemu/main-loop.h"
> +#include "hw/ptimer.h"
> +#include "hw/timer/bcm2835_armtimer.h"
> +#include "trace.h"
> +
> +#define ARM_TIMER_REG_SIZE      0x24
> +
> +/* Register offsets */
> +#define ARM_TIMER_LOAD          0x00
> +#define ARM_TIMER_VALUE         0x04
> +#define ARM_TIMER_CTRL          0x08
> +#define ARM_TIMER_INTCLR        0x0C
> +#define ARM_TIMER_RAW_IRQ       0x10
> +#define ARM_TIMER_MASK_IRQ      0x14
> +#define ARM_TIMER_RELOAD        0x18
> +#define ARM_TIMER_PREDIVIDER    0x1C
> +#define ARM_TIMER_COUNTER       0x20
> +
> +/* Control register masks */
> +#define CTRL_CNT_PRESCALE       (0xFF << 16)
> +#define CTRL_CNT_ENABLE         (1 << 9)
> +#define CTRL_TIMER_ENABLE       (1 << 7)
> +#define CTRL_INT_ENABLE         (1 << 5)
> +#define CTRL_TIMER_PRESCALE     (3 << 2)
> +#define CTRL_TIMER_SIZE_32BIT   (1 << 1)
> +
> +#define CTRL_TIMER_WRAP_MODE    0
> +
> +/* Register reset values */
> +#define CTRL_CNT_PRESCALE_RESET     (0x3E << 16)
> +#define ARM_TIMER_CTRL_RESET        (CTRL_CNT_PRESCALE_RESET | CTRL_INT_=
ENABLE)
> +#define ARM_TIMER_IE_READ_VALUE     0x544D5241  /* ASCII "ARMT" */
> +/*
> +   The system clock refers to a 250 MHz frequency by default.
> +   This frequency can be changed by setting `core_freq` the `config.txt`=
 file.

What config.txt is this referring to?

> +   APB clock runs at half the speed of the system clock also called ARM =
clock.
> +
> +   The ARM timer's predivider register is 10 bits wide and can be writte=
n
> +   or read from. This register has been added as the SP804 expects a 1MH=
z clock
> +   which they do not have. Instead the predivider takes the APB clock
> +   and divides it down according to:
> +
> +       timer_clock =3D apb_clock / (prediv + 1)
> +
> +   The need is a 1MHz timer clock frequency and BCM2835 ARM Peripherals
> +   documentation mentions the predivider reset value is 0x7D (or 125), s=
o
> +   the APB clock refers to a 126MHz frequency.
> +
> +   Also the additional free-running counter runs from the APB clock and =
has
> +   its own clock predivider controlled by buts 16-23 of the timer contro=
l reg:
> +
> +       frc_clock =3D apb_clock / (prediv + 1)
> +
> +   The predivider reset value is 0x3E (or 62), knowing APB clock frequen=
cy,
> +   the FRN clock refers to a 2MHz frequency by default.
> +*/
> +#define ARM_APB_FREQ                126000000UL /* Hz */
> +#define ARM_TIMER_PREDIVIDER_RESET  125         /* MHz */
> +
> +static const uint16_t ctrl_prescale[] =3D { 1, 16, 256, 1 };
> +
> +static void bcm2835_armtimer_recalibrate(BCM2835ARMTimerState *s, int re=
load)
> +{
> +    uint32_t limit;
> +
> +    /* ARM Dual-Timer Module SP804, section 3.2.1:
> +       If the Load Register is set to 0 then an interrupt is generated
> +       immediately. */
> +    if (reload =3D=3D 2) {
> +        limit =3D s->reload;
> +    } else {
> +        limit =3D (s->ctrl & CTRL_TIMER_SIZE_32BIT) ? 0xFFFFFFFF : 0XFFF=
F;
> +    }
> +
> +    ptimer_set_limit(s->timer, limit, reload);
> +}

This whole file is very duplicative of code with arm-timer.c. Can
we implement it by adding a property to the arm_timer device that
says "behave like the bcm2835 variant" ?

thanks
-- PMM
