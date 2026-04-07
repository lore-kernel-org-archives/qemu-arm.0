Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51DB810F9969
	for <qemu-arm@archiver.kernel.org>; Wed,  8 Apr 2026 19:35:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wAYby-0004M1-EL; Wed, 08 Apr 2026 15:30:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wAY9a-0000XR-GB
 for qemu-arm@nongnu.org; Wed, 08 Apr 2026 15:01:30 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wAEtH-0002EB-7L
 for qemu-arm@nongnu.org; Tue, 07 Apr 2026 18:27:25 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-35d99031e4eso3187221a91.1
 for <qemu-arm@nongnu.org>; Tue, 07 Apr 2026 15:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775600841; x=1776205641; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2iCglNR1awWvoA7pNjFj2RSl4AI1G2ETGo7euEiz6GY=;
 b=aETcWrLltPxgKHjzQURz+J88cTLiIPmPMWMoJwDzDR/ICLroUaA833D/YUcG6a6MU+
 KAe79D5G0bO1ivyHra+p4MTJ/Se2f0d/HMQb4oKGEaHNU33pCwar99h8gx0yB+Y7c/pw
 pIDiXvwCvskvEO1goxYLISHfTmvua9TkOIq+B4mVP7ePAUo205qBvbV2papVbXCugeMk
 taWHVe3xPJ8cu91DhkHiLxVRYneBZcQcBSS3Hh+gR0mcaV9AexBfMNH0p2599MIjhL1H
 OTg4N/hppB2Gj5cnWR6htWzgz9e7bIGk5JGGIv+P1Bi6LQTrOUdmOvHXaC+00yfZBRV7
 VA0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775600841; x=1776205641;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2iCglNR1awWvoA7pNjFj2RSl4AI1G2ETGo7euEiz6GY=;
 b=coOdQvEETB1KLWI7VIkqnxeDYdkeVMkgzQoPPVewhlKajoOBzEIVrZOZiI9XQoDLae
 kUzBqZGOjrjarzfHKfLf8hcn0lfkd2bmaE2znWbGHazZkjUFfQ+VtYWZrTupMISZ/VMA
 I0iRNwtgEqSnKczxoWwCbBhmU05NP7fTk3xJwr5LwkZkZY21qCoksMYGQtQ+lgY6lndF
 oxO7XmrtNTN8X5wKvG7Us/DKpEBwKG1NDwAK2fsRlTh3yA+0hw/UVWSXcaPWrgur958w
 64eLT0M2COCym9TOXG7fhnk6rSonCF7v8SwyLewtczxBc9L9HnIM2za38mChufBgiQYY
 A87Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUR0HK9rumrkH+Yt5x9mAXqRB1I+NyyDWIVh3A3ETzHQ80655ABmqKU7xXMpzG+TKspYQbLsP9etg==@nongnu.org
X-Gm-Message-State: AOJu0YxFoDXiJ2j8xwCDLIxjgeqydCNsAHWIc+vdh5KUG+URy2MVSp0N
 MoB41x4VEsInFuo/TmntZNA5+faPV2reSJxbfpGZUQHY178r1qIkgmdYbUIqj+/8QOppSNmEw14
 PQSyqQ5k=
X-Gm-Gg: AeBDiesx7T9p2lhZFx/+LCBeibE7zGZvLcg1Vm8vNJ9yPecF8IVfo6DQL7oNL7EPRvj
 1dprZKz7jbof4agmR++jbp9L6KNZ8DhPSIu0jGffChpixnBTo0SDvcBc6aJYtAXqwl6KZBPFG5U
 MdFTcUeCVAOKlEpr9d5VkpNOt1BctrcWLZkjGWnsHmJymkXUtoOfOOymx4c3MBbc2MLAyluodFj
 2RntB3qggMf7RuZe6AIAhRg1/YPhpI0+sfkNeGr2fwbJ9QY41slzvg1l1vOks1DxZoclkDXBMXy
 zPxJ6/xJKluLXq3plz5LzhqOj/X6FP6I564Z2UrpcWOT/chd24NSNCZy27dd/BpKU9tRjyMQT+M
 t5I+MpLfK0ELm+yshxMJbSM9uW2ALHIyIjM7qrRVMYf4z91kgH0XmfzVvAxZwg3XqtGq+bN1+8b
 MZTMoI1lou3rAPR46PiKk70izCLifI2Z9zO6/wAQj8vfVIJpJGHpoVFZydUoUyuHtUuaA=
X-Received: by 2002:a17:90b:4d84:b0:35d:a87b:ef69 with SMTP id
 98e67ed59e1d1-35de695c375mr17112914a91.28.1775600841347; 
 Tue, 07 Apr 2026 15:27:21 -0700 (PDT)
Received: from [192.168.1.105] (124-150-69-109.tpgi.com.au. [124.150.69.109])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c76c6491157sm15051133a12.9.2026.04.07.15.27.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Apr 2026 15:27:20 -0700 (PDT)
Message-ID: <7ccbc31f-b3ce-49a4-80e7-e052f517f0e1@linaro.org>
Date: Wed, 8 Apr 2026 08:27:14 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 15/21] target/arm/tcg/translate.c: replace TCGv with
 TCGv_va
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, jim.macarthur@linaro.org,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20260407195922.196410-1-pierrick.bouvier@linaro.org>
 <20260407195922.196410-16-pierrick.bouvier@linaro.org>
 <c18cb395-afa8-42c8-aedd-87863d49befc@linaro.org>
 <7dfc0566-1266-4466-b2aa-707848957153@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <7dfc0566-1266-4466-b2aa-707848957153@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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

On 4/8/26 08:20, Pierrick Bouvier wrote:
> On 4/7/26 2:02 PM, Philippe Mathieu-Daudé wrote:
>> On 7/4/26 21:59, Pierrick Bouvier wrote:
>>> We know this file is for 32-bit runtime target, so we can set
>>> TCG_ADDRESS_BITS. TCG_TYPE_VA is derived accordingly and is already
>>> passed to translator_loop.
>>>
>>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>>> ---
>>>    target/arm/tcg/translate.c | 29 +++++++++++++++--------------
>>>    1 file changed, 15 insertions(+), 14 deletions(-)
>>>
>>> diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
>>> index fa4c7907dcd..0b3b4ab86be 100644
>>> --- a/target/arm/tcg/translate.c
>>> +++ b/target/arm/tcg/translate.c
>>> @@ -22,7 +22,8 @@
>>>    #include "translate.h"
>>>    #include "translate-a32.h"
>>> -#include "tcg/tcg-op.h"
>>> +#define TCG_ADDRESS_BITS 32
>>> +#include "tcg/tcg-op-mem.h"
>>>    #include "qemu/log.h"
>>>    #include "arm_ldst.h"
>>>    #include "semihosting/semihost.h"
>>> @@ -910,14 +911,14 @@ MemOp pow2_align(unsigned i)
>>>     * that the address argument is TCGv_i32 rather than TCGv.
>>>     */
>>> -static TCGv gen_aa32_addr(DisasContext *s, TCGv_i32 a32, MemOp op)
>>> +static TCGv_va gen_aa32_addr(DisasContext *s, TCGv_i32 a32, MemOp op)
>>>    {
>>> -    TCGv addr = tcg_temp_new();
>>> -    tcg_gen_extu_i32_tl(addr, a32);
>>> +    TCGv_va addr = tcgv_va_temp_new();
>>> +    tcg_gen_mov_i32(addr, a32);
>>
>> The implicit TCGv_va -> TCGv_i32 bugs me here, but the overall change
>> will make my sleep better :) So:
>>
> 
> We could use TCGv_i32 directly, TCGv_va is just useful here to document the intention. I 
> can update this if Richard and you prefer this.

I think this is fine, as I'm not keen on introducing a complete set of tcg_gen_foo_va 
macros.  As is, any mismatch will be caught at compile-time.


r~

