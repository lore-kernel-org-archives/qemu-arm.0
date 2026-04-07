Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E776FF5137
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Apr 2026 19:23:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wAC1M-0000Tm-Ov; Tue, 07 Apr 2026 15:23:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wAC1L-0000Pn-Bz
 for qemu-arm@nongnu.org; Tue, 07 Apr 2026 15:23:31 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wAC1J-0004oI-EN
 for qemu-arm@nongnu.org; Tue, 07 Apr 2026 15:23:31 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-48334ee0aeaso50728055e9.1
 for <qemu-arm@nongnu.org>; Tue, 07 Apr 2026 12:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775589808; x=1776194608; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=z8V/dZF/x/MHT0Y8jVahQ0cStfp/lZYqnawVks7OPBE=;
 b=mCF/s2y69Xai7O4Iu+HZYtSNBOfkfg4oIBlEU2tUCP1RF2zGEnZmN4hn6gSMW577Jo
 6odVO//1NYdCVmzhr6JQ7nzrh+HWvJF3sqnz9q9VTh2jie7mwUQZQ6HbD+A/VepEJsRL
 TBSCG0jVHTkzaQkIRhpr2O/sLznU/TLfOQFHjKCvjFdOI+qgROFiYKEx1COBqxJ0/JP0
 KGG/E1OwHS4vYLmKGigIG33PAqZ0rrwdP2xhaOhRmIyT+mVhFm2Z4eU8nWUlFZ6KXkaC
 4f1nzb3xNPGB8XTYt4vgeMqyk4nfTiEYKlKDfUWovlQtc2PHdqXbDoj5Ck4coGMrg6cR
 heXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775589808; x=1776194608;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=z8V/dZF/x/MHT0Y8jVahQ0cStfp/lZYqnawVks7OPBE=;
 b=kyypu+9cnHEutViasXf2mTd7vq5WdmLJpMd1TaGp1An1HQbIjRk8KLGVhLlGonrv1Y
 AnIydJ5GXIfBpbK+WbzbQAUcS7LX3+BHNH/MbDkhulSYACMM8EyMTdeCyFciUcOK0lnb
 6saBJaeyY2dGDD3DgpBnQWlWIF4fXsi1T2kgiomDJbNAoiBTgM9qeEej1AstS0I00iC6
 9pj1iCOxsXNbiuR9xbZ/Rhq1LW9TE2iAgVw95SDHFdLsngKjz8+iVW4aNN9tY0PyUId0
 ykZnEc/uzybBOoWQJmLvx9oEq3WzWTUMC3UoiW7cMOY7tpT30a3VIuC+0hbAaSCUIXz6
 nzHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRwAX077CMNRPKmAgWqDiyYuXLPCIaBMKCEaObklnSaLkEtwOS+r6Yr+26nlP9F+22As/RZ5m0zw==@nongnu.org
X-Gm-Message-State: AOJu0YxvjHzjzLACTabQhktLMarMm3Ht+a95DXHdTar4uz4v2CXtmUi7
 5n+Zxqimaeq7T7pLWtm/W+B9OCyFiISgwff4e2vRWZ7jFKFtGG6gQ2oOYEqX+ACEIII=
X-Gm-Gg: AeBDievID10o9zzJqedBxVLPdlJIgc/iRaJbJm6ZxErN3/uw2US0SRnq2Nh+ccFPwW9
 dHi2EB9+IEYAt0TPy8WOp7vh1mGL2bFnlfT8kdjDMLzFigs3uGl2kVzsXD1hydwziLfoBGCVWIJ
 8utnX9r9Tkpl1EyQNrOa3gS1fmt7gvyatuImIAhRUzK4AsUK4rBN483RxlpSj4KxFS82WSVjWza
 bytqo9CrivCb/N3z42MYKQkVFiF0BtrKJ7bScVYLYja+shOX7Mjvdx0SlSjtnI0Zw4M1tazn52P
 P/FIsFO7FpuLQ92mbOOzwqTeZiQLgw+eLddV6yiRmURDzh72vuB66QJGTmp18JcfSIy0+cjdTiu
 rvZ/IMqC4tyJtWt2/dizO9hudxu8qfnLUGs0AYuNvlktkNYuk7UvfZEq8xh5c8azORrilgDVIlG
 XYgUSvS0ZUJDPTp16x5FTl2y/l3tJMNaVh6K0WBP2fsxpru04EZw9j7Z0OVGdgFJnjKg==
X-Received: by 2002:a05:600c:8b54:b0:480:69b6:dfed with SMTP id
 5b1f17b1804b1-488997c3a25mr264589625e9.24.1775589807692; 
 Tue, 07 Apr 2026 12:23:27 -0700 (PDT)
Received: from [192.168.69.228] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4888a706062sm511916985e9.9.2026.04.07.12.23.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Apr 2026 12:23:27 -0700 (PDT)
Message-ID: <7166f802-fe21-4672-895a-3bb946c41a55@linaro.org>
Date: Tue, 7 Apr 2026 21:23:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 13/20] target/arm/tcg/translate.c: extract
 aarch64_translate_code()
Content-Language: en-US
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, jim.macarthur@linaro.org,
 qemu-arm@nongnu.org
References: <20260407022748.57629-1-pierrick.bouvier@linaro.org>
 <20260407022748.57629-14-pierrick.bouvier@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260407022748.57629-14-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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

On 7/4/26 04:27, Pierrick Bouvier wrote:
> This allows to get rid of TARGET_AARCH64, and helps with next patch
> which will define at runtime tcg address type, by adding a second entry
> point in a different source file.
> 
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/internals.h         |  2 ++
>   target/arm/tcg/stubs32.c       |  7 +++++++
>   target/arm/tcg/translate-a64.c |  8 ++++++++
>   target/arm/tcg/translate.c     | 18 ++++++++----------
>   4 files changed, 25 insertions(+), 10 deletions(-)


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
> index 35ad7530c4b..c5af26e2b7e 100644
> --- a/target/arm/tcg/translate-a64.c
> +++ b/target/arm/tcg/translate-a64.c
> @@ -10949,3 +10949,11 @@ const TranslatorOps aarch64_translator_ops = {
>       .translate_insn     = aarch64_tr_translate_insn,
>       .tb_stop            = aarch64_tr_tb_stop,
>   };
> +

Please get translator_loop() declaration with explicit:

#include "exec/translator.h"

> +void aarch64_translate_code(CPUState *cpu, TranslationBlock *tb,
> +                            int *max_insns, vaddr pc, void *host_pc)
> +{
> +     DisasContext dc = {};

> +     translator_loop(cpu, tb, max_insns, pc, host_pc,
> +                     &aarch64_translator_ops, &dc.base);
> +}
> diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
> index 204f9657993..0597c9d4bed 100644
> --- a/target/arm/tcg/translate.c
> +++ b/target/arm/tcg/translate.c
> @@ -6878,18 +6878,16 @@ static const TranslatorOps thumb_translator_ops = {

Ditto (pre-existing):

#include "exec/translator.h"

>   void arm_translate_code(CPUState *cpu, TranslationBlock *tb,
>                           int *max_insns, vaddr pc, void *host_pc)
>   {
> -    DisasContext dc = { };
> -    const TranslatorOps *ops = &arm_translator_ops;
>       CPUARMTBFlags tb_flags = arm_tbflags_from_tb(tb);
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
> +                        (EX_TBFLAG_AM32(tb_flags, THUMB)
> +                        ? &thumb_translator_ops
> +                        : &arm_translator_ops),
> +                        &dc.base);
>       }
> -#endif
> -
> -    translator_loop(cpu, tb, max_insns, pc, host_pc, ops, &dc.base);
>   }


