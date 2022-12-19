Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp3337240ejb;
        Mon, 19 Dec 2022 01:33:13 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6KZlWa5JrYufqcU6RWGuTvkMoJ6AgQdm6JJ1URjd5i1t1kvtnWodWOzKMm3QuApONyrO5p
X-Received: by 2002:a0c:e111:0:b0:4c6:d411:f71f with SMTP id w17-20020a0ce111000000b004c6d411f71fmr59023464qvk.37.1671442393142;
        Mon, 19 Dec 2022 01:33:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671442393; cv=none;
        d=google.com; s=arc-20160816;
        b=UE/kEgWg00Xf4iGIgYHBErdUElTHc6zl/IU7e5pZ03N7oyBAFj1Xp/7U8melGA6AHH
         YXgHfZyoBTMf0io9asbAMZPuZRx4DgR9iX3uhenZn6GpliGWkRMqFeqz0NmtAQVq/q14
         2RVdZSUSILkaaMZauOkE7wWshm7HguBghTOTG7L3MnFqOzigeGjD1fH/8lGtKyezoxje
         3cUaltTjBhbUIHx/td2Q6DrpmbFbuF8XTazuk3mXtvCvashS+g+ZEv8//D9+/JdoWixJ
         AHODX9XXOyyZ7HBy5XX3DV270DZqT6rJz7IVdVmMF8V8qUCmcyBKDJdTXTFOh3g3D2/m
         NRzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=OGTm0UQKdb3bLdGM6tKYU9OQdCBQgoEE6wTKpbhs2HA=;
        b=n3j+wqyMhhv8JTFAdYejuapUP4SXQD/undpL/Ur16tJbIqGuXoqDyliRkCiyy1um2C
         skkUmYfcEpUmHP5sRG7Cw+iajvf9HOAvX0XbWciR4uWzC9mFwtl5whwUySgWwiqW852j
         ln9eTchfX5mPH+P6biJKDFKE8FlwHC2CUtq4j6noZLMmdgQ+meoVSzY/WuEdp9fntX6N
         UCS0XcabjOpBXj9K96fT1VB1S1Wa1bwxji3oH9SGHFx+LQpg4rDXnT/TXU8n0/Vukdai
         KQIipYsWplf5Xcqv3w47QUSeZY5QAJV2NgZP8sSFe8q554cGhkWXaUtDtbaLOGXtLr74
         KezA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=gLpx5AZM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p13-20020a05621421ed00b004bb95ea0e4fsi1959716qvj.350.2022.12.19.01.33.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Dec 2022 01:33:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=gLpx5AZM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p7CW9-0005Zh-Ce; Mon, 19 Dec 2022 04:33:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p7CW7-0005Yt-EH; Mon, 19 Dec 2022 04:33:03 -0500
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p7CW5-0007Zn-Th; Mon, 19 Dec 2022 04:33:03 -0500
Received: by mail-vs1-xe35.google.com with SMTP id k185so8138245vsc.2;
 Mon, 19 Dec 2022 01:33:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OGTm0UQKdb3bLdGM6tKYU9OQdCBQgoEE6wTKpbhs2HA=;
 b=gLpx5AZM/kmM9yHkZF3FKPpxMiqVkFUFC0K5cV/vAyfXfStDmOJDxD2w36Y20ZI+R1
 oP75/62uSKpgIpkePW2gtXCqxd/23ulscP4ibadt1Zuryljj7B4ohqLgk4ZgJBzShY8W
 qqKpnbMHuE3ueSbCwxLUW78Vm2D0ha1NxEV0iHr6vkmYJDuiTlE9iVqFQHSq+BWOjhm9
 lDgFFkyxIvnijmKXPbemkIhsd+aE1YLdT1RG3AlSziDFE030rxlp09yLw9MdHdHUdlYQ
 i3kM1egWqILTunrEIPOx2VI0AtN966kVtZu+2QiPYRNbvuvalcgXskm7N5SWBGohbOJp
 o72Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OGTm0UQKdb3bLdGM6tKYU9OQdCBQgoEE6wTKpbhs2HA=;
 b=EfA/svmQno+Te+y2hVnqIwwLc/i2K3FoIQrIPPYjz1zytVWI03n9GgEXvjkqaJtf3D
 iBUWTQJAsXe0pAmwhtGXMNkdNd0l3UTUrFCUU3Z3wi9BizUq2Ou3hXYDeAdo0yD8MAGI
 ZM0/TQIk8NTzWlTSupH1m4fi8Z20xAyGzNrEQF8lD8dy0Os7PU9YgWGvGIVgTgQWUYxk
 z9kCb4Wi9/a6n8+aGfFtgla7PxC//WGKdnmZQDULisjkK08TqYoSZYwm7Yw/BhDiSAiD
 x4vj9ZCRYNyPYEf1XSCf+ysCh+n4WyJhOSf8ziApnMqw1uCbDu6dRBXBfcrUeJCSFmHS
 O2VA==
X-Gm-Message-State: AFqh2kqli6+0BMBTbDEEmoi8PeYWVyaPfj9MPeB9dwxyBMIOS89TcBv0
 Gbb+46AxOtOIwagTtI58kmH02GJKKM6vK/A5eKg=
X-Received: by 2002:a05:6102:21cc:b0:3ba:8fa7:5f9e with SMTP id
 r12-20020a05610221cc00b003ba8fa75f9emr927794vsg.64.1671442380187; Mon, 19 Dec
 2022 01:33:00 -0800 (PST)
MIME-Version: 1.0
References: <20221218071229.484944-1-balbi@kernel.org>
 <20221218071229.484944-2-balbi@kernel.org>
In-Reply-To: <20221218071229.484944-2-balbi@kernel.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 19 Dec 2022 19:32:00 +1000
Message-ID: <CAKmqyKO2UVac7CtJ50JR=AqVBvr9mOnyUQqm6Xf81_px0kRt+A@mail.gmail.com>
Subject: Re: [PATCH 1/2] hw/arm/stm32f405: correctly describe the memory layout
To: Felipe Balbi <balbi@kernel.org>
Cc: Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>, 
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e35;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe35.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-TUID: wplagXcqP8uZ

On Mon, Dec 19, 2022 at 1:24 AM Felipe Balbi <balbi@kernel.org> wrote:
>
> STM32F405 has 128K of SRAM and another 64K of CCM (Core-coupled
> Memory) at a different base address. Correctly describe the memory
> layout to give existing FW images have a chance to run unmodified.
>
> Signed-off-by: Felipe Balbi <balbi@kernel.org>

Reviewed-by: Alistair Francis <alistair@alistair23.me>

Alistair

> ---
>  hw/arm/stm32f405_soc.c         | 8 ++++++++
>  include/hw/arm/stm32f405_soc.h | 5 ++++-
>  2 files changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/stm32f405_soc.c b/hw/arm/stm32f405_soc.c
> index c07947d9f8b1..cef23d7ee41a 100644
> --- a/hw/arm/stm32f405_soc.c
> +++ b/hw/arm/stm32f405_soc.c
> @@ -139,6 +139,14 @@ static void stm32f405_soc_realize(DeviceState *dev_soc, Error **errp)
>      }
>      memory_region_add_subregion(system_memory, SRAM_BASE_ADDRESS, &s->sram);
>
> +    memory_region_init_ram(&s->ccm, NULL, "STM32F405.ccm", CCM_SIZE,
> +                           &err);
> +    if (err != NULL) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +    memory_region_add_subregion(system_memory, CCM_BASE_ADDRESS, &s->ccm);
> +
>      armv7m = DEVICE(&s->armv7m);
>      qdev_prop_set_uint32(armv7m, "num-irq", 96);
>      qdev_prop_set_string(armv7m, "cpu-type", s->cpu_type);
> diff --git a/include/hw/arm/stm32f405_soc.h b/include/hw/arm/stm32f405_soc.h
> index 5bb0c8d56979..249ab5434ec7 100644
> --- a/include/hw/arm/stm32f405_soc.h
> +++ b/include/hw/arm/stm32f405_soc.h
> @@ -46,7 +46,9 @@ OBJECT_DECLARE_SIMPLE_TYPE(STM32F405State, STM32F405_SOC)
>  #define FLASH_BASE_ADDRESS 0x08000000
>  #define FLASH_SIZE (1024 * 1024)
>  #define SRAM_BASE_ADDRESS 0x20000000
> -#define SRAM_SIZE (192 * 1024)
> +#define SRAM_SIZE (128 * 1024)
> +#define CCM_BASE_ADDRESS 0x10000000
> +#define CCM_SIZE (64 * 1024)
>
>  struct STM32F405State {
>      /*< private >*/
> @@ -65,6 +67,7 @@ struct STM32F405State {
>      STM32F2XXADCState adc[STM_NUM_ADCS];
>      STM32F2XXSPIState spi[STM_NUM_SPIS];
>
> +    MemoryRegion ccm;
>      MemoryRegion sram;
>      MemoryRegion flash;
>      MemoryRegion flash_alias;
> --
> 2.38.1
>
>
