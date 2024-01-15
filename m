Received: by 2002:a17:906:18b1:b0:a2e:1324:ea5c with SMTP id c17csp285452ejf;
        Mon, 15 Jan 2024 06:42:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGjbN/WtS8BhkxVWH8Nfob3hgSv/SIMX7TO0blQpPBjZSBde9pocKc6CwznrBmnEoInrybZ
X-Received: by 2002:a05:620a:260d:b0:783:28e3:b8fe with SMTP id z13-20020a05620a260d00b0078328e3b8femr7958205qko.55.1705329771441;
        Mon, 15 Jan 2024 06:42:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705329771; cv=none;
        d=google.com; s=arc-20160816;
        b=QVsJV3NMdKFNgvhR+NEY1oisIxWy2OH4oD/DfnN2Y7W2fo1m8X26ulLWope8rtdRn9
         gpBVwuC11eZ/IWR2g6glIMC1mEzl7iv6gElDwto5BwuM0MgugidqsIq3j3BHnuN1rMGA
         lbpfAhW7BU4uSTYzT7V3lMuTRVWg8RqWVuBya+2+mCiI7EN5XlMeE3N5vhMytF8dVbmZ
         Q5rPuW2Vja1T6K49vjT+JREDqXMaLUsx9c7PPg9WC8MR1ntEBUi1e6LupU58LSVFMaBp
         Dt+5UCvflhIvpy+p6MdXT0Yj2HyhcMRxli/vACm071kaf2Gy8Rp/YoSoMqWdEXqfcO/o
         Tw6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=jmNL6rvUIVwFe8YplRIts5k2qqn7IcbJ0GnsoDHlyKc=;
        fh=gdBed72JnSifzQdV0PLkUCrNnp2PjbNCgzXbyzmTG1w=;
        b=Mo7snqee+rK3CAKtK9q0I3myM3xPZN/GkQgUT1gqtEdP6qtEDeWy4maq0hGJvYqWLQ
         6A1Tj5zwgboOvyEvrir5U50xEywQ1E3pW0lsbT2pNhxDPGoL8AjQVzYNcVmpUKdR3jUR
         qGDiDxdr68lsMy7BxXeW34UqBkB+MItACjdqMsB2yIZlecr5fiz+EWD8zoaBVsiBc7iQ
         mpJ2x5b2oXlJIL5zfurnGAk7hwGCMIbcK36iIjAKiDhlbpfduGwcbdpNX0uTRTAPlrZr
         y2//ZABnBeL4cK6TAISRlP/CVdQINrSaEg8gE3l1VgFccNMkMOi9Rxva3xb2JJu8UJ/a
         5Omw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cmBl1PsU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o26-20020a05620a229a00b007833cd0673dsi7756169qkh.630.2024.01.15.06.42.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Jan 2024 06:42:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cmBl1PsU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rPOAl-0005EA-5u; Mon, 15 Jan 2024 09:42:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rPOAh-0005Dd-2d
 for qemu-arm@nongnu.org; Mon, 15 Jan 2024 09:42:39 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rPOAf-00055o-4S
 for qemu-arm@nongnu.org; Mon, 15 Jan 2024 09:42:38 -0500
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-555f581aed9so10082769a12.3
 for <qemu-arm@nongnu.org>; Mon, 15 Jan 2024 06:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705329755; x=1705934555; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jmNL6rvUIVwFe8YplRIts5k2qqn7IcbJ0GnsoDHlyKc=;
 b=cmBl1PsU/dAw9JPjLCoFMU4v+RLiRAVY8LxadhXmCOqex6K7+RG+Gp4ORQ0n+Zc9tQ
 yqtF3DIprv7tih2ypfOLY510fcD+ogxnpHi/MID1KvoRKoDLaB63AACMAwAyL3bvvOoQ
 zrxEhao1kTVnlyA2xs1lQ+RRMuNVIuOB3KDeipt0fKvntw67N/FlNc86dDuFDyDaaK4R
 X4OSoPtP1Cx5H2ihZEZV+snkMWmUOYn8S1k9Z4pfkwPeisk9wfJFxmx14Lmf0oH5deKX
 rj5uybOsfNSUbPHlAagwOjqNbCFJQvDgtHtL8GnEyqviH8cIACmmDDLto+sHBgLSPKgo
 uBDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705329755; x=1705934555;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jmNL6rvUIVwFe8YplRIts5k2qqn7IcbJ0GnsoDHlyKc=;
 b=wsAnw4b/uOUunQ2IzEFhzg3HhJqMBQ5S8+P9feuN1mNJ5R45Zv8ZRpOsy1Z1N17j31
 869v8xmno1JYCwyXdLnaW6BJSgpzjB8X/wDYAXs+DE7sZEOzIBeDkgdhPi+SLz1t5N8O
 EM/KRbn7x6rj8sXNVBBY1PfRPVmd6S8s2qCMQ6cm/qbwbGbDxjfETOKPnWDuaCBHfKoW
 MINGsgR17x8TcLuYuIzXPxwkkubk6nOSfe32BziF4nDzLQgyhVnV9FjS+f+VhiBkCOQG
 CkrwE5GaOfEa3n9QPmChru/R7K8/nnegLgFhM+YLGXGkFqOQVZ6lb+ZTgRA8+nHkqU6S
 toGg==
X-Gm-Message-State: AOJu0Yy0DC9USaprSig849LcS2jc8AyXjlX9UIjp0KIEJcuStKqhgYql
 Lb/XN9YeSEiBlWNv19uXllWASUjE71zLyEKjoCKD2vKE3Aionw==
X-Received: by 2002:aa7:d390:0:b0:553:e3f2:3c74 with SMTP id
 x16-20020aa7d390000000b00553e3f23c74mr3096895edq.38.1705329755252; Mon, 15
 Jan 2024 06:42:35 -0800 (PST)
MIME-Version: 1.0
References: <20231208023145.1385775-1-sergey.kambalin@auriga.com>
 <20231208023145.1385775-21-sergey.kambalin@auriga.com>
In-Reply-To: <20231208023145.1385775-21-sergey.kambalin@auriga.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Jan 2024 14:42:23 +0000
Message-ID: <CAFEAcA-Uc0DGUdSUHf+SLdUwaEksawGErdRUMarbHOndKCFCxw@mail.gmail.com>
Subject: Re: [PATCH v4 20/45] Implement BCM2838 thermal sensor
To: Sergey Kambalin <serg.oker@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Sergey Kambalin <sergey.kambalin@auriga.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: O/BhWKvhO65U

On Fri, 8 Dec 2023 at 02:33, Sergey Kambalin <serg.oker@gmail.com> wrote:
>
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
> ---
>  hw/arm/bcm2838_peripherals.c         | 27 ++++++--
>  hw/arm/raspi4b.c                     |  1 -
>  hw/misc/bcm2838_thermal.c            | 98 ++++++++++++++++++++++++++++
>  hw/misc/meson.build                  |  3 +-
>  include/hw/arm/bcm2838_peripherals.h |  2 +
>  include/hw/misc/bcm2838_thermal.h    | 24 +++++++
>  6 files changed, 147 insertions(+), 8 deletions(-)
>  create mode 100644 hw/misc/bcm2838_thermal.c
>  create mode 100644 include/hw/misc/bcm2838_thermal.h
>
> diff --git a/hw/arm/bcm2838_peripherals.c b/hw/arm/bcm2838_peripherals.c
> index 7c489c8e8a..e9c6d47ba6 100644
> --- a/hw/arm/bcm2838_peripherals.c
> +++ b/hw/arm/bcm2838_peripherals.c
> @@ -37,6 +37,9 @@ static void bcm2838_peripherals_init(Object *obj)
>      /* Random Number Generator */
>      object_initialize_child(obj, "rng200", &s->rng200, TYPE_BCM2838_RNG2=
00);
>
> +    /* Thermal */
> +    object_initialize_child(obj, "thermal", &s->thermal, TYPE_BCM2838_TH=
ERMAL);
> +
>      /* PCIe Host Bridge */
>      object_initialize_child(obj, "pcie-host", &s->pcie_host,
>                              TYPE_BCM2838_PCIE_HOST);
> @@ -75,6 +78,9 @@ static void bcm2838_peripherals_realize(DeviceState *de=
v, Error **errp)
>      BCMSocPeripheralBaseState *s_base =3D BCM_SOC_PERIPHERALS_BASE(dev);
>      MemoryRegion *regs_mr;
>      MemoryRegion *mmio_mr;
> +    MemoryRegion *rng200_mr;
> +    MemoryRegion *thermal_mr;
> +    qemu_irq rng_200_irq;
>
>      int n;
>
> @@ -92,12 +98,20 @@ static void bcm2838_peripherals_realize(DeviceState *=
dev, Error **errp)
>      if (!sysbus_realize(SYS_BUS_DEVICE(&s->rng200), errp)) {
>          return;
>      }
> -    memory_region_add_subregion(
> -        &s_base->peri_mr, RNG_OFFSET,
> -        sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->rng200), 0));
> -    sysbus_connect_irq(SYS_BUS_DEVICE(&s->rng200), 0,
> -        qdev_get_gpio_in_named(DEVICE(&s_base->ic), BCM2835_IC_GPU_IRQ,
> -                               INTERRUPT_RNG));
> +    rng200_mr =3D sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->rng200), 0);
> +    memory_region_add_subregion(&s_base->peri_mr, RNG_OFFSET, rng200_mr)=
;
> +
> +    rng_200_irq =3D qdev_get_gpio_in_named(DEVICE(&s_base->ic),
> +                                         BCM2835_IC_GPU_IRQ, INTERRUPT_R=
NG);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->rng200), 0, rng_200_irq);

These parts related to the RNG should presumably have been in
the patch which added the RNG device.

> +
> +
> +    /* THERMAL */
> +    if (!sysbus_realize(SYS_BUS_DEVICE(&s->thermal), errp)) {
> +        return;
> +    }
> +    thermal_mr =3D sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->thermal), 0=
);
> +    memory_region_add_subregion( &s->peri_low_mr, 0x15D2000, thermal_mr)=
;
>
>      /* Extended Mass Media Controller 2 */
>      object_property_set_uint(OBJECT(&s->emmc2), "sd-spec-version", 3,
> @@ -198,6 +212,7 @@ static void bcm2838_peripherals_realize(DeviceState *=
dev, Error **errp)
>                               BCM2838_MPHI_SIZE);
>      memory_region_add_subregion(&s_base->peri_mr, BCM2838_MPHI_OFFSET,
>                                  &s->mphi_mr_alias);
> +
>      /* PCIe Root Complex */
>      if (!sysbus_realize(SYS_BUS_DEVICE(&s->pcie_host), errp)) {
>          return;

Stray extra whitespace change -- should probably be in whichever patch
is adding the PCI device to the SoC.

> diff --git a/hw/arm/raspi4b.c b/hw/arm/raspi4b.c
> index 7b5385b8dd..fda27d36cb 100644
> --- a/hw/arm/raspi4b.c
> +++ b/hw/arm/raspi4b.c
> @@ -67,7 +67,6 @@ static void raspi4_modify_dtb(const struct arm_boot_inf=
o *info, void *fdt)
>
>      /* Temporarily disable following devices until they are implemented*=
/
>      const char *to_be_removed_from_dt_as_wa[] =3D {
> -        "brcm,bcm2711-thermal",
>          "brcm,bcm2711-genet-v5",
>      };
>
> diff --git a/hw/misc/bcm2838_thermal.c b/hw/misc/bcm2838_thermal.c
> new file mode 100644
> index 0000000000..2301f657d0
> --- /dev/null
> +++ b/hw/misc/bcm2838_thermal.c
> @@ -0,0 +1,98 @@
> +/*
> + * BCM2838 dummy thermal sensor
> + *
> + * Copyright (C) 2022 Maksim Kopusov <maksim.kopusov@auriga.com>
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/log.h"
> +#include "qapi/error.h"
> +#include "hw/misc/bcm2838_thermal.h"
> +#include "hw/registerfields.h"
> +#include "migration/vmstate.h"
> +#include "qemu/error-report.h"
> +
> +REG32(STAT, 0x200)
> +FIELD(STAT, DATA, 0, 10)
> +FIELD(STAT, VALID_1, 10, 1)
> +FIELD(STAT, VALID_2, 16, 1)
> +
> +#define BCM2838_THERMAL_SIZE 0xf00
> +
> +#define THERMAL_OFFSET_C 410040
> +#define THERMAL_COEFF  (-487.0f)
> +#define MILLIDEGREE_COEFF 1000
> +
> +static uint16_t bcm2838_thermal_temp2adc(int temp_C)
> +{
> +    return (temp_C * MILLIDEGREE_COEFF - THERMAL_OFFSET_C) / THERMAL_COE=
FF;
> +}
> +
> +static uint64_t bcm2838_thermal_read(void *opaque, hwaddr addr, unsigned=
 size)
> +{
> +    uint32_t val =3D 0;
> +
> +    switch (addr) {
> +    case A_STAT:
> +        /* Temperature is always 25=C2=B0C */
> +        val =3D FIELD_DP32(val, STAT, DATA, bcm2838_thermal_temp2adc(25)=
);
> +        val =3D FIELD_DP32(val, STAT, VALID_1, 1);
> +        val =3D FIELD_DP32(val, STAT, VALID_2, 1);
> +
> +        break;
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s can't access addr: 0x%"PRIx64=
,

addr here is a hwaddr, so HWADDR_PRIx is the right format string.

> +                     TYPE_BCM2838_THERMAL, addr);
> +    }
> +    return val;
> +}

> diff --git a/hw/misc/meson.build b/hw/misc/meson.build
> index b899e6b596..386471a5e4 100644
> --- a/hw/misc/meson.build
> +++ b/hw/misc/meson.build
> @@ -91,7 +91,8 @@ system_ss.add(when: 'CONFIG_RASPI', if_true: files(
>    'bcm2835_thermal.c',
>    'bcm2835_cprman.c',
>    'bcm2835_powermgt.c',
> -  'bcm2838_rng200.c'
> +  'bcm2838_rng200.c',
> +  'bcm2838_thermal.c'

If you always keep a trailing comma at the end of this kind of list,
then when you add a new item to it you don't need to also edit
the previous line.

>  ))
>  system_ss.add(when: 'CONFIG_SLAVIO', if_true: files('slavio_misc.c'))
>  system_ss.add(when: 'CONFIG_ZYNQ', if_true: files('zynq_slcr.c'))

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
