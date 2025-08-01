Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9300CC87FCB
	for <qemu-arm@archiver.kernel.org>; Fri,  1 Aug 2025 17:55:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhtyA-0001Ou-54; Fri, 01 Aug 2025 13:55:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhsNa-0000Co-H4
 for qemu-arm@nongnu.org; Fri, 01 Aug 2025 12:13:22 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhsNO-00057R-7p
 for qemu-arm@nongnu.org; Fri, 01 Aug 2025 12:13:00 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-76be8e4b59aso298107b3a.1
 for <qemu-arm@nongnu.org>; Fri, 01 Aug 2025 09:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754064770; x=1754669570; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4PHzoYA8pEQEJwj//UB0AA8A8NFrzYjmx+dL15MB8kI=;
 b=JwdNm078oX4H6X68lCLOUJjPImC0h7xMt26StwyeaNd46WVtBynaZNOBjt1KPdhRDd
 xY+dn6hlr9ebVNuO8KRgJ/xhiwZUVDQmYqpE5JbvQjtX6qokaWF94EEv+8s8p8a0RRLu
 XU9M4pIQpg7Mmnv7mfe8BLKg6L3crcZv/1KAUSPPAXEJOz7KHyvLyT9KGp9Jh/2f5A38
 aXZH2Ci/y0/1uCDyiFt4o7HoOUmzfPDyjyacsQ5CdDCIg+mr4X7iC/EnuEKtGNnZTPWF
 QS9/SeXMqOPzmhmO8IGvAYRrMnkv9NdkAxigH9Bdya5kMwVKB3UvTMMK09+g6sdHxESO
 EyXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754064770; x=1754669570;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4PHzoYA8pEQEJwj//UB0AA8A8NFrzYjmx+dL15MB8kI=;
 b=wIouKx4W8DLdtB2KBk+4oJDmgBJqpptT1QOWH3MlmHIAO5zSaoOI2dYiAy3GtKxANa
 rwwwQHGsJGhIYGCcPHTcEjF0ttaZ0BPGPJe45FXUVdVfEMaXa0DfcHbyl2UyfKLhA7Z/
 HrqY2nqgXcuyEGZfUROJ2xgp1DXxbRwlqYuhRyfiN5ANAAYM0lJnhBCyd+oucDPFC9d8
 ALI6U0JFs8QyxpXuTGWpaqK6wbRTg8M00EuLf5ROaSnbLNrxWkso5w+0doKMDMAyRVGU
 j7JgrQyiLRwaprXk8k95LRdJvZP42tCJpV2aAml5kx00Qp6CvIKyIdgGQZha0leZLTTJ
 8pIA==
X-Gm-Message-State: AOJu0Yx4GBrkolV7z0x1QgesbH55vHGxG3VXcNR7iDTh0cjmHZwRb42y
 A5L11keuJfpBaBbO4jui3Mt4XRt37jH6gGYxHFgvOlcLvpCB2ASE/hexsU+A90DvFGI=
X-Gm-Gg: ASbGnctCNiHLO3cnIhQPsAAjWdpDOSCKeJ7vyafEDPLZfKmkOK+cCFJ33g73y1d4QlA
 LmnC17FU7vliWeQV3Mq8MXr5bWeh4dD1I5dKva6+SgBNaIzOO4Lr1Lg//Fh+x5a/26vZVqwn20E
 2fM40zY8oRnzuqRZfxloWZs1PKuhUP/GTUjLHToFrIByWC2fSwW3+t0RAEcDxFniigK4mT7HOOX
 ts6Sy3AAnuwzh5bfCJQ0tal0slGcLOfl0XgRS2i08GneTNmWl8IaZE/emFKDmv/DjU81ksys+Uo
 6xmGzKuCzjCi6VHmr/6aSH71KdPuV4mOrTwuyA5iuXQ6TOK3ouTbuFKSVESXCwC9vceu7KOaoLP
 cttdULDvqchUjJRbpCwyP/l3eC5rwWgHdLAY=
X-Google-Smtp-Source: AGHT+IHzwF0gWc4ga/PlWzuIDnLZpSK7fGNkv2vOddbB3XUAM4XUsi0nvsT1ge++3HtfW0atlb/HAA==
X-Received: by 2002:a05:6300:218e:b0:23d:e202:1abd with SMTP id
 adf61e73a8af0-23df9127e62mr253348637.34.1754064770425; 
 Fri, 01 Aug 2025 09:12:50 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b422bafcce2sm4035567a12.52.2025.08.01.09.12.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Aug 2025 09:12:49 -0700 (PDT)
Message-ID: <afb60f16-5ed1-4612-ba78-d849d9fa3998@linaro.org>
Date: Fri, 1 Aug 2025 09:12:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 47/82] target/arm: Expand pstate to 64 bits
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20250727080254.83840-1-richard.henderson@linaro.org>
 <20250727080254.83840-48-richard.henderson@linaro.org>
 <b2e40787-6043-4d4c-9cbb-731d0e92e25c@linaro.org>
 <f398a65b-7b1f-492d-a612-eb3d6322ae4a@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <f398a65b-7b1f-492d-a612-eb3d6322ae4a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x42e.google.com
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

On 7/31/25 9:29 PM, Richard Henderson wrote:
> On 8/1/25 05:13, Pierrick Bouvier wrote:
>>> diff --git a/target/arm/tcg/helper-a64.c b/target/arm/tcg/helper-a64.c
>>> index 71c6c44ee8..f61adf1f80 100644
>>> --- a/target/arm/tcg/helper-a64.c
>>> +++ b/target/arm/tcg/helper-a64.c
>>> @@ -639,7 +639,7 @@ void HELPER(exception_return)(CPUARMState *env, uint64_t new_pc)
>>>        ARMCPU *cpu = env_archcpu(env);
>>>        int cur_el = arm_current_el(env);
>>>        unsigned int spsr_idx = aarch64_banked_spsr_index(cur_el);
>>> -    uint32_t spsr = env->banked_spsr[spsr_idx];
>>> +    uint64_t spsr = env->banked_spsr[spsr_idx];
>>>        int new_el;
>>>        bool return_to_aa64 = (spsr & PSTATE_nRW) == 0;
>>
>> Would that be better or worse to simply save the upper 32 bits, considering that cpsr
>> already holds the lower ones in Aarch64 mode?
> 
> I don't understand this comment.
> 
> (1) banked_spsr[] is already uint64_t
> (2) SPSR_ELx is supposed to be uint64_t
> (3) We were accidentally dropping the high bits of spsr here
>       because the local variable had the wrong type, before it
>       gets sent to pstate_write().
>

My comment was related to vmstate_pstate64. Sorry it was confusing as I 
left the last change concerning helper-a64.c, which was not related at all.

So the comment was that vmstate_cpsr already contains the lower 32 bits 
of pstate, and thus we could save only the upper part in the new field.

> 
> r~


