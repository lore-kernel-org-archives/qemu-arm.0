Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D025910F9976
	for <qemu-arm@archiver.kernel.org>; Wed,  8 Apr 2026 19:30:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wAYU5-0000uM-Al; Wed, 08 Apr 2026 15:22:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1wAY4o-0006Z1-6O
 for qemu-arm@nongnu.org; Wed, 08 Apr 2026 14:56:34 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1wAEbr-0006yF-Ni
 for qemu-arm@nongnu.org; Tue, 07 Apr 2026 18:09:25 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-356337f058aso3134836a91.2
 for <qemu-arm@nongnu.org>; Tue, 07 Apr 2026 15:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775599762; x=1776204562; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=YQWBJzOtiMcLwbKX3D9efQ5AcwwGXu+VtHoAZUvJbhU=;
 b=e+sAl1tcQxvy33UoAY6CH5Ii0LeFwvRpQHZTWWLpH35N4c5CvZ5QrujmF0teRG4re9
 2ZULncZ0o4J9BnQg/u7Cf/lsu1Pac+JWFWLjQHmZ9qjFjg16zb7GXLCCWhKPmoYwz8uO
 7EK8gHh8x8Rjq+/wdYgDpyQqqMNv01obaJHfDmaAMX+nF2XkwXJRbs9vEECDPxAmE6jr
 nNbKs/KV0XPtuFnsnaMh0hl6UzO7EeDjUjk62JKBBbwI0jWC3lJ9oSWLsohoHgcaFHTU
 EfJXMp4Q+vZW4bTejWSbXxxdPhwLQLVfIVjLLbWca/Ylw1UoqLIQ4rbfFkvAtPXDTTi5
 Xp4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775599762; x=1776204562;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YQWBJzOtiMcLwbKX3D9efQ5AcwwGXu+VtHoAZUvJbhU=;
 b=HESJ6UKCq8LJZfjvax4Cla6uSIYZJRFhDcmFTJSNWeRASI7SRYoxjbZ73Z3xsdTtX8
 0K3DlMS+0/NtTEpuQXczVCwCRFQHAmbkn2DlYZhPdnGc8u81xVQnTEBT5BKjP1U0MWWo
 Ih0r0qWe0ShgN8Gx72nJRiHMuSA4VC4kYJfUu5vnVccRCx2tTbyUpk11pfxDl1xAvF3y
 jiESGGwQo3HJQxaBv6qh73y5NZ6HGDn8go2QblwXmsHGSz/6eKLj6KIb4YbrD9MEHR/u
 X1kmDJ1rKYCo8fYgjWiaU7a8iI9icq5TBkEWdhNUMoICEpGadFRfL9Cx7z6FXsEgwUXJ
 obag==
X-Gm-Message-State: AOJu0Yxrey8WTi44mB24UVYxZbvEGWb9zPrTPtalj2tF7IXwbr3d1K6/
 j2GFTppuzrkRRKMHfEURgruRuU3Pzz8LbsaN4jAd3dc9nF1AMqGLyScwqt4tiwVGT3s=
X-Gm-Gg: AeBDietQllZUn7Qx6ixwOx4DCJxMIo4KOgsCd5Xp7payx1OmKdhXfzq1K3HDr64IOLG
 L9bhaE4QLNwxD4zzEbCiaQER3aMnkOehM1rNeo1mBNiD9vOV0Qqj5PUmd3k+76dxr1Hl5FRah3m
 dkz6qYDpIQUzbquCOJT67kjcczikZfbRiUNsE3BV9sYwAn5KgX/VqsWSJTl8b5TSKAchg35/FEO
 N5jshAT8BCP4aI58VuSIouTsP4V+m/YUi+Z4TMNCRnCKVa/fO1DsNxg44RLo9b0TrxzVDPlVCTM
 GOFFp4VSWCEspUKT1YWq4DYqf0J7je1L1xNCjoslbHKBy2ge0N6k3LYzDaR0KGk5kdBvQnbMU9y
 /4Rm1B70Aab/hd2Qb8OcLYLjIjK9KfC3wduFY58yuITW0FGywUQ3fdzrEhZURJfTikm9h5DUca7
 eymsEtW2f+Z/V7H1HWxHm4ly+ovzG7gacEq2xTVSvBBP2Shu7hvupOwiQNuiOGeLNSX4FOEQ==
X-Received: by 2002:a17:903:4b2d:b0:2b2:4e5c:69a9 with SMTP id
 d9443c01a7336-2b281715f1amr197380935ad.5.1775599761563; 
 Tue, 07 Apr 2026 15:09:21 -0700 (PDT)
Received: from [192.168.1.169] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b2adc8c4ecsm34661925ad.5.2026.04.07.15.09.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Apr 2026 15:09:21 -0700 (PDT)
Message-ID: <e1017baf-f006-4837-b516-48a5bb5fb3cb@linaro.org>
Date: Tue, 7 Apr 2026 15:09:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 19.5/21] linux-user/arm: Inline bswap_code()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
References: <20260407195922.196410-1-pierrick.bouvier@linaro.org>
 <20260407212333.59260-1-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Content-Language: en-US
Autocrypt: addr=pierrick.bouvier@linaro.org; keydata=
 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
 ZtfdHNZotF092MIH0IQC3poExQpV/WBYFAI=
In-Reply-To: <20260407212333.59260-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x1030.google.com
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

On 4/7/26 2:23 PM, Philippe Mathieu-Daudé wrote:
> bswap_code() is now used once in get_user_code_u32(),
> inline it and simplify removing dead system code.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/arm/cpu.h          | 16 ----------------
>   linux-user/arm/cpu_loop.c | 10 ++++++++++
>   2 files changed, 10 insertions(+), 16 deletions(-)
> 
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 657ff4ab20b..917e9919e8c 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -2568,22 +2568,6 @@ static inline int sme_vq(CPUARMState *env)
>       return EX_TBFLAG_A64(env->hflags, SVL) + 1;
>   }
>   
> -static inline bool bswap_code(bool sctlr_b)
> -{
> -#ifdef CONFIG_USER_ONLY
> -    /* BE8 (SCTLR.B = 0, TARGET_BIG_ENDIAN = 1) is mixed endian.
> -     * The invalid combination SCTLR.B=1/CPSR.E=1/TARGET_BIG_ENDIAN=0
> -     * would also end up as a mixed-endian mode with BE code, LE data.
> -     */
> -    return TARGET_BIG_ENDIAN ^ sctlr_b;
> -#else
> -    /* All code access in ARM is little endian, and there are no loaders
> -     * doing swaps that need to be reversed
> -     */
> -    return 0;
> -#endif
> -}
> -
>   enum {
>       QEMU_PSCI_CONDUIT_DISABLED = 0,
>       QEMU_PSCI_CONDUIT_SMC = 1,
> diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
> index 19874f4c727..24a66b52cee 100644
> --- a/linux-user/arm/cpu_loop.c
> +++ b/linux-user/arm/cpu_loop.c
> @@ -29,6 +29,16 @@
>   #include "user/page-protection.h"
>   #include "target/arm/syndrome.h"
>   
> +static inline bool bswap_code(bool sctlr_b)
> +{
> +    /*
> +     * BE8 (SCTLR.B = 0, TARGET_BIG_ENDIAN = 1) is mixed endian.
> +     * The invalid combination SCTLR.B=1/CPSR.E=1/TARGET_BIG_ENDIAN=0
> +     * would also end up as a mixed-endian mode with BE code, LE data.
> +     */
> +    return TARGET_BIG_ENDIAN ^ sctlr_b;
> +}
> +
>   #define get_user_code_u32(x, gaddr, env)                \
>       ({ abi_long __r = get_user_u32((x), (gaddr));       \
>           if (!__r && bswap_code(arm_sctlr_b(env))) {     \

I don't think so, Richard wants to remove bswap_code completely and 
get_user_code_u32 is last usage of it. I'm waiting for his patch to 
integrate it in series.

