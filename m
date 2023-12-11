Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp348839ejo;
        Mon, 11 Dec 2023 09:09:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEUfQMeBZLk3py7AmEgy5U1YjXpThSZP49t/hK4W63XvGZ3JCX2RiYCGEl0BXV73nR0qsHH
X-Received: by 2002:a05:6808:3a0f:b0:3b9:e5c0:f474 with SMTP id gr15-20020a0568083a0f00b003b9e5c0f474mr7219827oib.12.1702314592239;
        Mon, 11 Dec 2023 09:09:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702314592; cv=none;
        d=google.com; s=arc-20160816;
        b=EMiE4Qk5m/P5LozhpGLMSUKZOVYrEOOrFu3A6I6jsmKymkwd5H7Ke2WqoDAXFG6iB/
         Kxc7dVZxS8OiidzrVN+U+y8lNG0VI3s906NkyuNwIUNCfDtf1rn3G3xNnaIN2IFpsCYX
         YiXCbbeXnteY5b4gARUsO2mX42u61gbDPnx7uJsufmrQO8jAcxUzc0Ewtw8/VF+1Rqxy
         gekev3LlVlpboClVZzh2DEVnUw5+VCulQBuAPqUvH5UIY5i4SgrE1lzJ65a3fFpRon/b
         c/4zyjQfTsVfZAznCX1xaFeKjqzSBwBxka2NJWd0jyjUNHVJp+jk0xGD1eZGLyEGvWR8
         OgTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=sc1qgl70OVlwSYNp8DPvzNbv+pahk/dG2J+Svd8VVm4=;
        fh=slGESwP/hltSNUyhGZ2JL7LfxQpDkSgitqep8rykOnM=;
        b=v/AdZhD/8R6jcjwguL9vIkDjw1p0nBpgMAYeTD6oSFxoG+ErwhezmNN7uTzCZErGCc
         pWwQxM9BXJePfh9Qik2rCWiKxtz/OreLsASFMChAmE0UAMtE2chgGe7LkLpNl3IsnU7L
         mRcLwSAynd98TiZzt2q8J99cR5mteahM3/kpixbi960k68+WIq8aCLmuJquOk+108fBq
         ZmMv5rSLoO1wan3koPTb0XCii8iJUkXG7DOF8rrJPvsMHtBIliqNhlwqAQ7TzL0kNbPj
         tjpYDYtDEjW6mEYorxAUS1DqbJv7YcV8fWNDkJd5aT72wodB0EWzsekx25DAy0RU9LFv
         lwHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PmWJ0X4Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b5-20020a67fe85000000b0046480cf3f99si1422419vsr.631.2023.12.11.09.09.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Dec 2023 09:09:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PmWJ0X4Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rCjmf-0001gY-AA; Mon, 11 Dec 2023 12:09:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rCjme-0001g5-2y
 for qemu-arm@nongnu.org; Mon, 11 Dec 2023 12:09:32 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rCjma-0000UH-67
 for qemu-arm@nongnu.org; Mon, 11 Dec 2023 12:09:31 -0500
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-6ceba6c4b8dso3617026b3a.1
 for <qemu-arm@nongnu.org>; Mon, 11 Dec 2023 09:09:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702314566; x=1702919366; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sc1qgl70OVlwSYNp8DPvzNbv+pahk/dG2J+Svd8VVm4=;
 b=PmWJ0X4YEpZU37N4vYCBLJmqQFQKBwIU5bg36j/EB2VuPsA82f6RoES3JxLbvm6vYw
 o3RfI41YaCwkpQJh0EdIbipA5mKdjPQqbXAWQiG6L593aD3zHWYvfCD9qHroesx74hhU
 V8ZYO/HJ0+4Mo0To31pGCEMs4AuH70O2cKljUMsGDXXv7T7njiHlvOYd4ijKuZkVWLhe
 s0H4AUTjk6xEA74L0FJv9pWE/31dAwnix5P1PV4h2+kB1LMRePTaWdYIqW4mP6Jakukb
 5t19icptZ/6oZRQbVijujY4Z4SgbChL4/+T0/8S+7lO18AzsJYQR5pF01jrrAiCHiVYV
 6Fww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702314566; x=1702919366;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sc1qgl70OVlwSYNp8DPvzNbv+pahk/dG2J+Svd8VVm4=;
 b=PjjlBixAabn5iUBqKEt/QfLIcWN8M9RdrthywZv1tcL3+SIqGb5kcLMs0/huwWNsxH
 32Ydv8q2geKSxmBRDJeVKS7hPGcivSQFPcnxZihggQJBzNsgyJbrdfd7ZLkaqK4asKBN
 OU373ALLYr+q6p7hyS4RJGFPLxPBDFOet06JMbKYHga2f4ejtpZ/0RDjKtPzAxbM7HQ8
 vBvbWMIPO4hzSFq1h0NKlNf83Toj4IGHW/0jO7ztmJD0RXiCvKgsTPBJohLNMjtsdqUu
 SKhifyXLxCL1dp3Ikor9cNRBAH8F8I65LjUKYtZsjGs3VchEwfTipcmN1zsT2p+lUdBg
 mcHQ==
X-Gm-Message-State: AOJu0YwJGkmRWJzuUU8yfKFJw65qzfSd85NKyOoXvUIJ0pThZ/YET5gP
 r01pO/9XRBpfGqU0Cgdj2c7HHg==
X-Received: by 2002:a05:6a00:194d:b0:6ce:4927:2811 with SMTP id
 s13-20020a056a00194d00b006ce49272811mr5640987pfk.22.1702314566032; 
 Mon, 11 Dec 2023 09:09:26 -0800 (PST)
Received: from [192.168.0.4] ([71.212.149.95])
 by smtp.gmail.com with ESMTPSA id
 w2-20020a654102000000b005c65ed23b65sm5546397pgp.94.2023.12.11.09.09.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Dec 2023 09:09:25 -0800 (PST)
Message-ID: <3c2d3736-4cae-4034-973b-568e80cbf0c3@linaro.org>
Date: Mon, 11 Dec 2023 09:09:23 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/21] target/arm/kvm: Init cap_has_inject_serror_esr in
 kvm_arch_init
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20231123044219.896776-1-richard.henderson@linaro.org>
 <20231123044219.896776-19-richard.henderson@linaro.org>
 <4889143b-e15e-4834-af2f-ddea2dd63cb6@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <4889143b-e15e-4834-af2f-ddea2dd63cb6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: mvhBYHgaoQli

On 11/24/23 03:54, Philippe Mathieu-Daudé wrote:
> On 23/11/23 05:42, Richard Henderson wrote:
>> There is no need to do this in kvm_arch_init_vcpu per vcpu.
>> Inline kvm_arm_init_serror_injection rather than keep separate.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/arm/kvm_arm.h |  8 --------
>>   target/arm/kvm.c     | 13 ++++---------
>>   2 files changed, 4 insertions(+), 17 deletions(-)
> 
> 
>> @@ -562,6 +556,10 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
>>       cap_has_mp_state = kvm_check_extension(s, KVM_CAP_MP_STATE);
>> +    /* Check whether user space can specify guest syndrome value */
>> +    cap_has_inject_serror_esr =
>> +        kvm_check_extension(s, KVM_CAP_ARM_INJECT_SERROR_ESR);
>> +
>>       if (ms->smp.cpus > 256 &&
>>           !kvm_check_extension(s, KVM_CAP_ARM_IRQ_LINE_LAYOUT_2)) {
>>           error_report("Using more than 256 vcpus requires a host kernel "
>> @@ -1948,9 +1946,6 @@ int kvm_arch_init_vcpu(CPUState *cs)
>>       }
>>       cpu->mp_affinity = mpidr & ARM64_AFFINITY_MASK;
>> -    /* Check whether user space can specify guest syndrome value */
>> -    kvm_arm_init_serror_injection(cs);
>> -
>>       return kvm_arm_init_cpreg_list(cpu);
>>   }
> 
> 
> Just checking, in a heterogeneous setup we still want to keep
> these 2 calls per-vCPU, right?

There is no hetrogeneous kvm -- every vcpu must match the host cpu.


r~


>      if (kvm_check_extension(cs->kvm_state, KVM_CAP_ARM_PSCI_0_2)) {
>          cpu->psci_version = QEMU_PSCI_VERSION_0_2;
>          cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_PSCI_0_2;
>      }
> 
>      if (!kvm_check_extension(cs->kvm_state, KVM_CAP_ARM_PMU_V3)) {
>          cpu->has_pmu = false;
>      }



