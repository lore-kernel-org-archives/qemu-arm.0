Received: by 10.25.0.144 with SMTP id 138csp729602lfa;
        Thu, 20 Apr 2017 06:20:39 -0700 (PDT)
X-Received: by 10.55.144.194 with SMTP id s185mr8104790qkd.144.1492694439278;
        Thu, 20 Apr 2017 06:20:39 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d42si5839292qtc.191.2017.04.20.06.20.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 20 Apr 2017 06:20:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53913 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d1C0k-0002Qy-MW
	for alex.bennee@linaro.org; Thu, 20 Apr 2017 09:20:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34722)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1d1C0f-0002Oa-6i
	for qemu-arm@nongnu.org; Thu, 20 Apr 2017 09:20:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1d1C0d-0006nx-Cv
	for qemu-arm@nongnu.org; Thu, 20 Apr 2017 09:20:33 -0400
Received: from mail-wr0-x229.google.com ([2a00:1450:400c:c0c::229]:32961)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1d1C0d-0006nY-39
	for qemu-arm@nongnu.org; Thu, 20 Apr 2017 09:20:31 -0400
Received: by mail-wr0-x229.google.com with SMTP id w50so12200477wrc.0
	for <qemu-arm@nongnu.org>; Thu, 20 Apr 2017 06:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=LwJ9NEs+4saiQc4KcpCQjpQSTgwoGh4H4gMQlpFCKTw=;
	b=BiKFiRi9gcSpDUXKhWRLFBwi7GfYbXOI+XBccqYsIWUfxoOj3BDlTKnlbjayyH8w7z
	x//dJ7VoCU+a9zK+ykH+hZs6GlClcfHqVzIi2jMPix0C5333otlm7MAJ4IOkLrdb8Hos
	Wy9UshtN0qK8GsvWF9FfHcqLaJtAUw9914AqA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=LwJ9NEs+4saiQc4KcpCQjpQSTgwoGh4H4gMQlpFCKTw=;
	b=L6XgzmeOb6BJEu//ewN39N6wg1g7CU7Pbys1Gu8zmE+APUeomF/sG5k/li3VNIMHiP
	5xS/Inebu+rGVEsVOYd5vYeQdsoIS5Pr7gg31/WGZX5dmrR/g0kAJf0c9m6W571UNKVQ
	GG8aS5FM0UZU+NoKPwb5JlDhtfPKNssai/Tab66oF/Gfyo/i+PSh38z8ShL48GWBBdey
	gbOCxCCuOZi0stuoLiFSQRA8OAmlXeCHreUvi6kpOJTvVjtvF+xEOwKE5AXZO3xwWk/4
	CMh5on9683O4LOJbydKlcOEqOyfvyq6N25jw24F3F2CABSgUJrBQ+LzftEp5rP2fYl3M
	RvDg==
X-Gm-Message-State: AN3rC/72nTJ+DVk/tkL+XEsMm2kOCFHK9ZI/vYVoSKYOEY+UFA1cXWVv
	RPJohR7gup0OB2hCnIJvd6MMHUKQDVL2
X-Received: by 10.223.150.179 with SMTP id u48mr1855675wrb.195.1492694429844; 
	Thu, 20 Apr 2017 06:20:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.145.68 with HTTP; Thu, 20 Apr 2017 06:20:09 -0700 (PDT)
In-Reply-To: <20170408054318.19830-1-omar.rizwan@gmail.com>
References: <20170408054318.19830-1-omar.rizwan@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 Apr 2017 14:20:09 +0100
Message-ID: <CAFEAcA_t1L_UPwV7Uwy9ygEOjBw=RLEkdcD13yepMJe+s7kQmg@mail.gmail.com>
To: Omar Rizwan <omar.rizwan@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::229
Subject: Re: [Qemu-arm] [PATCH] raspi: Add Raspberry Pi 1 support
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sPn3P5VMcfFR

On 8 April 2017 at 06:43, Omar Rizwan <omar.rizwan@gmail.com> wrote:
> Signed-off-by: Omar Rizwan <omar.rizwan@gmail.com>
> ---
>  hw/arm/Makefile.objs         |   2 +-
>  hw/arm/bcm2835.c             | 119 +++++++++++++++++++++++++++++++++++++++++++
>  hw/arm/bcm2835_peripherals.c |   1 +
>  hw/arm/raspi.c               |  47 ++++++++++++++---
>  include/hw/arm/bcm2835.h     |  31 +++++++++++
>  5 files changed, 191 insertions(+), 9 deletions(-)
>  create mode 100644 hw/arm/bcm2835.c
>  create mode 100644 include/hw/arm/bcm2835.h

Hi; thanks for this patch. I have a few comments below to add to the ones
from Andrew.


> +/* Peripheral base address seen by the CPU */
> +#define BCM2835_PERI_BASE       0x20000000
> +
> +static void bcm2835_init(Object *obj)
> +{
> +    BCM2835State *s = BCM2835(obj);
> +
> +    object_initialize(&s->cpu, sizeof(s->cpu), "arm1176-" TYPE_ARM_CPU);
> +    object_property_add_child(obj, "cpu", OBJECT(&s->cpu), &error_abort);
> +
> +    object_initialize(&s->peripherals, sizeof(s->peripherals),
> +                      TYPE_BCM2835_PERIPHERALS);
> +    object_property_add_child(obj, "peripherals", OBJECT(&s->peripherals),
> +                              &error_abort);
> +    object_property_add_alias(obj, "board-rev", OBJECT(&s->peripherals),
> +                              "board-rev", &error_abort);
> +    object_property_add_alias(obj, "vcram-size", OBJECT(&s->peripherals),
> +                              "vcram-size", &error_abort);
> +    qdev_set_parent_bus(DEVICE(&s->peripherals), sysbus_get_default());
> +}
> +
> +static void bcm2835_realize(DeviceState *dev, Error **errp)
> +{
> +    BCM2835State *s = BCM2835(dev);
> +    Object *obj;
> +    Error *err = NULL;
> +
> +    /* common peripherals from bcm2835 */
> +    obj = object_property_get_link(OBJECT(dev), "ram", &err);
> +    if (obj == NULL) {
> +        error_setg(errp, "%s: required ram link not found: %s",
> +                   __func__, error_get_pretty(err));
> +        return;
> +    }
> +
> +    object_property_add_const_link(OBJECT(&s->peripherals), "ram", obj, &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +
> +    object_property_set_bool(OBJECT(&s->peripherals), true, "realized", &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +
> +    object_property_add_alias(OBJECT(s), "sd-bus", OBJECT(&s->peripherals),
> +                              "sd-bus", &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +
> +    sysbus_mmio_map_overlap(SYS_BUS_DEVICE(&s->peripherals), 0,
> +                            BCM2835_PERI_BASE, 1);
> +
> +    sysbus_mmio_map_overlap(SYS_BUS_DEVICE(&s->peripherals), 1,
> +                            0x40000000, 1);

If this mapping is correct, can we have a #define for this address, like we
do for BCM2835_PERI_BASE ?

(I see from Andrew's review that it's not clear whether we should be
mapping this here.)

> +
> +    object_property_set_bool(OBJECT(&s->cpu), true, "realized", &err);
> +    if (err) {
> +        error_report_err(err);
> +        exit(1);
> +    }
> +
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->peripherals), 0,
> +                       qdev_get_gpio_in(DEVICE(&s->cpu), ARM_CPU_IRQ));
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->peripherals), 1,
> +                       qdev_get_gpio_in(DEVICE(&s->cpu), ARM_CPU_FIQ));
> +
> +}
> +
> +static void bcm2835_class_init(ObjectClass *oc, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(oc);
> +
> +    dc->realize = bcm2835_realize;
> +
> +    /*
> +     * Reason: creates an ARM CPU, thus use after free(), see
> +     * arm_cpu_class_init()
> +     */
> +    dc->cannot_destroy_with_object_finalize_yet = true;

This assignment and its attached comment can be deleted, because
the issue with arm_cpu_class_init() has now been fixed upstream
(there's a patchset on the list that removes the DeviceClass
field entirely).

> +}
> +
> +static const TypeInfo bcm2835_type_info = {
> +    .name = TYPE_BCM2835,
> +    .parent = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(BCM2835State),
> +    .instance_init = bcm2835_init,
> +    .class_init = bcm2835_class_init,
> +};
> +
> +static void bcm2835_register_types(void)
> +{
> +    type_register_static(&bcm2835_type_info);
> +}
> +
> +type_init(bcm2835_register_types)
> diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
> index 369ef1e..a6cd54a 100644
> --- a/hw/arm/bcm2835_peripherals.c
> +++ b/hw/arm/bcm2835_peripherals.c
> @@ -34,6 +34,7 @@ static void bcm2835_peripherals_init(Object *obj)
>      /* Internal memory region for peripheral bus addresses (not exported) */
>      memory_region_init(&s->gpu_bus_mr, obj, "bcm2835-gpu", (uint64_t)1 << 32);
>      object_property_add_child(obj, "gpu-bus", OBJECT(&s->gpu_bus_mr), NULL);
> +    sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->gpu_bus_mr);

If we determine that this is correct, then we should delete the "(not exported)"
part of the comment above, because this added call to sysbus_init_mmio()
is exporting the memory region.

>      /* Internal memory region for request/response communication with
>       * mailbox-addressable peripherals (not exported)
> diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
> index 2b295f1..dca6077 100644
> --- a/hw/arm/raspi.c
> +++ b/hw/arm/raspi.c
> @@ -2,9 +2,11 @@
>   * Raspberry Pi emulation (c) 2012 Gregory Estrade
>   * Upstreaming code cleanup [including bcm2835_*] (c) 2013 Jan Petrous
>   *
> - * Rasperry Pi 2 emulation Copyright (c) 2015, Microsoft
> + * Raspberry Pi 2 emulation Copyright (c) 2015, Microsoft
>   * Written by Andrew Baumann
>   *
> + * Raspberry Pi 1 rebase onto master (c) 2017, Omar Rizwan
> + *
>   * This code is licensed under the GNU GPLv2 and later.
>   */
>
> @@ -12,6 +14,7 @@
>  #include "qapi/error.h"
>  #include "qemu-common.h"
>  #include "cpu.h"
> +#include "hw/arm/bcm2835.h"
>  #include "hw/arm/bcm2836.h"
>  #include "qemu/error-report.h"
>  #include "hw/boards.h"
> @@ -27,6 +30,11 @@
>  /* Table of Linux board IDs for different Pi versions */
>  static const int raspi_boardid[] = {[1] = 0xc42, [2] = 0xc43};
>
> +/* Table of board revisions:
> + * https://github.com/AndrewFromMelbourne/raspberry_pi_revision/blob/2764c19983fb7b1ef8cb21031e94c293703afa2e/README.md
> + */
> +static const uint32_t raspi_boardrev[] = {[1] = 0x10, [2] = 0xa21041};

So we have three things here that are per-board:
 * the boardid value
 * the boardrev value
 * the soc_type value

which we have stored in two arrays plus passing a different parameter
to the raspi_machine_init function.

Perhaps this would be better as a
typedef struct RPiInfo {
    const char *soc_type;
    uint32_t boardrev;
    uint32_t boardid;
} RPiInfo;

static const RPiInfo rpi_boards[] = {
    {
         /* Raspberry Pi 1 */
         .soc_type = TYPE_BCM2835,
         .boardrev = 0x10,
         .boardid = 0xc42,
    }, {
         /* Raspberry Pi 2 */
         ...
    }
};

?

thanks
-- PMM
