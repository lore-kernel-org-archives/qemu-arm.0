Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp931525ejo;
        Tue, 12 Dec 2023 06:18:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH+H3f7lxunhWS+v40CtzkhezSoBmYOMUsh7nPENmNgbPrVcOVXVtJuvld78Ptyg28QE+93
X-Received: by 2002:ac8:7d0f:0:b0:425:a99f:9222 with SMTP id g15-20020ac87d0f000000b00425a99f9222mr7664052qtb.93.1702390726362;
        Tue, 12 Dec 2023 06:18:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702390726; cv=none;
        d=google.com; s=arc-20160816;
        b=Tbk9ACZ4+kyYp+m+uwbQZEv8FgcXWcF2bXBLIuv/t/qrVaz9/FJiaUVDk9XGcHpHH3
         XJMeSH2g02Umlk7GXLMEx0lonOAszo+RuWRvs3eamKEYrz9jqkHsGH3HkRLOihGXdfTM
         DqiC7AFnwg8TGb5Nm/iupgUT3L3k7sAmDWnAXw8CV5vRz51XFrSMkcNCt0avxTsibb3P
         mHvReSfUad2KDmgbohQ5pfjRqrSIgm7z+CRnbbSeAHMnoW1HvZ0AfH30Hnq0H7L6up1r
         tCnse2gXVeOVoBv85vRcO1XlNLwGBV91OrtLHEikd5TA4MQ5r4X3WeAZrNMxriczk+io
         yJ5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=HuqolziES5/eEvHD2lL+PelglCHWSOQ0N5TngbPuMs8=;
        fh=adlCM8kkRBmwDr8OIfvoqmzq7wRIAL/u393sfSxR0uk=;
        b=achaacR+ARZ98YnBRg35vSPlWBmoq/jkDu5OW+sWrFFqy6YA5Z2lSO5HVyNH5dwRSt
         xoBHnMkpZQ/orRiTeqzG7XXms59HpW7u4xq/DtqxPXRVFfGTQU9NbGlwxLGpJY4GuLrL
         wKDRIO2l+CxblbeRpHZ/zVNxlbhSHCnslBqGAbwNTtfd9Ps3nq7L6aBI8Dwsj+z01NKb
         ySrQN5Ry3RpWG8k1aMHA5qpuxzPYqigUncea4JiMj1hb4skDoXANJsSqU2uBrZznj0iC
         sL21h7j+VmZ8YZ/L0CnG/MmzQHyJJT5VfP7xHIp7OMcIh+hKYpVJ1mO7l1AOGvjku+Xe
         Xa3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nfjNFtNa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fi3-20020a05622a58c300b004254215eeecsi11089745qtb.538.2023.12.12.06.18.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Dec 2023 06:18:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nfjNFtNa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rD3ae-0005g4-0r; Tue, 12 Dec 2023 09:18:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rD3ab-0005fK-UM
 for qemu-arm@nongnu.org; Tue, 12 Dec 2023 09:18:25 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rD3aa-0000x0-3k
 for qemu-arm@nongnu.org; Tue, 12 Dec 2023 09:18:25 -0500
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-54f4b31494fso8674747a12.1
 for <qemu-arm@nongnu.org>; Tue, 12 Dec 2023 06:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702390701; x=1702995501; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HuqolziES5/eEvHD2lL+PelglCHWSOQ0N5TngbPuMs8=;
 b=nfjNFtNaTDse9rJImF2E4ikInyf6MnLB9teSomHEGimX3dh0CCOB5D9SU4UHqcEyvc
 PXx/vsWw+idjHExdgt3Lxzcr0Px7xRAgEn+iLQmeASZ0C2JNw2MU/9PgvtzomqAVwxpO
 1ubg6bHwaxRYsQejXCQB0KjEJIMAbaxZByBFYD7C+oAwA7PqQtizWlq4h7SibvubugCf
 MvmEfoWqMO9FFcvFyjtU/GgMQ0f7bbiUnT8OR6NedmTLZWaznLgCB3hTB42J5oOntrNc
 +/pol090ZTWbGAb9AcwS1r2uT4ehWIiCM5RJ5nvkXDqRly8ZMMGtLBGm8ljbtCz078PZ
 s33A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702390701; x=1702995501;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HuqolziES5/eEvHD2lL+PelglCHWSOQ0N5TngbPuMs8=;
 b=QHqnSFws3lnj97iK5pcdsJiOdSznQF0vl0qAHzMP201fIqclbSLnRJeDImKRs6Rp/8
 OTib8Pb7tnpCv0i+fSkf4OyXdXLfHe5pyX7VqcNR3R1lxGNT0GD2g8QEKJkMnNH8yxnk
 CIQHnpw392QXyPMsuj4r8WJnF5V7Nqe+KbFTl3mcjjy5fArbgDbhoOrD1Wwyw0jKTnjr
 vGHJinStOEegMOYTBEtpNmasOwFeWjsW0/VTzgg0sUmrvm+itRsJT+zii0TTqKnzTJvj
 JXYJYNi/zreqjCMqzTAJhxk4CV9gneHuocrWRe0sxYqH/IsHhno9S7POv3GrYYegXCJp
 yK0A==
X-Gm-Message-State: AOJu0YwM0XIo8FkDhIDZB45KeHL3Ua4B2rZRdm3WVRTF7iLfu5Rfx8IN
 lu5b8gUoEQsZXxWxktQKxHsmS1krKV4d/rZA/cy0oA==
X-Received: by 2002:a05:6402:2286:b0:54f:8019:fc8a with SMTP id
 cw6-20020a056402228600b0054f8019fc8amr5846387edb.7.1702390701483; Tue, 12 Dec
 2023 06:18:21 -0800 (PST)
MIME-Version: 1.0
References: <20231112092232.131-1-n.ostrenkov@gmail.com>
In-Reply-To: <20231112092232.131-1-n.ostrenkov@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 Dec 2023 14:18:09 +0000
Message-ID: <CAFEAcA8A8sGjknad1QpeJ8qank-mWWw+gRvR4PVBHk2zAHrEnQ@mail.gmail.com>
Subject: Re: [PATCH] fsl-imx: Add simple RTC emulation for i.MX6 and i.MX7
 boards
To: Nikita Ostrenkov <n.ostrenkov@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Andrey Smirnov <andrew.smirnov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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
X-TUID: r8zoz5VX0ONr

On Sun, 12 Nov 2023 at 09:22, Nikita Ostrenkov <n.ostrenkov@gmail.com> wrote:

Hi; thanks for this patch, and sorry I haven't got round
to reviewing it earlier.

> Signed-off-by: Nikita Ostrenkov <n.ostrenkov@gmail.com>
> ---
>  hw/misc/imx7_snvs.c         | 59 ++++++++++++++++++++++++++++++++-----
>  hw/misc/trace-events        |  4 +--
>  include/hw/misc/imx7_snvs.h | 14 ++++++++-
>  3 files changed, 67 insertions(+), 10 deletions(-)
>
> diff --git a/hw/misc/imx7_snvs.c b/hw/misc/imx7_snvs.c
> index a245f96cd4..7ef3e4901a 100644
> --- a/hw/misc/imx7_snvs.c
> +++ b/hw/misc/imx7_snvs.c
> @@ -13,29 +13,74 @@
>   */
>
>  #include "qemu/osdep.h"
> +#include "qemu/timer.h"
>  #include "hw/misc/imx7_snvs.h"
>  #include "qemu/module.h"
> +#include "sysemu/sysemu.h"
>  #include "sysemu/runstate.h"
>  #include "trace.h"
>
> +#define RTC_FREQ    32768ULL
> +
> +static uint64_t imx7_snvs_get_count(IMX7SNVSState *s)
> +{
> +    int64_t now_ms = qemu_clock_get_ns(rtc_clock) / 1000000;
> +    return s->tick_offset + now_ms * RTC_FREQ / 1000;

This kind of clock-to-ticks calculation should generally
be done with muldiv64() to avoid possible overflows:

    int64_t ticks = muldiv64(qemu_clock_get_ns(rtc_clock), RTC_FREQ,
NANOSECONDS_PER_SECOND);
    return s->tick_offset + ticks;

> +}
> +
>  static uint64_t imx7_snvs_read(void *opaque, hwaddr offset, unsigned size)
>  {
> -    trace_imx7_snvs_read(offset, 0);
> +    IMX7SNVSState *s = opaque;
> +    uint64_t ret = 0;
> +
> +    switch (offset) {
> +    case SNVS_LPSRTCMR:
> +        ret = (imx7_snvs_get_count(s) >> 32) & 0x7fffU;
> +        break;
> +    case SNVS_LPSRTCLR:
> +        ret = imx7_snvs_get_count(s) & 0xffffffffU;
> +        break;
> +    case SNVS_LPCR:
> +        ret = s->lpcr;
> +        break;
> +    }
> +
> +    trace_imx7_snvs_read(offset, ret, size);
>
> -    return 0;
> +    return ret;
>  }
>
>  static void imx7_snvs_write(void *opaque, hwaddr offset,
>                              uint64_t v, unsigned size)
>  {
> -    const uint32_t value = v;
> -    const uint32_t mask  = SNVS_LPCR_TOP | SNVS_LPCR_DP_EN;
> +    trace_imx7_snvs_write(offset, v, size);
>
> -    trace_imx7_snvs_write(offset, value);
> +    IMX7SNVSState *s = opaque;
>
> -    if (offset == SNVS_LPCR && ((value & mask) == mask)) {
> -        qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
> +    uint64_t new_value = 0;
> +
> +    switch (offset) {
> +    case SNVS_LPSRTCMR:
> +        new_value = (imx7_snvs_get_count(s) & 0xffffffffU) | (v << 32);
> +        break;
> +    case SNVS_LPSRTCLR:
> +        new_value = (imx7_snvs_get_count(s) & 0x7fff00000000ULL) | v;
> +        break;
> +    case SNVS_LPCR: {
> +        s->lpcr = v;
> +
> +        const uint32_t value = v;
> +        const uint32_t mask  = SNVS_LPCR_TOP | SNVS_LPCR_DP_EN;
> +
> +        if ((value & mask) == mask)
> +            qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
> +
> +        break;
> +    }
>      }
> +
> +    if (offset == SNVS_LPSRTCMR || offset == SNVS_LPSRTCLR)
> +        s->tick_offset += new_value - imx7_snvs_get_count(s);

Our coding standard requires braces on all if() statements,
even single line ones.

I think for this update-the-count handling we should call
imx7_snvs_get_count() only once, and then use that value
both in constructing new_value and also here where we
calculate the tick_offset.

>  }

I think you need to initialise s->tick_offset in the
device init routine, similar to what the pl031 device does.

>  static const struct MemoryRegionOps imx7_snvs_ops = {
> diff --git a/hw/misc/trace-events b/hw/misc/trace-events
> index 05ff692441..85725506bf 100644
> --- a/hw/misc/trace-events
> +++ b/hw/misc/trace-events
> @@ -116,8 +116,8 @@ imx7_gpr_read(uint64_t offset) "addr 0x%08" PRIx64
>  imx7_gpr_write(uint64_t offset, uint64_t value) "addr 0x%08" PRIx64 "value 0x%08" PRIx64
>
>  # imx7_snvs.c
> -imx7_snvs_read(uint64_t offset, uint32_t value) "addr 0x%08" PRIx64 "value 0x%08" PRIx32
> -imx7_snvs_write(uint64_t offset, uint32_t value) "addr 0x%08" PRIx64 "value 0x%08" PRIx32
> +imx7_snvs_read(uint64_t offset, uint64_t value, unsigned size) "i.MX SNVS read: offset 0x%08" PRIx64 " value 0x%08" PRIx64 " size %u"
> +imx7_snvs_write(uint64_t offset, uint64_t value, unsigned size) "i.MX SNVS write: offset 0x%08" PRIx64 " value 0x%08" PRIx64 " size %u"
>
>  # mos6522.c
>  mos6522_set_counter(int index, unsigned int val) "T%d.counter=%d"
> diff --git a/include/hw/misc/imx7_snvs.h b/include/hw/misc/imx7_snvs.h
> index 14a1d6fe6b..406c1fe97f 100644
> --- a/include/hw/misc/imx7_snvs.h
> +++ b/include/hw/misc/imx7_snvs.h
> @@ -20,7 +20,9 @@
>  enum IMX7SNVSRegisters {
>      SNVS_LPCR = 0x38,
>      SNVS_LPCR_TOP   = BIT(6),
> -    SNVS_LPCR_DP_EN = BIT(5)
> +    SNVS_LPCR_DP_EN = BIT(5),
> +    SNVS_LPSRTCMR = 0x050, /* Secure Real Time Counter MSB Register */
> +    SNVS_LPSRTCLR = 0x054, /* Secure Real Time Counter LSB Register */
>  };
>
>  #define TYPE_IMX7_SNVS "imx7.snvs"
> @@ -31,6 +33,16 @@ struct IMX7SNVSState {
>      SysBusDevice parent_obj;
>
>      MemoryRegion mmio;
> +
> +    /*
> +     * Needed to preserve the tick_count across migration, even if the
> +     * absolute value of the rtc_clock is different on the source and
> +     * destination.
> +     */
> +    int64_t tick_offset_vmstate;

You don't need tick_offset_vmstate -- it is only in the p031
RTC device as a backwards-compatibility thing for older versions
of QEMU. Migrating tick_offset alone is sufficient in a new
device. (It seems to have been unfortunately copied-and-pasted
into the goldfish RTC device; we should probably fix that bug.)

> +    int64_t tick_offset;
> +
> +    uint64_t lpcr;

We've now added state to this device, which means that it needs
a VMState structure to handle migration, and it needs a reset
function.

>  };
>
>  #endif /* IMX7_SNVS_H */
> --

thanks
-- PMM
