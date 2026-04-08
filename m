Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (unknown [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6547D10F996C
	for <qemu-arm@archiver.kernel.org>; Wed,  8 Apr 2026 18:37:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wAXlC-0000N1-Cm; Wed, 08 Apr 2026 14:36:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1wAXl9-0000HS-Vx
 for qemu-arm@nongnu.org; Wed, 08 Apr 2026 14:36:16 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1wAWze-0005Jp-6B
 for qemu-arm@nongnu.org; Wed, 08 Apr 2026 13:47:11 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-2b23f90f53aso1437535ad.0
 for <qemu-arm@nongnu.org>; Wed, 08 Apr 2026 10:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775670428; x=1776275228; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SSFMY9hAPP8p45i4eqFEFe+x2VCzulFKH4x+n62fdHE=;
 b=XMrtM/ohiVVDl2NajejvzGhYL2hqf4hVQevflTT4QyIVnScdJRnocRaP+eKCPkwyJg
 b5Wu36Ile2p0+Ohgifib6Isr3Mr9hsajMiawyYrOLQBhnZdZ8aJC5dk5oHUKE6ZfUchB
 j+z06FH2Bv0K2T2YjCjLnpFHx7Ve+0BASZX7ILGTB3AKuRIxjxFyRe4ufQSy7njnbMRx
 8X5vlGZZn8RYqgzCo8e2tqI5EUX0JniCvSsunfZ/Y/tjIc0zA4DL8aP8gj8JrMT7akXL
 L+cHf98TG20NbHlOd1gHd3M0z1tlo/FWW05B+AhnSYGGumTTAlEG2wHM619Xh39evpqR
 rv3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775670428; x=1776275228;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SSFMY9hAPP8p45i4eqFEFe+x2VCzulFKH4x+n62fdHE=;
 b=Ux+Qdzk1wvq03AKSbOWnjqVkALzlLZEbwAPD67UEZgJkx9RJWlKq9yZI4ajEi6wH+R
 LhFXi58cbLMbdWYQTgpIXuKAF+Xy7X0FmegwWBRgVOSpQ7O6Z9/tx7Nh0LyL2aIaq2nX
 llmoJN3JLQPfZeK7rt/p0bzcd/AQhTdp3VzWDcKkdPk6esIcs2H9Db74ZSJeEttO3UuM
 u26maTLUmXQjmCfH7H+1SrvoAmovdK83LIQcBQTWn6K7/aW3BLwl2cqfbzRDWOKMNbqH
 KmolCYsE4fjbWvLwaqp1kZr9VRSWjOQj7/TFlnSsm+HULZN3Fv0bYMbt1cslH8Q/3fOF
 O0dg==
X-Gm-Message-State: AOJu0Yw/Xd5JmpWgthyxnEfyz+CWMmvBSMJCiUQ6CxKCeh1D7td4RA2I
 v7WzCLJSzT7pMlAXQQjywXDsUxhmEJmWEKtWMhK8eZVLHJWV5dZhiK9uxXi9fmUHttRPvZmgC4v
 EHlOYRxU=
X-Gm-Gg: AeBDieubdlUj63jYR2DDs7TbdgRCQNvUJFyNEYSKHtm1hvsDe6XACkpLNXEtxHGBil6
 oadnZL+1v1iha4iMVkljPjdYdAufPBBl4wfa60WUGH+a+hLhqNER5ple8VJwVBXIJmHvnx3dLRe
 5yU1CbHMaZj9mEiprhiKEvCt1UGEAteB3K2QTBfLRQpktNHqBr2GauBFzgY5ZJgR0rEjXyXkErm
 GcIckksa2pCdcWfZCErBRk8Ujano7GV0pAeWdgWNkmDZRh4OKZHnuW8bZC1w7MBHXpoYd2LHc2I
 QQSH+M13WUvZUxy69YQLfbeyckatYUeEIFvkJxkRywtqKQ8F87+IMzZNfrSKtc+DZqhfVmULm++
 BJpEkgXtOBYg6Xd7Ja2jUgP262VhGt5shC3BkDueJ+coQIxsxLdviqNHLNhtENnGUxsVSimbjrm
 MDCIqicLNVP6aB1uM+KFlMYjhFgMuoAtcepbOcLaDOtzGRATG27+2U5ty2lak7IcT6GnlnnIEe0
 6FKM+F+
X-Received: by 2002:a17:903:3903:b0:2b0:643b:41c9 with SMTP id
 d9443c01a7336-2b28167325fmr249655905ad.9.1775670428386; 
 Wed, 08 Apr 2026 10:47:08 -0700 (PDT)
Received: from [192.168.1.169] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b2749794e8sm222775315ad.53.2026.04.08.10.47.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Apr 2026 10:47:07 -0700 (PDT)
Message-ID: <5ee4f54f-307c-4188-b52c-9b63c1dd72e6@linaro.org>
Date: Wed, 8 Apr 2026 10:47:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] target/arm: Remove bswap_code
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20260408013309.56122-1-richard.henderson@linaro.org>
 <20260408013309.56122-3-richard.henderson@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Autocrypt: addr=pierrick.bouvier@linaro.org; keydata=
 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
 ZtfdHNZotF092MIH0IQC3poExQpV/WBYFAI=
In-Reply-To: <20260408013309.56122-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x630.google.com
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

On 4/7/26 6:33 PM, Richard Henderson wrote:
> This function is no loner used.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/cpu.h | 16 ----------------
>   1 file changed, 16 deletions(-)
> 
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 657ff4ab20..917e9919e8 100644
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

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>

