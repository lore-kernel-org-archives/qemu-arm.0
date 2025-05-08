Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp219582njb;
        Wed, 7 May 2025 23:20:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWdsbddJllUoKWxWeKob2W7wya8De2i8MoSE/Bc0FeP5xk3OV4uWUeCsLrqi+nV8oO0oBxG9GOPMkG2DQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEkbJZbcLJQXOWGfYQM4bkn58BAACKF1gCHzD/dQAzIvEznvMIR1P9YjZuuBH20dRy6iA7y
X-Received: by 2002:a05:6214:2a46:b0:6f5:11a9:51fe with SMTP id 6a1803df08f44-6f54c489051mr39704036d6.36.1746685219356;
        Wed, 07 May 2025 23:20:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746685219; cv=none;
        d=google.com; s=arc-20240605;
        b=ZvznY8r1+ghg1H3jvBErX6Xet+IT2IYeO5zV8ildLlKfJs/VZLyL2g3SiAm5o4juPK
         /ZVSrvtSRIr7u8828EkG2Sgl+U02VlSdgaCm1PtOjwtrxuKHWnkaRFGWWh/MZvQ13lnc
         bqgjhrPmiVLwvk9bl1J3+qr1A94X9coeglzIZPY3PSWBKwjWdtW9pkzljIsbYCl7D39H
         gHfeo1sjsm3rRNc+URpl+UxqKRCQQ65z/gxoKKxvrSwjF+3ED18HHzQ0iMdprph962Zx
         nWgTunAHpBE1o1nFUocN5CwOd0wf+P3ILgCgh/uR6nfDQ2OyH3TMOVdVoChlEBEjkV4r
         KwrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=yiHP4TlwEh6ms74MOz5a63FG2+OHs0apV3ncHU+nk4w=;
        fh=AK8jqPp7dDiEag2y/oHNk8OEqdygcUhyNkzW0+Fz5aI=;
        b=lzHMRHGsQcLp9mAJZKqAD+LkcNdf6RW3WPL0ZvjWEGMMYJ0fL+iK8e0TA30C53vC0s
         z/wA2nAYE00RgJWfu0fx2JsLxiB1Ovl7g9TnTEOn1G5PDSGFnaDnm4h+EO+koarelDhG
         pOVMR1W3yaHsl4cRqMjZE3KOG7Ms2hJ9ubOaV71o5Kd7/77CVj+wAcIbCIU1vj2V/eU+
         OUzRuIOh0+iQbkJXu3NAUhzi+YUkXqYEllgKLuDAGJweLtOYUpgGUaXBD5FEveQaJBgS
         XtX6/7bWnj1EoZxNomWDWwn9uGdc4zC6RQjiHRRdM5LTQLb5ZuiXYOcMjfUIlcSa4XbS
         yM1Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="b/PgQrpb";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f5437ae142si32705536d6.357.2025.05.07.23.20.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 May 2025 23:20:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="b/PgQrpb";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uCubV-0001UR-OJ; Thu, 08 May 2025 02:19:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uCubS-0001Sd-P5
 for qemu-arm@nongnu.org; Thu, 08 May 2025 02:19:30 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uCubQ-00086E-W0
 for qemu-arm@nongnu.org; Thu, 08 May 2025 02:19:30 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-736aaeed234so603444b3a.0
 for <qemu-arm@nongnu.org>; Wed, 07 May 2025 23:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746685167; x=1747289967; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yiHP4TlwEh6ms74MOz5a63FG2+OHs0apV3ncHU+nk4w=;
 b=b/PgQrpbuvjlTXqkMTQhOCgG40ymOLroEGMgCDx60y3JYPPJsMtK9outgzf4Y1xo/o
 4uzNnIB2nrERkv7eXtiby9WZF7w64vjLxiOz+6KKvnDVbwUQV0OYaNHfshd2X9iNGWMV
 ZYk/tf3p3pazD/Iy334u6Vl/PaOfrYB1GkmUc66uZkdBcRVrKTh7bmhull0OqGddHMCF
 suAKd/4gw5trO2l1Cjfz7uuvUU+SlHG5nNGfzXJFQI8RRrmyhwm5BlDPbMRDJeJNlxFC
 4xVS4M9G2IUoa1RtFutfEM7yEDo0Z6UfXeQuNcFmaQRcrPGP8udshHoG1zxXy0Eo8PLf
 bMNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746685167; x=1747289967;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yiHP4TlwEh6ms74MOz5a63FG2+OHs0apV3ncHU+nk4w=;
 b=GptxW6uspEJm3M3pL7uO7ODUmrk2gQ0sr/puoCR9j4aG2gMU757jmNVeF2hI6ahB+O
 VQzXRqiSWbK2b0DJilVuzNIYf1LZBfI9KLCtP3BWziMiXAFOIoT6AmKfZqm0yZAJ4eeT
 avUPpWKOUR2UZ8WEopsbO5ACRfQVx7ndtWExAcMKdiwdYmoDRyO/yhDBfVMVNSIbVhA9
 YCvGQjLKFII+bQRvr9gecAb6sDny09WbvtK/wtyOUk2J3UT8L4nLd8U5ehWKDPeHLQFo
 qZj2MZinoecJW+mRYPsPcYsDrUh2Hpauo+BUmsQmvYShbEZfHZaI8+3RJi5e3lktbXT5
 TOiw==
X-Gm-Message-State: AOJu0YwklFY2vyF4VVE0k4mCbqcNMf99xs1X6j68o2TETXkiZYFK76Tg
 59jnkbvz4OMf7Kp7sGZY1MmQgRTgmM5LlSrWfy0KtrhVEkUUylJ5LZGCR0HuolE=
X-Gm-Gg: ASbGncuBE/qV9Jtg3Wt8DaqZYPsyUE69fJIWU5L8dS9tn01U84FkxKaStM3/ZsDGIJS
 uWJFJUAe4CF9i7OgqhUEwV0FWdNrjHMSJaAqxuUZToW7p7NuwVd86QJr6dkU0z+mIwv7zeS731o
 bfwLa0aRt7WN3NtfUakXTiGyVhDbYx0q3PpTQ6yOBCQkG0YBkcbHPmnxucxH9iHG8/CPyBh//yU
 b1UAGqjKSEIdcJuQCSULrzWygA+guAe6c03Rc8dbX1FYsIEMYv2KOPcWiLf9ewJB5IJaOcLvw6h
 fSPCECd2xJV0LL8sz33M1TKHth2KPdKSWvoY3vNjDt8W8wXsRjXSA3dn/8TFQad/cwjATMrJ3fV
 fCc9A46TGuvLMMXVpyPY=
X-Received: by 2002:a05:6a20:3d94:b0:1f5:7f56:a649 with SMTP id
 adf61e73a8af0-2159af5b182mr2723143637.13.1746685167307; 
 Wed, 07 May 2025 23:19:27 -0700 (PDT)
Received: from [192.168.69.243] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-740aeafa44fsm609025b3a.20.2025.05.07.23.19.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 May 2025 23:19:26 -0700 (PDT)
Message-ID: <e6b06003-7145-46d5-b19d-b9e134084fc7@linaro.org>
Date: Thu, 8 May 2025 08:19:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v2] hw/arm/npcm8xx_boards: Add auto zero flash image and device
 part number
To: Tim Lee <timlee660101@gmail.com>, peter.maydell@linaro.org,
 wuhaotsh@google.com, kfting@nuvoton.com, chli30@nuvoton.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20250508021510.2959328-1-timlee660101@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250508021510.2959328-1-timlee660101@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: Kl2p4AqtC+yU

Hi Tim,

On 8/5/25 04:15, Tim Lee wrote:
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
> Changes since v1:
> - Add a statement that checks whether the storage is writable
> 
>   hw/arm/npcm8xx_boards.c | 20 +++++++++++++++++++-
>   1 file changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/npcm8xx_boards.c b/hw/arm/npcm8xx_boards.c
> index 3fb8478e72..79295a586c 100644
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
> @@ -59,10 +60,26 @@ static void npcm8xx_connect_flash(NPCM7xxFIUState *fiu, int cs_no,
>   {
>       DeviceState *flash;
>       qemu_irq flash_cs;
> +    BlockBackend *blk;
> +    BlockDriverState *bs;
> +    uint64_t blk_size, perm, shared_perm;
>   
>       flash = qdev_new(flash_type);
>       if (dinfo) {
>           qdev_prop_set_drive(flash, "drive", blk_by_legacy_dinfo(dinfo));
> +        blk = blk_by_legacy_dinfo(dinfo);
> +        bs = blk_bs(blk);
> +        blk_size = blk_getlength(blk);
> +
> +        if (!bdrv_is_read_only(bs)) {

This isn't what I meant, we'll get the same issue with read-only storage.

See:
https://lore.kernel.org/qemu-devel/CAFEAcA9itEDTrznX1KRVEza__Dch95aBpPzbdTJ0-tuxwiHtoQ@mail.gmail.com/

> +            if (blk_size < fiu->flash_size) {
> +                blk_get_perm(blk, &perm, &shared_perm);
> +                blk_set_perm(blk, BLK_PERM_ALL, BLK_PERM_ALL, &error_abort);
> +                blk_truncate(blk, fiu->flash_size, true, PREALLOC_MODE_OFF,
> +                             BDRV_REQ_ZERO_WRITE, &error_abort);
> +                blk_set_perm(blk, perm, shared_perm, &error_abort);
> +            }
> +        }
>       }
>       qdev_realize_and_unref(flash, BUS(fiu->spi), &error_fatal);
>   
> @@ -194,7 +211,8 @@ static void npcm845_evb_init(MachineState *machine)
>       qdev_realize(DEVICE(soc), NULL, &error_fatal);
>   
>       npcm8xx_load_bootrom(machine, soc);
> -    npcm8xx_connect_flash(&soc->fiu[0], 0, "w25q256", drive_get(IF_MTD, 0, 0));
> +    npcm8xx_connect_flash(&soc->fiu[0], 0, "mx66l1g45g",
> +                          drive_get(IF_MTD, 0, 0));
>       npcm845_evb_i2c_init(soc);
>       npcm845_evb_fan_init(NPCM8XX_MACHINE(machine), soc);
>       npcm8xx_load_kernel(machine, soc);

