Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (unknown [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9872010F996B
	for <qemu-arm@archiver.kernel.org>; Wed,  8 Apr 2026 18:41:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wAXpC-0000hP-9s; Wed, 08 Apr 2026 14:40:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wAXpA-0000XP-Rl
 for qemu-arm@nongnu.org; Wed, 08 Apr 2026 14:40:24 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wADYy-00026X-EX
 for qemu-arm@nongnu.org; Tue, 07 Apr 2026 17:02:21 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-488b150559bso19531205e9.1
 for <qemu-arm@nongnu.org>; Tue, 07 Apr 2026 14:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775595739; x=1776200539; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pEHtRozxbaRsO1Z0uPRcQlJNySfPOxEqqvINVBJS1qs=;
 b=KAL9F4C1hSSWVbV4dW0quA1eELm1ptEBzgrurGAGUUSq/yGS/j9Ertc4aqRCJSJV8B
 25nUtG9R4STzYL1kRMf6MWfhucgwtovdlpPVbAcsRAmO1XzY3xjIaOMFJbvHozUsT0U2
 m1QGBIXxOcDMMLev9a2Aw/FKQjxCRQErCG0Ul/vg/JN0s3ENPMwx8E41znG+hEnGsN5v
 F4PSR0ykVw+jqnBqYkEpTZYoAc3aJqlyQ+wYH5xarXjbqteZJuJlnHnMRi9tvWT2lFl+
 T4lvdYyP07XymgJUGv+SC6XPbo+vRlKEV7jrlNbQTU3UdcMmiqIreTO8au8GLiQ4kaOt
 kTgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775595739; x=1776200539;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pEHtRozxbaRsO1Z0uPRcQlJNySfPOxEqqvINVBJS1qs=;
 b=mx6B0wpd8YKHDoD1dcpYWQsBmcxcG5k0+XOXkcF48/w0ECe6Go2uezxrPU8GYt/pXD
 QZcoz2JpPcCuDw5n4Y9qonz0Rtdv1z0dSfr5Pl/pfDSdd7PnHMGsTh/oIraOlLh2rx13
 4p5mIuwg6i8OASvuVasc+edhWRzf/eJAKUi5pU1IgULBBCHso/xpSs1vLzd5UzMepj18
 y1I9raD3irMnTfzLe8zFyBFlhap62rSNGTsKWXhLj+TvEu59BmlRsk93e9cs/BSs3KCq
 VlWilDa0PfETs+jpiT+yPZQd0n6zccFv/VwL07+MFHJPm6FImbp9T3Hd2aGi6s9j1EWS
 wj/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqkM0VLm3zvALdGORIgvwOuHgYE9SyyEpITpmxGejPzOj+7LTN8pGcPB0wvIBebJs7lfi92J4f9g==@nongnu.org
X-Gm-Message-State: AOJu0YyCw9CPOBtA5D1rf4z9j+62Pfmhzb5AjUtdQ4TgLGRBHrL4YBuP
 v7PjP51/spCLjj1V8zgiJ+Ma+jz2dx3VbTLqEtcIwCiQqNEKHNZJQBx3buOuEXH2kuw=
X-Gm-Gg: AeBDieuYAX0cpPdboO3ZZno9TtyAebHkFXpNpG8ngLy7KH4GQe6Gedhi5E9GoMF+/lo
 3+G/q2hP1q2AShQhK9KJYiga1WqU1PVvTCv6hVXNI2vl8PD1jkB4IlL3so3zUvz+N4khhvxwQwa
 dVqjshi3FE+OPycwaEVL+7iQy7fgMkXiUfhy5NKw3aKR0VGeF6VFsL/iuhlrsOyz78l8ejaS76o
 NnWZYu+Zz89n8M0LnYfCSlUtU8f0zWXCYetipDJbjtAaiEQVfK3IrqLhO4QDp6RldONunInguah
 rPCaHGUH4uQx8PSMcBypUuB465BKmeMZo1GLj7p+SY0KVM4pyJNYN8oQMH4qTsy7QFxHb9OtvwW
 5pRv/ndbpYhoepnXN5U/scS/f7qv5nkpZop+9mZHi0Ziy1+i+hM2IoCze/ekFhtvWcXlkBxy5PN
 2g9805aznCKlZuVTYdxbQJgmTU9yljSefD/DXvuGxbtztTkUZ7KFQ9AzcTO8nfw/kDpQ==
X-Received: by 2002:a05:600c:c8f:b0:485:3cf3:1010 with SMTP id
 5b1f17b1804b1-488996d23femr236502025e9.2.1775595738616; 
 Tue, 07 Apr 2026 14:02:18 -0700 (PDT)
Received: from [192.168.69.228] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488940e075esm470003405e9.9.2026.04.07.14.02.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Apr 2026 14:02:18 -0700 (PDT)
Message-ID: <c18cb395-afa8-42c8-aedd-87863d49befc@linaro.org>
Date: Tue, 7 Apr 2026 23:02:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 15/21] target/arm/tcg/translate.c: replace TCGv with
 TCGv_va
Content-Language: en-US
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, jim.macarthur@linaro.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20260407195922.196410-1-pierrick.bouvier@linaro.org>
 <20260407195922.196410-16-pierrick.bouvier@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260407195922.196410-16-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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

On 7/4/26 21:59, Pierrick Bouvier wrote:
> We know this file is for 32-bit runtime target, so we can set
> TCG_ADDRESS_BITS. TCG_TYPE_VA is derived accordingly and is already
> passed to translator_loop.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/tcg/translate.c | 29 +++++++++++++++--------------
>   1 file changed, 15 insertions(+), 14 deletions(-)
> 
> diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
> index fa4c7907dcd..0b3b4ab86be 100644
> --- a/target/arm/tcg/translate.c
> +++ b/target/arm/tcg/translate.c
> @@ -22,7 +22,8 @@
>   
>   #include "translate.h"
>   #include "translate-a32.h"
> -#include "tcg/tcg-op.h"
> +#define TCG_ADDRESS_BITS 32
> +#include "tcg/tcg-op-mem.h"
>   #include "qemu/log.h"
>   #include "arm_ldst.h"
>   #include "semihosting/semihost.h"
> @@ -910,14 +911,14 @@ MemOp pow2_align(unsigned i)
>    * that the address argument is TCGv_i32 rather than TCGv.
>    */
>   
> -static TCGv gen_aa32_addr(DisasContext *s, TCGv_i32 a32, MemOp op)
> +static TCGv_va gen_aa32_addr(DisasContext *s, TCGv_i32 a32, MemOp op)
>   {
> -    TCGv addr = tcg_temp_new();
> -    tcg_gen_extu_i32_tl(addr, a32);
> +    TCGv_va addr = tcgv_va_temp_new();
> +    tcg_gen_mov_i32(addr, a32);

The implicit TCGv_va -> TCGv_i32 bugs me here, but the overall change
will make my sleep better :) So:

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

>   
>       /* Not needed for user-mode BE32, where we use MO_BE instead.  */
>       if (!IS_USER_ONLY && s->sctlr_b && (op & MO_SIZE) < MO_32) {
> -        tcg_gen_xori_tl(addr, addr, 4 - (1 << (op & MO_SIZE)));
> +        tcg_gen_xori_i32(addr, addr, 4 - (1 << (op & MO_SIZE)));
>       }
>       return addr;
>   }
> @@ -929,21 +930,21 @@ static TCGv gen_aa32_addr(DisasContext *s, TCGv_i32 a32, MemOp op)
>   void gen_aa32_ld_internal_i32(DisasContext *s, TCGv_i32 val,
>                                 TCGv_i32 a32, int index, MemOp opc)
>   {
> -    TCGv addr = gen_aa32_addr(s, a32, opc);
> +    TCGv_va addr = gen_aa32_addr(s, a32, opc);
>       tcg_gen_qemu_ld_i32(val, addr, index, opc);
>   }


