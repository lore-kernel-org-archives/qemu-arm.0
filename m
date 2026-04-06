Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ABE2FB5177
	for <qemu-arm@archiver.kernel.org>; Mon,  6 Apr 2026 22:44:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w9sgT-0000DD-Q1; Mon, 06 Apr 2026 18:44:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1w9sgP-0000CQ-WC
 for qemu-arm@nongnu.org; Mon, 06 Apr 2026 18:44:38 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1w9sgN-0002fg-33
 for qemu-arm@nongnu.org; Mon, 06 Apr 2026 18:44:36 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-2b24fede2acso24241205ad.3
 for <qemu-arm@nongnu.org>; Mon, 06 Apr 2026 15:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775515473; x=1776120273; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zvXhDjYnYtVNwbnXjtKNimWnxYsLtxLlAw52HESpNFc=;
 b=UPtFBFEB3KqXf8XQuYZ2HZTj7uEDDEFhisW7xvvIJcU3lhGlN86AEe6esHqNMYVY72
 DM2pKW61PZ8rgYUDHkDDKKOu6Be0yI3XiAuZLYPiDg8ESMJkACGy0CN8d0psUnPMlDB0
 hCYUqIDGSAsiJ8veYKgT0kudwH79jPm4KK1GtIIdgOqOXx05nBDtJHtyPJY9Bdi6Vi8c
 beEqc6ZEW7fhskSYJKIGDkRI5bNeRxMICcLhshn+L6RBiv3Hy50r0kL9oOtlPQ7O6yzu
 kFyGmOdhKVMziKGm/4KJLuaa0/dIQjnrdEh/X16IzBh4W6BqBBz1LOO0uHytmbt0su7F
 9G3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775515473; x=1776120273;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zvXhDjYnYtVNwbnXjtKNimWnxYsLtxLlAw52HESpNFc=;
 b=htEl5mSBqxIjkcrp87HWDVm0wC8sv8Lh0YlQIox6e7OgMvaBofcYYSFm6/UMKG03c0
 vpockX4PV6BnXth80nUUULVIjBR1oHENG66m8Zv8pkbJbWuw8utj8mwg0ioqVRuZP24V
 o3GUQex0uEkAiEn4ndPXSszq2i6H/tZsH2jEzZ0MMlNUhII0ZnTFdemy5pCr7j+/Lqkj
 BVg7kbItZwXSplbVuyvvQ4HMXOqNbaSgmQ0QfASKwA3epOFuIcUZbypghhmJpt6taPds
 PoKOCD0T1KwQoBHOESRprou34wnB+J2tXRzJK/ZGS77EnvuHRPQCmpibrYIWrZTnxqLE
 Enwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgXRT6UdZZSb5WLz+Vig2lmlHeZZ9ZoOwncmQCSBAYkHVHE96tJOuDpeDbLFWj08OXWk5WPL31VQ==@nongnu.org
X-Gm-Message-State: AOJu0Yy2Yf8zinSSSCTvdRVGYeQmv8iTsfXLcaSjRTA/tE6pOXlIGzsF
 2Rs0In0ii2IoAsm88+NkMQPgD+LlolrMWuqudnzX+XotvEuCBJPNB96r0XDx0BJGnEU=
X-Gm-Gg: AeBDieuj7YvHAXK1UqEbZUzodPyinjoJrqQOqk7FgM8sTgClg1Oo/AUn2mmPg9RnO6b
 /9FvwB+vocd98iKKJivDuqNBzFGqcuBr3AXr0Wn+MdfNOFyp2Hv89lP0fEXYydpKum7QBxeURod
 QeyXdypJ3zIFlZhZDswKmF74FyM3T4aqGdceGfnRz2uELlQ3fle+k6rHkSiluijcN9vEJUGJxfV
 INUfK4UhBO6dhJxa/g0yfI2dES1j36Wd8pqyeL4dMMJkBLM01xpwza9ihaSL9CPo1RelElfwS0n
 LsyzhZPoBHQbg0/a9LU+cJNBxu7RtVDdQeu07g/+e4xCjWfOd8oUkC8k6V5MfwFPSDlcBrWxl5X
 gM+qHRpbkPov2EbNb0f+dS/UgJfNTt9E8VCejuxI/nYMMQIsPqA49EPKY7/+Oi7azJ0VmOHrjQq
 Mfcak1TIKC8UUhJ5bzGLQ2+m3x0PRvtNI2623dJrf1z2S2kw7yUOdtS8rLj1haK7JOkTQ=
X-Received: by 2002:a17:903:1ac3:b0:2b0:673a:7c85 with SMTP id
 d9443c01a7336-2b2818ee1f6mr145864265ad.37.1775515473404; 
 Mon, 06 Apr 2026 15:44:33 -0700 (PDT)
Received: from [192.168.1.105] (124-150-69-109.tpgi.com.au. [124.150.69.109])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b274735633sm152962945ad.6.2026.04.06.15.44.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Apr 2026 15:44:33 -0700 (PDT)
Message-ID: <8e3bcc46-abe2-431b-8fb5-e6d5d8bd0e10@linaro.org>
Date: Tue, 7 Apr 2026 08:44:26 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 18/20] target/arm/tcg/translate.c: remove target_ulong
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, jim.macarthur@linaro.org,
 Paolo Bonzini <pbonzini@redhat.com>, philmd@linaro.org, qemu-arm@nongnu.org
References: <20260406182609.193886-1-pierrick.bouvier@linaro.org>
 <20260406182609.193886-19-pierrick.bouvier@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260406182609.193886-19-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
> We can replace it with uint32_t, because we know it's limited to 32-bit
> target.
> 
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/tcg/translate.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

> 
> diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
> index 68f050746d4..aea38507ef4 100644
> --- a/target/arm/tcg/translate.c
> +++ b/target/arm/tcg/translate.c
> @@ -6288,7 +6288,7 @@ static MemOp arm_memop_endian_swap(bool sctlr_b)
>   
>   /* Ditto, for a halfword (Thumb) instruction */
>   static inline uint16_t arm_lduw_code(CPUARMState *env, DisasContextBase* s,
> -                                     target_ulong addr, bool sctlr_b)
> +                                     uint32_t addr, bool sctlr_b)
>   {
>   #ifndef CONFIG_USER_ONLY
>       /* In big-endian (BE32) mode, adjacent Thumb instructions have been swapped
> @@ -6536,7 +6536,7 @@ static void arm_post_translate_insn(DisasContext *dc)
>   
>   /* Load an instruction and return it in the standard little-endian order */
>   static inline uint32_t arm_ldl_code(CPUARMState *env, DisasContextBase *s,
> -                                    target_ulong addr, bool sctlr_b)
> +                                    uint32_t addr, bool sctlr_b)
>   {
>       return translator_ldl_end(env, s, addr, arm_memop_endian_swap(sctlr_b));
>   }


