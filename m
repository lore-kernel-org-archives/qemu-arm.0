Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp3138890lfp;
        Sun, 2 Feb 2020 11:12:48 -0800 (PST)
X-Received: by 2002:a05:6602:210a:: with SMTP id x10mr16334215iox.151.1580670768753;
        Sun, 02 Feb 2020 11:12:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580670768; cv=none;
        d=google.com; s=arc-20160816;
        b=Z8IqZPSwXrEAmvZ55aPZCM+ZaAMwTumgsyGzSLNl/Ua9xJ80FU0TONhC+ZcT0giJd/
         8X5GRsYtdDOxnJP3/BEr4cSDWFzbCTSTqe6F5oaISHbpK0xhrf5sqo7Q7Kgi99EtRu6v
         CiQzu3VkNTW1u7GjyIXCeo6xKWogMDmjLCWVq5h8uyfKvH1q93meXcBxnuJCzRQcxDKT
         IGvxdspHF0URQ9aeH+SGjjcDVPPZ4ocmHEzre/uruG6biym7o5j5X82C5m4HOlFuTm4x
         LIiDj2oF+wSDZh+VOJthlOZgJITdMmvmA0bye5u8KQX2c4Z9NraGHJ3fRPkyjHYgP0Q8
         BCFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WE281d5ljjNya0jElG6lulRNZasLBxUVQgJBPJ/8SZE=;
        b=TAbLd5TksSIH4W8DBSbh2cYEOrsxZ1/RRlL4BH+SAUt46jPxNG0YU4r6nUzOzhmKX/
         ZLDmG34QVI9S+2yEOfuiWqVmIz4Zl05yKWGsRXCIIjwhrH0CHbTpLYvm4qzzSFtlQr83
         PnXW50rOowHyiv8NXs50ds5reAzv6tClmB5zHRZuY060ZLU12cbFuA5R/lvsX1ei4UKG
         r6m6KFEv/yPNqdQWwsPIt/MLxXAjblxZrf/EZq7jB04MgzhjkAptWRJCOjIEO8r79UOS
         lSgQvbsCpj1xlHM+JvTuerbYVQPVcH+ALa3blk58KiEIq52W4E5Ep5AjcrXjcvYzyyMT
         bnOw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=t61juFSG;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <nieklinnenbank@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id u10sor24233270jah.14.2020.02.02.11.12.48
        (Google Transport Security);
        Sun, 02 Feb 2020 11:12:48 -0800 (PST)
Received-SPF: pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=t61juFSG;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WE281d5ljjNya0jElG6lulRNZasLBxUVQgJBPJ/8SZE=;
        b=t61juFSG3DSqk7wCzDZPQ0dgR0V6Ef3wiILcV+/XV+ubSYXDRI9AWCIHuNvy1j3RBT
         LxYzd9A9bD0ExtnfNKi/pBLjatZwPvy5e1Zn/u7PZF8xDHSILTjKolHvrhb8f3YBUN/L
         6mDrRDNbYNx0Sb/WX+V6fTfV1K2KmBPMzN1E/e1xfpQtlYK+TX0qJ0EiND/4ZKjf3S50
         wJaHfuYqQSVj0gKnriWWaNV+XFZEUzzoTOCZBlHR19UfwOTvK/a1KBremIH87ZFdcdQJ
         6ZY4gJuqZXLhZ+ct7JohVH/6MhdYUxYyO5SaPCp7JasLUPHHnTpLLj3ysSgX8Ti15Vzj
         lk6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WE281d5ljjNya0jElG6lulRNZasLBxUVQgJBPJ/8SZE=;
        b=kovdVEjyqcaatmwYQCgdk/SeEmZb/zh4tO1wuwoxMqgHYlpPCeTcBtO12t1aetX/TN
         eYtHL4VD9VQeiXZfp19qvZitCodR5pBqYMPz5EPnH3UwuwqRwjy8Mcl17qybgrniISUx
         tOOeGQypxhm8wz2MOqMfNjml09/GSlpsFk2EKU9Z4HAW2iGae87kkiCIAwl7+VQE0aYv
         oxmXVv6sF7erui42mFjGA6zsLDw3RJ0kS37RmAmKC30GKr5Y2cGy0pNKVn1XFWxbRSbv
         gkQNEmtTkEuoNd9ni+Gke856x6tiIulxiWzdg4c4ScA5PGfSE+xPGKl+eGNa38zk3Znl
         0omg==
X-Gm-Message-State: APjAAAWFRdAkFyTzWbgweDkmY/SS21kBAKFS4pbqbduGVCtPA4lMIElE
	OSHnDIwTQofg4jUuSlYSZUK7xztDOZ3Gv/agaCQ=
X-Google-Smtp-Source: APXvYqxDwZvSBSn3zwnc2WI1/rTgWu0rMrTgLcz69qQr1p/ZETyN2daO/lilxgWhYyTvuyIc3OPUYJhyfGjLj0TlHIg=
X-Received: by 2002:a02:856a:: with SMTP id g97mr16426021jai.97.1580670768193;
 Sun, 02 Feb 2020 11:12:48 -0800 (PST)
MIME-Version: 1.0
References: <20200119005102.3847-1-nieklinnenbank@gmail.com>
 <20200119005102.3847-5-nieklinnenbank@gmail.com> <39b5cc92-df42-50a4-72ba-10850aa00b04@redhat.com>
In-Reply-To: <39b5cc92-df42-50a4-72ba-10850aa00b04@redhat.com>
From: Niek Linnenbank <nieklinnenbank@gmail.com>
Date: Sun, 2 Feb 2020 20:12:36 +0100
Message-ID: <CAPan3WoTQpm5-+Xp=6oKXtAYiVMV_+=0y+4-rg2-EH0A3i2Ytw@mail.gmail.com>
Subject: Re: [PATCH v4 04/20] hw/arm/allwinner-h3: add USB host controller
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Peter Maydell <peter.maydell@linaro.org>, Beniamino Galvani <b.galvani@gmail.com>, jasowang@redhat.com, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, imammedo@redhat.com
Content-Type: multipart/alternative; boundary="000000000000a52783059d9c977c"
X-TUID: oLyFYqWfyhVS

--000000000000a52783059d9c977c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 19, 2020 at 7:37 PM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.=
com>
wrote:

> On 1/19/20 1:50 AM, Niek Linnenbank wrote:
> > The Allwinner H3 System on Chip contains multiple USB 2.0 bus
> > connections which provide software access using the Enhanced
> > Host Controller Interface (EHCI) and Open Host Controller
> > Interface (OHCI) interfaces. This commit adds support for
> > both interfaces in the Allwinner H3 System on Chip.
> >
> > Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
> > Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
> > ---
> >   hw/usb/hcd-ehci.h             |  1 +
> >   include/hw/arm/allwinner-h3.h |  8 ++++++
> >   hw/arm/allwinner-h3.c         | 52 ++++++++++++++++++++++++++++++++--=
-
> >   hw/usb/hcd-ehci-sysbus.c      | 17 ++++++++++++
> >   4 files changed, 74 insertions(+), 4 deletions(-)
> >
> > diff --git a/hw/usb/hcd-ehci.h b/hw/usb/hcd-ehci.h
> > index 0298238f0b..edb59311c4 100644
> > --- a/hw/usb/hcd-ehci.h
> > +++ b/hw/usb/hcd-ehci.h
> > @@ -342,6 +342,7 @@ typedef struct EHCIPCIState {
> >   #define TYPE_SYS_BUS_EHCI "sysbus-ehci-usb"
> >   #define TYPE_PLATFORM_EHCI "platform-ehci-usb"
> >   #define TYPE_EXYNOS4210_EHCI "exynos4210-ehci-usb"
> > +#define TYPE_AW_H3_EHCI "aw-h3-ehci-usb"
> >   #define TYPE_TEGRA2_EHCI "tegra2-ehci-usb"
> >   #define TYPE_PPC4xx_EHCI "ppc4xx-ehci-usb"
> >   #define TYPE_FUSBH200_EHCI "fusbh200-ehci-usb"
> > diff --git a/include/hw/arm/allwinner-h3.h
> b/include/hw/arm/allwinner-h3.h
> > index abdc20871a..4f4dcbcd17 100644
> > --- a/include/hw/arm/allwinner-h3.h
> > +++ b/include/hw/arm/allwinner-h3.h
> > @@ -56,6 +56,14 @@ enum {
> >       AW_H3_SRAM_A1,
> >       AW_H3_SRAM_A2,
> >       AW_H3_SRAM_C,
> > +    AW_H3_EHCI0,
> > +    AW_H3_OHCI0,
> > +    AW_H3_EHCI1,
> > +    AW_H3_OHCI1,
> > +    AW_H3_EHCI2,
> > +    AW_H3_OHCI2,
> > +    AW_H3_EHCI3,
> > +    AW_H3_OHCI3,
> >       AW_H3_CCU,
> >       AW_H3_PIT,
> >       AW_H3_UART0,
> > diff --git a/hw/arm/allwinner-h3.c b/hw/arm/allwinner-h3.c
> > index 8df8e3e05e..f360625ee9 100644
> > --- a/hw/arm/allwinner-h3.c
> > +++ b/hw/arm/allwinner-h3.c
> > @@ -28,6 +28,7 @@
> >   #include "hw/sysbus.h"
> >   #include "hw/char/serial.h"
> >   #include "hw/misc/unimp.h"
> > +#include "hw/usb/hcd-ehci.h"
> >   #include "sysemu/sysemu.h"
> >   #include "hw/arm/allwinner-h3.h"
> >
> > @@ -36,6 +37,14 @@ const hwaddr allwinner_h3_memmap[] =3D {
> >       [AW_H3_SRAM_A1]    =3D 0x00000000,
> >       [AW_H3_SRAM_A2]    =3D 0x00044000,
> >       [AW_H3_SRAM_C]     =3D 0x00010000,
> > +    [AW_H3_EHCI0]      =3D 0x01c1a000,
> > +    [AW_H3_OHCI0]      =3D 0x01c1a400,
> > +    [AW_H3_EHCI1]      =3D 0x01c1b000,
> > +    [AW_H3_OHCI1]      =3D 0x01c1b400,
> > +    [AW_H3_EHCI2]      =3D 0x01c1c000,
> > +    [AW_H3_OHCI2]      =3D 0x01c1c400,
> > +    [AW_H3_EHCI3]      =3D 0x01c1d000,
> > +    [AW_H3_OHCI3]      =3D 0x01c1d400,
> >       [AW_H3_CCU]        =3D 0x01c20000,
> >       [AW_H3_PIT]        =3D 0x01c20c00,
> >       [AW_H3_UART0]      =3D 0x01c28000,
> > @@ -73,10 +82,10 @@ struct AwH3Unimplemented {
> >       { "msgbox",    0x01c17000, 4 * KiB },
> >       { "spinlock",  0x01c18000, 4 * KiB },
> >       { "usb0-otg",  0x01c19000, 4 * KiB },
> > -    { "usb0",      0x01c1a000, 4 * KiB },
> > -    { "usb1",      0x01c1b000, 4 * KiB },
> > -    { "usb2",      0x01c1c000, 4 * KiB },
> > -    { "usb3",      0x01c1d000, 4 * KiB },
> > +    { "usb0-phy",  0x01c1a000, 4 * KiB },
> > +    { "usb1-phy",  0x01c1b000, 4 * KiB },
> > +    { "usb2-phy",  0x01c1c000, 4 * KiB },
> > +    { "usb3-phy",  0x01c1d000, 4 * KiB },
>
> As in v3 comment, this can be done in patch #1.
>

OK, I'll rename them in patch 1, so it won't show up here.


>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>

Thanks for reviewing and testing Philippe!
Regards,
Niek


>
> >       { "smc",       0x01c1e000, 4 * KiB },
> >       { "pio",       0x01c20800, 1 * KiB },
> >       { "owa",       0x01c21000, 1 * KiB },
> > @@ -144,6 +153,14 @@ enum {
> >       AW_H3_GIC_SPI_UART3     =3D  3,
> >       AW_H3_GIC_SPI_TIMER0    =3D 18,
> >       AW_H3_GIC_SPI_TIMER1    =3D 19,
> > +    AW_H3_GIC_SPI_EHCI0     =3D 72,
> > +    AW_H3_GIC_SPI_OHCI0     =3D 73,
> > +    AW_H3_GIC_SPI_EHCI1     =3D 74,
> > +    AW_H3_GIC_SPI_OHCI1     =3D 75,
> > +    AW_H3_GIC_SPI_EHCI2     =3D 76,
> > +    AW_H3_GIC_SPI_OHCI2     =3D 77,
> > +    AW_H3_GIC_SPI_EHCI3     =3D 78,
> > +    AW_H3_GIC_SPI_OHCI3     =3D 79,
> >   };
> >
> >   /* Allwinner H3 general constants */
> > @@ -284,6 +301,33 @@ static void allwinner_h3_realize(DeviceState *dev,
> Error **errp)
> >       qdev_init_nofail(DEVICE(&s->ccu));
> >       sysbus_mmio_map(SYS_BUS_DEVICE(&s->ccu), 0, s->memmap[AW_H3_CCU])=
;
> >
> > +    /* Universal Serial Bus */
> > +    sysbus_create_simple(TYPE_AW_H3_EHCI, s->memmap[AW_H3_EHCI0],
> > +                         qdev_get_gpio_in(DEVICE(&s->gic),
> > +                                          AW_H3_GIC_SPI_EHCI0));
> > +    sysbus_create_simple(TYPE_AW_H3_EHCI, s->memmap[AW_H3_EHCI1],
> > +                         qdev_get_gpio_in(DEVICE(&s->gic),
> > +                                          AW_H3_GIC_SPI_EHCI1));
> > +    sysbus_create_simple(TYPE_AW_H3_EHCI, s->memmap[AW_H3_EHCI2],
> > +                         qdev_get_gpio_in(DEVICE(&s->gic),
> > +                                          AW_H3_GIC_SPI_EHCI2));
> > +    sysbus_create_simple(TYPE_AW_H3_EHCI, s->memmap[AW_H3_EHCI3],
> > +                         qdev_get_gpio_in(DEVICE(&s->gic),
> > +                                          AW_H3_GIC_SPI_EHCI3));
> > +
> > +    sysbus_create_simple("sysbus-ohci", s->memmap[AW_H3_OHCI0],
> > +                         qdev_get_gpio_in(DEVICE(&s->gic),
> > +                                          AW_H3_GIC_SPI_OHCI0));
> > +    sysbus_create_simple("sysbus-ohci", s->memmap[AW_H3_OHCI1],
> > +                         qdev_get_gpio_in(DEVICE(&s->gic),
> > +                                          AW_H3_GIC_SPI_OHCI1));
> > +    sysbus_create_simple("sysbus-ohci", s->memmap[AW_H3_OHCI2],
> > +                         qdev_get_gpio_in(DEVICE(&s->gic),
> > +                                          AW_H3_GIC_SPI_OHCI2));
> > +    sysbus_create_simple("sysbus-ohci", s->memmap[AW_H3_OHCI3],
> > +                         qdev_get_gpio_in(DEVICE(&s->gic),
> > +                                          AW_H3_GIC_SPI_OHCI3));
> > +
> >       /* UART0. For future clocktree API: All UARTS are connected to
> APB2_CLK. */
> >       serial_mm_init(get_system_memory(), s->memmap[AW_H3_UART0], 2,
> >                      qdev_get_gpio_in(DEVICE(&s->gic),
> AW_H3_GIC_SPI_UART0),
> > diff --git a/hw/usb/hcd-ehci-sysbus.c b/hw/usb/hcd-ehci-sysbus.c
> > index 020211fd10..174c3446ef 100644
> > --- a/hw/usb/hcd-ehci-sysbus.c
> > +++ b/hw/usb/hcd-ehci-sysbus.c
> > @@ -145,6 +145,22 @@ static const TypeInfo ehci_exynos4210_type_info =
=3D {
> >       .class_init    =3D ehci_exynos4210_class_init,
> >   };
> >
> > +static void ehci_aw_h3_class_init(ObjectClass *oc, void *data)
> > +{
> > +    SysBusEHCIClass *sec =3D SYS_BUS_EHCI_CLASS(oc);
> > +    DeviceClass *dc =3D DEVICE_CLASS(oc);
> > +
> > +    sec->capsbase =3D 0x0;
> > +    sec->opregbase =3D 0x10;
> > +    set_bit(DEVICE_CATEGORY_USB, dc->categories);
> > +}
> > +
> > +static const TypeInfo ehci_aw_h3_type_info =3D {
> > +    .name          =3D TYPE_AW_H3_EHCI,
> > +    .parent        =3D TYPE_SYS_BUS_EHCI,
> > +    .class_init    =3D ehci_aw_h3_class_init,
> > +};
> > +
> >   static void ehci_tegra2_class_init(ObjectClass *oc, void *data)
> >   {
> >       SysBusEHCIClass *sec =3D SYS_BUS_EHCI_CLASS(oc);
> > @@ -267,6 +283,7 @@ static void ehci_sysbus_register_types(void)
> >       type_register_static(&ehci_platform_type_info);
> >       type_register_static(&ehci_xlnx_type_info);
> >       type_register_static(&ehci_exynos4210_type_info);
> > +    type_register_static(&ehci_aw_h3_type_info);
> >       type_register_static(&ehci_tegra2_type_info);
> >       type_register_static(&ehci_ppc4xx_type_info);
> >       type_register_static(&ehci_fusbh200_type_info);
> >
>
>

--=20
Niek Linnenbank

--000000000000a52783059d9c977c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Jan 19, 2020 at 7:37 PM Phili=
ppe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@redhat.com">philmd@redh=
at.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On 1/19/20 1:50 AM, Niek Linnenbank wrote:<br>
&gt; The Allwinner H3 System on Chip contains multiple USB 2.0 bus<br>
&gt; connections which provide software access using the Enhanced<br>
&gt; Host Controller Interface (EHCI) and Open Host Controller<br>
&gt; Interface (OHCI) interfaces. This commit adds support for<br>
&gt; both interfaces in the Allwinner H3 System on Chip.<br>
&gt; <br>
&gt; Signed-off-by: Niek Linnenbank &lt;<a href=3D"mailto:nieklinnenbank@gm=
ail.com" target=3D"_blank">nieklinnenbank@gmail.com</a>&gt;<br>
&gt; Reviewed-by: Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com" ta=
rget=3D"_blank">kraxel@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0hw/usb/hcd-ehci.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 1 +<br>
&gt;=C2=A0 =C2=A0include/hw/arm/allwinner-h3.h |=C2=A0 8 ++++++<br>
&gt;=C2=A0 =C2=A0hw/arm/allwinner-h3.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 5=
2 ++++++++++++++++++++++++++++++++---<br>
&gt;=C2=A0 =C2=A0hw/usb/hcd-ehci-sysbus.c=C2=A0 =C2=A0 =C2=A0 | 17 ++++++++=
++++<br>
&gt;=C2=A0 =C2=A04 files changed, 74 insertions(+), 4 deletions(-)<br>
&gt; <br>
&gt; diff --git a/hw/usb/hcd-ehci.h b/hw/usb/hcd-ehci.h<br>
&gt; index 0298238f0b..edb59311c4 100644<br>
&gt; --- a/hw/usb/hcd-ehci.h<br>
&gt; +++ b/hw/usb/hcd-ehci.h<br>
&gt; @@ -342,6 +342,7 @@ typedef struct EHCIPCIState {<br>
&gt;=C2=A0 =C2=A0#define TYPE_SYS_BUS_EHCI &quot;sysbus-ehci-usb&quot;<br>
&gt;=C2=A0 =C2=A0#define TYPE_PLATFORM_EHCI &quot;platform-ehci-usb&quot;<b=
r>
&gt;=C2=A0 =C2=A0#define TYPE_EXYNOS4210_EHCI &quot;exynos4210-ehci-usb&quo=
t;<br>
&gt; +#define TYPE_AW_H3_EHCI &quot;aw-h3-ehci-usb&quot;<br>
&gt;=C2=A0 =C2=A0#define TYPE_TEGRA2_EHCI &quot;tegra2-ehci-usb&quot;<br>
&gt;=C2=A0 =C2=A0#define TYPE_PPC4xx_EHCI &quot;ppc4xx-ehci-usb&quot;<br>
&gt;=C2=A0 =C2=A0#define TYPE_FUSBH200_EHCI &quot;fusbh200-ehci-usb&quot;<b=
r>
&gt; diff --git a/include/hw/arm/allwinner-h3.h b/include/hw/arm/allwinner-=
h3.h<br>
&gt; index abdc20871a..4f4dcbcd17 100644<br>
&gt; --- a/include/hw/arm/allwinner-h3.h<br>
&gt; +++ b/include/hw/arm/allwinner-h3.h<br>
&gt; @@ -56,6 +56,14 @@ enum {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0AW_H3_SRAM_A1,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0AW_H3_SRAM_A2,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0AW_H3_SRAM_C,<br>
&gt; +=C2=A0 =C2=A0 AW_H3_EHCI0,<br>
&gt; +=C2=A0 =C2=A0 AW_H3_OHCI0,<br>
&gt; +=C2=A0 =C2=A0 AW_H3_EHCI1,<br>
&gt; +=C2=A0 =C2=A0 AW_H3_OHCI1,<br>
&gt; +=C2=A0 =C2=A0 AW_H3_EHCI2,<br>
&gt; +=C2=A0 =C2=A0 AW_H3_OHCI2,<br>
&gt; +=C2=A0 =C2=A0 AW_H3_EHCI3,<br>
&gt; +=C2=A0 =C2=A0 AW_H3_OHCI3,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0AW_H3_CCU,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0AW_H3_PIT,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0AW_H3_UART0,<br>
&gt; diff --git a/hw/arm/allwinner-h3.c b/hw/arm/allwinner-h3.c<br>
&gt; index 8df8e3e05e..f360625ee9 100644<br>
&gt; --- a/hw/arm/allwinner-h3.c<br>
&gt; +++ b/hw/arm/allwinner-h3.c<br>
&gt; @@ -28,6 +28,7 @@<br>
&gt;=C2=A0 =C2=A0#include &quot;hw/sysbus.h&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;hw/char/serial.h&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;hw/misc/unimp.h&quot;<br>
&gt; +#include &quot;hw/usb/hcd-ehci.h&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;sysemu/sysemu.h&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;hw/arm/allwinner-h3.h&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -36,6 +37,14 @@ const hwaddr allwinner_h3_memmap[] =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0[AW_H3_SRAM_A1]=C2=A0 =C2=A0 =3D 0x00000000,=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0[AW_H3_SRAM_A2]=C2=A0 =C2=A0 =3D 0x00044000,=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0[AW_H3_SRAM_C]=C2=A0 =C2=A0 =C2=A0=3D 0x0001=
0000,<br>
&gt; +=C2=A0 =C2=A0 [AW_H3_EHCI0]=C2=A0 =C2=A0 =C2=A0 =3D 0x01c1a000,<br>
&gt; +=C2=A0 =C2=A0 [AW_H3_OHCI0]=C2=A0 =C2=A0 =C2=A0 =3D 0x01c1a400,<br>
&gt; +=C2=A0 =C2=A0 [AW_H3_EHCI1]=C2=A0 =C2=A0 =C2=A0 =3D 0x01c1b000,<br>
&gt; +=C2=A0 =C2=A0 [AW_H3_OHCI1]=C2=A0 =C2=A0 =C2=A0 =3D 0x01c1b400,<br>
&gt; +=C2=A0 =C2=A0 [AW_H3_EHCI2]=C2=A0 =C2=A0 =C2=A0 =3D 0x01c1c000,<br>
&gt; +=C2=A0 =C2=A0 [AW_H3_OHCI2]=C2=A0 =C2=A0 =C2=A0 =3D 0x01c1c400,<br>
&gt; +=C2=A0 =C2=A0 [AW_H3_EHCI3]=C2=A0 =C2=A0 =C2=A0 =3D 0x01c1d000,<br>
&gt; +=C2=A0 =C2=A0 [AW_H3_OHCI3]=C2=A0 =C2=A0 =C2=A0 =3D 0x01c1d400,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0[AW_H3_CCU]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 0=
x01c20000,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0[AW_H3_PIT]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 0=
x01c20c00,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0[AW_H3_UART0]=C2=A0 =C2=A0 =C2=A0 =3D 0x01c2=
8000,<br>
&gt; @@ -73,10 +82,10 @@ struct AwH3Unimplemented {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;msgbox&quot;,=C2=A0 =C2=A0 0x01c1700=
0, 4 * KiB },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;spinlock&quot;,=C2=A0 0x01c18000, 4 =
* KiB },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;usb0-otg&quot;,=C2=A0 0x01c19000, 4 =
* KiB },<br>
&gt; -=C2=A0 =C2=A0 { &quot;usb0&quot;,=C2=A0 =C2=A0 =C2=A0 0x01c1a000, 4 *=
 KiB },<br>
&gt; -=C2=A0 =C2=A0 { &quot;usb1&quot;,=C2=A0 =C2=A0 =C2=A0 0x01c1b000, 4 *=
 KiB },<br>
&gt; -=C2=A0 =C2=A0 { &quot;usb2&quot;,=C2=A0 =C2=A0 =C2=A0 0x01c1c000, 4 *=
 KiB },<br>
&gt; -=C2=A0 =C2=A0 { &quot;usb3&quot;,=C2=A0 =C2=A0 =C2=A0 0x01c1d000, 4 *=
 KiB },<br>
&gt; +=C2=A0 =C2=A0 { &quot;usb0-phy&quot;,=C2=A0 0x01c1a000, 4 * KiB },<br=
>
&gt; +=C2=A0 =C2=A0 { &quot;usb1-phy&quot;,=C2=A0 0x01c1b000, 4 * KiB },<br=
>
&gt; +=C2=A0 =C2=A0 { &quot;usb2-phy&quot;,=C2=A0 0x01c1c000, 4 * KiB },<br=
>
&gt; +=C2=A0 =C2=A0 { &quot;usb3-phy&quot;,=C2=A0 0x01c1d000, 4 * KiB },<br=
>
<br>
As in v3 comment, this can be done in patch #1.<br></blockquote><div><br></=
div><div>OK, I&#39;ll rename them in patch 1, so it won&#39;t show up here.=
<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
<br>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@redha=
t.com" target=3D"_blank">philmd@redhat.com</a>&gt;<br>
Tested-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@redhat.=
com" target=3D"_blank">philmd@redhat.com</a>&gt;<br></blockquote><div><br><=
/div><div>Thanks for reviewing and testing Philippe!</div><div>Regards,</di=
v><div>Niek<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;smc&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=
=A00x01c1e000, 4 * KiB },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;pio&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=
=A00x01c20800, 1 * KiB },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;owa&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=
=A00x01c21000, 1 * KiB },<br>
&gt; @@ -144,6 +153,14 @@ enum {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0AW_H3_GIC_SPI_UART3=C2=A0 =C2=A0 =C2=A0=3D=
=C2=A0 3,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0AW_H3_GIC_SPI_TIMER0=C2=A0 =C2=A0 =3D 18,<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0AW_H3_GIC_SPI_TIMER1=C2=A0 =C2=A0 =3D 19,<br=
>
&gt; +=C2=A0 =C2=A0 AW_H3_GIC_SPI_EHCI0=C2=A0 =C2=A0 =C2=A0=3D 72,<br>
&gt; +=C2=A0 =C2=A0 AW_H3_GIC_SPI_OHCI0=C2=A0 =C2=A0 =C2=A0=3D 73,<br>
&gt; +=C2=A0 =C2=A0 AW_H3_GIC_SPI_EHCI1=C2=A0 =C2=A0 =C2=A0=3D 74,<br>
&gt; +=C2=A0 =C2=A0 AW_H3_GIC_SPI_OHCI1=C2=A0 =C2=A0 =C2=A0=3D 75,<br>
&gt; +=C2=A0 =C2=A0 AW_H3_GIC_SPI_EHCI2=C2=A0 =C2=A0 =C2=A0=3D 76,<br>
&gt; +=C2=A0 =C2=A0 AW_H3_GIC_SPI_OHCI2=C2=A0 =C2=A0 =C2=A0=3D 77,<br>
&gt; +=C2=A0 =C2=A0 AW_H3_GIC_SPI_EHCI3=C2=A0 =C2=A0 =C2=A0=3D 78,<br>
&gt; +=C2=A0 =C2=A0 AW_H3_GIC_SPI_OHCI3=C2=A0 =C2=A0 =C2=A0=3D 79,<br>
&gt;=C2=A0 =C2=A0};<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0/* Allwinner H3 general constants */<br>
&gt; @@ -284,6 +301,33 @@ static void allwinner_h3_realize(DeviceState *dev=
, Error **errp)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0qdev_init_nofail(DEVICE(&amp;s-&gt;ccu));<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0sysbus_mmio_map(SYS_BUS_DEVICE(&amp;s-&gt;cc=
u), 0, s-&gt;memmap[AW_H3_CCU]);<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +=C2=A0 =C2=A0 /* Universal Serial Bus */<br>
&gt; +=C2=A0 =C2=A0 sysbus_create_simple(TYPE_AW_H3_EHCI, s-&gt;memmap[AW_H=
3_EHCI0],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0qdev_get_gpio_in(DEVICE(&amp;s-&gt;gic),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 AW_H3_GIC_SPI_EHCI0));<br>
&gt; +=C2=A0 =C2=A0 sysbus_create_simple(TYPE_AW_H3_EHCI, s-&gt;memmap[AW_H=
3_EHCI1],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0qdev_get_gpio_in(DEVICE(&amp;s-&gt;gic),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 AW_H3_GIC_SPI_EHCI1));<br>
&gt; +=C2=A0 =C2=A0 sysbus_create_simple(TYPE_AW_H3_EHCI, s-&gt;memmap[AW_H=
3_EHCI2],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0qdev_get_gpio_in(DEVICE(&amp;s-&gt;gic),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 AW_H3_GIC_SPI_EHCI2));<br>
&gt; +=C2=A0 =C2=A0 sysbus_create_simple(TYPE_AW_H3_EHCI, s-&gt;memmap[AW_H=
3_EHCI3],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0qdev_get_gpio_in(DEVICE(&amp;s-&gt;gic),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 AW_H3_GIC_SPI_EHCI3));<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 sysbus_create_simple(&quot;sysbus-ohci&quot;, s-&gt;mem=
map[AW_H3_OHCI0],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0qdev_get_gpio_in(DEVICE(&amp;s-&gt;gic),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 AW_H3_GIC_SPI_OHCI0));<br>
&gt; +=C2=A0 =C2=A0 sysbus_create_simple(&quot;sysbus-ohci&quot;, s-&gt;mem=
map[AW_H3_OHCI1],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0qdev_get_gpio_in(DEVICE(&amp;s-&gt;gic),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 AW_H3_GIC_SPI_OHCI1));<br>
&gt; +=C2=A0 =C2=A0 sysbus_create_simple(&quot;sysbus-ohci&quot;, s-&gt;mem=
map[AW_H3_OHCI2],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0qdev_get_gpio_in(DEVICE(&amp;s-&gt;gic),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 AW_H3_GIC_SPI_OHCI2));<br>
&gt; +=C2=A0 =C2=A0 sysbus_create_simple(&quot;sysbus-ohci&quot;, s-&gt;mem=
map[AW_H3_OHCI3],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0qdev_get_gpio_in(DEVICE(&amp;s-&gt;gic),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 AW_H3_GIC_SPI_OHCI3));<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* UART0. For future clocktree API: All UART=
S are connected to APB2_CLK. */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0serial_mm_init(get_system_memory(), s-&gt;me=
mmap[AW_H3_UART0], 2,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 qdev_get_gpio_in(DEVICE(&amp;s-&gt;gic), AW_H3_GIC_SPI_UART0),<br>
&gt; diff --git a/hw/usb/hcd-ehci-sysbus.c b/hw/usb/hcd-ehci-sysbus.c<br>
&gt; index 020211fd10..174c3446ef 100644<br>
&gt; --- a/hw/usb/hcd-ehci-sysbus.c<br>
&gt; +++ b/hw/usb/hcd-ehci-sysbus.c<br>
&gt; @@ -145,6 +145,22 @@ static const TypeInfo ehci_exynos4210_type_info =
=3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.class_init=C2=A0 =C2=A0 =3D ehci_exynos4210=
_class_init,<br>
&gt;=C2=A0 =C2=A0};<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +static void ehci_aw_h3_class_init(ObjectClass *oc, void *data)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 SysBusEHCIClass *sec =3D SYS_BUS_EHCI_CLASS(oc);<br>
&gt; +=C2=A0 =C2=A0 DeviceClass *dc =3D DEVICE_CLASS(oc);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 sec-&gt;capsbase =3D 0x0;<br>
&gt; +=C2=A0 =C2=A0 sec-&gt;opregbase =3D 0x10;<br>
&gt; +=C2=A0 =C2=A0 set_bit(DEVICE_CATEGORY_USB, dc-&gt;categories);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const TypeInfo ehci_aw_h3_type_info =3D {<br>
&gt; +=C2=A0 =C2=A0 .name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_AW_H3_=
EHCI,<br>
&gt; +=C2=A0 =C2=A0 .parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_SYS_BUS_EHC=
I,<br>
&gt; +=C2=A0 =C2=A0 .class_init=C2=A0 =C2=A0 =3D ehci_aw_h3_class_init,<br>
&gt; +};<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0static void ehci_tegra2_class_init(ObjectClass *oc, void *=
data)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0SysBusEHCIClass *sec =3D SYS_BUS_EHCI_CLASS(=
oc);<br>
&gt; @@ -267,6 +283,7 @@ static void ehci_sysbus_register_types(void)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0type_register_static(&amp;ehci_platform_type=
_info);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0type_register_static(&amp;ehci_xlnx_type_inf=
o);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0type_register_static(&amp;ehci_exynos4210_ty=
pe_info);<br>
&gt; +=C2=A0 =C2=A0 type_register_static(&amp;ehci_aw_h3_type_info);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0type_register_static(&amp;ehci_tegra2_type_i=
nfo);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0type_register_static(&amp;ehci_ppc4xx_type_i=
nfo);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0type_register_static(&amp;ehci_fusbh200_type=
_info);<br>
&gt; <br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><div>Niek Linnenbank<br><br></div></div></=
div></div>

--000000000000a52783059d9c977c--
