Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp1762075lff;
        Sun, 19 Jan 2020 11:14:25 -0800 (PST)
X-Google-Smtp-Source: APXvYqzA73jdyTlOMkB4C7aU29pKMs2gyLu+YMFtjyDMWGWIkQM7tzATE/RTkl9ChbhtUahg4HHo
X-Received: by 2002:a81:9a09:: with SMTP id r9mr36556347ywg.244.1579461265429;
        Sun, 19 Jan 2020 11:14:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579461265; cv=none;
        d=google.com; s=arc-20160816;
        b=CFglZPb3XcI6LExUf5OY/q33fVt2f0Gp/9M6RBk4l0JJAX6X4Z5BxnWlq2qQyruRlV
         Omiw/2P8ahH4oxBSzKIeLDkw8NOQLNVGCt8t8S/A+ItYx5V1ea6oBq5OsNOX7EMOAOeg
         X2vqfFy+bxZ13tQ3EYg39yb+SH55NxpZLmhmoJrjwDh9tZc2dVQlEwsduBA2ycE4H3uD
         UkzRvQki0DIaxPmi1aBnGZOfRDGPKDSPk9Gp3PvcfY/kz/Vxipfrm6L5qbLDzz/bpidP
         hIBwCI+FMTnAl34xmx8SF5Tu5Fe1JkuuoGMqQoS7a1z+uquTyQ/iW0D7NhgY/sN+7fsN
         fnpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=Nm9lhLKyp10b9IzN5PS5J2MlVlNwY1BeCm+X3CH8Rxw=;
        b=mJNPyYbohOYn+on2iSovnYgQrZjSfCFllzwcbMkijmY7SQqc+KsEDWo2ZQD01p5xGb
         7NfyeebTaBlWiRB6lHHdUdrFQOWfFLOePmDgqjaMYMID7O3Mf53699xCQ7PRrlmNrdmh
         Wz78nEmGUHNHGZI5zdRLJuu0uFbz8Joe4vk/ZP5IsVYD7o33CGPZg8ePT+WtfG9ePZKR
         wFDO0yJAoCV4KipWnMB314V+/n3AmoTNxtPXu2AD0EjNgBh1S5qiqoKatZ5U20unrMvZ
         R/10E45KBT+WgsOoTEvBb5rZ0Aig2ySl2pCLPzx1CnPOYNMyPd1yKpzrHZitXO6l1PC9
         BYFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VVHEQPR2;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id v202si19696938ywc.122.2020.01.19.11.14.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 19 Jan 2020 11:14:25 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 205.139.110.120 as permitted sender) client-ip=205.139.110.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VVHEQPR2;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579461264;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Nm9lhLKyp10b9IzN5PS5J2MlVlNwY1BeCm+X3CH8Rxw=;
	b=VVHEQPR2qGnhg8nRhjyLTUqThCe5NjEax9BWFIN8sWenJlQBHq2zSQ9m0/nYj9vrCDhlSJ
	b9987LAFG2iYBkQZ3hC7nfO1pvsMW7e9P+itUWVdidCaRZN11afZLXdziYDn9MfIW5Yjf6
	Ja18svcs8VzvX5KN44sVWojG/KUrtgk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-YMwxFghINluSPIjCWIUQOg-1; Sun, 19 Jan 2020 14:14:21 -0500
Received: by mail-wr1-f71.google.com with SMTP id y7so13121485wrm.3
        for <alex.bennee@linaro.org>; Sun, 19 Jan 2020 11:14:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Nm9lhLKyp10b9IzN5PS5J2MlVlNwY1BeCm+X3CH8Rxw=;
        b=BLqDuPQ3Q2aseRsdChXXoKyrmxB3mxEvj81DAR65yvUWx7oJYyfXKoYNvKNiKJvTxb
         CHuWdhj2Yk7u39FBiqP1UGnjXL57uB3zKeJ5Yj6svZQDo9CfpFueI/fYNVud1O/QokzH
         Hj/m7rZr76eraKe9FhgjzGxJi6IoVTXYYN9eypjeKcE3jLvYZ6sD8O6p4+qJh3ebOVlZ
         a8Wz3ETPEZS6PGlXsLqF1/FwYdDPf0lGPZlkOmoNr/ugxoS9TEbiQneFzYqSJIbNt/E2
         xmANeuF07F1z4JJ7q0br/j4pTQIJfmduIOMcpnk2LQ/XWgfmm0oOMnPdbY8w++r5EECi
         9Xzw==
X-Gm-Message-State: APjAAAVwOZkWynT0FNEEzS4/dbdAtjLdncuwe9LBpCMjUib/aUOveoML
	bxF5YSVlWaNvB82epFAyPwnuaau0SJVjgbjErVv6RQCeTPTX3p2pxTjGRHt8ulBu16xtlPnKn/P
	NVLzTOPjqFKjB1wV3
X-Received: by 2002:adf:e641:: with SMTP id b1mr14518308wrn.34.1579461260401;
        Sun, 19 Jan 2020 11:14:20 -0800 (PST)
X-Received: by 2002:adf:e641:: with SMTP id b1mr14518297wrn.34.1579461260149;
        Sun, 19 Jan 2020 11:14:20 -0800 (PST)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.35] (113.red-83-57-172.dynamicip.rima-tde.net. [83.57.172.113])
        by smtp.gmail.com with ESMTPSA id t25sm19443880wmj.19.2020.01.19.11.14.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jan 2020 11:14:19 -0800 (PST)
Subject: Re: [PATCH v4 10/20] hw/arm/allwinner-h3: add Boot ROM support
To: Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, b.galvani@gmail.com,
 jasowang@redhat.com, alex.bennee@linaro.org, imammedo@redhat.com
References: <20200119005102.3847-1-nieklinnenbank@gmail.com>
 <20200119005102.3847-11-nieklinnenbank@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <1179d8a3-e61d-ad1f-bde9-3a73fde766a8@redhat.com>
Date: Sun, 19 Jan 2020 20:14:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200119005102.3847-11-nieklinnenbank@gmail.com>
Content-Language: en-US
X-MC-Unique: YMwxFghINluSPIjCWIUQOg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: Zq9ZuUzkf2K1

On 1/19/20 1:50 AM, Niek Linnenbank wrote:
> A real Allwinner H3 SoC contains a Boot ROM which is the
> first code that runs right after the SoC is powered on.
> The Boot ROM is responsible for loading user code (e.g. a bootloader)
> from any of the supported external devices and writing the downloaded
> code to internal SRAM. After loading the SoC begins executing the code
> written to SRAM.
> 
> This commits adds emulation of the Boot ROM firmware setup functionality
> by loading user code from SD card in the A1 SRAM. While the A1 SRAM is
> 64KiB, we limit the size to 32KiB because the real H3 Boot ROM also rejects
> sizes larger than 32KiB. For reference, this behaviour is documented
> by the Linux Sunxi project wiki at:
> 
>    https://linux-sunxi.org/BROM#U-Boot_SPL_limitations
> 
> Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
> ---
>   include/hw/arm/allwinner-h3.h | 23 +++++++++++++++++++++++
>   hw/arm/allwinner-h3.c         | 28 ++++++++++++++++++++++++++++
>   hw/arm/orangepi.c             |  5 +++++
>   3 files changed, 56 insertions(+)
> 
> diff --git a/include/hw/arm/allwinner-h3.h b/include/hw/arm/allwinner-h3.h
> index f9b9a02373..f5e16266cd 100644
> --- a/include/hw/arm/allwinner-h3.h
> +++ b/include/hw/arm/allwinner-h3.h
> @@ -46,6 +46,7 @@
>   #include "hw/sd/allwinner-sdhost.h"
>   #include "hw/net/allwinner-sun8i-emac.h"
>   #include "target/arm/cpu.h"
> +#include "sysemu/block-backend.h"
>   
>   /**
>    * Allwinner H3 device list
> @@ -129,4 +130,26 @@ typedef struct AwH3State {
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
> index 1085223812..3d0470825a 100644
> --- a/hw/arm/allwinner-h3.c
> +++ b/hw/arm/allwinner-h3.c
> @@ -29,6 +29,7 @@
>   #include "hw/char/serial.h"
>   #include "hw/misc/unimp.h"
>   #include "hw/usb/hcd-ehci.h"
> +#include "hw/loader.h"
>   #include "sysemu/sysemu.h"
>   #include "hw/arm/allwinner-h3.h"
>   
> @@ -170,6 +171,33 @@ enum {
>       AW_H3_GIC_NUM_SPI       = 128
>   };
>   
> +void allwinner_h3_bootrom_setup(AwH3State *s, BlockBackend *blk, Error **errp)
> +{
> +    uint8_t *buffer;
> +    int64_t rom_size = 32 * KiB;
> +
> +    int64_t blk_size = blk_getlength(blk);
> +    if (blk_size <= 0) {
> +        error_setg(errp, "%s: failed to get BlockBackend size", __func__);
> +        return;
> +    }
> +
> +    if (rom_size > blk_size) {
> +        rom_size = blk_size;

This doesn't seem correct, have you tried to use a 1MB file?

This can't be bigger than the SRAM size, 64KB.

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
> index 25bf85f8fc..9d4c79885e 100644
> --- a/hw/arm/orangepi.c
> +++ b/hw/arm/orangepi.c
> @@ -95,6 +95,11 @@ static void orangepi_init(MachineState *machine)
>       memory_region_add_subregion(get_system_memory(), s->h3->memmap[AW_H3_SDRAM],
>                                   &s->sdram);
>   
> +    /* Load target kernel or start using BootROM */
> +    if (!machine->kernel_filename && blk_is_available(blk)) {
> +        /* Use Boot ROM to copy data from SD card to SRAM */
> +        allwinner_h3_bootrom_setup(s->h3, blk, &error_fatal);
allwinner_h3_bootrom_setup() doesn't need the errp argument, you can use 
error_fatal directly there.

> +    }
>       orangepi_binfo.loader_start = s->h3->memmap[AW_H3_SDRAM];
>       orangepi_binfo.ram_size = machine->ram_size;
>       arm_load_kernel(ARM_CPU(first_cpu), machine, &orangepi_binfo);
> 
