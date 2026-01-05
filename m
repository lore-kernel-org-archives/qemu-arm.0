Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6028BCD041F
	for <qemu-arm@archiver.kernel.org>; Mon,  5 Jan 2026 22:38:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vct8W-0002MV-SG; Mon, 05 Jan 2026 17:33:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vct8L-0002F7-EG
 for qemu-arm@nongnu.org; Mon, 05 Jan 2026 17:33:06 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vct8J-000470-OA
 for qemu-arm@nongnu.org; Mon, 05 Jan 2026 17:33:05 -0500
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-2a0ac29fca1so3997345ad.2
 for <qemu-arm@nongnu.org>; Mon, 05 Jan 2026 14:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1767652382; x=1768257182; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+Rn4zgYufMW7rIMHFO5uTe8EU5x+JDUJ8tv9sxcWIH8=;
 b=etZtkWwtUDVq9YkwsDYOfWyZ0ZydO9u5QlimPwXBh4y/424HdIve8ErAy1P9lN1srV
 wHNDQr8WXO18HgoFp597lIQ95ECUNIn/0X4hWPOc/37wxdQnfBG43Ar/4o6SJ52igeIA
 xdYeKvjvmOB0Uhz9n6Uho0Kn0EXDUXT7nWfM/jolXGIS/zHnqb3eZw7b4UQDfWbBtMoc
 NKJWnOK3hgA9kbbkgEY91poFMBJSRUdbgdHBhZpvUvptuJrVq9KM37AX0kI7zA7V38A2
 j+nBwa8RXqLv1BfZgmg3Y3cugwO5W8DeiVVxLWHvjrQ4sWb8fCTqZRJh02gxD6lwMjY2
 YHjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767652382; x=1768257182;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+Rn4zgYufMW7rIMHFO5uTe8EU5x+JDUJ8tv9sxcWIH8=;
 b=f6wlPwMCCDCKk01w3Q0fHVZHbAwcVUfm/l10wDG1HHns44XUPAHKx5uwfMFu0Fry+L
 gq5pdgqp7r3fkb+vUq25LG9IeQTtpAxZOlry72t+QZnqYTymXOUQTGW2w890o2zeN4VX
 nDztoXDcOSo6DFl3uBjPpcpWZzHmbEJ/HqJoAJbQ/QvrtobzqMUCvXucv6J8fGOsQElr
 OWehUqo7JN5NNRySQCZsrrFySy8Sl50dA8YdsmndqqHQO5oC/DAF4zMwhGx9v8SdYf9I
 dybCV9U0zBZh3nbi9ChB9c5gy/WPcSjfgD66ekdR9v9ZtoVfH7v+aFhOjCxlWW0rNLCp
 kG5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbQpMTiecDzIRch1ygxdxX2shoNKY1JHU5clNGD7sCPl9n20vQ6zAJ1KJMby3BHBHzbRHKoXVooQ==@nongnu.org
X-Gm-Message-State: AOJu0YyhwylkqUUtVhkQ9fMtFtuiAY1EMzepE7aEOH1qSEhjiOivLetu
 Bh0tokogBVAnxSyX5bO1lXE7EJ73m5SsDojglltRD5e3/QdkhluwYMzEGFhqku5AnC8=
X-Gm-Gg: AY/fxX4m6ymGl3oxGvP7ImUJeIDbdYwitvLaxIy7Wpp2G+9l9LjvdQwps1CVxzxgjqr
 5hY2dmsq5zkS9VketbsdpAxKSJ0jPTh+QpXkrM7qQmWMDKnc3vgyDKs9lwnMRBWZ2XX8ZMj3NI1
 F+BQOrlA7mCkxADp9T9LhKvChLaRkec0FJLOZPjC75WqVQLj40DkJk8ojM4c0Lcpo0MXQs3/VCl
 JiCC2J9TSyG0RxuIDEXXYfEt08q20RFQBj2e4BIBCuHdMhDb3iYrHCzyr9Wgi1y6lP9SMTJO/uJ
 p0Fn5LfyCXSQxjwJBLq4MfxeWD25RA+tQTvdXTrDbowKI8Svx3txlYzDw23+AftSPO0LpsNvS1T
 X13DM/9+v4BX+yPO3o5Cc/gE8b0Xy/FkwPAiEVwWOuzToSC4PXL6RR09peCdIOSzEObWY5YuBA1
 2cApMazH79C4n8LlJm19acJpBYp5tkKQ==
X-Google-Smtp-Source: AGHT+IHdqFjaOzlPDrbCcbqaIb2hcqvT1VIzaLvjMCs+EV7x/nXnnQMlvxq26yS4MUgVuLTI6voMqw==
X-Received: by 2002:a17:903:2f8f:b0:2a1:5f23:7ddf with SMTP id
 d9443c01a7336-2a3e2c92066mr10946115ad.6.1767652381528; 
 Mon, 05 Jan 2026 14:33:01 -0800 (PST)
Received: from [192.168.10.140] ([180.233.125.201])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a3e3c48d77sm2380185ad.41.2026.01.05.14.32.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jan 2026 14:33:01 -0800 (PST)
Message-ID: <76dfc640-b8db-4ed5-9232-41ede17da314@linaro.org>
Date: Tue, 6 Jan 2026 09:32:55 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 03/12] target/arm: mte_check unemitted on
 STORE_ONLY load
To: Gabriel Brookman <brookmangabriel@gmail.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Gustavo Romero <gustavo.romero@linaro.org>, qemu-arm@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>
References: <20260105-feat-mte4-v3-0-86a0d99ef2e4@gmail.com>
 <20260105-feat-mte4-v3-3-86a0d99ef2e4@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260105-feat-mte4-v3-3-86a0d99ef2e4@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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

On 1/6/26 05:14, Gabriel Brookman wrote:
> This feature disables generation of the mte check helper on loads when
> STORE_ONLY tag checking mode is enabled.
> 
> Signed-off-by: Gabriel Brookman <brookmangabriel@gmail.com>
> ---
>   target/arm/cpu.h               |  2 ++
>   target/arm/tcg/hflags.c        | 14 ++++++++++++++
>   target/arm/tcg/translate-a64.c |  8 ++++++--
>   target/arm/tcg/translate.h     |  2 ++
>   4 files changed, 24 insertions(+), 2 deletions(-)
> 
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 393bfc0dc9..4087484faf 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -2496,6 +2496,8 @@ FIELD(TBFLAG_A64, ZT0EXC_EL, 39, 2)
>   FIELD(TBFLAG_A64, GCS_EN, 41, 1)
>   FIELD(TBFLAG_A64, GCS_RVCEN, 42, 1)
>   FIELD(TBFLAG_A64, GCSSTR_EL, 43, 2)
> +FIELD(TBFLAG_A64, MTE_STORE_ONLY, 45, 1)
> +FIELD(TBFLAG_A64, MTE0_STORE_ONLY, 46, 1)

Skipping bit 44?

> diff --git a/target/arm/tcg/hflags.c b/target/arm/tcg/hflags.c
> index 5c9b9bec3b..c4696af5d8 100644
> --- a/target/arm/tcg/hflags.c
> +++ b/target/arm/tcg/hflags.c
> @@ -425,6 +425,16 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
>                        */
>                       DP_TBFLAG_A64(flags, MTE0_ACTIVE, 1);
>                   }
> +                /*
> +                 * Repeat for MTE_STORE_ONLY
> +                 */
> +                if (cpu_isar_feature(aa64_mte4, env_archcpu(env)) &&
> +                    ((el == 0 ? SCTLR_TCSO0 : SCTLR_TCSO) & sctlr)) {
> +                    DP_TBFLAG_A64(flags, MTE_STORE_ONLY, 1);
> +                    if (!EX_TBFLAG_A64(flags, UNPRIV)) {
> +                        DP_TBFLAG_A64(flags, MTE0_STORE_ONLY, 1);
> +                    }
> +                }
>               }
>           }
>           /* And again for unprivileged accesses, if required.  */
> @@ -434,6 +444,10 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
>               && (sctlr & SCTLR_TCF0)
>               && allocation_tag_access_enabled(env, 0, sctlr)) {
>               DP_TBFLAG_A64(flags, MTE0_ACTIVE, 1);
> +            if (cpu_isar_feature(aa64_mte4, env_archcpu(env)) &&
> +                (SCTLR_TCSO0 & sctlr)) {
> +                DP_TBFLAG_A64(flags, MTE0_STORE_ONLY, 1);
> +            }
>           }

These two hunks don't need to check cpu_isar_feature, because we already did that when 
filtering the valid SCTLR bits.


r~

