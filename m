Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp788156ejb;
        Sat, 25 Mar 2023 14:22:40 -0700 (PDT)
X-Google-Smtp-Source: AK7set+ija992s1GccASc0hLzr/J57sh70AQ6vKWHW5YqZP2rhl2GbiAbgpymIPUgcGLzHm/jTP/
X-Received: by 2002:ac8:7f54:0:b0:3ba:1d8d:f6d0 with SMTP id g20-20020ac87f54000000b003ba1d8df6d0mr13796834qtk.23.1679779359824;
        Sat, 25 Mar 2023 14:22:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1679779359; cv=none;
        d=google.com; s=arc-20160816;
        b=iDkHGfZ+o0rSxcBzTjLSiDwKdKm4auhC5SwKbtPmhCJ4jBlF+H8CoHVh7GPWkuhNF9
         eNEYqE7hKpDOoU/0PDFZqZyB/6hjNEv3aCRa+xCJbnZzePslgMJKdeIBot8hr01h9xpJ
         MihYnjqGqt1SiGhFzoxoZm2e7ceYb0QwD0D/MjwnwEbFY7i6YmVdDIchhg4c8kmEXxfS
         wPM4P5FegswCKivS5jJs91CzL6mWvTVSNNyb8YbiQ2x/qhVUTgPej/dw+bdyk28mCN1p
         1DfNtNgvnu9v1D1KtURWx7jsFx+QEBxxYp1UARZIbpQDUi5R3Q2QCG7zW8EAax+HGlf2
         GFyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=mF131ag9Dsw68axd7k3oMIFlaltnVAgjjKD/isc7iE8=;
        b=o7jaG+tfyrPUt59qmwtymABy1Xs8Wfu+fp0D3d2Y+P7VpW7jYCjzrGumUOfVhDWFQh
         0CNQ61mmNLwvX2q8FChhheQOvLQundxeS/DMPmPeowavlWxg/wFvoqxHnXeeKJ7vds4A
         aUfR/LxPwqXlbfHrKYapy97a64KxH3cXwjb/v1tiQi0jdRyEWckuuMwO84j5pENp++4Z
         qrMvqdNsPM5mXYV49eD82oAgUlh3f/1hVPQ+CkjrGUvJZ7w6n+PRTZzmVb2ync8XdN25
         cg394MZSWlfmL8e0PNX5K4EwtFnOrCHvmZspMuCWexr/NjcFUWKFJTGBCN5ApoiUvgQ3
         gVwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=bvZgGcXi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u20-20020a37ab14000000b00746aa3d54e2si7207152qke.430.2023.03.25.14.22.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 25 Mar 2023 14:22:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=bvZgGcXi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pgBKu-00044s-6X; Sat, 25 Mar 2023 17:22:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1pgBKs-00044N-T2; Sat, 25 Mar 2023 17:22:02 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1pgBKq-00070J-W5; Sat, 25 Mar 2023 17:22:02 -0400
Received: by mail-ed1-x532.google.com with SMTP id i5so21432741eda.0;
 Sat, 25 Mar 2023 14:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679779319;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mF131ag9Dsw68axd7k3oMIFlaltnVAgjjKD/isc7iE8=;
 b=bvZgGcXi6iIVgLhG+H1VNrZej/iBUPZdh0dgUZAq0z4pgJ5OevU6jc/9WMQ7O9rNwv
 UPjSVRmNe06COWDC401Jp5GflSqBqWqnUKVseIE+AewO4MBtTDnrPT2lS+RXk7AtqhjW
 lYkrZ/ll2L4B1R7Q39L/P7vGZPYoS2bEGtGqpxpLIb5miIhavydsKRv6SJXQ9fDnO8ts
 hndBVjISY4+nV6DhqvQ2K1rnL6fo2B09qwcesjexkXXIYp6W2ySbqd7SJkdUTpi45z22
 uRc1iVk6EhtTjRESmmLAn9pvaKMgY75cSKnABHXCTlilo7UMYtA0oIHosfCOz2k9k9t5
 gEUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679779319;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mF131ag9Dsw68axd7k3oMIFlaltnVAgjjKD/isc7iE8=;
 b=CDMjwqrY6xnY3Oo5f7/u9mwkHySFNwKoI9+b+URfgRnhy98y4vvxnNBqlk9OiXWoC1
 zdaR8rNTduUa0GN/ZKmHEy9Ba3qZNk82izOOhR7ZzlLMaP2U1c7XLMD6TsyNd1mgQxnp
 evJIxkGjB14u50Bt9bcU3y2nMfgkkuAtd6ilJp1u3y7F6mD5vMxxPQNJwYqIOHsrYIRG
 zsX0KSkPKpIDc2Y35vJBN2Cujw4zBRS/uY5aTA4rYGtvI4PXr8lsx7lkaPx6n9B8q1YC
 2rAbwyFIeW6WidCN6l0mL8V7bYHtM4qPpPyIqd0uaft6CmtIXZ6Et9V3IdG2mHyrINzd
 ROKA==
X-Gm-Message-State: AAQBX9clfqexkjd4PEScqN/nSpDVlzL8+JMJdJjNABSj0CyqKpXIiWjp
 DmHLccxPfGD2YEKhovy3bikvQuGemq6z0nAbDSQ=
X-Received: by 2002:a50:9e8e:0:b0:4fa:4bc4:ad5b with SMTP id
 a14-20020a509e8e000000b004fa4bc4ad5bmr3641666edf.6.1679779318935; Sat, 25 Mar
 2023 14:21:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230321102510.16754-1-qianfanguijin@163.com>
 <20230321102510.16754-5-qianfanguijin@163.com>
In-Reply-To: <20230321102510.16754-5-qianfanguijin@163.com>
From: Strahinja Jankovic <strahinjapjankovic@gmail.com>
Date: Sat, 25 Mar 2023 22:21:50 +0100
Message-ID: <CABtshVT-tWjf5kYp=3hNmg13gwVQJxxoxMDZPVTneea8phRFrA@mail.gmail.com>
Subject: Re: [PATCH v1 04/11] hw: arm: allwinner-r40: Add 5 TWI controllers
To: qianfanguijin@163.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Niek Linnenbank <nieklinnenbank@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=strahinjapjankovic@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-TUID: /qYQFna6BrHV

Hi,

On Tue, Mar 21, 2023 at 11:25=E2=80=AFAM <qianfanguijin@163.com> wrote:
>
> From: qianfan Zhao <qianfanguijin@163.com>
>
> TWI(i2c) is designed to be used as an interface between CPU host and the
> serial 2-Wire bus. It can support all standard 2-Wire transfer, can be
> operated in standard mode(100kbit/s) or fast-mode, supporting data rate
> up to 400kbit/s.
>
> Signed-off-by: qianfan Zhao <qianfanguijin@163.com>
> ---
>  hw/arm/allwinner-r40.c         | 47 ++++++++++++++++++++++++++++++----
>  include/hw/arm/allwinner-r40.h | 11 ++++++++
>  2 files changed, 53 insertions(+), 5 deletions(-)
>
> diff --git a/hw/arm/allwinner-r40.c b/hw/arm/allwinner-r40.c
> index fde01783b1..9fa23e1f33 100644
> --- a/hw/arm/allwinner-r40.c
> +++ b/hw/arm/allwinner-r40.c
> @@ -52,6 +52,11 @@ const hwaddr allwinner_r40_memmap[] =3D {
>      [AW_R40_DEV_UART5]      =3D 0x01c29400,
>      [AW_R40_DEV_UART6]      =3D 0x01c29800,
>      [AW_R40_DEV_UART7]      =3D 0x01c29c00,
> +    [AW_R40_DEV_TWI0]       =3D 0x01c2ac00,
> +    [AW_R40_DEV_TWI1]       =3D 0x01c2b000,
> +    [AW_R40_DEV_TWI2]       =3D 0x01c2b400,
> +    [AW_R40_DEV_TWI3]       =3D 0x01c2b800,
> +    [AW_R40_DEV_TWI4]       =3D 0x01c2c000,
>      [AW_R40_DEV_GIC_DIST]   =3D 0x01c81000,
>      [AW_R40_DEV_GIC_CPU]    =3D 0x01c82000,
>      [AW_R40_DEV_GIC_HYP]    =3D 0x01c84000,
> @@ -115,11 +120,6 @@ static struct AwR40Unimplemented r40_unimplemented[]=
 =3D {
>      { "uart7",      0x01c29c00, 1 * KiB },
>      { "ps20",       0x01c2a000, 1 * KiB },
>      { "ps21",       0x01c2a400, 1 * KiB },
> -    { "twi0",       0x01c2ac00, 1 * KiB },
> -    { "twi1",       0x01c2b000, 1 * KiB },
> -    { "twi2",       0x01c2b400, 1 * KiB },
> -    { "twi3",       0x01c2b800, 1 * KiB },
> -    { "twi4",       0x01c2c000, 1 * KiB },
>      { "scr",        0x01c2c400, 1 * KiB },
>      { "tvd-top",    0x01c30000, 4 * KiB },
>      { "tvd0",       0x01c31000, 4 * KiB },
> @@ -167,6 +167,9 @@ enum {
>      AW_R40_GIC_SPI_UART1     =3D  2,
>      AW_R40_GIC_SPI_UART2     =3D  3,
>      AW_R40_GIC_SPI_UART3     =3D  4,
> +    AW_R40_GIC_SPI_TWI0      =3D  7,
> +    AW_R40_GIC_SPI_TWI1      =3D  8,
> +    AW_R40_GIC_SPI_TWI2      =3D  9,
>      AW_R40_GIC_SPI_UART4     =3D 17,
>      AW_R40_GIC_SPI_UART5     =3D 18,
>      AW_R40_GIC_SPI_UART6     =3D 19,
> @@ -177,6 +180,8 @@ enum {
>      AW_R40_GIC_SPI_MMC1      =3D 33,
>      AW_R40_GIC_SPI_MMC2      =3D 34,
>      AW_R40_GIC_SPI_MMC3      =3D 35,
> +    AW_R40_GIC_SPI_TWI3      =3D 88,
> +    AW_R40_GIC_SPI_TWI4      =3D 89,
>  };
>
>  /* Allwinner R40 general constants */
> @@ -262,6 +267,12 @@ static void allwinner_r40_init(Object *obj)
>      object_initialize_child(obj, "mmc1", &s->mmc1, TYPE_AW_SDHOST_SUN5I)=
;
>      object_initialize_child(obj, "mmc2", &s->mmc2, TYPE_AW_SDHOST_SUN5I)=
;
>      object_initialize_child(obj, "mmc3", &s->mmc3, TYPE_AW_SDHOST_SUN5I)=
;
> +
> +    object_initialize_child(obj, "twi0", &s->i2c0, TYPE_AW_I2C_SUN6I);
> +    object_initialize_child(obj, "twi1", &s->i2c1, TYPE_AW_I2C_SUN6I);
> +    object_initialize_child(obj, "twi2", &s->i2c2, TYPE_AW_I2C_SUN6I);
> +    object_initialize_child(obj, "twi3", &s->i2c3, TYPE_AW_I2C_SUN6I);
> +    object_initialize_child(obj, "twi4", &s->i2c4, TYPE_AW_I2C_SUN6I);
>  }
>
>  static void allwinner_r40_realize(DeviceState *dev, Error **errp)
> @@ -429,6 +440,32 @@ static void allwinner_r40_realize(DeviceState *dev, =
Error **errp)
>                     qdev_get_gpio_in(DEVICE(&s->gic), AW_R40_GIC_SPI_UART=
7),
>                     115200, serial_hd(7), DEVICE_NATIVE_ENDIAN);
>
> +    /* I2C */
> +    sysbus_realize(SYS_BUS_DEVICE(&s->i2c0), &error_fatal);
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->i2c0), 0, s->memmap[AW_R40_DEV_TW=
I0]);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c0), 0,
> +                       qdev_get_gpio_in(DEVICE(&s->gic), AW_R40_GIC_SPI_=
TWI0));
> +
> +    sysbus_realize(SYS_BUS_DEVICE(&s->i2c1), &error_fatal);
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->i2c1), 0, s->memmap[AW_R40_DEV_TW=
I1]);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c1), 0,
> +                       qdev_get_gpio_in(DEVICE(&s->gic), AW_R40_GIC_SPI_=
TWI1));
> +
> +    sysbus_realize(SYS_BUS_DEVICE(&s->i2c2), &error_fatal);
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->i2c2), 0, s->memmap[AW_R40_DEV_TW=
I2]);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c2), 0,
> +                       qdev_get_gpio_in(DEVICE(&s->gic), AW_R40_GIC_SPI_=
TWI2));
> +
> +    sysbus_realize(SYS_BUS_DEVICE(&s->i2c3), &error_fatal);
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->i2c3), 0, s->memmap[AW_R40_DEV_TW=
I3]);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c3), 0,
> +                       qdev_get_gpio_in(DEVICE(&s->gic), AW_R40_GIC_SPI_=
TWI3));
> +
> +    sysbus_realize(SYS_BUS_DEVICE(&s->i2c4), &error_fatal);
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->i2c4), 0, s->memmap[AW_R40_DEV_TW=
I4]);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c4), 0,
> +                       qdev_get_gpio_in(DEVICE(&s->gic), AW_R40_GIC_SPI_=
TWI4));
> +
>      /* Unimplemented devices */
>      for (i =3D 0; i < ARRAY_SIZE(r40_unimplemented); i++) {
>          create_unimplemented_device(r40_unimplemented[i].device_name,
> diff --git a/include/hw/arm/allwinner-r40.h b/include/hw/arm/allwinner-r4=
0.h
> index dfb5eb609c..6a7e5c1e31 100644
> --- a/include/hw/arm/allwinner-r40.h
> +++ b/include/hw/arm/allwinner-r40.h
> @@ -26,6 +26,7 @@
>  #include "hw/intc/arm_gic.h"
>  #include "hw/sd/allwinner-sdhost.h"
>  #include "hw/misc/allwinner-r40-ccu.h"
> +#include "hw/i2c/allwinner-i2c.h"
>  #include "target/arm/cpu.h"
>  #include "sysemu/block-backend.h"
>
> @@ -48,6 +49,11 @@ enum {
>      AW_R40_DEV_UART5,
>      AW_R40_DEV_UART6,
>      AW_R40_DEV_UART7,
> +    AW_R40_DEV_TWI0,
> +    AW_R40_DEV_TWI1,
> +    AW_R40_DEV_TWI2,
> +    AW_R40_DEV_TWI3,
> +    AW_R40_DEV_TWI4,
>      AW_R40_DEV_GIC_DIST,
>      AW_R40_DEV_GIC_CPU,
>      AW_R40_DEV_GIC_HYP,
> @@ -89,6 +95,11 @@ struct AwR40State {
>      AwSdHostState mmc2;
>      AwSdHostState mmc3;
>      AwR40ClockCtlState ccu;
> +    AWI2CState i2c0;
> +    AWI2CState i2c1;
> +    AWI2CState i2c2;
> +    AWI2CState i2c3;
> +    AWI2CState i2c4;

I am not sure what is the benefit of having all 5 I2C controllers
emulated? Unlike UARTs, where a user can decide at runtime how many
will be used, for I2C the decision is made at compile time.
Thus, I would suggest only creating those that have peripherals that
are emulated attached to them.

Best regards,
Strahinja


>      GICState gic;
>      MemoryRegion sram_a1;
>      MemoryRegion sram_a2;
> --
> 2.25.1
>
