Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1087643lfc;
        Sat, 14 Mar 2020 14:43:50 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vt1tcKt/VGWRl8Nq/VkbyvHa8jJ32JP1CXeVOIh4g1soOMt8/4JuwonSoSrJvv4GJ5zd06A
X-Received: by 2002:a37:27cf:: with SMTP id n198mr18745615qkn.97.1584222230204;
        Sat, 14 Mar 2020 14:43:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584222230; cv=none;
        d=google.com; s=arc-20160816;
        b=Gs4c8N7gbFNeMAYje0/8z+9/rFnMf/mdhnyBufTVqNN8fSFhf7XOera53WccOlCy/g
         KwmrF7vRO5jRoWpu4wpH1z/L3ykJCvOpbK6AzKrOkfCOODeNTFQfK3+xzRrO6AR0m/U3
         dRNHo8zEysdTPOvwYXwEvekKX3EJxvAvEvhjf6NF+U9xoVZky8Eqrtn9Mnn79Cn54SZc
         4Y2NSTo5tVL58OvoOWLEJLbl8dFmEi7xbui92WsfB1xu0Ajc2sI4+lZ9BMgtpDyYPT+g
         kuNHUdNGmSWdkXDdz99UApaERUJ2Xc3tVg5JewX9ggWpxssPKjw3BmFMFjAiyb3V+jjT
         FGyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=wPYaHMdQgWbqDNSTL8ysZRFRs4ssDuipJO6nIgLDKso=;
        b=iDQtESlIsw2DBTU4tTAxKnx6a98nJRrwc0DXRh1z96ljfcZqHTRqpcOxR+DQg2oK3C
         R/+EEg44DwZFnq37/a9OGIWtRTpu8+CW8f85u1jJZMyVRBNMvqrS5SEOyZwwZO2Ucvxy
         eYOSvmvKncxUAmUMIIZZD0oAhxV0/I4qe7ro0BcidYHnWHP/Q2UNeNEp3ZrqG8v0VkEe
         RLWhugDNesCV1eG+SPcGyBzWKMGTLcBHGvSfo4z8RZceobPlv+Dds/DVkw1HNe4AP8qh
         FBWFDj2cbRkFfYPOQewt1et66YUk5RmRY9LPU8h1N71AMAtAZYBH0WZ2iFA14MYEogp8
         n7rQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=doWP880D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n20si7766704qkh.336.2020.03.14.14.43.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 14 Mar 2020 14:43:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=doWP880D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jDEZR-0003rU-LS
	for alex.bennee@linaro.org; Sat, 14 Mar 2020 17:43:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39526)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jDEZH-0003pN-2c
 for qemu-arm@nongnu.org; Sat, 14 Mar 2020 17:43:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jDEZF-0002if-LK
 for qemu-arm@nongnu.org; Sat, 14 Mar 2020 17:43:38 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:54303
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jDEZF-0002hH-Hw
 for qemu-arm@nongnu.org; Sat, 14 Mar 2020 17:43:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584222216;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wPYaHMdQgWbqDNSTL8ysZRFRs4ssDuipJO6nIgLDKso=;
 b=doWP880DjbcpanQaGbKLwYzzYmOYFzCsvE/L6A8sZELR+PeHeFUyROgBpStonAU1P0YW7a
 8C68l8sKOtRxkmfqsTDKxukfKHyq379zM3ly4szI11zB3zm0AvJNhzE0/L0K6mOVYibHB/
 w4OPlHCZNYO1bTbX+Y4AaqcgM4zt2s0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-475--62iox_CMRuJs-cBO9JHUQ-1; Sat, 14 Mar 2020 17:43:33 -0400
X-MC-Unique: -62iox_CMRuJs-cBO9JHUQ-1
Received: by mail-wr1-f72.google.com with SMTP id w6so6452131wrm.16
 for <qemu-arm@nongnu.org>; Sat, 14 Mar 2020 14:43:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mNXDYRnK8fpSbhMYOVk7MEQ+tXzPTf8LYDVUPRHbl7c=;
 b=Uh+uclmR3XCX4g8vvxK9Ucehy1/bBdF4PaWjtkYkqZQOtztIOht0jOsWnC4gYpeOu7
 UhJr+mzwbfyKse3b2aST8QweghWDIiCvgzGqBXiewvRsFRxTFwQrRGSkMcCLsiJwMjJE
 IMm81wIrhQWoY+tCJA1nwGgZdN82aUGYXtRliCxD/NkDM3BtyVF5dUy0G82zCd5zHHbf
 BfT+ecbLxONmJoreM3PanrYxJbWoEp4BWfIASId94zcQC7qZwpdKbI0pgw9qDk03IaIn
 GUtyCp4Okbxe/ggbsf5JwlJXSx0hEtxcNlNfnYvgj9riOmUpje16neWj4xBkV3YIz4XM
 c9Dw==
X-Gm-Message-State: ANhLgQ25LnFSRILIM51KvC7SPbcYb3KGWkfmdsgqLqj5ILwZOh2pYnHS
 AIHyLgN+vS39FQIRMy+VwXxymrACCwgVn4jjkbGKQmousbYJmQEjXCCF9tJKP9o6F8rEs8TA7jk
 JckIx615UPr4l
X-Received: by 2002:a1c:750e:: with SMTP id o14mr17724245wmc.156.1584222212038; 
 Sat, 14 Mar 2020 14:43:32 -0700 (PDT)
X-Received: by 2002:a1c:750e:: with SMTP id o14mr17724238wmc.156.1584222211798; 
 Sat, 14 Mar 2020 14:43:31 -0700 (PDT)
Received: from [192.168.1.40] (191.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.191])
 by smtp.gmail.com with ESMTPSA id u8sm39291807wrn.69.2020.03.14.14.43.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Mar 2020 14:43:31 -0700 (PDT)
Subject: Re: [PATCH 1/8] hw: Move i.MX watchdog driver to hw/watchdog
To: Guenter Roeck <linux@roeck-us.net>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20200314172736.24528-1-linux@roeck-us.net>
 <20200314172736.24528-2-linux@roeck-us.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <2f4064d2-445c-19a4-b873-b9dd0b09ff1c@redhat.com>
Date: Sat, 14 Mar 2020 22:43:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200314172736.24528-2-linux@roeck-us.net>
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
X-TUID: WA6eEKNR9tIx

Hi Guenter,

On 3/14/20 6:27 PM, Guenter Roeck wrote:
> In preparation for a full implementation, move i.MX watchdog driver
> from hw/misc to hw/watchdog. While at it, add the watchdog files
> to MAINTAINERS.
>=20
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>   MAINTAINERS                                         | 2 ++
>   hw/misc/Makefile.objs                               | 1 -
>   hw/watchdog/Kconfig                                 | 5 +++++
>   hw/watchdog/Makefile.objs                           | 1 +
>   hw/{misc/imx2_wdt.c =3D> watchdog/wdt_imx2.c}         | 2 +-
>   include/hw/arm/fsl-imx6.h                           | 2 +-
>   include/hw/arm/fsl-imx6ul.h                         | 2 +-
>   include/hw/arm/fsl-imx7.h                           | 2 +-
>   include/hw/{misc/imx2_wdt.h =3D> watchdog/wdt_imx2.h} | 0
>   9 files changed, 12 insertions(+), 5 deletions(-)
>   rename hw/{misc/imx2_wdt.c =3D> watchdog/wdt_imx2.c} (98%)
>   rename include/hw/{misc/imx2_wdt.h =3D> watchdog/wdt_imx2.h} (100%)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 32867bc636..d1197014e8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -603,8 +603,10 @@ S: Odd Fixes
>   F: hw/arm/fsl-imx25.c
>   F: hw/arm/imx25_pdk.c
>   F: hw/misc/imx25_ccm.c
> +F: hw/watchdog/wdt_imx2.c
>   F: include/hw/arm/fsl-imx25.h
>   F: include/hw/misc/imx25_ccm.h
> +F: include/hw/watchdog/wdt_imx2.h
>  =20
>   i.MX31 (kzm)
>   M: Peter Chubb <peter.chubb@nicta.com.au>
> diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
> index 68aae2eabb..b25181b711 100644
> --- a/hw/misc/Makefile.objs
> +++ b/hw/misc/Makefile.objs
> @@ -44,7 +44,6 @@ common-obj-$(CONFIG_IMX) +=3D imx6_ccm.o
>   common-obj-$(CONFIG_IMX) +=3D imx6ul_ccm.o
>   obj-$(CONFIG_IMX) +=3D imx6_src.o
>   common-obj-$(CONFIG_IMX) +=3D imx7_ccm.o
> -common-obj-$(CONFIG_IMX) +=3D imx2_wdt.o
>   common-obj-$(CONFIG_IMX) +=3D imx7_snvs.o
>   common-obj-$(CONFIG_IMX) +=3D imx7_gpr.o
>   common-obj-$(CONFIG_IMX) +=3D imx_rngc.o
> diff --git a/hw/watchdog/Kconfig b/hw/watchdog/Kconfig
> index 2118d897c9..2c225b4b17 100644
> --- a/hw/watchdog/Kconfig
> +++ b/hw/watchdog/Kconfig
> @@ -14,3 +14,8 @@ config WDT_IB700
>  =20
>   config WDT_DIAG288
>       bool
> +
> +config WDT_IMX2
> +    bool
> +    default y
> +    depends on IMX

- it does not depend of IMX (you could use it in another SoC)
- since it is not user-creatable, it is pointless as a default device.

Instead, select it in each iMX SoC:

-- >8 --
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index e5a876c8d1..cdb01c4e03 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -358,6 +358,7 @@ config FSL_IMX25
      select IMX
      select IMX_FEC
      select IMX_I2C
+    select WDT_IMX2
      select DS1338

  config FSL_IMX31
@@ -365,6 +366,7 @@ config FSL_IMX31
      select SERIAL
      select IMX
      select IMX_I2C
+    select WDT_IMX2
      select LAN9118

  config FSL_IMX6
@@ -373,6 +375,7 @@ config FSL_IMX6
      select IMX
      select IMX_FEC
      select IMX_I2C
+    select WDT_IMX2
      select SDHCI

---

With this hunk amended (and removing "default y" and "depends on IMX"):
Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

> diff --git a/hw/watchdog/Makefile.objs b/hw/watchdog/Makefile.objs
> index 3f536d1cad..dd9b37f642 100644
> --- a/hw/watchdog/Makefile.objs
> +++ b/hw/watchdog/Makefile.objs
> @@ -4,3 +4,4 @@ common-obj-$(CONFIG_WDT_IB6300ESB) +=3D wdt_i6300esb.o
>   common-obj-$(CONFIG_WDT_IB700) +=3D wdt_ib700.o
>   common-obj-$(CONFIG_WDT_DIAG288) +=3D wdt_diag288.o
>   common-obj-$(CONFIG_ASPEED_SOC) +=3D wdt_aspeed.o
> +common-obj-$(CONFIG_WDT_IMX) +=3D wdt_imx2.o
> diff --git a/hw/misc/imx2_wdt.c b/hw/watchdog/wdt_imx2.c
> similarity index 98%
> rename from hw/misc/imx2_wdt.c
> rename to hw/watchdog/wdt_imx2.c
> index 2aedfe803a..ad1ef02e9e 100644
> --- a/hw/misc/imx2_wdt.c
> +++ b/hw/watchdog/wdt_imx2.c
> @@ -14,7 +14,7 @@
>   #include "qemu/module.h"
>   #include "sysemu/watchdog.h"
>  =20
> -#include "hw/misc/imx2_wdt.h"
> +#include "hw/watchdog/wdt_imx2.h"
>  =20
>   #define IMX2_WDT_WCR_WDA    BIT(5)      /* -> External Reset WDOG_B */
>   #define IMX2_WDT_WCR_SRS    BIT(4)      /* -> Software Reset Signal */
> diff --git a/include/hw/arm/fsl-imx6.h b/include/hw/arm/fsl-imx6.h
> index 60eadccb42..5b02dc1f4b 100644
> --- a/include/hw/arm/fsl-imx6.h
> +++ b/include/hw/arm/fsl-imx6.h
> @@ -21,7 +21,7 @@
>   #include "hw/cpu/a9mpcore.h"
>   #include "hw/misc/imx6_ccm.h"
>   #include "hw/misc/imx6_src.h"
> -#include "hw/misc/imx2_wdt.h"
> +#include "hw/watchdog/wdt_imx2.h"
>   #include "hw/char/imx_serial.h"
>   #include "hw/timer/imx_gpt.h"
>   #include "hw/timer/imx_epit.h"
> diff --git a/include/hw/arm/fsl-imx6ul.h b/include/hw/arm/fsl-imx6ul.h
> index eda389aec7..91c746918a 100644
> --- a/include/hw/arm/fsl-imx6ul.h
> +++ b/include/hw/arm/fsl-imx6ul.h
> @@ -24,7 +24,7 @@
>   #include "hw/misc/imx7_snvs.h"
>   #include "hw/misc/imx7_gpr.h"
>   #include "hw/intc/imx_gpcv2.h"
> -#include "hw/misc/imx2_wdt.h"
> +#include "hw/watchdog/wdt_imx2.h"
>   #include "hw/gpio/imx_gpio.h"
>   #include "hw/char/imx_serial.h"
>   #include "hw/timer/imx_gpt.h"
> diff --git a/include/hw/arm/fsl-imx7.h b/include/hw/arm/fsl-imx7.h
> index 706aef2e7e..3a0041c4c2 100644
> --- a/include/hw/arm/fsl-imx7.h
> +++ b/include/hw/arm/fsl-imx7.h
> @@ -26,7 +26,7 @@
>   #include "hw/misc/imx7_snvs.h"
>   #include "hw/misc/imx7_gpr.h"
>   #include "hw/misc/imx6_src.h"
> -#include "hw/misc/imx2_wdt.h"
> +#include "hw/watchdog/wdt_imx2.h"
>   #include "hw/gpio/imx_gpio.h"
>   #include "hw/char/imx_serial.h"
>   #include "hw/timer/imx_gpt.h"
> diff --git a/include/hw/misc/imx2_wdt.h b/include/hw/watchdog/wdt_imx2.h
> similarity index 100%
> rename from include/hw/misc/imx2_wdt.h
> rename to include/hw/watchdog/wdt_imx2.h
>=20

