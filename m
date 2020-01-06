Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp23568107lff;
        Mon, 6 Jan 2020 08:30:23 -0800 (PST)
X-Google-Smtp-Source: APXvYqwz89QF0/Tn9oaecuqgCDE550U6q1mDdUvJdbCE1P5Laiv2LoiKgE1DxD/6BUrshKrSQKQa
X-Received: by 2002:a37:4b8b:: with SMTP id y133mr82730687qka.210.1578328223371;
        Mon, 06 Jan 2020 08:30:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578328223; cv=none;
        d=google.com; s=arc-20160816;
        b=SVdo/3hUGe3mu22l6EqMHSWLnxJkihunuCJD+k6mdRx4e4XTLQxhgH47dOuxjGLsiu
         OgW2Ger/niTeaBwvmV0BUvAT0/up65VHjXxSeGODFb4X3nSFsr64zHzOJK4vyVq/9MhK
         eGv5lDyGGGR2VAMNmNcQiu0Zt724wKG5Dg97a4MaZhJ94kMZVf4b9NkMsCFIMlb4Iw/y
         xrFxTQl84Okuyl8sNeSZKm8HPlWejroh5FoUl9eQNIFqChYgVG/qAghhfcYp70kSHV6z
         Op1rWqpNBPQzbx59lsG4Me7o7X+sbyRWUjyj5URlqNmBRCGM4fNgj6Gx9wfeJkwQaypE
         Q6vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=OoStX+EzNnlRyteEv6Xxob0VhDKHOpsN1NU/h/095fs=;
        b=Uqs2cyHBJUDB5JOu2QuIreEUg3zFJZA2ML+VlOmTvT8jrWwcacowWqhoO6b21leupj
         e/DN4SsY2aZtR8EG/XlJ/VXihSnwkHAu/gODsb0mpA5yFOm7fFonI/TCunJZTQsunv/J
         4/IVJaSjRvzl9kbOeIQshXYYGoUTTV8p04cmjvtkdyBrpfktvm41rDFqVPYb2fP9KLjk
         9XBbF5vUos8RpJdYCatS5VhULnVkytGCVvJEZnsR6K4HyGV8hzgLU3/mSJEYZ1BZWEtM
         htddci9U5W1fz9RsPtahaFZmFjUw0mwEuoRlE1c+jXVe2JwUoq9BhsfLXLF/Yt2EhXlv
         R3zQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TNC2858r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f56si28600153qtk.169.2020.01.06.08.30.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jan 2020 08:30:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TNC2858r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ioVGn-00023Y-Ur
	for alex.bennee@linaro.org; Mon, 06 Jan 2020 11:30:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42008)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ioVGZ-0001zt-HV
 for qemu-arm@nongnu.org; Mon, 06 Jan 2020 11:30:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ioVGX-0008Lh-GN
 for qemu-arm@nongnu.org; Mon, 06 Jan 2020 11:30:07 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:43398
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ioVGX-0008LE-Bx
 for qemu-arm@nongnu.org; Mon, 06 Jan 2020 11:30:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578328204;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OoStX+EzNnlRyteEv6Xxob0VhDKHOpsN1NU/h/095fs=;
 b=TNC2858rFd+1AHM7K2P9+j6iYdIZ1v8ISyxSM4eoDFOzCwW8Fhj8Fxbh0+sbVD4bH+gLCu
 xP0Kkr6HFxRcNve71KAs7XUsN/4+ewtzA4jqiQ715+b5b1b3slrsLXyf2sm/8VuYxu86Jk
 yrJNBOCXV3y0clEICcW7DN9QQXxqJGo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-aHDwbc0yPvabfwecHGLm6w-1; Mon, 06 Jan 2020 11:30:03 -0500
Received: by mail-wr1-f71.google.com with SMTP id f15so13054471wrr.2
 for <qemu-arm@nongnu.org>; Mon, 06 Jan 2020 08:30:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eKl8NBB0cFoyUpwdfPIS7QK3pxvfLtAcfoQE77XRlvw=;
 b=ilzB3HovfVFL7drnu6osi3nRUqyCTT5UxvpyqlaOZjjubEai8VAv5Eot0AsYAU2SGl
 bV+xCOFJDxgT9cNkcIlDms4ORys628/D/3jBUfW97LiGyhFczeHs16EVhtz4C57ZcdFg
 gu6K8wZCgpn/nE6IG2yr9QBhjWqAgiCOV58aVKEtsuUC8JIlqPo69/mM4dKhKt490V5Y
 ybVVf7M+cN5AEWZbf1Ti7CFq5kcg+zoTNEO9n1umFg/n5i66kZhX4FjThA/FdzAlgres
 qkwH8M0qoXCSirAG7pt3z5W3+g3GWQVH+oLsT4FUW7Uxj2VyZgIn9VKp3eIKpTFZxCDT
 +swg==
X-Gm-Message-State: APjAAAV0GKgYpGvk8lczDxYuG5lTw3gev9w5hh1cnlL1xAU4I4PaaW8R
 BZBss1qUVH16bIImBwWl9jl3MTuzElKkJdeMuIAPZHf5P0k+sPBmRQE/vsBQ3+8Qjwry8xBJVt8
 B4lrWuOVtP+Db
X-Received: by 2002:adf:fa12:: with SMTP id
 m18mr100206430wrr.309.1578328201854; 
 Mon, 06 Jan 2020 08:30:01 -0800 (PST)
X-Received: by 2002:adf:fa12:: with SMTP id
 m18mr100206408wrr.309.1578328201559; 
 Mon, 06 Jan 2020 08:30:01 -0800 (PST)
Received: from [192.168.1.35] (34.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.34])
 by smtp.gmail.com with ESMTPSA id i5sm23325714wml.31.2020.01.06.08.30.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jan 2020 08:30:01 -0800 (PST)
Subject: Re: [PATCH v7 2/4] hw/misc: Add the STM32F4xx EXTI device
To: Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 peter.maydell@linaro.org, qemu-arm@nongnu.org
References: <cover.1576658572.git.alistair@alistair23.me>
 <ef941d59fd8658589d34ed432e1d6dfdcf7fb1d0.1576658572.git.alistair@alistair23.me>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <55816102-3349-3c12-cce4-d137a6985371@redhat.com>
Date: Mon, 6 Jan 2020 17:30:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <ef941d59fd8658589d34ed432e1d6dfdcf7fb1d0.1576658572.git.alistair@alistair23.me>
Content-Language: en-US
X-MC-Unique: aHDwbc0yPvabfwecHGLm6w-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: alistair23@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vHQjQNIr4ozg

On 12/19/19 6:22 AM, Alistair Francis wrote:
> Signed-off-by: Alistair Francis <alistair@alistair23.me>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/arm/Kconfig                   |   1 +
>   hw/misc/Kconfig                  |   3 +
>   hw/misc/Makefile.objs            |   1 +
>   hw/misc/stm32f4xx_exti.c         | 188 +++++++++++++++++++++++++++++++
>   hw/misc/trace-events             |   5 +
>   include/hw/misc/stm32f4xx_exti.h |  60 ++++++++++
>   6 files changed, 258 insertions(+)
>   create mode 100644 hw/misc/stm32f4xx_exti.c
>   create mode 100644 include/hw/misc/stm32f4xx_exti.h
>=20
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 4660d14715..3d86691ae0 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -315,6 +315,7 @@ config STM32F405_SOC
>       bool
>       select ARM_V7M
>       select STM32F4XX_SYSCFG
> +    select STM32F4XX_EXTI
>  =20
>   config XLNX_ZYNQMP_ARM
>       bool
> diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
> index 72609650b7..bdd77d8020 100644
> --- a/hw/misc/Kconfig
> +++ b/hw/misc/Kconfig
> @@ -85,6 +85,9 @@ config STM32F2XX_SYSCFG
>   config STM32F4XX_SYSCFG
>       bool
>  =20
> +config STM32F4XX_EXTI
> +    bool
> +
>   config MIPS_ITU
>       bool
>  =20
> diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
> index ea8025e0bb..c6ecbdd7b0 100644
> --- a/hw/misc/Makefile.objs
> +++ b/hw/misc/Makefile.objs
> @@ -59,6 +59,7 @@ common-obj-$(CONFIG_ZYNQ) +=3D zynq_slcr.o
>   common-obj-$(CONFIG_ZYNQ) +=3D zynq-xadc.o
>   common-obj-$(CONFIG_STM32F2XX_SYSCFG) +=3D stm32f2xx_syscfg.o
>   common-obj-$(CONFIG_STM32F4XX_SYSCFG) +=3D stm32f4xx_syscfg.o
> +common-obj-$(CONFIG_STM32F4XX_EXTI) +=3D stm32f4xx_exti.o
>   obj-$(CONFIG_MIPS_CPS) +=3D mips_cmgcr.o
>   obj-$(CONFIG_MIPS_CPS) +=3D mips_cpc.o
>   obj-$(CONFIG_MIPS_ITU) +=3D mips_itu.o
> diff --git a/hw/misc/stm32f4xx_exti.c b/hw/misc/stm32f4xx_exti.c
> new file mode 100644
> index 0000000000..02e7810046
> --- /dev/null
> +++ b/hw/misc/stm32f4xx_exti.c
> @@ -0,0 +1,188 @@
> +/*
> + * STM32F4XX EXTI
> + *
> + * Copyright (c) 2014 Alistair Francis <alistair@alistair23.me>
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining=
 a copy
> + * of this software and associated documentation files (the "Software"),=
 to deal
> + * in the Software without restriction, including without limitation the=
 rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or =
sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be includ=
ed in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHA=
LL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR =
OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISI=
NG FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALING=
S IN
> + * THE SOFTWARE.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/log.h"
> +#include "trace.h"
> +#include "hw/irq.h"
> +#include "migration/vmstate.h"
> +#include "hw/misc/stm32f4xx_exti.h"
> +
> +static void stm32f4xx_exti_reset(DeviceState *dev)
> +{
> +    STM32F4xxExtiState *s =3D STM32F4XX_EXTI(dev);
> +
> +    s->exti_imr =3D 0x00000000;
> +    s->exti_emr =3D 0x00000000;
> +    s->exti_rtsr =3D 0x00000000;
> +    s->exti_ftsr =3D 0x00000000;
> +    s->exti_swier =3D 0x00000000;
> +    s->exti_pr =3D 0x00000000;
> +}
> +
> +static void stm32f4xx_exti_set_irq(void *opaque, int irq, int level)
> +{
> +    STM32F4xxExtiState *s =3D opaque;
> +
> +    trace_stm32f4xx_exti_set_irq(irq, level);
> +
> +    if (((1 << irq) & s->exti_rtsr) && level) {
> +        /* Rising Edge */
> +        s->exti_pr |=3D 1 << irq;
> +    }
> +
> +    if (((1 << irq) & s->exti_ftsr) && !level) {
> +        /* Falling Edge */
> +        s->exti_pr |=3D 1 << irq;
> +    }
> +
> +    if (!((1 << irq) & s->exti_imr)) {
> +        /* Interrupt is masked */
> +        return;
> +    }
> +    qemu_irq_pulse(s->irq[irq]);

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

> +}
> +
> +static uint64_t stm32f4xx_exti_read(void *opaque, hwaddr addr,
> +                                     unsigned int size)
> +{
> +    STM32F4xxExtiState *s =3D opaque;
> +
> +    trace_stm32f4xx_exti_read(addr);
> +
> +    switch (addr) {
> +    case EXTI_IMR:
> +        return s->exti_imr;
> +    case EXTI_EMR:
> +        return s->exti_emr;
> +    case EXTI_RTSR:
> +        return s->exti_rtsr;
> +    case EXTI_FTSR:
> +        return s->exti_ftsr;
> +    case EXTI_SWIER:
> +        return s->exti_swier;
> +    case EXTI_PR:
> +        return s->exti_pr;
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "STM32F4XX_exti_read: Bad offset %x\n", (int)addr)=
;
> +        return 0;
> +    }
> +    return 0;
> +}
> +
> +static void stm32f4xx_exti_write(void *opaque, hwaddr addr,
> +                       uint64_t val64, unsigned int size)
> +{
> +    STM32F4xxExtiState *s =3D opaque;
> +    uint32_t value =3D (uint32_t) val64;
> +
> +    trace_stm32f4xx_exti_write(addr, value);
> +
> +    switch (addr) {
> +    case EXTI_IMR:
> +        s->exti_imr =3D value;
> +        return;
> +    case EXTI_EMR:
> +        s->exti_emr =3D value;
> +        return;
> +    case EXTI_RTSR:
> +        s->exti_rtsr =3D value;
> +        return;
> +    case EXTI_FTSR:
> +        s->exti_ftsr =3D value;
> +        return;
> +    case EXTI_SWIER:
> +        s->exti_swier =3D value;
> +        return;
> +    case EXTI_PR:
> +        /* This bit is cleared by writing a 1 to it */
> +        s->exti_pr &=3D ~value;
> +        return;
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "STM32F4XX_exti_write: Bad offset %x\n", (int)addr=
);
> +    }
> +}
> +
> +static const MemoryRegionOps stm32f4xx_exti_ops =3D {
> +    .read =3D stm32f4xx_exti_read,
> +    .write =3D stm32f4xx_exti_write,
> +    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +};
> +
> +static void stm32f4xx_exti_init(Object *obj)
> +{
> +    STM32F4xxExtiState *s =3D STM32F4XX_EXTI(obj);
> +    int i;
> +
> +    for (i =3D 0; i < NUM_INTERRUPT_OUT_LINES; i++) {
> +        sysbus_init_irq(SYS_BUS_DEVICE(obj), &s->irq[i]);
> +    }
> +
> +    memory_region_init_io(&s->mmio, obj, &stm32f4xx_exti_ops, s,
> +                          TYPE_STM32F4XX_EXTI, 0x400);
> +    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mmio);
> +
> +    qdev_init_gpio_in(DEVICE(obj), stm32f4xx_exti_set_irq,
> +                      NUM_GPIO_EVENT_IN_LINES);
> +}
> +
> +static const VMStateDescription vmstate_stm32f4xx_exti =3D {
> +    .name =3D TYPE_STM32F4XX_EXTI,
> +    .version_id =3D 1,
> +    .minimum_version_id =3D 1,
> +    .fields =3D (VMStateField[]) {
> +        VMSTATE_UINT32(exti_imr, STM32F4xxExtiState),
> +        VMSTATE_UINT32(exti_emr, STM32F4xxExtiState),
> +        VMSTATE_UINT32(exti_rtsr, STM32F4xxExtiState),
> +        VMSTATE_UINT32(exti_ftsr, STM32F4xxExtiState),
> +        VMSTATE_UINT32(exti_swier, STM32F4xxExtiState),
> +        VMSTATE_UINT32(exti_pr, STM32F4xxExtiState),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static void stm32f4xx_exti_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> +
> +    dc->reset =3D stm32f4xx_exti_reset;
> +    dc->vmsd =3D &vmstate_stm32f4xx_exti;
> +}
> +
> +static const TypeInfo stm32f4xx_exti_info =3D {
> +    .name          =3D TYPE_STM32F4XX_EXTI,
> +    .parent        =3D TYPE_SYS_BUS_DEVICE,
> +    .instance_size =3D sizeof(STM32F4xxExtiState),
> +    .instance_init =3D stm32f4xx_exti_init,
> +    .class_init    =3D stm32f4xx_exti_class_init,
> +};
> +
> +static void stm32f4xx_exti_register_types(void)
> +{
> +    type_register_static(&stm32f4xx_exti_info);
> +}
> +
> +type_init(stm32f4xx_exti_register_types)
> diff --git a/hw/misc/trace-events b/hw/misc/trace-events
> index 02327562bc..91a3794d68 100644
> --- a/hw/misc/trace-events
> +++ b/hw/misc/trace-events
> @@ -90,6 +90,11 @@ stm32f4xx_pulse_exti(int irq) "Pulse EXTI: %d"
>   stm32f4xx_syscfg_read(uint64_t addr) "reg read: addr: 0x%" PRIx64 " "
>   stm32f4xx_syscfg_write(uint64_t addr, uint64_t data) "reg write: addr: =
0x%" PRIx64 " val: 0x%" PRIx64 ""
>  =20
> +# stm32f4xx_exti
> +stm32f4xx_exti_set_irq(int irq, int leve) "Set EXTI: %d to %d"
> +stm32f4xx_exti_read(uint64_t addr) "reg read: addr: 0x%" PRIx64 " "
> +stm32f4xx_exti_write(uint64_t addr, uint64_t data) "reg write: addr: 0x%=
" PRIx64 " val: 0x%" PRIx64 ""
> +
>   # tz-mpc.c
>   tz_mpc_reg_read(uint32_t offset, uint64_t data, unsigned size) "TZ MPC =
regs read: offset 0x%x data 0x%" PRIx64 " size %u"
>   tz_mpc_reg_write(uint32_t offset, uint64_t data, unsigned size) "TZ MPC=
 regs write: offset 0x%x data 0x%" PRIx64 " size %u"
> diff --git a/include/hw/misc/stm32f4xx_exti.h b/include/hw/misc/stm32f4xx=
_exti.h
> new file mode 100644
> index 0000000000..707036a41b
> --- /dev/null
> +++ b/include/hw/misc/stm32f4xx_exti.h
> @@ -0,0 +1,60 @@
> +/*
> + * STM32F4XX EXTI
> + *
> + * Copyright (c) 2014 Alistair Francis <alistair@alistair23.me>
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining=
 a copy
> + * of this software and associated documentation files (the "Software"),=
 to deal
> + * in the Software without restriction, including without limitation the=
 rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or =
sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be includ=
ed in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHA=
LL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR =
OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISI=
NG FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALING=
S IN
> + * THE SOFTWARE.
> + */
> +
> +#ifndef HW_STM_EXTI_H
> +#define HW_STM_EXTI_H
> +
> +#include "hw/sysbus.h"
> +#include "hw/hw.h"
> +
> +#define EXTI_IMR   0x00
> +#define EXTI_EMR   0x04
> +#define EXTI_RTSR  0x08
> +#define EXTI_FTSR  0x0C
> +#define EXTI_SWIER 0x10
> +#define EXTI_PR    0x14
> +
> +#define TYPE_STM32F4XX_EXTI "stm32f4xx-exti"
> +#define STM32F4XX_EXTI(obj) \
> +    OBJECT_CHECK(STM32F4xxExtiState, (obj), TYPE_STM32F4XX_EXTI)
> +
> +#define NUM_GPIO_EVENT_IN_LINES 16
> +#define NUM_INTERRUPT_OUT_LINES 16
> +
> +typedef struct {
> +    SysBusDevice parent_obj;
> +
> +    MemoryRegion mmio;
> +
> +    uint32_t exti_imr;
> +    uint32_t exti_emr;
> +    uint32_t exti_rtsr;
> +    uint32_t exti_ftsr;
> +    uint32_t exti_swier;
> +    uint32_t exti_pr;
> +
> +    qemu_irq irq[NUM_INTERRUPT_OUT_LINES];
> +} STM32F4xxExtiState;
> +
> +#endif
>=20

