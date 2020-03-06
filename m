Received: by 2002:ac2:4942:0:0:0:0:0 with SMTP id o2csp3987970lfi;
        Fri, 6 Mar 2020 01:42:41 -0800 (PST)
X-Google-Smtp-Source: ADFU+vs8qhFGPh9RRXUb59+DKYDjME67MaNrMm3mehq4N6pkb0urqxv0PK7UDSSURZnVGc6aJzE5
X-Received: by 2002:a05:6214:1784:: with SMTP id ct4mr2116318qvb.62.1583487761569;
        Fri, 06 Mar 2020 01:42:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583487761; cv=none;
        d=google.com; s=arc-20160816;
        b=FMp+1ZMts6pDV82IhaV2Olqa279aj2C1R35Qxtc87R2w/k5tc6dGrVLy1pqVCiUPmc
         zN0qs9+pnM4ezXXGZN4V8ilNH27AG1pnwWqqsTskWc3VwuRmenRLOutPh+n+WNN6HrC9
         JMib5D55YWNMrCRu1ZjnBBDP4ultM8HLEy5gkUUQlBjCBR/ZswlUFhS22LWs3mqvZiYC
         xAzmsPet2jIunluD5x4OleYTB0JjFNLi5kiqFYAF7lYGZQ7Sct6mjbzM2zqsptoqszcZ
         J26rEofcwwDPNJbRClrLcKIxDP5vUpi5Q4Lii7FT6p2cgzs6+WMhOB+XS8JYV3vZoPD/
         AMUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=cFMbEHostk5C52OS/PX7OJDehoiQSgYxKZVQ/CemZEs=;
        b=YjMcoL1rglM4iGzwXdKg6kN4DXoqo+mTtKCgXpvDP7G+VTl2cp2SdXNzmCAWdVkwX3
         hNizSic0bgIcqZXp1EteLi6h1QT3gtj1luqs0KBMQiVZO0/24VJbSHkYGkQZ7Z3dQsEu
         imas0FUAkQLUt0ABU8Sq9v6eTtwh4M/NlgwKvDv8AwoW4i3xyZuUN7jc8P2y/lwCxHMn
         kh66zTl28Gdg4jRYYnqV3alieN5fhFawfROvf8hR1k59hjVouCzHwbRcwmk7EXKZQpwP
         e5vD1/km91+DJiWyJKm8aRU8+RFYAraZBXiHkL/+7tsCeinOK8CrAoxbqgxiqJUHdXdw
         IOxw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QfWZNYSA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t20si751934qto.68.2020.03.06.01.42.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Mar 2020 01:42:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QfWZNYSA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jA9VA-0006me-UO
	for alex.bennee@linaro.org; Fri, 06 Mar 2020 04:42:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55385)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jA9Us-0006cY-WC
 for qemu-arm@nongnu.org; Fri, 06 Mar 2020 04:42:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jA9Ur-0004Rl-7f
 for qemu-arm@nongnu.org; Fri, 06 Mar 2020 04:42:22 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:56691
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jA9Ur-0004On-0A
 for qemu-arm@nongnu.org; Fri, 06 Mar 2020 04:42:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583487735;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cFMbEHostk5C52OS/PX7OJDehoiQSgYxKZVQ/CemZEs=;
 b=QfWZNYSAiWskSyB3gg7qiMsidx63YaNV0zU/ka0RDB3WXLrrv8WdPpCFwkybAZ2lRrZI/W
 POqHYeNaM/C6FU/21DIejpX761wI95IWxsDmYD/KR3r8OHd3+pPJ9oDHpDQ8BRYhlPWINg
 KUOnjRV0Ks9ZdAkoRKPR5fNAXRkDhKw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-rQxWB7MjNFieYz9jkupFEw-1; Fri, 06 Mar 2020 04:42:14 -0500
X-MC-Unique: rQxWB7MjNFieYz9jkupFEw-1
Received: by mail-wm1-f69.google.com with SMTP id w3so417519wmg.4
 for <qemu-arm@nongnu.org>; Fri, 06 Mar 2020 01:42:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cFMbEHostk5C52OS/PX7OJDehoiQSgYxKZVQ/CemZEs=;
 b=tD9l7Xq7nP7NuYTvtKXgy93HsocBLi7Oc0KaRv16puA+nMV5ZVLtlIhF6AWrSxOH5B
 bM2B1jr4t3qODMsnlejKVyKxRQZgUOGKr14mHzW6dj2Is1U/Utub5YtV9dJE2mDgaye3
 /yPXcAxW/c/Lz/9I7A5XqTTsxfpG8kN1bUT4Hvx/5iT18mY2+lH3jGzBmui/suOsLaMR
 JsP1Dgr4JUqwKw6GJE7/PORwgb/+K0+Npw6vNmBQR7N2iTRpTMcRqeZLbC5ABL3G5nT2
 p0IT36PH+Uk/lcAVMte2avaFFm51espAZYs2xhBpq4BH/NPdFIPTCSYwQtrKluagwb1o
 ZSfA==
X-Gm-Message-State: ANhLgQ2csWHsVGqa5WuN3nx/kb7MlrGqW9ekbsMdG/GNrp/fOytp8M1V
 WaCAeihjkjptgUd6Bf3JcNeTkzsV7SLWFA+FejwTENIwYnEelnrN7jzJW5Xpe4f3KVj3+CCjrHr
 LVu7CmzF8HdzK
X-Received: by 2002:a5d:6ac1:: with SMTP id u1mr3019997wrw.383.1583487732993; 
 Fri, 06 Mar 2020 01:42:12 -0800 (PST)
X-Received: by 2002:a5d:6ac1:: with SMTP id u1mr3019973wrw.383.1583487732733; 
 Fri, 06 Mar 2020 01:42:12 -0800 (PST)
Received: from [192.168.1.35] (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id h10sm14203577wml.18.2020.03.06.01.42.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Mar 2020 01:42:12 -0800 (PST)
Subject: Re: [PATCH] hw/arm/stm32f405: Add preliminary flash interface
 emulation support
To: Stephanos Ioannidis <root@stephanos.io>
References: <20200301084427.93823-1-root@stephanos.io>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <bce274e1-711c-3687-5090-21c14daa3a51@redhat.com>
Date: Fri, 6 Mar 2020 10:42:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200301084427.93823-1-root@stephanos.io>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cqqY33PwD2BC

On 3/1/20 9:45 AM, Stephanos Ioannidis wrote:
> The flash interface (FLASHIF) peripheral provides a control interface
> for the SoC embedded flash memory on the STM32F4xx series devices.
> 
> This commit adds preliminary support for the flash interface peripheral
> emulation, in order to support proper emulation of the firmware images
> that use the STM32Cube driver, which configures and validates the
> FLASH_ACR register during system initialisation.
> 
> Signed-off-by: Stephanos Ioannidis <root@stephanos.io>
> ---
>   hw/arm/Kconfig                      |   1 +
>   hw/arm/stm32f405_soc.c              |  15 +-
>   hw/misc/Kconfig                     |   3 +
>   hw/misc/Makefile.objs               |   1 +
>   hw/misc/stm32f4xx_flashif.c         | 215 ++++++++++++++++++++++++++++
>   hw/misc/trace-events                |   4 +
>   include/hw/arm/stm32f405_soc.h      |   2 +
>   include/hw/misc/stm32f4xx_flashif.h | 144 +++++++++++++++++++

Consider using the scripts/git.orderfile configuration.

>   8 files changed, 384 insertions(+), 1 deletion(-)
>   create mode 100644 hw/misc/stm32f4xx_flashif.c
>   create mode 100644 include/hw/misc/stm32f4xx_flashif.h
> 
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 3d86691ae0..179696ec91 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -314,6 +314,7 @@ config STM32F205_SOC
>   config STM32F405_SOC
>       bool
>       select ARM_V7M
> +    select STM32F4XX_FLASHIF
>       select STM32F4XX_SYSCFG
>       select STM32F4XX_EXTI
>   
> diff --git a/hw/arm/stm32f405_soc.c b/hw/arm/stm32f405_soc.c
> index 9bcad97853..72b16910c7 100644
> --- a/hw/arm/stm32f405_soc.c
> +++ b/hw/arm/stm32f405_soc.c
> @@ -30,6 +30,7 @@
>   #include "hw/arm/stm32f405_soc.h"
>   #include "hw/misc/unimp.h"
>   
> +#define FLASHIF_ADDR                   0x40023C00
>   #define SYSCFG_ADD                     0x40013800
>   static const uint32_t usart_addr[] = { 0x40011000, 0x40004400, 0x40004800,
>                                          0x40004C00, 0x40005000, 0x40011400,
> @@ -59,6 +60,9 @@ static void stm32f405_soc_initfn(Object *obj)
>       sysbus_init_child_obj(obj, "armv7m", &s->armv7m, sizeof(s->armv7m),
>                             TYPE_ARMV7M);
>   
> +    sysbus_init_child_obj(obj, "flashif", &s->flashif, sizeof(s->flashif),
> +                          TYPE_STM32F4XX_FLASHIF);
> +
>       sysbus_init_child_obj(obj, "syscfg", &s->syscfg, sizeof(s->syscfg),
>                             TYPE_STM32F4XX_SYSCFG);
>   
> @@ -130,6 +134,16 @@ static void stm32f405_soc_realize(DeviceState *dev_soc, Error **errp)
>           return;
>       }
>   
> +    /* Flash interface */
> +    dev = DEVICE(&s->flashif);

You might want to add a 'link property' to the s->flash memory region 
here, so you can lock/unlock/program/fuse it later.

> +    object_property_set_bool(OBJECT(&s->flashif), true, "realized", &err);
> +    if (err != NULL) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +    busdev = SYS_BUS_DEVICE(dev);
> +    sysbus_mmio_map(busdev, 0, FLASHIF_ADDR);
> +
>       /* System configuration controller */
>       dev = DEVICE(&s->syscfg);
>       object_property_set_bool(OBJECT(&s->syscfg), true, "realized", &err);
> @@ -261,7 +275,6 @@ static void stm32f405_soc_realize(DeviceState *dev_soc, Error **errp)
>       create_unimplemented_device("GPIOI",       0x40022000, 0x400);
>       create_unimplemented_device("CRC",         0x40023000, 0x400);
>       create_unimplemented_device("RCC",         0x40023800, 0x400);
> -    create_unimplemented_device("Flash Int",   0x40023C00, 0x400);
>       create_unimplemented_device("BKPSRAM",     0x40024000, 0x400);
>       create_unimplemented_device("DMA1",        0x40026000, 0x400);
>       create_unimplemented_device("DMA2",        0x40026400, 0x400);
[...]

