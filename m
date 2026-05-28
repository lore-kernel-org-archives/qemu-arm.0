Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 663C3CD5BD5
	for <qemu-arm@archiver.kernel.org>; Thu, 28 May 2026 18:52:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wSfqN-0005jw-7b; Thu, 28 May 2026 14:52:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wSfq4-0005da-L1
 for qemu-arm@nongnu.org; Thu, 28 May 2026 14:52:16 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wSfq2-0004Jy-RY
 for qemu-arm@nongnu.org; Thu, 28 May 2026 14:52:16 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-2bd2051167eso65524805ad.1
 for <qemu-arm@nongnu.org>; Thu, 28 May 2026 11:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779994332; x=1780599132; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NYsYQPPzASPlduWBTHd7CgXIQYjUbRELd2rXX6l4MtU=;
 b=KqXxdchE2wELlrQ1nPIhUv4MAqBQ/ZILDw0A2sTmFJ5fGrOHpLwwJLRxKvSIaESRUY
 2pmsP3CQyxbH8PAO7SwGnqaFCQ4luAlhm0ERktf4PWcQzWUlgzPhggcpXq5cnPSw+vd6
 DwFcXFdS+AUGaTjjyjZDMMwhy5RoDeZ0Miqqun5O+ZACxmq6j0cDyZoqYjCDMUR+4ReX
 CD8nKdJgBxSgr0BNlAVSRIaJA8Fwy4L3QI2zIV82eB2sRk54AS/Njy6y/qiCMfL7rDmy
 4VlJRh0h7ox/q/trIkWYdTB5loizY/lXryvFL3z6QeoBnzf25Y5QWKxS60YPxyOhWJB5
 6/kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779994332; x=1780599132;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NYsYQPPzASPlduWBTHd7CgXIQYjUbRELd2rXX6l4MtU=;
 b=ixdzRDeZ1IAcUHD58d3UEnfqsoA598aRNx9tPoOYo9Ijrn60KvNZwBDaBggTt9e4Zy
 TcppWQp3yLAe0a6xdtoBnH4kylgonU+yOCGDQblDb9TCzn3adYuu35j1+Hb4WdJ5vf8q
 9J/Ra8kfrZ+nLJs7WFaTq24KcmxouZZr/YlVs6R7Yb8pwXixuwxTcR2iO4giupItEFkG
 ba7aTvAWh6CYlAWTm0u1f8lOQ70Eh3Z13Bt6yhhaCjvSlwmTyTHi1GkGKiiMB5txbSV6
 kj3fori/GFQaPQyj/88CfgoEvi4hQUH1JaPceuBeD1HkFRv+XvsQZoIpwMIMk2hSxF+1
 ylCw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9o2wJZdRdKTbVjKfFXYKSkf4WSLRYyI5aH9CTlJ8TiIE1EWJFj2cpLzUFxgP1kFIjZBsNP51j22g==@nongnu.org
X-Gm-Message-State: AOJu0YzIOkIiFv7owsVF1rfbnxS2PU1fm3X8VGTNyrAvA4MeXznkmU5t
 VUVbBjQZ/UtfKuvCys0scjZE/BRG1ifyWr8pCc2YAQO2SnAW9j24rwv7/8MC7/pzsNM=
X-Gm-Gg: Acq92OEgjttACIb/l5NXMwuUc1MhBkwemSw5lvp7N7ltXdTJ1uOsNhvpqHkPmcw8ouD
 bwm7arZpw31g/AeM4Kh/QK8+7BqOVmQHAlVhM31QBRv6xMgzHS8DHdmUg32ZqZdIO2w1cnP+ySr
 aJPnIBrskfqR3FLNX3u4tkJnrQsLHU3y8p/KoaZmDXaZ24RVFt9HkBZ8Zrq6k/3xpPhIldKB3Zv
 BCHnzzdC7VPzpw26kRQnZs7Vg8LtWJKBmulzw0Sn3YhBGzFFxjNgMd7bg4qvFZlqB/pQggEnXTT
 A07vcjoDYoShAX2WHeXZVWzOCTf002vuw7KaC4PPJWdUMBUmK3iZmbdrCTpIJ4iVMGcJkCtYo0T
 biAnatU4gfCfy49QiX6nUaWVnqSFvWWnSQ86Vjag3bum0NQVigITIaniIMEz5hQEDuwJk6CL/VW
 XnHP+iv2X7RcbJhLRMOsWdXt9mlIyyDhcQ/gvqn2Wzfh+uHrw=
X-Received: by 2002:a17:902:f544:b0:2bf:1748:aa8c with SMTP id
 d9443c01a7336-2bf1ebf512dmr377265ad.26.1779994331936; 
 Thu, 28 May 2026 11:52:11 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.142.33])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2bf1e821447sm251235ad.80.2026.05.28.11.52.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 May 2026 11:52:11 -0700 (PDT)
Message-ID: <c5e98ece-ecad-42cc-9b83-154453f535a5@linaro.org>
Date: Thu, 28 May 2026 11:52:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] target/arm/ptw.c: Add Granule Bypass Windows
To: Jim MacArthur <jim.macarthur@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20260528-jmac-gpc3b-v1-0-d34c46c5069f@linaro.org>
 <20260528-jmac-gpc3b-v1-3-d34c46c5069f@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260528-jmac-gpc3b-v1-3-d34c46c5069f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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

On 5/28/26 08:34, Jim MacArthur wrote:
> Signed-off-by: Jim MacArthur <jim.macarthur@linaro.org>
> ---
>   target/arm/ptw.c | 50 ++++++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 50 insertions(+)
> 
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index 0a5201763a..46568cc5cb 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -341,11 +341,21 @@ bool arm_granule_protection_check(ARMGranuleProtectionConfig config,
>           .space = ARMSS_Root,
>       };
>       const uint64_t gpccr = config.gpccr;
> +    const uint64_t gpcbw = config.gpcbw;
>       unsigned pps, pgs, l0gptsz, level = 0;
>       uint64_t tableaddr, pps_mask, align, entry, index;
>       MemTxResult result;
>       int gpi;
>   
> +    const uint64_t BW_ADDR_SHIFT = 30;
> +    const uint64_t BW_SIZE_SHIFT = 30;
> +    const uint64_t BW_STRIDE_SHIFT = 40;
> +
> +    uint64_t bw_start = FIELD_EX64(gpcbw, GPCBW, BWADDR) << BW_ADDR_SHIFT;
> +    uint64_t bw_size_field = FIELD_EX64(gpcbw, GPCBW, BWSIZE);
> +    uint64_t bw_stride_mask = -1L << (FIELD_EX64(gpcbw, GPCBW, BWSTRIDE) +
> +                                      BW_STRIDE_SHIFT + 1);

This appears to be the inverse of what you wanted, setting high bits instead of setting 
low bits.

Never "L", always LL or ULL; but here you certainly want MAKE_64BIT_MASK.

> +
>       /*
>        * We assume Granule Protection Check is enabled when
>        * calling this function (GPCCR.GPC == 1).
> @@ -383,6 +393,28 @@ bool arm_granule_protection_check(ARMGranuleProtectionConfig config,
>           goto fault_walk;
>       }
>   
> +    /* At this point, GPCCR_EL3 is valid */

Not true, because you added the new block before validating PGS...

> +
> +    /*
> +     * GPC Priority 1 (R_GMGRR):
> +     * If GPCCR_EL3.GPCBW is 1 and the configuration GPCBW
> +     * is invalid, the access fails as GPT walk fault at level 0.
> +     */
> +    if (FIELD_EX64(gpccr, GPCCR, GPCBW)) {
> +        /*
> +         * GPCBW is invalid if the base address is:
> +         * not aligned to the size programmed in BWSIZE, or
> +         * greater than or equal to the stride value configured by BWSTRIDE.
> +         */
> +        uint64_t bw_size_mask = -1L << (bw_size_field + 31);
> +        if (bw_start & bw_size_mask) {
> +            goto fault_walk;
> +        }
> +        if (bw_start & bw_stride_mask) {
> +            goto fault_walk;
> +        }
> +    }
> +
>       switch (FIELD_EX64(gpccr, GPCCR, PGS)) {

... here.

None of the checks you're adding are correct:
  - Missing size and stride validation,
  - Alignment check vs size is incorrect; you wanted

     bw_start & MAKE_64BIT_MASK(0, bw_size + BW_ADDR_SHIFT)

  - Check vs stride is incorrect; you wanted bw_stride <= bw_addr.

See GPCRegistersConsistent().

> @@ -431,6 +463,23 @@ bool arm_granule_protection_check(ARMGranuleProtectionConfig config,
>           goto fault_fail;
>       }
>   
> +    /*
> +     * Bypass window check.
> +     * I_JJLRM: Granule Protection Table (GPT) lookups can be skipped
> +     * in portions of the memory map by using GPC bypass windows.
> +     * I_XNHTX: The GPC bypass window check (...) is performed
> +     * immediately after priority 3.
> +     */
> +    if (FIELD_EX64(gpccr, GPCCR, GPCBW)) {
> +        uint64_t bw_size = 1 << (bw_size_field + BW_SIZE_SHIFT);
> +        uint64_t effective_address = paddress & bw_stride_mask;
> +
> +        if (effective_address >= bw_start &&
> +            effective_address < (bw_start + bw_size)) {

No need for extra ().


r~

