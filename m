Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1D371093168
	for <qemu-arm@archiver.kernel.org>; Fri, 20 Mar 2026 02:59:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w3Q4Q-00067H-Fm; Thu, 19 Mar 2026 22:58:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1w3Q4O-00066Q-6U
 for qemu-arm@nongnu.org; Thu, 19 Mar 2026 22:58:40 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1w3Q4M-00012G-G8
 for qemu-arm@nongnu.org; Thu, 19 Mar 2026 22:58:39 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-2b056b7f783so7583525ad.1
 for <qemu-arm@nongnu.org>; Thu, 19 Mar 2026 19:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773975517; x=1774580317; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Z5SvTX3VRqAYRS2DN3kXBkguLjeK6qqREEbgUZ9bFnI=;
 b=SX/ltNX8fMaW1yHZhHQ9XT1zoik+Xlvp47oDHZPQ0ob97IbyifUlLhowXGRAnzO8Cv
 p2stlLlYkgUFWn9GKv5GbjSI/CZF7GqNXnSdXlEJtYIV/L6lNgUW9xm6DtLVpI8b0CAt
 5L6PcLY6acoT6acsmIy2nTw2Okst0jxQaZlPukIHYVPElfiuO36uMs/2sd1YXovLHILU
 n1Tua4GXx2wMuPrX82upVSAMYwX9kTi+uhimXZJOrBLIWnRRGq27lmj9wtAszTROTs2E
 7lAgYIsbk3y7JLBPcAdtRIFeB9oaXbKjq5j3g4VRHFgg+sHT+ciYh1FaEd7xOKHhNpGw
 To4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773975517; x=1774580317;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Z5SvTX3VRqAYRS2DN3kXBkguLjeK6qqREEbgUZ9bFnI=;
 b=OJ3PMqWHhF1yXfUshz3zE8UozXBKr4Xuet0XU/ftdu3HUjTsNxO0Y8foI712ypx+cz
 hqMeHUPDcMdEiSMUKg/FzEkYIZ8yP+aTuik0Qvaqqd0j9EQiGMPTXptf/U5nDPZLt6AD
 J20qd3z0WpwfPPRsx2MS5FOqsayqZEqD87lE1YNiJQEsqucwicrnQWadEgfHibfWY/08
 V3tf2roxTz258XO52k9E3ZcAgXfBeW5yEoZRpjRkRQL84yTflpCM3xZkMozB1cW7kk7c
 XdWPkEImtK/Bf0GjdkgY+BCCziXo1QNozP1HLUj45ugBdJzP1QJKv1UdEhlIFWowOsnc
 M0VA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPa/3y4diQ7pe0Cq0n5UZRdIcVnhHpQuODqPm57hggPsW2jXbVjoARH4oKDAbJCoXwkpe1JxHhbA==@nongnu.org
X-Gm-Message-State: AOJu0YxDNd146cTwpuDmwSQBcZfOyAzvmGtGdDuH53q1HHDRHK7SBfEk
 YZncSSv9gxj9dwJDtYqWXg1Pp3ctguLc5KZcfWAMhBJPfLywwOwpwi/k1sBojlmRkuA=
X-Gm-Gg: ATEYQzyHMS/Vxlw+OQmWvxe6YaqgRPwya89rt9stCuVcn6+Qp9jAGsdJGRhRJerBPRq
 9TZAWpTjOctqGrlUZO+E18OuzD0IABkA8WNPO8bUzpYY0s7qDquJdvL1pHkuMS8FmOwpLCjq4rj
 nyXn3T13pQSJdwtm2+Ud6edd74Q13grDs953o5/qCy9jRfY46F+lHkcpJ/2vgBlqwQWZUK/cL+d
 5ph7Ywgo9pAHnfgsYly5mIGr4qKKZDJffy6IUhnSfTYXQzSUs8NKakyDY2t7WFglsP/BzXm/mmb
 NpizaR4Cx7e8mNe/NhmuB48ANlwuOwtOS2IkoU21IbXhBgmhYw0adot+iAgIxAvIzJDpLrHFV2H
 S98fj5hUV5nqePE18CfrLGhJP6Uie0Qx6UZuGkVP944dYlE+0royO1dKU5X4fxU5Gbsgu1Z2rkP
 BaztYWj3oqUVApcWyaw+ZIV6ND4LswMa25F9mc/Z7BQR3dRw==
X-Received: by 2002:a17:902:ceca:b0:2b0:4d7d:fb9a with SMTP id
 d9443c01a7336-2b0828642abmr11954525ad.26.1773975516735; 
 Thu, 19 Mar 2026 19:58:36 -0700 (PDT)
Received: from [10.5.0.209] ([114.23.167.13]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b08369617dsm6970715ad.71.2026.03.19.19.58.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Mar 2026 19:58:36 -0700 (PDT)
Message-ID: <1ab57650-a410-4796-b7d1-b193a48e2c4b@linaro.org>
Date: Fri, 20 Mar 2026 15:58:30 +1300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/84] target/arm: Skip AF and DB updates for
 AccessType_AT
To: Zenghui Yu <zenghui.yu@linux.dev>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
References: <20250830054128.448363-1-richard.henderson@linaro.org>
 <20250830054128.448363-9-richard.henderson@linaro.org>
 <c805cd6f-e69c-4cf1-8773-0a45bfb677f8@linux.dev>
 <a865e4fc-04a9-42d3-9793-f1d7242565b0@linaro.org>
 <d99e9f3d-509f-4531-b45a-db33902778f0@linux.dev>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <d99e9f3d-509f-4531-b45a-db33902778f0@linux.dev>
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

On 3/16/26 04:14, Zenghui Yu wrote:
> Hi Richard,
> 
> On 2/27/26 11:01 AM, Richard Henderson wrote:
>> On 2/27/26 04:12, Zenghui Yu wrote:
>>>> +    /*
>>>> +     * For AccessType_AT, DB is not updated (AArch64.SetDirtyFlag),
>>>> +     * and it is IMPLEMENTATION DEFINED whether AF is updated
>>>> +     * (AArch64.SetAccessFlag; qemu chooses to not update).
>>>> +     */
>>>> +    if (likely(!ptw->in_at)) {
>>>>            /*
>>>>             * Access flag.
>>>>             * If HA is enabled, prepare to update the descriptor below.
>>>
>>> |            * Otherwise, pass the access fault on to software.
>>> |            */
>>> |           if (!(descriptor & (1 << 10))) {
>>> |               if (param.ha) {
>>> |                   new_descriptor |= 1 << 10; /* AF */
>>> |               } else {
>>> |                   fi->type = ARMFault_AccessFlag;
>>> |                   goto do_fault;
>>>
>>> This also skips the access flag fault which could be generated by an AT
>>> instruction. Is this an expected change?
>>
>> Yes.  As mentioned right there in the comment, the access flag fault is
>> IMPLEMENTATION DEFINED.
> 
> The comment says that "it is IMPLEMENTATION DEFINED whether AF is
> updated" which matches R_XQSMX. I'm fine with it.
> 
> I was concerning about whether an access flag fault should be generated
> by the AT instruction, if !param.ha. Could you please point out the
> description in the specification regarding "the access flag fault is
> IMPLEMENTATION DEFINED"?

You're right; there are only 4 exceptions that are to be passed on listed in J1.1.3.10 
AArch64.AT.


r~

