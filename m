Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp2030682wru;
        Thu, 16 Aug 2018 09:14:17 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPyhOuZJ2A55cRKiLjOYvVDhJbH1aI19RhnkAVNg5kdOgi3L51XGzhkB5/fkWMJ3wW9T5exr
X-Received: by 2002:a37:9904:: with SMTP id b4-v6mr18084779qke.102.1534436057688;
        Thu, 16 Aug 2018 09:14:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534436057; cv=none;
        d=google.com; s=arc-20160816;
        b=P758S0UZdc6v/rz9DoeV411ur5uyYPOVmPigcFgQBqvp90AqUE7yNy9Jg4s1dXGId6
         KaOgAPAXPKqCdyv+lr6KAKPdujp0LQmIPJ59WHKtVynduRAxScqRYUXvpszLIStaYsI2
         46B3uB/KHC3Ra95Oaxre6jnqaHcau2+06x2uvwOjZNQ+0rdrFBL1CW5ANL289N/uV86D
         6J/27rHrx5XIcBi6u7YpYIpxK6lHVGXG4rSrFIadnQlvwmIVOtuNnHOWA1xFzjTo048W
         w0HGmYx26jvef754YSedjca7MN9BQ+DhdkUhT4LUquLLVHgJW8Zfv609HD0ofDiVU0oZ
         t0PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=2xdvu3xz1pvwW2t3m04PXNALa1sLoPDvNpfCC6vW5c0=;
        b=PARZlwA0aZBlaZSJpx0YMIsi0QqcmiInYMSMBml3yo2zh2Lz7/PfZ8g/BKB/fD5pJm
         UoQ/NaPJAuTD8FPbSmD2oOPAy0A0tVAPJv3RmuDhZlGoPebZbsBq61H4Q2lmGENVDp4X
         e4opy0zLAcjTwM+vBmd15pY/mIik83m0tgVGg6imrl6WOD1xwh6wZLn5nliLfoxuWVMX
         WF022exzJPLIATTIdenYi2NKHmgnHPejDNQ1E3SScOtB06bptOwcljXHHXibjg9L4nul
         YEXm640E1DCwrElMDIfhd+xA6CdXIv/VeMp8YvSUb9VhhHaiY7WDlcL2s+Uz7hkHHdhC
         kThQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=M4EO004N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g82-v6si1258470qkh.11.2018.08.16.09.14.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 16 Aug 2018 09:14:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=M4EO004N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56645 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fqKue-0001tB-UZ
	for alex.bennee@linaro.org; Thu, 16 Aug 2018 12:14:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34344)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fqK47-00056D-Ei
	for qemu-arm@nongnu.org; Thu, 16 Aug 2018 11:20:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fqK45-00032R-Fn
	for qemu-arm@nongnu.org; Thu, 16 Aug 2018 11:19:59 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:42020)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fqK42-00030A-OW
	for qemu-arm@nongnu.org; Thu, 16 Aug 2018 11:19:57 -0400
Received: by mail-oi0-x241.google.com with SMTP id b16-v6so8652395oic.9
	for <qemu-arm@nongnu.org>; Thu, 16 Aug 2018 08:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=2xdvu3xz1pvwW2t3m04PXNALa1sLoPDvNpfCC6vW5c0=;
	b=M4EO004NhJnlCQb9Kj1FBchQGPGKjsO1hyGo7GX2CKWzsTjPpnVBVCCBirWmv31GyM
	BjHQRMlW+E0viG2u+iul8qbOPrHyjCjU9BSjJpEn+i9GgOyKg+GzJr+CXmwU6aRs/Jpa
	AV9SPjU4q/tTymgbC7QRPF0DuXiesG/BHp0ow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=2xdvu3xz1pvwW2t3m04PXNALa1sLoPDvNpfCC6vW5c0=;
	b=IGY94wsUZS11fV1phjiA5U4WONl7ptbYl1EKsCmT+QVbuHHNsN9UDxuhpsjSupJib/
	MrKMIqZ/s9Qa+WFgKQXZZGOwDKjxGnUNqa0K/9eQ67U2usyXgaDFA2cdH7b+t5/0dJ0C
	1gt8Oxh4cZNDHZVlYxaqIMC7K+1QDxEZwHg+904omwKnuKwSqo7Ju4zSe5ycoMAwYtfD
	eJI7C2hnXDKmsg9na6X5z+eKHQmK//Te3NUAy2qdLRyuLQRgmLaS9meVceYW5jDSP+77
	1yUZGQQslDteoMPWFWeFw7Zs7TmshZJBiiZbbThp5deBVcT8o3EKh0AJkFbODz/Jd0/T
	ICGg==
X-Gm-Message-State: AOUpUlGgI+kwTHQwsNBM06HG/AbMyAwIVjhcrpH6xu7gqYZ/+3uaHtt0
	4+ySow5mh4PlXcqZ8V4BT6OudNkxLSMS4jQUQTFudw==
X-Received: by 2002:aca:401:: with SMTP id 1-v6mr34391564oie.28.1534432791833; 
	Thu, 16 Aug 2018 08:19:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Thu, 16 Aug 2018 08:19:31
	-0700 (PDT)
In-Reply-To: <20180811090836.4024-7-contrib@steffen-goertz.de>
References: <20180811090836.4024-1-contrib@steffen-goertz.de>
	<20180811090836.4024-7-contrib@steffen-goertz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Aug 2018 16:19:31 +0100
Message-ID: <CAFEAcA_=8r_X_rLfwJovEkusBb6hmaG5Ns8YQxQMLL4z0KpHXw@mail.gmail.com>
To: =?UTF-8?Q?Steffen_G=C3=B6rtz?= <contrib@steffen-goertz.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-arm] [PATCH 6/7] arm: Instantiate nRF51 peripherals
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
Cc: Jim Mussared <jim@groklearning.com>, Stefan Hajnoczi <stefanha@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
	Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mYjzWM8SFmFw

On 11 August 2018 at 10:08, Steffen G=C3=B6rtz <contrib@steffen-goertz.de> =
wrote:
> Instantiate NVMs, NVMC, UART, RNG, GPIO and TIMERs.
>
> Signed-off-by: Steffen G=C3=B6rtz <contrib@steffen-goertz.de>
> ---
>  hw/arm/nrf51_soc.c         | 153 +++++++++++++++++++++++++++++++++++--
>  include/hw/arm/nrf51_soc.h |  16 +++-
>  2 files changed, 161 insertions(+), 8 deletions(-)
>
> diff --git a/hw/arm/nrf51_soc.c b/hw/arm/nrf51_soc.c
> index 88a848de8b..a395d3a00d 100644
> --- a/hw/arm/nrf51_soc.c
> +++ b/hw/arm/nrf51_soc.c
> @@ -25,15 +25,20 @@
>
>  #include "hw/arm/nrf51_soc.h"
>
> -#define IOMEM_BASE      0x40000000
> -#define IOMEM_SIZE      0x20000000
> -
> -#define FICR_BASE       0x10000000
> -#define FICR_SIZE       0x000000fc
> -
>  #define FLASH_BASE      0x00000000
> +#define FICR_BASE       0x10000000
> +#define UICR_BASE       0x10001000
>  #define SRAM_BASE       0x20000000
>
> +#define IOMEM_BASE      0x40000000
> +#define IOMEM_SIZE      0x20000000
> +
> +#define UART_BASE       0x40002000
> +#define TIMER_BASE      0x40008000
> +#define RNG_BASE        0x4000D000
> +#define NVMC_BASE       0x4001E000
> +#define GPIO_BASE       0x50000000
> +
>  #define PAGE_SIZE       1024
>
>  /* IRQ lines can be derived from peripheral base addresses */
> @@ -49,10 +54,33 @@ struct {
>          [NRF51_VARIANT_AC] =3D {.ram_size =3D 32, .flash_size =3D 256 },
>  };
>
> +
> +static uint64_t clock_read(void *opaque, hwaddr addr, unsigned int size)
> +{
> +    qemu_log_mask(LOG_UNIMP, "%s: 0x%" HWADDR_PRIx " [%u]\n",
> +                  __func__, addr, size);
> +    return 1;
> +}
> +
> +static void clock_write(void *opaque, hwaddr addr, uint64_t data,
> +                        unsigned int size)
> +{
> +    qemu_log_mask(LOG_UNIMP, "%s: 0x%" HWADDR_PRIx " <- 0x%" PRIx64 " [%=
u]\n",
> +                  __func__, addr, data, size);
> +}
> +
> +static const MemoryRegionOps clock_ops =3D {
> +    .read =3D clock_read,
> +    .write =3D clock_write
> +};

You don't need to roll your own "do nothing but log" device:
you can use the TYPE_UNIMPLEMENTED_DEVICE to do this.

>  static void nrf51_soc_realize(DeviceState *dev_soc, Error **errp)
>  {
>      NRF51State *s =3D NRF51_SOC(dev_soc);
>      Error *err =3D NULL;
> +    MemoryRegion *mr =3D NULL;
> +    size_t i;
> +    qemu_irq irq;
>
>      if (!s->board_memory) {
>          error_setg(errp, "memory property was not set");
> @@ -100,14 +128,102 @@ static void nrf51_soc_realize(DeviceState *dev_soc=
, Error **errp)
>      }
>      memory_region_add_subregion(&s->container, SRAM_BASE, &s->sram);
>
> +
> +    /* UART */
> +    qdev_prop_set_chr(DEVICE(&s->uart), "chardev", serial_hd(0));
> +    object_property_set_bool(OBJECT(&s->uart), true, "realized", &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +
> +    mr =3D sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->uart), 0);
> +    memory_region_add_subregion_overlap(&s->container, UART_BASE, mr, 0)=
;
> +    irq =3D qdev_get_gpio_in(DEVICE(&s->cpu), BASE_TO_IRQ(UART_BASE));
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->uart), 0, irq);

Usual approach is
   sysbus_connect_irq(SYS_BUS_DEVICE(&s->uart), 0,
                      qdev_get_gpio_in(DEVICE(&s->cpu),
                                       BASE_TO_IRQ(UART_BASE));

rather than a local qemu_irq (which tends to look like the SoC itself
has an irq line floating around, rather than just doing plumbing).

> +
> +    /* TIMER */
> +    for (i =3D 0; i < NRF51_TIMER_NUM; i++) {
> +        object_property_set_bool(OBJECT(&s->timer[i]), true, "realized",=
 &err);
> +        if (err) {
> +            error_propagate(errp, err);
> +            return;
> +        }
> +
> +        sysbus_mmio_map(SYS_BUS_DEVICE(&s->timer[i]), 0,
> +                     TIMER_BASE + i * 0x1000);
> +
> +        irq =3D qdev_get_gpio_in(DEVICE(&s->cpu),
> +                               BASE_TO_IRQ(TIMER_BASE + i * 0x1000));

Put the timer_base in a local rather than recalculating the expression
for sysbus_mmio_map() and BASE_TO_IRQ().

> +        sysbus_connect_irq(SYS_BUS_DEVICE(&s->timer[i]), 0, irq);
> +    }
> +
> +    /* NVMC */
> +    object_property_set_link(OBJECT(&s->nvm), OBJECT(&s->container),
> +                                         "memory", &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +    object_property_set_uint(OBJECT(&s->nvm),
> +            NRF51VariantAttributes[s->part_variant].flash_size, "code_si=
ze",
> +            &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +    object_property_set_bool(OBJECT(&s->nvm), true, "realized", &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +
> +    mr =3D sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->nvm), 0);
> +    memory_region_add_subregion_overlap(&s->container, NVMC_BASE, mr, 0)=
;
> +    mr =3D sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->nvm), 1);
> +    memory_region_add_subregion_overlap(&s->container, FICR_BASE, mr, 0)=
;
> +    mr =3D sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->nvm), 2);
> +    memory_region_add_subregion_overlap(&s->container, UICR_BASE, mr, 0)=
;
> +
> +    /* RNG */
> +    object_property_set_bool(OBJECT(&s->rng), true, "realized", &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +
> +    mr =3D sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->rng), 0);
> +    memory_region_add_subregion_overlap(&s->container, RNG_BASE, mr, 0);
> +    irq =3D qdev_get_gpio_in(DEVICE(&s->cpu), BASE_TO_IRQ(RNG_BASE));
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->rng), 0, irq);
> +
> +    /* GPIO */
> +    object_property_set_bool(OBJECT(&s->gpio), true, "realized", &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +
> +    mr =3D sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->gpio), 0);
> +    memory_region_add_subregion_overlap(&s->container, GPIO_BASE, mr, 0)=
;
> +
> +    /* Pass all GPIOs to the SOC layer so they are available to the boar=
d */
> +    qdev_pass_gpios(DEVICE(&s->gpio), dev_soc, NULL);

Consider making these named GPIO lines rather than unnamed ones?
Unnamed is clear enough for the GPIO device itself but a bit odd
on the SoC device.

> +
> +    /* STUB Peripherals */
> +    memory_region_init_io(&s->clock, NULL, &clock_ops, NULL,
> +                          "nrf51_soc.clock", 0x1000);
> +    memory_region_add_subregion_overlap(&s->container, IOMEM_BASE, &s->c=
lock,
> +                                        -1);
> +
>      create_unimplemented_device("nrf51_soc.io", IOMEM_BASE, IOMEM_SIZE);
> -    create_unimplemented_device("nrf51_soc.ficr", FICR_BASE, FICR_SIZE);
>      create_unimplemented_device("nrf51_soc.private", 0xF0000000, 0x10000=
000);
>  }
>
>  static void nrf51_soc_init(Object *obj)
>  {
>      NRF51State *s =3D NRF51_SOC(obj);
> +    size_t i;
>
>      memory_region_init(&s->container, obj, "nrf51-container", UINT64_MAX=
);
>
> @@ -118,6 +234,29 @@ static void nrf51_soc_init(Object *obj)
>      qdev_prop_set_string(DEVICE(&s->cpu), "cpu-type",
>                           ARM_CPU_TYPE_NAME("cortex-m0"));
>      qdev_prop_set_uint32(DEVICE(&s->cpu), "num-irq", 32);
> +
> +    object_initialize(&s->uart, sizeof(s->uart), TYPE_NRF51_UART);
> +    object_property_add_child(obj, "uart", OBJECT(&s->uart), &error_abor=
t);
> +    qdev_set_parent_bus(DEVICE(&s->uart), sysbus_get_default());

These should be using sys_bus_init_child_obj() (which probably didn't
exist when you wrote this code).

> +
> +    object_initialize(&s->nvm, sizeof(s->nvm), TYPE_NRF51_NVM);
> +    object_property_add_child(obj, "nvm", OBJECT(&s->nvm), &error_abort)=
;
> +    qdev_set_parent_bus(DEVICE(&s->nvm), sysbus_get_default());
> +
> +    object_initialize(&s->rng, sizeof(s->rng), TYPE_NRF51_RNG);
> +    object_property_add_child(obj, "rng", OBJECT(&s->rng), &error_abort)=
;
> +    qdev_set_parent_bus(DEVICE(&s->rng), sysbus_get_default());
> +
> +    object_initialize(&s->gpio, sizeof(s->gpio), TYPE_NRF51_GPIO);
> +    object_property_add_child(obj, "gpio", OBJECT(&s->gpio), &error_abor=
t);
> +    qdev_set_parent_bus(DEVICE(&s->gpio), sysbus_get_default());
> +
> +    for (i =3D 0; i < NRF51_TIMER_NUM; i++) {
> +        object_initialize(&s->timer[i], sizeof(s->timer[i]), TYPE_NRF51_=
TIMER);
> +        object_property_add_child(obj, "timer[*]", OBJECT(&s->timer[i]),=
 NULL);
> +        qdev_set_parent_bus(DEVICE(&s->timer[i]), sysbus_get_default());
> +    }
> +
>  }
>
>  static Property nrf51_soc_properties[] =3D {
> diff --git a/include/hw/arm/nrf51_soc.h b/include/hw/arm/nrf51_soc.h
> index 45d9671dc3..d47b42fa37 100644
> --- a/include/hw/arm/nrf51_soc.h
> +++ b/include/hw/arm/nrf51_soc.h
> @@ -14,11 +14,18 @@
>  #include "qemu/osdep.h"
>  #include "hw/sysbus.h"
>  #include "hw/arm/armv7m.h"
> +#include "hw/char/nrf51_uart.h"
> +#include "hw/misc/nrf51_rng.h"
> +#include "hw/nvram/nrf51_nvm.h"
> +#include "hw/gpio/nrf51_gpio.h"
> +#include "hw/timer/nrf51_timer.h"
>
>  #define TYPE_NRF51_SOC "nrf51-soc"
>  #define NRF51_SOC(obj) \
>      OBJECT_CHECK(NRF51State, (obj), TYPE_NRF51_SOC)
>
> +#define NRF51_TIMER_NUM 3

NRF51_NUM_TIMERS I think makes the code read a little better.


> +
>  typedef struct NRF51State {
>      /*< private >*/
>      SysBusDevice parent_obj;
> @@ -31,9 +38,16 @@ typedef struct NRF51State {
>      MemoryRegion flash;
>
>      MemoryRegion *board_memory;
> -
>      MemoryRegion container;
>
> +    MemoryRegion clock;
> +
> +    Nrf51UART uart;
> +    Nrf51NVMState nvm;
> +    Nrf51RNGState rng;
> +    Nrf51GPIOState gpio;
> +    Nrf51TimerState timer[NRF51_TIMER_NUM];

Can we be consistent about whether we name the structs
Nrf51Thingy (as here) or NRF51Thingy (as in the NRF51State
struct we're adding them to). NRF51Thingy fits our
conventions better, I think.

> +
>      /* Properties */
>      int32_t part_variant;
>  } NRF51State;
> --
> 2.18.0
>

thanks
-- PMM
