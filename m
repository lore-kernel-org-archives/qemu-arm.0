Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 152C1C87FC9
	for <qemu-arm@archiver.kernel.org>; Wed, 30 Jul 2025 21:22:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhEFE-0006Qy-78; Wed, 30 Jul 2025 17:21:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhEFA-0006Ki-Os
 for qemu-arm@nongnu.org; Wed, 30 Jul 2025 17:21:48 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhEF8-0001DO-Ta
 for qemu-arm@nongnu.org; Wed, 30 Jul 2025 17:21:48 -0400
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-76bc5e68d96so271456b3a.3
 for <qemu-arm@nongnu.org>; Wed, 30 Jul 2025 14:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753910497; x=1754515297; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qAf6c3sELXZVayV+XMs5OVx0GWP1bFiW1EOiA/qtqvE=;
 b=bGg2mRp2ImEKi2nbdl1JQlBTKRmPXl/aLWx5Q3HZkX5Zd/IInCY//M/VKZcCLnK8Om
 d2lQYvHpI/lXkoq7WxO6UfHnnZ8wCQ2DVKpf3eu3OsbwfEt7jbzl1Na2uX2Wd+n9bJ54
 ybRg8JmszYJv6lhhZ/ut4SCYkuxRyUroGFRkiJDmHl5pyf31IOqVhZKKkwWzd6/xREbj
 c0zQ/sWYJ5bl+YfYHmE5LkABeRprOOnBK9390sgLuoP4AU3pxT6XSt1hYVFgI4bZJRWZ
 HUAd9riubloqj5mxiArlp8dr4J5/YGDdmii7OnR0GF+szZn6eLSjTwNjNoMFyz9IEyRO
 rmKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753910497; x=1754515297;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qAf6c3sELXZVayV+XMs5OVx0GWP1bFiW1EOiA/qtqvE=;
 b=pfmadfOBpZMqlfMvSTkZzJ1WEeHQ5gW62kYoYX8Ye9UjAKnUsFQMM9xDU2AG+0mNWn
 pU4bHlwpJzYjBpT0eEco47uoWrmba/ceVZgTYZFlSQKOnjosFohlMi4oCfCScGdEUNNR
 PT7G1mS018MRHN8bs4bfAe+dNLHT8osvBH6gJ1OzLMckHQ2sCBlPXCy6hSOfymcS4wya
 waaOZ4WmMaK7L3XD6bVCz/C6aCvOPQVh8iF+49/aKYb2zq8H7G+Q7ZWZokT4kipKUfbF
 xVug79ZkDW16Yc2Mx8JCGmhdVjWIAe4BLzkkWnWfp2+JLx8uIpbqgHEZ9OMFh4vXYYPP
 Vnpw==
X-Gm-Message-State: AOJu0Ywt/8bxYXd1ghyNlKMNES2auvJWvJGf3FpZFS717Xb9rVFomDDj
 SivCzfhLjZ5cowpKKzGoUQEmaXF6BIsLrzKh+rem3aYCet7A+r0uNSM8RTTqSki6Uxw=
X-Gm-Gg: ASbGncupa8KiXS20qxQXCkI40I68IHCRVf0iIogpZe4tonhraWWL8O96h1q75h6P8PR
 wOz8TOtDMrbw+WuMq9CXnkIAr0Rq+Ou3aFv0zg7Kwkno10Q7HBPYKEMviO7nKr+ZCps1CRfweZs
 RtXjdwb5srh6R3plTrFUOPaaWH4mp8x633QhBSb7JhecWB01oCVJRmgxWepQJRjHqZZ71c+7h17
 WtqEuw6FR8motAph763sGuniLBifrcuUqFh6uFpbFYHDxAYJ0dUIrssz7tDXJcox6S5yu+hTwpo
 /y5DEVOOma2Iz3tbraOwS9j1TKpzCsbfXBh8OT1Ke1K+hRGhJLDEdko2uJ8bhU46y1SwkwhmoeG
 v+QTlInVHmmiiB7SnMHVAXzJ0dVPzdZWMJvQMUkPfP7c/9Q==
X-Google-Smtp-Source: AGHT+IFh6jy5I+ZSg86zl17m7t9jUn+ywtXC5jcwKstGivkQYqulbT5vndCjkrIq7YT4wtjKMsrUSQ==
X-Received: by 2002:a05:6a00:2e0e:b0:749:4fd7:3513 with SMTP id
 d2e1a72fcca58-76ab3096e9dmr5943620b3a.16.1753910497425; 
 Wed, 30 Jul 2025 14:21:37 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76a167c678esm4696583b3a.5.2025.07.30.14.21.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jul 2025 14:21:37 -0700 (PDT)
Message-ID: <0128c452-8bde-4bdd-b73c-330a7bd619a1@linaro.org>
Date: Wed, 30 Jul 2025 14:21:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 37/82] target/arm: Convert regime_is_user from switch to
 table
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20250727080254.83840-1-richard.henderson@linaro.org>
 <20250727080254.83840-38-richard.henderson@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250727080254.83840-38-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x431.google.com
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

On 7/27/25 1:02 AM, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/internals.h       | 17 -----------------
>   target/arm/mmuidx-internal.h | 12 ++++++++++++
>   target/arm/mmuidx.c          |  6 ++++--
>   3 files changed, 16 insertions(+), 19 deletions(-)
> 
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index ea210c7179..c6f3ae470b 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -1034,23 +1034,6 @@ static inline bool regime_is_stage2(ARMMMUIdx mmu_idx)
>       return mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S;
>   }
>   
> -static inline bool regime_is_user(ARMMMUIdx mmu_idx)
> -{
> -    switch (mmu_idx) {
> -    case ARMMMUIdx_E10_0:
> -    case ARMMMUIdx_E20_0:
> -    case ARMMMUIdx_E30_0:
> -    case ARMMMUIdx_Stage1_E0:
> -    case ARMMMUIdx_MUser:
> -    case ARMMMUIdx_MSUser:
> -    case ARMMMUIdx_MUserNegPri:
> -    case ARMMMUIdx_MSUserNegPri:
> -        return true;
> -    default:
> -        return false;
> -    }
> -}
> -
>   /* Return the SCTLR value which controls this address translation regime */
>   static inline uint64_t regime_sctlr(CPUARMState *env, ARMMMUIdx mmu_idx)
>   {
> diff --git a/target/arm/mmuidx-internal.h b/target/arm/mmuidx-internal.h
> index 5a7259a557..ef1f94a23f 100644
> --- a/target/arm/mmuidx-internal.h
> +++ b/target/arm/mmuidx-internal.h
> @@ -17,6 +17,7 @@ FIELD(MMUIDXINFO, REL, 3, 2)
>   FIELD(MMUIDXINFO, RELVALID, 5, 1)
>   FIELD(MMUIDXINFO, 2RANGES, 6, 1)
>   FIELD(MMUIDXINFO, PAN, 7, 1)
> +FIELD(MMUIDXINFO, USER, 8, 1)
>   
>   extern const uint32_t arm_mmuidx_table[ARM_MMU_IDX_M + 8];
>   
> @@ -62,4 +63,15 @@ static inline bool regime_is_pan(ARMMMUIdx idx)
>       return FIELD_EX32(arm_mmuidx_table[idx], MMUIDXINFO, PAN);
>   }
>   
> +/*
> + * Return true if the exception level associated with this mmu index is 0.
> + * Differs from arm_mmu_idx_to_el(idx) == 0 in that this allows querying
> + * Stage1 and Stage2 mmu indexes.
> + */
> +static inline bool regime_is_user(ARMMMUIdx idx)
> +{
> +    tcg_debug_assert((unsigned)idx < ARRAY_SIZE(arm_mmuidx_table));
> +    return FIELD_EX32(arm_mmuidx_table[idx], MMUIDXINFO, USER);
> +}
> +
>   #endif /* TARGET_ARM_MMUIDX_INTERNAL_H */
> diff --git a/target/arm/mmuidx.c b/target/arm/mmuidx.c
> index 98db02b8e5..1c1e062bfe 100644
> --- a/target/arm/mmuidx.c
> +++ b/target/arm/mmuidx.c
> @@ -7,10 +7,12 @@
>   #include "mmuidx-internal.h"
>   
>   
> -#define EL(X)  ((X << R_MMUIDXINFO_EL_SHIFT) | R_MMUIDXINFO_ELVALID_MASK)
> +#define EL(X)  ((X << R_MMUIDXINFO_EL_SHIFT) | R_MMUIDXINFO_ELVALID_MASK | \
> +                ((X == 0) << R_MMUIDXINFO_USER_SHIFT))
>   #define REL(X) ((X << R_MMUIDXINFO_REL_SHIFT) | R_MMUIDXINFO_RELVALID_MASK)
>   #define R2     R_MMUIDXINFO_2RANGES_MASK
>   #define PAN    R_MMUIDXINFO_PAN_MASK
> +#define USER   R_MMUIDXINFO_USER_MASK
>   
>   const uint32_t arm_mmuidx_table[ARM_MMU_IDX_M + 8] = {
>       /*
> @@ -33,7 +35,7 @@ const uint32_t arm_mmuidx_table[ARM_MMU_IDX_M + 8] = {
>       [ARMMMUIdx_Stage2_S]        = REL(2),
>       [ARMMMUIdx_Stage2]          = REL(2),
>   
> -    [ARMMMUIdx_Stage1_E0]       = REL(1) | R2,
> +    [ARMMMUIdx_Stage1_E0]       = REL(1) | R2 | USER,
>       [ARMMMUIdx_Stage1_E1]       = REL(1) | R2,
>       [ARMMMUIdx_Stage1_E1_PAN]   = REL(1) | R2 | PAN,
>   

Maybe I missed something, but what about other entries that were 
initially treated in the switch?
- ARMMMUIdx_E.0_0
- ARMMMUIdx_M*User

