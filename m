Received: by 2002:a17:906:3119:b0:a04:79f0:9a0e with SMTP id 25csp456737ejx;
        Wed, 22 Nov 2023 08:39:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFJAAIq8CD7b4o1Wvh3NwHUBqvmY5aIABdf7S/DjZZReAnyPA+2d4ExeBNJj9VrdhPn8w6K
X-Received: by 2002:a67:ef45:0:b0:462:7164:d4e7 with SMTP id k5-20020a67ef45000000b004627164d4e7mr2560469vsr.1.1700671152849;
        Wed, 22 Nov 2023 08:39:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700671152; cv=none;
        d=google.com; s=arc-20160816;
        b=pp0bkrUM3UvacsBMt3pHH9LyjEwRviTsc6krqj9NO+y8T1KGnNVrLuJ9y+OINJiaVU
         2trBoB0a8DJNrdHW/GUQP610UoBlLw6hm1Mex5eilNrL4aOdXW0ecKHqfPJSK/9K6+f6
         NX/zvFHn++gPL/sVDwmSDKkUT8C/a1SJ8yGhEYVKXXxWsFE4bSUAKD8Xc9OBpakaNjLP
         xCWxz2IUacFOxGDkypvs8P9/+ZOP+hWn5RsEhSFG90xEgGQRc5qqnQd7LMYZ9DcRxHMu
         B4k0STnb96lRNzbmsfo6EAT0InZFPeRcFaTQQ+udEv3iZH1ceXjBikwd4vXI8iaf08UC
         EqsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=WQcbwDTe97fNlo5xdHqcwZvJlfpmp31ZQBpEUtLX+Z8=;
        fh=xUSF+EjWFgvws/hl4xCVlhOCexhTZEVhlpDznB01zHg=;
        b=VdPtlAqDxX11l5qOgFWMOVVS8HUj52WyNh84cxW+OOFZn8kn6A0EW/4NoGXJU7LYSh
         9Bq0Dj4TdiU/nk+Y0+bYYvHl3f/1m45oFio6NGo4ffCwThzQQzy8URxk7kDou8BQYg8n
         OCcET1W8ftxnixGCn6FbWd67cpdMp14AT60s8OXGApdrPTNw5c1w3pS4gp7Bs/uALgVk
         hFV9HTecO0uYJs3BCUDGLW+pWBlGiENfWCZFsrBhqdpKzdQTKEmRbORM//2ZjpFjG27j
         N6bIX5q/UCyTIezcTscN5la1BVGGbiNvQumHkNv5UNEy2yVeo/AK3tKwFzCOPavffQQN
         f/bw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Yx7sGgNS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f22-20020a05610209b600b004627bc75be7si2897801vsb.636.2023.11.22.08.39.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Nov 2023 08:39:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Yx7sGgNS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r5qFl-0000L3-Si; Wed, 22 Nov 2023 11:39:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1r5qFh-0000Kc-AY
 for qemu-arm@nongnu.org; Wed, 22 Nov 2023 11:39:01 -0500
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1r5qFc-0007hm-UV
 for qemu-arm@nongnu.org; Wed, 22 Nov 2023 11:38:58 -0500
Received: by mail-ot1-x32f.google.com with SMTP id
 46e09a7af769-6ce2d4567caso4003758a34.2
 for <qemu-arm@nongnu.org>; Wed, 22 Nov 2023 08:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700671135; x=1701275935; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WQcbwDTe97fNlo5xdHqcwZvJlfpmp31ZQBpEUtLX+Z8=;
 b=Yx7sGgNSXpwajLzI1ozzzsRklVLRqs1Z3n0e6ngYg1ayb9MCwjkI0QPCPNU+KbCKu4
 4L8feve96Vf92VRNEb/aolCc0MQLcuDPe9zHPhe2V5nz4/q6t1bcv+Sx9320ZtD0vzzw
 +KkGSOtmcXMGBQU7EbZ7u7EcUw5gjP+AjM2SsT79ZPsAvhuBxbdD8KnArcV5P1q1Ql5K
 ssQfoblm8VewWJ1JeGPBrTZ3N3g6TI9gKD4otbOcO+dF+0gtivqmlWHdw5QQs216IBcI
 1IFAwmBl6TzmFnt9Mw8IAjmc/scECgHcba/qxgY3l9s9XDHKpudGtRtGruVRl3oWCwXw
 wJLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700671135; x=1701275935;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WQcbwDTe97fNlo5xdHqcwZvJlfpmp31ZQBpEUtLX+Z8=;
 b=P3veORMlRtWbSkzTonMvtpJDDW2cTDfgYLV6O04okuU7iMq+HPBLRQL+IAAtiZAg8+
 bO8B1JQ1nfgSFSHOqO0TvrL4SzvKiZOSrGq7W7TP38z5w0iuAe4WhIenIMnhDexfARic
 zpBIb0q8Jt2NlD/m9lm4tbwLF9A+O8bI+nUsCg4Rh241fArCDiNaqD2FTkuTKq4vDJch
 DFZQIhUYInYtvFNueQ4tAOxaDKlLGzCy7S4axHGxod8t1L7QfVQINl+ea1rqgnSW/9eI
 FKIiObJyjiiEoxLTZhagxLUy/Bm2QwI9DhAoWLh1lEs32a0xjAnVpuplpUPLnbFYBh8K
 7CMQ==
X-Gm-Message-State: AOJu0YwUUcng+nr9mR/NKm0MP90RvKF1KZ0Ii0D01ABZuqOR84lvDdXv
 5ztbOsEUMTCybH0Y1zn1dZtLZA==
X-Received: by 2002:a05:6830:328b:b0:6bc:a68b:ca44 with SMTP id
 m11-20020a056830328b00b006bca68bca44mr2988506ott.6.1700671135041; 
 Wed, 22 Nov 2023 08:38:55 -0800 (PST)
Received: from [172.20.7.39] ([187.217.227.247])
 by smtp.gmail.com with ESMTPSA id
 q3-20020a9d6543000000b006cd09ba046fsm1922080otl.61.2023.11.22.08.38.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Nov 2023 08:38:54 -0800 (PST)
Message-ID: <0930062d-5aba-4e4c-be56-3c358ec125ba@linaro.org>
Date: Wed, 22 Nov 2023 10:38:52 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/arm: kvm64: remove a redundant
 KVM_CAP_SET_GUEST_DEBUG probe
To: Chao Du <duchao@eswincomputing.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org, pbonzini@redhat.com
References: <20231025070726.22689-1-duchao@eswincomputing.com>
 <3c895935.1233.18bf6196456.Coremail.duchao@eswincomputing.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <3c895935.1233.18bf6196456.Coremail.duchao@eswincomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32f.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 0j9w7ObujyPu

On 11/22/23 02:15, Chao Du wrote:
> Hi,
> 
> Kindly ping. :)
> 
> Thanks,
> Chao
> 
> 
>> -----Original Messages-----From:"Chao Du" <duchao@eswincomputing.com>Sent Time:2023-10-25 15:07:26 (Wednesday)To:qemu-devel@nongnu.org, qemu-arm@nongnu.orgCc:Subject:[PATCH] target/arm: kvm64: remove a redundant KVM_CAP_SET_GUEST_DEBUG probe
>>
>> The KVM_CAP_SET_GUEST_DEBUG is probed during kvm_init().
>> gdbserver will fail to start if the CAP is not supported.
>> So no need to make another probe here, like other targets.
>>
>> Signed-off-by: Chao Du <duchao@eswincomputing.com>

Correct: all handled by kvm_supports_guest_debug.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


>> ---
>>   target/arm/kvm64.c | 28 +++++++---------------------
>>   1 file changed, 7 insertions(+), 21 deletions(-)
>>
>> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
>> index 4bb68646e4..b0bf59b5a1 100644
>> --- a/target/arm/kvm64.c
>> +++ b/target/arm/kvm64.c
>> @@ -31,13 +31,9 @@
>>   #include "hw/acpi/acpi.h"
>>   #include "hw/acpi/ghes.h"
>>   
>> -static bool have_guest_debug;
>>   
>>   void kvm_arm_init_debug(KVMState *s)
>>   {
>> -    have_guest_debug = kvm_check_extension(s,
>> -                                           KVM_CAP_SET_GUEST_DEBUG);
>> -
>>       max_hw_wps = kvm_check_extension(s, KVM_CAP_GUEST_DEBUG_HW_WPS);
>>       hw_watchpoints = g_array_sized_new(true, true,
>>                                          sizeof(HWWatchpoint), max_hw_wps);
>> @@ -1140,33 +1136,23 @@ static const uint32_t brk_insn = 0xd4200000;
>>   
>>   int kvm_arch_insert_sw_breakpoint(CPUState *cs, struct kvm_sw_breakpoint *bp)
>>   {
>> -    if (have_guest_debug) {
>> -        if (cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&bp->saved_insn, 4, 0) ||
>> -            cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&brk_insn, 4, 1)) {
>> -            return -EINVAL;
>> -        }
>> -        return 0;
>> -    } else {
>> -        error_report("guest debug not supported on this kernel");
>> +    if (cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&bp->saved_insn, 4, 0) ||
>> +        cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&brk_insn, 4, 1)) {
>>           return -EINVAL;
>>       }
>> +    return 0;
>>   }
>>   
>>   int kvm_arch_remove_sw_breakpoint(CPUState *cs, struct kvm_sw_breakpoint *bp)
>>   {
>>       static uint32_t brk;
>>   
>> -    if (have_guest_debug) {
>> -        if (cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&brk, 4, 0) ||
>> -            brk != brk_insn ||
>> -            cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&bp->saved_insn, 4, 1)) {
>> -            return -EINVAL;
>> -        }
>> -        return 0;
>> -    } else {
>> -        error_report("guest debug not supported on this kernel");
>> +    if (cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&brk, 4, 0) ||
>> +        brk != brk_insn ||
>> +        cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&bp->saved_insn, 4, 1)) {
>>           return -EINVAL;
>>       }
>> +    return 0;
>>   }
>>   
>>   /* See v8 ARM ARM D7.2.27 ESR_ELx, Exception Syndrome Register
>> -- 
>> 2.17.1

