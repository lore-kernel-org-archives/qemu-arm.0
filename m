Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0716AFAD3F0
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Apr 2026 03:06:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wFkOD-0003or-WE; Wed, 22 Apr 2026 23:06:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wFkOB-0003o4-T9
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 23:06:04 -0400
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wFkOA-0005hK-6P
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 23:06:03 -0400
Received: by mail-qk1-x730.google.com with SMTP id
 af79cd13be357-8eea23d01f7so44752785a.0
 for <qemu-arm@nongnu.org>; Wed, 22 Apr 2026 20:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776913561; x=1777518361; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=KkzDB76SM335oBGZ8vED/OKx/xQFvkM/vpw9G5grgPc=;
 b=AgKYqbU2UBSRr5hcAtvGGkCx7MvgxteLRvWMp+jt5Oj1x5KmECF4r5htu35zr9tDcl
 fO8B9GMSpesIofyvp/tr3XoNne+KPUvvDqJYqWEBRpIRQU4GsgatK7IlvyLcW70ClNSO
 kZ5FXqhbdQ9663aE/kcvTNagPt1X32qpi7+HVUYRCvgvH2wMes0J4Aa7pSJGooZ7cc00
 2tlcgbExBKyvKQ5LDK8Dj+v5fbby/16ZKUrOLnJ54NIzJvgUhTZuq/VdT72mV5UB6oR6
 y88Gmr0tXKLaNi0/IkigL53k21G6G6LAhTOQzvETcXWGZWx/JQR9AhferrCVOQ4igIQF
 qBlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776913561; x=1777518361;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KkzDB76SM335oBGZ8vED/OKx/xQFvkM/vpw9G5grgPc=;
 b=EiIrBffq+qs0j2BA/6/FCwQ5gzEc2UTHpHq6xXMkrJUMPb5exCMPReUOoTMA53HxAT
 0gAodizuxtJs1yp6YZiAbCi14A7hMy52XGz2VHiWfAosFmy6rb8kfk3zpiZogW4LvIyh
 k9+QwvX/4va0FGqkai9uargAB2LQdJtLrfkjuKUvGDvrYs1vSrWEms0wXqcMFyvE54SQ
 GqL0XgPj7nBt0VBfoecjtgjGhS82rgEN344OsIE4QLLJpxBuYk5DczEdORMS5xIqjnOY
 MDGdt0yMBUmLB+3ciZ3NQTz6RB+D8oTl6btYEgEIVNQXWAz1XEsKC/R41UOF9v+0huuc
 Zeng==
X-Forwarded-Encrypted: i=1;
 AFNElJ88EHEOiepmgsVndxVyPPmX1/deQQ0KrThDmrUn4rqJeteB/e/+uwk2V3TG+DmoJCLPwfw8eb+Dfw==@nongnu.org
X-Gm-Message-State: AOJu0YxsnGvAT8H+7Hxmbjhe63GHndXkzOo8GMiCo/gCiLuKmiV1nIuy
 60S3nXJYuCaPUncAFEPm2muIXK3sMuWCDxN5wBN7DkuuLSBfKGb17Kv2rLt82I2xr3o=
X-Gm-Gg: AeBDies5/JZ1viv/Nyd5Bdi3jaiuBTRrmWNS53OIvoFZS3qx6Ky1cvNJNo+gxXMao9n
 SnvHbeguRmeSpmGLz+qDxtCrOVa0h6GscooLc3Xzqg/Wn/YJmBgpPIbABVdJeqtxpswKzS4vKHl
 02bzK9ZqL7xiasmWvQZgIdWKZX+kSWkdABPyHkUsoNiUvifS/O3gZZWcNG02IGWKEvCLWJAYJ8o
 kFAjBPtsUbO7Zi3tle+LoSIidPQW9p/P0uJMbe9+Am04caBu9TyNOBCGNTgtTQwuPOiUK8TFJXL
 9h8r3EOUlMHSYqLwaQPKe7uDu7c2ReQDElv2tOpbNbkmQIFTHYxBy4WsoolWguF/cCpJeisxrWX
 tf4a1+6YS4xrdGXdUqO5GoBSsCnC+XkLaJEB1n4wNdAu//Ho2byIYZVvkzNbq7v4kxOQVGy9604
 kvMTyB2OKo6ErW4eTkrpxe/OP9QSYxCvGqMbLAMHmoPVECf5RgJuap9mXF4fCZOhFkZzxbcKmaR
 HumdTdEB+FND7fUu7QHOho1TBFuUkavxL3z1MA=
X-Received: by 2002:a05:620a:4612:b0:8e0:f680:4b34 with SMTP id
 af79cd13be357-8e78f253bb2mr3385584285a.1.1776913560741; 
 Wed, 22 Apr 2026 20:06:00 -0700 (PDT)
Received: from [10.72.56.227] ([172.59.184.224])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8e7d92ce037sm1448408685a.32.2026.04.22.20.05.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Apr 2026 20:06:00 -0700 (PDT)
Message-ID: <09da5690-5b9a-4930-8fd5-cecf1e3b8eb2@linaro.org>
Date: Thu, 23 Apr 2026 13:05:51 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/17] hw/core: Implement new cpu_translate_for_debug()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20260417173105.1648172-1-peter.maydell@linaro.org>
 <20260417173105.1648172-15-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260417173105.1648172-15-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::730;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x730.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 4/18/26 03:31, Peter Maydell wrote:
> In cpu_memory_rw_debug() we need to do a virtual-to-physical address
> translation for debug access.  Currently we assume that the
> translation is valid for an entire guest page, but this may not be
> true if the target implements some protection regions that have
> sub-page granularity. (Currently the only such target is the Arm
> CPUs when using an MPU, as in R-profile and M-profile.)

RISC-V has sub-page granularity via Physical Memory Protection (target/riscv/pmp.c).

> +bool cpu_translate_for_debug(CPUState *cpu, vaddr addr,
> +                             TranslateForDebugResult *result)

Whee!  Thanks for the new API to address my comment vs patch 10.

> +{
> +    if (cpu->cc->sysemu_ops->translate_for_debug) {
> +        return cpu->cc->sysemu_ops->translate_for_debug(cpu, addr, result);
> +    } else {
> +        /* Fallbacks for CPUs which don't implement translate_for_debug */
> +        if (cpu->cc->sysemu_ops->get_phys_addr_attrs_debug) {
> +            result->physaddr =
> +                cpu->cc->sysemu_ops->get_phys_addr_attrs_debug(cpu, addr,
> +                                                               &result->attrs);
> +        } else {
> +            result->physaddr
> +                = cpu->cc->sysemu_ops->get_phys_addr_debug(cpu, addr);
> +            result->attrs = MEMTXATTRS_UNSPECIFIED;
> +        }

We should really make a point of getting rid of the fallbacks.

Would it be less churn to drop the get_phys_page_debug to get_phys_addr_debug rename, and 
OR in the page offset here?  That plugs the -1 ambiguity in the short term.

I realize that microblaze must be converted to the new hook, because of its tlb oddity.

With arm and microblaze converted, only x86 still has get_phys_page_attrs_debug, so that's 
an easy hook to eliminate.  We can be slower about converting the others if you prefer.


> +        if (result->physaddr == -1) {
> +            return false;
> +        }
> +        /* Indicate that this is a debug access. */
> +        result->attrs.debug = 1;

Does MEMTXATTRS_UNSPECIFIED.debug make sense?

> +        /*
> +         * Assume memory access permissions are valid for the whole page.
> +         * Targets where this isn't true should implement the
> +         * translate_for_debug method.
> +         */
> +        result->lg_page_size = TARGET_PAGE_SIZE;

TARGET_PAGE_BITS.


r~

