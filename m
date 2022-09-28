Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp389283ocs;
        Wed, 28 Sep 2022 08:56:39 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5gCL8jCbkeiVtfH9vXOLlhzgW4NMnxjvooFcexgYCc5iUDoK6rNjm6GOur38+7XYRWG/pv
X-Received: by 2002:a05:620a:146d:b0:6cd:f206:ed1e with SMTP id j13-20020a05620a146d00b006cdf206ed1emr21562441qkl.424.1664380599292;
        Wed, 28 Sep 2022 08:56:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664380599; cv=none;
        d=google.com; s=arc-20160816;
        b=qOda3e4vtAnh3ioCWko+VpR/nrfPxHQ8F3LLPJMlkeMVRiJX86O0RaUHgAz6zak280
         aVjC45WzcErA/nXhOuOOAhfMTunAdK3W9fmjOmyTySGrPSy0cvfP6f+mJnz7sxj4HU1a
         aMjkrsBC1mvJ6hX1jW+u1I79iLEQxAfFllI8XUnAY2+fW2w6PvJKFsyKL0WGM5XJPb1d
         Npph0y3zH99B4u2dqv3MvIQPmXvEYwzzyTNDEE+7VoUmawwpzNthWVIOcw6zP3uR4BSS
         KfikLX8zR/KcTWj8sSPdoFQMan8nLF/8cd3qW73Vwdlw2s5gbFbbMKN4GUuPskYxAWeI
         j5BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=zO/3gRARPVKqBGrVCKlLqJ5musud7IhBRCl8HnTAZZc=;
        b=Nd8UaY8z60zFpUnJQvBVTQjSJgW6dfPKRTn/Uz3teGHzT4o02dWv+jypxwozaQd0BO
         tsM0XNteCNt4AR3xLAK6alScdJ2MQQ4dVjrDkaFDFvVtuM93e43acsuNsEfDEjsK3U6U
         9/YZRwR1fvI081EOY+kJTRTFwfIyGNU2Vl5IL8+x15H6k8N7Yi3A6I7cABxrtBrKuElk
         WVba90NW9G5TrjoTj4b2gGgyF24QxX9CCp4lnsVBdj+y7vM29EcRjNxAFs08WY3/KApE
         zTvvt35oteA1yQ0c5gMaRZkMmUe30qL5kAWLsjhcW765xxvhusBSysupyYfu5fw8D6A7
         kApg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MVMradfZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p18-20020a05620a133200b006ced43908ccsi2378093qkj.669.2022.09.28.08.56.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Sep 2022 08:56:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MVMradfZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1odZQM-0007VK-RQ
	for alex.bennee@linaro.org; Wed, 28 Sep 2022 11:56:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odZMk-0003bc-KB
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 11:52:55 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:40693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odZMc-0005ub-RB
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 11:52:54 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 h8-20020a17090a054800b00205ccbae31eso2841037pjf.5
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 08:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=zO/3gRARPVKqBGrVCKlLqJ5musud7IhBRCl8HnTAZZc=;
 b=MVMradfZWwpLR1qDUnGrV9vuD3bZiKZwG1jrRcpYS6ciKXfQSxq8L1M2PBtbkKQYS6
 lRMZzg6MEAchMfbwxJt1NJy6YbEwlLRWR0bdKrr6I7DpbOsaaF4SMyfM3nqTVsktj5/y
 aI3pGQSxfzPijwFqBahRxEbMLmZptev6FK4cjdm757WE26wT7WCTmvyfW8BBTO5LRTQ3
 hRBBoJ5T1bA5pT4zB2gpnrd+qQrkGxF+TP26LdlLAqgQ9SWMMJPVe3XckY4K+CkF6CPK
 hIw+FcDWD9fb0qWZbwXufUsyNC3BVDmzoqTgB9JEA1JTOxr/oSB37OZ7oAETaM4QxdB4
 bJmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=zO/3gRARPVKqBGrVCKlLqJ5musud7IhBRCl8HnTAZZc=;
 b=vVtanMdCtFTORLPX9pSi5Ra/YyYwQYLJ6iGhos6czaZ0N0Vm1YX9PZ3rdugRjsF/85
 w/rOxQlU0gP9FjAq2PkfoPsx0bf0K4wJ5o4/rJiaL+e4686x0KJYTfQSgh2iD9Mbo9NT
 XRaJMg5Eu9lk3G1MblOo1Ajd7njcX52hY7Ogi3OrKGzQbFKEDxRodtZ72V69A7H7bVca
 GiVf0ElwKpJ9673zjW+R4Fj1jC/YaQ0DB8N3E/LqEjdZySBLc7yu8Dsvkx6hiPoirYpp
 zNNdHzmcvXF7Yfa/RITmRMkpTMzDPUlXKrWm/4hHA7aEmTydlCXrAT+ETeQY+cqIgu8t
 6k1w==
X-Gm-Message-State: ACrzQf0jL7AEuGdY9NLchz0fi/cAJ4BNfm1bEhII6RzfqM7ImEqtDUC9
 GCdTsiPYxMThxGH7yv3G+2NY7Q==
X-Received: by 2002:a17:90b:711:b0:203:6aa0:1dc2 with SMTP id
 s17-20020a17090b071100b002036aa01dc2mr11241152pjz.242.1664380364947; 
 Wed, 28 Sep 2022 08:52:44 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:986f:cb56:6709:4057?
 ([2602:47:d49d:ec01:986f:cb56:6709:4057])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a17090ad50500b001fdc88d206fsm1704508pju.9.2022.09.28.08.52.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Sep 2022 08:52:44 -0700 (PDT)
Message-ID: <575c3a9d-48bf-4ad4-2417-82ad652f1a04@linaro.org>
Date: Wed, 28 Sep 2022 08:52:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] target/arm: Do alignment check when translation disabled
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Idan Horowitz <idan.horowitz@gmail.com>
References: <20220914115217.117532-1-richard.henderson@linaro.org>
 <20220914115217.117532-3-richard.henderson@linaro.org>
 <CAFEAcA-_v4bY5fdXsK6EHncxVrznrrS_-VgqD_fOR4ScrvidvA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA-_v4bY5fdXsK6EHncxVrznrrS_-VgqD_fOR4ScrvidvA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.319,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aQNIbP+SYmgL

On 9/22/22 08:31, Peter Maydell wrote:
> On Wed, 14 Sept 2022 at 13:47, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> If translation is disabled, the default memory type is Device,
>> which requires alignment checking.  Document, but defer, the
>> more general case of per-page alignment checking.
>>
>> Reported-by: Idan Horowitz <idan.horowitz@gmail.com>
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1204
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/arm/helper.c | 38 ++++++++++++++++++++++++++++++++++++--
>>   1 file changed, 36 insertions(+), 2 deletions(-)
>>
>> diff --git a/target/arm/helper.c b/target/arm/helper.c
>> index d7bc467a2a..79609443aa 100644
>> --- a/target/arm/helper.c
>> +++ b/target/arm/helper.c
>> @@ -10713,6 +10713,39 @@ ARMMMUIdx arm_mmu_idx(CPUARMState *env)
>>       return arm_mmu_idx_el(env, arm_current_el(env));
>>   }
>>
>> +/*
>> + * Return true if memory alignment should be enforced.
>> + */
>> +static bool aprofile_require_alignment(CPUARMState *env, int el, uint64_t sctlr)
>> +{
>> +    /* Check the alignment enable bit. */
>> +    if (sctlr & SCTLR_A) {
>> +        return true;
>> +    }
>> +
>> +    /*
>> +     * If translation is disabled, then the default memory type
>> +     * may be Device(-nGnRnE) instead of Normal, which requires that
> 
> "may be" ?

Indeed, weak wording: "is".

> 
>> +     * alignment be enforced.
>> +     *
>> +     * TODO: The more general case is translation enabled, with a per-page
>> +     * check of the memory type as assigned via MAIR_ELx and the PTE.
>> +     * We could arrange for a bit in MemTxAttrs to enforce alignment
>> +     * via forced use of the softmmu slow path.  Given that such pages
>> +     * are intended for MMIO, where the slow path is required anyhow,
>> +     * this should not result in extra overhead.

I have addressed this todo for v2.  It turns out to be quite easy.

> The SCTLR_EL1 docs say that if HCR_EL2.{DC,TGE} != {0,0} then we need to
> treat SCTLR_EL1.M as if it is 0. DC is covered above, but do we need/want
> to do anything special for TGE ? Maybe we just never get into this case
> because TGE means regime_sctlr() is never SCTLR_EL1 ? I forget how it
> works...

It might be, I'll double-check.

> We also need to not do this for anything with ARM_FEATURE_PMSA :
> with PMSA, if the MPU is disabled because SCTLR.M is 0 then the
> default memory type depends on the address (it's defined by the
> "default memory map", DDI0406C.d table B5-1) and isn't always Device.

Ok, thanks for the pointer.

> We should also mention in the comment why we're doing this particular
> special case even though we don't care to do full alignment checking
> for Device memory accesses: because initial MMU-off code is a common
> use-case where the guest will be working with RAM that's set up as
> Device memory, and it's nice to be able to detect misaligned-access
> bugs in it.

Without the todo, I guess this goes away?  I will have a comment about the difference 
between whole-address space vs per-page alignment checking.


r~
