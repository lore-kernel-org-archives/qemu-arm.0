Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5F4810AB82F
	for <qemu-arm@archiver.kernel.org>; Thu, 26 Mar 2026 23:39:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w5uIB-0003GA-Mi; Thu, 26 Mar 2026 19:39:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1w5uI9-0003Fp-Qy
 for qemu-arm@nongnu.org; Thu, 26 Mar 2026 19:39:09 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1w5uI7-0004yZ-MF
 for qemu-arm@nongnu.org; Thu, 26 Mar 2026 19:39:09 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-2ad4d639db3so7068345ad.0
 for <qemu-arm@nongnu.org>; Thu, 26 Mar 2026 16:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774568346; x=1775173146; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cqAIj7MY3aIwE9dhyUBvYWkuwmVMNM418KpOwMsLKdg=;
 b=dv5jENjSo4lbbe5SE7ThgFsbTjtU3obR8ntp30QEVLed39zqzm67yOWVVjDsDHs63c
 I3TFVAyJeuAtszhmbGzY5Sg/hY6cISa7dRJKysQdV2m8l1ac+IFESj4AO7+MWxOT3rtW
 pFE9arXWhZx3mI4nQ5dlaSvoLpta8kWeLezyOOMTrcLaIUHyqWdGkminJvk9Z6+BNN57
 tdhM084/22ji9hYJrqfTi/dqVI5KUgLYB+ljYlrowIGqoTdinFIfzWQAGd4CRZ+XRGpl
 G9WFDaM3Fhby2S7FAqRtmlTkEXfEFfiTrofmolbfjKNBRCIknmAbLaPiqvHQ6Kw1WB04
 N6JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774568346; x=1775173146;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cqAIj7MY3aIwE9dhyUBvYWkuwmVMNM418KpOwMsLKdg=;
 b=rbQoG6Qm35dLxqfUPoiBaJZs9VdZzULULiXN7UcayFAm9EMzrCPhtctpPKsR9gBGvu
 L8Of63+WXW4CtWJx6vykllHia5FMbFQp+4kJzaYuSAKqNn8S7L4GjV3qj7ACCUepZP9X
 hu43P7v9YgZAKxO48L+LL7Dris7wPglBvZwP/333+SLnasDc5iFnW4iM11Z3QzxGUbFg
 C8dLMVuzqKDkjr4tQfrvDMZpkI+BqMIbYL2klW91HLq7lB9N1Ck3YlSxY2tx5JUPb/en
 YnP06N/I7BiiJ7SH50jD3PXla/LLF0MJb7OPI08wXXEuEJXO9BJ9bCQldy+MmdR8LQUN
 HuTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTURv+rLqgHtIoM2lkHtiBwNvepC7ocNIqL0g3eM/UDbTBWKTvUEoMetEsRKVrPzLfbFN7mceDSA==@nongnu.org
X-Gm-Message-State: AOJu0YzcUOvK8pMBL+QwwX1rMAer96xC/JW3lAP93eMA6Skh1WF/89IL
 aIiFZLxlu+OmyvbY19i2UcaBiEPH1Ix2UslosXtd1GWQdIWjTa/wUAh2Jp9UoHUzSDg=
X-Gm-Gg: ATEYQzw6oif5clqZlJiWn7XKWWzItvS6n9r0N1e14A2TuI8pg2PQ8GHY2LCBINLxtbM
 AzbVqGL+fowC0od1xvrFL+tgxBYtlzPpZAxRPaA8LetWxHRM0uPKdIdos/OepsHuui3WfDPf2IM
 x4wOyad6d7ThnpSI7PaQNPfFmsgUBkUggCaIjepdCg3bK5qNXN4Le22azbTrVkKvbpzDKKFMyaN
 yl9LIuPVlC+7w8h8SSNWlK6Jx/iYkK6AXaS7vJB0ekENfQaGKjIB6Gz+D9l7XZUUaATWh8RLkES
 4/meBXDr1GZlvumuRc5yVR6vY+Z79WD+2qI3NnElIomU25Ms4GngQ4mawRd75xknJFQSztn7uIG
 CyCTMJr/VkVePQx0ofVVBKh6vezvzKZeCalYmRbGcnwGrYVfZulL+sApbfVu79Zeza88Vy3W3yd
 RhtMPyCaUsrP8yzFF66Ajz3wmFxU+R1SLs3OOfWxpm5g==
X-Received: by 2002:a17:902:ec8f:b0:2ae:47c9:68c4 with SMTP id
 d9443c01a7336-2b0cdd41e17mr3956295ad.50.1774568345811; 
 Thu, 26 Mar 2026 16:39:05 -0700 (PDT)
Received: from [172.16.11.156] ([103.100.225.140])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b0bc883c0asm43658355ad.45.2026.03.26.16.39.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Mar 2026 16:39:05 -0700 (PDT)
Message-ID: <9bbd940d-4c71-4c09-867e-59bfb3d32269@linaro.org>
Date: Fri, 27 Mar 2026 09:39:00 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/7] memattrs: Add new attribute 'encrypted'
To: Gustavo Romero <gustavo.romero@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: alex.bennee@linaro.org, peter.maydell@linaro.org
References: <20260319022335.22523-1-gustavo.romero@linaro.org>
 <20260319022335.22523-4-gustavo.romero@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260319022335.22523-4-gustavo.romero@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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

On 3/19/26 12:23, Gustavo Romero wrote:
> Add new attribute to the memory transaction attributes that is used
> on Arm to select the address space where the encrypted page resides.
> 
> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
> ---
>   include/exec/memattrs.h | 7 +++++++
>   target/arm/cpu.h        | 6 +++++-
>   2 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h
> index 52ee955249..efe9d9c7ba 100644
> --- a/include/exec/memattrs.h
> +++ b/include/exec/memattrs.h
> @@ -57,6 +57,13 @@ typedef struct MemTxAttrs {
>       /* PCI - IOMMU operations, see PCIAddressType */
>       unsigned int address_type:1;
>   
> +    /*
> +    * Memory is encrypted. This is used to acccess the substitute
> +    * encrypted page that has its own address space. This is required
> +    * by FEAT_MEC on ARM.
> +    */
> +    unsigned int encrypted:1;
> +
>       /*
>        * Bus masters which don't specify any attributes will get this
>        * (via the MEMTXATTRS_UNSPECIFIED constant), so that we can
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 87c1787c9b..ebf4e4e01c 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -2596,7 +2596,11 @@ enum {
>   /* Return the address space index to use for a memory access */
>   static inline int arm_asidx_from_attrs(CPUState *cs, MemTxAttrs attrs)
>   {
> -    return attrs.secure ? ARMASIdx_S : ARMASIdx_NS;
> +    if (attrs.encrypted) {
> +        return ARMASIdx_MEC_PAGE;
> +    } else {
> +        return attrs.secure ? ARMASIdx_S : ARMASIdx_NS;
> +    }

I wish there were another way besides modifying MemTXAttrs, but at present there is not. 
Longer term, it might be better to store the AddressSpace directly in CPUTLBEntryFull, 
allowing tlb_fill to set it directly, and then all of the asidx_from_attrs functions go 
away.  Anyway, that's future work.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

