Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp833435ejf;
        Fri, 23 Feb 2024 13:51:03 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVopvzNcH8LxgNxMGuY94Lfo+R0ixaY7q3QAK4lNCiaBKbAXo20pnes2crKKzY028mTxnsrSbci0tlkHxRLRLuDu/PHRdyp
X-Google-Smtp-Source: AGHT+IEBaeAaiAQSUVhIRaC6Zxw2SySJO/dZu1BWFa9I+axFRYSzmSsiMG3Gv2/89sD7dCZpRyR/
X-Received: by 2002:a05:6871:7424:b0:21f:4bc:3b6d with SMTP id nw36-20020a056871742400b0021f04bc3b6dmr1128748oac.17.1708725063664;
        Fri, 23 Feb 2024 13:51:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708725063; cv=none;
        d=google.com; s=arc-20160816;
        b=J0SScNUsDMTSLMcYoqIMGMFbtTOVHpHVp/oD8mWSoeW4HyS6krgrp7LaVH8fNPlN5l
         6Z6j3xbzrISNCi/Zh3xKjIacDchPt4I2ijzoU5rAI6Eyg5IhyJQSp5N5HS/6S5MxESqQ
         JwPX59owFDuOxDq1QCztAPzys1+wBCCzewEFDR7dMtk4dx+w9HFoRN5h5zELQyT7hnRB
         UOOO/1dapNpfNhqD07JCXITdOVRHO/U1vbnt3sjTYo2I/becbX8J8EJ3jZOzEgOAa7Ox
         OMOWxmL2eD69ZhhQ1xT5jStm07QZIaUftlrS5i35w0CfIlyY37l9M5iePbdhsgBe8GtM
         gX9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=IxyXl7urU3w5LyYVdJZCEAYTMHbHOgk3syipo1ACVGg=;
        fh=FWgWlRGNHx+WzDhdzzut4YjL913g14mJdXzlEiAurqY=;
        b=C9P1/0Vufsec3EnGrJYIwBH/ZDZ5S5GEJy9xoBJ8sZTaOsKlXPQIrGt9nk5HOiM9Vm
         /qJLCfWWi7mi3+KCdXMEVrUb2SEA5gfJV8T/4tMwfddGEukZFKot+8FcdrdWhhSF4T59
         NOPgTeQ/koxTLH7u4TxRTiSOnvjOp5CSHJQb5FvWkOnt4OaU4GPUEzD9LaU1pGkXZNPG
         vG9R3gMWB7TK4fnEmEzPEPmniDspfh/aqkFCLrvOCqn2dsCfIA9wyCM4A5lEXCggm5No
         lwkaHF86gE/XnQ5K0WfJehm1mvzYsBRGLCKRCgT7X2IERvarHooGoY/MQ+qUMYCfBmeF
         SnvQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sF+zUQlu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ya12-20020a05620a5e4c00b00787b14c3816si2103540qkn.691.2024.02.23.13.51.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Feb 2024 13:51:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sF+zUQlu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rddRP-0004Ng-Fm; Fri, 23 Feb 2024 16:50:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rdd1C-0003KZ-23
 for qemu-arm@nongnu.org; Fri, 23 Feb 2024 16:23:42 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rdd19-0004i1-Ub
 for qemu-arm@nongnu.org; Fri, 23 Feb 2024 16:23:41 -0500
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-5c6bd3100fcso1007961a12.3
 for <qemu-arm@nongnu.org>; Fri, 23 Feb 2024 13:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708723417; x=1709328217; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IxyXl7urU3w5LyYVdJZCEAYTMHbHOgk3syipo1ACVGg=;
 b=sF+zUQlui+evHPyVM4RHnoSo2Uq1H/aP0vEDAmYeg+MFLTylKr1ZsTK3addF3M4SyO
 D60CcEFRC6qUtBqMdly+P3BPDI/CrPE08LXC0RdSeheLl4y4r04PM5Sr7nGNYpsk3IKd
 E0oU/899HAbA/UBwYB1wxNRPoYhBDtJeKODolEoci4kbBEyYTmg/QjrYCHp0mMUWZaaY
 +P6EhcyxxbL3gTEVN925RYJHH00mlOw79Iu22JduSapFzsuRa9RVUaDAOP2qt6wbGEE+
 VXpO5OwjEaZ1w1+3Aa5opHTSy+8m+yJ7Sjl16o4RM8R2TjNSoeynklEVApZF8ZJATfFE
 L/OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708723417; x=1709328217;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IxyXl7urU3w5LyYVdJZCEAYTMHbHOgk3syipo1ACVGg=;
 b=qupU0kX2MLmF+W4KAjyImiVLvotKnpDaKmOwRY035eGN0E4KC0m17bu/keQ4kfH7RU
 yf7qmlxFeDtaIWdC7jWToqAs0l+ynbhrDPraaB0H8qqf8NebXN08E2SJl9lN9GpU8je+
 2jzExiVGpSpMSjs3LmPsnOoOVcWSKR4Zf5zEX97THadNyUKbfocQcBE7qxXbTLdXGUcV
 v3+B5drHhpT7YzbSHE0uyrSqHREld+m/lVlj7mYYeGPq0pl5fCYPUDL89I0l6kkjBXPA
 XATfFmhz3HhVNZqie6/dlE+pRdnuTz2uSYqi2LaRfSfLGpv6cbr9ravsfF6ePSxw5UcE
 r1Og==
X-Forwarded-Encrypted: i=1;
 AJvYcCXw1ThhCgCXCrnonbObGE4zhuAjiyiC8u3y1Ue3P5u7w3D6hrjSkZma3MjJD6xeI/L2iAUHmeDPtfcAQI1Kac/X7Yrv
X-Gm-Message-State: AOJu0Yx6JZLR4AbfqcBL34jO1kSCKbXtjtodAMhTbuEXMLEW3W2GfW3G
 NWKnJMnFZJLD1CFaYv7/8JdEoN2+bSYSvhFYffgXbou2ck41s8YWZCrMPyys1a0=
X-Received: by 2002:a05:6a21:8796:b0:19a:4935:458 with SMTP id
 ph22-20020a056a21879600b0019a49350458mr1024514pzb.35.1708723417419; 
 Fri, 23 Feb 2024 13:23:37 -0800 (PST)
Received: from [172.20.1.19] (173-197-098-125.biz.spectrum.com.
 [173.197.98.125]) by smtp.gmail.com with ESMTPSA id
 d188-20020a6336c5000000b005dc89957e06sm12674114pga.71.2024.02.23.13.23.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Feb 2024 13:23:36 -0800 (PST)
Message-ID: <603344eb-d67c-4aa6-8e4b-09b9f570759b@linaro.org>
Date: Fri, 23 Feb 2024 11:23:33 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 18/21] hw/intc/arm_gicv3: Implement NMI interrupt
 prioirty
Content-Language: en-US
To: Jinjie Ruan <ruanjinjie@huawei.com>, peter.maydell@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20240223103221.1142518-1-ruanjinjie@huawei.com>
 <20240223103221.1142518-19-ruanjinjie@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240223103221.1142518-19-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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
X-TUID: 5SeVJzgNm5uC

On 2/23/24 00:32, Jinjie Ruan via wrote:
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
> v3:
> - Add missing brace
> ---
>   hw/intc/arm_gicv3.c | 63 ++++++++++++++++++++++++++++++++++++++++-----
>   1 file changed, 56 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/intc/arm_gicv3.c b/hw/intc/arm_gicv3.c
> index 0b8f79a122..75999edd19 100644
> --- a/hw/intc/arm_gicv3.c
> +++ b/hw/intc/arm_gicv3.c
> @@ -21,7 +21,7 @@
>   #include "hw/intc/arm_gicv3.h"
>   #include "gicv3_internal.h"
>   
> -static bool irqbetter(GICv3CPUState *cs, int irq, uint8_t prio)
> +static bool irqbetter(GICv3CPUState *cs, int irq, uint8_t prio, bool is_nmi)
>   {
>       /* Return true if this IRQ at this priority should take
>        * precedence over the current recorded highest priority
> @@ -33,11 +33,21 @@ static bool irqbetter(GICv3CPUState *cs, int irq, uint8_t prio)
>       if (prio < cs->hppi.prio) {
>           return true;
>       }
> +
> +    /*
> +     * Current highest prioirity pending interrupt is not a NMI
> +     * and the new IRQ is a NMI with same priority.
> +     */
> +    if (prio == cs->hppi.prio && !cs->hppi.superprio && is_nmi) {

It would be best to not mix terminology -- superpriority or nmi but not a mix.  It's 
unfortunate that the manual does so...

It is very tempting expand prio to more bits so that all of the rest of this Just Works.
Because of...

> +            if (superprio) {
> +                is_nmi = 1;
> +
> +                /* DS = 0 & Non-secure NMI */
> +                if ((!(cs->gic->gicd_ctlr & GICD_CTLR_DS)) &&
> +                    extract32(cs->gicr_igroupr0, i, 1)) {
> +                    prio = 0x80;
> +                } else {
> +                    prio = 0x0;
> +                }
> +            } else {
> +               is_nmi = 0;
> +               prio = cs->gicr_ipriorityr[i];

... the need to check GICD_CTLR_DS for interpreting superpriority within the continuum, 
per section 4.8.1 (NMI prioritization), it would seem that we could map

     Secure NMI         -> 0
     Non-secure NMI     -> 0x100
     prio 0x00 .. 0xff  -> prio * 2 + 1

which matches the ordering in Figure 4-6.

> @@ -240,10 +271,28 @@ static void gicv3_update_noirqset(GICv3State *s, int start, int len)
>                */
>               continue;
>           }
> -        prio = s->gicd_ipriority[i];
> -        if (irqbetter(cs, i, prio)) {
> +
> +        superprio = *gic_bmp_ptr32(s->superprio, i);
> +        /* NMI */
> +        if (superprio & (1 << (i & 0x1f))) {
> +            is_nmi = 1;
> +
> +            /* DS = 0 & Non-secure NMI */
> +            if ((!(s->gicd_ctlr & GICD_CTLR_DS)) &&
> +                gicv3_gicd_group_test(s, i)) {
> +                    prio = 0x80;
> +            } else {
> +                    prio = 0x0;
> +            }
> +        } else {
> +            is_nmi = 0;
> +            prio = s->gicd_ipriority[i];
> +        }

In any case, let's not have two copies of this resolution.


r~
