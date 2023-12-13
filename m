Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp1717680ejo;
        Wed, 13 Dec 2023 07:54:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG4wVmU6RHPsKmhmkHCdcanwT/MENwapB6jfMQkqVF4KCvA5mz39M5GCe0tYWvYCVgoOTdX
X-Received: by 2002:a05:6830:1bea:b0:6d9:d77e:50c with SMTP id k10-20020a0568301bea00b006d9d77e050cmr8899363otb.32.1702482868635;
        Wed, 13 Dec 2023 07:54:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702482868; cv=none;
        d=google.com; s=arc-20160816;
        b=G4MhQdIi0ujDoWRMg0MGzR/d37D8FjR3jFk9DFI8k7yo4tmxhd9Rxl0Rk2kaDkHXIF
         /+H96MnC5zIsV5sAUzvnM2/dLykJXMEW05O/UhV1W9Jx1/MkBMt1CZymkSiC4cG9F9rO
         vD+6nsenPOg0SxAqsBd71eql2zWniVTd6XYBrP50TKVBY8qEPE4fhwAvi8bACmGs9LH/
         h5vZlZc79epje6eJEF+fwpUS9IB4YmBVkpM8Xxe6x1MWPU+3zOSekcYsj1iW2Ow6C6SH
         K6y4lL75BBoq+UoWfcb7yYLM6iizyLn5EX5Smgxrsm2eAk+p0G2bD+mUEwaIFiCa975d
         o45A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=fVhUaD4LV3xz+Yg868h+s/S8v5llLdsxsR+12GXRwIo=;
        fh=jsO9BbxCgNC+l7C+p+T98jSNnonsWAG7BfZ6fSMwF7E=;
        b=fyABHAqnA3V1XrSKJoj02VV8RMmwcyBpIntxMOz8SrWEYh3qISM3HG0H+8j1Z5+HUv
         EouWiFJ4pLDbJOJW0T5o7MOMfvnFdx2EtEzu3eSIsz08MW/x9SzuXs+GF2tC5CV5bgHC
         G1CUY7EK1QWTP58+awlsqg0BUrhLdHrcZd5YnypKFmiy+hPiJMnFWpV0i0/pgmOpEpEz
         9PLwStfyzAgZj69SaBNr737edAKBm++SOdDDl7oTZCB6DhaV7C4mTEjn6bp5ZNRDmzBg
         aK/CWEXFAm9zipcyNc2ZrUGHnoGEnzGQu9FL5l0fyekvmW1KjRBw4j5ouBhdk9CqUuym
         2hgw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wgPGBx8b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l5-20020a05620a28c500b0077d8a0d4053si13133956qkp.631.2023.12.13.07.54.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Dec 2023 07:54:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wgPGBx8b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rDRYf-00031X-2V; Wed, 13 Dec 2023 10:54:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rDRYd-000313-RP
 for qemu-arm@nongnu.org; Wed, 13 Dec 2023 10:53:59 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rDRYb-0004SU-H8
 for qemu-arm@nongnu.org; Wed, 13 Dec 2023 10:53:59 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40c46d6784eso32570445e9.3
 for <qemu-arm@nongnu.org>; Wed, 13 Dec 2023 07:53:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702482835; x=1703087635; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fVhUaD4LV3xz+Yg868h+s/S8v5llLdsxsR+12GXRwIo=;
 b=wgPGBx8b4gC/3g2j+t5HwoJV2bKNsHYUE9CJN3z72Z6DXrjXcmOBCSjOQj77V1LhtT
 CYFm7bJ3g95kMa1MbJCsHOho2tF0CDK0BPWyQj7BR7qYAxdEIu+wPnuZqZZosfXd9tpF
 btCkbRlJayDZaaqrTvovo1OrPGinZ/2b0+eWIXIQ0miXmrMMmnZbCZodymFVMdtM6gOG
 jLyc9EWn5yIBvDJh30zkE9b/CP+s6KPTMxRSZHSG17dVLGnKWuTeFABFNI9n/Jd5lRXz
 viQ8Rn4CbOYMTR5PAVgxpeqy5uiFhT+Noo7UqSa1ds8a4zfc+Pt2+Enm1VL43GEAo0lX
 hrlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702482835; x=1703087635;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fVhUaD4LV3xz+Yg868h+s/S8v5llLdsxsR+12GXRwIo=;
 b=ZCvbHTrngxVdes5a6vDZ7FZ9W/jaBMIKhYe5koTpSDUp+fsD2Q7Q91TCsdYzo/rwT8
 7PZeWGh/7T0zhv/IwrHTMzMzZmulaSFQFGiQfyIGQtKTAzIBWFAx/e2sHOSh/hhs7qeG
 3C5Q1FSADyDMTbOS21sg/cjwHO1jEVRrXvio4dZOy5kvi3jJWxB+DGzD0/RLnSOuskXT
 u4wqUii+Em7fWiEUBTfN37/Sc4haDo3w01vesU9Q5HIrBynb/Iswqzl08EaIHOm7tQIA
 oJulbcP29N7+h2gBwxbic/zOauP5K4GbmzTh3uLcnTY/B+e7cui//lot/dpayBu2BXmT
 lmxA==
X-Gm-Message-State: AOJu0YyxuKjEJhDVLdOqP+O4ME7aQObHsw6fLcRTpv8Z3+D2Nn1vndzs
 sOZs07s+GDQgiIhQZhtGYnuNyA==
X-Received: by 2002:a05:600c:1c1c:b0:40c:32d5:18e1 with SMTP id
 j28-20020a05600c1c1c00b0040c32d518e1mr3863088wms.179.1702482835118; 
 Wed, 13 Dec 2023 07:53:55 -0800 (PST)
Received: from [192.168.71.175] (254.red-88-29-161.dynamicip.rima-tde.net.
 [88.29.161.254]) by smtp.gmail.com with ESMTPSA id
 g12-20020adfa48c000000b003335eded7f5sm13746968wrb.68.2023.12.13.07.53.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Dec 2023 07:53:54 -0800 (PST)
Message-ID: <2d71f6a9-70c7-42b4-91dd-e5b7fc627fb7@linaro.org>
Date: Wed, 13 Dec 2023 16:53:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] fsl-imx: add simple RTC emulation for i.MX6 and i.MX7
 boards
Content-Language: en-US
To: Nikita Ostrenkov <n.ostrenkov@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Andrey Smirnov <andrew.smirnov@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20231213152408.2533-1-n.ostrenkov@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231213152408.2533-1-n.ostrenkov@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: Rh87ZGR2kigT

Hi Nikita,

On 13/12/23 16:24, Nikita Ostrenkov wrote:
> Signed-off-by: Nikita Ostrenkov <n.ostrenkov@gmail.com>
> ---
>   hw/misc/imx7_snvs.c         | 70 +++++++++++++++++++++++++++++++++----
>   hw/misc/trace-events        |  4 +--
>   include/hw/misc/imx7_snvs.h |  7 +++-
>   3 files changed, 71 insertions(+), 10 deletions(-)
> 
> diff --git a/hw/misc/imx7_snvs.c b/hw/misc/imx7_snvs.c
> index a245f96cd4..98fe51aa66 100644
> --- a/hw/misc/imx7_snvs.c
> +++ b/hw/misc/imx7_snvs.c
> @@ -13,28 +13,79 @@
>    */
>   
>   #include "qemu/osdep.h"
> +#include "qemu/timer.h"
>   #include "hw/misc/imx7_snvs.h"
>   #include "qemu/module.h"
> +#include "sysemu/sysemu.h"
>   #include "sysemu/runstate.h"
>   #include "trace.h"
>   
> +#define RTC_FREQ    32768ULL
> +
> +static uint64_t imx7_snvs_get_count(IMX7SNVSState *s)
> +{
> +    int64_t ticks = muldiv64(qemu_clock_get_ns(rtc_clock), RTC_FREQ,
> +                             NANOSECONDS_PER_SECOND);
> +    return s->tick_offset + ticks;
> +}
> +
>   static uint64_t imx7_snvs_read(void *opaque, hwaddr offset, unsigned size)
>   {
> -    trace_imx7_snvs_read(offset, 0);
> +    IMX7SNVSState *s = opaque;
> +    uint64_t ret = 0;
>   
> -    return 0;
> +    switch (offset) {
> +    case SNVS_LPSRTCMR:
> +        ret = (imx7_snvs_get_count(s) >> 32) & 0x7fffU;

Please have a look at extract64() which might make your code
easier to read. It is declared in include/qemu/bitops.h.

> +        break;
> +    case SNVS_LPSRTCLR:
> +        ret = imx7_snvs_get_count(s) & 0xffffffffU;

Ditto.

> +        break;
> +    case SNVS_LPCR:
> +        ret = s->lpcr;
> +        break;
> +    }
> +
> +    trace_imx7_snvs_read(offset, ret, size);
> +
> +    return ret;
>   }
>   
>   static void imx7_snvs_write(void *opaque, hwaddr offset,
>                               uint64_t v, unsigned size)
>   {
> -    const uint32_t value = v;
> -    const uint32_t mask  = SNVS_LPCR_TOP | SNVS_LPCR_DP_EN;
> +    trace_imx7_snvs_write(offset, v, size);
> +
> +    IMX7SNVSState *s = opaque;
>   
> -    trace_imx7_snvs_write(offset, value);
> +    uint64_t new_value = 0, snvs_count = 0;
>   
> -    if (offset == SNVS_LPCR && ((value & mask) == mask)) {
> -        qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
> +    if (offset == SNVS_LPSRTCMR || offset == SNVS_LPSRTCLR) {
> +        snvs_count = imx7_snvs_get_count(s);
> +    }
> +
> +    switch (offset) {
> +    case SNVS_LPSRTCMR:
> +        new_value = (snvs_count & 0xffffffffU) | (v << 32);

Here the equivalent is deposit64().

> +        break;
> +    case SNVS_LPSRTCLR:
> +        new_value = (snvs_count & 0x7fff00000000ULL) | v;

Ditto.

> +        break;
> +    case SNVS_LPCR: {
> +        s->lpcr = v;
> +
> +        const uint32_t value = v;

'value' is not really needed.

> +        const uint32_t mask  = SNVS_LPCR_TOP | SNVS_LPCR_DP_EN;
> +
> +        if ((value & mask) == mask) {
> +            qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
> +        }
> +        break;
> +    }
> +    }
> +
> +    if (offset == SNVS_LPSRTCMR || offset == SNVS_LPSRTCLR) {
> +        s->tick_offset += new_value - snvs_count;
>       }
>   }
>   
> @@ -59,11 +110,16 @@ static void imx7_snvs_init(Object *obj)
>   {
>       SysBusDevice *sd = SYS_BUS_DEVICE(obj);
>       IMX7SNVSState *s = IMX7_SNVS(obj);
> +    struct tm tm;
>   
>       memory_region_init_io(&s->mmio, obj, &imx7_snvs_ops, s,
>                             TYPE_IMX7_SNVS, 0x1000);
>   
>       sysbus_init_mmio(sd, &s->mmio);
> +
> +    qemu_get_timedate(&tm, 0);
> +    s->tick_offset = mktimegm(&tm) -
> +        qemu_clock_get_ns(rtc_clock) / NANOSECONDS_PER_SECOND;

So 'tick_offset' should be saved for migration. But I wonder
about replay, do we need this to be a property so user can set
and offset to emulate a RTC in host past/future? Maybe out of
scope, but still please add VMSTATE_INT64(tick_offset).

>   }
>   
>   static void imx7_snvs_class_init(ObjectClass *klass, void *data)
> diff --git a/hw/misc/trace-events b/hw/misc/trace-events
> index 05ff692441..85725506bf 100644
> --- a/hw/misc/trace-events
> +++ b/hw/misc/trace-events
> @@ -116,8 +116,8 @@ imx7_gpr_read(uint64_t offset) "addr 0x%08" PRIx64
>   imx7_gpr_write(uint64_t offset, uint64_t value) "addr 0x%08" PRIx64 "value 0x%08" PRIx64
>   
>   # imx7_snvs.c
> -imx7_snvs_read(uint64_t offset, uint32_t value) "addr 0x%08" PRIx64 "value 0x%08" PRIx32
> -imx7_snvs_write(uint64_t offset, uint32_t value) "addr 0x%08" PRIx64 "value 0x%08" PRIx32
> +imx7_snvs_read(uint64_t offset, uint64_t value, unsigned size) "i.MX SNVS read: offset 0x%08" PRIx64 " value 0x%08" PRIx64 " size %u"
> +imx7_snvs_write(uint64_t offset, uint64_t value, unsigned size) "i.MX SNVS write: offset 0x%08" PRIx64 " value 0x%08" PRIx64 " size %u"
>   
>   # mos6522.c
>   mos6522_set_counter(int index, unsigned int val) "T%d.counter=%d"
> diff --git a/include/hw/misc/imx7_snvs.h b/include/hw/misc/imx7_snvs.h
> index 14a1d6fe6b..26c497b8ed 100644
> --- a/include/hw/misc/imx7_snvs.h
> +++ b/include/hw/misc/imx7_snvs.h
> @@ -20,7 +20,9 @@
>   enum IMX7SNVSRegisters {
>       SNVS_LPCR = 0x38,
>       SNVS_LPCR_TOP   = BIT(6),
> -    SNVS_LPCR_DP_EN = BIT(5)
> +    SNVS_LPCR_DP_EN = BIT(5),

(FWIW SNVS_LPCR_TOP/SNVS_LPCR_DP_EN aren't IMX7SNVSRegisters enum.)

> +    SNVS_LPSRTCMR = 0x050, /* Secure Real Time Counter MSB Register */
> +    SNVS_LPSRTCLR = 0x054, /* Secure Real Time Counter LSB Register */
>   };
>   
>   #define TYPE_IMX7_SNVS "imx7.snvs"
> @@ -31,6 +33,9 @@ struct IMX7SNVSState {
>       SysBusDevice parent_obj;
>   
>       MemoryRegion mmio;
> +
> +    int64_t tick_offset;
> +    uint64_t lpcr;

Why do we need 'lpcr' in the instance state? It doesn't seem used.

>   };
>   
>   #endif /* IMX7_SNVS_H */

Modulo few comments, the patch LGTM!

Regards,

Phil.
