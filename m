Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp2148496njc;
        Mon, 4 Nov 2024 06:28:19 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVtyJzTl6tDy/KbQanBfWh6YdIL2aAwnBhDF7WbNwZjJkeyQdmVqp8QJ6oBeZl0VCZhQkZThH8Iml0c6A==@linaro.org
X-Received: by 2002:a17:903:230c:b0:211:414:f2fa with SMTP id d9443c01a7336-2110414f3aamr235108645ad.53.1730730499372;
        Mon, 04 Nov 2024 06:28:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730730499; cv=none;
        d=google.com; s=arc-20240605;
        b=TYxxXcp88pbhNWjByrvx1gl4XNrpNuucTh29vx8r4dgJ6eGq/Mm6lp1uJcab74R3LV
         naEW84gNALAJxtbJbHoE3Xz3R+nLdMtOZvHo6fVHyshsDdGZ7+IjJfS8TyrQzkvMoCxF
         1tkRihySAgYX8L490bP0LtnHr59eHcjSNY29LGTTbPKawlPA2eduxQrp69eArbbsFciD
         NLhzl17tui08IIQQLUVz1rn4sVZuDc0TNopIdmHsNwnbOfGC5NF3VB18B3ThrdqbPlM8
         7U9fVMYr+ztrFuoOrXTZbIqRuClGV5/hQJJvyrG/JahC6z8ZyFH5PWieqHZxEpQIT11N
         mDFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ESl+iGLPzsB1AzAb5/vx0YGyULMc6i4rrVJE+Xl3loo=;
        fh=9WF87Q5ztgiWYy3F3nt+XQVLjkb56qg4iOeERLtY0Lo=;
        b=NYwUtO3Voi9hVhk53G+jvrxvxVCjaHHtkB6AFq1x/lmC/bUiAyL61Z+ymZ0JW6TODm
         UnncKX5OIgJRJJBbp2y/0tToKPW2yK8ISQW7li2LtQexpfU01Vi461Q+am1kOczxT03W
         ZRKhN70PjpckPql5LWu2y1m50Tn0Ld+OedhAv0A+O2jKU8P/pYzjbC8lKIg9LSsOYUkC
         M40zobuj8+5aRjZ3cgYx51noUym/xmScpSajT9mN99u2msAblkvzhsKHAxeJuFbjnVcQ
         iX3k9q92+1LwaG5rlfZymHYJWZZCssh99VBA22cjVJ2eMW90EhK/CakHeUmWJ8Fdo+ty
         ElwA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ld8L5RGA;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-2110571b20csor67441005ad.8.2024.11.04.06.28.19
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 04 Nov 2024 06:28:19 -0800 (PST)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ld8L5RGA;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730730499; x=1731335299; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ESl+iGLPzsB1AzAb5/vx0YGyULMc6i4rrVJE+Xl3loo=;
        b=ld8L5RGAwWUDgha4kI0DXpLE3vDk1DCfTwvbp6Tfr8ReHxYw30b/D15H4VKf1b1Dh+
         OB6yk84R18C8Y2UQdPig8hqLlORYJeoyOrIoWbQzrEvmRckB3Lv5ez2KLP9RbRQQRfBW
         LrT34YifoDVXd497V/AqU2k78FuYQ9rH5/HR92mIBAkovu3ALswH1NqPLnXoJsZsrTVG
         ZhJWXyapwa0IwUhZk/gaRsRsG8GDv1cjOTwheka77ay4wvNqS/6djN6/pXASd+rfRPAX
         aC9asH0r7xm0z8HFjy83ZbltOlvYaOyKVo8UEMrw71aSxhIpLD1K5Jgvt7K3GrVbp4Qh
         /qDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730730499; x=1731335299;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ESl+iGLPzsB1AzAb5/vx0YGyULMc6i4rrVJE+Xl3loo=;
        b=Vp6+O9yOTcz4Zn01jkEKbkRrNiPQn1zvVcDbOLxG4o2CbkC3r6IBf+UMwZr/kIf539
         qcpfFLJMVqY8MHm2iCl4yWDQSb2wjFlLzePV6rduZ/Z4oKiCNksXvLGXc/EFac4CYcvk
         fXonLYfFzGzPebGwdqeZMJI3H9Aweq4Fr3gAilq6s6j19GIAAjoQM/y/joKFuTRkN9C8
         ElZP4KNkwdfV8VSxYvX7qxLLRuhigWj3HPWUwl7gezsVIYj0fhP5so/JS0ISbhDYh+mX
         l1lj9WlnUFxssDJhOLA6h9NcVVTFlGNjQfipdC0fn7Z/zrYEJan1uA+dIepP2LWht88s
         DijQ==
X-Forwarded-Encrypted: i=1; AJvYcCVacj47vWj/kD160VVCBOA7liOFdeR6874eZh0PmZsoYQ15Luys6S6J0/xFHEghW9BKMaMA2WmXsVNU4A==@linaro.org
X-Gm-Message-State: AOJu0YzI6lW429GrgDXMoC+ADxuargKri+o2WYXZGfiJPrVXFdD4LUUI
	nLSg9toYcKr3QKhFPbar607DU3SoR72vn0J4SHGojF6bWdUgvofKPD+6QDVbS7x9MlLFOrfLGni
	TWk0=
X-Google-Smtp-Source: AGHT+IGyUL5IH5ekTT0KKYcrtAR2/+dluIPbZy4HZ/0VNaB+CGHELKBSAjlVGUPqechxiGcHo5UErg==
X-Received: by 2002:a17:903:943:b0:205:68a4:b2d8 with SMTP id d9443c01a7336-21103aaa063mr238331515ad.11.1730730498820;
        Mon, 04 Nov 2024 06:28:18 -0800 (PST)
Return-Path: <gustavo.romero@linaro.org>
Received: from [192.168.0.102] (200-207-104-238.dsl.telesp.net.br. [200.207.104.238])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2110571b6e9sm61134935ad.116.2024.11.04.06.28.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 06:28:18 -0800 (PST)
Message-ID: <c3b41710-e0b0-45fc-b974-6e4a0cfebaa4@linaro.org>
Date: Mon, 4 Nov 2024 11:28:15 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/arm: Enable FEAT_CMOW for -cpu max
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, alex.bennee@linaro.org,
 richard.henderson@linaro.org
References: <20241101013541.883785-1-gustavo.romero@linaro.org>
 <CAFEAcA-aNf7ca1jYc0YnzSYKjvC42u178gmFTB+5p+TSgz0MfA@mail.gmail.com>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <CAFEAcA-aNf7ca1jYc0YnzSYKjvC42u178gmFTB+5p+TSgz0MfA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: TgGsCyaLvIP0

Hi Peter!

On 11/4/24 10:38, Peter Maydell wrote:
> On Fri, 1 Nov 2024 at 01:36, Gustavo Romero <gustavo.romero@linaro.org> wrote:
>>
>> FEAT_CMOW introduces support for controlling cache maintenance
>> instructions executed in EL0/1 and is mandatory from Armv8.8.
>>
>> On real hardware, the main use for this feature is to prevent processes
>> from invalidating or flushing cache lines for addresses they only have
>> read permission, which can impact the performance of other processes.
>>
>> QEMU implements all cache instructions as NOPs, and, according to rule
>> [1], which states that generating any Permission fault when a cache
>> instruction is implemented as a NOP is implementation-defined, no
>> Permission fault is generated for any cache instruction when it lacks
>> read and write permissions.
>>
>> QEMU does not model any cache topology, so the PoU and PoC are before
>> any cache, and rules [2] apply. These rules states that generating any
>> MMU fault for cache instructions in this topology is also
>> implementation-defined. Therefore, for FEAT_CMOW, we do not generate any
>> MMU faults either, instead, we only advertise it in the feature
>> register.
>>
>> [1] Rule R_HGLYG of section D8.14.3, Arm ARM K.a.
>> [2] Rules R_MZTNR and R_DNZYL of section D8.14.3, Arm ARM K.a.
>>
>> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
>> ---
>>   docs/system/arm/emulation.rst | 1 +
>>   target/arm/cpu-features.h     | 5 +++++
>>   target/arm/cpu.h              | 1 +
>>   target/arm/tcg/cpu64.c        | 1 +
>>   4 files changed, 8 insertions(+)
>>
>> diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
>> index 35f52a54b1..a2a388f091 100644
>> --- a/docs/system/arm/emulation.rst
>> +++ b/docs/system/arm/emulation.rst
>> @@ -26,6 +26,7 @@ the following architecture extensions:
>>   - FEAT_BF16 (AArch64 BFloat16 instructions)
>>   - FEAT_BTI (Branch Target Identification)
>>   - FEAT_CCIDX (Extended cache index)
>> +- FEAT_CMOW (Control for cache maintenance permission)
>>   - FEAT_CRC32 (CRC32 instructions)
>>   - FEAT_Crypto (Cryptographic Extension)
>>   - FEAT_CSV2 (Cache speculation variant 2)
>> diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
>> index 04ce281826..e806f138b8 100644
>> --- a/target/arm/cpu-features.h
>> +++ b/target/arm/cpu-features.h
>> @@ -802,6 +802,11 @@ static inline bool isar_feature_aa64_tidcp1(const ARMISARegisters *id)
>>       return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, TIDCP1) != 0;
>>   }
>>
>> +static inline bool isar_feature_aa64_cmow(const ARMISARegisters *id)
>> +{
>> +    return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, CMOW) != 0;
>> +}
>> +
>>   static inline bool isar_feature_aa64_hafs(const ARMISARegisters *id)
>>   {
>>       return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, HAFDBS) != 0;
>> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
>> index 8fc8b6398f..1ea4c545e0 100644
>> --- a/target/arm/cpu.h
>> +++ b/target/arm/cpu.h
>> @@ -1367,6 +1367,7 @@ void pmu_init(ARMCPU *cpu);
>>   #define SCTLR_EnIB    (1U << 30) /* v8.3, AArch64 only */
>>   #define SCTLR_EnIA    (1U << 31) /* v8.3, AArch64 only */
>>   #define SCTLR_DSSBS_32 (1U << 31) /* v8.5, AArch32 only */
>> +#define SCTLR_CMOW    (1ULL << 32) /* FEAT_CMOW */
>>   #define SCTLR_MSCEN   (1ULL << 33) /* FEAT_MOPS */
>>   #define SCTLR_BT0     (1ULL << 35) /* v8.5-BTI */
>>   #define SCTLR_BT1     (1ULL << 36) /* v8.5-BTI */
>> diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
>> index 0168920828..2963d7510f 100644
>> --- a/target/arm/tcg/cpu64.c
>> +++ b/target/arm/tcg/cpu64.c
>> @@ -1218,6 +1218,7 @@ void aarch64_max_tcg_initfn(Object *obj)
>>       t = FIELD_DP64(t, ID_AA64MMFR1, ETS, 2);      /* FEAT_ETS2 */
>>       t = FIELD_DP64(t, ID_AA64MMFR1, HCX, 1);      /* FEAT_HCX */
>>       t = FIELD_DP64(t, ID_AA64MMFR1, TIDCP1, 1);   /* FEAT_TIDCP1 */
>> +    t = FIELD_DP64(t, ID_AA64MMFR1, CMOW, 1);     /* FEAT_CMOW */
>>       cpu->isar.id_aa64mmfr1 = t;
>>
>>       t = cpu->isar.id_aa64mmfr2;
> 
> We don't need to do anything for the actual cache operations,
> but we do need to make sure that the SCTLR_ELx and HCRX_EL2
> control bits for it can be set and read back. Our sctlr_write()
> doesn't impose a mask, so no change nedeed there, but
> our hcrx_write() does set up a valid_mask and doesn't allow
> the guest to write bits that aren't in that mask. So we
> need to add an
>     if (cpu_isar_feature(aa64_cmow, cpu)) {
>         valid_mask |= HCRX_CMOW;
>     }
> in there.

Ough. Sure! Fixed in v2. Thanks a lot.


Cheers,
Gustavo
