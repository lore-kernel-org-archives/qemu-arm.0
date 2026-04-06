Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFD6EFB5175
	for <qemu-arm@archiver.kernel.org>; Mon,  6 Apr 2026 22:46:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w9shf-0001CR-4B; Mon, 06 Apr 2026 18:45:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1w9shS-00016A-Ts
 for qemu-arm@nongnu.org; Mon, 06 Apr 2026 18:45:43 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1w9shQ-0002xW-UE
 for qemu-arm@nongnu.org; Mon, 06 Apr 2026 18:45:42 -0400
Received: by mail-pg1-x52a.google.com with SMTP id
 41be03b00d2f7-c76cce85bd9so1530676a12.1
 for <qemu-arm@nongnu.org>; Mon, 06 Apr 2026 15:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775515539; x=1776120339; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=isU/9rkBR2Zvj85QTV3GjBWwJH0kcHd+ROtIMxoNOPE=;
 b=D7jNaDbUWwX692F1egVvJskrmi13WaH/DUaVVGk5/ZiqHUcUWZZvlZcWTDEb+85eJX
 EofWgd0YOoN+8rhqn8dlTODwEqHAl3KKWuEpjonHZUvelLkBS2w+wJ02ZjOfldpEGhVV
 AlxeWFpnPeMUxF+dG2b9c5m9ldGtNyW9EGHx7FlHIaeLQ+lLUJTcEyRgH3lDz6SxGFjK
 vE05t7j4pJJ3OB29TaoCimixCjanpEBYz9qh4rOp8t5+rdiDwgJMFYzOC0JW6F9RpuY4
 axDh3Ea6B7gqNvkSX69tqWpLlMfbZ0iAQNOyfTbOKTf5KFmYcZDq0SDdMG5Vt2+h5KUO
 64cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775515539; x=1776120339;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=isU/9rkBR2Zvj85QTV3GjBWwJH0kcHd+ROtIMxoNOPE=;
 b=bNFlhBW1g01QKcJl75PLybv8sTU1Wd/JmtHVuDayzS+EtTjO2aRf3sFtNASn2AVx1V
 qrcun3nkA+a5r15IhhM92XSE/qCIDFwOqFfF69Eh3Dmfoei/fB1EBGo3/BaOy6FwwPoY
 VszYYaPvplZzReeujuz0wqi/0mmuJX7UYd2evX+V6gfBqc4bibB9QfLzON6IiUUw0f7O
 +DXGx+h+iV3B3HKMDm0bKoN83uZEbl+dGCJGvDFjS/NSurfL/vGwf6v5AAjqXyxp+y7o
 UEKpz5xw++K2DnkYX1vwP1P0zOAypaaw8yC9xoWQSbpWNNa97n5CNHtE68uQVIJNZuAk
 RrOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXyYdx3LpXSzrWOD1zUblO5CF0ROLSnPNOPMxqhTXwfTkFh3yh0ntKnxv9aIhuufAZlzz3SwtD5Eg==@nongnu.org
X-Gm-Message-State: AOJu0YxdfnM2zGj3CY5Pq7TR9+Xi3xEd5i0nNGI4rLU6Kk1cN/9hdILn
 eSY+fmvfJGUNpPgw3vHaK8MIkqIXtegwKGPj/uTmTiuPq2ExAaJRmKJga4/aJI4dLmw=
X-Gm-Gg: AeBDievap4Jg7jd2nzsH2tW6674rKuTVQ9Aq5mWLJYw05Vu0dOkyVgr6giJiWM4doll
 J5sO2fc5WC5lr2VcJGcCJ61oNBq+8hP9/deGeUa+3UYBwIDol9W5pUP2h9Q9sa7zQhjxJUMnTv0
 OEN4Ml7SLgE2z5ZPlbfbRR+a7YkjV1zSuyoFzEp9PW51VTduJpUpWwA+J75euk4Z6yxwjTbW1qm
 tdWCI/LnY87ogZW6mgIYWzs55k7CYRD2aspRQGplN5CCnBB8mOB2ITdZFtTOwRFmv92EZmYZVfk
 IPjUwLGZ5JwWWW4tEVZJK+2nUe6rSWsDZH+ld8HswDUJxVkCDORF7lhDJqG1pY4twKjbZPeEuE3
 H7FZQ7Gq6U39G62ipMz4c56oZJsHvAID5+JCLrE1Cd5Vht1+3lxd44/uWiGkkF7WgcQmgDlYri4
 T6nRrXUAmjcTsqxbYKIvSeSNomx7LWHQEZqJvxjbfz6OKTbDoox3yDtCEUMaIaV1gx92g=
X-Received: by 2002:a05:6a21:3283:b0:398:8870:b531 with SMTP id
 adf61e73a8af0-39f2edfd270mr14195238637.14.1775515534365; 
 Mon, 06 Apr 2026 15:45:34 -0700 (PDT)
Received: from [192.168.1.105] (124-150-69-109.tpgi.com.au. [124.150.69.109])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c76c657e5f3sm12831232a12.23.2026.04.06.15.45.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Apr 2026 15:45:34 -0700 (PDT)
Message-ID: <fa336642-d1b7-42e9-955e-440baae09974@linaro.org>
Date: Tue, 7 Apr 2026 08:45:27 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 19/20] target/arm/tcg/translate.c: remove TARGET_AARCH64
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, jim.macarthur@linaro.org,
 Paolo Bonzini <pbonzini@redhat.com>, philmd@linaro.org, qemu-arm@nongnu.org
References: <20260406182609.193886-1-pierrick.bouvier@linaro.org>
 <20260406182609.193886-20-pierrick.bouvier@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260406182609.193886-20-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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

On 4/7/26 04:26, Pierrick Bouvier wrote:
> We extract aarch64_translate_code function, and stub it accordingly.
> 
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/internals.h         |  2 ++
>   target/arm/tcg/stubs32.c       |  7 +++++++
>   target/arm/tcg/translate-a64.c |  8 ++++++++
>   target/arm/tcg/translate.c     | 19 ++++++++-----------
>   4 files changed, 25 insertions(+), 11 deletions(-)
> 
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index 8ec27508473..2850edcb198 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -381,6 +381,8 @@ void arm_init_cpreg_list(ARMCPU *cpu);
>   
>   void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu);
>   void arm_translate_init(void);
> +void aarch64_translate_code(CPUState *cs, TranslationBlock *tb,
> +                            int *max_insns, vaddr pc, void *host_pc);
>   void arm_translate_code(CPUState *cs, TranslationBlock *tb,
>                           int *max_insns, vaddr pc, void *host_pc);
>   
> diff --git a/target/arm/tcg/stubs32.c b/target/arm/tcg/stubs32.c
> index c5a0bc61f47..3945dc49e5e 100644
> --- a/target/arm/tcg/stubs32.c
> +++ b/target/arm/tcg/stubs32.c
> @@ -3,6 +3,7 @@
>    */
>   
>   #include "qemu/osdep.h"
> +#include "target/arm/internals.h"
>   #include "target/arm/tcg/translate.h"
>   
>   
> @@ -15,3 +16,9 @@ void a64_translate_init(void)
>   {
>       /* Don't initialize for 32 bits. Call site will be fixed later. */
>   }
> +
> +void aarch64_translate_code(CPUState *cs, TranslationBlock *tb,
> +                            int *max_insns, vaddr pc, void *host_pc)
> +{
> +    g_assert_not_reached();
> +}
> diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
> index ebab9f36f08..db3990576c0 100644
> --- a/target/arm/tcg/translate-a64.c
> +++ b/target/arm/tcg/translate-a64.c
> @@ -10948,3 +10948,11 @@ const TranslatorOps aarch64_translator_ops = {
>       .translate_insn     = aarch64_tr_translate_insn,
>       .tb_stop            = aarch64_tr_tb_stop,
>   };
> +
> +void aarch64_translate_code(CPUState *cpu, TranslationBlock *tb,
> +                            int *max_insns, vaddr pc, void *host_pc)
> +{
> +     DisasContext dc = {};
> +     translator_loop(cpu, tb, max_insns, pc, host_pc,
> +                     &aarch64_translator_ops, &dc.base, TCG_TYPE_I64);
> +}
> diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
> index aea38507ef4..9a971325144 100644
> --- a/target/arm/tcg/translate.c
> +++ b/target/arm/tcg/translate.c
> @@ -6906,19 +6906,16 @@ static const TranslatorOps thumb_translator_ops = {
>   void arm_translate_code(CPUState *cpu, TranslationBlock *tb,
>                           int *max_insns, vaddr pc, void *host_pc)
>   {
> -    DisasContext dc = { };
> -    const TranslatorOps *ops = &arm_translator_ops;
>       CPUARMTBFlags tb_flags = arm_tbflags_from_tb(tb);
> -    TCGType addr_type = is_a64(cpu_env(cpu)) ? TCG_TYPE_I64 : TCG_TYPE_I32;
>   
> -    if (EX_TBFLAG_AM32(tb_flags, THUMB)) {
> -        ops = &thumb_translator_ops;
> -    }
> -#ifdef TARGET_AARCH64
>       if (EX_TBFLAG_ANY(tb_flags, AARCH64_STATE)) {
> -        ops = &aarch64_translator_ops;
> +        aarch64_translate_code(cpu, tb, max_insns, pc, host_pc);
> +    } else {
> +        DisasContext dc = { };
> +        translator_loop(cpu, tb, max_insns, pc, host_pc,
> +                (EX_TBFLAG_AM32(tb_flags, THUMB)
> +                 ? &thumb_translator_ops
> +                 : &arm_translator_ops),
> +                &dc.base, TCG_TYPE_I32);
>       }
> -#endif
> -
> -    translator_loop(cpu, tb, max_insns, pc, host_pc, ops, &dc.base, addr_type);
>   }

Oh, I see my confusion on the previous patch.
Yes, re-ordering this would be helpful.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

