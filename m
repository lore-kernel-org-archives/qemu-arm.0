Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2314860njj;
        Mon, 5 May 2025 02:33:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU/yqO0Tkps956tS6GSRbLQKgqFVOfd+1wz5+jc7emJM818jwCJ5MWPqywoxa9OrxkMRkSrUWwRIh72cA==@linaro.org
X-Google-Smtp-Source: AGHT+IG4VFlIfh8AhkyCd80DKuxz6vN1z6xFDBUeUzHVHdWFwGsaItVhGs/9kmZdcco5PeQWoiP0
X-Received: by 2002:a05:6214:4009:b0:6f4:c647:de44 with SMTP id 6a1803df08f44-6f5237220eemr119224706d6.6.1746437619061;
        Mon, 05 May 2025 02:33:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746437619; cv=none;
        d=google.com; s=arc-20240605;
        b=T+MIpi75rQWdIGEwhtsjbDHW2+PRnFdY8LOzCZ6HRC34QZYE/Mq8YZs1tBu2oJWZWG
         LxFOcB8l26KFsUAf1FWIoJFVn8Lb8pAiWydXxV50MzR0DwK55cBYGAZUQV4A2Ai1BhvJ
         Fyt6ajlE5dvPWsI4Ynb+sweK5+6buFfRBImtc2axI+AkhiIsC696Tae7rjmvAW3rSpn8
         EVTELYK8/yxQOfdWW+KIXC1GmWkYsBJmyF86Ys7wWO9RoVOzdLkQXlUeNKalXdKJrWGk
         jaRs9IRIwPzN2ghQlqH+oNEvP1mWQ8s/2LINMUb223CdbipZ+0amr/t1sntaNjG4Yqgj
         hUtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=RP1SxWFy3y21M/55BX5c21okdbyYV4ky+7yqUWS3uNw=;
        fh=Q6/r25soIdVlHuMWSoKhiJn6PXoQy7oI8cDWpJRVhmE=;
        b=A5Nph4tqXddmj2Q9qYwmI1JGn4KrF61Kjd/pvFUVUeSOviaVS+ZZa2sqVyTHhGnPv0
         tZNd5l5KeqC9JXZzVTwZ+7rd4klZ5+8qWpSmYm67jf4/OOgE77lKO4O0H3dxRKaZr7ek
         ntDXxHR+Jl94ym1J1pd+NbxGGs7txYo3bouIHri//mJ5cYVCK2XlA9HFwxdc8VOeQGd8
         EzFeteVH72u92oJHJiI4KwOD7ZDkhc83PUBZNb6nVjs29XmSaWrg2WDsd6e7hFQ6EOQx
         GDJ6bTMPhXK76pBWdbZ4GBvMx6N4lz+rB7vwRggd9uH20yhU36tnNJnsmmYoRCXWQuy/
         m0EA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=v3+jk+bF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f50f4abc17si89287556d6.443.2025.05.05.02.33.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 May 2025 02:33:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=v3+jk+bF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uBsCf-00009X-Is; Mon, 05 May 2025 05:33:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uBsCQ-0008SN-0n
 for qemu-arm@nongnu.org; Mon, 05 May 2025 05:33:23 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uBsCN-0002NA-4P
 for qemu-arm@nongnu.org; Mon, 05 May 2025 05:33:21 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43cfe574976so24196875e9.1
 for <qemu-arm@nongnu.org>; Mon, 05 May 2025 02:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746437597; x=1747042397; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RP1SxWFy3y21M/55BX5c21okdbyYV4ky+7yqUWS3uNw=;
 b=v3+jk+bFiTCblB0LqX6i7T4GWl55zQVfKB3fFr3PZ+S+uP+Uuu8/6dh+g8TSzZKxHI
 BiK/RBXwuf15zjkhcqjyJuLNWRKqrB++6X8Q51M7/NIks7qwUsOxdy3nR6Dd5BJCxc3y
 OfuQ7x5pCYLYr3Cu1o7sphkv/TXB5s98xl0SRZslDEfSAUR+bLOeHs07+zbFyCTW1+EK
 e2zBoXcdvK8OX59/e+1UBQO89rg/krd6Fxv6BS++juU7s3ZSTqKDIk7tEQYvGpU8cEax
 8eenaoeVOv8OqQ0K+nnDamJtd6q/tiPwHZa25dkWp9jKohIqb9jMhAqUdbmKBPDo9S5L
 7GLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746437597; x=1747042397;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RP1SxWFy3y21M/55BX5c21okdbyYV4ky+7yqUWS3uNw=;
 b=w5C10TLi304/nbwvxniQiS9rkBxhoPvK1ZJW//pcSZaM4xy+Bkl2+pAgw5q3aTOZ60
 u/WZyS8PgzjRiL4F9Di6kswtf1sN1xc2N1qsKN0CMshcW55OyBz6tw3J/Ia8YgljWTPc
 zHHB/5sEKcL7GVacUAhJ9hyBFLxMl7Y1p32Y8uzsxJUDyMycX9as7lItIKdL8HkfFmy0
 O4s+w/SUlzgnuqx/NW2KxJMmA0BphREl7ZzNyq1RlFh4lc1vTzLBEi0pqtdJZi4A1yEH
 BXISMtBhWzDfMPhORTQaGaFwIzLDda9HWm6G39qU+EeYdlVEVeeSkuKkxV9SJmXXrhE9
 kDvg==
X-Gm-Message-State: AOJu0Yx9SJmmNbJimbsQz0zwKwmXE8Y8NjNQRAmpNEE5XbCJo+ms5dzp
 b2PKW4gC4ekK6SjpXE6o4/vDENKPvOP8u7q61tIbUMwiVywIF8k1DtB13XEMr1c=
X-Gm-Gg: ASbGncv6laKmFNN3ZgWTZP6SDvH1SpUyxiJU31Ix/s1l5Tt9zP3qLRt4Nce5GQjXTQl
 KtJPVI8phkfQpYvMT+vQ5DQECU+C7qd5FOgfSVij/I2vL3z4gyu0SL8E/CSEKbIIx5DUel+YMkf
 ZBSO/pC70ggk4mKz4Bm8wcvKZSvB9HUtmw0fMmzcTqyxcO0H3FFkO6sDhdHyfbql/GOU+1JxJoF
 E172OXepQGfwJDNrB8TLZuMHLeYckRzWTR7ISOysD4X49EG6ZJUQm3j3SXHp/eXqkbu0/KYQfaJ
 AYGypELiSkj3dq8dgqjnLCs9SYjci5iD/fADQhAiP3w8YM9CBGQsdmcL1FZLI6RVdkFxk3NZNgf
 PD3aLyOLDvTv3T7yj5XH8RspTvKyI
X-Received: by 2002:a05:600c:1c1c:b0:43c:fe5e:f040 with SMTP id
 5b1f17b1804b1-441bbf34170mr91113465e9.23.1746437596674; 
 Mon, 05 May 2025 02:33:16 -0700 (PDT)
Received: from [10.194.152.213] (29.red-88-28-18.dynamicip.rima-tde.net.
 [88.28.18.29]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-441b89cc50esm130475655e9.8.2025.05.05.02.33.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 May 2025 02:33:16 -0700 (PDT)
Message-ID: <2d3d33c3-21a6-4432-9d9e-7332c5de63bb@linaro.org>
Date: Mon, 5 May 2025 11:33:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/arm/npcm8xx_boards: Add auto zero flash image and
 device part number
To: Tim Lee <timlee660101@gmail.com>, peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com,
 chli30@nuvoton.com, kfting@nuvoton.com
References: <20250401085903.224787-1-timlee660101@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250401085903.224787-1-timlee660101@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 64dNoEHhbPCp

On 1/4/25 10:59, Tim Lee wrote:
> Fix flash device part number to `mx66l1g45g` according image-bmc run on npcm8xx
> evb board (SPIFlash...SF: Detected mx66l1g45g, total 128 MiB)
> 
> And add auto zero flash image size to resolve error below after executing
> `./qemu-system-aarch64 -machine npcm845-evb -drive file=image-bmc`
> 
> Error message:
> qemu-system-aarch64: mx66l1g45g device '/machine/unattached/device[73]'
> requires 134217728 bytes, mtd0 block backend provides 67108864 bytes
> 
> Tested:
> Build passes and runs ./qemu-system-aarch64 -machine npcm845-evb normally
> 
> Signed-off-by: Tim Lee <timlee660101@gmail.com>
> ---
>   hw/arm/npcm8xx_boards.c | 15 ++++++++++++++-
>   1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/npcm8xx_boards.c b/hw/arm/npcm8xx_boards.c
> index 3fb8478e72..11b792c613 100644
> --- a/hw/arm/npcm8xx_boards.c
> +++ b/hw/arm/npcm8xx_boards.c
> @@ -27,6 +27,7 @@
>   #include "qemu/error-report.h"
>   #include "qemu/datadir.h"
>   #include "qemu/units.h"
> +#include "system/block-backend.h"
>   
>   #define NPCM845_EVB_POWER_ON_STRAPS 0x000017ff
>   
> @@ -59,10 +60,21 @@ static void npcm8xx_connect_flash(NPCM7xxFIUState *fiu, int cs_no,
>   {
>       DeviceState *flash;
>       qemu_irq flash_cs;
> +    BlockBackend *blk;
> +    uint64_t blk_size, perm, shared_perm;
>   
>       flash = qdev_new(flash_type);
>       if (dinfo) {
>           qdev_prop_set_drive(flash, "drive", blk_by_legacy_dinfo(dinfo));
> +        blk = blk_by_legacy_dinfo(dinfo);
> +        blk_size = blk_getlength(blk);
> +        if (blk_size < fiu->flash_size) {
> +            blk_get_perm(blk, &perm, &shared_perm);
> +            blk_set_perm(blk, BLK_PERM_ALL, BLK_PERM_ALL, &error_abort);
> +            blk_truncate(blk, fiu->flash_size, true, PREALLOC_MODE_OFF,
> +                         BDRV_REQ_ZERO_WRITE, &error_abort);
> +            blk_set_perm(blk, perm, shared_perm, &error_abort);

This won't work on read-only storage.

> +        }
>       }
>       qdev_realize_and_unref(flash, BUS(fiu->spi), &error_fatal);
>   
> @@ -194,7 +206,8 @@ static void npcm845_evb_init(MachineState *machine)
>       qdev_realize(DEVICE(soc), NULL, &error_fatal);
>   
>       npcm8xx_load_bootrom(machine, soc);
> -    npcm8xx_connect_flash(&soc->fiu[0], 0, "w25q256", drive_get(IF_MTD, 0, 0));
> +    npcm8xx_connect_flash(&soc->fiu[0], 0, "mx66l1g45g",
> +                          drive_get(IF_MTD, 0, 0));
>       npcm845_evb_i2c_init(soc);
>       npcm845_evb_fan_init(NPCM8XX_MACHINE(machine), soc);
>       npcm8xx_load_kernel(machine, soc);

