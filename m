Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp1736667lff;
        Sun, 19 Jan 2020 10:37:19 -0800 (PST)
X-Google-Smtp-Source: APXvYqw9Icq4mAi93ao7tjrjDc2ZTMsH+2PLV/40ybXMyOUYWWPnq47w4YMYy4BlkefBO9N9RHNk
X-Received: by 2002:aa7:cb44:: with SMTP id w4mr13799652edt.347.1579459039010;
        Sun, 19 Jan 2020 10:37:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579459039; cv=none;
        d=google.com; s=arc-20160816;
        b=JaSN+m05AjTHKtxBiJe0P4X3A2HM/VD2FZqIcsHTk7LDmkAccSJVmagB+ytdbKRlG/
         GnrpLTfiIOCSxNch6W6KRV1uk9l+ppfANEPUgiE3EUpr3s3nR6KtvGsqjvQG6bfQxwOs
         Hxhc1guQIPRLQZlEYpF36i3MCfsIjw2+jn9fjfJsfaRilOljl+dICilkeKrsUHcHCkMq
         lahtRLSq63Tw25b0KWmE059keBLZ77Q92YfXDOeors9E2c6s4+dD+dc+YjviXmUeQbAS
         lnHOxJijyVu7sA+PJT4X+E32kQswDcGEX6W3P1EDTDwVCS8DfxtekJqETMGXobKkfkDZ
         RJKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=i9BA6WfuNXBnAmfDFj6OaOwiRAD9bLAoawJ1Gl2h1X0=;
        b=J9DC65ZYj7TrS0ISZSveUaSgrTQdyJ+xst88jba8+1hiZ2X1418eTlNevmQqNkrE0B
         sqL5uVOuUyBwWILQNcaGgm116/Y8L3RnTDxvdsfIbmKHRUHAxlwVljJzXRuqxDQGyfFF
         icbvqJVR53haeY2TSwe99k+OzMtIxLYDi+PsGU0BxVF9G7jCjPFcH5+/VIU/eM9aUNDo
         uY1BrEh0FkdrzfqB/occFS16Q5zRrGaA2Radkyx2S7FijVlUl11NkJt9Ct2/w6DFl/br
         vvWAVyKcQRzHL408K3RP0FhOG4r1Pkzdar9/ze8DpoKUG7MFkj6MHdA1QM2K9WqKxTT3
         Rqyg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=B2FjUMvY;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id m6si21879422ede.122.2020.01.19.10.37.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 19 Jan 2020 10:37:18 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) client-ip=207.211.31.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=B2FjUMvY;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579459037;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i9BA6WfuNXBnAmfDFj6OaOwiRAD9bLAoawJ1Gl2h1X0=;
	b=B2FjUMvYurQdK567Tp2ZgDYC1kibYW5daR6Altg8wFlbZJmml+q9oiL7XnQbrocmXDdB9T
	AGJgV48QM4oC67elmPwxAS4oL3Vd+cr5fXJuyxKwflDuX+KlDJd8vdaL5TYtPjU3pKNca7
	60237cvvpB+qKPV0KJg36MzFoNjQ7hQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-rIAX494FNY6ikWB5sIZl5g-1; Sun, 19 Jan 2020 13:37:14 -0500
Received: by mail-wr1-f72.google.com with SMTP id 90so12961528wrq.6
        for <alex.bennee@linaro.org>; Sun, 19 Jan 2020 10:37:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vyYCYGhWY+uHqUwx5Yr6FOLUl6dwICFChgYumkulRhM=;
        b=EfiO2UgJPl4G90Q6n/U4HbKnaiVBQ3R7lfrLCd71gWY9da4+IfP/JD+o33A03P2aCj
         ysGgz6T/j2Ue7sTMoal2Ypy0eXf/zrlSE795E7Smdj+QrTQq6C1VDmcrKr405oqv8Xcy
         bxBkRC7nj+wuVe8tqzP6nLTSkOX4msBvARTy66L/Y9ZwGrY0h6JDeedw6lSflSDLf2ey
         F3aPGsdU1dAs+ZoUslW2Jx2hfVuXoBtR4Csbv4le0ePwWRtvRCDvMt8FxL0nY7UDir3m
         AD836DZl9kGHIg5qlpdvVsr9j0wWW0iA54YH5xQwy3o4U0Sl7EsCvwhSPUjxMHXGS12T
         JM2w==
X-Gm-Message-State: APjAAAXDQvqfL4zzdh5rcFlioB6MeIVvt8DIfsxXeh9r6Kx78BNcOhbp
	8hGJXzsoJciVxiTs3h55/iWBhjRCte9vFHTuxU4kQfTtzEUp6ZFvS+Bm3NG216cwuOF4pRSaYpZ
	Uo3ETnkNA091T2QKN
X-Received: by 2002:adf:9c8f:: with SMTP id d15mr14839140wre.390.1579459033513;
        Sun, 19 Jan 2020 10:37:13 -0800 (PST)
X-Received: by 2002:adf:9c8f:: with SMTP id d15mr14839132wre.390.1579459033254;
        Sun, 19 Jan 2020 10:37:13 -0800 (PST)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.35] (113.red-83-57-172.dynamicip.rima-tde.net. [83.57.172.113])
        by smtp.gmail.com with ESMTPSA id x18sm44638962wrr.75.2020.01.19.10.37.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jan 2020 10:37:12 -0800 (PST)
Subject: Re: [PATCH v4 04/20] hw/arm/allwinner-h3: add USB host controller
To: Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, b.galvani@gmail.com,
 jasowang@redhat.com, alex.bennee@linaro.org, imammedo@redhat.com
References: <20200119005102.3847-1-nieklinnenbank@gmail.com>
 <20200119005102.3847-5-nieklinnenbank@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <39b5cc92-df42-50a4-72ba-10850aa00b04@redhat.com>
Date: Sun, 19 Jan 2020 19:37:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200119005102.3847-5-nieklinnenbank@gmail.com>
Content-Language: en-US
X-MC-Unique: rIAX494FNY6ikWB5sIZl5g-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TUID: CNjDIYpc9GN/

On 1/19/20 1:50 AM, Niek Linnenbank wrote:
> The Allwinner H3 System on Chip contains multiple USB 2.0 bus
> connections which provide software access using the Enhanced
> Host Controller Interface (EHCI) and Open Host Controller
> Interface (OHCI) interfaces. This commit adds support for
> both interfaces in the Allwinner H3 System on Chip.
>=20
> Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
> Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>   hw/usb/hcd-ehci.h             |  1 +
>   include/hw/arm/allwinner-h3.h |  8 ++++++
>   hw/arm/allwinner-h3.c         | 52 ++++++++++++++++++++++++++++++++---
>   hw/usb/hcd-ehci-sysbus.c      | 17 ++++++++++++
>   4 files changed, 74 insertions(+), 4 deletions(-)
>=20
> diff --git a/hw/usb/hcd-ehci.h b/hw/usb/hcd-ehci.h
> index 0298238f0b..edb59311c4 100644
> --- a/hw/usb/hcd-ehci.h
> +++ b/hw/usb/hcd-ehci.h
> @@ -342,6 +342,7 @@ typedef struct EHCIPCIState {
>   #define TYPE_SYS_BUS_EHCI "sysbus-ehci-usb"
>   #define TYPE_PLATFORM_EHCI "platform-ehci-usb"
>   #define TYPE_EXYNOS4210_EHCI "exynos4210-ehci-usb"
> +#define TYPE_AW_H3_EHCI "aw-h3-ehci-usb"
>   #define TYPE_TEGRA2_EHCI "tegra2-ehci-usb"
>   #define TYPE_PPC4xx_EHCI "ppc4xx-ehci-usb"
>   #define TYPE_FUSBH200_EHCI "fusbh200-ehci-usb"
> diff --git a/include/hw/arm/allwinner-h3.h b/include/hw/arm/allwinner-h3.=
h
> index abdc20871a..4f4dcbcd17 100644
> --- a/include/hw/arm/allwinner-h3.h
> +++ b/include/hw/arm/allwinner-h3.h
> @@ -56,6 +56,14 @@ enum {
>       AW_H3_SRAM_A1,
>       AW_H3_SRAM_A2,
>       AW_H3_SRAM_C,
> +    AW_H3_EHCI0,
> +    AW_H3_OHCI0,
> +    AW_H3_EHCI1,
> +    AW_H3_OHCI1,
> +    AW_H3_EHCI2,
> +    AW_H3_OHCI2,
> +    AW_H3_EHCI3,
> +    AW_H3_OHCI3,
>       AW_H3_CCU,
>       AW_H3_PIT,
>       AW_H3_UART0,
> diff --git a/hw/arm/allwinner-h3.c b/hw/arm/allwinner-h3.c
> index 8df8e3e05e..f360625ee9 100644
> --- a/hw/arm/allwinner-h3.c
> +++ b/hw/arm/allwinner-h3.c
> @@ -28,6 +28,7 @@
>   #include "hw/sysbus.h"
>   #include "hw/char/serial.h"
>   #include "hw/misc/unimp.h"
> +#include "hw/usb/hcd-ehci.h"
>   #include "sysemu/sysemu.h"
>   #include "hw/arm/allwinner-h3.h"
>  =20
> @@ -36,6 +37,14 @@ const hwaddr allwinner_h3_memmap[] =3D {
>       [AW_H3_SRAM_A1]    =3D 0x00000000,
>       [AW_H3_SRAM_A2]    =3D 0x00044000,
>       [AW_H3_SRAM_C]     =3D 0x00010000,
> +    [AW_H3_EHCI0]      =3D 0x01c1a000,
> +    [AW_H3_OHCI0]      =3D 0x01c1a400,
> +    [AW_H3_EHCI1]      =3D 0x01c1b000,
> +    [AW_H3_OHCI1]      =3D 0x01c1b400,
> +    [AW_H3_EHCI2]      =3D 0x01c1c000,
> +    [AW_H3_OHCI2]      =3D 0x01c1c400,
> +    [AW_H3_EHCI3]      =3D 0x01c1d000,
> +    [AW_H3_OHCI3]      =3D 0x01c1d400,
>       [AW_H3_CCU]        =3D 0x01c20000,
>       [AW_H3_PIT]        =3D 0x01c20c00,
>       [AW_H3_UART0]      =3D 0x01c28000,
> @@ -73,10 +82,10 @@ struct AwH3Unimplemented {
>       { "msgbox",    0x01c17000, 4 * KiB },
>       { "spinlock",  0x01c18000, 4 * KiB },
>       { "usb0-otg",  0x01c19000, 4 * KiB },
> -    { "usb0",      0x01c1a000, 4 * KiB },
> -    { "usb1",      0x01c1b000, 4 * KiB },
> -    { "usb2",      0x01c1c000, 4 * KiB },
> -    { "usb3",      0x01c1d000, 4 * KiB },
> +    { "usb0-phy",  0x01c1a000, 4 * KiB },
> +    { "usb1-phy",  0x01c1b000, 4 * KiB },
> +    { "usb2-phy",  0x01c1c000, 4 * KiB },
> +    { "usb3-phy",  0x01c1d000, 4 * KiB },

As in v3 comment, this can be done in patch #1.

Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

>       { "smc",       0x01c1e000, 4 * KiB },
>       { "pio",       0x01c20800, 1 * KiB },
>       { "owa",       0x01c21000, 1 * KiB },
> @@ -144,6 +153,14 @@ enum {
>       AW_H3_GIC_SPI_UART3     =3D  3,
>       AW_H3_GIC_SPI_TIMER0    =3D 18,
>       AW_H3_GIC_SPI_TIMER1    =3D 19,
> +    AW_H3_GIC_SPI_EHCI0     =3D 72,
> +    AW_H3_GIC_SPI_OHCI0     =3D 73,
> +    AW_H3_GIC_SPI_EHCI1     =3D 74,
> +    AW_H3_GIC_SPI_OHCI1     =3D 75,
> +    AW_H3_GIC_SPI_EHCI2     =3D 76,
> +    AW_H3_GIC_SPI_OHCI2     =3D 77,
> +    AW_H3_GIC_SPI_EHCI3     =3D 78,
> +    AW_H3_GIC_SPI_OHCI3     =3D 79,
>   };
>  =20
>   /* Allwinner H3 general constants */
> @@ -284,6 +301,33 @@ static void allwinner_h3_realize(DeviceState *dev, E=
rror **errp)
>       qdev_init_nofail(DEVICE(&s->ccu));
>       sysbus_mmio_map(SYS_BUS_DEVICE(&s->ccu), 0, s->memmap[AW_H3_CCU]);
>  =20
> +    /* Universal Serial Bus */
> +    sysbus_create_simple(TYPE_AW_H3_EHCI, s->memmap[AW_H3_EHCI0],
> +                         qdev_get_gpio_in(DEVICE(&s->gic),
> +                                          AW_H3_GIC_SPI_EHCI0));
> +    sysbus_create_simple(TYPE_AW_H3_EHCI, s->memmap[AW_H3_EHCI1],
> +                         qdev_get_gpio_in(DEVICE(&s->gic),
> +                                          AW_H3_GIC_SPI_EHCI1));
> +    sysbus_create_simple(TYPE_AW_H3_EHCI, s->memmap[AW_H3_EHCI2],
> +                         qdev_get_gpio_in(DEVICE(&s->gic),
> +                                          AW_H3_GIC_SPI_EHCI2));
> +    sysbus_create_simple(TYPE_AW_H3_EHCI, s->memmap[AW_H3_EHCI3],
> +                         qdev_get_gpio_in(DEVICE(&s->gic),
> +                                          AW_H3_GIC_SPI_EHCI3));
> +
> +    sysbus_create_simple("sysbus-ohci", s->memmap[AW_H3_OHCI0],
> +                         qdev_get_gpio_in(DEVICE(&s->gic),
> +                                          AW_H3_GIC_SPI_OHCI0));
> +    sysbus_create_simple("sysbus-ohci", s->memmap[AW_H3_OHCI1],
> +                         qdev_get_gpio_in(DEVICE(&s->gic),
> +                                          AW_H3_GIC_SPI_OHCI1));
> +    sysbus_create_simple("sysbus-ohci", s->memmap[AW_H3_OHCI2],
> +                         qdev_get_gpio_in(DEVICE(&s->gic),
> +                                          AW_H3_GIC_SPI_OHCI2));
> +    sysbus_create_simple("sysbus-ohci", s->memmap[AW_H3_OHCI3],
> +                         qdev_get_gpio_in(DEVICE(&s->gic),
> +                                          AW_H3_GIC_SPI_OHCI3));
> +
>       /* UART0. For future clocktree API: All UARTS are connected to APB2=
_CLK. */
>       serial_mm_init(get_system_memory(), s->memmap[AW_H3_UART0], 2,
>                      qdev_get_gpio_in(DEVICE(&s->gic), AW_H3_GIC_SPI_UART=
0),
> diff --git a/hw/usb/hcd-ehci-sysbus.c b/hw/usb/hcd-ehci-sysbus.c
> index 020211fd10..174c3446ef 100644
> --- a/hw/usb/hcd-ehci-sysbus.c
> +++ b/hw/usb/hcd-ehci-sysbus.c
> @@ -145,6 +145,22 @@ static const TypeInfo ehci_exynos4210_type_info =3D =
{
>       .class_init    =3D ehci_exynos4210_class_init,
>   };
>  =20
> +static void ehci_aw_h3_class_init(ObjectClass *oc, void *data)
> +{
> +    SysBusEHCIClass *sec =3D SYS_BUS_EHCI_CLASS(oc);
> +    DeviceClass *dc =3D DEVICE_CLASS(oc);
> +
> +    sec->capsbase =3D 0x0;
> +    sec->opregbase =3D 0x10;
> +    set_bit(DEVICE_CATEGORY_USB, dc->categories);
> +}
> +
> +static const TypeInfo ehci_aw_h3_type_info =3D {
> +    .name          =3D TYPE_AW_H3_EHCI,
> +    .parent        =3D TYPE_SYS_BUS_EHCI,
> +    .class_init    =3D ehci_aw_h3_class_init,
> +};
> +
>   static void ehci_tegra2_class_init(ObjectClass *oc, void *data)
>   {
>       SysBusEHCIClass *sec =3D SYS_BUS_EHCI_CLASS(oc);
> @@ -267,6 +283,7 @@ static void ehci_sysbus_register_types(void)
>       type_register_static(&ehci_platform_type_info);
>       type_register_static(&ehci_xlnx_type_info);
>       type_register_static(&ehci_exynos4210_type_info);
> +    type_register_static(&ehci_aw_h3_type_info);
>       type_register_static(&ehci_tegra2_type_info);
>       type_register_static(&ehci_ppc4xx_type_info);
>       type_register_static(&ehci_fusbh200_type_info);
>=20
