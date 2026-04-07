Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCBA910F9972
	for <qemu-arm@archiver.kernel.org>; Wed,  8 Apr 2026 19:30:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wAYWR-0006mz-94; Wed, 08 Apr 2026 15:25:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wAY6z-0007SV-RY
 for qemu-arm@nongnu.org; Wed, 08 Apr 2026 14:58:49 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wAEOr-0004wg-R6
 for qemu-arm@nongnu.org; Tue, 07 Apr 2026 17:55:59 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-48896199cbaso49943995e9.1
 for <qemu-arm@nongnu.org>; Tue, 07 Apr 2026 14:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775598956; x=1776203756; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=neFvve/rUExOH07d37NMYjOGCEocWXfGOtS8mIe395I=;
 b=RqE9+fzFRkT8Jq1JuNd94sxo2vF9HwAxRNjJ9+BVhxYHIz5WnE7miycMPw3mRaGRj9
 cET75DvgFbP6cia2bT0QiLeW/DU2PaM/6RLBOvyEKylpd6gO5+0317SCDIfm58iAI+Xp
 TuVKYOM38q43Tc6m327tczZDCYt7p/2U+Sos6pAmZXp5grQ+d+U8RjDhQ8I7tJbZtfdP
 JGuLSQQvKn9D0i7S+O/FHt5obHa3py29FDjhskA0y/NWCDMQ9NRtBgX6144tvpVr9ANr
 5yEtN2Nhlzbs+ZUorGtGoxfA2O9umFbdS521qBzJag/gVBXaFZzHagBgtrgHWkZ9v1KC
 fSdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775598956; x=1776203756;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=neFvve/rUExOH07d37NMYjOGCEocWXfGOtS8mIe395I=;
 b=FCvhGKEc77M9hP05J7fTK//q+bDj+vLywCAUvl5cBB25CWlDazz2iVLTi8iwDr8lRd
 66RvNjnhBVzhF0KlsPTrfwku/qzHGJsUuav9NBJT2UYRLuZF2tcRUwBgJZV/WaqoNYTf
 exjmOxxNNUnLRFSPjQ3cpz3Amb/QC7ZuLw2qNiNZSdu8Q3wnjXUb2lMhkvw4qZGriE3G
 +Vo75l7Ko1XQTofMyK5/Tox0kI7lzONtyAuJoGuRrQLp6Vkz+vmpxb3e87fcSSzOw915
 LAAltjqZx8plNrecbX+Eovzu8cs75M6370FPvBn/isTCp1lnv78gYL8bXoc2ARMKX0ix
 9Dgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAPg3bQmfunk3lWMCJygBMZUu2Zuab3uBcOnDbTHsc4Y8DHLBbDVSb2wgY8ZravLDZnQXrtgY5Fg==@nongnu.org
X-Gm-Message-State: AOJu0Yzh0TJOeaPqUyubcCC1qCbUQwx3+AOymk7uZnhRpyZOZRf3A3DZ
 p1T2uipTT71NUa6KnfeNZ5tXNFnu+DKW2fW0fN76A1a2G/Gkc+sdXD+qk+TMRrawwak=
X-Gm-Gg: AeBDieslYteaDFdYPDi+uGzdn1aPOwdaY+jvjdZhlk7di96setbbBAWZZzB2MgVoXgl
 +eLohiGbp9q9/rV6KBsFHXy5yfEj2UMx2c9Sa6Z5iR5+e4YE6I2wlOIwH7zFHvP5pouJbHfRGas
 7pX3bIzTTrMLN0PutlHX/RuxSIgQl1wC+cTeSWx0LRL3GQlG2HFYoI73p3xxYDogTbvEuwavyhi
 jJa54HMAj6fR4E5gfOntbwRdpuNDHp7RzhwBk1ZbPEyhoT+LJf72AMPjWuwTegcqb6AmdzFyorp
 Plw4BdpclvAhxpapl+1He0drmzfr+uY/P/rLr8Gxn3/QhKApccFTwQwV+nL+OfCRbC6+nvhiKV0
 FoYQeXAojMcWmXcT8UaBcR6XPj0dwj6fVw3bIyrSAEf2tgO/BwlXrZ3sr0MjfTYCvqMTNyI3HPB
 yOP7QPZshu8uTuSJ81x0w1Rr76LTem1o7PnbFsXbD+UhBBmfX8+Lnz3gskmSRvwkcTbQ==
X-Received: by 2002:a05:600c:4483:b0:488:a639:b787 with SMTP id
 5b1f17b1804b1-488a639f138mr108402285e9.11.1775598955741; 
 Tue, 07 Apr 2026 14:55:55 -0700 (PDT)
Received: from [192.168.69.228] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488be75215dsm83496455e9.6.2026.04.07.14.55.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Apr 2026 14:55:55 -0700 (PDT)
Message-ID: <75339585-19b3-4047-a186-06d21d05bf7b@linaro.org>
Date: Tue, 7 Apr 2026 23:55:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 11/21] target/arm/tcg/translate.c: remove MO_TE usage
Content-Language: en-US
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, jim.macarthur@linaro.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-stable@nongnu.org
References: <20260407195922.196410-1-pierrick.bouvier@linaro.org>
 <20260407195922.196410-12-pierrick.bouvier@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260407195922.196410-12-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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

On 7/4/26 21:59, Pierrick Bouvier wrote:
> dc->be_data is already set just above in the same function:
> ```
>      dc->be_data = EX_TBFLAG_ANY(tb_flags, BE_DATA) ? MO_BE : MO_LE;
> ```
> 
> Cc: qemu-stable@nongnu.org

Why Cc stable? This is just removing pointless code, right?

> Fixes: a729a46b05a ("target/arm: Add wrapper macros for accessing tbflags")

This commit doesn't seem to be related.

Do you mean commit 79cabf1f473 ("target/arm: Recover 4 bits from
TBFLAGs")?

     We had completely run out of TBFLAG bits.
     Split A- and M-profile bits into two overlapping buckets.
     This results in 4 free bits.

     We used to initialize all of the a32 and m32 fields in DisasContext
     by assignment, in arm_tr_init_disas_context.  Now we only initialize
     either the a32 or m32 by assignment, because the bits overlap in
     tbflags.  So zero the entire structure in gen_intermediate_code.

Since BE_DATA is in the TBFLAG_ANY set, I don't get why it
is set to MO_TE for M-profile.

At any rate this patch description deserves a better explanation IMHO.

> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/tcg/translate.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
> index 56ef1e0eb59..4546bbeeeff 100644
> --- a/target/arm/tcg/translate.c
> +++ b/target/arm/tcg/translate.c
> @@ -6344,7 +6344,6 @@ static void arm_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>   
>       if (arm_feature(env, ARM_FEATURE_M)) {
>           dc->vfp_enabled = 1;
> -        dc->be_data = MO_TE;
>           dc->v7m_handler_mode = EX_TBFLAG_M32(tb_flags, HANDLER);
>           dc->v8m_secure = EX_TBFLAG_M32(tb_flags, SECURE);
>           dc->v8m_stackcheck = EX_TBFLAG_M32(tb_flags, STACKCHECK);


