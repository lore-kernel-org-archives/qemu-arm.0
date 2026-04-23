Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36C7FFAD3F2
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Apr 2026 03:17:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wFkZ9-0006bG-Kg; Wed, 22 Apr 2026 23:17:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wFkZ8-0006ak-3G
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 23:17:22 -0400
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wFkZ6-0001p2-Ax
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 23:17:21 -0400
Received: by mail-qt1-x82f.google.com with SMTP id
 d75a77b69052e-50d87c138e1so63715141cf.1
 for <qemu-arm@nongnu.org>; Wed, 22 Apr 2026 20:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776914239; x=1777519039; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=q1iSZbPp4Noft/fcyHpWLwm2XYIFxyNCDUFwG0r5dQE=;
 b=OIeEd9nY5VRhA8sia5QrPTK7bN8eTDK04fGWWDptgEH2dkDMECSheQUc2LQQAih3KX
 Nr6tQv6Aj2GFNw0pLHRU3yyLHLFzzUfguk30Uzf+2RJzNVmDaeURs4AI8PahxD8ykxAX
 ZktKS3dhoTPCd38nzCS66v5I53S4IRCUkS4naj/IQGcdmZcyZquPw97oqNiX5RF96HxH
 pIrYem2oayev05ApJ2ZDP8eLx6LqYHhxHeIFpdLLvbHKaiELWhodQIIoMnjhiKVtP5V9
 lzqxaC969B4uPIVtxERSyvCuyU9BA0MLxGWlplW2UnQ5inAnDFIp/1Ly8jfaiyO6+vqi
 hkSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776914239; x=1777519039;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q1iSZbPp4Noft/fcyHpWLwm2XYIFxyNCDUFwG0r5dQE=;
 b=lbriE+mqvzvm+T0nYY5+pRteCG+7bwrIO5mdB6dFArQ8NYZ3ddcC1PjJUsenmhnPiU
 pr8I+RaIOrWhNcoMUEenjRgDSKGSt3oelFPq5CoLYdfoD841uC8DpQ/nnp0gqg8Dw2Qc
 rtAW3QxFb6y1ftqjRYWJNJeVTfWgvAmzCwHAmrrIaZNT+cldf+Ksr2mOzVNICV0Wypqu
 oC/EyoBR0ZRPZSq5Q0T9gl+AnVSWY0Eujnb8tpZLXm1j9evtRto4csvIDey1xE1Rb6rx
 QgrgpdZ91j7PvGUo63euVvrLQC9+CYuSmRlZOKFlMzsi9pmRu1LOoeM/+jaMAN+XotF0
 lubQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8kD/ilH6EUomSKGOaNQRu00Ya7Al5RnsWwchIFlwUKFmdfmZSRakBIo7aca8gqPzVTNLx5J3dAHQ==@nongnu.org
X-Gm-Message-State: AOJu0YxwiuoxMli1lkSdYBe5wwR4oMMP7citN0g64NTSBCXtEI+6pBmo
 Fk0fAUIvjnkt8o5ZtQuZ9gojesCcG9k0UFlvp4hXJkor7l+JMI8ZId5qDZEoorAoKWY=
X-Gm-Gg: AeBDietwZViI0C2/OVa8qpeuJZeggm/8MBswVf1s05Mx0Y9cybZyiDEangMBo2fPFO+
 km7SOvciqYdvKnvANG0xXYgzcQ6CTaE8zE7tBVhv9j05qvn8euViVm6oAG3/fiP4WMxXrhVyR4k
 k4WRH5Kq27XZILD6K39EAthR3fFQbkaYAoroq43v/kyqTaeBwW+F2uVP9Lh//XD9H9tddg+kXBj
 hy7eCLq3QKU+uaJ0ScXN/heNTNetfU0W9ihQh8FCi2b1HD5ibt4ILMaAz+5V2n1N9xo3RVq4hJa
 6gyqt+jNLnYJyos7CGamxRLWsvFfDz2Pvjy8U9aHS7Vpxa0Fc8yTi0Pnr+vYClG5FILf0CSveIa
 i6J0gJFfiAL3iDZlDgE0SjyEXyvxf1cHtInfMkXVNP52Cz4TOOdm4QZRwxbf6PlR44nkVm6EPGz
 9CfIU8o1bNJXJPfEp4vOh6C8Z+Fwq6VPEBrbBjC0BPDuZ6zYiFlTP+CfLPZG/hm1MAetZckhLvz
 E59JzbhigpTDxY4PMg7vVknH+jq
X-Received: by 2002:a05:622a:1dcb:b0:50d:9b2e:7ee3 with SMTP id
 d75a77b69052e-50e36c18fe5mr382643711cf.38.1776914238669; 
 Wed, 22 Apr 2026 20:17:18 -0700 (PDT)
Received: from [10.72.56.227] ([172.59.184.224])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8b02ae797eesm144908676d6.34.2026.04.22.20.17.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Apr 2026 20:17:18 -0700 (PDT)
Message-ID: <aa013ba2-31ef-46d3-a97e-b272d43a8824@linaro.org>
Date: Thu, 23 Apr 2026 13:17:10 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/17] system/physmem: Use translate_for_debug() in
 cpu_memory_rw_debug()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20260417173105.1648172-1-peter.maydell@linaro.org>
 <20260417173105.1648172-18-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260417173105.1648172-18-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82f.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 4/18/26 03:31, Peter Maydell wrote:
> Currently cpu_memory_rw_debug() assumes page-granularity for translations,
> and it works in a loop where each iteration translates for the vaddr
> rounded down to a page boundary and then copies up to the end of the
> page boundary.
> 
> Rewrite it to use the new cpu_translate_for_debug(): we no longer want
> to round down the input address, and the boundary we copy up to is now
> determined by the lg_page_size it returns rather than being assumed
> to be page-sized.
> 
> This, together with the implementation of translate_for_debug for
> Arm targets, fixes the bug where semihosting would incorrectly
> fail to access parameter blocks that were in memory where the
> start of the 4K region they were in was inaccessible due to MPU
> region settings, even if the parameter block itself was readable.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3292
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   system/physmem.c | 38 ++++++++++++++++++++++++--------------
>   1 file changed, 24 insertions(+), 14 deletions(-)
> 
> diff --git a/system/physmem.c b/system/physmem.c
> index f2d9a4ff8f..45c3a926cf 100644
> --- a/system/physmem.c
> +++ b/system/physmem.c
> @@ -4036,28 +4036,38 @@ address_space_write_cached_slow(MemoryRegionCache *cache, hwaddr addr,
>   int cpu_memory_rw_debug(CPUState *cpu, vaddr addr,
>                           void *ptr, size_t len, bool is_write)
>   {
> -    hwaddr phys_addr;
> -    vaddr l, page;
>       uint8_t *buf = ptr;
>   
>       cpu_synchronize_state(cpu);
>       while (len > 0) {
>           int asidx;
> -        MemTxAttrs attrs;
> +        TranslateForDebugResult tres;
>           MemTxResult res;
> +        hwaddr blk_base, blk_size, l;
>   
> -        page = addr & TARGET_PAGE_MASK;
> -        phys_addr = cpu_get_phys_addr_attrs_debug(cpu, page, &attrs);
> -        asidx = cpu_asidx_from_attrs(cpu, attrs);
> -        /* if no physical page mapped, return an error */
> -        if (phys_addr == -1)
> +        if (!cpu_translate_for_debug(cpu, addr, &tres)) {
> +            /* Return error if no physical page mapped */
>               return -1;
> -        l = (page + TARGET_PAGE_SIZE) - addr;
> -        if (l > len)
> -            l = len;
> -        phys_addr += (addr & ~TARGET_PAGE_MASK);
> -        res = address_space_rw(cpu->cpu_ases[asidx].as, phys_addr, attrs, buf,
> -                               l, is_write);
> +        }
> +        asidx = cpu_asidx_from_attrs(cpu, tres.attrs);
> +        /*
> +         * Clamp the amount we read to not go beyond a page even if
> +         * the CPU returned a larger lg_page_size, in case this access
> +         * is to a memory-mapped IO region.
> +         */
> +        tres.lg_page_size = MIN(tres.lg_page_size, TARGET_PAGE_BITS);
> +        /*
> +         * Find the length in bytes from tres.physaddr to the end of the
> +         * block whose size is 1 << tres.lg_page_size; we will access
> +         * that much in one go.
> +         */
> +        blk_size = 1ULL << tres.lg_page_size;
> +        blk_base = ROUND_DOWN(tres.physaddr, blk_size);
> +        l = blk_base + blk_size - tres.physaddr;
> +        l = MIN(l, len);
> +
> +        res = address_space_rw(cpu->cpu_ases[asidx].as, tres.physaddr,
> +                               tres.attrs, buf, l, is_write);

Doesn't address_space_rw handle both MMIO and RAM?

Seems to me the only thing you should be worried about here are the virtual address 
translation boundary.  So there should be no need to clamp lg_page_size to TARGET_PAGE_BITS.


r~

