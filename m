Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1091153lfc;
        Sat, 14 Mar 2020 14:48:50 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vttBdf8v3Whgo63S+HnHHTjOEwbSTOoLFefMU0bL3ilLTBrFb6RTcvyoZd8qRVvpQuO1FUY
X-Received: by 2002:a0c:c34e:: with SMTP id j14mr9464217qvi.243.1584222530744;
        Sat, 14 Mar 2020 14:48:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584222530; cv=none;
        d=google.com; s=arc-20160816;
        b=rKCpL2srI5+0FQtacjUe4VJJ4X4kIweadL45eUyxS8Pj1WeZIZo2i7FbIBja315G3L
         IEDeM7yOhkJKaBiUbxcAY+CJhEPhFT7A91679myUuiV9FAnY6VK39TX//bs5ZTFmvouN
         VJW6C39hCbJPZqVIgWnddN/qYR82R4+STh+7qKTZ0mdvb3xI5Vyg6gSbCM5GMivRgluA
         jEmRpaHIgh74WbTFcfj6bGlbK93x55H05x1FBYkhMh1KRW2ADzKH2+YcjPHRute+8HTV
         rc8LEabCvPgNGYKGxMi6isiA8jeWsymnxkIO3K7RcVgid8MZHU2eaiEwwWSiP+nwZNlS
         W+Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=iC+NnaLdFmDSspoHJH+k3hdBcLyhVaXNaCzQsw02eHg=;
        b=zMyMU5HshGGdPFjjyuAYJNc6LTtuvw1jFRKAhPiQCkDXEXN99odjZsZskmJmug/GN9
         iGmBuVia+9OwLPlirXdE7zLmP40SQ0WtG2VKhkOEc1AEgrYUTSVEmta8ZDrZoU4BXX2T
         oHlUI6CVvWWLr9TkmcoWwiRO9tOyJ2L6rRudTaL1y8c6BACH+4USi4/z/Ma8Eid9FXCD
         YzdJ8FNJDpM8Q0mMy0+Q5Asb25llnkJcw4ouopBB8cFBr9xhsjjclBHfVQYCEgGSn/O+
         I8ry17T5wU/NipG+bis6WhG3L7X/gDitaPPdo+UHP5lwNe3Uvum0Woz/F72p1auIryZH
         6rOA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=URTtpTDL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d26si7713840qtp.48.2020.03.14.14.48.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 14 Mar 2020 14:48:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=URTtpTDL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jDEeI-00061N-72
	for alex.bennee@linaro.org; Sat, 14 Mar 2020 17:48:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41138)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jDEe4-0005z4-4v
 for qemu-arm@nongnu.org; Sat, 14 Mar 2020 17:48:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jDEe2-0007zO-UM
 for qemu-arm@nongnu.org; Sat, 14 Mar 2020 17:48:36 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:26604
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jDEe2-0007zD-RC
 for qemu-arm@nongnu.org; Sat, 14 Mar 2020 17:48:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584222514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iC+NnaLdFmDSspoHJH+k3hdBcLyhVaXNaCzQsw02eHg=;
 b=URTtpTDL5Il+km5pTvtDZkgkQgk0qV1BtuvT96qzu/PrTmJvgeIswIEViaUVOgthZxr+4s
 pjExigJlbsdurvA1EQ2PpEDxrArXViZNEscz/T4dy3GMUEhsuks/CDi/CO1/28Mgr7P9Xc
 7WzPhKowV9VFrjjzeeNJnkUl6EZ5XDE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-9UPuQpY0O3GbslChdCu1qA-1; Sat, 14 Mar 2020 17:48:30 -0400
X-MC-Unique: 9UPuQpY0O3GbslChdCu1qA-1
Received: by mail-wr1-f70.google.com with SMTP id w6so6458309wrm.16
 for <qemu-arm@nongnu.org>; Sat, 14 Mar 2020 14:48:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=o+GlX0yGJVjTa6NhTztpRlFv5IWxl2dIkOAXxvH6rXc=;
 b=BaopY3y2Ehe74I5z4CVa0PrGRr11hoZKUSIp8CpXFJWum0Fu4R9qfQm2PMNAcMUbxC
 ZDqvnssmGZwD2jO/NDmrPsz6nlorlVt/x0jBrz51CqvJErjvDv80RL38L2jc9Qgzl6J3
 xMWOm4C0UIF9C5bL6Ih+rHJRVLuRS6yVoaAkdgwM2vHqvU/boMaYKo5ztJAjI+d3ocGP
 LHn6uAWzj715So0c+WFuRCJb8EzDPn4a7TZJ+8JjbJWzlqsIz+o+HTtm8H9k1/q/sVWE
 uRX0MzvMPK6BsUZCmgdv9g+ToEE/VB2nDBv8N83GJxGkfVzNtLWjqib0/3Xd8Ee17uEj
 YwaA==
X-Gm-Message-State: ANhLgQ2SyqKbQ5jrIri1cKoHbG3lF/rSoPuzLaUQsDbWXeituDCvJ3qp
 M9Ddsw34OD8Apx9obF/ybePOaEqA/jWrRLeyOnUajt83vfwYzCtC+xRAI2XYzaYYhvHVtUGhnjL
 Ok7QablyM+14l
X-Received: by 2002:a5d:6748:: with SMTP id l8mr17013970wrw.265.1584222509762; 
 Sat, 14 Mar 2020 14:48:29 -0700 (PDT)
X-Received: by 2002:a5d:6748:: with SMTP id l8mr17013963wrw.265.1584222509536; 
 Sat, 14 Mar 2020 14:48:29 -0700 (PDT)
Received: from [192.168.1.40] (191.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.191])
 by smtp.gmail.com with ESMTPSA id b203sm23578360wmc.45.2020.03.14.14.48.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Mar 2020 14:48:29 -0700 (PDT)
Subject: Re: [PATCH 3/8] hw/arm/fsl-imx25: Wire up watchdog
To: Guenter Roeck <linux@roeck-us.net>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20200314172736.24528-1-linux@roeck-us.net>
 <20200314172736.24528-4-linux@roeck-us.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d449eaae-0a87-b221-d097-d90340029398@redhat.com>
Date: Sat, 14 Mar 2020 22:48:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200314172736.24528-4-linux@roeck-us.net>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>, qemu-devel@nongnu.org,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /1L1RzPM0c5/

On 3/14/20 6:27 PM, Guenter Roeck wrote:
> With this commit, the watchdog on imx25-pdk is fully operational,
> including pretimeout support.
>=20
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>   hw/arm/fsl-imx25.c         | 10 ++++++++++
>   include/hw/arm/fsl-imx25.h |  5 +++++
>   2 files changed, 15 insertions(+)
>=20
> diff --git a/hw/arm/fsl-imx25.c b/hw/arm/fsl-imx25.c
> index a3f829f436..7d5aab562d 100644
> --- a/hw/arm/fsl-imx25.c
> +++ b/hw/arm/fsl-imx25.c
> @@ -87,6 +87,7 @@ static void fsl_imx25_init(Object *obj)
>                                 TYPE_CHIPIDEA);
>       }
>  =20
> +    sysbus_init_child_obj(obj, "wdt", &s->wdt, sizeof(s->wdt), TYPE_IMX2=
_WDT);
>   }
>  =20
>   static void fsl_imx25_realize(DeviceState *dev, Error **errp)
> @@ -302,6 +303,15 @@ static void fsl_imx25_realize(DeviceState *dev, Erro=
r **errp)
>                                               usb_table[i].irq));
>       }
>  =20
> +    /* Watchdog */
> +    object_property_set_bool(OBJECT(&s->wdt), true, "pretimeout-support"=
,
> +                             &error_abort);
> +    object_property_set_bool(OBJECT(&s->wdt), true, "realized", &error_a=
bort);
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->wdt), 0, FSL_IMX25_WDT_ADDR);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->wdt), 0,
> +                                      qdev_get_gpio_in(DEVICE(&s->avic),
> +                                                       FSL_IMX25_WDT_IRQ=
));
> +
>       /* initialize 2 x 16 KB ROM */
>       memory_region_init_rom(&s->rom[0], NULL,
>                              "imx25.rom0", FSL_IMX25_ROM0_SIZE, &err);
> diff --git a/include/hw/arm/fsl-imx25.h b/include/hw/arm/fsl-imx25.h
> index 5e196bbf05..9e228dacea 100644
> --- a/include/hw/arm/fsl-imx25.h
> +++ b/include/hw/arm/fsl-imx25.h
> @@ -29,6 +29,7 @@
>   #include "hw/gpio/imx_gpio.h"
>   #include "hw/sd/sdhci.h"
>   #include "hw/usb/chipidea.h"
> +#include "hw/watchdog/wdt_imx2.h"
>   #include "exec/memory.h"
>   #include "target/arm/cpu.h"
>  =20
> @@ -60,6 +61,7 @@ typedef struct FslIMX25State {
>       IMXGPIOState   gpio[FSL_IMX25_NUM_GPIOS];
>       SDHCIState     esdhc[FSL_IMX25_NUM_ESDHCS];
>       ChipideaState  usb[FSL_IMX25_NUM_USBS];
> +    IMX2WdtState   wdt;
>       MemoryRegion   rom[2];
>       MemoryRegion   iram;
>       MemoryRegion   iram_alias;
> @@ -229,6 +231,8 @@ typedef struct FslIMX25State {
>   #define FSL_IMX25_GPIO1_SIZE    0x4000
>   #define FSL_IMX25_GPIO2_ADDR    0x53FD0000
>   #define FSL_IMX25_GPIO2_SIZE    0x4000
> +#define FSL_IMX25_WDT_ADDR      0x53FDC000
> +#define FSL_IMX25_WDT_SIZE      0x4000
>   #define FSL_IMX25_USB1_ADDR     0x53FF4000
>   #define FSL_IMX25_USB1_SIZE     0x0200
>   #define FSL_IMX25_USB2_ADDR     0x53FF4400
> @@ -268,5 +272,6 @@ typedef struct FslIMX25State {
>   #define FSL_IMX25_ESDHC2_IRQ    8
>   #define FSL_IMX25_USB1_IRQ      37
>   #define FSL_IMX25_USB2_IRQ      35
> +#define FSL_IMX25_WDT_IRQ       55
>  =20
>   #endif /* FSL_IMX25_H */
>=20

Here you also need:

-- >8 --
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index c662d5f1e0..4cf8fa4967 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -358,6 +358,7 @@ config FSL_IMX25
      select IMX
      select IMX_FEC
      select IMX_I2C
+    select WDT_IMX2
      select DS1338

  config FSL_IMX31
---

With it:
Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

