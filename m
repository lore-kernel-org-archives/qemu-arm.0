Received: by 10.25.30.65 with SMTP id e62csp1314299lfe;
        Wed, 25 May 2016 06:30:43 -0700 (PDT)
X-Received: by 10.55.150.5 with SMTP id y5mr3486682qkd.144.1464183043670;
        Wed, 25 May 2016 06:30:43 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r1si7936809qkc.189.2016.05.25.06.30.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 25 May 2016 06:30:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60439 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b5YtX-0001p9-1F
	for alex.bennee@linaro.org; Wed, 25 May 2016 09:30:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56577)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b5YY6-0000wf-Bb
	for qemu-devel@nongnu.org; Wed, 25 May 2016 09:08:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b5YY1-0003Ax-4B
	for qemu-devel@nongnu.org; Wed, 25 May 2016 09:08:33 -0400
Received: from mail-vk0-x230.google.com ([2607:f8b0:400c:c05::230]:33661)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b5YY0-0003An-2M
	for qemu-devel@nongnu.org; Wed, 25 May 2016 09:08:29 -0400
Received: by mail-vk0-x230.google.com with SMTP id r140so63308576vkf.0
	for <qemu-devel@nongnu.org>; Wed, 25 May 2016 06:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vlCIL06LW6pg4dkS8orYGtVOOY30UpmhM65A1GxLS0Q=;
	b=Gabej5J48zdTjQBeZuldZ+eeqfP8FCu3yGhzctX9tsbd5suGknoamV8wmLbH1s+GV/
	Voh1KjzgHpJfamPySV6thhZ3mB6pgrnjzcV4Ja+mKj7lw1N6ptNeuEkOs2OTrsnDRjD0
	SdV5kDpeNB3Sde1VhZbTqt6n5l/Gz0yqL6qec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vlCIL06LW6pg4dkS8orYGtVOOY30UpmhM65A1GxLS0Q=;
	b=DKRxAGHs33GhDYoxmjTqzeeVxCvHMxVJjB9oLcIp7Sq2l7exhr06C3jdywjE1xAw8v
	/hH2xgHU1Z8UVdETCrEF0i8YBPURVaBECzZIOiQho7ZwAPvxpp+a5RVUsn+KNjtCEohA
	VAIPXFOllF/TkQd1UM6zZOTKNnZfAajc+55FsBdDrFd1bAY45EH81Gh/KCQNyAUQbrLg
	NEBR8pFwKZP607rNDUi3iGYzypYv+u2xWJCGVYmgFjzIM4AuBrPlAW96aje8pNtzRIQk
	cusoIppLqE0tUyH7eTYYYBp0eOWqT9ouLqgNyDoHVkWfXYgPD9SKrSFu0hqUk+Xz8LK1
	h/Bw==
X-Gm-Message-State: ALyK8tJQ3O8GQJHnVVK9TY8XfqVDJya7d85djAb7U0NYwbjLulY+pBN2YyYfAF+l9XOOKLLJ8HiEpBZWh3KzvcTr
X-Received: by 10.176.2.120 with SMTP id 111mr1971517uas.107.1464181707472;
	Wed, 25 May 2016 06:08:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.69.66 with HTTP; Wed, 25 May 2016 06:08:08 -0700 (PDT)
In-Reply-To: <1464173896-4088-2-git-send-email-zxq_yx_007@163.com>
References: <1464173896-4088-1-git-send-email-zxq_yx_007@163.com>
	<1464173896-4088-2-git-send-email-zxq_yx_007@163.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 25 May 2016 14:08:08 +0100
Message-ID: <CAFEAcA8oEjC0wUudEpKKmtbk86eB87KOh-__QB+GrcW6LFy5uA@mail.gmail.com>
To: xiaoqiang zhao <zxq_yx_007@163.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::230
Subject: Re: [Qemu-devel] [PATCH 1/6] hw/char: QOM'ify pl011 model
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
Cc: Rob Herring <robh@kernel.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Markus Armbruster <armbru@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?B?0JDQvdGC0L7QvSDQn9Cw0LLQu9C+0LI=?= <antonynpavlov@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mfuCKJ9scibR

On 25 May 2016 at 11:58, xiaoqiang zhao <zxq_yx_007@163.com> wrote:
> * drop qemu_char_get_next_serial and use chardev prop
> * add pl011_create wrapper function to create pl011 uart device
> * change affected board code to use the new way
>
> Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
> ---
>  hw/arm/bcm2835_peripherals.c | 16 +++-----------
>  hw/arm/highbank.c            |  3 ++-
>  hw/arm/integratorcp.c        |  5 +++--
>  hw/arm/realview.c            |  9 ++++----
>  hw/arm/stellaris.c           |  6 +++--
>  hw/arm/versatilepb.c         |  9 ++++----
>  hw/arm/vexpress.c            |  9 ++++----
>  hw/arm/virt.c                |  1 +
>  hw/char/pl011.c              | 11 +++++-----
>  include/hw/char/pl011.h      | 52 ++++++++++++++++++++++++++++++++++++++++++++
>  10 files changed, 86 insertions(+), 35 deletions(-)
>  create mode 100644 include/hw/char/pl011.h
>
> diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
> index 234d518..46c320f 100644
> --- a/hw/arm/bcm2835_peripherals.c
> +++ b/hw/arm/bcm2835_peripherals.c
> @@ -14,6 +14,7 @@
>  #include "hw/misc/bcm2835_mbox_defs.h"
>  #include "hw/arm/raspi_platform.h"
>  #include "sysemu/char.h"
> +#include "sysemu/sysemu.h"
>
>  /* Peripheral base address on the VC (GPU) system bus */
>  #define BCM2835_VC_PERI_BASE 0x7e000000
> @@ -106,7 +107,6 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
>      MemoryRegion *ram;
>      Error *err = NULL;
>      uint32_t ram_size, vcram_size;
> -    CharDriverState *chr;
>      int n;
>
>      obj = object_property_get_link(OBJECT(dev), "ram", &err);
> @@ -147,6 +147,7 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
>      sysbus_pass_irq(SYS_BUS_DEVICE(s), SYS_BUS_DEVICE(&s->ic));
>
>      /* UART0 */
> +    qdev_prop_set_chr(DEVICE(&s->uart0), "chardev", serial_hds[0]);
>      object_property_set_bool(OBJECT(s->uart0), true, "realized", &err);
>      if (err) {
>          error_propagate(errp, err);
> @@ -158,17 +159,8 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
>      sysbus_connect_irq(s->uart0, 0,
>          qdev_get_gpio_in_named(DEVICE(&s->ic), BCM2835_IC_GPU_IRQ,
>                                 INTERRUPT_UART));
> -
>      /* AUX / UART1 */
> -    /* TODO: don't call qemu_char_get_next_serial() here, instead set
> -     * chardev properties for each uart at the board level, once pl011
> -     * (uart0) has been updated to avoid qemu_char_get_next_serial()
> -     */

This comment says this should be fixed by having board-level
properties; you've removed it but this patch isn't adding
the properties to this (SoC-level) device. I think the board
level should be looking at serial_hds[], not this code.

> @@ -310,8 +312,7 @@ static void pl011_class_init(ObjectClass *oc, void *data)
>
>      dc->realize = pl011_realize;
>      dc->vmsd = &vmstate_pl011;
> -    /* Reason: realize() method uses qemu_char_get_next_serial() */
> -    dc->cannot_instantiate_with_device_add_yet = true;

Why does instantiating with device_add work now? There's
still no way to wire up interrupt lines or map mmio regions.
(This has never made much sense to me -- Markus?)

thanks
-- PMM
