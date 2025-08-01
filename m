Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D4D0C87FD2
	for <qemu-arm@archiver.kernel.org>; Fri,  1 Aug 2025 01:41:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhelz-0004CS-8S; Thu, 31 Jul 2025 21:41:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhekU-0001On-KB
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 21:40:02 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhekS-0000s7-PH
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 21:39:54 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-31eb75f4ce1so1404102a91.3
 for <qemu-arm@nongnu.org>; Thu, 31 Jul 2025 18:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754012391; x=1754617191; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=d5s94bG7WyiNqIEKHah44b8TSZ60Zcg4W/p9g00ipTU=;
 b=i2wZCHySeHch2A623hXAsT7KcV1RBibBqSX5s2erMlUk3wNvGS5wNCxGpWyUs5aCTL
 qPWKCq+t/m/9/EfBhYMvsy2rSg0QlR1hOnjZdcmsnG8l1p8JN23TCmJ+P6GG0bXeU9/P
 ugcbFr0SWKto767x+Mq4CiQmH8T1FBW+LQex+sMnbietVkbjug79lUZ0OcJDWxDuBl/2
 K/+Es1jq6jDry7svLUuHM8yfEbOdxtYnwbeU3y4TjUtypvPHRkk0wV2vtp0IdONM3pFc
 FhbKPXDeR3oHkEF79BfMCcUK348cu5EZ6kneoZCRh8Sqa23COwsva4AXiM+A+oBrGfyQ
 Swdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754012391; x=1754617191;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=d5s94bG7WyiNqIEKHah44b8TSZ60Zcg4W/p9g00ipTU=;
 b=FCwlonRZRRuIVynyuNlTeTpDKOtDfsQ0YRXqJXajrMoAjHKb9TixMljx61SqjWNPJ1
 NLaThxioIW8+j7CxeP47fvpaoK0EpFVVV4fpHpvN+lEm4AIh1JqR4sm6eUECVlNAh8DA
 v99hsESgfDFxRqPzqqEQj1WMZAtqc+WpO7OYi5318s8q/F7mMWxxIq+8CUckyPhawZLB
 IWAen6lizrITLaQCpNwYJSPaFoLYqbyyWj9dHwrFeaL9AF9LBUZ5Bq6ulV6zXV/xwD08
 XzYUkZJTfEdch2jKf/ODW9z+MF2GJUCed0+tM7hezuhVRLNCmNK+ZeyEXLeb1/YgtuZO
 /pFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1X0vdtL2kNcd6uJLDKrjKfr9+TMFERjO+FAf7nset91sLqlof7R+9snCxhZW9LEymj2PhhHMDzA==@nongnu.org
X-Gm-Message-State: AOJu0Yza8KLsRWcjwgv/aZolyi2dZF/QhlWILLi8pOtIaRGtJXp+iNB3
 Hf9VSsdV3fjZnXkZpAnvH3AuWu8avcjWaUbXbY8FMQWgCsuSIt6PaNQKcGFbUOsKqLo=
X-Gm-Gg: ASbGncsNRqwFVDdJi0vUlL9fhQJRHib6VbH07LZnjWKUjMIcgff4j7+3pUyuHxX8Y9x
 eZqavDtfHTYuqU0djjYNHY9LSicF1XEsdx51kqKZTUunVGn6jExK9OKBYbReOK/pjTPaqCVWk/3
 wUBtXDJAG1AtrmWxoUu+YrYeGKI13Z+mWc5oed0Uv2rh4XNShte9/zF1wUopYKnrdUU5zIraoPd
 VI3ItRJf0Vuo56jecp+1+oqgd3qatRwGIdT1E0svLxIp0TkgHIOhKboMC5k6UTBblYgY9wm9/nS
 F7MuZJNsjm8kg1nFYsgHqTOr4/txJfdNLBxLFCUkL3LP2ADCGQuifKq8PQy9CVqcilYzoaTH+da
 BYowhX+GCWVW0ThowbdC5IfxegVSU3ayOkv0=
X-Google-Smtp-Source: AGHT+IESnb49fqYI/m5f/oDCSY8nLrWl78F5neFQ6hQ4qpikry5Gt6sxgXvDcRvbSpMBhdoB7+xATA==
X-Received: by 2002:a17:90b:4cc1:b0:311:c93b:3ca2 with SMTP id
 98e67ed59e1d1-31f5dd88646mr12036854a91.6.1754012391088; 
 Thu, 31 Jul 2025 18:39:51 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31f63da602asm5904934a91.2.2025.07.31.18.39.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 18:39:50 -0700 (PDT)
Message-ID: <ba7bbf85-139a-4268-b358-6bfa1a034328@linaro.org>
Date: Thu, 31 Jul 2025 18:39:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/10] semihosting/arm-compat-semi: replace target_long
 with int64_t
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>, philmd@linaro.org,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>
References: <20250730220621.1142496-1-pierrick.bouvier@linaro.org>
 <20250730220621.1142496-9-pierrick.bouvier@linaro.org>
 <8658920e-34ff-4aba-b412-92d06b29fe5b@linaro.org>
Content-Language: en-US
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <8658920e-34ff-4aba-b412-92d06b29fe5b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x1031.google.com
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

On 7/31/25 6:25 PM, Richard Henderson wrote:
> On 7/31/25 08:06, Pierrick Bouvier wrote:
>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>> ---
>>    semihosting/arm-compat-semi.c | 2 +-
>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
>> index e3b520631b3..715a22528ab 100644
>> --- a/semihosting/arm-compat-semi.c
>> +++ b/semihosting/arm-compat-semi.c
>> @@ -502,7 +502,7 @@ void do_common_semihosting(CPUState *cs)
>>    
>>        case TARGET_SYS_ISERROR:
>>            GET_ARG(0);
>> -        common_semi_set_ret(cs, (target_long)arg0 < 0);
>> +        common_semi_set_ret(cs, (int64_t)arg0 < 0);
>>            break;
>>    
>>        case TARGET_SYS_ISTTY:
> 
> Here we have a semantic change.  For 32-bit, we used get_user_u32, so this will always
> return false.
> 

Right... I'll add the intermediate missing cast based on 
is_64bit_semihosting(env).

Thanks,
Pierrick

> 
> r~


