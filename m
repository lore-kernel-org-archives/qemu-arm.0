Received: by 10.25.0.147 with SMTP id 141csp347879lfa;
        Thu, 23 Feb 2017 11:11:00 -0800 (PST)
X-Received: by 10.237.37.197 with SMTP id y5mr22669147qtc.168.1487877060701;
        Thu, 23 Feb 2017 11:11:00 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b65si3952991qkc.157.2017.02.23.11.11.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Feb 2017 11:11:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60436 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cgyn4-0003IK-2h
	for alex.bennee@linaro.org; Thu, 23 Feb 2017 14:10:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55111)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cgylV-0002N7-MM
	for qemu-devel@nongnu.org; Thu, 23 Feb 2017 14:09:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cgylU-0002W3-C2
	for qemu-devel@nongnu.org; Thu, 23 Feb 2017 14:09:21 -0500
Received: from mail-wm0-x231.google.com ([2a00:1450:400c:c09::231]:33172)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cgylU-0002Vj-2x
	for qemu-devel@nongnu.org; Thu, 23 Feb 2017 14:09:20 -0500
Received: by mail-wm0-x231.google.com with SMTP id t18so4987455wmt.0
	for <qemu-devel@nongnu.org>; Thu, 23 Feb 2017 11:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Jrdyxi3qM6q5krABseAIheu/e96NRewMu1rDG3BdKkM=;
	b=Id9m1I+0ULAHmet7dyilp4HMeR0sMRJdBxigMThoUXFjtVE8UGKyi2082nS9qMstwa
	LvhvbuiefmZ1wgnlTQyxHAT/UZPRlUFGELH516rgAjTpaW73JFGJmaJXAuu855+o2+R/
	jly6lz9+BDjvSwoRetWtgQ+rDY1zRRAnHmfMA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Jrdyxi3qM6q5krABseAIheu/e96NRewMu1rDG3BdKkM=;
	b=NyXzTcKwglTw7LVYAUFphwHRi5sfI9tXVZCwJqXBQrPVcYHcDp4hrtwisFlpwjKhQ8
	6ZM9hjO3Z0p15XzVZIfJS53/dkHDefznjtzpQ9Spxol9S+StsVEz6qef7TF/k6wkexnq
	4bYUh1gSd0PXAO/bVJpqKKvar1Rh1QG5d+wgUI50kzzjiVZKvtjMnm+TvMbcYtqCyECH
	b1dv1jm90/b7AX9tBudAX9lJ8zZAXbDRpCYWxC8hBdjhTiEQ6REGcxwHT6a6mtYi26qp
	3wP0fMHs8dgUKIHhfOFyLrX5AfUzlMRpzpUX+d6CmlS7dylXVEwK8j/mN0cjUes8cg1t
	K7lA==
X-Gm-Message-State: AMke39kzJVq/Y9DrO8r9xY55BrAQaWvL+dQRB0BdPGCvpB63hB+vuIzRVEsELNaP3chWKdzApIx6e8Ui68GBnSNK
X-Received: by 10.28.55.199 with SMTP id e190mr6102696wma.92.1487876958972;
	Thu, 23 Feb 2017 11:09:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Thu, 23 Feb 2017 11:08:58 -0800 (PST)
In-Reply-To: <20170222112338.25492-3-clement.deschamps@antfield.fr>
References: <20170222112338.25492-1-clement.deschamps@antfield.fr>
	<20170222112338.25492-3-clement.deschamps@antfield.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Feb 2017 19:08:58 +0000
Message-ID: <CAFEAcA_jPaQxfoXKz82WaQ+62krkbQ7RCm66DeELj30jOE7_Xg@mail.gmail.com>
To: Clement Deschamps <clement.deschamps@antfield.fr>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::231
Subject: Re: [Qemu-devel] [PATCH v2 2/3] bcm2835_gpio: add bcm2835 gpio
 controller
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Andrew Baumann <andrew.baumann@microsoft.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7wll0XCWcaSJ

On 22 February 2017 at 11:23, Clement Deschamps
<clement.deschamps@antfield.fr> wrote:
> This adds the BCM2835 GPIO controller.
>
> It implements:
> - The 54 GPIOs as outputs (qemu_irq)
> - The SD controller selection via alternate function of GPIOs 48-53
>
> Signed-off-by: Clement Deschamps <clement.deschamps@antfield.fr>
> ---
>  hw/gpio/Makefile.objs          |   1 +
>  hw/gpio/bcm2835_gpio.c         | 361 +++++++++++++++++++++++++++++++++++++++++
>  include/hw/gpio/bcm2835_gpio.h |  38 +++++
>  3 files changed, 400 insertions(+)
>  create mode 100644 hw/gpio/bcm2835_gpio.c
>  create mode 100644 include/hw/gpio/bcm2835_gpio.h
>
> diff --git a/hw/gpio/Makefile.objs b/hw/gpio/Makefile.objs
> index a43c7cf442..fa0a72e6d0 100644
> --- a/hw/gpio/Makefile.objs
> +++ b/hw/gpio/Makefile.objs
> @@ -7,3 +7,4 @@ common-obj-$(CONFIG_GPIO_KEY) += gpio_key.o
>
>  obj-$(CONFIG_OMAP) += omap_gpio.o
>  obj-$(CONFIG_IMX) += imx_gpio.o
> +obj-$(CONFIG_RASPI) += bcm2835_gpio.o
> diff --git a/hw/gpio/bcm2835_gpio.c b/hw/gpio/bcm2835_gpio.c
> new file mode 100644
> index 0000000000..a75f0ebb6b
> --- /dev/null
> +++ b/hw/gpio/bcm2835_gpio.c
> @@ -0,0 +1,361 @@
> +/*
> + * Raspberry Pi (BCM2835) GPIO Controller
> + *
> + * Copyright (c) 2017 Antfield SAS
> + *
> + * Authors:
> + *  Clement Deschamps <clement.deschamps@antfield.fr>
> + *  Luc Michel <luc.michel@antfield.fr>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/log.h"
> +#include "qemu/timer.h"
> +#include "qapi/error.h"
> +#include "hw/sysbus.h"
> +#include "hw/sd/sd.h"
> +#include "hw/gpio/bcm2835_gpio.h"
> +
> +#define GPFSEL0   0x00
> +#define GPFSEL1   0x04
> +#define GPFSEL2   0x08
> +#define GPFSEL3   0x0C
> +#define GPFSEL4   0x10
> +#define GPFSEL5   0x14
> +#define GPSET0    0x1C
> +#define GPSET1    0x20
> +#define GPCLR0    0x28
> +#define GPCLR1    0x2C
> +#define GPLEV0    0x34
> +#define GPLEV1    0x38
> +#define GPEDS0    0x40
> +#define GPEDS1    0x44
> +#define GPREN0    0x4C
> +#define GPREN1    0x50
> +#define GPFEN0    0x58
> +#define GPFEN1    0x5C
> +#define GPHEN0    0x64
> +#define GPHEN1    0x68
> +#define GPLEN0    0x70
> +#define GPLEN1    0x74
> +#define GPAREN0   0x7C
> +#define GPAREN1   0x80
> +#define GPAFEN0   0x88
> +#define GPAFEN1   0x8C
> +#define GPPUD     0x94
> +#define GPPUDCLK0 0x98
> +#define GPPUDCLK1 0x9C
> +
> +static uint32_t gpfsel_get(BCM2835GpioState *s, uint8_t reg)
> +{
> +    int i;
> +    uint32_t value = 0;
> +    for (i = 0; i < 10; i++) {
> +        uint32_t index = 10 * reg + i;
> +        if (index < sizeof(s->fsel)) {
> +            value |= (s->fsel[index] & 0x7) << (3 * i);
> +        }
> +    }
> +    return value;
> +}
> +
> +static void sdbus_reparent_card(SDBus *from, SDBus *to)
> +{
> +    BusChild *kid = QTAILQ_FIRST(&from->qbus.children);
> +    if(kid == NULL) {
> +        return;
> +    }
> +    SDState *card = SD_CARD(kid->child);

This inlining of get_card() suggests to me that we want this function
to be defined in hw/sd/core.c, rather than here.

> +    sdbus_set_inserted(from, false);
> +    object_unparent(OBJECT(kid));
> +    qdev_set_parent_bus(DEVICE(card), &to->qbus);
> +    sdbus_set_inserted(to, true);

I think we probably also want to call
 sdbus_set_readonly(to, readonly)
to tell the destination controller the r/o state.
(compare sd_cardchange(), though here we'll need to use
sc->get_readonly() like sdbus_get_readonly() does).

Do we also need to call the SD card object's reset method?

A comment to the effect of:
/* We directly reparent the card object rather than implementing this
 * as a hotpluggable connection because we don't want to expose SD cards
 * to users as being hotpluggable, and we can get away with it in this
 * limited use case. This could perhaps be implemented more cleanly in
 * future by adding support to the hotplug infrastructure for "device
 * can be hotplugged only via code, not by user".
 */

will also be helpful for alerting future readers to the fact
we're doing something pragmatic-but-not-ideal here.

> +}
> +
> +static void gpfsel_set(BCM2835GpioState *s, uint8_t reg, uint32_t value)
> +{
> +    int i;
> +    for (i = 0; i < 10; i++) {
> +        uint32_t index = 10 * reg + i;
> +        if (index < sizeof(s->fsel)) {
> +            int fsel = (value >> (3 * i)) & 0x7;
> +            s->fsel[index] = fsel;
> +        }
> +    }
> +
> +    /* SD controller selection (48-53) */
> +    if (s->sd_fsel != 0
> +            && (s->fsel[48] == 0) /* SD_CLK_R */
> +            && (s->fsel[49] == 0) /* SD_CMD_R */
> +            && (s->fsel[50] == 0) /* SD_DATA0_R */
> +            && (s->fsel[51] == 0) /* SD_DATA1_R */
> +            && (s->fsel[52] == 0) /* SD_DATA2_R */
> +            && (s->fsel[53] == 0) /* SD_DATA3_R */
> +            ) {
> +        /* SDHCI controller selected */
> +        sdbus_reparent_card(&s->sdhost->sdbus, &s->sdhci->sdbus);
> +        s->sd_fsel = 0;
> +    } else if (s->sd_fsel != 4
> +            && (s->fsel[48] == 4) /* SD_CLK_R */
> +            && (s->fsel[49] == 4) /* SD_CMD_R */
> +            && (s->fsel[50] == 4) /* SD_DATA0_R */
> +            && (s->fsel[51] == 4) /* SD_DATA1_R */
> +            && (s->fsel[52] == 4) /* SD_DATA2_R */
> +            && (s->fsel[53] == 4) /* SD_DATA3_R */
> +            ) {
> +        /* SDHost controller selected */
> +        sdbus_reparent_card(&s->sdhci->sdbus, &s->sdhost->sdbus);

It would I think be slightly neater to model this as the
GPIO object exposing an sdbus itself and only taking the
sdbus links from the two controller objects, rather than
taking links to the controllers themselves and grabbing the
sdbus fields out of them. But this isn't user-visible, so
I don't care too much. (We can always come back and tidy it
up later.)

Apart from my comments above about the card-reparenting function
this looks OK to me (and I'd like to squeeze it into 2.9 if we
can; deadline for "patches reviewed and in pull requests is very
near though, 28th).

thanks
-- PMM
