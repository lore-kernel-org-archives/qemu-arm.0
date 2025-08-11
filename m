Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D34F8C87FD2
	for <qemu-arm@archiver.kernel.org>; Mon, 11 Aug 2025 13:46:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ulSqo-0006Q4-6E; Mon, 11 Aug 2025 09:46:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ulSqa-0006Kz-RI
 for qemu-arm@nongnu.org; Mon, 11 Aug 2025 09:46:06 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ulSqM-0007tw-Of
 for qemu-arm@nongnu.org; Mon, 11 Aug 2025 09:45:53 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3b790dbb112so2693577f8f.3
 for <qemu-arm@nongnu.org>; Mon, 11 Aug 2025 06:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754919935; x=1755524735; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GLdxbB8HAuK7i3SENIBtqw2FAOPAXoomdFfPQKwjvn0=;
 b=JG6QjYH8EH2iC8MOkrizJrqugeY2ss/KpTnIb9K1+G2N7qk0JdaVe/pxZOEAe69VoB
 Hxh8zQhDzQaykboX1pw+6cRty1sAjaUD+lYpZvp4E1Zn+tkQPr6qYn4kQiFgwhfAq4le
 ce8hy563FmgR7W19PznZwIIcrOEfQLuxQMImF1S2th29kq+oMWTAISlqKP3pK27jxNdN
 jvhlc7lQ2w9tAM5ddcgVol7DfrVkrcWZ3nyToxFkAadJaq5lmSivLMFm8zv6dTerVe3a
 Jgw1Ifffa+ulWlG23i+L6GCOwzyNGCJDJS5mRILsuKVVL/2qekc7arl5oJDB86IJsUnL
 AuyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754919935; x=1755524735;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GLdxbB8HAuK7i3SENIBtqw2FAOPAXoomdFfPQKwjvn0=;
 b=PG3wbYwrYtlHxGLiIWq1wNl7kVAR/VptHjRRHuwhEu5ZjXpnXtLlXTbkkT0Gnc4qa7
 HAuXrsMR26Guyrtn+Vnzv6ztlAkIco7jCABW53/6OxpR0TLdLYvJ5pWoY8Nsjo5ciEFa
 seOAqPSi2xqBTOrS3IxOSoNHpwGsE0/BFms713oSpoh90qNaFiD2KSTnXK/7RgfByXdr
 zbu6AHy12hU6Bb6vNit7bnFcPntgBeQfrozcXGaQzt8gidnDjGmNBBDCifZ+my1QFU8m
 rBwWuqolijUSJ1y97/JlwTrVLH8PIZGkmBnjE+J25JvPo7yhcwFjWkm5XUxEsEh2d8Hi
 Iv1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUb3GHbe6no2Cf9YHhWXSQ3eE7EgBK3X8YStFWDTPAARQIfLtBn+FYy1F6hL1PrQnsyJ02IuFL/vw==@nongnu.org
X-Gm-Message-State: AOJu0YwNB6g3p1zYI4U8fcXFfJSCctxV84ZjQKRapBv0Im5IEwIMyJLd
 sFmj/DmD7yzEc4y6znpKbfABq+j3TE4ygYJGBAbDmD9MAnIBBER01ueArznjcnjGFU0=
X-Gm-Gg: ASbGnctO+ZFNRooRkb90GwrV3J4Hw1rYdj5eaPUNa5X+CpA4yFDtGiAts2XWix4rZjZ
 oy1DG5UIr3XvpcmrCHPZDIQfUYPtx/cI7kWnz3mkLisjNq2+NPBrEwSLFaXljXq6yF2kF6To+11
 HAGRRwiCpHVkE2o0Te/+xUcvBZaIBB7q4Hz26ql6ogq+Byi69p9fS0Fdws/SjyyD1lGVHqZT5oG
 +pRAZlVsc6RYTVrDWZkWHZeyhfV4s8iQN+UPFjQSpl2e2BPYVYASvceasfx4tIRVqcidMAvdEAq
 bplriqAem0NAn8TaQ3DMHu58rU5MXEhImRFQUaDZU59TEluD5mXj19wFGylq7ALeLgNeMKZh7nV
 +aEeVRQCA39JXqYgbIY1rLKVD+kemS0r5BjVrYePfPjlMop+KkWW0s4ksZD1kvm/iEAUg1X8=
X-Google-Smtp-Source: AGHT+IGFkOpfg2DIAbLUDdSR9qfzHR7j6sPRpGJvNy97Y7yU4pyYZ7ym0/Qd3WDEhl+lVOB9y0W3tw==
X-Received: by 2002:a05:6000:26ca:b0:3b7:97c8:daad with SMTP id
 ffacd0b85a97d-3b900b6ac1cmr9765008f8f.55.1754919935298; 
 Mon, 11 Aug 2025 06:45:35 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c466838sm42932683f8f.49.2025.08.11.06.45.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 06:45:34 -0700 (PDT)
Message-ID: <00bb0213-e4b3-457b-b5df-f575865b91ff@linaro.org>
Date: Mon, 11 Aug 2025 15:45:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] target/arm: Trap PMCR when MDCR_EL2.TPMCR is set
To: Smail AIDER <smail.aider@huawei.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: Alexander Spyridakis <alexander.spyridakis@huawei.com>,
 "zhangyue (BA)" <zhangyue165@huawei.com>,
 "Liuyutao(DRC)" <liuyutao2@huawei.com>, "mjt@tls.msk.ru" <mjt@tls.msk.ru>,
 Peter Maydell <peter.maydell@linaro.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>
References: <20250811112143.1577055-1-smail.aider@huawei.com>
 <20250811112143.1577055-2-smail.aider@huawei.com>
 <7402c0f3-326b-4a98-bd62-b8da998b4401@linaro.org>
 <a8245ecc1e614beaa66f16dcb20d7dc1@huawei.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <a8245ecc1e614beaa66f16dcb20d7dc1@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
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

On 11/8/25 15:33, Smail AIDER wrote:
> Hi Philippe,
> 
> It is not just some refactoring. The last patch v3 is a squash of two previous patches v1 and v2.
> Maybe I need to change the history description if not clear (I was talking from v3 point of view).
> The purpose of the series is the main description itself. Please check the v1 below:
> 
> https://patchew.org/QEMU/20250722131925.2119169-1-smail.aider@huawei.com/

Then please add a Cc tag (maintainer can do it if this v3 is OK, no need 
for v4):

Cc: qemu-stable@nongnu.org

> Other than that, the argument (is_pmcr) is correct. "isread" is not used in this case.

Right, I missed it during review. Maybe we want to forward the arguments
for clarity?

  -static CPAccessResult pmreg_access(CPUARMState *env, const 
ARMCPRegInfo *ri,
  -                                   bool isread)
  +static CPAccessResult do_pmreg_access(CPUARMState *env, const 
ARMCPRegInfo *ri,
  +                                   bool isread, bool is_pmcr)

Anyhow I'll let Richard review. No objection.

> 
> --
> Best Regards,
> Smail AIDER
> E-Mail: smail.aider@huawei.com
> Operating System Researcher/Developer
> Dresden Research Center, OS Kernel Lab
> Huawei Technologies Co., Ltd
> 
> -----Original Message-----
> From: Philippe Mathieu-Daudé <philmd@linaro.org>
> Sent: Monday, August 11, 2025 2:36 PM
> To: Smail AIDER <smail.aider@huawei.com>; qemu-devel@nongnu.org
> Cc: Alexander Spyridakis <alexander.spyridakis@huawei.com>; zhangyue (BA) <zhangyue165@huawei.com>; Liuyutao(DRC) <liuyutao2@huawei.com>; mjt@tls.msk.ru; Peter Maydell <peter.maydell@linaro.org>; qemu-arm@nongnu.org; richard.henderson@linaro.org
> Subject: Re: [PATCH v3 1/1] target/arm: Trap PMCR when MDCR_EL2.TPMCR is set
> 
> Hi Smail,
> 
> (no need to Cc qemu-stable with this patch, it is a simple refactor)
> 
> On 11/8/25 13:21, Smail AIDER via wrote:
>> From: Smail AIDER via <qemu-devel@nongnu.org>
>>
>> Trap PMCR_EL0 or PMCR accesses to EL2 when MDCR_EL2.TPMCR is set.
>> Similar to MDCR_EL2.TPM, MDCR_EL2.TPMCR allows trapping EL0 and EL1
>> accesses to the PMCR register to EL2.
>>
>> Signed-off-by: Smail AIDER <smail.aider@huawei.com>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> Message-Id: <20250722131925.2119169-1-smail.aider@huawei.com>
>> ---
>>    target/arm/cpregs-pmu.c | 33 +++++++++++++++++++++++++--------
>>    1 file changed, 25 insertions(+), 8 deletions(-)
>>
>> diff --git a/target/arm/cpregs-pmu.c b/target/arm/cpregs-pmu.c
>> index 9c4431c18b..13392ddc4c 100644
>> --- a/target/arm/cpregs-pmu.c
>> +++ b/target/arm/cpregs-pmu.c
>> @@ -228,22 +228,27 @@ static bool event_supported(uint16_t number)
>>        return supported_event_map[number] != UNSUPPORTED_EVENT;
>>    }
>>    
>> -static CPAccessResult pmreg_access(CPUARMState *env, const ARMCPRegInfo *ri,
>> -                                   bool isread)
>> +static CPAccessResult do_pmreg_access(CPUARMState *env, bool is_pmcr)
> 
> "bool is_pmcr" vs ...
> 
>> +static CPAccessResult pmreg_access(CPUARMState *env, const ARMCPRegInfo *ri,
>> +                                   bool isread)
> 
> ... "bool isread".
> 
> I suppose we want to use "is_pmcr" here instead of "isread".
> 
>> +{
>> +    return do_pmreg_access(env, false);
>> +}
>> +
>> +static CPAccessResult pmreg_access_pmcr(CPUARMState *env, const ARMCPRegInfo *ri,
>> +                                   bool isread)
>> +{
>> +    return do_pmreg_access(env, true);
>> +}
>> +
>>    static CPAccessResult pmreg_access_xevcntr(CPUARMState *env,
>>                                               const ARMCPRegInfo *ri,
>>                                               bool isread)
>> @@ -1187,14 +1204,14 @@ void define_pm_cpregs(ARMCPU *cpu)
>>                .fgt = FGT_PMCR_EL0,
>>                .type = ARM_CP_IO | ARM_CP_ALIAS,
>>                .fieldoffset = offsetoflow32(CPUARMState, cp15.c9_pmcr),
>> -            .accessfn = pmreg_access,
>> +            .accessfn = pmreg_access_pmcr,
>>                .readfn = pmcr_read, .raw_readfn = raw_read,
>>                .writefn = pmcr_write, .raw_writefn = raw_write,
>>            };
>>            const ARMCPRegInfo pmcr64 = {
>>                .name = "PMCR_EL0", .state = ARM_CP_STATE_AA64,
>>                .opc0 = 3, .opc1 = 3, .crn = 9, .crm = 12, .opc2 = 0,
>> -            .access = PL0_RW, .accessfn = pmreg_access,
>> +            .access = PL0_RW, .accessfn = pmreg_access_pmcr,
>>                .fgt = FGT_PMCR_EL0,
>>                .type = ARM_CP_IO,
>>                .fieldoffset = offsetof(CPUARMState, cp15.c9_pmcr),
> 


