Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp4761730lff;
        Mon, 13 Jan 2020 15:28:18 -0800 (PST)
X-Google-Smtp-Source: APXvYqwTqshMTZ+ferW5h4Ch+GcHlSUQQoibo+BVGU+o3MKncgTXSIRc4Yrjxa/jO0MovKoxja/Z
X-Received: by 2002:a05:6402:17ac:: with SMTP id j12mr20413987edy.39.1578958098912;
        Mon, 13 Jan 2020 15:28:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578958098; cv=none;
        d=google.com; s=arc-20160816;
        b=HIXmfhC74UdqUsIFqYjxYeBN4T7eaSo0qsE/mw+mIMy4TXaz43yt8b3DTs7/27JVQ5
         s4GJaNFb1j7Dztd7z9iChyYfI+kHPjYL904hjFe4PmrKO/lfF/7glUAsMwaeWMLQcLh/
         5/9pIvIE+Rws2bdRqxNA6eH+azWl3fHt6cnV+zmaZT9lAV9qgIg6c0j3lgT29moTylF8
         Ay5UuK2rkvAHq7ajQcSL3DuY1/2WwJi86kNqHsykgvqRl+QgncPBtyrLF2F5kajhM/Oc
         uSu1dmgrKgah7Zcv/pTD5gusAL5dCp60xAAkCDGf0AJFqpAdgNMRrNO1GJ4bToxCXSGR
         c6ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=FCtqXFuC/9lliiVZPeVqVVNvjp9NJJrmS/KqAIpLcT4=;
        b=niAdIKXYA3RmvjDQrpDX9NhtrW/LEOacz+VjhWK6gQ7H/bwPktLybNwH5qkWK29x8H
         P2nlx8D5b7xMfsT+1VZC8UDQVhf1jR2TZqhIpbprLBvh2tej86/VAyWHx56rltlKOU8H
         8PgqMEF2fGY7mU2ETyL5w6ZWu6PCCnDmtIt59jdo7gk+tBjyh187Zx2URcZmkjFpT0kq
         oL69niopHGLhwB6TA5HeQLyWxkElaKMhRochZdiEMI+buxQzbhwJeVs3lqMk25ikpSMH
         bqCp+CA48T0Hz6Q/yloLummeGQ3e8PZdz2W8eiAENcDRORJNMrqVmmXpQBrVLqWGCGuC
         2fgw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=IUZ9Ysto;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c4si8378795edd.147.2020.01.13.15.28.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Jan 2020 15:28:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=IUZ9Ysto;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ir985-0003d1-PQ
	for alex.bennee@linaro.org; Mon, 13 Jan 2020 18:28:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53323)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ir97w-0003cj-Or
 for qemu-arm@nongnu.org; Mon, 13 Jan 2020 18:28:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ir97u-0007f6-VE
 for qemu-arm@nongnu.org; Mon, 13 Jan 2020 18:28:08 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:23292
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ir97u-0007eK-RZ
 for qemu-arm@nongnu.org; Mon, 13 Jan 2020 18:28:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578958086;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FCtqXFuC/9lliiVZPeVqVVNvjp9NJJrmS/KqAIpLcT4=;
 b=IUZ9YstolZGgga4ea3dzsFpJBhweltel4bDECuB1acIp5bumtzyFh4Z2Ecs/mwlNEbw3nN
 8RPMZU7qWq/kCBz4XEP85k+lD12OEnrTYjvUIUoyKajE4KYZF2UlqU5Uvu8mhIOiRFeWkO
 /XxzGqorh0uJ0wuBV/Ahz9NAbUzVnu4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-158-dLnATlj9NByUlpCjHlp54A-1; Mon, 13 Jan 2020 18:28:04 -0500
Received: by mail-wr1-f72.google.com with SMTP id z10so5643726wrt.21
 for <qemu-arm@nongnu.org>; Mon, 13 Jan 2020 15:28:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FCtqXFuC/9lliiVZPeVqVVNvjp9NJJrmS/KqAIpLcT4=;
 b=Jxhs1o+cWsXq1qn9DAdKN+TReHV9/wR5Si71oU35Fc3EN4RKIVA5AyK2bUFB4bC9kh
 Or5hoh8Q3cggKGkUUZeZzLKMf2KBJrPO1Effworv70zgJW9tfBGAwL3EzXsQpV7uDYwC
 3O/BCvNpfXtBggBKe/4vCZN0+BFwNS1hyp1+P30B/K3nP31teDBhMC/1Klra1Vf/JXsa
 JVbYrBqbk1OCLH9ewYvpbmOYs5oDQD+IYpNvbMYAbK9JOx95VSgtEqb7vZ3Yc0jhSAnj
 lvHIfuNVT9qOewH5AnG8w0TkTx848QhwP8LHgjV4UQiZhMJQ3jc1KRGn7bUW1hXErD3B
 kyag==
X-Gm-Message-State: APjAAAW+sdQdny/XZdzPWJM9vRFMBBmLjQ8Ak0ZtAOaFCbeCjFUJKp5X
 i7OaVgTMk/iBG5HTZP+PUEnh6bzcsFNz5x5BqS1EKOmSduvpcQ5a9mRt5WqT7gjHBNUruTPQSbC
 THlasInNzQoIv
X-Received: by 2002:a05:6000:1288:: with SMTP id
 f8mr21364018wrx.66.1578958083507; 
 Mon, 13 Jan 2020 15:28:03 -0800 (PST)
X-Received: by 2002:a05:6000:1288:: with SMTP id
 f8mr21363995wrx.66.1578958083250; 
 Mon, 13 Jan 2020 15:28:03 -0800 (PST)
Received: from ?IPv6:2a01:cb1d:8a0a:f500:48c1:8eab:256a:caf9?
 ([2a01:cb1d:8a0a:f500:48c1:8eab:256a:caf9])
 by smtp.gmail.com with ESMTPSA id n14sm15546902wmi.26.2020.01.13.15.28.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jan 2020 15:28:02 -0800 (PST)
Subject: Re: [PATCH v3 10/17] hw/arm/allwinner-h3: add Boot ROM support
To: Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-devel@nongnu.org
References: <20200108200020.4745-1-nieklinnenbank@gmail.com>
 <20200108200020.4745-11-nieklinnenbank@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <9c878f16-b18c-cc1a-9e82-40dbdd31b823@redhat.com>
Date: Tue, 14 Jan 2020 00:28:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200108200020.4745-11-nieklinnenbank@gmail.com>
Content-Language: en-US
X-MC-Unique: dLnATlj9NByUlpCjHlp54A-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wTDoVHJnOQtm

On 1/8/20 9:00 PM, Niek Linnenbank wrote:
> A real Allwinner H3 SoC contains a Boot ROM which is the
> first code that runs right after the SoC is powered on.
> The Boot ROM is responsible for loading user code (e.g. a bootloader)
> from any of the supported external devices and writing the downloaded
> code to internal SRAM. After loading the SoC begins executing the code
> written to SRAM. This commits adds emulation of the Boot ROM firmware
> setup functionality by loading user code from SD card.
> 
> Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
> ---
>   include/hw/arm/allwinner-h3.h | 23 +++++++++++++++++++++++
>   hw/arm/allwinner-h3.c         | 28 ++++++++++++++++++++++++++++
>   hw/arm/orangepi.c             |  3 +++
>   3 files changed, 54 insertions(+)
> 
> diff --git a/include/hw/arm/allwinner-h3.h b/include/hw/arm/allwinner-h3.h
> index 5d74cca28e..4b66227ac4 100644
> --- a/include/hw/arm/allwinner-h3.h
> +++ b/include/hw/arm/allwinner-h3.h
> @@ -50,6 +50,7 @@
>   #include "hw/sd/allwinner-sdhost.h"
>   #include "hw/net/allwinner-sun8i-emac.h"
>   #include "target/arm/cpu.h"
> +#include "sysemu/block-backend.h"
>   
>   /**
>    * Allwinner H3 device list
> @@ -130,4 +131,26 @@ typedef struct AwH3State {
>       MemoryRegion sram_c;
>   } AwH3State;
>   
> +/**
> + * Emulate Boot ROM firmware setup functionality.
> + *
> + * A real Allwinner H3 SoC contains a Boot ROM
> + * which is the first code that runs right after
> + * the SoC is powered on. The Boot ROM is responsible
> + * for loading user code (e.g. a bootloader) from any
> + * of the supported external devices and writing the
> + * downloaded code to internal SRAM. After loading the SoC
> + * begins executing the code written to SRAM.
> + *
> + * This function emulates the Boot ROM by copying 32 KiB
> + * of data from the given block device and writes it to
> + * the start of the first internal SRAM memory.
> + *
> + * @s: Allwinner H3 state object pointer
> + * @blk: Block backend device object pointer
> + * @errp: Error object pointer for raising errors
> + */
> +void allwinner_h3_bootrom_setup(AwH3State *s, BlockBackend *blk,
> +                                Error **errp);
> +
>   #endif /* HW_ARM_ALLWINNER_H3_H */
> diff --git a/hw/arm/allwinner-h3.c b/hw/arm/allwinner-h3.c
> index e692432b4e..e7b768ad5b 100644
> --- a/hw/arm/allwinner-h3.c
> +++ b/hw/arm/allwinner-h3.c
> @@ -27,6 +27,7 @@
>   #include "hw/char/serial.h"
>   #include "hw/misc/unimp.h"
>   #include "hw/usb/hcd-ehci.h"
> +#include "hw/loader.h"
>   #include "sysemu/sysemu.h"
>   #include "hw/arm/allwinner-h3.h"
>   
> @@ -168,6 +169,33 @@ enum {
>       AW_H3_GIC_NUM_SPI       = 128
>   };
>   
> +void allwinner_h3_bootrom_setup(AwH3State *s, BlockBackend *blk, Error **errp)
> +{
> +    uint8_t *buffer;
> +    int64_t rom_size = 32 * KiB;

Why restrict to 32K? The A1 SRAM is 64K.

> +
> +    int64_t blk_size = blk_getlength(blk);
> +    if (blk_size <= 0) {
> +        error_setg(errp, "%s: failed to get BlockBackend size", __func__);
> +        return;
> +    }
> +
> +    if (rom_size > blk_size) {
> +        rom_size = blk_size;
> +    }
> +
> +    buffer = g_new0(uint8_t, rom_size);
> +    if (blk_pread(blk, 8 * KiB, buffer, rom_size) < 0) {
> +        error_setg(errp, "%s: failed to read BlockBackend data", __func__);
> +        return;
> +    }
> +
> +    rom_add_blob("allwinner-h3.bootrom", buffer, rom_size,
> +                  rom_size, s->memmap[AW_H3_SRAM_A1],
> +                  NULL, NULL, NULL, NULL, false);
> +    g_free(buffer);
> +}
> +
>   static void allwinner_h3_init(Object *obj)
>   {
>       AwH3State *s = AW_H3(obj);
> diff --git a/hw/arm/orangepi.c b/hw/arm/orangepi.c
> index 0eb52eb813..b722f49485 100644
> --- a/hw/arm/orangepi.c
> +++ b/hw/arm/orangepi.c
> @@ -93,6 +93,9 @@ static void orangepi_init(MachineState *machine)
>       if (bios_name) {
>           error_report("BIOS not supported for this machine");
>           exit(1);
> +    } else if (!machine->kernel_filename && blk_is_available(blk)) {
> +        /* Use Boot ROM to copy data from SD card to SRAM */
> +        allwinner_h3_bootrom_setup(s->h3, blk, &error_fatal);
>       }
>       orangepi_binfo.loader_start = s->h3->memmap[AW_H3_SDRAM];
>       orangepi_binfo.ram_size = machine->ram_size;
> 

