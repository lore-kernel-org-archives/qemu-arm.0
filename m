Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp3197341ejx;
        Mon, 14 Nov 2022 15:34:29 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4YXuH7CP869xZL/71IPHGhjqHrJLVqShI8Bi0/1itIl2XxYCXJmqeH6PY3F+fnRfEi3QDf
X-Received: by 2002:a05:620a:150f:b0:6fa:774:2822 with SMTP id i15-20020a05620a150f00b006fa07742822mr13491022qkk.410.1668468869196;
        Mon, 14 Nov 2022 15:34:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668468869; cv=none;
        d=google.com; s=arc-20160816;
        b=uoKvfMbwlUcaCN6OqgKmg+6eybubstxblu64PCR+cW0OCLEpHsRC3usMRNPQCCq2Fv
         vBoKjW2m3/+0N6ft8KQA/3qSkpBrHfcDU/R/WU5zmLyqPLzrZHSqI1AVwmXRFNtwttz4
         C7nVpe4ONyG2qSu8s2T0K83637lBtHrrFdiWvlEHJQ7W7a+UWkzrKhiTYA04MMRtzFvr
         js1UuSJKVwOpFaULXLY89WVtBKaFR/QJPpwQRvEGS1CXyEaqOVR9inbxEPHe+kvDRxar
         l1XSMpBGHNM81gbYifmW5GeUfbLm29HpsLsu4WE/N+sOI47ddYdn5Q6bnczL2qoqFegE
         rAjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=EH7xq0Cjay8bnTHLqhqbrmZMA4c8aW40WnuwGVm4dRc=;
        b=XZlKOa+KwcNeP67noRWqpdxoawgNzTXYdGunp3voDnMEat+8h5kbWB4qv+boh31HJu
         Tjm1OA3tIvKgIuRh/UdbVOV3FlOUu2KNzh/e8CE7weLECiqFCV1qTZ5DYGOISS4AZ7jC
         ZnX3oPjdhCA23HY6NBslGu+Vdo7UvXJXUTyYCAjmcWqZnExDRhA15J+EEXw6mTkUlrpV
         7R6Vc/ei5Cby103omPvP/6mHjaEiYYUP/EWKDKy4McOKGBfNp3OLQEP5NLfpW1+Zeh3f
         jY40DodXV1piwjBZPXl7WSDGBRAMtzzldief/UctwyO6pRQqbOme/MXhp+vhzg+Z0KJq
         Oeew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="pbXg6U/3";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f8-20020ac81348000000b0039cc47752e3si5974210qtj.737.2022.11.14.15.34.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Nov 2022 15:34:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="pbXg6U/3";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouinA-0007AS-8j; Mon, 14 Nov 2022 18:23:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ouif5-0004wo-BO
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:14:43 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oubbA-0003tr-KI
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 10:42:14 -0500
Received: by mail-pl1-x631.google.com with SMTP id v17so10411441plo.1
 for <qemu-devel@nongnu.org>; Mon, 14 Nov 2022 07:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=EH7xq0Cjay8bnTHLqhqbrmZMA4c8aW40WnuwGVm4dRc=;
 b=pbXg6U/3bVremElDd7eJfRZSkWTM/2O5Qw+t1t9TQrNfoSqCFGNix7yjlkl/naOYaY
 8DG8gAZm05yEPw6VLLDsgLAAFUpvtGvjiYrRXylkTzMrDzQ8LadYLbZtMM8QAP7yJ7eK
 RkU0AJ+6hSei+q1q7QD8rYwFKSi7Qq7ZVp4w1eBakNhCM8+Z9fHR2+Fe74/o1rnd15/i
 NQlMOHHc76+Lo/POujFJFZg1Q9eJQkgZtt7p406Gd17VrJ8K69OsFYZhI4/Gm6bw0npR
 GJA+7HtKFkqhtira3530tB2ehlB0UwfffVg81FNanNBQkIsvRS2bl2vRyH+WvFY6JpsG
 P0Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EH7xq0Cjay8bnTHLqhqbrmZMA4c8aW40WnuwGVm4dRc=;
 b=u8UnDj4JDwLCUih/h7aah48mI0n0T4f3nI5Trs191c/ZoHWrAE8qgXmQLncdl7DJfs
 kSPNqNZxdvm94ZY1ZNMr6eGT00b0rFzuhooUETo8CeAFWa8Gov67YUsrkI2kap324gzU
 ajsLG5WPGqFajdcTWXG6QrsUtOPiZxg/0kqDv/xfNMrwnFsV0ejVSsvHkBO5yT9DsfYe
 Av0VhThk15CojtiXI1xiOaEXATHyI5JqErlDhAnW7EZXFt6dH+UsKuOqz5QsHBjE8Ejf
 WBeXp+xz/Z0+eWIv4v66a9YV3yOhsuakRHLf6UpZKgoWgMzpev64SNvVhLq0J203KGwu
 MQ+w==
X-Gm-Message-State: ANoB5pmvowDfZ0p1S9Dpwqs0ZgkA2z8bJ+eDibQVuzXZvn/loFnI9hMK
 UNTU3MtIp2KXOxajrJ/a0UVufy0pTCbsAwfxnQBbeQ==
X-Received: by 2002:a17:90a:14a4:b0:212:d62a:aeb8 with SMTP id
 k33-20020a17090a14a400b00212d62aaeb8mr13835267pja.221.1668440531161; Mon, 14
 Nov 2022 07:42:11 -0800 (PST)
MIME-Version: 1.0
References: <20221112214900.24152-1-strahinja.p.jankovic@gmail.com>
In-Reply-To: <20221112214900.24152-1-strahinja.p.jankovic@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Nov 2022 15:41:59 +0000
Message-ID: <CAFEAcA_F0jcjviRGjgmb4J_Kos22+UE0vPbcXoTbPCP7xz-nXA@mail.gmail.com>
Subject: Re: [PATCH] hw/sd: Fix sun4i allwinner-sdhost for U-Boot
To: Strahinja Jankovic <strahinjapjankovic@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Beniamino Galvani <b.galvani@gmail.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Bt3kTM+QEkoK

On Sat, 12 Nov 2022 at 21:49, Strahinja Jankovic
<strahinjapjankovic@gmail.com> wrote:
>
> Trying to run U-Boot for Cubieboard (Allwinner A10) fails because it cannot
> access SD card. The problem is that FIFO register in current
> allwinner-sdhost implementation is at the address corresponding to
> Allwinner H3, but not A10.
> Linux kernel is not affected since Linux driver uses DMA access and does
> not use FIFO register for reading/writing.
>
> This patch adds new class parameter `is_sun4i` and based on that
> parameter uses register at offset 0x100 either as FIFO register (if
> sun4i) or as threshold register (if not sun4i; in this case register at
> 0x200 is FIFO register).
>
> Tested with U-Boot and Linux kernel image built for Cubieboard and
> OrangePi PC.
>
> Signed-off-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
> ---
>  hw/sd/allwinner-sdhost.c         | 67 ++++++++++++++++++++++----------
>  include/hw/sd/allwinner-sdhost.h |  1 +
>  2 files changed, 47 insertions(+), 21 deletions(-)
>
> diff --git a/hw/sd/allwinner-sdhost.c b/hw/sd/allwinner-sdhost.c
> index 455d6eabf6..51e5e90830 100644
> --- a/hw/sd/allwinner-sdhost.c
> +++ b/hw/sd/allwinner-sdhost.c
> @@ -65,7 +65,7 @@ enum {
>      REG_SD_DLBA       = 0x84,  /* Descriptor List Base Address */
>      REG_SD_IDST       = 0x88,  /* Internal DMA Controller Status */
>      REG_SD_IDIE       = 0x8C,  /* Internal DMA Controller IRQ Enable */
> -    REG_SD_THLDC      = 0x100, /* Card Threshold Control */
> +    REG_SD_THLDC      = 0x100, /* Card Threshold Control / FIFO (sun4i only)*/
>      REG_SD_DSBD       = 0x10C, /* eMMC DDR Start Bit Detection Control */
>      REG_SD_RES_CRC    = 0x110, /* Response CRC from card/eMMC */
>      REG_SD_DATA7_CRC  = 0x114, /* CRC Data 7 from card/eMMC */
> @@ -415,10 +415,29 @@ static void allwinner_sdhost_dma(AwSdHostState *s)
>      }
>  }
>
> +static uint32_t allwinner_sdhost_fifo_read(AwSdHostState *s)
> +{
> +    uint32_t res = 0;
> +
> +    if (sdbus_data_ready(&s->sdbus)) {
> +        sdbus_read_data(&s->sdbus, &res, sizeof(uint32_t));
> +        le32_to_cpus(&res);
> +        allwinner_sdhost_update_transfer_cnt(s, sizeof(uint32_t));
> +        allwinner_sdhost_auto_stop(s);
> +        allwinner_sdhost_update_irq(s);
> +    } else {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: no data ready on SD bus\n",
> +                      __func__);
> +    }
> +
> +    return res;
> +}
> +
>  static uint64_t allwinner_sdhost_read(void *opaque, hwaddr offset,
>                                        unsigned size)
>  {
>      AwSdHostState *s = AW_SDHOST(opaque);
> +    AwSdHostClass *sc = AW_SDHOST_GET_CLASS(s);
>      uint32_t res = 0;
>
>      switch (offset) {
> @@ -508,8 +527,12 @@ static uint64_t allwinner_sdhost_read(void *opaque, hwaddr offset,
>      case REG_SD_IDIE:      /* Internal DMA Controller Interrupt Enable */
>          res = s->dmac_irq;
>          break;
> -    case REG_SD_THLDC:     /* Card Threshold Control */
> -        res = s->card_threshold;
> +    case REG_SD_THLDC:     /* Card Threshold Control or FIFO register (sun4i) */
> +        if (sc->is_sun4i) {
> +            res = allwinner_sdhost_fifo_read(s);
> +        } else {
> +            res = s->card_threshold;
> +        }
>          break;
>      case REG_SD_DSBD:      /* eMMC DDR Start Bit Detection Control */
>          res = s->startbit_detect;
> @@ -531,16 +554,7 @@ static uint64_t allwinner_sdhost_read(void *opaque, hwaddr offset,
>          res = s->status_crc;
>          break;
>      case REG_SD_FIFO:      /* Read/Write FIFO */
> -        if (sdbus_data_ready(&s->sdbus)) {
> -            sdbus_read_data(&s->sdbus, &res, sizeof(uint32_t));
> -            le32_to_cpus(&res);
> -            allwinner_sdhost_update_transfer_cnt(s, sizeof(uint32_t));
> -            allwinner_sdhost_auto_stop(s);
> -            allwinner_sdhost_update_irq(s);
> -        } else {
> -            qemu_log_mask(LOG_GUEST_ERROR, "%s: no data ready on SD bus\n",
> -                          __func__);
> -        }
> +        res = allwinner_sdhost_fifo_read(s);

Does the sun4i really have the FIFO at both addresses, or should
this one do something else for sun4i ?

thanks
-- PMM
