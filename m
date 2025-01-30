Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp65390njb;
        Thu, 30 Jan 2025 14:21:59 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV7QoLGmRASu7AjBy7SHwFamaJoA6O8MTchy4OMXkIzgamieF6iiywPNtFcJLTWuDwJ4rmhgh1VTCk4BA==@linaro.org
X-Google-Smtp-Source: AGHT+IFlrmxiL/Pm+3FNhonfFLpNgHFs2LXvMKyAImYusozoZ934EAnPXYjhteJnOMVDBkAD9xa/
X-Received: by 2002:ac8:5f88:0:b0:467:4f0a:1b5d with SMTP id d75a77b69052e-46fd0b68880mr139773941cf.42.1738275719320;
        Thu, 30 Jan 2025 14:21:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738275719; cv=none;
        d=google.com; s=arc-20240605;
        b=KMi1gaLxCytL3c1ir+SITF6UW46/wVhHG94G405Ufe+WOisrYuVyjeth3AbFK076WJ
         qP35HDbFKUuCTZBekBNQMQiR3Sr27fv76aadTLqkcHi3h8N6oOtWLFRP3ElSEeEe55PR
         8GTb2qRTHrBT338jw61YizwdCqi6VCjPu486vJrI78WScSlir6DByCHPvTZFSyxdkO5h
         qLnPCJq7gGma/DVbuABJWxnoG5aXx1o9UgaHABCeRggvmJx2XtKttNynMAgCLUn8mDim
         NEIhYDqw65znar84vHjNIKzuTZqGfyBC9qD210L5Elmsoslvkne/6gKj6OU5k7zB/dcP
         Gf+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=XFuVMbY1XRX8YNYEsptR1nEBGnTwqQTq/2pnMslvl/I=;
        fh=lIwtZ4RSw/G+n4J+7Ry4VLFihSxxOcM61quRdkfKKqg=;
        b=igPwEnMmXxxnEsDiVwi0fLIydAl7qMGQV9X1ZTR17NEaoxehkhwC7kzAKDCqhHQMsO
         UeH5fiC/693DiurM6/P7gVZ3Xyldt865SDi5SgjDkQBR4A/iw+PV8J4xOYQKADakLzAl
         CM0W3vgGFXtm2FzmcUYL/rlrK6NIWibAet/XH7RMALVB8fiNgXQqfzWTABtuoxtvM4i8
         Xjcir4mJXCgRQGSP6tHjfgLd3JoEYB7sBJaEff/WEtK5VF3eRyF7RNbh/GRqUKks5ex3
         3uL5UcHvzjqyZPfJ53ohlq9xgRAEx7npEGP6NlIHqnPIcmlu8ZIZPLvaC4oGhFzMBq5o
         c1lQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=adM06i3N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46fdf1dfb0bsi24216021cf.531.2025.01.30.14.21.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Jan 2025 14:21:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=adM06i3N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tdcuo-0006y2-79; Thu, 30 Jan 2025 17:21:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tdcum-0006wL-3y
 for qemu-arm@nongnu.org; Thu, 30 Jan 2025 17:21:36 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tdcuj-0000LC-TA
 for qemu-arm@nongnu.org; Thu, 30 Jan 2025 17:21:35 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4362bae4d7dso9795135e9.1
 for <qemu-arm@nongnu.org>; Thu, 30 Jan 2025 14:21:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738275692; x=1738880492; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XFuVMbY1XRX8YNYEsptR1nEBGnTwqQTq/2pnMslvl/I=;
 b=adM06i3NNEXFxEBPCRAW9IV3PeW8CKvXKAP1cW0188BXNoMldx/vr8NUnCZYl0QyYU
 CHlHHNOs70BgLWmMOyAeLij9bSJgOMHd+We4x52rlGPEnFTniuQEL1bMvmpu5CXh7KRc
 FNW2ZHmNj7XKrjOejOCX3ER5eOAue/buCNrMev+xfb5Zwf9pwlBDY4Cv9FFXLDzE3ZEE
 QBB9T49M9DBeh7BCiuSnWQfDOqEw/impuhJjVIZSycHtwsKGk0nWJxdybKfhRFqEQhFZ
 7BFatEPs91IjPw2ilvqo2T/crfUNQbVeiHgqNpglrXrJKWURTGwapMvZz8c0GQPeatqV
 nzag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738275692; x=1738880492;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XFuVMbY1XRX8YNYEsptR1nEBGnTwqQTq/2pnMslvl/I=;
 b=E+ccrgukIdaGd211Qn4idohecIKw0/zLI9Rcgvt5zfTejRCXF3LGTeQRHueCCzyAAm
 gLkyGiPCifyYHGLxhFqqcIbRTcPzYg7J2X4nOJVrFLevDV4X2S4girYQQnl9FIcRaOFz
 9aVgwyw5JObpc3SCWGrQSWD7bdJ81kG4JJRRDq1i1eRKRONeKU+67ZfXCckLHyEB5S5a
 9dTSPm+PitJ/3COaOyphbVRGz1T0BlOyYzi6GkI8Kqjcy21DbSskbmGKdUwBJRfEI48W
 FlJFjx8+qmLKfjlmL+jFgyNd5tzssC1lBpxnfRMwsa5bJHabajBMuzfAqUHIDo9+WmJN
 KKgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVh8B8gT4qSuQw6KIO8GLD0Fs+gDf9HxPVlZmCnOJjlWLTYbsWmU+aGFLWqiJeMJFSiif2RrJksFA==@nongnu.org
X-Gm-Message-State: AOJu0YzwJjUmBCyZk0BoMk3/eXYQJI9WhN9tj1BqItnnP8djB3vKbZef
 qHI98pkUwZ0JlieUxsA8g5UZGZYwUxBqCm6VvItvn/xoRcf36PSzdV2Ph4NYNJM=
X-Gm-Gg: ASbGncsraP3YgZy++3OWCwPEDrobBVQLzK9kQwqjOVqq37jGUe3w1TJk6txw+nCw1CG
 Z1YWINHugi4B+s2jyOyUaZaV6KxiIFJZI7KP+yhEGb8gNgUelVGZ3kHlrVeoDQPuzAT4gXEV+Ae
 NuumKIxcR57BvJgCQP3yLaINc4KWxMEiAgNfjIZwrrTAr1/35vnjtzaumTH1iIz9vVaODB6ghIb
 SVuoXZjefXI4Yk++4/AtvUeBCvbJyM5YIY3ArJnb6qTvzuUp+Om937+forhjhKhKjC6ugR1nKgJ
 qQtvulTnHzwp2hNTEFxGbN4iDtwJfRCrlCzeLswOIh/NKyphx/M19rPJW0I=
X-Received: by 2002:a05:600c:1e21:b0:434:fec5:4ef5 with SMTP id
 5b1f17b1804b1-438dc3c3287mr88430605e9.14.1738275691817; 
 Thu, 30 Jan 2025 14:21:31 -0800 (PST)
Received: from [192.168.69.198] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438e245f14esm35409685e9.34.2025.01.30.14.21.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jan 2025 14:21:31 -0800 (PST)
Message-ID: <e30e4227-5db0-45d1-b77f-d33e81f3c009@linaro.org>
Date: Thu, 30 Jan 2025 23:21:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/11] hw/sd: Remove unused legacy functions, stop killing
 mammoths
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
Cc: qemu-block@nongnu.org, Bin Meng <bmeng.cn@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>
References: <20250128104519.3981448-1-peter.maydell@linaro.org>
 <20250128104519.3981448-11-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250128104519.3981448-11-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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
X-TUID: kHIFGKVxzHis

+Markus for commit 007d1dbf725 ("sd: Hide the qdev-but-not-quite thing
created by sd_init()").

On 28/1/25 11:45, Peter Maydell wrote:
> The sdcard_legacy.h header defines function prototypes for the "legacy"
> SD card API, which was used by non-qdevified SD controller models.
> We've now converted the only remaining non-qdev SD controller, so
> we can drop the legacy API.
> 
> Entirely unused functions:
>    sd_init(), sd_set_cb(), sd_enable()
> 
> Functions which now become static inside sd.c (they are the
> underlying implementations of methods on SDCardClass):
>    sd_do_command(), sd_write_byte(), sd_read_byte()
> 
> Removal of sd_init() means that we can also remove the
> me_no_qdev_me_kill_mammoth_with_rocks flag, the codepaths that were
> only reachable when it was set, and the inserted_cb and readonly_cb
> qemu_irq lines that went with that.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   include/hw/sd/sdcard_legacy.h | 50 -----------------------
>   hw/sd/omap_mmc.c              |  2 +-
>   hw/sd/sd.c                    | 77 ++++-------------------------------
>   3 files changed, 9 insertions(+), 120 deletions(-)
>   delete mode 100644 include/hw/sd/sdcard_legacy.h
> 
> diff --git a/include/hw/sd/sdcard_legacy.h b/include/hw/sd/sdcard_legacy.h
> deleted file mode 100644
> index 0dc38895551..00000000000
> --- a/include/hw/sd/sdcard_legacy.h
> +++ /dev/null
> @@ -1,50 +0,0 @@
> -/*
> - * SD Memory Card emulation (deprecated legacy API)
> - *
> - * Copyright (c) 2006 Andrzej Zaborowski  <balrog@zabor.org>
> - *
> - * Redistribution and use in source and binary forms, with or without
> - * modification, are permitted provided that the following conditions
> - * are met:
> - *
> - * 1. Redistributions of source code must retain the above copyright
> - *    notice, this list of conditions and the following disclaimer.
> - * 2. Redistributions in binary form must reproduce the above copyright
> - *    notice, this list of conditions and the following disclaimer in
> - *    the documentation and/or other materials provided with the
> - *    distribution.
> - *
> - * THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS''
> - * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
> - * THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
> - * PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR
> - * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
> - * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
> - * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
> - * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY
> - * OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
> - * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
> - * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> - */
> -#ifndef HW_SDCARD_LEGACY_H
> -#define HW_SDCARD_LEGACY_H
> -
> -#include "hw/sd/sd.h"
> -
> -/* Legacy functions to be used only by non-qdevified callers */
> -SDState *sd_init(BlockBackend *blk, bool is_spi);
> -int sd_do_command(SDState *card, SDRequest *request, uint8_t *response);
> -void sd_write_byte(SDState *card, uint8_t value);
> -uint8_t sd_read_byte(SDState *card);
> -void sd_set_cb(SDState *card, qemu_irq readonly, qemu_irq insert);
> -
> -/* sd_enable should not be used -- it is only used on the nseries boards,
> - * where it is part of a broken implementation of the MMC card slot switch
> - * (there should be two card slots which are multiplexed to a single MMC
> - * controller, but instead we model it with one card and controller and
> - * disable the card when the second slot is selected, so it looks like the
> - * second slot is always empty).
> - */
> -void sd_enable(SDState *card, bool enable);
> -
> -#endif /* HW_SDCARD_LEGACY_H */
> diff --git a/hw/sd/omap_mmc.c b/hw/sd/omap_mmc.c
> index c1598135f44..d31456ad236 100644
> --- a/hw/sd/omap_mmc.c
> +++ b/hw/sd/omap_mmc.c
> @@ -25,7 +25,7 @@
>   #include "hw/irq.h"
>   #include "hw/sysbus.h"
>   #include "hw/arm/omap.h"
> -#include "hw/sd/sdcard_legacy.h"
> +#include "hw/sd/sd.h"

This hunk belongs to patch #4 "hw/sd/omap_mmc: Convert to SDBus API",
otherwise:

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

>   
>   typedef struct OMAPMMCState {
>       SysBusDevice parent_obj;
> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
> index f781fd1641d..74bb7f39bbf 100644
> --- a/hw/sd/sd.c
> +++ b/hw/sd/sd.c
> @@ -39,7 +39,6 @@
>   #include "hw/registerfields.h"
>   #include "system/block-backend.h"
>   #include "hw/sd/sd.h"
> -#include "hw/sd/sdcard_legacy.h"
>   #include "migration/vmstate.h"
>   #include "qapi/error.h"
>   #include "qemu/bitmap.h"
> @@ -120,10 +119,6 @@ typedef struct SDProto {
>   struct SDState {
>       DeviceState parent_obj;
>   
> -    /* If true, created by sd_init() for a non-qdevified caller */
> -    /* TODO purge them with fire */
> -    bool me_no_qdev_me_kill_mammoth_with_rocks;
> -
>       /* SD Memory Card Registers */
>       uint32_t ocr;
>       uint8_t scr[8];
> @@ -177,8 +172,6 @@ struct SDState {
>       uint32_t data_offset;
>       size_t data_size;
>       uint8_t data[512];
> -    qemu_irq readonly_cb;
> -    qemu_irq inserted_cb;
>       QEMUTimer *ocr_power_timer;
>       bool enable;
>       uint8_t dat_lines;
> @@ -892,17 +885,10 @@ static void sd_cardchange(void *opaque, bool load, Error **errp)
>           trace_sdcard_ejected();
>       }
>   
> -    if (sd->me_no_qdev_me_kill_mammoth_with_rocks) {
> -        qemu_set_irq(sd->inserted_cb, inserted);
> -        if (inserted) {
> -            qemu_set_irq(sd->readonly_cb, readonly);
> -        }
> -    } else {
> -        sdbus = SD_BUS(qdev_get_parent_bus(dev));
> -        sdbus_set_inserted(sdbus, inserted);
> -        if (inserted) {
> -            sdbus_set_readonly(sdbus, readonly);
> -        }
> +    sdbus = SD_BUS(qdev_get_parent_bus(dev));
> +    sdbus_set_inserted(sdbus, inserted);
> +    if (inserted) {
> +        sdbus_set_readonly(sdbus, readonly);
>       }
>   }
>   
> @@ -1000,48 +986,6 @@ static const VMStateDescription sd_vmstate = {
>       },
>   };
>   
> -/* Legacy initialization function for use by non-qdevified callers */
> -SDState *sd_init(BlockBackend *blk, bool is_spi)
> -{
> -    Object *obj;
> -    DeviceState *dev;
> -    SDState *sd;
> -    Error *err = NULL;
> -
> -    obj = object_new(is_spi ? TYPE_SD_CARD_SPI : TYPE_SD_CARD);
> -    dev = DEVICE(obj);
> -    if (!qdev_prop_set_drive_err(dev, "drive", blk, &err)) {
> -        error_reportf_err(err, "sd_init failed: ");
> -        return NULL;
> -    }
> -
> -    /*
> -     * Realizing the device properly would put it into the QOM
> -     * composition tree even though it is not plugged into an
> -     * appropriate bus.  That's a no-no.  Hide the device from
> -     * QOM/qdev, and call its qdev realize callback directly.
> -     */
> -    object_ref(obj);
> -    object_unparent(obj);
> -    sd_realize(dev, &err);
> -    if (err) {
> -        error_reportf_err(err, "sd_init failed: ");
> -        return NULL;
> -    }
> -
> -    sd = SD_CARD(dev);
> -    sd->me_no_qdev_me_kill_mammoth_with_rocks = true;
> -    return sd;
> -}
> -
> -void sd_set_cb(SDState *sd, qemu_irq readonly, qemu_irq insert)
> -{
> -    sd->readonly_cb = readonly;
> -    sd->inserted_cb = insert;
> -    qemu_set_irq(readonly, sd->blk ? !blk_is_writable(sd->blk) : 0);
> -    qemu_set_irq(insert, sd->blk ? blk_is_inserted(sd->blk) : 0);
> -}
> -
>   static void sd_blk_read(SDState *sd, uint64_t addr, uint32_t len)
>   {
>       trace_sdcard_read_block(addr, len);
> @@ -2196,8 +2140,8 @@ static bool cmd_valid_while_locked(SDState *sd, unsigned cmd)
>       return cmd_class == 0 || cmd_class == 7;
>   }
>   
> -int sd_do_command(SDState *sd, SDRequest *req,
> -                  uint8_t *response) {
> +static int sd_do_command(SDState *sd, SDRequest *req,
> +                         uint8_t *response) {
>       int last_state;
>       sd_rsp_type_t rtype;
>       int rsplen;
> @@ -2349,7 +2293,7 @@ static bool sd_generic_read_byte(SDState *sd, uint8_t *value)
>       return false;
>   }
>   
> -void sd_write_byte(SDState *sd, uint8_t value)
> +static void sd_write_byte(SDState *sd, uint8_t value)
>   {
>       int i;
>   
> @@ -2478,7 +2422,7 @@ void sd_write_byte(SDState *sd, uint8_t value)
>       }
>   }
>   
> -uint8_t sd_read_byte(SDState *sd)
> +static uint8_t sd_read_byte(SDState *sd)
>   {
>       /* TODO: Append CRCs */
>       const uint8_t dummy_byte = 0x00;
> @@ -2561,11 +2505,6 @@ static bool sd_data_ready(SDState *sd)
>       return sd->state == sd_sendingdata_state;
>   }
>   
> -void sd_enable(SDState *sd, bool enable)
> -{
> -    sd->enable = enable;
> -}
> -
>   static const SDProto sd_proto_spi = {
>       .name = "SPI",
>       .cmd = {

