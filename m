Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp5476448lff;
        Mon, 9 Dec 2019 23:56:24 -0800 (PST)
X-Google-Smtp-Source: APXvYqz/ojE7sjR0xqFHICFGURmUoA8eMEXj+lusMmABZkTAN4vsUGNUVDQMbeMvxVwPExMbtBLh
X-Received: by 2002:a37:851:: with SMTP id 78mr32121815qki.266.1575964584604;
        Mon, 09 Dec 2019 23:56:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575964584; cv=none;
        d=google.com; s=arc-20160816;
        b=qMgqTu+zWHYNr3+ZxoGORIlViI+s4yb9ZSuecZ9vKOJlJuJ1NbGzvrkB0GfIGUanSL
         PeKrjfZEksbQP6hAP5EUQZvnyVJS2IvUN/Bh6pE1G10tKIKJ/a/Yu6rfbez3dWtRCEre
         it45Vet9R18o6RPiwEqQUQ0SCcmR5+juqw4D/tQ1p4Zcd/mUVmLXr9+llm9I59ELM65k
         8ytl3Vz2z2Jf0APheFzf7INYl6vGObpkCR0sWkYs5MtK0BfVC2cT9iLsChtPJu2/CD+i
         qp7Sm7EqPtTR1Xk7ODgiSwurIMBzlFd3GjNIX26YjXz8MB0nu7cXEmIwKunWa43YQ2Ab
         jErA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=oLmwHHyHcbG03UjZlQhw3ftszHY2lolMAFMILWOXSaI=;
        b=X0C33DdKDLABINBeYXtQB/gxwq+tBdIDmuxilkR0V/0tAnuCVW5l1TRWaBI3//PcfI
         hNguKE1tL/6JLPQ75oTkqDjtFr0pJfuS/oC6rzPcm79IWCCfquj+LcpsEqYa+/0kgDuX
         3Kl9jE3BfZUGfdbckEmwwftaM8EqintuhlESBfcsZskLY4zw/dv2OPQDCXl+/vFuRV5g
         RfN/YLBexS4Z9ntECu/QU5f2pnV3ZkdVTFdql7in+m36H7vLtUrpdDTBhfOM7W1JoAJi
         WwoHtl6WHkjVhMoC1NSBBEtBj+rtKnSIl/XpD/CzdaQJg5LpPh3Abl7rjwciRyrsWR/+
         O4bg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bVYNTnKC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a127si1374690qkd.136.2019.12.09.23.56.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Dec 2019 23:56:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bVYNTnKC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ieaNb-0004w7-W8
	for alex.bennee@linaro.org; Tue, 10 Dec 2019 02:56:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51495)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ieaNM-0004vy-Iy
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 02:56:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ieaNL-0008GF-9n
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 02:56:08 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:21043
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ieaNL-0008Fz-6C
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 02:56:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575964566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oLmwHHyHcbG03UjZlQhw3ftszHY2lolMAFMILWOXSaI=;
 b=bVYNTnKCnzOhFjX/m34r/swV0kaSS3F2mkWrfjSj4ni7GzEiNhov+4CrE21g+3b93io230
 YpMIM9YeKTKcRwpwIyHSt3/RaAfeOQQX4gvh044K06h548LkKAJf/6amLmsCzARv/HfZ2O
 1K9CjrCqS0rYTvs+h8y/2owXsfjC8i4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-r_KqU9QCOUWzvEbfc7w_VA-1; Tue, 10 Dec 2019 02:56:05 -0500
Received: by mail-wm1-f70.google.com with SMTP id p2so691600wma.3
 for <qemu-arm@nongnu.org>; Mon, 09 Dec 2019 23:56:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7lKFvmIk1ckH9ho4BOT62MUH7tKFHMTUn/IZ+AcP/SE=;
 b=aPB4+j/g4/B0yk3PDgXZkuGKcsmR2fROhuf6V66vfg6r1GLXtkYUjrQDSblaQyWOv+
 VpD2xWVAuEw7fpoQe+qsGRZoxPgP2ZQSzHWd96HCxR428y8WEr0VjgeI998ZFmRM/KJJ
 rId/aOYMWxqu6eWQvSpEveZpx/T7HMEr99RopUKvWKfalwGW9zHRARl0g0K424vqLCBS
 X6OIIgSqioCV1zbWLOFtTH6KAuDTa+n7egamVpeHJ/E+jaDdA/C7Js+rCbt69cm3Foey
 9iFE+d+JkaN7lTmzWe3Wj0pVVeR+ObEsxoCkn9aJ7OI5Au+94wurzLKIRvRdi4AlieUL
 GavQ==
X-Gm-Message-State: APjAAAWETIHGB7PlUiu78K3b2RCVCHkuSpisJ+c2XpqKPkEymLr7kJwi
 KRfiA9ap1WkilCNXvjhx8ezSkCAtFlCC0tLSH+MTDGuQsaK2KazOpUrku3ZOobHqa3esNBZ6Jen
 5cLPjcSJs32kc
X-Received: by 2002:a1c:20d6:: with SMTP id g205mr3594425wmg.38.1575964563915; 
 Mon, 09 Dec 2019 23:56:03 -0800 (PST)
X-Received: by 2002:a1c:20d6:: with SMTP id g205mr3594407wmg.38.1575964563677; 
 Mon, 09 Dec 2019 23:56:03 -0800 (PST)
Received: from [192.168.1.35] (182.red-88-21-103.staticip.rima-tde.net.
 [88.21.103.182])
 by smtp.gmail.com with ESMTPSA id g69sm2283097wmg.13.2019.12.09.23.56.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Dec 2019 23:56:03 -0800 (PST)
Subject: Re: [PATCH 04/10] arm: allwinner-h3: add USB host controller
To: Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
References: <20191202210947.3603-1-nieklinnenbank@gmail.com>
 <20191202210947.3603-5-nieklinnenbank@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <4a900e8d-d803-5c58-5a4b-879cce5970b4@redhat.com>
Date: Tue, 10 Dec 2019 08:56:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191202210947.3603-5-nieklinnenbank@gmail.com>
Content-Language: en-US
X-MC-Unique: r_KqU9QCOUWzvEbfc7w_VA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
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
Cc: b.galvani@gmail.com, peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: B8jmebs9p2jE

On 12/2/19 10:09 PM, Niek Linnenbank wrote:
> The Allwinner H3 System on Chip contains multiple USB 2.0 bus
> connections which provide software access using the Enhanced
> Host Controller Interface (EHCI) and Open Host Controller
> Interface (OHCI) interfaces. This commit adds support for
> both interfaces in the Allwinner H3 System on Chip.
>=20
> Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
> ---
>   hw/arm/allwinner-h3.c    | 20 ++++++++++++++++++++
>   hw/usb/hcd-ehci-sysbus.c | 17 +++++++++++++++++
>   hw/usb/hcd-ehci.h        |  1 +

Cc'ing Gerd, the maintainer of these files.

Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

>   3 files changed, 38 insertions(+)
>=20
> diff --git a/hw/arm/allwinner-h3.c b/hw/arm/allwinner-h3.c
> index 5566e979ec..afeb49c0ac 100644
> --- a/hw/arm/allwinner-h3.c
> +++ b/hw/arm/allwinner-h3.c
> @@ -26,6 +26,7 @@
>   #include "hw/sysbus.h"
>   #include "hw/arm/allwinner-h3.h"
>   #include "hw/misc/unimp.h"
> +#include "hw/usb/hcd-ehci.h"
>   #include "sysemu/sysemu.h"
>  =20
>   static void aw_h3_init(Object *obj)
> @@ -183,6 +184,25 @@ static void aw_h3_realize(DeviceState *dev, Error **=
errp)
>       }
>       sysbus_mmio_map(SYS_BUS_DEVICE(&s->ccu), 0, AW_H3_CCU_BASE);
>  =20
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
>       /* UART */
>       if (serial_hd(0)) {
>           serial_mm_init(get_system_memory(), AW_H3_UART0_REG_BASE, 2,
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
>=20

