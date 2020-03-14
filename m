Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1089987lfc;
        Sat, 14 Mar 2020 14:46:58 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvrx0XZ9xyXTQTPSuSArRN7O2vE4Og1G8kCK5lKLOVKYCkMZOTmM+60Y0DfIf4aZ5Wg5jIE
X-Received: by 2002:a37:9f58:: with SMTP id i85mr19130782qke.196.1584222417976;
        Sat, 14 Mar 2020 14:46:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584222417; cv=none;
        d=google.com; s=arc-20160816;
        b=QoXZS6XasrSCiNdMEmNErW0x26ivNynLWkqaOGkzZ1hle0RFwMoAnL8a9JbN7m1ux6
         0FnXI7BAGfCgwdM6tOTkhm7LdL0OjbamYwKlH8qOqRK3N2625Vb+miKvXdoJI52EoVs/
         kx8v4nP50n28pyre0+uatB6lz7Gd1O8fyAQDnkMOylweVL8dSHulgzkI7Y5M6kG+Jgw0
         FEqph1w0j78xnDNmDkdEJt4v5SMzHXYtEqrXmyr4FB+SLghbKaSVoVTSuRVnc7vyp9bm
         fHY1Hy+AxccfDpDx+/AiSiOvsCaW/O5Hr8INRCgo1ZVKvUXBjCbVTWmaH8aLFoaDRBgl
         X2bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:to:from:subject:dkim-signature;
        bh=nFMhiLtBpilaLlJIrRto+B9qeNXM2B6m9U05kOYWD5E=;
        b=EECuLpEYv0JMjmqAq9SIt1kZIXHOZX+ToCgwCm+ScN8PQ+1kgg0UoLZQ8chj7kqTxl
         sh5HzPJpdOY2RMHNIoNQ07g/aUCq9anGUp4ov21ytHH0bEpXFH5WmDFKdxHQMhV2TvFc
         Yfgm2h6nrFU3to6G/58ATXklzd+3ekQE5L+LmQg8P4H8zd6pRacUvmiel50qY/TmwHu2
         efxl0dWLbiL4Miyygo7atJStNznArrkqkOAu2abSCFTFI/v5hLluW7MC/xvM2utfpTki
         ZCXk8aAFKm9sgghwm5thWsNGL2usksO3HoCr42uRaz7I2Z8tWWihla9qH5F7BtyqaKI0
         +jFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CSHkFx5W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 42si7424068qtc.273.2020.03.14.14.46.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 14 Mar 2020 14:46:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CSHkFx5W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jDEcT-00054u-Di
	for alex.bennee@linaro.org; Sat, 14 Mar 2020 17:46:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40657)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jDEcK-00052E-07
 for qemu-arm@nongnu.org; Sat, 14 Mar 2020 17:46:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jDEcI-0006Fw-2k
 for qemu-arm@nongnu.org; Sat, 14 Mar 2020 17:46:47 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:46328
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jDEcH-0006FW-W3
 for qemu-arm@nongnu.org; Sat, 14 Mar 2020 17:46:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584222405;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nFMhiLtBpilaLlJIrRto+B9qeNXM2B6m9U05kOYWD5E=;
 b=CSHkFx5Wtg7FFQTFK48riNhnVespm4Yuz6mpTCmOMbZYSxbuLkDHIWh8VZkXgCzPG+Rdrb
 mLLH/W+e6rlStLYfk/RueoRmzYb/6wvEyP+aE9dpBTHnk4KOwIAOrjaQcshjo7kQJw90nq
 vcte/LcffjteAEqAGoXbCw4FYQo+nCY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-67-kCs7ENj0NluKB6l3XgS-Ow-1; Sat, 14 Mar 2020 17:46:41 -0400
X-MC-Unique: kCs7ENj0NluKB6l3XgS-Ow-1
Received: by mail-wr1-f70.google.com with SMTP id c16so6524544wrt.2
 for <qemu-arm@nongnu.org>; Sat, 14 Mar 2020 14:46:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fpndlkWduUksWFX4N1aXFb3mgNipbmhqnJ4Nq+IGKdc=;
 b=Fkp7ZM7s5kEZX/QqaTqbKHYK0Tz62CvNMiW5Cl86aZ1G3ijZwjka1i0gT1WDU8cwq/
 m+PcjRswYXzWiuEuxc1YybsNM6UFg0AnJeE4t78ep0QUC/9Gk4Q6iJvzajbHoKbDqUZK
 XCDgp5Ep1d6oxT7QwekMunEzYkXRcZl7WZNuo9+PKmEG8ydseBziMViXAx05JfQ+oiFo
 EPP1epsjO9nNTEqI6mZNTag0lY+plC1wwB9Ua21KMFyrJIMxgEGYxIS0n7ysKlJp8kOk
 NixeqmkpZKctaVrggMlDeQnYROAylT9Hd8xJu54qKDjZ/8Y0uxfB+PKEBX5+cHKvIhfA
 MUYQ==
X-Gm-Message-State: ANhLgQ32kRnNGfzUJTm2PgjiAGmDjgjqN5QodMx3KnLbZ1BE6sieVcxT
 PABX0B+8xAp5r9e1kZbv/e18/mtHEthYGpnwkg6keS9fZPEyamLlT+32dn5GuJdlXLSsXG/YfEP
 TvNDRRWye78vR
X-Received: by 2002:a1c:2701:: with SMTP id n1mr18352417wmn.180.1584222400146; 
 Sat, 14 Mar 2020 14:46:40 -0700 (PDT)
X-Received: by 2002:a1c:2701:: with SMTP id n1mr18352406wmn.180.1584222399852; 
 Sat, 14 Mar 2020 14:46:39 -0700 (PDT)
Received: from [192.168.1.40] (191.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.191])
 by smtp.gmail.com with ESMTPSA id l64sm23226791wmf.30.2020.03.14.14.46.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Mar 2020 14:46:39 -0700 (PDT)
Subject: Re: [PATCH 1/8] hw: Move i.MX watchdog driver to hw/watchdog
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Guenter Roeck <linux@roeck-us.net>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20200314172736.24528-1-linux@roeck-us.net>
 <20200314172736.24528-2-linux@roeck-us.net>
 <2f4064d2-445c-19a4-b873-b9dd0b09ff1c@redhat.com>
Message-ID: <60882898-e604-8474-627c-715bae9fd320@redhat.com>
Date: Sat, 14 Mar 2020 22:46:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <2f4064d2-445c-19a4-b873-b9dd0b09ff1c@redhat.com>
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
X-TUID: TGWGysfo6CdG

On 3/14/20 10:43 PM, Philippe Mathieu-Daud=E9 wrote:
> Hi Guenter,
>=20
> On 3/14/20 6:27 PM, Guenter Roeck wrote:
>> In preparation for a full implementation, move i.MX watchdog driver
>> from hw/misc to hw/watchdog. While at it, add the watchdog files
>> to MAINTAINERS.
>>
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>> ---
>> =A0 MAINTAINERS=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 | 2 ++
>> =A0 hw/misc/Makefile.objs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 | 1 -
>> =A0 hw/watchdog/Kconfig=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 | 5 +++++
>> =A0 hw/watchdog/Makefile.objs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 | 1 +
>> =A0 hw/{misc/imx2_wdt.c =3D> watchdog/wdt_imx2.c}=A0=A0=A0=A0=A0=A0=A0=
=A0 | 2 +-
>> =A0 include/hw/arm/fsl-imx6.h=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 | 2 +-
>> =A0 include/hw/arm/fsl-imx6ul.h=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 | 2 +-
>> =A0 include/hw/arm/fsl-imx7.h=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 | 2 +-
>> =A0 include/hw/{misc/imx2_wdt.h =3D> watchdog/wdt_imx2.h} | 0
>> =A0 9 files changed, 12 insertions(+), 5 deletions(-)
>> =A0 rename hw/{misc/imx2_wdt.c =3D> watchdog/wdt_imx2.c} (98%)
>> =A0 rename include/hw/{misc/imx2_wdt.h =3D> watchdog/wdt_imx2.h} (100%)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 32867bc636..d1197014e8 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -603,8 +603,10 @@ S: Odd Fixes
>> =A0 F: hw/arm/fsl-imx25.c
>> =A0 F: hw/arm/imx25_pdk.c
>> =A0 F: hw/misc/imx25_ccm.c
>> +F: hw/watchdog/wdt_imx2.c
>> =A0 F: include/hw/arm/fsl-imx25.h
>> =A0 F: include/hw/misc/imx25_ccm.h
>> +F: include/hw/watchdog/wdt_imx2.h
>> =A0 i.MX31 (kzm)
>> =A0 M: Peter Chubb <peter.chubb@nicta.com.au>
>> diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
>> index 68aae2eabb..b25181b711 100644
>> --- a/hw/misc/Makefile.objs
>> +++ b/hw/misc/Makefile.objs
>> @@ -44,7 +44,6 @@ common-obj-$(CONFIG_IMX) +=3D imx6_ccm.o
>> =A0 common-obj-$(CONFIG_IMX) +=3D imx6ul_ccm.o
>> =A0 obj-$(CONFIG_IMX) +=3D imx6_src.o
>> =A0 common-obj-$(CONFIG_IMX) +=3D imx7_ccm.o
>> -common-obj-$(CONFIG_IMX) +=3D imx2_wdt.o
>> =A0 common-obj-$(CONFIG_IMX) +=3D imx7_snvs.o
>> =A0 common-obj-$(CONFIG_IMX) +=3D imx7_gpr.o
>> =A0 common-obj-$(CONFIG_IMX) +=3D imx_rngc.o
>> diff --git a/hw/watchdog/Kconfig b/hw/watchdog/Kconfig
>> index 2118d897c9..2c225b4b17 100644
>> --- a/hw/watchdog/Kconfig
>> +++ b/hw/watchdog/Kconfig
>> @@ -14,3 +14,8 @@ config WDT_IB700
>> =A0 config WDT_DIAG288
>> =A0=A0=A0=A0=A0 bool
>> +
>> +config WDT_IMX2
>> +=A0=A0=A0 bool
>> +=A0=A0=A0 default y
>> +=A0=A0=A0 depends on IMX
>=20
> - it does not depend of IMX (you could use it in another SoC)
> - since it is not user-creatable, it is pointless as a default device.
>=20
> Instead, select it in each iMX SoC:
>=20
> -- >8 --
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index e5a876c8d1..cdb01c4e03 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -358,6 +358,7 @@ config FSL_IMX25
>  =A0=A0=A0=A0 select IMX
>  =A0=A0=A0=A0 select IMX_FEC
>  =A0=A0=A0=A0 select IMX_I2C
> +=A0=A0=A0 select WDT_IMX2
>  =A0=A0=A0=A0 select DS1338
>=20
>  =A0config FSL_IMX31
> @@ -365,6 +366,7 @@ config FSL_IMX31
>  =A0=A0=A0=A0 select SERIAL
>  =A0=A0=A0=A0 select IMX
>  =A0=A0=A0=A0 select IMX_I2C
> +=A0=A0=A0 select WDT_IMX2
>  =A0=A0=A0=A0 select LAN9118
>=20
>  =A0config FSL_IMX6
> @@ -373,6 +375,7 @@ config FSL_IMX6
>  =A0=A0=A0=A0 select IMX
>  =A0=A0=A0=A0 select IMX_FEC
>  =A0=A0=A0=A0 select IMX_I2C
> +=A0=A0=A0 select WDT_IMX2
>  =A0=A0=A0=A0 select SDHCI
>=20
> ---

Corrected hunk:

-- >8 --
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index e5a876c8d1..c662d5f1e0 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -373,6 +373,7 @@ config FSL_IMX6
      select IMX
      select IMX_FEC
      select IMX_I2C
+    select WDT_IMX2
      select SDHCI

  config ASPEED_SOC
@@ -410,6 +411,7 @@ config FSL_IMX7
      select IMX
      select IMX_FEC
      select IMX_I2C
+    select WDT_IMX2
      select PCI_EXPRESS_DESIGNWARE
      select SDHCI
      select UNIMP
@@ -423,6 +425,7 @@ config FSL_IMX6UL
      select IMX
      select IMX_FEC
      select IMX_I2C
+    select WDT_IMX2
      select SDHCI
      select UNIMP

---

>=20
> With this hunk amended (and removing "default y" and "depends on IMX"):
> Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
>=20
>> diff --git a/hw/watchdog/Makefile.objs b/hw/watchdog/Makefile.objs
>> index 3f536d1cad..dd9b37f642 100644
>> --- a/hw/watchdog/Makefile.objs
>> +++ b/hw/watchdog/Makefile.objs
>> @@ -4,3 +4,4 @@ common-obj-$(CONFIG_WDT_IB6300ESB) +=3D wdt_i6300esb.o
>> =A0 common-obj-$(CONFIG_WDT_IB700) +=3D wdt_ib700.o
>> =A0 common-obj-$(CONFIG_WDT_DIAG288) +=3D wdt_diag288.o
>> =A0 common-obj-$(CONFIG_ASPEED_SOC) +=3D wdt_aspeed.o
>> +common-obj-$(CONFIG_WDT_IMX) +=3D wdt_imx2.o
>> diff --git a/hw/misc/imx2_wdt.c b/hw/watchdog/wdt_imx2.c
>> similarity index 98%
>> rename from hw/misc/imx2_wdt.c
>> rename to hw/watchdog/wdt_imx2.c
>> index 2aedfe803a..ad1ef02e9e 100644
>> --- a/hw/misc/imx2_wdt.c
>> +++ b/hw/watchdog/wdt_imx2.c
>> @@ -14,7 +14,7 @@
>> =A0 #include "qemu/module.h"
>> =A0 #include "sysemu/watchdog.h"
>> -#include "hw/misc/imx2_wdt.h"
>> +#include "hw/watchdog/wdt_imx2.h"
>> =A0 #define IMX2_WDT_WCR_WDA=A0=A0=A0 BIT(5)=A0=A0=A0=A0=A0 /* -> Extern=
al Reset WDOG_B */
>> =A0 #define IMX2_WDT_WCR_SRS=A0=A0=A0 BIT(4)=A0=A0=A0=A0=A0 /* -> Softwa=
re Reset Signal */
>> diff --git a/include/hw/arm/fsl-imx6.h b/include/hw/arm/fsl-imx6.h
>> index 60eadccb42..5b02dc1f4b 100644
>> --- a/include/hw/arm/fsl-imx6.h
>> +++ b/include/hw/arm/fsl-imx6.h
>> @@ -21,7 +21,7 @@
>> =A0 #include "hw/cpu/a9mpcore.h"
>> =A0 #include "hw/misc/imx6_ccm.h"
>> =A0 #include "hw/misc/imx6_src.h"
>> -#include "hw/misc/imx2_wdt.h"
>> +#include "hw/watchdog/wdt_imx2.h"
>> =A0 #include "hw/char/imx_serial.h"
>> =A0 #include "hw/timer/imx_gpt.h"
>> =A0 #include "hw/timer/imx_epit.h"
>> diff --git a/include/hw/arm/fsl-imx6ul.h b/include/hw/arm/fsl-imx6ul.h
>> index eda389aec7..91c746918a 100644
>> --- a/include/hw/arm/fsl-imx6ul.h
>> +++ b/include/hw/arm/fsl-imx6ul.h
>> @@ -24,7 +24,7 @@
>> =A0 #include "hw/misc/imx7_snvs.h"
>> =A0 #include "hw/misc/imx7_gpr.h"
>> =A0 #include "hw/intc/imx_gpcv2.h"
>> -#include "hw/misc/imx2_wdt.h"
>> +#include "hw/watchdog/wdt_imx2.h"
>> =A0 #include "hw/gpio/imx_gpio.h"
>> =A0 #include "hw/char/imx_serial.h"
>> =A0 #include "hw/timer/imx_gpt.h"
>> diff --git a/include/hw/arm/fsl-imx7.h b/include/hw/arm/fsl-imx7.h
>> index 706aef2e7e..3a0041c4c2 100644
>> --- a/include/hw/arm/fsl-imx7.h
>> +++ b/include/hw/arm/fsl-imx7.h
>> @@ -26,7 +26,7 @@
>> =A0 #include "hw/misc/imx7_snvs.h"
>> =A0 #include "hw/misc/imx7_gpr.h"
>> =A0 #include "hw/misc/imx6_src.h"
>> -#include "hw/misc/imx2_wdt.h"
>> +#include "hw/watchdog/wdt_imx2.h"
>> =A0 #include "hw/gpio/imx_gpio.h"
>> =A0 #include "hw/char/imx_serial.h"
>> =A0 #include "hw/timer/imx_gpt.h"
>> diff --git a/include/hw/misc/imx2_wdt.h b/include/hw/watchdog/wdt_imx2.h
>> similarity index 100%
>> rename from include/hw/misc/imx2_wdt.h
>> rename to include/hw/watchdog/wdt_imx2.h
>>

