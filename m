Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1092279lfc;
        Sat, 14 Mar 2020 14:50:31 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuQSnbK6FuQb8+Qz74StdReckemqozlbQKCXj77bQ6f1AyXDnV4P527nt2ni+2XRPnxCgcY
X-Received: by 2002:a05:620a:2117:: with SMTP id l23mr19306067qkl.323.1584222631807;
        Sat, 14 Mar 2020 14:50:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584222631; cv=none;
        d=google.com; s=arc-20160816;
        b=YxWhUbcwsBnZpwJC1hOZOX3ra2026FHZpp52+qZ4Ofc5leVPaew/CUTegAOybjug0Z
         sC1TvKbLt5AQ4PXzoiXLsWRAkAobey5aCtPoiretKt7O2L9hdfqy01zhPp4+lHdzn3VA
         Yft3R+GF1AChe3tDl3g1bQChF21eZqriaLL1BPVMtquebZjCZcSAdu6IvXAHWTmEIVIl
         sOpEk4j+ZVEjISf8bI85TCwyqNP5Ue8RBDMv5VPbE2pifDMDn+TsM4PJZUWrR5h+rmzf
         LIZZMAyCXKwjJQ09zMNwN2sfzr+1TGx0rY0zTvlMqZmxbnqs8q8gC07NizRpgAFv0/I+
         M9/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=bfpArt7hPs+BhF3+XnEjP4A0sFQL8Oha1f3Dg8+P6UE=;
        b=rlvW2xPur4yD+OcU/C3+wzR5Rl28138DMyZnHIGG0KM0h+BCEvQg3iaqnDZ91WyQtc
         t3Jg1gs8dW1oBAcpT2gyg4FiXl0eRSEOdHZUZKV2uwAt1/LNv0D58qVasfIfsuzisumx
         QJ3jqk8UDrtHvUn581FWP6Q13ApN0burH3ekra/IhRPzZcq+mdu/u+7d5JKGWDMDWsa/
         YbtTOLE4YvNaAUSHjw9hpzS6804oaz8t8VHVNNuAcTCQ0uL0OpMxAlQpRXC97jvRAz1N
         +/k87Rwyj3xF0dACAOEwzWBgUjAvtGd7mpcuAYW1E4ol6nn78y4yTof8H64TWFCGMqpW
         nRUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=D3JK7flB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i13si7736542qkm.206.2020.03.14.14.50.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 14 Mar 2020 14:50:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=D3JK7flB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jDEfv-00078G-99
	for alex.bennee@linaro.org; Sat, 14 Mar 2020 17:50:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41646)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jDEfm-000767-80
 for qemu-arm@nongnu.org; Sat, 14 Mar 2020 17:50:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jDEfl-0001MB-4t
 for qemu-arm@nongnu.org; Sat, 14 Mar 2020 17:50:22 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:43234
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jDEfl-0001Lb-0g
 for qemu-arm@nongnu.org; Sat, 14 Mar 2020 17:50:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584222620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bfpArt7hPs+BhF3+XnEjP4A0sFQL8Oha1f3Dg8+P6UE=;
 b=D3JK7flBWz90D+gAbC5l5gtOqwtVPnzPbLjdSlBriwPghdl0p1qJeedU07BfK5bJf0RI/3
 QEkdE3v5nJJZsCnh3qJPqlJmc4D+WKzyZymikzXIF87xt+6HLzKX0co4xIJn1FNwwKKc6c
 KcU9gSdbJUwjNLsmBwueWbHBccL3sEI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-457-oJ8g1TVrMC6Fg_19ha1-6Q-1; Sat, 14 Mar 2020 17:50:19 -0400
X-MC-Unique: oJ8g1TVrMC6Fg_19ha1-6Q-1
Received: by mail-wr1-f71.google.com with SMTP id 94so1794266wrr.3
 for <qemu-arm@nongnu.org>; Sat, 14 Mar 2020 14:50:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IWc0xISPvYYvNCmZ9g4/J2WjpRM6MG7OyriYuaJO2zE=;
 b=ICPTvfyIGM0Lo7Y6PUMgyxJvIUQhVOJlg0s3tgfVDNyKrbvPeYuoK4GH2NfXgjRx1U
 TY/J4JfaxgK/boRDzzzY7dDRBzjXtDGgfPgV5W8iR9CnYR5hZ/r4Ujszo4FtZQTo2/Fc
 rQzQmEGuVIJuItESdlZTxiS5WmakTfPwWpM3DTDSCEr+kuzLLJcWAJSRSnyj8DJiTUX0
 Rv/aY1fjLqdhyWQyANlUU8+6I0KonUBsI0iysgKkHqb7sMersLbuLftXZH9BgeNvoAwv
 wcBPUrjzl4L91LeY/9q3LkCZQe5mFeA3xYNRCoLbr1HmRxFQ9YNeyf8iZdN6+lmd2d+V
 KPNg==
X-Gm-Message-State: ANhLgQ3J+qznf5I2l6D9x/qyQsYMDBGEPeNNjHT2GtdQvZw7sQhZdP3Z
 daFyCKG3azDUo6+AT6o3BaYn5SFp9RsWunGwGXYxNkfTSHkmqTeT2ICj1G5gOfvhHb5GAxoMyUs
 zQTGVZDSPDGf8
X-Received: by 2002:a5d:5691:: with SMTP id f17mr25069365wrv.74.1584222617042; 
 Sat, 14 Mar 2020 14:50:17 -0700 (PDT)
X-Received: by 2002:a5d:5691:: with SMTP id f17mr25069350wrv.74.1584222616843; 
 Sat, 14 Mar 2020 14:50:16 -0700 (PDT)
Received: from [192.168.1.40] (191.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.191])
 by smtp.gmail.com with ESMTPSA id l83sm23340629wmf.43.2020.03.14.14.50.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Mar 2020 14:50:16 -0700 (PDT)
Subject: Re: [PATCH 4/8] hw/arm/fsl-imx31: Wire up watchdog
To: Guenter Roeck <linux@roeck-us.net>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20200314172736.24528-1-linux@roeck-us.net>
 <20200314172736.24528-5-linux@roeck-us.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <23d19f5e-486c-dfbf-fb1f-71d99379496c@redhat.com>
Date: Sat, 14 Mar 2020 22:50:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200314172736.24528-5-linux@roeck-us.net>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
X-TUID: BDzzrNZ09rgV

On 3/14/20 6:27 PM, Guenter Roeck wrote:
> With this patch, the watchdog on i.MX31 emulations is fully operational.
>=20
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>   hw/arm/fsl-imx31.c         | 6 ++++++
>   include/hw/arm/fsl-imx31.h | 4 ++++
>   2 files changed, 10 insertions(+)
>=20
> diff --git a/hw/arm/fsl-imx31.c b/hw/arm/fsl-imx31.c
> index 55e90d104b..cec7d0dd1b 100644
> --- a/hw/arm/fsl-imx31.c
> +++ b/hw/arm/fsl-imx31.c
> @@ -63,6 +63,8 @@ static void fsl_imx31_init(Object *obj)
>           sysbus_init_child_obj(obj, "gpio[*]", &s->gpio[i], sizeof(s->gp=
io[i]),
>                                 TYPE_IMX_GPIO);
>       }
> +
> +    sysbus_init_child_obj(obj, "wdt", &s->wdt, sizeof(s->wdt), TYPE_IMX2=
_WDT);
>   }
>  =20
>   static void fsl_imx31_realize(DeviceState *dev, Error **errp)
> @@ -205,6 +207,10 @@ static void fsl_imx31_realize(DeviceState *dev, Erro=
r **errp)
>                                               gpio_table[i].irq));
>       }
>  =20
> +    /* Watchdog */
> +    object_property_set_bool(OBJECT(&s->wdt), true, "realized", &error_a=
bort);
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->wdt), 0, FSL_IMX31_WDT_ADDR);
> +
>       /* On a real system, the first 16k is a `secure boot rom' */
>       memory_region_init_rom(&s->secure_rom, NULL, "imx31.secure_rom",
>                              FSL_IMX31_SECURE_ROM_SIZE, &err);
> diff --git a/include/hw/arm/fsl-imx31.h b/include/hw/arm/fsl-imx31.h
> index ac5ca9826a..dd8561b309 100644
> --- a/include/hw/arm/fsl-imx31.h
> +++ b/include/hw/arm/fsl-imx31.h
> @@ -25,6 +25,7 @@
>   #include "hw/timer/imx_epit.h"
>   #include "hw/i2c/imx_i2c.h"
>   #include "hw/gpio/imx_gpio.h"
> +#include "hw/watchdog/wdt_imx2.h"
>   #include "exec/memory.h"
>   #include "target/arm/cpu.h"
>  =20
> @@ -49,6 +50,7 @@ typedef struct FslIMX31State {
>       IMXEPITState   epit[FSL_IMX31_NUM_EPITS];
>       IMXI2CState    i2c[FSL_IMX31_NUM_I2CS];
>       IMXGPIOState   gpio[FSL_IMX31_NUM_GPIOS];
> +    IMX2WdtState   wdt;
>       MemoryRegion   secure_rom;
>       MemoryRegion   rom;
>       MemoryRegion   iram;
> @@ -87,6 +89,8 @@ typedef struct FslIMX31State {
>   #define FSL_IMX31_GPIO1_SIZE            0x4000
>   #define FSL_IMX31_GPIO2_ADDR            0x53FD0000
>   #define FSL_IMX31_GPIO2_SIZE            0x4000
> +#define FSL_IMX31_WDT_ADDR              0x53FDC000
> +#define FSL_IMX31_WDT_SIZE              0x4000
>   #define FSL_IMX31_AVIC_ADDR             0x68000000
>   #define FSL_IMX31_AVIC_SIZE             0x100
>   #define FSL_IMX31_SDRAM0_ADDR           0x80000000
>=20

Missing Kconfig hunk:

-- >8 --
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 4cf8fa4967..8af023abde 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -366,6 +366,7 @@ config FSL_IMX31
      select SERIAL
      select IMX
      select IMX_I2C
+    select WDT_IMX2
      select LAN9118

  config FSL_IMX6
---

With it:
Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

