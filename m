Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp415295ejo;
        Mon, 11 Dec 2023 10:59:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE8QRbMgbdq6at5HkNEsv+w/0hFprSHyRWPxD8kVaYXr6Xjdl00ilHu7y5lU1bdxr/EFAHe
X-Received: by 2002:ad4:4af4:0:b0:67a:6bf1:4fce with SMTP id cp20-20020ad44af4000000b0067a6bf14fcemr4621175qvb.16.1702321144014;
        Mon, 11 Dec 2023 10:59:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702321143; cv=none;
        d=google.com; s=arc-20160816;
        b=heRBd/f8Vw+3dsChj9I3+jWjRwvRm4mNt52XQowVW6varzWIh8Lot2RUdZcLWlhVIc
         e6Atc3e+N6lI45K6GrdGXfP5Dd6EyK4RXgZRaOFz9Rdcxvqi8meIvZsINvqzLsqhZqTs
         qymLI4Q4Vh70flwsev0ppfAdvySockILBfEGega1FqJ4FTHh0z43vk27BUzDixvuVGxR
         NRzKKVEvzGnZ014Me2vFEhOUuswfZj4HdFIIIyZXAI5x5VpEiHtAsA/SOmZYc0HSsdsB
         15YEioBwmMwDzhJT95lcGTHETjhiRm9I55vhHyGPpbyKKhZ7ji74i7wK0Y1npU+i4fhJ
         yzog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=VfcAmP3/dpn9dPyKJHCa9ZOX7l5aia6nLSNaLrDGzBA=;
        fh=slGESwP/hltSNUyhGZ2JL7LfxQpDkSgitqep8rykOnM=;
        b=qdcJHaZn6LtW8cRLpNqGoSDwK8aiJxHWDg8EMmWIyA4av4FrYU582Tzbv+01a7vh5v
         aNLYeOVZQaHQqgyAFY2Xe901M9QAuhjsJnyxg/czasqc2CHTlzts+FdPQ4CjqHUp+p5G
         dPgksnP+4dluy9qYUaNncKcOTx9xbX0qN3kJBLMpQCBj3VpDyGO+fweCW3Y7rTVZUCEz
         zSQK9AJnU38Qq6gunHrESOSANL/s14QTe5u4z4jw8PGAaPoJCEfl/6M+pCysD/Tidwje
         e9LpYIJb83GH0PpuMPNG1NnBbwkgI/EXctWDPv+F0nxooRT3dNTfU5dGo3lIF+j080hd
         uxaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MTqKYfsu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pr11-20020a056214140b00b0067acbddc7e2si8770234qvb.203.2023.12.11.10.59.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Dec 2023 10:59:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MTqKYfsu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rClUS-0004Jk-93; Mon, 11 Dec 2023 13:58:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rClUN-0004JJ-QZ
 for qemu-arm@nongnu.org; Mon, 11 Dec 2023 13:58:49 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rClUI-0003Lr-Nm
 for qemu-arm@nongnu.org; Mon, 11 Dec 2023 13:58:47 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-28657040cdcso3781092a91.3
 for <qemu-arm@nongnu.org>; Mon, 11 Dec 2023 10:58:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702321121; x=1702925921; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VfcAmP3/dpn9dPyKJHCa9ZOX7l5aia6nLSNaLrDGzBA=;
 b=MTqKYfsunEEH4HH57MVCp8+0gl6YXmZxqgbBZKEdxrDwmoNMBfjv3ozULyCC4ohuka
 WCvl5wdBqdErSiAKrlaZP5OeDe7c2s9yAnRQx7j6qpUp+6uXOxZwQZF2Mjd+AkRG9pG5
 11WncmigzXzlO/8ODKKJcYsyEddNmw3nv3aL2Ca8X2NDNaryNkt9Wx6Y6dG01tETG3F3
 war3vSVa3MDzNSaE0YhNIG1YbF8s9mwx5z+rsOLTKJ7+RW/iBLpuqalLbm2+CXQatczr
 05joWhXZbcWCD0iZ+qbcnXg7ktY0gZ1RIG6Y+HzOFaXMyOp2dzZXij9VHESb3MQlIjXn
 DKdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702321121; x=1702925921;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VfcAmP3/dpn9dPyKJHCa9ZOX7l5aia6nLSNaLrDGzBA=;
 b=tuvF5W9s4q6J8adi+dbTFoIERu+ubvrJgxzEUxLJ8iMxALX2KFOXTcuwUlDD3DHT+c
 iAz6GM9cd8uySbLWBQnp6Lb7bc1xKvyJ5wzKJAaYV3uhmk7CuITn9h1RGkpjvq/HE5rs
 3KmB78SWjSVlkj91rS7Mq7RVWk8pzuey769okyIGa2Kg+Lv0B9CFMQl6pK5eXYziFGXJ
 s8vGaVUXkwuDX4ijukryEG2/v40gqmiL0Mc62MHy5aIERWzpM4WBaBWH58dcwUFpAyc7
 pYALoola7KpoWfX0ShIHYAOCHrklDw2ctR1mFNj+yizOHUaI0xzoZDPEGHCdr9D/o2Ey
 /bkg==
X-Gm-Message-State: AOJu0YwJYoWR+6Y21Mm37YKPEergZglZTJVQbJLQ8oTO8rmSwxnP2m/q
 vRz2OPmZdLKwO8wkamS9LMuKPIOcojuWzsI2c0Uyqw==
X-Received: by 2002:a17:90a:8a03:b0:28a:4f78:e316 with SMTP id
 w3-20020a17090a8a0300b0028a4f78e316mr1991637pjn.53.1702321120858; 
 Mon, 11 Dec 2023 10:58:40 -0800 (PST)
Received: from [192.168.0.4] ([71.212.149.95])
 by smtp.gmail.com with ESMTPSA id
 pw10-20020a17090b278a00b002867594de40sm8826234pjb.14.2023.12.11.10.58.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Dec 2023 10:58:40 -0800 (PST)
Message-ID: <4172e204-b09a-4673-ae8b-4662c3db5fae@linaro.org>
Date: Mon, 11 Dec 2023 10:58:38 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/21] target/arm/kvm: Init cap_has_inject_serror_esr in
 kvm_arch_init
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20231123044219.896776-1-richard.henderson@linaro.org>
 <20231123044219.896776-19-richard.henderson@linaro.org>
 <4889143b-e15e-4834-af2f-ddea2dd63cb6@linaro.org>
 <3c2d3736-4cae-4034-973b-568e80cbf0c3@linaro.org>
 <8cd2093f-dc74-469b-8bac-d290206af116@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <8cd2093f-dc74-469b-8bac-d290206af116@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: byatIiR3F5hm

On 12/11/23 10:43, Philippe Mathieu-Daudé wrote:
> On 11/12/23 18:09, Richard Henderson wrote:
>> On 11/24/23 03:54, Philippe Mathieu-Daudé wrote:
>>> On 23/11/23 05:42, Richard Henderson wrote:
>>>> There is no need to do this in kvm_arch_init_vcpu per vcpu.
>>>> Inline kvm_arm_init_serror_injection rather than keep separate.
>>>>
>>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>>> ---
>>>>   target/arm/kvm_arm.h |  8 --------
>>>>   target/arm/kvm.c     | 13 ++++---------
>>>>   2 files changed, 4 insertions(+), 17 deletions(-)
>>>
>>>
>>>> @@ -562,6 +556,10 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
>>>>       cap_has_mp_state = kvm_check_extension(s, KVM_CAP_MP_STATE);
>>>> +    /* Check whether user space can specify guest syndrome value */
>>>> +    cap_has_inject_serror_esr =
>>>> +        kvm_check_extension(s, KVM_CAP_ARM_INJECT_SERROR_ESR);
>>>> +
>>>>       if (ms->smp.cpus > 256 &&
>>>>           !kvm_check_extension(s, KVM_CAP_ARM_IRQ_LINE_LAYOUT_2)) {
>>>>           error_report("Using more than 256 vcpus requires a host kernel "
>>>> @@ -1948,9 +1946,6 @@ int kvm_arch_init_vcpu(CPUState *cs)
>>>>       }
>>>>       cpu->mp_affinity = mpidr & ARM64_AFFINITY_MASK;
>>>> -    /* Check whether user space can specify guest syndrome value */
>>>> -    kvm_arm_init_serror_injection(cs);
>>>> -
>>>>       return kvm_arm_init_cpreg_list(cpu);
>>>>   }
>>>
>>>
>>> Just checking, in a heterogeneous setup we still want to keep
>>> these 2 calls per-vCPU, right?
>>
>> There is no hetrogeneous kvm -- every vcpu must match the host cpu.
> 
> So big.LITTLE will never be a KVM thing?

Not as far as I'm aware.  There are even issues *running* on big.LITTLE hosts -- you must 
use taskset to limit qemu to one cpu type, either big or little.


r~
