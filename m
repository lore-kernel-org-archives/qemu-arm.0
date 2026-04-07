Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C158910F9974
	for <qemu-arm@archiver.kernel.org>; Wed,  8 Apr 2026 19:23:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wAYSw-0005i5-OR; Wed, 08 Apr 2026 15:21:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wAY3s-00069L-BF
 for qemu-arm@nongnu.org; Wed, 08 Apr 2026 14:55:36 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wADkO-0004df-Bl
 for qemu-arm@nongnu.org; Tue, 07 Apr 2026 17:14:10 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-488b8efed61so2373215e9.1
 for <qemu-arm@nongnu.org>; Tue, 07 Apr 2026 14:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775596445; x=1776201245; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fPd06pqiI/5bpgSPvfgbRni8GbgGSETxxP3KZguGeZQ=;
 b=CR5oZOtViWwp/0q9bQdx3nEa3ia4SZNJ2GcEWc+g31CiuTbtMf0/YXSZuy95p3dznp
 B6pAv+J5nHFaWrYXbtOr1GJGKZaGKOyIQddLH6ZjR0QM1hmvq8vKBJbrfb5/X6M+txbY
 XocpFVI6pdSz+FfRFwK1dbFDts/kgYDvAtxTWsIj1SKVKPATKULi41D+o/Dtz309JfqJ
 2sGDcwQADNk1fmLzIGVqPh/Gqq6w4KObUJwaZAnrLyKsXNZSorPPgg9VnBSDQo1eDsq2
 uZZ49Zq2+j8VZIk7RnJVy4WgvIMxC/20nXUJUMrAdK3HT8mMmF5Y03zGXcSnvVa9N34d
 mL9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775596445; x=1776201245;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fPd06pqiI/5bpgSPvfgbRni8GbgGSETxxP3KZguGeZQ=;
 b=Mo7SKZ9AnHUuqNsQk/SL7wcEe5Oms+AiAx8CC68rw0pzsCsZaFKeBG7TVkSeUx92gr
 mWz3PsBijU0T74h4yfBxDmjuznZbbaZPsiQGXuOe9WvDLqGTN1cqcP0oPi7WnRUkJfEl
 aVyZGr5CMpNmBj08EnHaW9LiI1lvG1bPVzDvbkuuRTF5a4UCTgtgm6nifFdmePchLAs/
 0wZgLbQ0Gj9qjJAGNKSfdBHTZBs5yVOYWeY5l7cx79viMrZvU+DBwTzW0c/wEDrlaZA8
 4BzI5hR3RmrlaD9+k5gS9xNfW98ltAKFBM8LKcTRvyLeBDu9gXRewHSonghEc3WpW+4h
 3tcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWY1Vk+OIAZaH2W9f+MgFKGblMAIzOHOj66pAMo8HQwksUeOw7e+AQ7SrmQ6ULrd9eSba07IOfwMg==@nongnu.org
X-Gm-Message-State: AOJu0YxDTHvWPdyTi4WxHIJQTqj2lkQjsGF5KyrAOtkU2Vh/pz3njyeH
 Mdxh/FQoKwAjaP2ESuuN4ToKB3G50v7p3lOaP9ngVPL/p66Kwo2uPoJtlQzALqvP4r4=
X-Gm-Gg: AeBDieulbC1rCLrhGng3nT/iZTCs18OzunAyMHURUuSHIvBQS2mAp2HJojkkHZFy/0J
 Zkh0wxDbzPRnXEGP4zKKUMVSgXXllUHovjcDaskL1KL0LasyoQq/Dp44qHVWQNNf+P7v55sjM4m
 pnSSMaKUNi73z0leaJIG2kztZQ3ZwifJWmwYVpOItq8NNRuV6ojR3z0dzbxQlMChrh83KqbXShK
 KGD2SZC3HaGDc8oeE3SafapJC6Det5G+B7FSpXbNUZw6VGloakdpAmPgYBaiOxkdezaw74cquLx
 /re8LgSquoR6ckaB9UaRqwBCS+C/rPhg9WqlItRy/0vKYBVfeamo691kebUxXSyCjGGC9slUGH0
 wRed2BYOnGpBXrmRcMhH3pNOtYF2cx8O9WZHovsWf85nntN7kBuAFQbKPfm7sWkGLZrwmhr4s3W
 qo2B6YNJq03iTViLlKriOe2MvLp8dEJHg8c0G4OEh2ukpgDgzFNAqPfN89onXHKC3Dmw==
X-Received: by 2002:a05:600c:4e42:b0:486:f893:56c6 with SMTP id
 5b1f17b1804b1-4889949c0f2mr57561745e9.10.1775596445108; 
 Tue, 07 Apr 2026 14:14:05 -0700 (PDT)
Received: from [192.168.69.228] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488c1c5291esm86444435e9.15.2026.04.07.14.14.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Apr 2026 14:14:04 -0700 (PDT)
Message-ID: <326b2fe9-233b-4e79-89af-834c43ca79af@linaro.org>
Date: Tue, 7 Apr 2026 23:14:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 18/21] target/arm/tcg/translate.c: replace
 translator_ldl_swap with translator_ldl_end
Content-Language: en-US
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, jim.macarthur@linaro.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20260407195922.196410-1-pierrick.bouvier@linaro.org>
 <20260407195922.196410-19-pierrick.bouvier@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260407195922.196410-19-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/tcg/translate.c | 11 +++++------
>   1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
> index 20f5bdcbe2c..c432de2a268 100644
> --- a/target/arm/tcg/translate.c
> +++ b/target/arm/tcg/translate.c
> @@ -6284,14 +6284,13 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
>   static uint16_t arm_lduw_code(CPUARMState *env, DisasContextBase* s,
>                                 target_ulong addr, bool sctlr_b)
>   {
> -#ifndef CONFIG_USER_ONLY
> -    /* In big-endian (BE32) mode, adjacent Thumb instructions have been swapped
> -       within each word.  Undo that now.  */
> +    MemOp end = MO_LE;
>       if (sctlr_b) {
> +        /* In BE32 mode, adjacent Thumb instructions are swapped. */
>           addr ^= 2;
> +        end = MO_BE;
>       }
> -#endif
> -    return translator_lduw_swap(env, s, addr, bswap_code(sctlr_b));
> +    return translator_lduw_end(env, s, addr, end);

Great, this removes the last translator_lduw_swap() use \o/

And a lot of complexity is removed :~)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


