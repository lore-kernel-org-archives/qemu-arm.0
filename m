Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8B13C61DD6
	for <qemu-arm@archiver.kernel.org>; Wed,  2 Sep 2026 10:31:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x1iEm-0007xD-Nv; Wed, 02 Sep 2026 06:30:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x1iEk-0007wl-L7
 for qemu-arm@nongnu.org; Wed, 02 Sep 2026 06:30:35 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x1iEg-00017B-DY
 for qemu-arm@nongnu.org; Wed, 02 Sep 2026 06:30:33 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-482fc3327fdso623449f8f.2
 for <qemu-arm@nongnu.org>; Wed, 02 Sep 2026 03:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1788345027; x=1788949827; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=i8xDVttFA51ZfYsDGQcnrbW0jl+6zLHC6IHltYp6GWc=;
 b=UoJan3ndovfVHyUSx5MBK7FPJCrOcfi2eK/ePBSS2ayx+kcfK+xR3AmuusTJ9zgi+1
 Hv9SsUIg72E69yg/iHgpB1C0hVIX60BrpmD9RgBmSt+bDdGLZqa+YxGGzSxPAuzMBkVU
 bwyRXcTLG7qWvXiYJeSNucT6idEkvvr7hhO+xgpiMMBD8Z545hMhbnNdii9B4sP3hRDH
 pS/vrkf8qrxNiylcMyIfLTXrJGGkXBbeexLgZgrUR1acOYsU4LTra0VEj7XVwcvCBR2W
 VQv7WGARfXyn5C6gqVJwAhH39aHp0Hp659+w0oplTCrcRAUtCEJ1X6YuMNtWH6E5Iz7c
 yDjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788345027; x=1788949827;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=i8xDVttFA51ZfYsDGQcnrbW0jl+6zLHC6IHltYp6GWc=;
 b=Jo+7wJ5fiwrjIKUqVeqncWytYlOIwQGqjNSHlf6gcAnkMxVjIbZ46AnL/umz5hlp42
 otJJv7DRoeH+OC1lGqxTVerLSMjVkziLfL8owHLknkgQCjOCTZbDOmdc0IKbhS3GHXCr
 JW6G6UC0sie5A9C1W7T2I1QYACEVeoIbu5F0yTUea/Ig0wPR4VzBxi5cYLgPsLflJn29
 RyBjmbLeONUpGFzqjowl5hPUTmu8LHBtUlYUlCLGqsLGpCxcSFNUwGddB0CkSy2LyyYi
 /4Usiqx/q/GqUXhncOBzXZqk0iM2S3YBMKI7SZs0KO6jqMJgRdYMlmOHqBMV9ZUXdnrR
 EKug==
X-Forwarded-Encrypted: i=1;
 AKwUvBwVYi4JQi4oG3IdmXVHekdNmLLwWvdqy1fcKKuTJBCVggZ3Ug/fRLqSLYewocZO+Dk1pPmcveVYTA==@nongnu.org
X-Gm-Message-State: AFuF++lmMEtuKYBR59mWOaSymdRYSkbwV8yfNcKcHlgodIESXffL5COR
 ayjDW3Q8eFxyJ53urs2QQEjeeHYi9npEbtMuvLT/Wv6UOp4DAb8FbXrLZkVbuoiVNQU=
X-Gm-Gg: AYBFou2IBl9chjOMMXKQAR3uH7VQTBvdCeZ8/slmPYbDKZCZ82t+P7wdenncV7uhDEA
 YeqiOVTGMHWM9KfdtO7MI3BnJm6v6PIgoPrISe46PSAKIjvt86NznRsh7jdn4dMwRhUAuRBUGeI
 Ab9n0MMbg0rV0ssfTdr0B5jjI+3sJBjmp/I90Rqu5xysl57HzdgCGJ91NN5pZJH5UJIKMy6J+I+
 ZaeDHpAGmMdjzQBVdsj96NpJTuoXzgvu7i0y8f9K1t9i4iPulRoz9fbP3605+eLC218m953hs1N
 ZbDPHSC3xn/LwumLgdkOhIYsehYrPgFbyeHstJ6L5CWMRgPcAn7c2pG0ewxmi+dBPZajhP2msYV
 l8nZ/5/mbfYBbQ1kRyUZF1P95FbFqHDe08g+evTRKSDqwQm3kcrcYlS8zXwZ4SJfYgSXbc9OPAZ
 ZndKavhtnMTsEYh4r2u+elUXd+vkJ0DQKraz2NvjwD9VkHMCwAE7nRDxLg6J4Y
X-Received: by 2002:a05:6000:2388:b0:482:fda9:d644 with SMTP id
 ffacd0b85a97d-48488dff528mr6284830f8f.7.1788345026926; 
 Wed, 02 Sep 2026 03:30:26 -0700 (PDT)
Received: from draig.lan ([185.124.0.156]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48448e72b5bsm5552000f8f.4.2026.09.02.03.30.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2026 03:30:26 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 614F05F85F;
 Wed, 02 Sep 2026 11:30:24 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Gilles Grimaud <gilles.grimaud@univ-lille.fr>
Cc: qemu-devel@nongnu.org,  qemu-arm@nongnu.org,  Paolo Bonzini
 <pbonzini@redhat.com>,  Peter Maydell <peter.maydell@linaro.org>,  Fabiano
 Rosas <farosas@suse.de>,  Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH RFC v2 09/30] hw/misc: add RP2040 PLL and clock controller
In-Reply-To: <20260829234308.33725-10-gilles.grimaud@univ-lille.fr> (Gilles
 Grimaud's message of "Sun, 30 Aug 2026 01:42:43 +0200")
References: <20260829234308.33725-1-gilles.grimaud@univ-lille.fr>
 <20260829234308.33725-10-gilles.grimaud@univ-lille.fr>
User-Agent: mu4e 1.14.4-pre1; emacs 30.1
Date: Wed, 02 Sep 2026 11:30:24 +0100
Message-ID: <87zey0q727.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Gilles Grimaud <gilles.grimaud@univ-lille.fr> writes:

> From: gilles grimaud <gilles.grimaud@univ-lille.fr>
>
> Model the RP2040 system and USB PLL register blocks and their clock outpu=
ts. Add the clock mux, divider, selected-source and frequency-counter regis=
ters, then route clk-sys to the Cortex-M0+ and clk-peri to both UARTs. Incl=
ude focused qtests for PLL configuration, clock switching and frequency mea=
surement.
>
> Signed-off-by: gilles grimaud <gilles.grimaud@univ-lille.fr>
> ---
>  hw/arm/Kconfig                   |   2 +
<snip>
> +
> +#define ATOMIC_ALIAS_MASK    0x3000
> +#define ATOMIC_XOR           0x1000
> +#define ATOMIC_SET           0x2000
> +#define ATOMIC_CLR           0x3000

These seem to be common defines - why not have a common 2040 header that
they all use.

<snip>
> diff --git a/hw/misc/rp2040_pll.c b/hw/misc/rp2040_pll.c
> new file mode 100644
> index 0000000000..6fe2be6608
> --- /dev/null
> +++ b/hw/misc/rp2040_pll.c
> @@ -0,0 +1,234 @@
<snip>
> +
> +#define ATOMIC_ALIAS_MASK   0x3000
> +#define ATOMIC_XOR          0x1000
> +#define ATOMIC_SET          0x2000
> +#define ATOMIC_CLR          0x3000
> +
> +static uint32_t rp2040_pll_apply_alias(uint32_t old, uint32_t value,
> +                                       hwaddr alias)
> +{
> +    switch (alias) {
> +    case ATOMIC_XOR:
> +        return old ^ value;
> +    case ATOMIC_SET:
> +        return old | value;
> +    case ATOMIC_CLR:
> +        return old & ~value;
> +    default:
> +        return value;
> +    }

This is repeated throughout the code, sometimes inline sometimes not.
This screams for a common inline helper in the headers.

> +}
> +
> +static bool rp2040_pll_locked(RP2040PllState *s)
> +{
> +    return !(s->pwr & (PLL_PWR_PD | PLL_PWR_VCOPD));
> +}
> +
> +static unsigned rp2040_pll_output_hz(RP2040PllState *s)
> +{
> +    uint32_t refdiv =3D s->cs & PLL_CS_REFDIV_MASK;
> +    uint32_t fbdiv =3D s->fbdiv_int & PLL_FBDIV_MASK;
> +    uint32_t postdiv1 =3D extract32(s->prim, 16, 3);
> +    uint32_t postdiv2 =3D extract32(s->prim, 12, 3);
> +    uint64_t hz;
> +
> +    if (!rp2040_pll_locked(s) || (s->pwr & PLL_PWR_POSTDIVPD)) {
> +        return 0;
> +    }
> +
> +    refdiv =3D refdiv ? refdiv : 1;
> +    if (s->cs & PLL_CS_BYPASS) {
> +        return XOSC_HZ / refdiv;
> +    }
> +
> +    if (!fbdiv || !postdiv1 || !postdiv2) {
> +        return s->fallback_hz;
> +    }
> +
> +    hz =3D XOSC_HZ;
> +    hz =3D hz * fbdiv / refdiv / postdiv1 / postdiv2;
> +    return hz;
> +}
> +
> +static void rp2040_pll_update_clock(RP2040PllState *s)
> +{
> +    clock_update_hz(s->clk, rp2040_pll_output_hz(s));
> +}
> +
> +static uint64_t rp2040_pll_read(void *opaque, hwaddr addr, unsigned size)
> +{
> +    RP2040PllState *s =3D opaque;
> +    hwaddr offset =3D addr & 0xfff;
> +    const char *name =3D s->trace_name ? s->trace_name : "rp2040.pll";
> +    uint64_t value;
> +
> +    switch (offset) {
> +    case PLL_CS:
> +        value =3D s->cs & ~PLL_CS_LOCK;
> +        if (rp2040_pll_locked(s)) {
> +            value |=3D PLL_CS_LOCK;
> +        }
> +        break;
> +    case PLL_PWR:
> +        value =3D s->pwr;
> +        break;
> +    case PLL_FBDIV_INT:
> +        value =3D s->fbdiv_int;
> +        break;
> +    case PLL_PRIM:
> +        value =3D s->prim;
> +        break;
> +    default:
> +        value =3D 0;
> +        rp2040_log_unimplemented_read(name, size, s->base + addr, offset,
> +                                      value);
> +        break;
> +    }
> +
> +    return value;
> +}
> +
> +static void rp2040_pll_write(void *opaque, hwaddr addr,
> +                             uint64_t value64, unsigned size)
> +{
> +    RP2040PllState *s =3D opaque;
> +    hwaddr alias =3D addr & ATOMIC_ALIAS_MASK;
> +    hwaddr offset =3D addr & 0xfff;
> +    const char *name =3D s->trace_name ? s->trace_name : "rp2040.pll";
> +    uint32_t value =3D value64;
> +
> +    switch (offset) {
> +    case PLL_CS:
> +        s->cs =3D rp2040_pll_apply_alias(s->cs, value, alias) &
> +                (PLL_CS_BYPASS | PLL_CS_REFDIV_MASK);
> +        break;
> +    case PLL_PWR:
> +        s->pwr =3D rp2040_pll_apply_alias(s->pwr, value, alias) & PLL_PW=
R_MASK;
> +        break;
> +    case PLL_FBDIV_INT:
> +        s->fbdiv_int =3D rp2040_pll_apply_alias(s->fbdiv_int, value, ali=
as) &
> +                       PLL_FBDIV_MASK;
> +        break;
> +    case PLL_PRIM:
> +        s->prim =3D rp2040_pll_apply_alias(s->prim, value, alias) &
> +                  PLL_PRIM_MASK;
> +        break;
> +    default:
> +        rp2040_log_unimplemented_write(name, size, s->base + addr, offse=
t,
> +                                       value64);
> +        break;
> +    }
> +
> +    rp2040_pll_update_clock(s);
> +}
> +
> +static const MemoryRegionOps rp2040_pll_ops =3D {
> +    .read =3D rp2040_pll_read,
> +    .write =3D rp2040_pll_write,
> +    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .valid =3D {
> +        .min_access_size =3D 4,
> +        .max_access_size =3D 4,
> +    },
> +};
> +
> +static void rp2040_pll_reset(DeviceState *dev)
> +{
> +    RP2040PllState *s =3D RP2040_PLL(dev);
> +
> +    s->cs =3D 1;
> +    s->pwr =3D PLL_PWR_MASK;
> +    s->fbdiv_int =3D 0;
> +    s->prim =3D (7 << 16) | (7 << 12);

#defines for magic numbers please.

> +
> +    rp2040_pll_update_clock(s);
> +}
> +
> +static void rp2040_pll_init(Object *obj)
> +{
> +    RP2040PllState *s =3D RP2040_PLL(obj);
> +    DeviceState *dev =3D DEVICE(obj);
> +
> +    s->clk =3D qdev_init_clock_out(dev, "clk");
> +    memory_region_init_io(&s->iomem, obj, &rp2040_pll_ops, s,
> +                          "rp2040.pll", RP2040_PLL_SIZE);
> +    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->iomem);
> +}
> +
> +static const VMStateDescription rp2040_pll_vmstate =3D {
> +    .name =3D TYPE_RP2040_PLL,
> +    .version_id =3D 1,
> +    .minimum_version_id =3D 1,
> +    .fields =3D (const VMStateField[]) {
> +        VMSTATE_UINT32(cs, RP2040PllState),
> +        VMSTATE_UINT32(pwr, RP2040PllState),
> +        VMSTATE_UINT32(fbdiv_int, RP2040PllState),
> +        VMSTATE_UINT32(prim, RP2040PllState),
> +        VMSTATE_CLOCK(clk, RP2040PllState),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static const Property rp2040_pll_properties[] =3D {
> +    DEFINE_PROP_STRING("trace-name", RP2040PllState, trace_name),
> +    DEFINE_PROP_UINT32("base", RP2040PllState, base, 0),
> +    DEFINE_PROP_UINT32("fallback-hz", RP2040PllState, fallback_hz, 0),
> +};
> +
> +static void rp2040_pll_class_init(ObjectClass *klass, const void *data)
> +{
> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> +
> +    device_class_set_legacy_reset(dc, rp2040_pll_reset);
> +    device_class_set_props(dc, rp2040_pll_properties);
> +    dc->vmsd =3D &rp2040_pll_vmstate;
> +}
> +
> +static const TypeInfo rp2040_pll_info =3D {
> +    .name          =3D TYPE_RP2040_PLL,
> +    .parent        =3D TYPE_SYS_BUS_DEVICE,
> +    .instance_size =3D sizeof(RP2040PllState),
> +    .instance_init =3D rp2040_pll_init,
> +    .class_init    =3D rp2040_pll_class_init,
> +};
> +
> +static void rp2040_pll_register_types(void)
> +{
> +    type_register_static(&rp2040_pll_info);
> +}
> +type_init(rp2040_pll_register_types)
> diff --git a/include/hw/arm/rp2040.h b/include/hw/arm/rp2040.h
> index 47a8cb2236..abdd2f006c 100644
> --- a/include/hw/arm/rp2040.h
> +++ b/include/hw/arm/rp2040.h
> @@ -13,6 +13,8 @@
>  #include "hw/char/pl011.h"
>  #include "hw/core/clock.h"
>  #include "hw/core/sysbus.h"
> +#include "hw/misc/rp2040_clocks.h"
> +#include "hw/misc/rp2040_pll.h"
>  #include "hw/misc/rp2040_rosc.h"
>  #include "hw/misc/rp2040_syscfg.h"
>  #include "hw/misc/rp2040_sysinfo.h"
> @@ -40,6 +42,9 @@ struct RP2040State {
>=20=20
>      ARMv7MState armv7m;
>      PL011State uart[2];
> +    RP2040ClocksState clocks;
> +    RP2040PllState pll_sys;
> +    RP2040PllState pll_usb;
>      RP2040SysCfgState syscfg;
>      RP2040SysInfoState sysinfo;
>      RP2040RoscState rosc;
> diff --git a/include/hw/misc/rp2040_clocks.h b/include/hw/misc/rp2040_clo=
cks.h
> new file mode 100644
> index 0000000000..ebbb14e3fa
> --- /dev/null
> +++ b/include/hw/misc/rp2040_clocks.h
> @@ -0,0 +1,36 @@
> +/*
> + * RP2040 clocks emulation
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#ifndef HW_MISC_RP2040_CLOCKS_H
> +#define HW_MISC_RP2040_CLOCKS_H
> +
> +#include "hw/core/clock.h"
> +#include "hw/core/sysbus.h"
> +#include "qom/object.h"
> +
> +#define TYPE_RP2040_CLOCKS "rp2040-clocks"
> +OBJECT_DECLARE_SIMPLE_TYPE(RP2040ClocksState, RP2040_CLOCKS)
> +
> +#define RP2040_CLOCKS_BASE 0x40008000
> +#define RP2040_CLOCKS_SIZE 0x4000
> +
> +struct RP2040ClocksState {
> +    SysBusDevice parent_obj;
> +
> +    MemoryRegion iomem;
> +    Clock *clk_ref;
> +    Clock *clk_sys;
> +    Clock *clk_peri;
> +    Clock *clk_usb;
> +    Clock *clk_adc;
> +    Clock *clk_rtc;
> +    Clock *pll_sys;
> +    Clock *pll_usb;
> +
> +    uint32_t regs[0x100 / 4];
> +};
> +
> +#endif
> diff --git a/include/hw/misc/rp2040_pll.h b/include/hw/misc/rp2040_pll.h
> new file mode 100644
> index 0000000000..ad188aa46e
> --- /dev/null
> +++ b/include/hw/misc/rp2040_pll.h
> @@ -0,0 +1,37 @@
> +/*
> + * RP2040 PLL emulation
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#ifndef HW_MISC_RP2040_PLL_H
> +#define HW_MISC_RP2040_PLL_H
> +
> +#include "hw/core/clock.h"
> +#include "hw/core/sysbus.h"
> +#include "qom/object.h"
> +
> +#define TYPE_RP2040_PLL "rp2040-pll"
> +OBJECT_DECLARE_SIMPLE_TYPE(RP2040PllState, RP2040_PLL)
> +
> +#define RP2040_PLL_SYS_BASE 0x40028000
> +#define RP2040_PLL_USB_BASE 0x4002c000
> +#define RP2040_PLL_SIZE     0x4000
> +
> +struct RP2040PllState {
> +    SysBusDevice parent_obj;
> +
> +    MemoryRegion iomem;
> +    Clock *clk;
> +
> +    char *trace_name;
> +    uint32_t base;
> +    uint32_t fallback_hz;
> +
> +    uint32_t cs;
> +    uint32_t pwr;
> +    uint32_t fbdiv_int;
> +    uint32_t prim;
> +};
> +
> +#endif
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index 441f6f294a..416d90ae94 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -256,6 +256,7 @@ qtests_arm =3D \
>    (config_all_devices.has_key('CONFIG_VEXPRESS') ? ['test-arm-mptimer'] =
: []) + \
>    (config_all_devices.has_key('CONFIG_MICROBIT') ? ['microbit-test'] : [=
]) + \
>    (config_all_devices.has_key('CONFIG_RASPI_PICO') ? ['rp2040-sysinfo-sy=
scfg-test',
> +                                                       'rp2040-clocks-te=
st',
>                                                         'rp2040-rosc-test=
',
>                                                         'rp2040-tbman-tes=
t',
>                                                         'rp2040-vreg-test=
'] : []) + \
> diff --git a/tests/qtest/rp2040-clocks-test.c b/tests/qtest/rp2040-clocks=
-test.c
> new file mode 100644
> index 0000000000..39e49eb57f
> --- /dev/null
> +++ b/tests/qtest/rp2040-clocks-test.c
> @@ -0,0 +1,107 @@
> +/*
> + * QTest testcase for the RP2040 clocks block.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +#include "libqtest.h"
> +#include "qemu/bitops.h"
> +
> +#define CLOCKS_BASE             0x40008000
> +#define CLK_SYS_CTRL            0x3c
> +#define CLK_SYS_DIV             0x40
> +#define CLK_PERI_CTRL           0x48
> +#define CLK_PERI_DIV            0x4c
> +#define CLK_USB_CTRL            0x54
> +#define CLK_USB_DIV             0x58
> +#define CLK_ADC_CTRL            0x60
> +#define CLK_ADC_DIV             0x64
> +#define CLK_RTC_CTRL            0x6c
> +#define CLK_RTC_DIV             0x70
> +#define FC0_SRC                 0x94
> +#define FC0_STATUS              0x98
> +#define FC0_RESULT              0x9c
> +
> +#define PLL_SYS_BASE            0x40028000
> +#define PLL_USB_BASE            0x4002c000
> +#define PLL_CS                  0x00
> +#define PLL_PWR                 0x04
> +#define PLL_FBDIV_INT           0x08
> +#define PLL_PRIM                0x0c
> +
> +#define PLL_PWR_BITS            (BIT(5) | BIT(3) | BIT(2) | BIT(0))
> +#define CLK_CTRL_ENABLE         BIT(11)
> +#define FC0_STATUS_DONE         BIT(4)

Again you can re-use include definitions.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

