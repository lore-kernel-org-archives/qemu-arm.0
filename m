Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp2266765njb;
        Mon, 10 Feb 2025 15:00:45 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUJ+5qjn+/wB0vTqbjYwhbKAMGMr3Lj+xUvOM06xGbFmcTwo59wKdSRfbRc6FQWtrjmAAavUCPIcmiosg==@linaro.org
X-Google-Smtp-Source: AGHT+IG6ay4oAqQuGuFc2N8IN9ROkpE152JtxAKt84Chyj19rseGwyyTS35GEOGecWfgF3G8XhkP
X-Received: by 2002:a05:6102:6a98:b0:4bb:9b46:3f6f with SMTP id ada2fe7eead31-4bb9b467825mr4137843137.1.1739228445079;
        Mon, 10 Feb 2025 15:00:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739228445; cv=none;
        d=google.com; s=arc-20240605;
        b=ek99owNNP9fD54kr+OxIMOg5ZXSH/d77eJrVp5Sv6c2j+WeetiipkIAKJblCYsXik2
         v8wYSU7UXkMQ9Tr0h/qUZ306j0EdfXmUNR+SgCtmtVkjYfYMgtM/S68l/R9U9mpyOI1r
         zvu/vEbI+ON7jp9rosGSd+C+JobMn+9pM3V7iXZuAFMKPD0hDi39BQA2T6+b3sztmgPJ
         3VrA4hXjywbGdQ496pWZjXMwx//di9q8CmRkqwiIhX2ojtM8LgRrsjz9dSaYppnkYEck
         AIxAMoj6lK6zeJDwWNamG0cNSM2RM/eMyFmMqz/swFpxJIAOLyIuh4Abv1vWplnfA+gk
         IsiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=6uJYWG/CKUK21TL34ACFa9VcxuKRpp3O2dx6sRfNcbE=;
        fh=etOQovjiLzHUH3qksgdJrwjZxNR0ih8i53v1qCORiqs=;
        b=SF69MOBYYC0PKTMlcqlq6FHSVlEYUitpUwwXysRHKDDnX6kJhVih6Iw1uMHa+nil4E
         nqSvGyRX1x5KZZxCOa99eqtijLnoNhBAWa6OITPb2nQKTKU2gePrPSnE5M41Co4itaG0
         N4kYB/Xrum9H67xkVtRcsL5cXcX1JorCyzRA9CxLVG1j/hcwki2kT1K4s1TtecD+8r7I
         SVNf8nQEKEGincQ39iuAaEv/D9G23WqaA93RMNlME1xIc3w2vD4+qIT+xTtl/sftByzh
         z2eKcz0Ik+p00CaGaO5FaUh1LUjLDzeZc2mndP2urPf0cEvdh0f9gPigCGBiqUkDr3fG
         sytA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fodJrOV7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4ba99dfb6f1si1318374137.355.2025.02.10.15.00.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Feb 2025 15:00:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fodJrOV7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1thcl5-000363-F9; Mon, 10 Feb 2025 18:00:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thcks-0002vI-OW
 for qemu-arm@nongnu.org; Mon, 10 Feb 2025 17:59:54 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thckq-0001YH-7A
 for qemu-arm@nongnu.org; Mon, 10 Feb 2025 17:59:54 -0500
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-38dd14c99d3so2460114f8f.3
 for <qemu-arm@nongnu.org>; Mon, 10 Feb 2025 14:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739228390; x=1739833190; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6uJYWG/CKUK21TL34ACFa9VcxuKRpp3O2dx6sRfNcbE=;
 b=fodJrOV7AfoSqTJQ7Wgz1RqsxHtQfPinyz7lKLAg4tw00ao1o4w0alRzgAlWfGPAj+
 gPgFNkOh2HFvau9w+jFNm35tTUCRHCb4SGQocGrZU1UxyDOZs7VzBoKiXHTo6D7pPUnE
 oi7xfiMoF8UD3tM1eQS5j3w1Z2ZHnq/Tv2UuJQ6/OlxVwXJ9p25/K3QION3hWra3Wn8G
 MQgumzXjZ0QZTGbl81YAI71iehe2z1qcvqNr9aKr/NTmsM4WNbfi0GNpbAWzT9w2ZItC
 17kAUl00wUMuLaEAgX4gse+cOW+QF/+mslKsFD1P9im4tpL1gpgwE1znuw+SnxYH4bFQ
 JUdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739228390; x=1739833190;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6uJYWG/CKUK21TL34ACFa9VcxuKRpp3O2dx6sRfNcbE=;
 b=OSrp/QWY+xsHrK+hbvoH90t7xRXMJ9DtOPam8cBOjraQnGtXFJkixj/vBBzm8sroaf
 secOAcToALZtwL2caJ6tMGZY8SU/ftcQODYJm8xA8s3fCD/fGcVfmK0lpNOC2IB3I5K5
 k4I+FXQmgo4ZMpgBL9luz7Dj6anEfyYQkrbOEtalpfbdxwEKnRE33MggZk8FmsqHKk9z
 Qnr9pm+qutDvjuK7CjwkKNDz/ZzINQlYDMzbsEdwlbtF4kdnHhpKmO1aQNcZe6Jr5tzT
 tZipzFg9M9SMhAA/jn6MVIx8LveSqYq6rrOGNq6eY6EhGq562pgms+/Y/UqoHAVV5rFp
 i4Iw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEQpfaMvlHYDRay78dfJHh6anxNvY7v/0rhihzGSVeiQL7nquHslgHSlLmButLfceOCuyx4EPrBQ==@nongnu.org
X-Gm-Message-State: AOJu0YxrX1SmFKH6395fev1y4iXq2Zb1PO+RHQdcsfYblohayaMPwH2N
 qbypCdt9dzpILawOHGx/QCxoUjQhT3I/zreBGSMA2wRAHBbHatuIIQ2U7zUreSk=
X-Gm-Gg: ASbGncsoExHUt2T0xJS5dSWiTWCK02Tyv/vaVRVxM2AKJ3GfQhDstwPorDEOs2GIFkU
 vd/y9LO9CjyuSCqp9bLcKa9jCvi5ITnQMs/3fUqN313yNDD0X4rlRCkI3i9KyJNGi5HJw1ZLY+6
 sfgPfJEKxK9AdmSuw24tC7KLE+Af20VDfHaIck09W0WAjvC0jy737UcWhJfDBS0IYiXOUnLNL/Q
 jTfNJ9TszPn9VIzM3NcWKg+UsBcwBR54kqsZX7+kU0s9r1b66v76PLRIKwJjuNpSR6rfLLqdH/V
 ZdEvGi3toi31WcliLT1ZjFDXK2Bb0IEp19+DlAKgJgmQ75mAuXuEg9hsq+s=
X-Received: by 2002:a05:6000:1865:b0:38c:5e03:5bb with SMTP id
 ffacd0b85a97d-38dc9138e84mr14125879f8f.41.1739228390001; 
 Mon, 10 Feb 2025 14:59:50 -0800 (PST)
Received: from [192.168.69.198] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dd6548b25sm7342066f8f.32.2025.02.10.14.59.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 14:59:49 -0800 (PST)
Message-ID: <d831600a-9a61-45c1-a535-f75bb64cdff4@linaro.org>
Date: Mon, 10 Feb 2025 23:59:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/10] target/arm: Set disassemble_info::endian value
 in disas_set_info()
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org, Thomas Huth
 <thuth@redhat.com>, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org
References: <20250210212931.62401-1-philmd@linaro.org>
 <20250210212931.62401-4-philmd@linaro.org>
 <7056fbfc-58eb-4881-a6ee-67b3e608a336@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <7056fbfc-58eb-4881-a6ee-67b3e608a336@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Yew8EDvhvPWQ

On 10/2/25 23:10, Richard Henderson wrote:
> On 2/10/25 13:29, Philippe Mathieu-Daudé wrote:
>> Have the CPUClass::disas_set_info() callback set the
>> disassemble_info::endian field.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   target/arm/cpu.c | 10 +++-------
>>   1 file changed, 3 insertions(+), 7 deletions(-)
>>
>> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
>> index 94f1c55622b..68b3a9d3ab0 100644
>> --- a/target/arm/cpu.c
>> +++ b/target/arm/cpu.c
>> @@ -1188,7 +1188,7 @@ static void arm_disas_set_info(CPUState *cpu, 
>> disassemble_info *info)
>>   {
>>       ARMCPU *ac = ARM_CPU(cpu);
>>       CPUARMState *env = &ac->env;
>> -    bool sctlr_b;
>> +    bool sctlr_b = arm_sctlr_b(env);
>>       if (is_a64(env)) {
>>           info->cap_arch = CS_ARCH_ARM64;
>> @@ -1215,13 +1215,9 @@ static void arm_disas_set_info(CPUState *cpu, 
>> disassemble_info *info)
>>           info->cap_mode = cap_mode;
>>       }
>> -    sctlr_b = arm_sctlr_b(env);
>> +    info->endian = BFD_ENDIAN_LITTLE;
>>       if (bswap_code(sctlr_b)) {
>> -#if TARGET_BIG_ENDIAN
>> -        info->endian = BFD_ENDIAN_LITTLE;
>> -#else
>> -        info->endian = BFD_ENDIAN_BIG;
>> -#endif
>> +        info->endian = TARGET_BIG_ENDIAN ? BFD_ENDIAN_LITTLE : 
>> BFD_ENDIAN_BIG;
>>       }
>>       info->flags &= ~INSN_ARM_BE32;
>>   #ifndef CONFIG_USER_ONLY
> 
> This is a faithful adjustment to the existing code, so,
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> However:
> 
> (1) aarch64 code is always little-endian,
> (2) sctlr_b is always false from armv7 (and thus always false for aarch64)
> (3) I think the BE32 logic is wrong -- CONFIG_USER_ONLY is irrelevant.
>      See linux-user/arm/cpu_loop.c, target_cpu_copy_regs.

What about v7-R [*]? I don't see SCTLR_IE defined as 1<<31 for AArch32,
only:

#define SCTLR_EnIA    (1U << 31) /* v8.3, AArch64 only */
#define SCTLR_DSSBS_32 (1U << 31) /* v8.5, AArch32 only */

---

[*] 
https://developer.arm.com/documentation/ddi0406/cb/System-Level-Architecture/System-Control-Registers-in-a-PMSA-implementation/PMSA-System-control-registers-descriptions--in-register-order/SCTLR--System-Control-Register--PMSA

SCTLR_IE, bit[31]

Instruction Endianness. This bit indicates the endianness of the
instructions issued to the processor. The possible values of this bit are:

0: Little-endian byte ordering in the instructions.
1: Big-endian byte ordering in the instructions.

When set to 1, this bit causes the byte order of instructions to be 
reversed at runtime.

This bit is read-only. It is implementation defined which instruction 
endianness is used by an ARMv7-R implementation, and this bit must 
indicate the implemented endianness.

---

For the Cortex-r5* we have, SCTLR_IE is always 0 in reset_sctlr.

Is it OK to consider v7-R implemented as little-endian in QEMU?
