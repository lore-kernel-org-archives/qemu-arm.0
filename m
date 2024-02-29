Received: by 2002:a17:906:489:b0:a44:3ba0:e9d1 with SMTP id f9csp729242eja;
        Thu, 29 Feb 2024 15:51:40 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVCUv2fdaN5x/eRbrLDakyWjh2+XB47ZtmdfbdPbCdcVU7FbN33XoNhMvR1yAI2cUNRyjxY3v+AL9psw1XTmJ342C5iCy0+
X-Google-Smtp-Source: AGHT+IG4bkfi7++4TTmFr+B0+zOz8yka+FCttZcGJo1+FkFRli7S1SHcJYRBQ05pUeWMs16ue6Mj
X-Received: by 2002:ac8:5fd0:0:b0:42e:c202:6e0c with SMTP id k16-20020ac85fd0000000b0042ec2026e0cmr1274qta.64.1709250700339;
        Thu, 29 Feb 2024 15:51:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709250700; cv=none;
        d=google.com; s=arc-20160816;
        b=Zr/cIjxCXrwnd3qgx7pnibfwHn1+WkesnpMK4kY4Coe1ETr43hyWS3biBXs/4Qniop
         O2ijpcWvbZlz1lZS3eptYWrnJ54G0ri1Doe6R1d5oKIPJmo7mFn0+/0tE48Rwbqc3j7w
         s71qSFZO6uxCFsra5sz0JsBUukFMOq+KPfrqjBRu+EKD8m6xiRX0Q9o9kaPcFMz6HTbg
         Rk5Qfy+Ul8VzB3Jkdro4bklytPVuKIh9zS7Afyhbj9sBK5VkLeSaTRkO6VPhKwMaF/+E
         lzBBMaujd+BgSyDkVlBUVbWxRSrwwutAZ02fwSP0L0kkkWdaqjXrAEn9gpdRTtA46bOz
         EhJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=zmVxuFUEGQdDvRSRdxaqxOgShxxkewFXHQMBt5bgE9s=;
        fh=13h68V6fqTBFE1eRI91Bj/eJJzxQxW4Q0q0OC1g90NI=;
        b=aNNOUdJsUU+zGau4So50f0ozxErbWlN6Hukvx0UX683CmmH6Uq/oQgdGPb3fQ+YeNL
         w4eiB5UUCNuXe24VAvNSpOXnQYpb2J8tkXjQeD4kAsTLR0L2+3JHg5wpHYliIevjvMEE
         pVN13MdhV2hWzyh1Xe2jB5UNLsVgPo6oBRx3dMFqf/9oUxh4/fiyjR3iesaiN02Q20Bw
         890TIMIR+cGhQ30IGbtEm8XdT+umqDmsAKZ1O5IqRPB3pIe6a9iU2I+nhTHKCshALGKn
         yom5jA7qq1dYey3sMsjdHPXqikC0a5SP75tzoUdOOvKmzGsTwYbASnLz7bjD1xPh0+og
         5X0Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BZnNrR1K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d26-20020ac8669a000000b0042ec4b2f237si981359qtp.669.2024.02.29.15.51.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Feb 2024 15:51:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BZnNrR1K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rfqB6-0001aX-EI; Thu, 29 Feb 2024 18:51:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rfqB4-0001Yb-Nu
 for qemu-arm@nongnu.org; Thu, 29 Feb 2024 18:51:02 -0500
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rfqB0-0007d6-CB
 for qemu-arm@nongnu.org; Thu, 29 Feb 2024 18:51:01 -0500
Received: by mail-pg1-x52d.google.com with SMTP id
 41be03b00d2f7-5dca1efad59so1220025a12.2
 for <qemu-arm@nongnu.org>; Thu, 29 Feb 2024 15:50:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709250656; x=1709855456; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zmVxuFUEGQdDvRSRdxaqxOgShxxkewFXHQMBt5bgE9s=;
 b=BZnNrR1K7I61E47zn4FJ6VbcdQSHMWmDDGWQMnvz1GXrzlHCR5Bl2d09uGGEqpFHQB
 dkpq6ySAobdtEv4BepoZU1jXQzx4IkcSReDVkFBPNYUHsXulnfzcfj4/u5Wc+KOp1JwK
 vyjDDYNNIpWA8dvs6gs/YDkhDH8nq4zzHU0HM9E0WOLASN9A5xyGqhXBzeWXXHzPcgS/
 wx1kIdoxVjN5YEBuvQYZitlFsm8crVurUutSX6Ielsp+rvnI0YwgvzLlZL/heE/HfJYj
 uT/2jNUxxnEN1a7l6snkTi8B7RKH9IrBqE0WPxk/JU9SA7slgAsbFadtCnfkdzGrEGb7
 t4cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709250656; x=1709855456;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zmVxuFUEGQdDvRSRdxaqxOgShxxkewFXHQMBt5bgE9s=;
 b=S7ZhHE2Q5g+9Xrsk7KSW9kRVkfzLu3iqKBaLOdmEvhbta89fDpfkho3pIUbV4VoPm2
 jmcApO0cdsUFYmHoLXzeCXkXcJsQPFC0nNgipWLF7xP25i7WbL7oycs+AzyWgK9o14/s
 C8o5ohPQEuqzQ5qTMkvAm+JPbwt36g0mTW+hKAJindr4s/yohGtHgEwcuNOpaz6geFuP
 Hah1ibfULeAPfvWdiLHfVkuS7NJ59+R0Q0vqKbi5vYqbDF2gd4mRxS1mK1Kuzba3tvbU
 /wpCjna5kG9KKcq1mOkPUh4ioUOPtDq8w3XJ8SHyY3lJ/buv9Z+Wki4dB250UMlT2sE6
 ZG4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUF1CAwIt1928HURg/N7zz0t57ZM5bBQIv8KREidYMe1h6w+9i1kFd/linBlRmfAyS3OSrGzGaBhDdVPBKRN/8bi6ce
X-Gm-Message-State: AOJu0YyYAXIgFJvoZUsMrn0iaCITj22kfaCbmZlOON5sknHnrjCnJRka
 W0Tdj8tzeR0MnAzeJEIWtn14JfSQtiiAbWq+mBEdLZfK/OaSRF7MsBTL8ofu0I8=
X-Received: by 2002:a05:6a21:3a86:b0:1a1:2a5b:a845 with SMTP id
 zv6-20020a056a213a8600b001a12a5ba845mr3286358pzb.41.1709250656452; 
 Thu, 29 Feb 2024 15:50:56 -0800 (PST)
Received: from [192.168.6.128] (098-147-055-211.res.spectrum.com.
 [98.147.55.211]) by smtp.gmail.com with ESMTPSA id
 b10-20020a170902d50a00b001db5241804csm2092730plg.20.2024.02.29.15.50.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Feb 2024 15:50:56 -0800 (PST)
Message-ID: <85d632e6-8eb9-4bb5-bef4-b6430d499e61@linaro.org>
Date: Thu, 29 Feb 2024 13:50:52 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v5 18/22] hw/intc/arm_gicv3: Implement NMI interrupt
 prioirty
Content-Language: en-US
To: Jinjie Ruan <ruanjinjie@huawei.com>, peter.maydell@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20240229131039.1868904-1-ruanjinjie@huawei.com>
 <20240229131039.1868904-19-ruanjinjie@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240229131039.1868904-19-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: HhwY3xLqvuaG

On 2/29/24 03:10, Jinjie Ruan via wrote:
> If GICD_CTLR_DS bit is zero and the NMI is non-secure, the NMI prioirty
> is higher than 0x80, otherwise it is higher than 0x0. And save NMI
> super prioirty information in hppi.superprio to deliver NMI exception.
> Since both GICR and GICD can deliver NMI, it is both necessary to check
> whether the pending irq is NMI in gicv3_redist_update_noirqset and
> gicv3_update_noirqset. And In irqbetter(), only a non-NMI with the same
> priority and a smaller interrupt number can be preempted but not NMI.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
> v4:
> - Replace is_nmi with has_superprio to not a mix NMI and superpriority.
> - Update the comment in irqbetter().
> - Extract gicv3_get_priority() to avoid code repeat.
> ---
> v3:
> - Add missing brace
> ---
>   hw/intc/arm_gicv3.c | 71 ++++++++++++++++++++++++++++++++++++++++-----
>   1 file changed, 63 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/intc/arm_gicv3.c b/hw/intc/arm_gicv3.c
> index 0b8f79a122..1d16a53b23 100644
> --- a/hw/intc/arm_gicv3.c
> +++ b/hw/intc/arm_gicv3.c
> @@ -21,7 +21,8 @@
>   #include "hw/intc/arm_gicv3.h"
>   #include "gicv3_internal.h"
>   
> -static bool irqbetter(GICv3CPUState *cs, int irq, uint8_t prio)
> +static bool irqbetter(GICv3CPUState *cs, int irq, uint8_t prio,
> +                      bool has_superprio)
>   {
>       /* Return true if this IRQ at this priority should take
>        * precedence over the current recorded highest priority
> @@ -33,11 +34,24 @@ static bool irqbetter(GICv3CPUState *cs, int irq, uint8_t prio)
>       if (prio < cs->hppi.prio) {
>           return true;
>       }
> +
> +    /*
> +     * Current highest prioirity pending interrupt is an IRQ without
> +     * superpriority, the new IRQ with superpriority has same priority
> +     * should signal to the CPU as it have the priority higher than
> +     * the labelled 0x80 or 0x00.
> +     */
> +    if (prio == cs->hppi.prio && !cs->hppi.superprio && has_superprio) {
> +        return true;
> +    }
> +
>       /* If multiple pending interrupts have the same priority then it is an
>        * IMPDEF choice which of them to signal to the CPU. We choose to
> -     * signal the one with the lowest interrupt number.
> +     * signal the one with the lowest interrupt number if they don't have
> +     * superpriority.
>        */
> -    if (prio == cs->hppi.prio && irq <= cs->hppi.irq) {
> +    if (prio == cs->hppi.prio && !cs->hppi.superprio &&
> +        !has_superprio && irq <= cs->hppi.irq) {
>           return true;
>       }
>       return false;
> @@ -129,6 +143,35 @@ static uint32_t gicr_int_pending(GICv3CPUState *cs)
>       return pend;
>   }
>   
> +static bool gicv3_get_priority(GICv3CPUState *cs, bool is_redist,
> +                               uint32_t superprio, uint8_t *prio, int irq)
> +{
> +    bool has_superprio = false;
> +
> +    if (superprio) {
> +        has_superprio = true;
> +
> +        /* DS = 0 & Non-secure NMI */
> +        if (!(cs->gic->gicd_ctlr & GICD_CTLR_DS) &&
> +            ((is_redist && extract32(cs->gicr_igroupr0, irq, 1)) ||
> +             (!is_redist && gicv3_gicd_group_test(cs->gic, irq)))) {
> +            *prio = 0x80;
> +        } else {
> +            *prio = 0x0;
> +        }
> +    } else {
> +        has_superprio = false;
> +
> +        if (is_redist) {
> +            *prio = cs->gicr_ipriorityr[irq];
> +        } else {
> +            *prio = cs->gic->gicd_ipriority[irq];
> +        }
> +    }
> +
> +    return has_superprio;
> +}

Did you not like the idea to map {priority, !superpriority} into a single value?

It would eliminate the change in irqbetter(), which is a bit more complex than it needs to be.

> @@ -152,10 +197,13 @@ static void gicv3_redist_update_noirqset(GICv3CPUState *cs)
>               if (!(pend & (1 << i))) {
>                   continue;
>               }
> -            prio = cs->gicr_ipriorityr[i];
> -            if (irqbetter(cs, i, prio)) {
> +            superprio = extract32(cs->gicr_isuperprio, i, 1);
> +            has_superprio = gicv3_get_priority(cs, true, superprio, &prio, i);

It would allow moving the read of gicr_isuperprio into gicv3_get_priority(), alongside the 
read of gicr_ipriorityr.

Is there a bug here not handling is_redist for GCIR_INMI*?

> @@ -168,7 +216,7 @@ static void gicv3_redist_update_noirqset(GICv3CPUState *cs)
>       if ((cs->gicr_ctlr & GICR_CTLR_ENABLE_LPIS) && cs->gic->lpi_enable &&
>           (cs->gic->gicd_ctlr & GICD_CTLR_EN_GRP1NS) &&
>           (cs->hpplpi.prio != 0xff)) {
> -        if (irqbetter(cs, cs->hpplpi.irq, cs->hpplpi.prio)) {
> +        if (irqbetter(cs, cs->hpplpi.irq, cs->hpplpi.prio, false)) {

Always passing false here is incorrect -- again missing the redistributor nmi bit?


r~
