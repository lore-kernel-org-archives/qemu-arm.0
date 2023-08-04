Received: by 2002:a17:907:10c8:b0:98d:b2f5:1316 with SMTP id rv8csp1796671ejb;
        Fri, 4 Aug 2023 07:39:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4s2oCPGuO7V/WazhJjI4gWEme1/WSbzseAMB+X8fnpfwwr5jBw1JKEEuKRKIhsokfs/pl
X-Received: by 2002:ac8:5ccc:0:b0:404:3887:19da with SMTP id s12-20020ac85ccc000000b00404388719damr2721399qta.64.1691159959637;
        Fri, 04 Aug 2023 07:39:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691159959; cv=none;
        d=google.com; s=arc-20160816;
        b=QR4soDf3QByPwd9vBs2/hZQwHC403JqBfZDM/+209Kw/i/IOprdw5xjMtjk1uYGhDF
         uqmJJGDggPzHUALI2ENGLXfalh5+7W6CwmO086BKt+RDf8YvKBjMwIARNww4Aa6dixLy
         1GFWNGHFEyE46UtXa0L+902mwmsxXUpMLYqoGU7k/Zaw51q2XSP6Mg5rsyNdfwF4MfJk
         VPv1zP1TMdPMo/DzWXeU3T5NWdA0HgC/fZDVc8JgixJPJEZVuVoqbbSPMwJnkfOKqMwY
         pqEgpFoDA7i8V6Kbewab5gEDgs3iEF/37kZBWNRujQn1GDBUlXE1YBFTzapnFLTtWMNz
         Il2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=a2Q82D27bcztlkVygvlU34mUnqa0AaonJH3tHb3n4Sc=;
        fh=Pe/MIC7yvB073Sd6/4lunpd6aUW6AVi1jfN++S25pLo=;
        b=gUVbI33oZzVLKK4gdUUVz29VzLRkXEyq+zzzKPq0U30JwiAHYsMBIUt7/cvL51vUOP
         859MVHLaL+Pvby9b56vB3uE8wbHmK3zIi/vx8MF7oeoLBQ+v6Ksw6LASXMG6mnRaK7Dg
         SWrdxZfM2V+jA6teTxTvKO0430zstp+E+Xok3xbF7Nlb85PHkPz+xhn+qjIfU2spp4oB
         SCNcaQJBnCIUKHMSVLZ5jm/WE3buRq+nA/oZysb+jNWboUf1jkcNOICzJbb08ZyhVTGA
         H2swQMOGZ31NGodgF7KwuRZvBKc6ga6Kg1cRQCHyemcnO84tRf5kr8/jkudw9eZ6y717
         gbKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QqxzQL0f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v10-20020ac8578a000000b003f22843a015si1323017qta.752.2023.08.04.07.39.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Aug 2023 07:39:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QqxzQL0f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qRvxB-0001Gj-4m; Fri, 04 Aug 2023 10:38:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qRvx9-0001GE-B1
 for qemu-arm@nongnu.org; Fri, 04 Aug 2023 10:38:55 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qRvx7-00057s-FB
 for qemu-arm@nongnu.org; Fri, 04 Aug 2023 10:38:55 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-522c9d388d2so2667972a12.3
 for <qemu-arm@nongnu.org>; Fri, 04 Aug 2023 07:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691159931; x=1691764731;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a2Q82D27bcztlkVygvlU34mUnqa0AaonJH3tHb3n4Sc=;
 b=QqxzQL0fZH3tP4Egm3al/D9E19zRTD7tYFY13Wt9QW9vpM6dFYUhDdgj0eDLbAq03H
 ZzjMSqh8hUUliLiaK7OnsvgGGSXi46fuWfhy8UF+gkhXkqrJJgZeBjpsxQK9sHGlOns0
 VWLLukYzkx0EOzsNErk895rBXwlYQDxZF85d+zKNCOQiZDlZIBlaY8mkbcwwcV5Tp2AM
 GXuxwwd3Y2Rw1srf2HhSH/+R7hAXb8lm9lzhV1yY45CaPinue2iQVS40/GCyo8PxFzmG
 spUxuBLzNnGgkjhuFU7U7WRiIyRwdmhsYyNqqNKoRZS/AEiO30RfSIMkogWMJbuQUSBh
 Oc5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691159931; x=1691764731;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a2Q82D27bcztlkVygvlU34mUnqa0AaonJH3tHb3n4Sc=;
 b=UE04PvsdakN+BMB1UnCPk/62/iW+LzNA3wjCo1ZZyyl5QzbSbRs5ID6QyJqg96g7zo
 2xEd2C57zyonZlFxwoQuilE/cAWskqgcSuzd7CoBfCcwSCBiYpmmksSs9rAwSovv2fOp
 DOjC9wlB1l8UN/3zcL5QbBixhr0oAqMubNv3LpTOKOAmm/K4BQYBSlJnnn9fA9RbNuqD
 htJ+x5JgnfUCPxpP8rxnR6NYI4RlHMVcfyczDcVmT4R4F24YV7V8O6CXOEIYnQn9d/OH
 +Zovc/MfaeAj2X/1PEmIi+k440iMenzFTS6UkjorOtJ2oa0RNnnm+X8nkcG8ZMoeqw5m
 lWVg==
X-Gm-Message-State: AOJu0YzVSamzBVscYvRKPdcPFPm7RwzNTEx5QHAiNEVYGj/pLjnPTB/8
 ykylEDTzUPINYRTyGyyK+ZzABaQ1gp1XT+L/qz6JoA==
X-Received: by 2002:aa7:dc0f:0:b0:523:1053:9b50 with SMTP id
 b15-20020aa7dc0f000000b0052310539b50mr1482149edu.20.1691159931269; Fri, 04
 Aug 2023 07:38:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230726132512.149618-1-sergey.kambalin@auriga.com>
 <20230726132512.149618-21-sergey.kambalin@auriga.com>
In-Reply-To: <20230726132512.149618-21-sergey.kambalin@auriga.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Aug 2023 15:38:40 +0100
Message-ID: <CAFEAcA_AkwcWaDWeewzB7OVzmKH-Cc5n7G8oipnYRayqKd3ndA@mail.gmail.com>
Subject: Re: [PATCH 20/44] Implement BCM2838 thermal sensor
To: Sergey Kambalin <serg.oker@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Sergey Kambalin <sergey.kambalin@auriga.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: N/3XrlRRrLFR

On Wed, 26 Jul 2023 at 14:48, Sergey Kambalin <serg.oker@gmail.com> wrote:
>
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
> ---
>  hw/arm/bcm2838_peripherals.c         | 12 ++++
>  hw/arm/raspi4b.c                     |  1 -
>  hw/misc/bcm2838_thermal.c            | 96 ++++++++++++++++++++++++++++
>  hw/misc/meson.build                  |  3 +-
>  include/hw/arm/bcm2838_peripherals.h |  2 +
>  include/hw/misc/bcm2838_thermal.h    | 24 +++++++
>  6 files changed, 136 insertions(+), 2 deletions(-)
>  create mode 100644 hw/misc/bcm2838_thermal.c
>  create mode 100644 include/hw/misc/bcm2838_thermal.h
>
> diff --git a/hw/arm/bcm2838_peripherals.c b/hw/arm/bcm2838_peripherals.c
> index df97953bbe..e7a9db97ab 100644
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
> @@ -98,6 +101,14 @@ static void bcm2838_peripherals_realize(DeviceState *=
dev, Error **errp)
>          qdev_get_gpio_in_named(DEVICE(&s_base->ic), BCM2835_IC_GPU_IRQ,
>                                 INTERRUPT_RNG));
>
> +    /* THERMAL */
> +    if (!sysbus_realize(SYS_BUS_DEVICE(&s->thermal), errp)) {
> +        return;
> +    }
> +    memory_region_add_subregion(
> +        &s->peri_low_mr, 0x15D2000,
> +        sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->thermal), 0));

(more odd indentation here)

> +
>      /* Extended Mass Media Controller 2 */
>      object_property_set_uint(OBJECT(&s->emmc2), "sd-spec-version", 3,
>                               &error_abort);
> @@ -197,6 +208,7 @@ static void bcm2838_peripherals_realize(DeviceState *=
dev, Error **errp)
>                               BCM2838_MPHI_SIZE);
>      memory_region_add_subregion(&s_base->peri_mr, BCM2838_MPHI_OFFSET,
>                                  &s->mphi_mr_alias);
> +
>      /* PCIe Root Complex */
>      if (!sysbus_realize(SYS_BUS_DEVICE(&s->pcie_host), errp)) {
>          return;
> diff --git a/hw/arm/raspi4b.c b/hw/arm/raspi4b.c
> index 82b6b48d3c..c7fdf791d5 100644
> --- a/hw/arm/raspi4b.c
> +++ b/hw/arm/raspi4b.c
> @@ -66,7 +66,6 @@ static void raspi4_modify_dtb(const struct arm_boot_inf=
o *info, void *fdt)
>
>      /* Temporary disable following devices until they are implemented*/
>      const char *to_be_removed_from_dt_as_wa[] =3D {
> -        "brcm,bcm2711-thermal",
>          "brcm,bcm2711-genet-v5",
>      };
>
> diff --git a/hw/misc/bcm2838_thermal.c b/hw/misc/bcm2838_thermal.c
> new file mode 100644
> index 0000000000..a488dc3da1
> --- /dev/null
> +++ b/hw/misc/bcm2838_thermal.c
> @@ -0,0 +1,96 @@
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
> +         val =3D FIELD_DP32(val, STAT, DATA, bcm2838_thermal_temp2adc(25=
));
> +         val =3D FIELD_DP32(val, STAT, VALID_1, 1);
> +         val =3D FIELD_DP32(val, STAT, VALID_2, 1);
> +
> +         break;
> +    default:
> +         /* MemoryRegionOps are aligned, so this can not happen. */

This comment doesn't seem right. BCM2838_THERMAL_SIZE is larger
than 4, so we can have more than one possible address accessed,
even if the address must be aligned. So the warning is
OK, but the g_assert_reached() and the comment are not.

> +         warn_report("%s can't access addr: 0x%"PRIx64,
> +                     TYPE_BCM2838_THERMAL, addr);

We usually use a LOG_GUEST_ERROR for this kind of "access
with an address that doesn't correspond to a register".

> +         g_assert_not_reached();
> +    }
> +    return val;
> +}
> +
> +static const MemoryRegionOps bcm2838_thermal_ops =3D {
> +    .read =3D bcm2838_thermal_read,

You need to provide a .write, even if it just does a
LOG_GUEST_ERROR for every access. Otherwise if the guest
tries to write then QEMU will crash trying to call the NULL
pointer.

> +    .impl.max_access_size =3D 4,
> +    .valid.min_access_size =3D 4,
> +    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +};
> +
> +static void bcm2838_thermal_realize(DeviceState *dev, Error **errp)
> +{
> +    Bcm2838ThermalState *s =3D BCM2838_THERMAL(dev);
> +
> +    memory_region_init_io(&s->iomem, OBJECT(s), &bcm2838_thermal_ops,
> +                          s, TYPE_BCM2838_THERMAL, BCM2838_THERMAL_SIZE)=
;
> +    sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->iomem);
> +}
> +
> +static const VMStateDescription bcm2838_thermal_vmstate =3D {
> +    .name =3D TYPE_BCM2838_THERMAL,
> +    .version_id =3D 1,
> +    .minimum_version_id =3D 1,
> +};

You don't need to set up a vmstate if it has no data.

> +
> +static void bcm2838_thermal_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> +
> +    dc->realize =3D bcm2838_thermal_realize;
> +    dc->vmsd =3D &bcm2838_thermal_vmstate;

You can add a comment here:
 /* This device has no state: no need for vmstate or reset */

to tell the reader you haven't forgotten it.

> +}
> +
> +static const TypeInfo bcm2838_thermal_info =3D {
> +    .name =3D TYPE_BCM2838_THERMAL,
> +    .parent =3D TYPE_SYS_BUS_DEVICE,
> +    .instance_size =3D sizeof(Bcm2838ThermalState),
> +    .class_init =3D bcm2838_thermal_class_init,
> +};
> +
> +static void bcm2838_thermal_register_types(void)
> +{
> +    type_register_static(&bcm2838_thermal_info);
> +}
> +

thanks
-- PMM
