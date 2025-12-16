Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA188D609CD
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Dec 2025 16:14:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vVXgJ-0003HW-DB; Tue, 16 Dec 2025 11:13:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vVXgH-0003GY-P9
 for qemu-arm@nongnu.org; Tue, 16 Dec 2025 11:13:45 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vVXgG-0004yI-82
 for qemu-arm@nongnu.org; Tue, 16 Dec 2025 11:13:45 -0500
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-7b9215e55e6so3481522b3a.2
 for <qemu-arm@nongnu.org>; Tue, 16 Dec 2025 08:13:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1765901623; x=1766506423; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=10oyi9nDKeNlIVFMrauOe0l7R48MzuLinYpojqAXQkQ=;
 b=VXmt1a8p4hnpo0GhFnbpjXMO1y/hw3j005UXTga9iieh+lmPnfxWnfFx9qjXtZG1F4
 vxyPEs9aM9Q8VLrDes1xJnPa+f8k0Z7wvFFPeVHzTF6LdOjCrlmIemScUH1lY5epMU0y
 hVlbts4Eukvsnf3ANpAmJQMjoUx58GJmnKSp0xPCIWwcItfHAQB+vw/9+lMU8Z5i9Qon
 VlybhKNpznqB3aNCouhM6x14FVZISgGHd5igIo2yb+KIgqUAyBO86oyT5x8jRrCLtYxI
 Qx3brcu4yQndt3bA+HDIBNWcN9JC9gZ1ZEMGpWGOfDRrB+Tg8WPDf21bmDwzWdmP96iz
 MwQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765901623; x=1766506423;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=10oyi9nDKeNlIVFMrauOe0l7R48MzuLinYpojqAXQkQ=;
 b=wU1Np1JwFM0pnOh4PhJrTXMjRct+poS07UbPDeuYkvGsTaVF5CS4F/V7ZYNjn67eJx
 FhFiTlivS5teODI+Qtu0FtW4zKLPzhtsSa1Vy6/45/xF64R6Lk2XcaMRdIvt4tKMapuE
 z4sjExU6xZhCdFt05J5QGq+u6oUr/EAurLAs4GpH2oWgy6UwLfJ5npJCUW1/5EzU8S3i
 2nKk0mh8D2RvhJHX6tYKt0BavGxI1gzWoRGC5JVWYvus6F6NC47JLeYb897D3fByvHdi
 Lld5eMZlkk7vqT5Ciq4VpfeSUgY0yp4BS8BjRz919FB5enIpzh2quohnbS/Y5EcGFY5g
 pTeg==
X-Gm-Message-State: AOJu0Yx4z6m2otgxZmh0nVLaxF/bkwFKlNlr0aEmfJewsTU7zgJXqpsj
 RwtEPQgvHvzBjWx99P74EDCPCYAUOJ5QxRojB2pAzwsDlHxUWsDKllQGtTiNf3KKqY4=
X-Gm-Gg: AY/fxX5ZnoNrgm50eu16bJ/i2jjMu1wlMw92nKp7602p3kH0haLDPg2z0R4qS7QdyqH
 Dq0pHm2+VYi830GJVJdu54Ghu8VswtTI8iQy04L/hDvKRTvYXrx3pQfwLywptUlm5+Fo17hmyJY
 a1li+svUnNIxFVUS6eKuNjn/O7V/t3PIQ24/8clne4GK5PCsHf5Kyxsg8YUfQrY1Zf3mlBry7pa
 CvzbtQF8dIj5Z2TuI9yJHhVb3g6axukBXJLuMZz5563Aj9wMMa9m/HMPr4nbqwCqDxorxb1J2gO
 XygPW+qTqPSqIIz/niHuNlJEPtewbHkFZE6UGv20j3vvhj6HMBmQ5gua73tYA96pKNuZuNW87K7
 hKyejJzT0l2+6/7SS8rNW/4m8za6afZeZkEzhjqn6FB1piorYkwQlIrynfUM3TzBplh7c62yOBe
 +Ov+LKQn2OOf4lKgeZcXRqM17cUEx7+vVkKsQgGaNNvwlkITYZ7YwCztE=
X-Google-Smtp-Source: AGHT+IGdhdUD1Gvz5OHJoWKZGVaPp+eEGeO/hBoftTPwXmyyLgkno5vg3k+FtLmOC3TB6jF26hIsHQ==
X-Received: by 2002:a05:6a20:3d86:b0:366:815a:b3a5 with SMTP id
 adf61e73a8af0-369b04ca160mr14367502637.74.1765901622319; 
 Tue, 16 Dec 2025 08:13:42 -0800 (PST)
Received: from [192.168.1.87] (216-71-219-44.dyn.novuscom.net. [216.71.219.44])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-34abe3de37asm12286091a91.9.2025.12.16.08.13.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Dec 2025 08:13:41 -0800 (PST)
Message-ID: <f214e8d4-8864-4806-a3ba-207aa3f67714@linaro.org>
Date: Tue, 16 Dec 2025 08:13:41 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] target/arm/ptw: make granule_protection_check
 usable without a cpu
To: Tao Tang <tangtao1634@phytium.com.cn>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Auger <eric.auger@redhat.com>
References: <20251216000122.763264-1-pierrick.bouvier@linaro.org>
 <20251216000122.763264-3-pierrick.bouvier@linaro.org>
 <05c30ad2-2836-4f78-9c79-ad03eee2ce00@phytium.com.cn>
Content-Language: en-US
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <05c30ad2-2836-4f78-9c79-ad03eee2ce00@phytium.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x42f.google.com
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

On 12/16/25 5:39 AM, Tao Tang wrote:
> Hi Pierrick,
> 
> On 2025/12/16 08:01, Pierrick Bouvier wrote:
>> By removing cpu details and use a config struct, we can use the
>> same granule_protection_check with other devices, like SMMU.
>>
>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>> ---
>>    target/arm/cpu.h | 34 ++++++++++++++++++++++++++++
>>    target/arm/ptw.c | 59 +++++++++++++++++++++++++++++++-----------------
>>    2 files changed, 72 insertions(+), 21 deletions(-)
>>
>> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
>> index efbef0341da..5752e1f58fb 100644
>> --- a/target/arm/cpu.h
>> +++ b/target/arm/cpu.h
>> @@ -1216,6 +1216,40 @@ void arm_v7m_cpu_do_interrupt(CPUState *cpu);
>>    
>>    hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
>>                                             MemTxAttrs *attrs);
>> +
>> +typedef struct ARMGranuleProtectionConfig {
>> +    /* GPCCR_EL3 */
>> +    uint64_t gpccr;
>> +    /* GPTBR_EL3 */
>> +    uint64_t gptbr;
>> +    /* ID_AA64MMFR0_EL1.PARange */
>> +    uint8_t parange;
>> +    /* FEAT_SEL2 */
>> +    bool support_sel2;
>> +    /* Address space to access Granule Protection Table */
>> +    AddressSpace *gpt_as;
>> +} ARMGranuleProtectionConfig;
> 
> Would it make sense to add brief comments explaining how the fields in
> ARMGranuleProtectionConfig map to SMMU registers? This could help
> clarify that arm_granule_protection_check() is intended as a shared
> abstraction for both CPU MMU and SMMU.
> 

I'm not sure it's needed.
If we search for GPCCR/GPTBR/FEAT_SEL2 in SMMU spec, it will 
unambigously give the answer of which register holds it or what it is.
I would consider the comment is here to map local name to spec name, but 
not further than that.

Concerning finding which are the callers of this function, code 
completion tools or grep does a great job at it.

That said, if we want to add details about SMMU using this, it's 
definitely worth waiting for the patch using it on SMMU side.

> 
> That said, I’m also happy to defer this until we actually add the SMMU
> RME support.
> 
> 
> Regards,
> 
> Tao
> 

Thanks,
Pierrick

