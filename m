Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp851131lff;
        Wed, 4 Dec 2019 08:20:19 -0800 (PST)
X-Google-Smtp-Source: APXvYqyzYRKe7ZbBZzWQNTH7cYPag9aJOwv0g/ccswhSN8UnLkb8bqkAPTWnGqPt0fsVMcA9cxsA
X-Received: by 2002:a50:927c:: with SMTP id j57mr4851407eda.217.1575476418958;
        Wed, 04 Dec 2019 08:20:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575476418; cv=none;
        d=google.com; s=arc-20160816;
        b=aW5BN7CJWPtHPcRH99vwSynCA/gxxi4fhvTdzAavl4BTdCvCCDAOYrV9/KqjPxRhaQ
         Dw8jn4vQ5kN1CchaeMyHWeqKAP1kHimjUBUzH44VuAZM8zOS4QKRKj+DoBJ88yRNuVSg
         y4hCgAMDQNLrnjtcmmZ3ccRz971sd3wSPHMFqmAnXxLg5zE5Bc/KMMO052ejc7az19oL
         OSTVATN0yhTH1jvKBd4XtO7uD+C8VC80YCa2GTHGTjht3amksFyOmxXm/X8DMx1MyD8X
         Ks2pRk9KYu9Vg5u0w92rCgj8NNpake/aRzSa5p4jfpCis/J6n/G9isaDoFgaZlPkRp45
         xgcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=5t/1v78hE6NyJ3o2GpUTU1gSeku0E4UCR1wVphzXSp8=;
        b=p134nQn2V7a3Y3olb8F34DJO0rjwqxs+qnNjZxRfA/SFpBwOB2aLhSC4ZeIcB4XEmq
         ogYk2V18NVjIa/ZGUHvyr6x5e8Z09vF+/BNY2dZq802Vxn1WHwzacER9+IHlQlE+Yz2e
         G5NJDLbr3G47cnPWK//rn7n0NlrZI8/aaJmEgrafJJKyXd7We7eKKwTjSy0FkhfG+gbJ
         rFt1m/6OtjlprJsFEQ1cmPZH32MVNpbtp0hERcDWx4ThzurG2hXfoc0CBYdUFFcOaIqe
         iJANMAjbfw5limk2fmxKHixsTMLXYPX2cQ90QR08g6956JyOVrZFhaIOg8x9YPpE3X1k
         bCoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=f5sesb5Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w11si4751850edx.286.2019.12.04.08.20.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Dec 2019 08:20:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=f5sesb5Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:40926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1icXNx-00019l-TG
	for alex.bennee@linaro.org; Wed, 04 Dec 2019 11:20:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60531)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1icXFh-00056j-H8
 for qemu-arm@nongnu.org; Wed, 04 Dec 2019 11:11:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1icXFd-0004EK-Aa
 for qemu-arm@nongnu.org; Wed, 04 Dec 2019 11:11:44 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:41919)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <aleksandar.m.mail@gmail.com>)
 id 1icXFU-00046f-A2; Wed, 04 Dec 2019 11:11:32 -0500
Received: by mail-oi1-x242.google.com with SMTP id i1so3261594oie.8;
 Wed, 04 Dec 2019 08:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=5t/1v78hE6NyJ3o2GpUTU1gSeku0E4UCR1wVphzXSp8=;
 b=f5sesb5YnQ/z44M/W65klN3FzjaV2vupsX7HXvjF42WsFP2WRlxPtBurWsKdCXz5gQ
 VUZXTfBX4GTKlJT2h7zDnng7XrbfCXp1euLhsD02j4nMongOw4oGOEp8hG+Jed4iszW9
 6wkclceNxBackjQq4kw/0FQ5UUox7MpnPWWevcRan+xdrRXA49FzHqXTDOQzD294aZa3
 +62A1m3HX32X3M11aU9G0WMal4nD06/lDh2+V5MFCcOx+PBm2thi3Gq8+6pqOF7yu13+
 V0HN704Muph5q2grlhjLvJhCg6pWC9M6yd6l4aza11FhVZm4pxbWjkNLX4mLRTi7fdF6
 jcyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=5t/1v78hE6NyJ3o2GpUTU1gSeku0E4UCR1wVphzXSp8=;
 b=N7bVXmk6+WJw9okT6sz+vNfQaBZbAbO/8/BKTEtXjpeTxhFmtOGUQzD4rF+cxwL2eA
 Vku7c/y4agwCejTwWR4YJLcKUZmnujZU2n7HKIviE9UZ8HnV7VGYq+t+3b7KVm7avXAj
 p9vTMIrg3NCQTonHUaCzWL5j1q3LCKLdf2z38YviXH0eKCGpXXzvJgN0CcbwWRWuw4fM
 fMXo8xDrv1VpN3ziVVE8PH+htLGDKv81dJjRGNK+LiBaxahajJ361LkdgUqBwcREgaJg
 6kROSC8UCPaMrGQ1F6H2muOBiyQx7LWbG5rd8nwvrgeGkA7ORx9FgAZXqDz6vrtgGB1Q
 rsPw==
X-Gm-Message-State: APjAAAUuv+ThB9HlzpYP/joMM/xVapnP/fl3/sOOBREItgveXYeuy3g2
 teSnN2lKL2tA7OPiUm/HJ9+FHVSh1cM3aoss1GI=
X-Received: by 2002:aca:bd85:: with SMTP id n127mr3267748oif.136.1575475889777; 
 Wed, 04 Dec 2019 08:11:29 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:d21:0:0:0:0:0 with HTTP;
 Wed, 4 Dec 2019 08:11:29 -0800 (PST)
In-Reply-To: <20191202210947.3603-5-nieklinnenbank@gmail.com>
References: <20191202210947.3603-1-nieklinnenbank@gmail.com>
 <20191202210947.3603-5-nieklinnenbank@gmail.com>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Wed, 4 Dec 2019 17:11:29 +0100
Message-ID: <CAL1e-=gVMXsWKAdo8c8QtjAYeK6p0AyTmi_a-sFHL2x4wGq6Vg@mail.gmail.com>
Subject: Re: [PATCH 04/10] arm: allwinner-h3: add USB host controller
To: Niek Linnenbank <nieklinnenbank@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000c332150598e3106d"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
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
Cc: "b.galvani@gmail.com" <b.galvani@gmail.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jy0Yqp2g8/y4

--000000000000c332150598e3106d
Content-Type: text/plain; charset="UTF-8"

On Monday, December 2, 2019, Niek Linnenbank <nieklinnenbank@gmail.com>
wrote:

> The Allwinner H3 System on Chip contains multiple USB 2.0 bus
> connections which provide software access using the Enhanced
> Host Controller Interface (EHCI) and Open Host Controller
> Interface (OHCI) interfaces. This commit adds support for
> both interfaces in the Allwinner H3 System on Chip.
>
> Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
> ---


Niek, hi!

I would like to clarify a detail here:

The spec of the SoC enumerates (in 8.5.2.4. USB Host Register List) a
number of registers for reading various USB-related states, but also for
setting some of USB features.

Does this series cover these registers, and interaction with them? If yes,
how and where? If not, do you think it is not necessary at all? Or perhaps
that it is a non-crucial limitation of this series?

Thanks in advance, and congrats for your, it seems, first submission!

Aleksandar


 hw/arm/allwinner-h3.c    | 20 ++++++++++++++++++++
>  hw/usb/hcd-ehci-sysbus.c | 17 +++++++++++++++++
>  hw/usb/hcd-ehci.h        |  1 +
>  3 files changed, 38 insertions(+)
>
> diff --git a/hw/arm/allwinner-h3.c b/hw/arm/allwinner-h3.c
> index 5566e979ec..afeb49c0ac 100644
> --- a/hw/arm/allwinner-h3.c
> +++ b/hw/arm/allwinner-h3.c
> @@ -26,6 +26,7 @@
>  #include "hw/sysbus.h"
>  #include "hw/arm/allwinner-h3.h"
>  #include "hw/misc/unimp.h"
> +#include "hw/usb/hcd-ehci.h"
>  #include "sysemu/sysemu.h"
>
>  static void aw_h3_init(Object *obj)
> @@ -183,6 +184,25 @@ static void aw_h3_realize(DeviceState *dev, Error
> **errp)
>      }
>      sysbus_mmio_map(SYS_BUS_DEVICE(&s->ccu), 0, AW_H3_CCU_BASE);
>
> +    /* Universal Serial Bus */
> +    sysbus_create_simple(TYPE_AW_H3_EHCI, AW_H3_EHCI0_BASE,
> +                         s->irq[AW_H3_GIC_SPI_EHCI0]);
> +    sysbus_create_simple(TYPE_AW_H3_EHCI, AW_H3_EHCI1_BASE,
> +                         s->irq[AW_H3_GIC_SPI_EHCI1]);
> +    sysbus_create_simple(TYPE_AW_H3_EHCI, AW_H3_EHCI2_BASE,
> +                         s->irq[AW_H3_GIC_SPI_EHCI2]);
> +    sysbus_create_simple(TYPE_AW_H3_EHCI, AW_H3_EHCI3_BASE,
> +                         s->irq[AW_H3_GIC_SPI_EHCI3]);
> +
> +    sysbus_create_simple("sysbus-ohci", AW_H3_OHCI0_BASE,
> +                         s->irq[AW_H3_GIC_SPI_OHCI0]);
> +    sysbus_create_simple("sysbus-ohci", AW_H3_OHCI1_BASE,
> +                         s->irq[AW_H3_GIC_SPI_OHCI1]);
> +    sysbus_create_simple("sysbus-ohci", AW_H3_OHCI2_BASE,
> +                         s->irq[AW_H3_GIC_SPI_OHCI2]);
> +    sysbus_create_simple("sysbus-ohci", AW_H3_OHCI3_BASE,
> +                         s->irq[AW_H3_GIC_SPI_OHCI3]);
> +
>      /* UART */
>      if (serial_hd(0)) {
>          serial_mm_init(get_system_memory(), AW_H3_UART0_REG_BASE, 2,
> diff --git a/hw/usb/hcd-ehci-sysbus.c b/hw/usb/hcd-ehci-sysbus.c
> index 020211fd10..174c3446ef 100644
> --- a/hw/usb/hcd-ehci-sysbus.c
> +++ b/hw/usb/hcd-ehci-sysbus.c
> @@ -145,6 +145,22 @@ static const TypeInfo ehci_exynos4210_type_info = {
>      .class_init    = ehci_exynos4210_class_init,
>  };
>
> +static void ehci_aw_h3_class_init(ObjectClass *oc, void *data)
> +{
> +    SysBusEHCIClass *sec = SYS_BUS_EHCI_CLASS(oc);
> +    DeviceClass *dc = DEVICE_CLASS(oc);
> +
> +    sec->capsbase = 0x0;
> +    sec->opregbase = 0x10;
> +    set_bit(DEVICE_CATEGORY_USB, dc->categories);
> +}
> +
> +static const TypeInfo ehci_aw_h3_type_info = {
> +    .name          = TYPE_AW_H3_EHCI,
> +    .parent        = TYPE_SYS_BUS_EHCI,
> +    .class_init    = ehci_aw_h3_class_init,
> +};
> +
>  static void ehci_tegra2_class_init(ObjectClass *oc, void *data)
>  {
>      SysBusEHCIClass *sec = SYS_BUS_EHCI_CLASS(oc);
> @@ -267,6 +283,7 @@ static void ehci_sysbus_register_types(void)
>      type_register_static(&ehci_platform_type_info);
>      type_register_static(&ehci_xlnx_type_info);
>      type_register_static(&ehci_exynos4210_type_info);
> +    type_register_static(&ehci_aw_h3_type_info);
>      type_register_static(&ehci_tegra2_type_info);
>      type_register_static(&ehci_ppc4xx_type_info);
>      type_register_static(&ehci_fusbh200_type_info);
> diff --git a/hw/usb/hcd-ehci.h b/hw/usb/hcd-ehci.h
> index 0298238f0b..edb59311c4 100644
> --- a/hw/usb/hcd-ehci.h
> +++ b/hw/usb/hcd-ehci.h
> @@ -342,6 +342,7 @@ typedef struct EHCIPCIState {
>  #define TYPE_SYS_BUS_EHCI "sysbus-ehci-usb"
>  #define TYPE_PLATFORM_EHCI "platform-ehci-usb"
>  #define TYPE_EXYNOS4210_EHCI "exynos4210-ehci-usb"
> +#define TYPE_AW_H3_EHCI "aw-h3-ehci-usb"
>  #define TYPE_TEGRA2_EHCI "tegra2-ehci-usb"
>  #define TYPE_PPC4xx_EHCI "ppc4xx-ehci-usb"
>  #define TYPE_FUSBH200_EHCI "fusbh200-ehci-usb"
> --
> 2.17.1
>
>
>

--000000000000c332150598e3106d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>On Monday, December 2, 2019, Niek Linnenbank &lt;<a href=3D"mailto:=
nieklinnenbank@gmail.com">nieklinnenbank@gmail.com</a>&gt; wrote:<br><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">The Allwinner H3 System on Chip contains multiple =
USB 2.0 bus<br>
connections which provide software access using the Enhanced<br>
Host Controller Interface (EHCI) and Open Host Controller<br>
Interface (OHCI) interfaces. This commit adds support for<br>
both interfaces in the Allwinner H3 System on Chip.<br>
<br>
Signed-off-by: Niek Linnenbank &lt;<a href=3D"mailto:nieklinnenbank@gmail.c=
om">nieklinnenbank@gmail.com</a>&gt;<br>
---</blockquote><div><br></div><div>Niek, hi!</div><div><br></div><div>I wo=
uld like to clarify a detail here:</div><div><br></div><div>The spec of the=
 SoC enumerates (in 8.5.2.4. USB Host Register List) a number of registers =
for reading various USB-related states, but also for setting some of USB fe=
atures.</div><div>=C2=A0</div><div>Does this series cover these registers, =
and interaction with them? If yes, how and where? If not, do you think it i=
s not necessary at all? Or perhaps that it is a non-crucial limitation of t=
his series?</div><div><br></div><div>Thanks in advance, and congrats for yo=
ur, it seems, first submission!</div><div><br></div><div>Aleksandar</div><d=
iv><br></div><div><br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
=C2=A0hw/arm/allwinner-h3.c=C2=A0 =C2=A0 | 20 ++++++++++++++++++++<br>
=C2=A0hw/usb/hcd-ehci-sysbus.c | 17 +++++++++++++++++<br>
=C2=A0hw/usb/hcd-ehci.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
=C2=A03 files changed, 38 insertions(+)<br>
<br>
diff --git a/hw/arm/allwinner-h3.c b/hw/arm/allwinner-h3.c<br>
index 5566e979ec..afeb49c0ac 100644<br>
--- a/hw/arm/allwinner-h3.c<br>
+++ b/hw/arm/allwinner-h3.c<br>
@@ -26,6 +26,7 @@<br>
=C2=A0#include &quot;hw/sysbus.h&quot;<br>
=C2=A0#include &quot;hw/arm/allwinner-h3.h&quot;<br>
=C2=A0#include &quot;hw/misc/unimp.h&quot;<br>
+#include &quot;hw/usb/hcd-ehci.h&quot;<br>
=C2=A0#include &quot;sysemu/sysemu.h&quot;<br>
<br>
=C2=A0static void aw_h3_init(Object *obj)<br>
@@ -183,6 +184,25 @@ static void aw_h3_realize(DeviceState *dev, Error **er=
rp)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0sysbus_mmio_map(SYS_BUS_<wbr>DEVICE(&amp;s-&gt;ccu), 0,=
 AW_H3_CCU_BASE);<br>
<br>
+=C2=A0 =C2=A0 /* Universal Serial Bus */<br>
+=C2=A0 =C2=A0 sysbus_create_simple(TYPE_AW_<wbr>H3_EHCI, AW_H3_EHCI0_BASE,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0s-&gt;irq[AW_H3_GIC_SPI_EHCI0]);<br>
+=C2=A0 =C2=A0 sysbus_create_simple(TYPE_AW_<wbr>H3_EHCI, AW_H3_EHCI1_BASE,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0s-&gt;irq[AW_H3_GIC_SPI_EHCI1]);<br>
+=C2=A0 =C2=A0 sysbus_create_simple(TYPE_AW_<wbr>H3_EHCI, AW_H3_EHCI2_BASE,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0s-&gt;irq[AW_H3_GIC_SPI_EHCI2]);<br>
+=C2=A0 =C2=A0 sysbus_create_simple(TYPE_AW_<wbr>H3_EHCI, AW_H3_EHCI3_BASE,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0s-&gt;irq[AW_H3_GIC_SPI_EHCI3]);<br>
+<br>
+=C2=A0 =C2=A0 sysbus_create_simple(&quot;sysbus-<wbr>ohci&quot;, AW_H3_OHC=
I0_BASE,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0s-&gt;irq[AW_H3_GIC_SPI_OHCI0]);<br>
+=C2=A0 =C2=A0 sysbus_create_simple(&quot;sysbus-<wbr>ohci&quot;, AW_H3_OHC=
I1_BASE,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0s-&gt;irq[AW_H3_GIC_SPI_OHCI1]);<br>
+=C2=A0 =C2=A0 sysbus_create_simple(&quot;sysbus-<wbr>ohci&quot;, AW_H3_OHC=
I2_BASE,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0s-&gt;irq[AW_H3_GIC_SPI_OHCI2]);<br>
+=C2=A0 =C2=A0 sysbus_create_simple(&quot;sysbus-<wbr>ohci&quot;, AW_H3_OHC=
I3_BASE,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0s-&gt;irq[AW_H3_GIC_SPI_OHCI3]);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0/* UART */<br>
=C2=A0 =C2=A0 =C2=A0if (serial_hd(0)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0serial_mm_init(get_system_<wbr>memory(), =
AW_H3_UART0_REG_BASE, 2,<br>
diff --git a/hw/usb/hcd-ehci-sysbus.c b/hw/usb/hcd-ehci-sysbus.c<br>
index 020211fd10..174c3446ef 100644<br>
--- a/hw/usb/hcd-ehci-sysbus.c<br>
+++ b/hw/usb/hcd-ehci-sysbus.c<br>
@@ -145,6 +145,22 @@ static const TypeInfo ehci_exynos4210_type_info =3D {<=
br>
=C2=A0 =C2=A0 =C2=A0.class_init=C2=A0 =C2=A0 =3D ehci_exynos4210_class_init=
,<br>
=C2=A0};<br>
<br>
+static void ehci_aw_h3_class_init(<wbr>ObjectClass *oc, void *data)<br>
+{<br>
+=C2=A0 =C2=A0 SysBusEHCIClass *sec =3D SYS_BUS_EHCI_CLASS(oc);<br>
+=C2=A0 =C2=A0 DeviceClass *dc =3D DEVICE_CLASS(oc);<br>
+<br>
+=C2=A0 =C2=A0 sec-&gt;capsbase =3D 0x0;<br>
+=C2=A0 =C2=A0 sec-&gt;opregbase =3D 0x10;<br>
+=C2=A0 =C2=A0 set_bit(DEVICE_CATEGORY_USB, dc-&gt;categories);<br>
+}<br>
+<br>
+static const TypeInfo ehci_aw_h3_type_info =3D {<br>
+=C2=A0 =C2=A0 .name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_AW_H3_EHCI,=
<br>
+=C2=A0 =C2=A0 .parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_SYS_BUS_EHCI,<br=
>
+=C2=A0 =C2=A0 .class_init=C2=A0 =C2=A0 =3D ehci_aw_h3_class_init,<br>
+};<br>
+<br>
=C2=A0static void ehci_tegra2_class_init(<wbr>ObjectClass *oc, void *data)<=
br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0SysBusEHCIClass *sec =3D SYS_BUS_EHCI_CLASS(oc);<br>
@@ -267,6 +283,7 @@ static void ehci_sysbus_register_types(<wbr>void)<br>
=C2=A0 =C2=A0 =C2=A0type_register_static(&amp;ehci_<wbr>platform_type_info)=
;<br>
=C2=A0 =C2=A0 =C2=A0type_register_static(&amp;ehci_<wbr>xlnx_type_info);<br=
>
=C2=A0 =C2=A0 =C2=A0type_register_static(&amp;ehci_<wbr>exynos4210_type_inf=
o);<br>
+=C2=A0 =C2=A0 type_register_static(&amp;ehci_aw_<wbr>h3_type_info);<br>
=C2=A0 =C2=A0 =C2=A0type_register_static(&amp;ehci_<wbr>tegra2_type_info);<=
br>
=C2=A0 =C2=A0 =C2=A0type_register_static(&amp;ehci_<wbr>ppc4xx_type_info);<=
br>
=C2=A0 =C2=A0 =C2=A0type_register_static(&amp;ehci_<wbr>fusbh200_type_info)=
;<br>
diff --git a/hw/usb/hcd-ehci.h b/hw/usb/hcd-ehci.h<br>
index 0298238f0b..edb59311c4 100644<br>
--- a/hw/usb/hcd-ehci.h<br>
+++ b/hw/usb/hcd-ehci.h<br>
@@ -342,6 +342,7 @@ typedef struct EHCIPCIState {<br>
=C2=A0#define TYPE_SYS_BUS_EHCI &quot;sysbus-ehci-usb&quot;<br>
=C2=A0#define TYPE_PLATFORM_EHCI &quot;platform-ehci-usb&quot;<br>
=C2=A0#define TYPE_EXYNOS4210_EHCI &quot;exynos4210-ehci-usb&quot;<br>
+#define TYPE_AW_H3_EHCI &quot;aw-h3-ehci-usb&quot;<br>
=C2=A0#define TYPE_TEGRA2_EHCI &quot;tegra2-ehci-usb&quot;<br>
=C2=A0#define TYPE_PPC4xx_EHCI &quot;ppc4xx-ehci-usb&quot;<br>
=C2=A0#define TYPE_FUSBH200_EHCI &quot;fusbh200-ehci-usb&quot;<br>
-- <br>
2.17.1<br>
<br>
<br>
</blockquote>

--000000000000c332150598e3106d--
