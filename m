Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp605461ejb;
        Thu, 8 Dec 2022 11:23:23 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5yy46U+MCXh4orOb2m/iGRJsevvQrdSiuGq9nYjNc7ooPD4XZjvdOl/n7fBA8JuXwprfx2
X-Received: by 2002:ac8:4243:0:b0:3a5:6666:96d3 with SMTP id r3-20020ac84243000000b003a5666696d3mr4044830qtm.33.1670527403032;
        Thu, 08 Dec 2022 11:23:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670527403; cv=none;
        d=google.com; s=arc-20160816;
        b=rOe72pgD/DfJr9I5Q7ZSqMPu2ibIq2KROgSAyWTJUZZDqXDD5vsOSOGVHOrAZholAu
         EwxHBx4+D8ILhm5R3ViGCeimkp15ancCAT8VDZoEKgAcg4OLRB7qU8PIA2BCU9sqFBgR
         s3s6MrnYZx9myL7bdWnOnpQ/ANUoLvn9nBwxpF0g+8vxKTUXKS7sbjoNcIEdct0mLefI
         K67cSLSz2yMJyzkUccUIH+G428My79FA8UxU9fStQw/PIe0lZWDxmpierdkpsyx6dlBw
         ruRVkPl19G/E9Z6xi1Q9wy01CJb4zt9K817QctMB9loKbD7YcvDJuLhMxHhx1emsNkuq
         tKew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=OtWgLifnlGex+eW1XyrMDcnB5Lb5dXJ2/LoteYXvh18=;
        b=rJOgqejo8x6MN43+CdItqiI456o67pnO84ssdXPC2YvpQblsAUoaLMp0gqFgQdUv7s
         SPlY9Ktoh3ZMhAd+fdmzMaNYBpzrV1JZRErANAh4esEjp330rTlAMzXbiHQqz4mPMVzm
         zwSniN09RpYdTma3faoaaopR+ZQ9LmGXs0C6OFcTk3c2wARlxWIuSV1OZzy/3PuCoqLh
         DubmZT21PYL9HraJtoJ5WD6guwHuuG6Aw9gEOqbiU/nRoXlqObZVwawemOsAMJ9DMN0u
         I2At+2I2uanXjjDgEZTn38bpQfhdrTAgg0V35Qcgw+NNODZK0iPSdTzxMsonVR0MlYy0
         uWrg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=CtMFcUiG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f18-20020a05620a281200b006fa299566afsi11302795qkp.568.2022.12.08.11.23.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Dec 2022 11:23:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=CtMFcUiG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p3MUE-0000d3-QN; Thu, 08 Dec 2022 14:23:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1p3MUD-0000cY-Q1; Thu, 08 Dec 2022 14:23:13 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1p3MUB-0000M4-OI; Thu, 08 Dec 2022 14:23:13 -0500
Received: by mail-ej1-x633.google.com with SMTP id x22so6323907ejs.11;
 Thu, 08 Dec 2022 11:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OtWgLifnlGex+eW1XyrMDcnB5Lb5dXJ2/LoteYXvh18=;
 b=CtMFcUiGdYEb49XAzrb5zfmMYP6wE+GkOFEz5JAXQzbhy7Pf2CoJLXw+GjAbApAWUQ
 qLyf6rI53XPfqA4aK6PFxlfwwBjkfQNE2633vfTLGqtfhL7Ewgl9xbNyL2QA0c2c3uLA
 n+0ffkEFev9Ieu5zZm3DTg0gF+YE+hEg+nTOy9BssC1w5f5OEll+uE/J0FvVFRVqW0AK
 7h3c5XEkTbTAsiLp9p58Pv4f2B/ummidIRUN5FE2uSkLvuTDW0kgtULeCGQD9WtOTrtw
 CqWPDDCLfhO4KK1lSCmYDMqzudmlevnyx/cbEQ63rTUNN3b4Z/9w7jOEjagph8Zq0S19
 zyow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OtWgLifnlGex+eW1XyrMDcnB5Lb5dXJ2/LoteYXvh18=;
 b=zh9z9rKUTeSXj5WVL9pXps3ls3H4mtDvb/c2D061NnhkIdYuA6/rlN5gUc0G2y7+/0
 m66fKJjWZExWfxJ/PE+/3HQakxqShxoYFdHL7iu5heLL7xTJaomj61VDErOH0tStyL8h
 1SMduXqDD9B6m5qcG2ioiDe/0Cf32PyWHcsCfPoNqqleroscA8HcsDdKs0WyzgtpDMB6
 Tv2YaLuZ9y8C8WhxtKx4JNKtc2bzdXvm3Ndp6SAcFWnFWlAJyjs6d3tD1ZCm+W77Skxd
 e9EtzsVayAp3KW3NY2MhVWgz3+6cbTMhHAjyiBY9FamgERncbuXnG89SA7zHtZadbZrk
 Jy3A==
X-Gm-Message-State: ANoB5pmhyOeAbhCwAfgCLcxm+Zt1WLYe+dbG8mlCl2uGQj/5WKGM6sUX
 8+YATzCE88V63cf56DdWgDJLygETepTlifdsUHQ=
X-Received: by 2002:a17:906:60d0:b0:78d:3f87:1725 with SMTP id
 f16-20020a17090660d000b0078d3f871725mr28406696ejk.492.1670527390048; Thu, 08
 Dec 2022 11:23:10 -0800 (PST)
MIME-Version: 1.0
References: <20221203231904.25155-1-strahinja.p.jankovic@gmail.com>
 <20221203231904.25155-7-strahinja.p.jankovic@gmail.com>
 <CAPan3WpDbNczuHaOpOYQOD5MPZ-SyqyZ2172-U6JQFn7fvHaTg@mail.gmail.com>
In-Reply-To: <CAPan3WpDbNczuHaOpOYQOD5MPZ-SyqyZ2172-U6JQFn7fvHaTg@mail.gmail.com>
From: Strahinja Jankovic <strahinjapjankovic@gmail.com>
Date: Thu, 8 Dec 2022 20:22:59 +0100
Message-ID: <CABtshVTTsQsgsJsmo=SEbvUNXd7b-OwRPJOgHbG1u=02r2GP4A@mail.gmail.com>
Subject: Re: [PATCH 6/6] hw/arm: Allwinner A10 enable SPL load from MMC
To: Niek Linnenbank <nieklinnenbank@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=strahinjapjankovic@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: MiwzigtS4Nhd

On Wed, Dec 7, 2022 at 11:39 PM Niek Linnenbank
<nieklinnenbank@gmail.com> wrote:
>
> Hi Strahinja,
>
>
> On Sun, Dec 4, 2022 at 12:19 AM Strahinja Jankovic <strahinjapjankovic@gmail.com> wrote:
>>
>> This patch enables copying of SPL from MMC if `-kernel` parameter is not
>> passed when starting QEMU. SPL is copied to SRAM_A.
>>
>> The approach is reused from Allwinner H3 implementation.
>>
>> Tested with Armbian and custom Yocto image.
>>
>> Signed-off-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
>> ---
>>  hw/arm/allwinner-a10.c         | 18 ++++++++++++++++++
>>  hw/arm/cubieboard.c            |  5 +++++
>>  include/hw/arm/allwinner-a10.h | 21 +++++++++++++++++++++
>>  3 files changed, 44 insertions(+)
>>
>> diff --git a/hw/arm/allwinner-a10.c b/hw/arm/allwinner-a10.c
>> index 17e439777e..dc1966ff7a 100644
>> --- a/hw/arm/allwinner-a10.c
>> +++ b/hw/arm/allwinner-a10.c
>> @@ -24,7 +24,9 @@
>>  #include "sysemu/sysemu.h"
>>  #include "hw/boards.h"
>>  #include "hw/usb/hcd-ohci.h"
>> +#include "hw/loader.h"
>>
>> +#define AW_A10_SRAM_A_BASE      0x00000000
>>  #define AW_A10_DRAMC_BASE       0x01c01000
>>  #define AW_A10_MMC0_BASE        0x01c0f000
>>  #define AW_A10_CCM_BASE         0x01c20000
>> @@ -38,6 +40,22 @@
>>  #define AW_A10_RTC_BASE         0x01c20d00
>>  #define AW_A10_I2C0_BASE        0x01c2ac00
>>
>> +void allwinner_a10_bootrom_setup(AwA10State *s, BlockBackend *blk)
>> +{
>> +    const int64_t rom_size = 32 * KiB;
>> +    g_autofree uint8_t *buffer = g_new0(uint8_t, rom_size);
>> +
>> +    if (blk_pread(blk, 8 * KiB, rom_size, buffer, 0) < 0) {
>> +        error_setg(&error_fatal, "%s: failed to read BlockBackend data",
>> +                   __func__);
>> +        return;
>> +    }
>> +
>> +    rom_add_blob("allwinner-a10.bootrom", buffer, rom_size,
>> +                  rom_size, AW_A10_SRAM_A_BASE,
>> +                  NULL, NULL, NULL, NULL, false);
>> +}
>
>
> Its probably fine for now to do it in the same way here for the A10 indeed. Perhaps in the future, we can try
> to share some overlapping code between the A10 and H3.

That definitely makes sense. I plan on submitting support for A20
after this patch set, so maybe that would be a good opportunity to
refactor the Allwinner support in QEMU.

Best regards,
Strahinja


>
> So the patch looks fine to me:
> Reviewed-by: Niek Linnenbank <nieklinnenbank@gmail.com>
>
> Regards,
> Niek
>
>>
>> +
>>  static void aw_a10_init(Object *obj)
>>  {
>>      AwA10State *s = AW_A10(obj);
>> diff --git a/hw/arm/cubieboard.c b/hw/arm/cubieboard.c
>> index afc7980414..37659c35fd 100644
>> --- a/hw/arm/cubieboard.c
>> +++ b/hw/arm/cubieboard.c
>> @@ -99,6 +99,11 @@ static void cubieboard_init(MachineState *machine)
>>      memory_region_add_subregion(get_system_memory(), AW_A10_SDRAM_BASE,
>>                                  machine->ram);
>>
>> +    /* Load target kernel or start using BootROM */
>> +    if (!machine->kernel_filename && blk && blk_is_available(blk)) {
>> +        /* Use Boot ROM to copy data from SD card to SRAM */
>> +        allwinner_a10_bootrom_setup(a10, blk);
>> +    }
>>      /* TODO create and connect IDE devices for ide_drive_get() */
>>
>>      cubieboard_binfo.ram_size = machine->ram_size;
>> diff --git a/include/hw/arm/allwinner-a10.h b/include/hw/arm/allwinner-a10.h
>> index 763935fca9..b3c9ed24c7 100644
>> --- a/include/hw/arm/allwinner-a10.h
>> +++ b/include/hw/arm/allwinner-a10.h
>> @@ -15,6 +15,7 @@
>>  #include "hw/misc/allwinner-a10-ccm.h"
>>  #include "hw/misc/allwinner-a10-dramc.h"
>>  #include "hw/i2c/allwinner-i2c.h"
>> +#include "sysemu/block-backend.h"
>>
>>  #include "target/arm/cpu.h"
>>  #include "qom/object.h"
>> @@ -47,4 +48,24 @@ struct AwA10State {
>>      OHCISysBusState ohci[AW_A10_NUM_USB];
>>  };
>>
>> +/**
>> + * Emulate Boot ROM firmware setup functionality.
>> + *
>> + * A real Allwinner A10 SoC contains a Boot ROM
>> + * which is the first code that runs right after
>> + * the SoC is powered on. The Boot ROM is responsible
>> + * for loading user code (e.g. a bootloader) from any
>> + * of the supported external devices and writing the
>> + * downloaded code to internal SRAM. After loading the SoC
>> + * begins executing the code written to SRAM.
>> + *
>> + * This function emulates the Boot ROM by copying 32 KiB
>> + * of data from the given block device and writes it to
>> + * the start of the first internal SRAM memory.
>> + *
>> + * @s: Allwinner A10 state object pointer
>> + * @blk: Block backend device object pointer
>> + */
>> +void allwinner_a10_bootrom_setup(AwA10State *s, BlockBackend *blk);
>> +
>>  #endif
>> --
>> 2.30.2
>>
>
>
> --
> Niek Linnenbank
>
