Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16F2FC87FD2
	for <qemu-arm@archiver.kernel.org>; Fri,  1 Aug 2025 01:42:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhenA-0005mG-7n; Thu, 31 Jul 2025 21:42:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhekp-0001lY-TD
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 21:40:16 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhekn-00018e-N3
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 21:40:15 -0400
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-76bd6e84eddso1212181b3a.0
 for <qemu-arm@nongnu.org>; Thu, 31 Jul 2025 18:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754012412; x=1754617212; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ye5hpRNxeghqWQrxXm1r6vsgWr11gO5dChXwYTAC8gw=;
 b=gjdtrYtEs3AASDMnNZKkrIkRSpHhfY9eKmphHykENUsLW6f1InMQ1O226mgId7+/r7
 78a4vglJMnbKgoZk/3c2khi5xN2KjEb1JTeLzVIACmq2TXBrON1iWmxLsAsTXJiyJL4N
 Lbvr8t15wu2qY2996bqtQAtPuPmGGMkdYe1PvrAKnNO3/Qb1RWm3+MKkFk957LZKxfEY
 QxqhxybR7dzDcYANVhom+Tp5Nje072xXsLYZx6a5aLBpmEaShE6htngEORC86pLVHUK9
 1ioPbZwZWKXizluJWqpHCvg5nuTKN4ds8sKcZQqQFbBMUQaJ+DlVAYGsWrtM3sjRTvVZ
 mxRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754012412; x=1754617212;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ye5hpRNxeghqWQrxXm1r6vsgWr11gO5dChXwYTAC8gw=;
 b=Gnm7qM5RyHqZ5f4tIeQAPzxYJ7J5M2DsFw+KLGUuaeCKmtawmU4x60k8lma9PBGHG/
 Q2GVPCZGfQ0MHRmsoHulXnG0QdVPJY1u8y5wxgCX213KmyifOqAdgABdHsirtBj7fnlO
 8nNfE8gG3Mq4KGVc/KTTNeoVPj3ZNLKgaWJiSy3cSO7BEh6Xql2c7/VkMaJeCLy0H2eP
 H8T1eliCqGoxJKUnVSJC/bxrBFpWoZiRg4MRIY3xWFg9aFKLvah8DyfTh06dCOiI9kz9
 dmsf/hxGAviPSn5hvR+SS1HxbpMMxuUTSHw6HpmoCfm7+pNy0AOL9mw+yaa3m6ocsK90
 aelg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoH0s7u+uBliFAh2zLgyUVcrWeOWzBfdZNK10CWtmgehA7mwHLFqRzmPCZiME1UU1WuzcDcINpbQ==@nongnu.org
X-Gm-Message-State: AOJu0YzKcW/rs0R9oTNDuiNZ3DC8ZZ8D2XquB2feh6zuMowlQrfP7OaC
 ZS4p1JCILbtQ/S25xfIE2hew83DKvKni5V+nG5WbDB/i9/IGE/8QlL4EVi4PjK+cDQo=
X-Gm-Gg: ASbGncsvd/URiuEQfYRh081wzBznBgMhxsepMspAptpNyFuit02mDtNSEhOlnQnFxxJ
 e/lGTuIhD1mJu7CnJNH3qvXNkoz4GUW+3nullcij6Kwt61upVGsntVBnoqjR2VH455JnwpPUaQe
 4F6JGtiKQdLJYN3A+cDfJaEMLlYM5zXLH66RDPcpwC+Hs6QF59/yWCaCo+kSoPXIk06l0rwayIy
 9+hYd6Ek7/pIDGQDiW+O78FWnRUVj42F2AHc6Mi1OOsYaXmvqjEuB8p/5riu4S7FZs3JugTe8YO
 NoFXZWbj2bR2xM5rDp28Vj5QydOYY6XERLgpA91ZuxAGKvd22iohNUYG9TllpUZw/G6XSuuQWU9
 ZwuB53qmHkIHd+Et9vgEnMpry20Uf97Amm+2eYCBRzKaVzg==
X-Google-Smtp-Source: AGHT+IHdelnKGLrIEmWoUUNaZIsBmvi4pgxb8er7ETiIwl0K4lk+RLx0UzL9m/pNrm9mDn3Nrq5+IA==
X-Received: by 2002:a05:6a20:7346:b0:23d:ac50:333e with SMTP id
 adf61e73a8af0-23de8226dfdmr1273624637.43.1754012412007; 
 Thu, 31 Jul 2025 18:40:12 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bcce8f9b3sm2663859b3a.38.2025.07.31.18.40.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 18:40:11 -0700 (PDT)
Message-ID: <02748c9e-38f0-4b2e-a7d0-c697cf860e67@linaro.org>
Date: Thu, 31 Jul 2025 18:40:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/10] semihosting/arm-compat-semi: replace target_ulong
 with uint64_t
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>, philmd@linaro.org,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>
References: <20250730220621.1142496-1-pierrick.bouvier@linaro.org>
 <20250730220621.1142496-8-pierrick.bouvier@linaro.org>
 <311fb2d2-b8b2-4b1d-aea6-429fe55f8217@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <311fb2d2-b8b2-4b1d-aea6-429fe55f8217@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x430.google.com
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

On 7/31/25 4:33 PM, Richard Henderson wrote:
> On 7/31/25 08:06, Pierrick Bouvier wrote:
>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>> ---
>>    semihosting/arm-compat-semi.c | 24 ++++++++++++------------
>>    1 file changed, 12 insertions(+), 12 deletions(-)
>>
>> diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
>> index e5a665d604b..e3b520631b3 100644
>> --- a/semihosting/arm-compat-semi.c
>> +++ b/semihosting/arm-compat-semi.c
>> @@ -123,7 +123,7 @@ GuestFD console_out_gf;
>>     */
>>    
>>    typedef struct LayoutInfo {
>> -    target_ulong rambase;
>> +    uint64_t rambase;
> 
> vaddr.
> 
> 
>> @@ -300,9 +300,9 @@ static void common_semi_seek_cb(CPUState *cs, uint64_t ret, int err)
>>     * is defined by GDB's remote protocol and is not target-specific.)
>>     * We put this on the guest's stack just below SP.
>>     */
>> -static target_ulong common_semi_flen_buf(CPUState *cs)
>> +static uint64_t common_semi_flen_buf(CPUState *cs)
>>    {
>> -    target_ulong sp = common_semi_stack_bottom(cs);
>> +    uint64_t sp = common_semi_stack_bottom(cs);
>>        return sp - 64;
>>    }
>>    
> 
> vaddr.
> 

Will change to it, thanks.

> Otherwise,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> r~


