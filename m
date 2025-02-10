Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp2283905njb;
        Mon, 10 Feb 2025 15:38:45 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXkUKmVk5kD2EQGYyuzbVs+K2iWB88wZPAexg6OjIjohGUUnykA/eMFtv7W159rI8sEAd3A/NvUQM/cAA==@linaro.org
X-Google-Smtp-Source: AGHT+IE26rkGxrPP70LfIndm7l5F+gTQD5SHyXwrEy0u0ww4kgOBVdC7iTYR2blWdvbNvHHsBjQG
X-Received: by 2002:a05:6214:5188:b0:6e4:41b3:497e with SMTP id 6a1803df08f44-6e445740aebmr215764466d6.40.1739230725344;
        Mon, 10 Feb 2025 15:38:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739230725; cv=none;
        d=google.com; s=arc-20240605;
        b=c2lyueG4dkk9Y07OY3GQOfThj0i/4kLkEG2YLY95WZ9HDiHlp4+WQU/iyoORjpE/l1
         63IjybK0p2e4hRE1OYBQs0Ah8mZ5oREw+AzI0XnN32qJvV/Zu0eWNAqCZr+j7E9JqNMo
         3sj2cmFAY8nyv2G0ZegNEH9zgt0xr8mngCFHZCN3f/dtYS0tKV5rYSBqjBF+w73mcQiw
         NgSloVTBbLwceT7qFnbZdykbFtjNojV8ltl9JW9T36MlVRk60VXhK3/PgSKE+v5cuxT0
         IbvHq7ewoHBH7BT5C5XNiS14jBPxMajp/EEXRJkF1F+mxNWmRM7HkWLO+pwoHwqN4Gfw
         eC1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=StsB3S9Tgh2SGvc+WCIefccd7ZPEsviJiZvgWQBs900=;
        fh=5ZhxiZwynxcGD+YN3C14ynl+Ay3CSeDomgzBscPPReQ=;
        b=KQVvRefHVLbBXI80rP6LFTeEoH9k/1rhe1Niv7R+/YWj/7GgzfHSB/cGOfACaR4hg0
         PvNgnRqNZecLzuGJRVJ+b+hOwchwlfprZ2B4G2z5F/LwM3G3cNmwFLkKms0AChnPdpNW
         9rjTQFKy0oEpsSFhpav6zTnHCfEDqWC9qU3ED8r8RCK44usFhLhiwhqFyjki5DVHhqfs
         22RAjnP5smPj843PY24d+JPsqoyL5yz2CaO5vWbTFuI2iUYMXruX9h2ymNPVj3QtdQ7E
         PCXYBmqM6BKvLue5Sr7RY2luD0HbVbpxkSpYtNifi6HhZqCN/pcV7HO2JoG7fnX3ph/U
         BzFg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="d/pCbQSD";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e441c26cc4si91387246d6.392.2025.02.10.15.38.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Feb 2025 15:38:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="d/pCbQSD";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1thdM3-0000tC-Fj; Mon, 10 Feb 2025 18:38:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1thdM0-0000rt-Pz
 for qemu-arm@nongnu.org; Mon, 10 Feb 2025 18:38:17 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1thdLx-0001HZ-Hi
 for qemu-arm@nongnu.org; Mon, 10 Feb 2025 18:38:16 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-2fa2c456816so5098449a91.1
 for <qemu-arm@nongnu.org>; Mon, 10 Feb 2025 15:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739230691; x=1739835491; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=StsB3S9Tgh2SGvc+WCIefccd7ZPEsviJiZvgWQBs900=;
 b=d/pCbQSD7CMB9238TU9Gv2nc0RXVpIcZmad2WL8oZClgaS22KFXU65POzPynP6/tCw
 bhNU1kKrVkwkCGD2ty/JIjsug4sX5jzGNqa0nscXR3mho9MAvjLSf/A+21mkfdDn2BDo
 LxgjUkRyN+zh5u7vv2JlU2Tfl05v46TOp7pdl5t/TckxYjBQ4+Upc7BwlQ1ulYck9Jqo
 CrS4BzjAC4wPwlLiDyw1tqBSX2Nllr+qqtbpcAAhXMA4XmHhYpFm8QSq/wjUsRyGFfXM
 eoz9xjXfiMQLsNKPblB/BHlotyDTiBAJg2y5WPClJYeiyqj/Mv6wps/7FYEv0hT7Hgf9
 nNkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739230691; x=1739835491;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=StsB3S9Tgh2SGvc+WCIefccd7ZPEsviJiZvgWQBs900=;
 b=ro5jmixpblshij+JhmuwhBdbKJE+ab5NP4EY1wNquS4mDW3+BRI8iIaMP4aLPKxyJ8
 6WbOZuhc5aCPiZcSey6aMQwNYJTTnEEBroiBjgaEWBnRP0xQ4AVkSaYeDfvmHN0joW3H
 3PUrIMSQUSVj/zlSipTw32vAtUiWV/hSoV7FS5wtLvFW6nGNp1bzkWsWt48zykygbbe0
 DcypGuijJrrkDPHsQ/5IWfR+xAHp4RKkpsgaKb+MRupTrKxdQ4pmsYESuujCS4hUQFxI
 LzZcoEFgFElbuN3g7LRJDh3K64HJVGQeM58zTKSO/N2whEWWdcydPFdpXJbRaDB0eSBk
 IDgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRRwtK96qgPuAMWQCmxg4Otajb6x/uURtEfM0C1J7fk8rz3oXpinpyWLHd2eLDWA7T7z7hGdjr4g==@nongnu.org
X-Gm-Message-State: AOJu0YwBPWdWsNRVH/QQlKrcSk9TcLhrUiabQIHYtq+dLWF+PXjgLkvi
 NJ9BKEdsEZW5v9AxH7fEKSuorSPAPadqHL5fLNupSVO/plnwNvtkCPQwfDux5Q0=
X-Gm-Gg: ASbGncvhLnxPwFt0uZGO0iw7zHLSgdldyrX73/txkgA/XLZ8/+VWZhXzo4qq2CS5V8w
 7zK2XuWmkcjW72Jh9cYb4p02vpcpXfURJwkTp1v8WFnFFi4AP/HHyFhXMlqxJToMp3NUIRJFD/D
 daLvmC72JoUlrqDTKKu5AcRkD6GQCbate8RWMB8eabgOpHQpUeqkP2F3sP40RXpokIuvSuCuy5p
 6DXQFAgHuwzD+WMFb6QaNbrPlFOJl7Mho5vkpejfAnNmj9TriuSoDsHd/BwaIoT8gK04TmNh5pX
 fZS9f6+U8IBuldfb3F/PGguids0SSQ1sVbIMdFx+kO/a+jBom+6LCCI=
X-Received: by 2002:a05:6a00:1890:b0:730:a40f:e6f1 with SMTP id
 d2e1a72fcca58-730a40febc2mr4597418b3a.21.1739230670806; 
 Mon, 10 Feb 2025 15:37:50 -0800 (PST)
Received: from [192.168.0.4] (71-212-39-66.tukw.qwest.net. [71.212.39.66])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-730882d214fsm3283800b3a.18.2025.02.10.15.37.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 15:37:50 -0800 (PST)
Message-ID: <81656309-3b6f-45bd-8519-070a366c27cb@linaro.org>
Date: Mon, 10 Feb 2025 15:37:48 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/10] target/arm: Set disassemble_info::endian value
 in disas_set_info()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org, Thomas Huth
 <thuth@redhat.com>, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org
References: <20250210212931.62401-1-philmd@linaro.org>
 <20250210212931.62401-4-philmd@linaro.org>
 <7056fbfc-58eb-4881-a6ee-67b3e608a336@linaro.org>
 <d831600a-9a61-45c1-a535-f75bb64cdff4@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <d831600a-9a61-45c1-a535-f75bb64cdff4@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
X-TUID: GCEMmPgf0yx2

On 2/10/25 14:59, Philippe Mathieu-Daudé wrote:
> On 10/2/25 23:10, Richard Henderson wrote:
>> On 2/10/25 13:29, Philippe Mathieu-Daudé wrote:
>>> Have the CPUClass::disas_set_info() callback set the
>>> disassemble_info::endian field.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> ---
>>>   target/arm/cpu.c | 10 +++-------
>>>   1 file changed, 3 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
>>> index 94f1c55622b..68b3a9d3ab0 100644
>>> --- a/target/arm/cpu.c
>>> +++ b/target/arm/cpu.c
>>> @@ -1188,7 +1188,7 @@ static void arm_disas_set_info(CPUState *cpu, disassemble_info 
>>> *info)
>>>   {
>>>       ARMCPU *ac = ARM_CPU(cpu);
>>>       CPUARMState *env = &ac->env;
>>> -    bool sctlr_b;
>>> +    bool sctlr_b = arm_sctlr_b(env);
>>>       if (is_a64(env)) {
>>>           info->cap_arch = CS_ARCH_ARM64;
>>> @@ -1215,13 +1215,9 @@ static void arm_disas_set_info(CPUState *cpu, disassemble_info 
>>> *info)
>>>           info->cap_mode = cap_mode;
>>>       }
>>> -    sctlr_b = arm_sctlr_b(env);
>>> +    info->endian = BFD_ENDIAN_LITTLE;
>>>       if (bswap_code(sctlr_b)) {
>>> -#if TARGET_BIG_ENDIAN
>>> -        info->endian = BFD_ENDIAN_LITTLE;
>>> -#else
>>> -        info->endian = BFD_ENDIAN_BIG;
>>> -#endif
>>> +        info->endian = TARGET_BIG_ENDIAN ? BFD_ENDIAN_LITTLE : BFD_ENDIAN_BIG;
>>>       }
>>>       info->flags &= ~INSN_ARM_BE32;
>>>   #ifndef CONFIG_USER_ONLY
>>
>> This is a faithful adjustment to the existing code, so,
>>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>>
>> However:
>>
>> (1) aarch64 code is always little-endian,
>> (2) sctlr_b is always false from armv7 (and thus always false for aarch64)
>> (3) I think the BE32 logic is wrong -- CONFIG_USER_ONLY is irrelevant.
>>      See linux-user/arm/cpu_loop.c, target_cpu_copy_regs.
> 
> What about v7-R [*]? I don't see SCTLR_IE defined as 1<<31 for AArch32,
> only:

BE32 was a really old arm thingy, and I it was removed in armv7 (see arm_sctlr_b).
With BE8 (armv6+), instructions are always little-endian, only data accesses change.

> For the Cortex-r5* we have, SCTLR_IE is always 0 in reset_sctlr.
> 
> Is it OK to consider v7-R implemented as little-endian in QEMU?

Yes.


r~
