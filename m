Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3944971lfm;
        Sun, 5 Jul 2020 02:26:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzmpaihJ7MGSM9mn4R9ysZ8QQZKUpaXb6nB/L21LxogXC7oxx13sW0r5NY9c/BO8WSzXfj6
X-Received: by 2002:a25:3b93:: with SMTP id i141mr6679585yba.28.1593941198854;
        Sun, 05 Jul 2020 02:26:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593941198; cv=none;
        d=google.com; s=arc-20160816;
        b=WGJQhRNKj5GYPF2QfKFMK5Ocr8TfL0dcTD1bnV8WhHA6DJ3Cz+e2kZILCx3sx3tkl2
         oBu+Uq/zAxrZJPitE2Jxq5cg51knSCmzW5TeyXls5NX8pVULO7iiiDC14ATFDmelA8aO
         vSuvcM2MbcqWN62lzIanEXq1JRhwb2jhOvkP/EvC02hdsMdi1DELrkSsJ33Y96w5nCk8
         F1aDB/zZchhM9kiKRCM4F+kleLKoeodoj2tRGQLu/sDqqD44czsKIEKfsxAbMPZoD/68
         E3RZuyhWpkOPhF9rI5GYuaoMF7UtUxSMI18p/8hmZDwzzoZG2nxW6fBM/1LN6i0ukQn/
         DVgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=V6VxSUE4Bn25txtzYc2pOs5ttoLW2r+gnS/zuul7E4Q=;
        b=WAVrcz7Ab5hqFhxMG3MoKav8pvT3n2E4nqBX1y8Y8DDob/llqalQ9YBnal8Jum+X7+
         YcDJxIX45UYAe6Kof2LHPEhk17UCDO67SchiN/hNgpH0blGcvZEI14etCMGyCGs12hKe
         xjOCJSQT7Ixw4uYmVB1aT4j9VlNN/ORa/jvEhMHx9Q/juLLxDoPo5F8DGCZZusjUoQhf
         vKiL+93ju84HBmGpAxQ9Ea2Oo1JuGvsQhi6tLh2u4+bzi0uT8ynKa4gejnOfmWrVAFaS
         ge089YTuYqc+FKbbM2z1SxSLBretyT5hh5hKtFtBiZNJr+9KDjOaOEbetntrGrMXRHyn
         FOCA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=O+ekF3GW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p6si11734183ybm.376.2020.07.05.02.26.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 05 Jul 2020 02:26:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=O+ekF3GW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:38616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1js0v0-0006tv-89
	for alex.bennee@linaro.org; Sun, 05 Jul 2020 05:26:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1js0um-0006g3-0T; Sun, 05 Jul 2020 05:26:24 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:56188)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1js0uk-0006kJ-6y; Sun, 05 Jul 2020 05:26:23 -0400
Received: by mail-wm1-x342.google.com with SMTP id g75so36044622wme.5;
 Sun, 05 Jul 2020 02:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=V6VxSUE4Bn25txtzYc2pOs5ttoLW2r+gnS/zuul7E4Q=;
 b=O+ekF3GWrxTOzHZ0BXua7IHles3NGTwEiTdtbTwPbSx5SXIYw2TK/E6b5CRrqy0mBR
 ZZWQP+ly3nzbTRQD6TEw9YxQvPZp6hZBAyAQhaf08DrKnyb/X2AUwEiEy0bmncIE6s3e
 ow9/lwSEh1PH7a7iOFpGvRcHV24T9iMoM0H+S0RAMvAyHkE+gIpIs70JuzXFEmrkNT09
 DC/TNnWaKbXa1nicfAMu09rX1cjTEw8izyQFKH/MPKE8/fIc3T9jBVtNECURNS2XWoVN
 k0uFGgXqN+Z3VhAHfMcsz9KWS+dCCBNAtklP3Mo6/p+tK0yrEED2igLLLC91GAtis/+/
 JTYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=V6VxSUE4Bn25txtzYc2pOs5ttoLW2r+gnS/zuul7E4Q=;
 b=Tq6EEwQJFJQq4HvNa3Q/bpP1u+Be2BHNoYHIkwbta4WlVBaUKo7eN3TYCNo7PIo7Et
 dl3FO/mZvvzCrimPIFwZS36Trj2YV7ubrVXcf7E2Tg6/ig1GNcbu8TQ3byhevbAps1AQ
 GFT1Sgy2XoJ9cWLRNdgupv1++T+dTW54kKuIP0rFhnmhDObSq9x1W8gGtbYiYA3tUsCW
 l8GVF1F1gnj3jkLH0ggDuEV+7T+kyilYyj630jk0xTUpyMlJayNbCrMdBO5F2ujWjrol
 2/D6PsCGBC6NgJiy1E+yF2S7GW52ToszLpmcW+t4xpy2qNzWU+PpVplyo1reov3B8BfV
 MvIA==
X-Gm-Message-State: AOAM530UQ1r+84D8FLBW29j4nXqtUyQacMUW3dGMHUNBIikhHf8TvULy
 E+BKlEshWYUg8QlmZ6UE4wQ=
X-Received: by 2002:a1c:44e:: with SMTP id 75mr44874861wme.139.1593941180006; 
 Sun, 05 Jul 2020 02:26:20 -0700 (PDT)
Received: from [192.168.1.39] (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id w7sm19483180wmc.32.2020.07.05.02.26.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Jul 2020 02:26:19 -0700 (PDT)
Subject: Re: [PATCH 23/26] hw/usb/usb-hcd: Use EHCI type definitions
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <20200704144943.18292-1-f4bug@amsat.org>
 <20200704144943.18292-24-f4bug@amsat.org>
 <alpine.BSF.2.22.395.2007041914490.92265@zero.eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f046b629-7b13-16d2-bb35-b4eda6fbc02b@amsat.org>
Date: Sun, 5 Jul 2020 11:26:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <alpine.BSF.2.22.395.2007041914490.92265@zero.eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Huacai Chen <chenhc@lemote.com>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Paul Durrant <paul@xen.org>, Magnus Damm <magnus.damm@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Leif Lindholm <leif@nuviainc.com>, Andrzej Zaborowski <balrogg@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <rth@twiddle.net>,
 Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Paul Zimmerman <pauldzim@gmail.com>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kkJjkJC6bAQz

On 7/4/20 7:15 PM, BALATON Zoltan wrote:
> On Sat, 4 Jul 2020, Philippe Mathieu-Daudé wrote:
>> Various machine/board/soc models create EHCI device instances
>> with the generic QDEV API, and don't need to access USB internals.
>>
>> Simplify header inclusions by moving the QOM type names into a
>> simple header, with no need to include other "hw/usb" headers.
>>
>> Suggested-by: BALATON Zoltan <balaton@eik.bme.hu>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>> hw/usb/hcd-ehci.h         | 11 +----------
>> include/hw/usb/chipidea.h |  2 +-
>> include/hw/usb/usb-hcd.h  | 11 +++++++++++
>> hw/arm/allwinner-h3.c     |  1 -
>> hw/arm/exynos4210.c       |  2 +-
>> hw/arm/sbsa-ref.c         |  3 ++-
>> hw/arm/xilinx_zynq.c      |  2 +-
>> hw/ppc/sam460ex.c         |  1 -
>> hw/usb/chipidea.c         |  1 +
>> hw/usb/hcd-ehci-sysbus.c  |  1 +
>> 10 files changed, 19 insertions(+), 16 deletions(-)
>>
>> diff --git a/hw/usb/hcd-ehci.h b/hw/usb/hcd-ehci.h
>> index 337b3ad05c..da70767409 100644
>> --- a/hw/usb/hcd-ehci.h
>> +++ b/hw/usb/hcd-ehci.h
>> @@ -23,6 +23,7 @@
>> #include "hw/pci/pci.h"
>> #include "hw/sysbus.h"
>> #include "usb-internal.h"
>> +#include "hw/usb/usb-hcd.h"
>>
>> #define CAPA_SIZE        0x10
>>
>> @@ -316,7 +317,6 @@ void usb_ehci_realize(EHCIState *s, DeviceState
>> *dev, Error **errp);
>> void usb_ehci_unrealize(EHCIState *s, DeviceState *dev);
>> void ehci_reset(void *opaque);
>>
>> -#define TYPE_PCI_EHCI "pci-ehci-usb"
>> #define PCI_EHCI(obj) OBJECT_CHECK(EHCIPCIState, (obj), TYPE_PCI_EHCI)
>>
>> typedef struct EHCIPCIState {
>> @@ -327,15 +327,6 @@ typedef struct EHCIPCIState {
>>     EHCIState ehci;
>> } EHCIPCIState;
>>
>> -
>> -#define TYPE_SYS_BUS_EHCI "sysbus-ehci-usb"
>> -#define TYPE_PLATFORM_EHCI "platform-ehci-usb"
>> -#define TYPE_EXYNOS4210_EHCI "exynos4210-ehci-usb"
>> -#define TYPE_AW_H3_EHCI "aw-h3-ehci-usb"
>> -#define TYPE_TEGRA2_EHCI "tegra2-ehci-usb"
>> -#define TYPE_PPC4xx_EHCI "ppc4xx-ehci-usb"
>> -#define TYPE_FUSBH200_EHCI "fusbh200-ehci-usb"
>> -
>> #define SYS_BUS_EHCI(obj) \
>>     OBJECT_CHECK(EHCISysBusState, (obj), TYPE_SYS_BUS_EHCI)
>> #define SYS_BUS_EHCI_CLASS(class) \
>> diff --git a/include/hw/usb/chipidea.h b/include/hw/usb/chipidea.h
>> index 1ec2e9dbda..28f46291de 100644
>> --- a/include/hw/usb/chipidea.h
>> +++ b/include/hw/usb/chipidea.h
>> @@ -2,6 +2,7 @@
>> #define CHIPIDEA_H
>>
>> #include "hw/usb/hcd-ehci.h"
>> +#include "hw/usb/usb-hcd.h"
>>
>> typedef struct ChipideaState {
>>     /*< private >*/
>> @@ -10,7 +11,6 @@ typedef struct ChipideaState {
>>     MemoryRegion iomem[3];
>> } ChipideaState;
>>
>> -#define TYPE_CHIPIDEA "usb-chipidea"
>> #define CHIPIDEA(obj) OBJECT_CHECK(ChipideaState, (obj), TYPE_CHIPIDEA)
>>
>> #endif /* CHIPIDEA_H */
>> diff --git a/include/hw/usb/usb-hcd.h b/include/hw/usb/usb-hcd.h
>> index 21fdfaf22d..74af3a4533 100644
>> --- a/include/hw/usb/usb-hcd.h
>> +++ b/include/hw/usb/usb-hcd.h
>> @@ -13,4 +13,15 @@
>> #define TYPE_SYSBUS_OHCI            "sysbus-ohci"
>> #define TYPE_PCI_OHCI               "pci-ohci"
>>
>> +/* EHCI */
>> +#define TYPE_SYS_BUS_EHCI           "sysbus-ehci-usb"
>> +#define TYPE_PCI_EHCI               "pci-ehci-usb"
>> +#define TYPE_PLATFORM_EHCI          "platform-ehci-usb"
>> +#define TYPE_EXYNOS4210_EHCI        "exynos4210-ehci-usb"
>> +#define TYPE_AW_H3_EHCI             "aw-h3-ehci-usb"
>> +#define TYPE_TEGRA2_EHCI            "tegra2-ehci-usb"
>> +#define TYPE_PPC4xx_EHCI            "ppc4xx-ehci-usb"
>> +#define TYPE_FUSBH200_EHCI          "fusbh200-ehci-usb"
>> +#define TYPE_CHIPIDEA               "usb-chipidea"
>> +
>> #endif
>> diff --git a/hw/arm/allwinner-h3.c b/hw/arm/allwinner-h3.c
>> index d1d90ffa79..8b7adddc27 100644
>> --- a/hw/arm/allwinner-h3.c
>> +++ b/hw/arm/allwinner-h3.c
>> @@ -29,7 +29,6 @@
>> #include "hw/char/serial.h"
>> #include "hw/misc/unimp.h"
>> #include "hw/usb/usb-hcd.h"
>> -#include "hw/usb/hcd-ehci.h"
>> #include "hw/loader.h"
>> #include "sysemu/sysemu.h"
>> #include "hw/arm/allwinner-h3.h"
>> diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
>> index fa639806ec..692fb02159 100644
>> --- a/hw/arm/exynos4210.c
>> +++ b/hw/arm/exynos4210.c
>> @@ -35,7 +35,7 @@
>> #include "hw/qdev-properties.h"
>> #include "hw/arm/exynos4210.h"
>> #include "hw/sd/sdhci.h"
>> -#include "hw/usb/hcd-ehci.h"
>> +#include "hw/usb/usb-hcd.h"
>>
>> #define EXYNOS4210_CHIPID_ADDR         0x10000000
>>
>> diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
>> index 021e7c1b8b..4e4c338ae9 100644
>> --- a/hw/arm/sbsa-ref.c
>> +++ b/hw/arm/sbsa-ref.c
>> @@ -38,6 +38,7 @@
>> #include "hw/loader.h"
>> #include "hw/pci-host/gpex.h"
>> #include "hw/qdev-properties.h"
>> +#include "hw/usb/usb-hcd.h"
>> #include "hw/char/pl011.h"
>> #include "net/net.h"
>>
>> @@ -485,7 +486,7 @@ static void create_ehci(const SBSAMachineState *sms)
>>     hwaddr base = sbsa_ref_memmap[SBSA_EHCI].base;
>>     int irq = sbsa_ref_irqmap[SBSA_EHCI];
>>
>> -    sysbus_create_simple("platform-ehci-usb", base,
>> +    sysbus_create_simple(TYPE_PLATFORM_EHCI, base,
>>                          qdev_get_gpio_in(sms->gic, irq));
>> }
>>
>> diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
>> index ed970273f3..9ccdc03095 100644
>> --- a/hw/arm/xilinx_zynq.c
>> +++ b/hw/arm/xilinx_zynq.c
>> @@ -29,7 +29,7 @@
>> #include "hw/loader.h"
>> #include "hw/misc/zynq-xadc.h"
>> #include "hw/ssi/ssi.h"
>> -#include "hw/usb/chipidea.h"
>> +#include "hw/usb/usb-hcd.h"
>> #include "qemu/error-report.h"
>> #include "hw/sd/sdhci.h"
>> #include "hw/char/cadence_uart.h"
>> diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
>> index ac60d17a86..3f7cf0d1ae 100644
>> --- a/hw/ppc/sam460ex.c
>> +++ b/hw/ppc/sam460ex.c
>> @@ -37,7 +37,6 @@
>> #include "hw/i2c/smbus_eeprom.h"
>> #include "hw/usb/usb.h"
>> #include "hw/usb/usb-hcd.h"
>> -#include "hw/usb/hcd-ehci.h"
>> #include "hw/ppc/fdt.h"
>> #include "hw/qdev-properties.h"
>> #include "hw/pci/pci.h"
>> diff --git a/hw/usb/chipidea.c b/hw/usb/chipidea.c
>> index 3dcd22ccba..e81f63295e 100644
>> --- a/hw/usb/chipidea.c
>> +++ b/hw/usb/chipidea.c
>> @@ -11,6 +11,7 @@
>>
>> #include "qemu/osdep.h"
>> #include "hw/usb/hcd-ehci.h"
>> +#include "hw/usb/usb-hcd.h"
>> #include "hw/usb/chipidea.h"
>> #include "qemu/log.h"
>> #include "qemu/module.h"
>> diff --git a/hw/usb/hcd-ehci-sysbus.c b/hw/usb/hcd-ehci-sysbus.c
>> index 3730736540..b7debc1934 100644
>> --- a/hw/usb/hcd-ehci-sysbus.c
>> +++ b/hw/usb/hcd-ehci-sysbus.c
>> @@ -18,6 +18,7 @@
>> #include "qemu/osdep.h"
>> #include "hw/qdev-properties.h"
>> #include "hw/usb/hcd-ehci.h"
>> +#include "hw/usb/usb-hcd.h"
>> #include "migration/vmstate.h"
>> #include "qemu/module.h"
> 
> Do these last two still need hw/usb/hcd-ehci.h? If so do they get
> hw/usb/usb-hcd.h via that one so do they need to explicitely include it
> again?

chipidea.c implements an HCI, so it uses the hcd-ehci.h internals,
else we get:

usb/chipidea.c:96:5: error: unknown type name ‘EHCIState’
   96 |     EHCIState *ehci = &SYS_BUS_EHCI(obj)->ehci;
      |     ^~~~~~~~~
hw/usb/chipidea.c:152:5: error: unknown type name ‘SysBusEHCIClass’
  152 |     SysBusEHCIClass *sec = SYS_BUS_EHCI_CLASS(klass);
      |     ^~~~~~~~~~~~~~~
hw/usb/chipidea.c:152:28: error: implicit declaration of function
‘SYS_BUS_EHCI_CLASS’ [-Werror=implicit-function-declaration]
  152 |     SysBusEHCIClass *sec = SYS_BUS_EHCI_CLASS(klass);
      |                            ^~~~~~~~~~~~~~~~~~

Similarly with hcd-ehci-sysbus.c:

hw/usb/hcd-ehci-sysbus.c:30:50: error: ‘vmstate_ehci’ undeclared here
(not in a function)
   30 |         VMSTATE_STRUCT(ehci, EHCISysBusState, 2, vmstate_ehci,
EHCIState),
      |                                                  ^~~~~~~~~~~~
hw/usb/hcd-ehci-sysbus.c:45:26: error: implicit declaration of function
‘SYS_BUS_EHCI’; did you mean ‘TYPE_SYS_BUS_EHCI’?
[-Werror=implicit-function-declaration]
   45 |     EHCISysBusState *i = SYS_BUS_EHCI(dev);
      |                          ^~~~~~~~~~~~
      |                          TYPE_SYS_BUS_EHCI
hw/usb/hcd-ehci-sysbus.c:48:5: error: implicit declaration of function
‘usb_ehci_realize’; did you mean ‘usb_ehci_sysbus_realize’?
[-Werror=implicit-function-declaration]
   48 |     usb_ehci_realize(s, dev, errp);
      |     ^~~~~~~~~~~~~~~~
      |     usb_ehci_sysbus_realize
hw/usb/hcd-ehci-sysbus.c:74:5: error: implicit declaration of function
‘usb_ehci_init’ [-Werror=implicit-function-declaration]
   74 |     usb_ehci_init(s, DEVICE(obj));
      |     ^~~~~~~~~~~~~

The idea of "hw/usb/usb-hcd.h" is to keep USB internals opaque to
machine/board/soc using controllers, they just want to use the
devices.

I'll see how to reword the description to make that clearer.

> 
> Regards,
> BALATON Zoltan
