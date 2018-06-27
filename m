Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp6008521wrq;
        Wed, 27 Jun 2018 02:53:29 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdo74B7I7PvAjRHoAWcZfydv7zWk5QairmgDx5orUFCDywyIHsb0uzhIjrgjJv0jAE2LG4L
X-Received: by 2002:a37:9605:: with SMTP id y5-v6mr4304577qkd.236.1530093209865;
        Wed, 27 Jun 2018 02:53:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530093209; cv=none;
        d=google.com; s=arc-20160816;
        b=lBLwEN3H3Te1fdwydqY0I7i8Gc6OzewoAr2mhN6KvMJ2qWCih/jwd2olc338yA0nBw
         IP1L7Rvbj5Wu0Cu8zxEDirDbClZ0pp/tXWi3U8J3agg6SLHxTotmff7EnVdRxStUadLQ
         fgRuHz6HYojLD01vd9hV90/GqIexR9wpqOUmwRzPeDpgT60e27XBWi6aBANDUjmMTud0
         TOGBM6eVHAi+RBX3MwqXaiHs2LWUiyQX/WMrNa38K0jkDcEJxOr8ri1kDXFiRLwBMtTO
         8j6EumVxL2kZuzeDFcJjQebpTDEO0cSj2i+uk3YT7aRUyG2EXmTVJ5Msce2pN8+qg/yo
         ++cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=ehMHh+qHZ7/pf6v6Ndjfhg4E/iDwG4dkGrCyVSDUNRY=;
        b=Pt6ZR71qAeZGOTUkHy80OrQTrWqWuR2cK5nDyrlRpOWRrNZzySYbEFF1rKdOPLiCct
         MzSU+M/LAgWJAh++F/pAn0jw1iAHWjpLMZroPJe2YBptt/kMwKrTRYhm+qANHwlI45l2
         /RFKb5XbfhvsZbGCofKXb4M+YTfLMuvh4eoA4HIwYe21GZkVMh87QZS4Ao8yICgKKJ3C
         3dnQNuZO5jZef56IcHS1tOp3F4h/3Kzn5elFaDxFdjKT0ovnP5EybzA5H/S4S/sZOB//
         7qge6W13MD7PEGDuedll/jlQbaYVjYGOFxctPRwe4MQS+fqptjoDp2AimuYjdmNwYZqO
         hymA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=DgQDQLyq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g10-v6si334225qvo.110.2018.06.27.02.53.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 27 Jun 2018 02:53:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=DgQDQLyq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:57683 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fY78j-0002wo-E5
	for alex.bennee@linaro.org; Wed, 27 Jun 2018 05:53:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59666)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1fY78P-0002wX-96
	for qemu-devel@nongnu.org; Wed, 27 Jun 2018 05:53:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1fY78M-0003lk-0b
	for qemu-devel@nongnu.org; Wed, 27 Jun 2018 05:53:09 -0400
Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241]:37508)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1fY78L-0003kQ-K6; Wed, 27 Jun 2018 05:53:05 -0400
Received: by mail-wm0-x241.google.com with SMTP id n17-v6so4234575wmh.2;
	Wed, 27 Jun 2018 02:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=ehMHh+qHZ7/pf6v6Ndjfhg4E/iDwG4dkGrCyVSDUNRY=;
	b=DgQDQLyq/iNneq6h9YummaCczDDW868kVuJKQHYgvue5syzlAE8P43bbf9edrPTaqo
	jBbtTtHPDTPs6vLoIYjMi3ZGIDvQ1EgHWwT8eWgr2TOgnYsZNpX/i4Vk+Oayh9FHNGky
	zA3jqVbne17t+oSF/x9Kc6UkEv+MhgB/6w1YItuoFVUpqq05zJHijRAMobDAD8G70uiL
	FYmj/knXzS2/TY4aX4/grgHFRsRLgorjhw3AhrTbL5vhGQN0XeEx9QaW/NwXq0n2dtPS
	qp8MCzNKy/r0v2mZFl7zCYPGmolbpvhSml98pgNxGxb7tIGPl+K9bcx3DepkqpM15r15
	Ofvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=ehMHh+qHZ7/pf6v6Ndjfhg4E/iDwG4dkGrCyVSDUNRY=;
	b=AVQr2WzUz8FEJHWrKisD1KvTR+pEgvL/e6SIMs1ijGEl0wORrpxnlM09S+iBq3SqUL
	/zDH1cJrM/gSCo0zMkhP+xUD7Pljcly624FJBSJ1U3yITAGkcIMH6mjxa1inT+vdXKIK
	pqVMUH9dx3nI5NfTUTG+YZgMxwRUHGKXsO3QW239KrydA7ssHm5HtkfK9lCRZcACGaik
	Dc9DsqokR2YFDTXU0yGbXGEzd8chZHN9l4/kUn/gcI6ZZrsrQPSo8fzb5T9yoFjsy0Vh
	mZP3m0o8hM0jXWa0KlP6SHYph20vBudxD76E6iJqpDYLcmz+ZsbAdiHC+iACB93a4wE8
	dv0g==
X-Gm-Message-State: APt69E33ou3ArLXXkcW47ft5ypaERwLhKOVTqK2jgicgywC6v2Zoq2WX
	eI09BBaQ0IYgqn4xuRDLbFw=
X-Received: by 2002:a1c:1808:: with SMTP id 8-v6mr4705521wmy.113.1530093184468;
	Wed, 27 Jun 2018 02:53:04 -0700 (PDT)
Received: from localhost ([51.15.41.238]) by smtp.gmail.com with ESMTPSA id
	l67-v6sm5741427wmb.22.2018.06.27.02.53.02
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 27 Jun 2018 02:53:03 -0700 (PDT)
Date: Wed, 27 Jun 2018 10:53:02 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Steffen =?iso-8859-1?Q?G=F6rtz?= <contrib@steffen-goertz.de>
Message-ID: <20180627095302.GD4325@stefanha-x1.localdomain>
References: <20180627073351.856-1-contrib@steffen-goertz.de>
	<20180627073351.856-2-contrib@steffen-goertz.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="J5MfuwkIyy7RmF4Q"
Content-Disposition: inline
In-Reply-To: <20180627073351.856-2-contrib@steffen-goertz.de>
User-Agent: Mutt/1.10.0 (2018-05-17)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::241
Subject: Re: [Qemu-devel] [RFC 1/8] arm: NRF51/Microbit Memory container and
 SOC variants
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Jim Mussared <jim@groklearning.com>, qemu-devel@nongnu.org,
	"open list:ARM" <qemu-arm@nongnu.org>,
	Joel Stanley <joel@jms.id.au>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VpZ2bDC/IxpO


--J5MfuwkIyy7RmF4Q
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 27, 2018 at 09:33:44AM +0200, Steffen G=F6rtz wrote:

This looks like code that can be squashed into to Joel's 'microbit'
machine type series.  Please agree with Joel how to include this in his
upcoming v2 patch series.

There are several things going on here and the patch could be split into
several commits with commit descriptions that explain the rationale,
making it easier to review.  But if Joel is happy to work this into his
code as-is then there's no need to worry about structuring this patch
right now.

> Signed-off-by: Steffen G=F6rtz <contrib@steffen-goertz.de>
> ---
>  hw/arm/microbit.c          |  8 ++--
>  hw/arm/nrf51_soc.c         | 98 +++++++++++++++++++++++++++-----------
>  include/hw/arm/nrf51_soc.h | 24 ++++++++--
>  3 files changed, 95 insertions(+), 35 deletions(-)
>=20
> diff --git a/hw/arm/microbit.c b/hw/arm/microbit.c
> index b61d0747fe..9deb1a36ca 100644
> --- a/hw/arm/microbit.c
> +++ b/hw/arm/microbit.c
> @@ -10,6 +10,7 @@
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
>  #include "hw/boards.h"
> +#include "hw/arm/arm.h"
> =20
>  #include "hw/arm/nrf51_soc.h"
> =20
> @@ -18,10 +19,11 @@ static void microbit_init(MachineState *machine)
>      DeviceState *dev;
> =20
>      dev =3D qdev_create(NULL, TYPE_NRF51_SOC);
> -    if (machine->kernel_filename) {
> -        qdev_prop_set_string(dev, "kernel-filename", machine->kernel_fil=
ename);
> -    }
> +    qdev_prop_set_uint32(DEVICE(dev), "VARIANT", NRF51_VARIANT_AA);
>      object_property_set_bool(OBJECT(dev), true, "realized", &error_fatal=
);
> +
> +    armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename,
> +            0x00000000);
>  }
> =20
>  static void microbit_machine_init(MachineClass *mc)
> diff --git a/hw/arm/nrf51_soc.c b/hw/arm/nrf51_soc.c
> index b9f309aa6b..1f7c159edf 100644
> --- a/hw/arm/nrf51_soc.c
> +++ b/hw/arm/nrf51_soc.c
> @@ -22,23 +22,33 @@
>  #include "crypto/random.h"
> =20
>  #include "hw/arm/nrf51_soc.h"
> -#include "hw/char/nrf51_uart.h"
> =20
>  #define IOMEM_BASE      0x40000000
>  #define IOMEM_SIZE      0x20000000
> =20
>  #define FLASH_BASE      0x00000000
> -#define FLASH_SIZE      (256 * 1024)
> =20
>  #define FICR_BASE       0x10000000
>  #define FICR_SIZE       0x100
> =20
>  #define SRAM_BASE       0x20000000
> -#define SRAM_SIZE       (16 * 1024)
> =20
>  #define UART_BASE       0x40002000
>  #define UART_SIZE       0x1000
> =20
> +#define PAGE_SIZE       0x0400
> +
> +
> +struct {
> +  hwaddr ram_size;
> +  hwaddr flash_size;
> +} NRF51VariantAttributes[] =3D {
> +        {.ram_size =3D 16, .flash_size =3D 256 },
> +        {.ram_size =3D 16, .flash_size =3D 128 },
> +        {.ram_size =3D 32, .flash_size =3D 256 },
> +};
> +
> +
>  static uint64_t clock_read(void *opaque, hwaddr addr, unsigned int size)
>  {
>      qemu_log_mask(LOG_UNIMP, "%s: 0x%" HWADDR_PRIx " [%u]\n", __func__, =
addr, size);
> @@ -101,62 +111,93 @@ static const MemoryRegionOps rng_ops =3D {
>      .write =3D rng_write
>  };
> =20
> +static void nrf51_soc_init(Object *obj)
> +{
> +    NRF51State *s =3D NRF51_SOC(obj);
> +
> +    memory_region_init(&s->container, obj, "microbit-container",
> +            UINT64_MAX);
> +
> +    /* TODO: Change to armv6m when cortex-m0 core is available */
> +    object_initialize(&s->armv7m, sizeof(s->armv7m), TYPE_ARMV7M);
> +    object_property_add_child(obj, "armv7m", OBJECT(&s->armv7m), &error_=
abort);
> +    qdev_set_parent_bus(DEVICE(&s->armv7m), sysbus_get_default());
> +    qdev_prop_set_string(DEVICE(&s->armv7m), "cpu-type",
> +                         ARM_CPU_TYPE_NAME("cortex-m3"));
> +
> +    object_initialize(&s->uart, sizeof(s->uart), TYPE_NRF51_UART);
> +    object_property_add_child(obj, "uart", OBJECT(&s->uart), &error_abor=
t);
> +    qdev_set_parent_bus(DEVICE(&s->uart), sysbus_get_default());
> +}
> +
> =20
>  static void nrf51_soc_realize(DeviceState *dev_soc, Error **errp)
>  {
>      NRF51State *s =3D NRF51_SOC(dev_soc);
>      Error *err =3D NULL;
> =20
> -    /* IO space */
> -    create_unimplemented_device("nrf51_soc.io", IOMEM_BASE, IOMEM_SIZE);
> -
> -    /* FICR */
> -    create_unimplemented_device("nrf51_soc.ficr", FICR_BASE, FICR_SIZE);
> +    if (!(s->part_variant > NRF51_VARIANT_INVALID
> +            && s->part_variant < NRF51_VARIANT_MAX)) {
> +        error_setg(errp, "VARIANT not set or invalid");
> +        return;
> +    }
> =20
> -    MemoryRegion *system_memory =3D get_system_memory();
> -    MemoryRegion *sram =3D g_new(MemoryRegion, 1);
> -    MemoryRegion *flash =3D g_new(MemoryRegion, 1);
> +    memory_region_init_ram(&s->sram, NULL, "nrf51_soc.sram",
> +            NRF51VariantAttributes[s->part_variant].ram_size * PAGE_SIZE=
, &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +    memory_region_add_subregion(&s->container, SRAM_BASE, &s->sram);
> =20
> -    memory_region_init_ram_nomigrate(flash, NULL, "nrf51.flash", FLASH_S=
IZE,
> +    memory_region_init_ram(&s->flash, NULL, "nrf51_soc.flash",
> +            NRF51VariantAttributes[s->part_variant].flash_size * PAGE_SI=
ZE,
>              &err);
>      if (err) {
>          error_propagate(errp, err);
>          return;
>      }
> +    memory_region_add_subregion(&s->container, FLASH_BASE, &s->flash);
> =20
> -    vmstate_register_ram_global(flash);
> -    memory_region_set_readonly(flash, true);
> +    qdev_prop_set_uint32(DEVICE(&s->armv7m), "num-irq", 60);
> +    object_property_set_link(OBJECT(&s->armv7m), OBJECT(&s->container),
> +                                         "memory", &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> =20
> -    memory_region_add_subregion(system_memory, FLASH_BASE, flash);
> =20
> -    memory_region_init_ram_nomigrate(sram, NULL, "nrf51.sram", SRAM_SIZE,
> -            &err);
> +    object_property_set_bool(OBJECT(&s->armv7m), true, "realized", &err);
>      if (err) {
>          error_propagate(errp, err);
>          return;
>      }
> -    vmstate_register_ram_global(sram);
> -    memory_region_add_subregion(system_memory, SRAM_BASE, sram);
> =20
> -    /* TODO: implement a cortex m0 and update this */
> -    s->nvic =3D armv7m_init(get_system_memory(), FLASH_SIZE, 96,
> -               s->kernel_filename, ARM_CPU_TYPE_NAME("cortex-m3"));
> +    /* IO space */
> +    create_unimplemented_device("nrf51_soc.io", IOMEM_BASE, IOMEM_SIZE);
> +
> +    /* FICR */
> +    create_unimplemented_device("nrf51_soc.ficr", FICR_BASE, FICR_SIZE);
> =20
> -    s->uart =3D nrf51_uart_create(UART_BASE, qdev_get_gpio_in(s->nvic, 2=
),
> -                                serial_hd(0));
> +    qdev_prop_set_chr(DEVICE(&s->uart), "chardev", serial_hd(0));
> +    qdev_init_nofail(DEVICE(&s->uart));
> +/*    sysbus_mmio_map(s, 0, UART_BASE);
> +    sysbus_connect_irq(s, 0, qdev_get_gpio_in(s->nvic, 2)); */
> =20
>      memory_region_init_io(&s->clock, NULL, &clock_ops, NULL, "nrf51_soc.=
clock", 0x1000);
> -    memory_region_add_subregion_overlap(get_system_memory(), IOMEM_BASE,=
 &s->clock, -1);
> +    memory_region_add_subregion_overlap(&s->container, IOMEM_BASE, &s->c=
lock, -1);
> =20
>      memory_region_init_io(&s->nvmc, NULL, &nvmc_ops, NULL, "nrf51_soc.nv=
mc", 0x1000);
> -    memory_region_add_subregion_overlap(get_system_memory(), 0x4001E000,=
 &s->nvmc, -1);
> +    memory_region_add_subregion_overlap(&s->container, 0x4001E000, &s->n=
vmc, -1);
> =20
>      memory_region_init_io(&s->rng, NULL, &rng_ops, NULL, "nrf51_soc.rng"=
, 0x1000);
> -    memory_region_add_subregion_overlap(get_system_memory(), 0x4000D000,=
 &s->rng, -1);
> +    memory_region_add_subregion_overlap(&s->container, 0x4000D000, &s->r=
ng, -1);
>  }
> =20
>  static Property nrf51_soc_properties[] =3D {
> -    DEFINE_PROP_STRING("kernel-filename", NRF51State, kernel_filename),
> +    DEFINE_PROP_INT32("VARIANT", NRF51State, part_variant,
> +            NRF51_VARIANT_INVALID),
>      DEFINE_PROP_END_OF_LIST(),
>  };
> =20
> @@ -172,6 +213,7 @@ static const TypeInfo nrf51_soc_info =3D {
>      .name          =3D TYPE_NRF51_SOC,
>      .parent        =3D TYPE_SYS_BUS_DEVICE,
>      .instance_size =3D sizeof(NRF51State),
> +    .instance_init =3D nrf51_soc_init,
>      .class_init    =3D nrf51_soc_class_init,
>  };
> =20
> diff --git a/include/hw/arm/nrf51_soc.h b/include/hw/arm/nrf51_soc.h
> index f81cbbe3ce..c9af9659e9 100644
> --- a/include/hw/arm/nrf51_soc.h
> +++ b/include/hw/arm/nrf51_soc.h
> @@ -12,6 +12,8 @@
> =20
>  #include "qemu/osdep.h"
>  #include "hw/sysbus.h"
> +#include "hw/arm/armv7m.h"
> +#include "hw/char/nrf51_uart.h"
> =20
>  #define TYPE_NRF51_SOC "nrf51-soc"
>  #define NRF51_SOC(obj) \
> @@ -22,16 +24,30 @@ typedef struct NRF51State {
>      SysBusDevice parent_obj;
> =20
>      /*< public >*/
> -    char *kernel_filename;
> -    DeviceState *nvic;
> -    DeviceState *uart;
> +    /* TODO: Change to armv6m when cortex-m0 core is available */
> +    ARMv7MState armv7m;
> =20
> -    MemoryRegion iomem;
> +    Nrf51UART uart;
> =20
> +    MemoryRegion container;
> +    MemoryRegion sram;
> +    MemoryRegion flash;
> +    MemoryRegion iomem;
>      MemoryRegion clock;
>      MemoryRegion nvmc;
>      MemoryRegion rng;
> +
> +    /* Properties */
> +    int32_t part_variant;
>  } NRF51State;
> =20
> +typedef enum {
> +    NRF51_VARIANT_INVALID =3D -1,
> +    NRF51_VARIANT_AA =3D 0,
> +    NRF51_VARIANT_AB =3D 1,
> +    NRF51_VARIANT_AC =3D 2,
> +    NRF51_VARIANT_MAX =3D 3
> +} NRF51Variants;
> +
>  #endif
> =20
> --=20
> 2.17.1
>=20

--J5MfuwkIyy7RmF4Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJbM15+AAoJEJykq7OBq3PILDAH/i3Mwa5p9yUeiydb0BgT6tX8
wB6YwBIa6sbWGSq5PMv45HQccpCud0wQEojZKtl0Ow1a3G9IkI0Vl5R64+OgYYpH
G69VAezh5hN3JZNkJ5YhmAtotBv21ayDPL/yfqwT7c+feQGmjIVNcAOAySZ1YeL/
raZ7AtTL82LiyXeflgq5UBO9Q6VR+sWuCIaFjMP4o/mGIuA0yg/lF7H0tiEmtwep
Tnii6pdqGWIpU50Jhu2TNSWDQhvan6XoROLUM+SN/+Ws8X6cPJaq+2YAztwjUTmz
JlwNUl0SPxBle9AFnEXqfCkRzMnvDGzDuShh93pnWftjhkGIy1kuy7nah2NBgiE=
=3KbQ
-----END PGP SIGNATURE-----

--J5MfuwkIyy7RmF4Q--
