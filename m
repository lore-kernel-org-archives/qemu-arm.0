Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8D96C83F17
	for <qemu-arm@archiver.kernel.org>; Thu, 10 Jul 2025 15:09:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uZst2-0002mi-Bj; Thu, 10 Jul 2025 11:08:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uZsqh-0000Rs-Tb
 for qemu-arm@nongnu.org; Thu, 10 Jul 2025 11:06:19 -0400
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uZsqc-00064O-W3
 for qemu-arm@nongnu.org; Thu, 10 Jul 2025 11:06:10 -0400
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-2f78ef10832so647437fac.3
 for <qemu-arm@nongnu.org>; Thu, 10 Jul 2025 08:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752159965; x=1752764765; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WXFneuohW2JTYeRWvN54I5URuuJY2O/m/l/1PRDfWMY=;
 b=Ybm2eWd8AHn3qfQK4wXEdt3T8ILSRBAmmo0ovg+LgxmLr5bxpG7jOHNVUjXlWFgL6O
 +41m+gRrAUTaRnGS1FqMybekWfETcYXogJVDZuyKJarcTeZXYwme6LT8zbagGxDW65oz
 kVtxjJnbeZXbwiN+n5tWwlGDU/xa+nwL5KdFFdABm2M2/O99illWcFWyN3HlLsIkoUrQ
 xSi1INx1tSV6LqtiInKangc3wldfyw9MvZpQLFGjgZQEOKJmEvmHJNVvzPcOcOnZngLt
 r16ZrmL4CuEb9Ww3HIGhxgBaOojcqzCthGAN8hR4LanPcQbHbggiptglSV8/+p18LXuq
 SLsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752159965; x=1752764765;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WXFneuohW2JTYeRWvN54I5URuuJY2O/m/l/1PRDfWMY=;
 b=e1KfgfVo/GvEpvxeI9WrUXkCKzTyTV7Wos4JWHppsM69iJC6Xzyp++t9JrsPWcMBKl
 W6rC6IxcK4dhd5x/8Zi7kvmibQ+3S9sN7do+arju7dAzZ29Fejy+wNRoSaHM3gwQUuRp
 zhYsaZNFppNUYz/OjyDp8/VXYgNZkbCHR2brrweTK64miv3P/uECTslmWQjwepGD1V/n
 vF9UD1rKCt/T4+DebvHJJtuiT2zZb4JnvuDwO8kealQgBlBWUbCcr2U0r7c8P6tJ46Dk
 pTspYLj9MmYou5BKhchluv03vvfCL/ds1hnnnIujIIESrYlj+vcifGAzbwuRIyZs4dq6
 Lqng==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1NermcBEOa5L1MhfaN0/VjAb611KDUFFUwvyv4RxaWpt8gsxAxSBRsAM5r/3xbSYWUildX32XSg==@nongnu.org
X-Gm-Message-State: AOJu0Yyfx36mTMbBlibgWMLSn6HNjcNFI6sglj8RQRAKvgkSMhYM7jeF
 vvioDqsvfzVROGcQYu++KIqIUNK5igBbHsXlXIqv5ziWlvf7nviM9LDqW02vzGr08gY=
X-Gm-Gg: ASbGncu5iB1/B4cTjd4TcLo34sGehrjsuxDivqn7od+ZYHPHMdIJQgsHGnX9kz0KTtJ
 r6EIktH6eq7tnTSfWKhXTlwezd6cUviugRYc6s6yuEjWFNK8eKnvgWV5nAmvUxH8agp72234Ey4
 4hFCvAb9gYd6PUzlU1I0dgeCo5KT+U17NC6QeeG7U41yg7bfj1yWqk3edD7ck7NEPTgmoD5uCzD
 KrWC1jXha4qypLIZ8PO6oEVsIKghI9sHwOq/tfXj2+5rD5Xpn3O1elMer2P8q8yxj4tINYqyExi
 YLDdWJuEX6zC84OfDBAL9i9zUwtkzS6n9lpjj5zfSb2hOumJeXRYAH/IfPL7FFO8J6e+axGpYas
 T+WU=
X-Google-Smtp-Source: AGHT+IH9e2wygTlOGNzC+9frJ75ZSCcBoQB0GyGefhyiaSTnJe4OBMuW4+A4F65LV/jywD+KTMconw==
X-Received: by 2002:a05:6870:e40c:b0:2bc:8c4a:aac2 with SMTP id
 586e51a60fabf-2fef875d724mr5210103fac.27.1752159964976; 
 Thu, 10 Jul 2025 08:06:04 -0700 (PDT)
Received: from [172.20.0.130] ([187.217.227.247])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2ff1172e579sm331299fac.45.2025.07.10.08.06.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jul 2025 08:06:04 -0700 (PDT)
Message-ID: <c9b6afa4-d97f-44b7-9b69-3ae607834a2d@linaro.org>
Date: Thu, 10 Jul 2025 09:06:01 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/20] target/arm: Convert get_phys_addr_lpae to
 access_perm
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20250707202111.293787-1-richard.henderson@linaro.org>
 <20250707202111.293787-4-richard.henderson@linaro.org>
 <CAFEAcA9UcPCQ5qqrM+Ao5hrOJ=xYgOJ6==WNDj0xPpr2qh-TfA@mail.gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9UcPCQ5qqrM+Ao5hrOJ=xYgOJ6==WNDj0xPpr2qh-TfA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x32.google.com
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

On 7/10/25 05:59, Peter Maydell wrote:
> On Mon, 7 Jul 2025 at 22:01, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/arm/ptw.c | 12 ++++++------
>>   1 file changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
>> index 39ecc093a5..7503d1de6f 100644
>> --- a/target/arm/ptw.c
>> +++ b/target/arm/ptw.c
>> @@ -1643,14 +1643,14 @@ static bool nv_nv1_enabled(CPUARMState *env, S1Translate *ptw)
>>    * @env: CPUARMState
>>    * @ptw: Current and next stage parameters for the walk.
>>    * @address: virtual address to get physical address for
>> - * @access_type: MMU_DATA_LOAD, MMU_DATA_STORE or MMU_INST_FETCH
>> + * @access_perm: PAGE_{READ, WRITE, EXEC}, or 0
>>    * @memop: memory operation feeding this access, or 0 for none
>>    * @result: set on translation success,
>>    * @fi: set to fault info if the translation fails
>>    */
>>   static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
>>                                  uint64_t address,
>> -                               MMUAccessType access_type, MemOp memop,
>> +                               unsigned access_perm, MemOp memop,
>>                                  GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
>>   {
>>       ARMCPU *cpu = env_archcpu(env);
>> @@ -1678,7 +1678,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
>>           int ps;
>>
>>           param = aa64_va_parameters(env, address, mmu_idx,
>> -                                   access_type != MMU_INST_FETCH,
>> +                                   !(access_perm & PAGE_EXEC),
>>                                      !arm_el_is_aa64(env, 1));
>>           level = 0;
> 
> This will treat a "don't check access permissions" call as
> a data-access (relevant for TBI), and means there's no way
> to say "do an address lookup for INST_FETCH but don't do the
> access-permission check". Is that what we want?
> We should at least comment this.
It does happen to be what we want for ats1a.
I can add a comment.

r~

