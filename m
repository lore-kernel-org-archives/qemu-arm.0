Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp590100lfp;
        Fri, 7 Feb 2020 05:41:23 -0800 (PST)
X-Google-Smtp-Source: APXvYqzoTLtY7H1uA9HYkf4ZZowF+SBED6IdMrxfSnehx/jMH1zfGfqenWVlTkiZDzOLugLe04RJ
X-Received: by 2002:a05:620a:20d0:: with SMTP id f16mr7375266qka.349.1581082882959;
        Fri, 07 Feb 2020 05:41:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581082882; cv=none;
        d=google.com; s=arc-20160816;
        b=kuwxAJj4U9tMCPCYJAKrvqXRvKgE6xr/JmUaHXPs8jBQBz1uW+USFHKDlukq7FnMC4
         er1l1JeruHp0xJCUcKnBy+7NlN6EtO+oMVuiH8wdm25TWJAjZWTyz3Ao3WhyQfAEKgwB
         y5Tin/BfHo308rZh1GhKeYShIZQ3WkMOJWTvuX4ybtQ24GQsJEEIyAN6Yh9KNXsEm3k6
         IvhohKSmKdCDuPli/ikR2cgodkb0uYtWX8635vVNp3O9OMZdaBVoQZpDljg2RKbbZppL
         B6vDmA3QGc9bE39P71Ff2r6OynGsgr5LLBpkfzNRMWdLf01gkR6OoEoLpdoBVfz00Vty
         oR6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Vq/WHv9rsrgZFCCngOGb0Smg/2lD0d4tiEbgqBwORmk=;
        b=EACPkE9/yr3kNZ60zHi6C6SxTB/Jaf3miEI6XqJFyyHtKy/owFhZLlk9l+L+bjjfeA
         NwqTiyPE3bGnHW2K3u2BzI0ZLHSpIqHSjgbvotTB4rOpUysNcU3sTYWwp63fb/L4U+uL
         +4DJQxx5KxchYVzWBUfpoXFmkn8F2tflPaKXNZj8yv3M9CyCWSVN4aGU3v6wNnDMNLjd
         aneoc9oeh09cjNShSnXbV7EMYohc6ymvU68abKLbaz+AUxTcw7SlzcjF+crtEnoxgDN/
         rYVAsN+lWfgfoOSyg6KZ9HdhCs3hApqDA1jpGJleZ1UJOabh/5Uv3PeG3EpupkjBgR6B
         3EHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Oc3moxMu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 4si1271431qkd.225.2020.02.07.05.41.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Feb 2020 05:41:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Oc3moxMu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j03so-0001aK-Cg
	for alex.bennee@linaro.org; Fri, 07 Feb 2020 08:41:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36190)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j03sV-0001U9-Ie
 for qemu-arm@nongnu.org; Fri, 07 Feb 2020 08:41:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j03sU-0007dl-4V
 for qemu-arm@nongnu.org; Fri, 07 Feb 2020 08:41:03 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:49062
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j03sT-0007bU-Ix
 for qemu-arm@nongnu.org; Fri, 07 Feb 2020 08:41:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581082861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vq/WHv9rsrgZFCCngOGb0Smg/2lD0d4tiEbgqBwORmk=;
 b=Oc3moxMu4RaF6Y/Dssp/9JkRJFY3wwWll24DDf4Uyrx5Qcg5S5i/goN7zAkUYwo2zaCcIx
 v/J74/hUaa0kC8IDF4iA6+AglyRG4OE1NQQ9YqQ4+6FunyBwNCIZ1KIGJi9i498j+XXrOU
 F0za3vBBOXbsunBCSD2Pfm+QXuPxLq0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-390-SBU1lRzGPIKl8C91iA2fRQ-1; Fri, 07 Feb 2020 08:40:55 -0500
Received: by mail-wr1-f70.google.com with SMTP id 90so1262134wrq.6
 for <qemu-arm@nongnu.org>; Fri, 07 Feb 2020 05:40:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=icvCLwP5xvkeg9X7jv+3GbM5xpcVQFPo59uqDlBOmcs=;
 b=BBQ0NPrWm7Jl+RmuTGclOrZ4Z75CnWIVG5PyV030rN+muQ/31gjJsAz7RRaRgUjQ/R
 A6jj97vrtk7FybZ4FFjjIPQOkMxAU30sgsi5JxXKeqK2dYKn23G9JOW8ueK9TX4D+4DM
 z534lfbvo7nxWwTQ5XDqDa/0MyNVWm2HGj14BCXfNYKKC3sA6KOD/BgQop9i8IT4BzdC
 Fs3yJwgvDRkJOfOuFq4ZzOq8K/NKLOMKBGV0Lc7mdr6+dhZg7ad+judxap5wmwq6+yrZ
 eQnxp/urLTsroD/rEbu21B8SpZSoVjxf3vlYBBVemF/wmGOOgeTuNMX2am0zsPg1+7B8
 TLxw==
X-Gm-Message-State: APjAAAXhhpR/PF+dIkv4ECRAhy+8IdOKcbQgTEsaia5tigKGVyVxRHgA
 DguWWpyTxPagu7ZikK3dhUsKPl3nq0DMWHHZMwROlnlKop80fC9qgh8DDf+RrGO+m5BRPjCkH7C
 zwZff6YZudM2V
X-Received: by 2002:adf:e984:: with SMTP id h4mr4856768wrm.275.1581082854405; 
 Fri, 07 Feb 2020 05:40:54 -0800 (PST)
X-Received: by 2002:adf:e984:: with SMTP id h4mr4856741wrm.275.1581082854118; 
 Fri, 07 Feb 2020 05:40:54 -0800 (PST)
Received: from [192.168.1.35] (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id s22sm3307171wmh.4.2020.02.07.05.40.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Feb 2020 05:40:53 -0800 (PST)
Subject: Re: [PATCH] hw/arm: ast2400/ast2500: Wire up EHCI controllers
To: Guenter Roeck <linux@roeck-us.net>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>
References: <20200206183437.3979-1-linux@roeck-us.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <9aa0cb6e-a06a-7086-5846-e34233c54b74@redhat.com>
Date: Fri, 7 Feb 2020 14:40:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200206183437.3979-1-linux@roeck-us.net>
Content-Language: en-US
X-MC-Unique: SBU1lRzGPIKl8C91iA2fRQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EcrjHh14xOZ/

On 2/6/20 7:34 PM, Guenter Roeck wrote:
> Initialize EHCI controllers on AST2400 and AST2500 using the existing
> TYPE_PLATFORM_EHCI. After this change, booting ast2500-evb into Linux
> successfully instantiates a USB interface.
>=20
> ehci-platform 1e6a3000.usb: EHCI Host Controller
> ehci-platform 1e6a3000.usb: new USB bus registered, assigned bus number 1
> ehci-platform 1e6a3000.usb: irq 21, io mem 0x1e6a3000
> ehci-platform 1e6a3000.usb: USB 2.0 started, EHCI 1.00
> usb usb1: New USB device found, idVendor=3D1d6b, idProduct=3D0002, bcdDev=
ice=3D 5.05
> usb usb1: New USB device strings: Mfr=3D3, Product=3D2, SerialNumber=3D1
> usb usb1: Product: EHCI Host Controller
>=20
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>   hw/arm/aspeed_soc.c         | 25 +++++++++++++++++++++++++
>   include/hw/arm/aspeed_soc.h |  6 ++++++
>   2 files changed, 31 insertions(+)
>=20
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index b5e809a1d3..696c7fda14 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -30,6 +30,7 @@ static const hwaddr aspeed_soc_ast2400_memmap[] =3D {
>       [ASPEED_IOMEM]  =3D 0x1E600000,
>       [ASPEED_FMC]    =3D 0x1E620000,
>       [ASPEED_SPI1]   =3D 0x1E630000,
> +    [ASPEED_EHCI1]  =3D 0x1E6A1000,
>       [ASPEED_VIC]    =3D 0x1E6C0000,
>       [ASPEED_SDMC]   =3D 0x1E6E0000,
>       [ASPEED_SCU]    =3D 0x1E6E2000,
> @@ -59,6 +60,8 @@ static const hwaddr aspeed_soc_ast2500_memmap[] =3D {
>       [ASPEED_FMC]    =3D 0x1E620000,
>       [ASPEED_SPI1]   =3D 0x1E630000,
>       [ASPEED_SPI2]   =3D 0x1E631000,
> +    [ASPEED_EHCI1]  =3D 0x1E6A1000,
> +    [ASPEED_EHCI2]  =3D 0x1E6A3000,
>       [ASPEED_VIC]    =3D 0x1E6C0000,
>       [ASPEED_SDMC]   =3D 0x1E6E0000,
>       [ASPEED_SCU]    =3D 0x1E6E2000,
> @@ -91,6 +94,8 @@ static const int aspeed_soc_ast2400_irqmap[] =3D {
>       [ASPEED_UART5]  =3D 10,
>       [ASPEED_VUART]  =3D 8,
>       [ASPEED_FMC]    =3D 19,
> +    [ASPEED_EHCI1]  =3D 5,
> +    [ASPEED_EHCI2]  =3D 13,
>       [ASPEED_SDMC]   =3D 0,
>       [ASPEED_SCU]    =3D 21,
>       [ASPEED_ADC]    =3D 31,
> @@ -180,6 +185,11 @@ static void aspeed_soc_init(Object *obj)
>                                 sizeof(s->spi[i]), typename);
>       }
>  =20
> +    for (i =3D 0; i < sc->ehcis_num; i++) {
> +        sysbus_init_child_obj(obj, "ehci[*]", OBJECT(&s->ehci[i]),
> +                              sizeof(s->ehci[i]), TYPE_PLATFORM_EHCI);
> +    }
> +
>       snprintf(typename, sizeof(typename), "aspeed.sdmc-%s", socname);
>       sysbus_init_child_obj(obj, "sdmc", OBJECT(&s->sdmc), sizeof(s->sdmc=
),
>                             typename);
> @@ -364,6 +374,19 @@ static void aspeed_soc_realize(DeviceState *dev, Err=
or **errp)
>                           s->spi[i].ctrl->flash_window_base);
>       }
>  =20
> +    /* EHCI */
> +    for (i =3D 0; i < sc->ehcis_num; i++) {
> +        object_property_set_bool(OBJECT(&s->ehci[i]), true, "realized", =
&err);
> +        if (err) {
> +            error_propagate(errp, err);
> +            return;
> +        }
> +        sysbus_mmio_map(SYS_BUS_DEVICE(&s->ehci[i]), 0,
> +                        sc->memmap[ASPEED_EHCI1 + i]);
> +        sysbus_connect_irq(SYS_BUS_DEVICE(&s->ehci[i]), 0,
> +                           aspeed_soc_get_irq(s, ASPEED_EHCI1 + i));
> +    }
> +
>       /* SDMC - SDRAM Memory Controller */
>       object_property_set_bool(OBJECT(&s->sdmc), true, "realized", &err);
>       if (err) {
> @@ -472,6 +495,7 @@ static void aspeed_soc_ast2400_class_init(ObjectClass=
 *oc, void *data)
>       sc->silicon_rev  =3D AST2400_A1_SILICON_REV;
>       sc->sram_size    =3D 0x8000;
>       sc->spis_num     =3D 1;
> +    sc->ehcis_num    =3D 1;
>       sc->wdts_num     =3D 2;
>       sc->macs_num     =3D 2;
>       sc->irqmap       =3D aspeed_soc_ast2400_irqmap;
> @@ -496,6 +520,7 @@ static void aspeed_soc_ast2500_class_init(ObjectClass=
 *oc, void *data)
>       sc->silicon_rev  =3D AST2500_A1_SILICON_REV;
>       sc->sram_size    =3D 0x9000;
>       sc->spis_num     =3D 2;
> +    sc->ehcis_num    =3D 2;
>       sc->wdts_num     =3D 3;
>       sc->macs_num     =3D 2;
>       sc->irqmap       =3D aspeed_soc_ast2500_irqmap;
> diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
> index 90ac7f7ffa..78b9f6ae53 100644
> --- a/include/hw/arm/aspeed_soc.h
> +++ b/include/hw/arm/aspeed_soc.h
> @@ -26,8 +26,10 @@
>   #include "target/arm/cpu.h"
>   #include "hw/gpio/aspeed_gpio.h"
>   #include "hw/sd/aspeed_sdhci.h"
> +#include "hw/usb/hcd-ehci.h"
>  =20
>   #define ASPEED_SPIS_NUM  2
> +#define ASPEED_EHCIS_NUM 2
>   #define ASPEED_WDTS_NUM  4
>   #define ASPEED_CPUS_NUM  2
>   #define ASPEED_MACS_NUM  4
> @@ -50,6 +52,7 @@ typedef struct AspeedSoCState {
>       AspeedXDMAState xdma;
>       AspeedSMCState fmc;
>       AspeedSMCState spi[ASPEED_SPIS_NUM];
> +    EHCISysBusState ehci[ASPEED_EHCIS_NUM];
>       AspeedSDMCState sdmc;
>       AspeedWDTState wdt[ASPEED_WDTS_NUM];
>       FTGMAC100State ftgmac100[ASPEED_MACS_NUM];
> @@ -71,6 +74,7 @@ typedef struct AspeedSoCClass {
>       uint32_t silicon_rev;
>       uint64_t sram_size;
>       int spis_num;
> +    int ehcis_num;
>       int wdts_num;
>       int macs_num;
>       const int *irqmap;
> @@ -94,6 +98,8 @@ enum {
>       ASPEED_FMC,
>       ASPEED_SPI1,
>       ASPEED_SPI2,
> +    ASPEED_EHCI1,
> +    ASPEED_EHCI2,
>       ASPEED_VIC,
>       ASPEED_SDMC,
>       ASPEED_SCU,
>=20

Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

