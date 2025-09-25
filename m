Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E4F9CAC5B9
	for <qemu-arm@archiver.kernel.org>; Thu, 25 Sep 2025 19:20:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v1rVl-00045D-QC; Thu, 25 Sep 2025 15:20:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v1rVj-00042X-7M
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 15:20:12 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v1rVa-0005gk-7V
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 15:20:09 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-7761b83fd01so1427156b3a.3
 for <qemu-arm@nongnu.org>; Thu, 25 Sep 2025 12:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758827993; x=1759432793; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=s8YRoxuHX85uA3mGLtSauCk7RP3VWwFPGCJP4JBrhls=;
 b=erDYmA/522LJ8pLlx3nzVk8qNAg8QD/01mmxRxaJVQ17oadkERpJ8G+cho+sQG/Zs5
 a2erZgh6juh01By59ftBoK3ya7+g0TeElwODPflMP10hWzMdQzWcU3aeDS1nEV2KB0HP
 r7SBpHH9UQL+wBS1j96xXPWg7eIe7ZQr9NYR/l4kV5XWM0aStu8lKySCsgtROfvdiQtb
 BxN16omvYYxJa9ksweyRmU1eu0jz9rrdDdm79GA3qRkc3RQ7q41euPKyi/JDwbFhPgyW
 XPlq3cGwJn4NNeQsA3RRPtCy5IRce3HjLSFmxoD2qOxzLUB2D8mmQ2r6LX9BtUx3zY2J
 pcgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758827993; x=1759432793;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=s8YRoxuHX85uA3mGLtSauCk7RP3VWwFPGCJP4JBrhls=;
 b=kgi5xmxrz4h70gUaXRZ1wkvm/dxSRx3O1xSjl+Q90jJCjj8JaEbwd6nrGrvh6mz+cG
 MnOaRA83hjRRBQ0fIrtNNhBL5rQdKvUict5KZf1yecvl8iSpFYvfzsMvwWXNpBLh4UF3
 XNKWOAKVU8T6e1yM+JFx6IpYVeVSmxMBCIY8znBhwQe77RklDLnNIi2lFZrBJz39MzKn
 Rh9rVD6onzEFzigWD2q8B+LeihHL4SLOM0iiilPsEuVDhpGnGPmHJtoCp7s3bOQXn8Gw
 Ftuk2KNtAjYfllzgQkfqZ1W3+tFCie+79Pstcd1lkmf+xEH8vuM0U5zRODEaQiIHaZ/Z
 e/JQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUx6O+XU2mCeoLigIMpFNibV9OYiSaeYZgxv3hufGqEST04lYMq6/Jlpt5UdLUeBwZd86yLjvsbnA==@nongnu.org
X-Gm-Message-State: AOJu0YzDutmhuQFLaGjw/p8NzOpymhWKdUEdlFHlPlAvB2MmeO7kEkww
 4SD4xcM0TgiM5CMrktrF/AixUhUh4YTxpqDLqQ385zZ3ohRV+XydS4zqafE6HqnK5Is=
X-Gm-Gg: ASbGncuC4CPqBIsTi8ho5ooXAIfd2y8qoJUOnK6pm4aClv8u+eFgwPQyFGPbbp0y5w2
 OAMw13lOeRxgu4zqSr27G/iefmj1X59S6ofvicM0hZVkXNM4t4zWYoPEnO3MCLrFz4kA7r/OGMS
 L11BiYfbwEEnQBqxENFJhqgXVkjL08FoZvfyCnIIrmqYP+lxA6SaK4gstUUS1VyvP9Tjp8/7LKq
 VFHhXnzjLpddwSLzE3CulUmarNEkFIFhrBMlkfaF7CY94vKsunB1var/dGXPmB168c62gtbG9Dd
 5Kt8SqXUES8/9wDQTXrbbUsFq94FUIRbRIAjl1pzQ2+LPwCGN3RfyFHdxtIYgVCk6qXCc/q8diJ
 wE5w0BpAYaR0O8vDo2ulEny03f4/OgJStoK6q
X-Google-Smtp-Source: AGHT+IE1OJCqkcN45FybII8oBIGuWAJjjwqHJmaFX9bdLgeewJVLY/9WVylsS21389QF1tN5FYyVFQ==
X-Received: by 2002:a05:6a20:7349:b0:2cb:5f15:ebf3 with SMTP id
 adf61e73a8af0-2e7d0daec75mr6195548637.44.1758827993217; 
 Thu, 25 Sep 2025 12:19:53 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.157.132])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-78102c06981sm2543040b3a.72.2025.09.25.12.19.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Sep 2025 12:19:52 -0700 (PDT)
Message-ID: <922f7912-7255-4a36-a5f7-669dffc964e8@linaro.org>
Date: Thu, 25 Sep 2025 12:19:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/arm: Replace magic GIC values by proper definitions
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20250925032151.73250-1-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20250925032151.73250-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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

On 9/24/25 20:21, Philippe Mathieu-Daudé wrote:
> Prefer the FIELD_DP64() macro and self-describing GIC
> definitions over magic values.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/arm/helper.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index c44294711f8..da8aa7b9d08 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -5184,7 +5184,7 @@ static uint64_t id_pfr1_read(CPUARMState *env, const ARMCPRegInfo *ri)
>       uint64_t pfr1 = GET_IDREG(&cpu->isar, ID_PFR1);
>   
>       if (env->gicv3state) {
> -        pfr1 |= 1 << 28;
> +        pfr1 = FIELD_DP64(pfr1, ID_PFR1, GIC, 1);
>       }
>       return pfr1;
>   }
> @@ -5195,7 +5195,7 @@ static uint64_t id_aa64pfr0_read(CPUARMState *env, const ARMCPRegInfo *ri)
>       uint64_t pfr0 = GET_IDREG(&cpu->isar, ID_AA64PFR0);
>   
>       if (env->gicv3state) {
> -        pfr0 |= 1 << 24;
> +        pfr0 = FIELD_DP64(pfr0, ID_AA64PFR0, GIC, 1);
>       }
>       return pfr0;
>   }

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

