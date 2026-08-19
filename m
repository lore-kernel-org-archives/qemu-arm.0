Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4813DC5DF81
	for <qemu-arm@archiver.kernel.org>; Wed, 19 Aug 2026 17:02:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wwjgH-0005Dm-Q7; Wed, 19 Aug 2026 13:02:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wwjgG-0005DI-Bh
 for qemu-arm@nongnu.org; Wed, 19 Aug 2026 13:02:24 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wwjgD-0003oO-R2
 for qemu-arm@nongnu.org; Wed, 19 Aug 2026 13:02:24 -0400
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-84e0688b7e8so1066676b3a.1
 for <qemu-arm@nongnu.org>; Wed, 19 Aug 2026 10:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787158933; x=1787763733; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=HgUUAFwAgpfyCeW14taFa3bM+P7nWCuBRhZOVTGc8bE=;
 b=vVd0uurtqm8vrKrXGz6RHKZChAEqf0inRq2LwlBwtrmqVvKZKn5r3kGMfO5n5kBrJI
 2G7B+FTbW3D4rvQshvpMy8y+dE09id4Jcetwqc/+7uQlL3nQQ+JUZCencbqPUhJJu89S
 tIYkB4fetDXNbmlBLnpsPIVru1906B6a85GvGLXQKOl2gSZ1vmbhUVrd212fGmB3zEa6
 odNwoWEv930vVD2CzGS4NmkA9Ssm113Nwp2dkAIuyVZsYB7qtuesCYjfUysICOJ9nRR9
 ZctsQP1ZWNes7Vtv965SCMWYHlMOkMoe/Z//pgJn+m6wYcnnWzJ0SlJPhzCn5xeb8LpA
 dkZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787158933; x=1787763733;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=HgUUAFwAgpfyCeW14taFa3bM+P7nWCuBRhZOVTGc8bE=;
 b=UYe3fJwAm40QXGxcnmnsxNbyiuxDWpXltRFpjSGfXpqrcjz+JboZ6fLXWSMngy5DR4
 jjtgPGtUT8R24hWwocoyluk+0jfQ5gRxa2xqDiBJ/A69Nd7NsjVTdEMDceT3D2xfjLB9
 bCliIsnqV5k3W9remBbrR0HFoyylWlIPNCplk1YEt0MQkPp3ICrex+vfgnN0GLF+VoHD
 JXPHf/HnWJVAfmEIDKhaT27fKjKQfu9dmHzC/dGBjZek85cLyWzNLtJrYwLfeQDRcsQ8
 kQMIihKdoO2UkE6YbOspomZWPVh2Xu9O5m8iu1xNyy6wlnI0+ptggFJyuigFXd/hOV8Q
 Qqbw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr6XTgOVtmTl1kVTo5hithAWpJnLvV/9G3f9DNzci3RCJMVE00W2AajKXJvBGmDpiOEUyuvuiroVQ==@nongnu.org
X-Gm-Message-State: AOJu0Yxk9mtUqy7lcXXtMMeyqSW5GeS0Tb09FBEf+OaV/X7pds1zA4wf
 7vyXnRMYLuXIltFxUEibR0a7K/Q83wks7ekFxtFJkQ0nl3+rXdvLn3/1apRmDFi0s4o=
X-Gm-Gg: AR+sD12kiM6YO1cB7yc1el7izXN+XYFUFx0mdy/k3hptYEU+3m9RXquk6Og3/cihCWW
 Ze/R7IoO+3CHfEq8w2NIqOxAj1pLhAJGTx8l/8hQXSmLLcvW8nyZ9lOztH4aryB6zfAYHx3j0Uo
 zzWe+R8NaF4zy/hLTpxHlLPYOyBW03FghpoAJJK8YSfm15sHtjrHIxKVKilPpvFTJaer+cLuxtu
 I283jcJxWgfPv2tP6pAEaGpST3laSe82lPBcAsm9Mvl+5SZGwpNlFsSGSC1tVci3T/v/FrPLp0D
 btFNCh/5gGUjwPgNskHcMozag6r3ZU6B68D/QfkkD+Vjizwjjel3b9xmRlCyLDBK7qn1YA78mcq
 JNICDArmWyp1nG6SfkARH67KZwOZeWkuAt/OI9rpdVjxDm7dp8IxZ0G9NM+BmIvrpnFV2d9rPmm
 bXniFwm483Fmo144qxQQqJQK4zExcKXjej+CeBpsJD+oGgo20bNSQwnXHnLeYpvp+Msr+dlutE4
 qamOb0v
X-Received: by 2002:a05:6a00:2e16:b0:846:4d4c:23f8 with SMTP id
 d2e1a72fcca58-851d3809eb0mr9036969b3a.1.1787158933355; 
 Wed, 19 Aug 2026 10:02:13 -0700 (PDT)
Received: from [192.168.122.51] ([173.164.107.233])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-851d336291esm898335b3a.12.2026.08.19.10.02.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Aug 2026 10:02:12 -0700 (PDT)
Message-ID: <e97abd17-5462-40d1-aaa0-895c4203366b@linaro.org>
Date: Wed, 19 Aug 2026 10:02:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/arm: Correct reset value of SCTLR for arm926
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20260818115814.2268429-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260818115814.2268429-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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

On 8/18/26 04:58, Peter Maydell wrote:
> For the arm926 CPU we reset the SCTLR to 0x00090078.  This is not the
> value specified in the ARM926EJ-S TRM (ARM DDI 0198E), which states
> that bits 16 and 18 are SBO, bit 17 is SBZ, and bits [31:19] are SBZ.
> It's also not the value seen on real hardware.
> 
> This has been wrong in QEMU since 2007 when we first started actively
> resetting the SCTLR to some fixed value rather than zero.
> 
> This wrong value didn't affect any of QEMU's behaviour, because we
> don't implement any handling of the old pre-v6 meanings of these bits
> (which were IMPDEF), and their v8 reuse is guarded by appropriate
> version checks.
> 
> Correct the reset value to 0x00050078 (i.e set bit 18 and not 19).
> 
> (We use the same reset value for the arm1020; this might also be
> wrong, but as the ARM1020 TRM doesn't seem to be available we can't
> check, so leave it as-is.)

Found ARM DDI 0244C, ARM1026EJ-S r0p2:

https://www.datasheetarchive.com/datasheet/ARM1026EJ-S/ARM?term=ARM1026EJ-S%25E2%2584%25A2&version=1

which appears to be what arm1026_initfn is modeling.

It also has [23:19] SBZ, [18] SBO, 17 [SBZ], 16 [SBO].

> 
> Cc: qemu-stable@nongnu.org
> Fixes: 610c3c8afd99f4f11 ("Reset ARM cp15.c1_sys to default values. Fix XScale cp15 accesses.")
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4202
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/tcg/cpu32.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Anyway, for this one,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

