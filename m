Received: by 10.25.77.65 with SMTP id a62csp1725603lfb;
        Tue, 24 Jan 2017 04:30:36 -0800 (PST)
X-Received: by 10.200.56.51 with SMTP id q48mr30181983qtb.189.1485261036285;
        Tue, 24 Jan 2017 04:30:36 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l2si13038037qta.196.2017.01.24.04.30.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 24 Jan 2017 04:30:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48347 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cW0F7-0006e3-K7
	for alex.bennee@linaro.org; Tue, 24 Jan 2017 07:30:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43481)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cVzco-0004hC-Pn
	for qemu-devel@nongnu.org; Tue, 24 Jan 2017 06:51:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cVzcn-0001jD-6S
	for qemu-devel@nongnu.org; Tue, 24 Jan 2017 06:50:58 -0500
Received: from mail-vk0-x230.google.com ([2607:f8b0:400c:c05::230]:34161)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cVzcn-0001ib-0y
	for qemu-devel@nongnu.org; Tue, 24 Jan 2017 06:50:57 -0500
Received: by mail-vk0-x230.google.com with SMTP id r136so110134498vke.1
	for <qemu-devel@nongnu.org>; Tue, 24 Jan 2017 03:50:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=k4BDZ8D3chiEv+aoIGPiIrkoMkjMvgwsth3iYPU39Pc=;
	b=BBQ6A+xqJn5hLNznRtb9kRWLcSumfJnuqByNBZH6xoMkyDKGjsg+zaII/C9hVxFx16
	KejW70af2Z/bLx0+IZwx5vLHsIqSk2Gidv+qgZ7evV0g1jOJLqnPOZH8S1y8UGS4CS+X
	lNZTovnXJpgz7eX4jyUJr+wt8a0XS91ZqrkbM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=k4BDZ8D3chiEv+aoIGPiIrkoMkjMvgwsth3iYPU39Pc=;
	b=j9wiUZOjf6reFVufgK/JhJdplodsjw+PRM8o3P3YJk4pLSoeRWGf9H5pjDGQqnYGDJ
	jnj8qzu/uldySpEkEoXtzpDucPt45O9VIjTwN7Qdt5BX2ntS93bHZaT3C62/c5+Uq9/E
	q3HoQqHsmGxZglO8zrhf3V5mRzp0s5PJLSKGDf0Beg/SMuR0sS8Syxec3yR+b8R31RU2
	G3719RxqIlhvf7ljLbmDReppKA299GC3KAueOVGEnPklL5NgbR+uow9vG4FUXZcIL/2E
	U+mFyHhM7cYMmfEp+tzpcAcTGlkgDqYeRIbdnIvjfg7++U4qU91TzFI8bHnMOUhQ37cl
	VPZg==
X-Gm-Message-State: AIkVDXL3k20SkiFGe0BBLLIytgb+71vvb92ZX5ISGlkU194+1xVu3K35K7HbRmr+CI1biUEBz8Nklt1oYjMHL+VN
X-Received: by 10.31.62.71 with SMTP id l68mr16081836vka.175.1485258656220;
	Tue, 24 Jan 2017 03:50:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.176.14 with HTTP; Tue, 24 Jan 2017 03:50:35 -0800 (PST)
In-Reply-To: <1484758531-15093-2-git-send-email-clg@kaod.org>
References: <1484758531-15093-1-git-send-email-clg@kaod.org>
	<1484758531-15093-2-git-send-email-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Jan 2017 11:50:35 +0000
Message-ID: <CAFEAcA-nGU+4ddOGO-kJnbayvOy6cn9DA9ZXfT7w7-_grvgLVg@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::230
Subject: Re: [Qemu-devel] [PATCH 1/2] wdt: Add Aspeed watchdog device model
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mKQBazqSTfOH

On 18 January 2017 at 16:55, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> From: Joel Stanley <joel@jms.id.au>
>
> The Aspeed SoC includes a set of watchdog timers using 32-bit
> decrement counters, which can be based either on the APB clock or
> a 1 MHz clock.
>
> The watchdog timer is designed to prevent system deadlock and, in
> general, it should be restarted before timeout. When a timeout occurs,
> different types of signals can be generated, ARM reset, SOC reset,
> System reset, CPU Interrupt, external signal or boot from alternate
> block. The current model only performs the system reset function as
> this is used by U-Boot and Linux.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> [clg: - fixed compile breakage
>       - fixed io region size
>       - added watchdog_perform_action() on timer expiry
>       - wrote a commit log
>       - merged fixes from Andrew Jeffery to scale the reload value ]
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  hw/watchdog/Makefile.objs        |   1 +
>  hw/watchdog/wdt_aspeed.c         | 214 +++++++++++++++++++++++++++++++++=
++++++
>  include/hw/watchdog/wdt_aspeed.h |  37 +++++++
>  3 files changed, 252 insertions(+)
>  create mode 100644 hw/watchdog/wdt_aspeed.c
>  create mode 100644 include/hw/watchdog/wdt_aspeed.h
>
> diff --git a/hw/watchdog/Makefile.objs b/hw/watchdog/Makefile.objs
> index 72e3ffd93c59..9589bed63a3d 100644
> --- a/hw/watchdog/Makefile.objs
> +++ b/hw/watchdog/Makefile.objs
> @@ -2,3 +2,4 @@ common-obj-y +=3D watchdog.o
>  common-obj-$(CONFIG_WDT_IB6300ESB) +=3D wdt_i6300esb.o
>  common-obj-$(CONFIG_WDT_IB700) +=3D wdt_ib700.o
>  common-obj-$(CONFIG_WDT_DIAG288) +=3D wdt_diag288.o
> +common-obj-$(CONFIG_ASPEED_SOC) +=3D wdt_aspeed.o
> diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
> new file mode 100644
> index 000000000000..96e62c54dc04
> --- /dev/null
> +++ b/hw/watchdog/wdt_aspeed.c
> @@ -0,0 +1,214 @@
> +/*
> + * ASPEED Watchdog Controller
> + *
> + * Copyright (C) 2016-2017 IBM Corp.
> + *
> + * This code is licensed under the GPL version 2 or later. See the
> + * COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/log.h"
> +#include "sysemu/watchdog.h"
> +#include "hw/sysbus.h"
> +#include "qemu/timer.h"
> +#include "hw/watchdog/wdt_aspeed.h"
> +
> +#define WDT_IO_REGION_SIZE      0x20
> +
> +#define WDT_STATUS              0x00
> +#define WDT_RELOAD_VALUE        0x04
> +#define WDT_RESTART             0x08
> +#define WDT_CTRL                0x0C
> +#define WDT_TIMEOUT_STATUS      0x10
> +#define WDT_TIMEOUT_CLEAR       0x14
> +#define WDT_RESET_WDITH         0x18
> +
> +#define WDT_RESTART_MAGIC       0x4755
> +
> +static uint64_t aspeed_wdt_read(void *opaque, hwaddr offset, unsigned si=
ze)
> +{
> +    AspeedWDTState *s =3D ASPEED_WDT(opaque);
> +
> +    switch (offset) {
> +    case WDT_STATUS:
> +        return s->reg_status;
> +    case WDT_RELOAD_VALUE:
> +        return s->reg_reload_value;
> +    case WDT_RESTART:
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: read from write-only reg at offset 0x%"
> +                      HWADDR_PRIx "\n", __func__, offset);
> +        return 0;
> +    case WDT_CTRL:
> +        return s->reg_ctrl;
> +    case WDT_TIMEOUT_STATUS:
> +    case WDT_TIMEOUT_CLEAR:
> +    case WDT_RESET_WDITH:
> +        qemu_log_mask(LOG_UNIMP,
> +                      "%s: uninmplemented read at offset 0x%" HWADDR_PRI=
x "\n",
> +                      __func__, offset);
> +        return 0;
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: Out-of-bounds read at offset 0x%" HWADDR_PRIx=
 "\n",
> +                      __func__, offset);
> +        return 0;
> +    }
> +
> +}
> +
> +#define PCLK_HZ 24000000
> +
> +static void aspeed_wdt_write(void *opaque, hwaddr offset, uint64_t data,
> +                             unsigned size)
> +{
> +    AspeedWDTState *s =3D ASPEED_WDT(opaque);
> +    bool en =3D data & BIT(0);
> +    bool pclk =3D !(data & BIT(4));

These are only valid for WDT_CTRL, right? That being so,
initialising them up here is a bit odd.

> +
> +    switch (offset) {
> +    case WDT_STATUS:
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: write to read-only reg at offset 0x%"
> +                      HWADDR_PRIx "\n", __func__, offset);
> +        break;
> +    case WDT_RELOAD_VALUE:
> +        s->reg_reload_value =3D data;
> +        break;
> +    case WDT_RESTART:
> +        if ((data & 0xFFFF) =3D=3D 0x4755) {
> +            uint32_t reload;
> +
> +            s->reg_status =3D s->reg_reload_value;
> +
> +            if (pclk) {
> +                reload =3D muldiv64(s->reg_reload_value, NANOSECONDS_PER=
_SECOND,
> +                                  PCLK_HZ) ;
> +            } else {
> +                reload =3D s->reg_reload_value * 1000;
> +            }
> +
> +            if (s->enabled) {
> +                timer_mod(s->timer,
> +                          qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + reload=
);
> +            }
> +        }
> +        break;
> +    case WDT_CTRL:
> +        if (en && !s->enabled) {
> +            uint32_t reload;
> +
> +            if (pclk) {
> +                reload =3D muldiv64(s->reg_reload_value, NANOSECONDS_PER=
_SECOND,
> +                                  PCLK_HZ);
> +            } else {
> +                reload =3D s->reg_reload_value * 1000;
> +            }
> +
> +            s->enabled =3D true;
> +            timer_mod(s->timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + =
reload);
> +        } else if (!en && s->enabled) {
> +            s->enabled =3D false;
> +            timer_del(s->timer);
> +        }
> +        break;

Shouldn't this write to s->reg_ctrl ?

s->enabled seems to duplicate state also in s->reg_ctrl.

> +    case WDT_TIMEOUT_STATUS:
> +    case WDT_TIMEOUT_CLEAR:
> +    case WDT_RESET_WDITH:
> +        qemu_log_mask(LOG_UNIMP,
> +                      "%s: uninmplemented write at offset 0x%" HWADDR_PR=
Ix "\n",
> +                      __func__, offset);
> +        break;
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: Out-of-bounds write at offset 0x%" HWADDR_PRI=
x "\n",
> +                      __func__, offset);
> +    }
> +    return;
> +}
> +
> +static WatchdogTimerModel model =3D {
> +    .wdt_name =3D TYPE_ASPEED_WDT,
> +    .wdt_description =3D "aspeed watchdog device",
> +};
> +
> +static const VMStateDescription vmstate_aspeed_wdt =3D {
> +    .name =3D "vmstate_aspeed_wdt",
> +    .version_id =3D 0,
> +    .minimum_version_id =3D 0,
> +    .fields =3D (VMStateField[]) {
> +        VMSTATE_TIMER_PTR(timer, AspeedWDTState),
> +        VMSTATE_BOOL(enabled, AspeedWDTState),

This doesn't seem to have fields for most of the register state.

> +        VMSTATE_END_OF_LIST()
> +    }
> +};

thanks
-- PMM
