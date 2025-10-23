Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7378ECCD1BE
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Oct 2025 11:42:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vBtiL-0000hf-0X; Thu, 23 Oct 2025 07:42:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vBtiI-0000gk-8B
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 07:42:38 -0400
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vBtiF-0001WS-Pm
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 07:42:37 -0400
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-3c9ac55a907so468024fac.2
 for <qemu-arm@nongnu.org>; Thu, 23 Oct 2025 04:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761219754; x=1761824554; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=hzYvB1A0osd0xUYB/vF1LOzfOo+y3oks8gFbyc5/KHU=;
 b=IGL6VRaLcqfbKUJ6NMbOHOkRdcMzAz1nACcyCW+rEo36DW1Fj5j7Va8kgGJhD7emDK
 k/gWk7a0261o2J2anYFO7cb8ffSaFZxlsjHOxi34dCg2GR+Vhsvf99M8qdsnUFk1jmOw
 dRsCwRyBMpjfQKslaPlThc4cwALiFiSybbMI3RSO7qAhB5Zgb0DJqnnP/DCjq1gNJtWT
 n+1zLwPn80hNCDshHmsukaPjiwblynJUVm+/2c4hmOnTNuEUyWwdCGVVSnphgOJ5Lj7q
 NoAC9CQqBswfWrv9NGs1tB69YBGV/qjHPRItt8XuQErF3gdSvvl8Pgog3RA+1+S8JF9B
 NsaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761219754; x=1761824554;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hzYvB1A0osd0xUYB/vF1LOzfOo+y3oks8gFbyc5/KHU=;
 b=nu9Hr98Mz5Z9CZY4eGhuuyjwv/9k2G6QyVz4ZYEsV8E+MSqiukEiBA0y0i+fMK/bPf
 tEGvKrtgfstor3xzs3ji1LhNjj8VsQwrzHK91nU7SftBbRB2W/rzkj75scqbwys3sXWM
 U/iaUMuiJChFcDw1GBTuRC0c3zhuEsJCY9QjgitYmuAwuYn86slfMFWUeqotDxh5dvp8
 7FSozXE/EH9ujZpiG6mRhNz6xKr6VEASUIUGHo5W+vz6LM/eydwQppP0UUTH2wsyUes/
 rGZt0djyft8TTFo8fcPKykkYmvtqgpEi/liLW/MWEWbJ5od6VZMSGnx9Jf1Sj/E6wXNA
 oVwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJRg83Ewuq0x7geRPQ3inBx+Fbw9aGIRzimdKwjlbm3chhcIwmUJ7BzsyKaDef7IJHQ3VCzx/bzA==@nongnu.org
X-Gm-Message-State: AOJu0YzNID79i6KCrAzwy1fcZK+kO9u9AwQvVqnHHtuNZSbQZAwLLVQ9
 zGsFrg+Wq8w7eaOAET8IlhDqXZ48IwuQbaXPtwuvYuS9S/HdFMyfvnOcf0/yxAvILSc=
X-Gm-Gg: ASbGncvKMDOzwo8pth4NEtYb75zdd6pvfMxH5uY14CSxb3DZX4rj/hHu40WgUaC4G8d
 PF7OdMdV88i++9onPWo3/z7a3zOBAik1vxVuHL3DszrQoXgvhjV5oOWQyur90j02c13NRMB4I6b
 m0wkVe3KksC6QTz4gJcW1DvBLGQLiUWeMMt7kftnW5/7PhB8BXv8dZdly/BfdbfEauXC7oTgY2b
 yAIR013uA2Zg96l0n5JplY0A13izbI7Eoho3wavdU2FQ8jCOp9zO7swoV81lxrYi26GxLshIbWB
 jYAS4m/8gwG8257kAopU2oFWRsD15PsHjMU/scM16hqqqAGxAQWFLmx8AtZykpdWkImQVAYWLmR
 svjkvH+OvJQgDDAaxFH+PLTPNHjRri672gU1Jjm1ywJ1tRyYiGETPEOR4dW0JAldYokVdjy3MYZ
 a3mEvCXWzSXpxioSWJVv+rSwaKZzHpWZJkS1jNfTjwOCbtvD6vsltKKSOhfjC/keNGIrwuPVw=
X-Google-Smtp-Source: AGHT+IEDVnPYvwWPoDYHf8yPZW0aeMG+PohSX8wFSQQoFIs9VwnWldzngcIlbbca9J04hf6aYQMFmw==
X-Received: by 2002:a05:6871:1c8:b0:3c9:415b:a28a with SMTP id
 586e51a60fabf-3c98cf733cbmr9737756fac.11.1761219753734; 
 Thu, 23 Oct 2025 04:42:33 -0700 (PDT)
Received: from ?IPV6:2607:fb90:5ec0:c638:dc7f:7860:6bb4:85f1?
 ([2607:fb90:5ec0:c638:dc7f:7860:6bb4:85f1])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-3cdc4c081f6sm639567fac.10.2025.10.23.04.42.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Oct 2025 04:42:33 -0700 (PDT)
Message-ID: <94bccb3b-9d41-4ff1-acc8-fecfd70cfc34@linaro.org>
Date: Thu, 23 Oct 2025 06:42:31 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/arm: Add assert to arm_to_core_mmu_idx()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20251023101339.1983809-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20251023101339.1983809-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2e.google.com
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

On 10/23/25 05:13, Peter Maydell wrote:
> Before commit f76cee647c ("target/arm: Introduce mmu indexes for
> GCS") it was impossible for arm_to_core_mmu_idx() to return an
> invalid core MMU index, because NB_MMU_MODES was 16 and
> ARM_MMU_IDX_COREIDX_MASK was 0xf.
> 
> That commit raises ARM_MMU_IDX_COREIDX_MASK to 0x1f and NB_MMU_MODES
> to 22, so it's now possible for a bogus Arm mmu index to result in an
> out of range core mmu index (which can then get used as an array
> index in the CPUTLB struct arrays). Coverity complains that this
> might result in an out-of-bounds access.
> 
> The out-of-bounds access can't happen because we construct all the
> ARMMMUIdx values we will use for TLBs to have valid core MMU indexes
> in the COREIDX field.  But we can add an assert() so that if we ever
> do end up operating on a corrupted or wrong ARMMMUIdx value we get an
> assert rather than silently indexing off the end of an array. This
> should also make Coverity happier.
> 
> Coverity: CID 1641404
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/internals.h | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index f539bbe58e1..026548ec34f 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -968,7 +968,9 @@ bool arm_cpu_tlb_fill_align(CPUState *cs, CPUTLBEntryFull *out, vaddr addr,
>   
>   static inline int arm_to_core_mmu_idx(ARMMMUIdx mmu_idx)
>   {
> -    return mmu_idx & ARM_MMU_IDX_COREIDX_MASK;
> +    int coreidx = mmu_idx & ARM_MMU_IDX_COREIDX_MASK;
> +    assert(coreidx < NB_MMU_MODES);
> +    return coreidx;
>   }
>   
>   static inline ARMMMUIdx core_to_arm_mmu_idx(CPUARMState *env, int mmu_idx)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

