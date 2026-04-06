Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73681FB5164
	for <qemu-arm@archiver.kernel.org>; Mon,  6 Apr 2026 21:33:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w9rZP-0007GC-Dy; Mon, 06 Apr 2026 17:33:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1w9rZN-0007FG-IK
 for qemu-arm@nongnu.org; Mon, 06 Apr 2026 17:33:17 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1w9rZM-0008JE-2T
 for qemu-arm@nongnu.org; Mon, 06 Apr 2026 17:33:17 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-8296dabef74so4150008b3a.1
 for <qemu-arm@nongnu.org>; Mon, 06 Apr 2026 14:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775511194; x=1776115994; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=c5fWDynpNM7WVWiq3joGoyQsNbyPENgRR5SE6uFUXQY=;
 b=z2aWzrZdOiCp0oxkWBWjjuc1MKqzVVSCzM6l/JTJliRcX+CJNH5mnqrLbHN6H4Fu64
 bCxAiUB43PUAPOUrHR6mQEo9efU/w9VQYycmMku/zLnhaA2Mj4SumXRLWz9heJ3xyNJM
 +XijztYe8y5S0f1x/zCwE8P8F77jE98jrDHXf8s377kCIkG20ABepEcjgOzT9d0G9STz
 r5Jr45/3E0ZaVtTRuZW17tsF5zHLcPIadq+z/KpFuntewDD+9Y4D5SjKxc70N8uGJ6D/
 i8HqZ2HRz2joasIUCPfQJ51v4wSTdBP+CTzPjPzZI1rleM+tr8W8PUnqfBif4qN4GJlG
 NQAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775511194; x=1776115994;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=c5fWDynpNM7WVWiq3joGoyQsNbyPENgRR5SE6uFUXQY=;
 b=s2RxTu3KEWTfl1sgTvnhc+66GqwKpqdilLbGt5W0BBSP2STfkJ4IFoqFSKhBn/oNUl
 n6WkqGwSWJ0xH49URabB0JPP5R2NaKSrQR6u6/ezNBs2w6rwicM+QLRy8BJubjViVamB
 xkyz8JZr1fNESEawmhR4F0CvRahqhYT+OjwbGHawAnnFYKAc27dBIB3JoWziZ9bfLvDK
 XRVOv6RPyhSAcvexMoO3xqrqhzvaEipKfcOlourw+jnJAFevCRgG45AXxUsfb3oJQMLG
 fst7DHDhsq70A6v9rHkYIkpc3lyegDYRdHzvQzAUL7Lyw1wVULt6xydTUlswlQymWl5V
 yoTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXs/Syr5J/nLKZhyJ2XPulGfuCjZ5pUgdA3NWkaJrKeXkTn1B6GRga+RjclISjZvcPK3+pT3zBR/Q==@nongnu.org
X-Gm-Message-State: AOJu0YzLNXfWb2LjsApvXQHFMRSb1ZUGYOtBIMug8LzV+ssEdiPMFkeA
 zvbnTo8YSVNnmVDam1yd0jKe+V36S11xLj+dbA+IDZUTkdK5YzH+LQXYxnN4YYlWpfo=
X-Gm-Gg: AeBDiesCdQHpwKmEho9Oc9qH1KJK84d4m4PnNWCtbWTcvJY4k0vxpEBAwqHRxT6gdcv
 vXZwLJvzHdmp+iyl8Uhku7C69C92G/uyDd/vNz8q6Mt4knNqGmGiTluUgoUYpCsRLylhwbQEX7R
 33SGstlqHXwcSKOISwCuvJlVT02R+I75seXCRgC/iyz1TKYDbbjIEIvGr+5MJfZ3XaG1MM2GAJv
 4QMunGm1vWe9QtAS63YQMQq0lT5bJTlku66k0m0h7dqDvd5OZx1M1rpXG9qcEsydV5HpgJT0IY8
 fEANkPk43t/esxoTOnZdi+yFOJ+D3etRBhUwBSlmHXsV/2q638OYJFyCirJ5s+iatPqIVh7mlS7
 v8uaoziTuxUGeZiP0nCmdDEs9m5gmQrH/mlJ4SvDHhNFO0dOtxJSHdz5T9RPktvJIW3e4fTWF/p
 /cCehPkAVFHDOC1liaIAnRBspw1PpSm9HYlILR6e1d2UCkR833VGu1COx3hXSmpV/nNWo=
X-Received: by 2002:a05:6a00:14c3:b0:82a:5ef0:210c with SMTP id
 d2e1a72fcca58-82d0da8f33dmr14453607b3a.24.1775511194192; 
 Mon, 06 Apr 2026 14:33:14 -0700 (PDT)
Received: from [192.168.1.105] (124-150-69-109.tpgi.com.au. [124.150.69.109])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82cf9b60199sm13772768b3a.25.2026.04.06.14.33.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Apr 2026 14:33:13 -0700 (PDT)
Message-ID: <7b8e5cb7-e5fb-4734-93df-de3e30c3f199@linaro.org>
Date: Tue, 7 Apr 2026 07:33:07 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 15/20] target/arm/tcg/translate-a64.c: use
 translator_ldl_end instead of arm_ldl_code
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, jim.macarthur@linaro.org,
 Paolo Bonzini <pbonzini@redhat.com>, philmd@linaro.org, qemu-arm@nongnu.org
References: <20260406182609.193886-1-pierrick.bouvier@linaro.org>
 <20260406182609.193886-16-pierrick.bouvier@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260406182609.193886-16-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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
> Allows to reduce scope of target/arm/tcg/arm_ldst.h to aarch32 only.
> 
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/tcg/translate-a64.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

> 
> diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
> index 35ad7530c4b..ebab9f36f08 100644
> --- a/target/arm/tcg/translate-a64.c
> +++ b/target/arm/tcg/translate-a64.c
> @@ -25,7 +25,6 @@
>   #include "translate-a64.h"
>   #include "tcg/tcg-op.h"
>   #include "qemu/log.h"
> -#include "arm_ldst.h"
>   #include "semihosting/semihost.h"
>   #include "cpregs.h"
>   
> @@ -10800,7 +10799,7 @@ static void aarch64_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
>       if (pc & 3) {
>           /*
>            * PC alignment fault.  This has priority over the instruction abort
> -         * that we would receive from a translation fault via arm_ldl_code.
> +         * that we would receive from a translation fault via translator_ldl_end.
>            * This should only be possible after an indirect branch, at the
>            * start of the TB.
>            */
> @@ -10812,7 +10811,7 @@ static void aarch64_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
>       }
>   
>       s->pc_curr = pc;
> -    insn = arm_ldl_code(env, &s->base, pc, s->sctlr_b);
> +    insn = translator_ldl_end(env, &s->base, pc, MO_LE);
>       s->insn = insn;
>       s->base.pc_next = pc + 4;
>   


