Received: by 2002:a17:504:82cc:b0:1be9:327d:8ee3 with SMTP id m12csp311033njj;
        Tue, 29 Oct 2024 08:03:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUCm4Rn4KR9dJYfaStUFwLK27XUfH98M1iuIZnVM4/ae1rPF4+R56P3UwqZ51Vw/oLyBcws6gJNSbx4Eg==@linaro.org
X-Google-Smtp-Source: AGHT+IHUzyt0pB7HRrV5fWpbU9IafI7F5gOpczrVHaFOBtZkXTUjQLFkdC/U7nVfAWqRyO0bJbQT
X-Received: by 2002:a05:6122:78f:b0:50c:e37a:97e3 with SMTP id 71dfb90a1353d-510153410b0mr10152433e0c.11.1730214209773;
        Tue, 29 Oct 2024 08:03:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730214209; cv=none;
        d=google.com; s=arc-20240605;
        b=WXaJ/6QZhaYcYa938CBASa0QrOep/LaBfRwjJFq/bdrw2WhmzKIh2D2SvkkmyS7BoZ
         xC3ZNQAAeiEhkYoy1rZIil2Z5xBQcyw3Czkz6LHmDhHdBiisFp1nWt8ZFz3QTecPWUvv
         RDDeekdzbRE5imBNYWd1OPqTiC50tIoBt4zn6ZbW9E2Op34SQ2mSjIn+Qn0RLhOi5ZYG
         OwPbWboP7mhjZ+jPlpiktB6uz+2uacX+82PF9VpG9tX9DAAIDf5CwrjjcidI+74cFs15
         pyyxwBysOUlsBDUJgNOR101hCJYzr2Teq2qpzoGIjnINTxCK7MQNvIsUY0qfNMWlMsyY
         kAQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=aN+DMnnFx9m7E1l9tNxrV14849dApGTvjUQ0xKcWI0M=;
        fh=iruS/Og91aBydkvWGeSqfnCZzqL/sWJby3+Ot1rKiVw=;
        b=UUoWWhSaFl2kp5gJRN9gjZP97RXQSROthJ5zQiZaDHgeSW0m047S8jSd/8S2fSn0BI
         aPqe28qasLAv/3TYHARGtwXFkFfwaN46ARakrgVeKIScFZ4OWpi1JR2VGI2CGXQ65LNx
         KTEUwYHvM659fLh8QkyiQwPzBJfo9a9IVr+mPEApKpGRiqxye3p90KA4cC7iHgKSu2R/
         LYRc6Mp7fCtNk0KGc7O3GPUcU4HHPZEzHqz5MXtLjEeMRsU97KBLlGRhwUry6DJuz7YR
         JfQ5Stv2JKFt70ALmjdrVcTNTTNgh8d9w66A+QA8PbZ/6u4KPXDx7E0WL2zN1qSenxxd
         x5OA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y7LECfQI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4a8c534b29bsi2291636137.543.2024.10.29.08.03.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Oct 2024 08:03:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y7LECfQI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t5nkg-0001Wb-2Q; Tue, 29 Oct 2024 11:03:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1t5nkd-0001WQ-Af
 for qemu-arm@nongnu.org; Tue, 29 Oct 2024 11:03:19 -0400
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1t5nkT-0005ig-8P
 for qemu-arm@nongnu.org; Tue, 29 Oct 2024 11:03:14 -0400
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-539e63c8678so5667130e87.0
 for <qemu-arm@nongnu.org>; Tue, 29 Oct 2024 08:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730214184; x=1730818984; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aN+DMnnFx9m7E1l9tNxrV14849dApGTvjUQ0xKcWI0M=;
 b=Y7LECfQIJHWLljOXuwt1/W6Oj1oLPizwsaQmgHu7iodN5X+G5LoUzggQZIGFYy022G
 Wk/n7/ky/ieJv/OXnBOsEe1WuwqNZz+PTjslokzVAyhNeQnbGmQxHTaemoJw9isWEpwW
 PPuqzwwR/2vwbm4ZDDfFCjVvEm8mFfXFm4q8gwMNEQbaPX4UjsWMRRsCvwF5LVS3EZmm
 qWJsgUU5NMi5I/O/4Ez/c4ifSx80lL3mNxiFN2pWLuZGeA36OMga2EdzmSiFo14aK4nI
 qS5PjOgQSUaPHXqR/EPFdDxZp+SZhhlqNWSTATjDvr4G2pRPoYeNlHoAocNL50YLDc+s
 DrIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730214184; x=1730818984;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aN+DMnnFx9m7E1l9tNxrV14849dApGTvjUQ0xKcWI0M=;
 b=T76Svr0VqkwFaS6PvxVz5xJu2p3+x0bIAgf6kQxt+LtqZRGacIJlkvuKQM5msGdhIL
 wQ7mdP+/RzQX/535t9zZWyJapYX08u1swdTHE/CIqu8In/hc7gX2OHvA/RZv/0LcqsAb
 yN7OSOURZOXZIl/b1SUOJf+huwYZzbbZXYV0fBitLE5UGVbvuNbotAarkKoFFMtVFVP6
 jXUygjStNF6F3PnjCzeIzn5zOmdFVUAUPeIXboFNhQ0knVc7+h34iWTTdcRyua3uw994
 xPh5UG/zd1sCH7U9nAtIolQIBIBB3H0eRtBF0i5IeP0TMyskmj3qGBIfXo0TiynMKezb
 3sHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWy3t64LL4nw+4lJeXwsnDYJyO9k3hemqAtYca7FcvzPR9F4oPySKV3lEjbkdx3ireRbht6j6aTKw==@nongnu.org
X-Gm-Message-State: AOJu0Yw0TOvIvz96SL9ji/H4ZAUXS6Z/N9V3U+C/II0nk8IB62iemVMc
 2H/PrXjCDTTIpYiia0DtOXKeDyUTIPeezdlVcxPlF4ra8u9wdnzW2eC/1BdLwhM=
X-Received: by 2002:a05:6512:1308:b0:533:43e2:6ac4 with SMTP id
 2adb3069b0e04-53b34a3437dmr5565637e87.49.1730214182415; 
 Tue, 29 Oct 2024 08:03:02 -0700 (PDT)
Received: from [192.168.21.227] ([89.100.107.89])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4319360d233sm145073505e9.45.2024.10.29.08.03.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Oct 2024 08:03:01 -0700 (PDT)
Message-ID: <2d2884cf-5d90-4c2f-8488-777beb4a0fac@linaro.org>
Date: Tue, 29 Oct 2024 15:02:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL 4/4] target/arm: Fix usage of MMU indexes when EL3 is
 AArch32
To: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm <qemu-arm@nongnu.org>
References: <20240813152054.2445099-1-peter.maydell@linaro.org>
 <20240813152054.2445099-5-peter.maydell@linaro.org>
 <b090fac1-85df-4727-a382-8a934bd02f33@redhat.com>
 <CAFEAcA_VWKkZyagd7aPWjAM8maJDZnXaR_aVjQ8MEkVUU9-=CQ@mail.gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_VWKkZyagd7aPWjAM8maJDZnXaR_aVjQ8MEkVUU9-=CQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x136.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Kg3t6dgq4K0H

On 10/28/24 13:24, Peter Maydell wrote:
> On Fri, 25 Oct 2024 at 13:54, Thomas Huth <thuth@redhat.com> wrote:
>>
>> On 13/08/2024 17.20, Peter Maydell wrote:
>>> Our current usage of MMU indexes when EL3 is AArch32 is confused.
>>> Architecturally, when EL3 is AArch32, all Secure code runs under the
>>> Secure PL1&0 translation regime:
>>>    * code at EL3, which might be Mon, or SVC, or any of the
>>>      other privileged modes (PL1)
>>>    * code at EL0 (Secure PL0)
>>>
>>> This is different from when EL3 is AArch64, in which case EL3 is its
>>> own translation regime, and EL1 and EL0 (whether AArch32 or AArch64)
>>> have their own regime.
>>>
>>> We claimed to be mapping Secure PL1 to our ARMMMUIdx_EL3, but didn't
>>> do anything special about Secure PL0, which meant it used the same
>>> ARMMMUIdx_EL10_0 that NonSecure PL0 does.  This resulted in a bug
>>> where arm_sctlr() incorrectly picked the NonSecure SCTLR as the
>>> controlling register when in Secure PL0, which meant we were
>>> spuriously generating alignment faults because we were looking at the
>>> wrong SCTLR control bits.
>>>
>>> The use of ARMMMUIdx_EL3 for Secure PL1 also resulted in the bug that
>>> we wouldn't honour the PAN bit for Secure PL1, because there's no
>>> equivalent _PAN mmu index for it.
>>>
>>> We could fix this in one of two ways:
>>>    * The most straightforward is to add new MMU indexes EL30_0,
>>>      EL30_3, EL30_3_PAN to correspond to "Secure PL1&0 at PL0",
>>>      "Secure PL1&0 at PL1", and "Secure PL1&0 at PL1 with PAN".
>>>      This matches how we use indexes for the AArch64 regimes, and
>>>      preserves propirties like being able to determine the privilege
>>>      level from an MMU index without any other information. However
>>>      it would add two MMU indexes (we can share one with ARMMMUIdx_EL3),
>>>      and we are already using 14 of the 16 the core TLB code permits.
>>>
>>>    * The more complicated approach is the one we take here. We use
>>>      the same MMU indexes (E10_0, E10_1, E10_1_PAN) for Secure PL1&0
>>>      than we do for NonSecure PL1&0. This saves on MMU indexes, but
>>>      means we need to check in some places whether we're in the
>>>      Secure PL1&0 regime or not before we interpret an MMU index.
>>>
>>> The changes in this commit were created by auditing all the places
>>> where we use specific ARMMMUIdx_ values, and checking whether they
>>> needed to be changed to handle the new index value usage.
>>
>>    Hi Peter,
>>
>> this commit caused a regression with one of the Avocado tests:
>>
>>    AVOCADO_ALLOW_LARGE_STORAGE=1 avocado run
>> tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_bpim2u_openwrt_22_03_3
>>
>> is failing now. It works still fine before this commit. Could you please
>> have a look?
> 
> Thanks for the report; I've investigated it. The cause of this specific
> failure is that regime_el() doesn't return the right answer when code
> is executing in the guest in Monitor mode. The effect is that because
> regime_el() returns 1, not 3, we look at the wrong banked registers
> and the page table walk fails when it should not. This is enough to fix:
> 
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index 203a2dae148..812487b9291 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -926,7 +926,7 @@ static inline uint32_t regime_el(CPUARMState *env,
> ARMMMUIdx mmu_idx)
>       case ARMMMUIdx_E10_1_PAN:
>       case ARMMMUIdx_Stage1_E1:
>       case ARMMMUIdx_Stage1_E1_PAN:
> -        return arm_el_is_aa64(env, 3) || !arm_is_secure_below_el3(env) ? 1 : 3;
> +        return arm_aa32_secure_pl1_0(env) ? 3 : 1;
>       case ARMMMUIdx_MPrivNegPri:
>       case ARMMMUIdx_MUserNegPri:
>       case ARMMMUIdx_MPriv:
> 
> However, while I was thinking about this I realised that there
> are some problems with the design change this commit is trying
> to do. The idea is that we now use the same MMU indexes for
> Secure PL1&0 as we do for NonSecure PL1&0.
> 
> Small problem:
>   That means we need to flush the TLBs at any point where the CPU
>   state flips from one to the other. We already flush the TLB when
>   SCR.NS is changed, but we don't flush the TLB when we take an
>   exception from NS PL1&0 into Mon or when we return from Mon to
>   NS PL1&0. Now we need to do that, so any time we call up into
>   Mon and back we'll dump the TLBs, which is a bit sad.
>   (Also we could skip flushing all these TLBs when NS changes.)
> 
> Larger problem:
>   the ATS12NS* address translate instructions allow Mon code
>   (which is Secure) to do a stage 1+2 page table walk for NS.
>   I thought this was OK because do_ats_write() does a page
>   table walk which doesn't use the TLBs, so because it can
>   pass both the MMU index and also an ARMSecuritySpace argument
>   we can tell the table walk that we want NS stage1+2, not S.
>   But that means that all the code within the ptw that needs
>   to find e.g. the regime EL cannot do so only with an
>   mmu_idx -- all these functions like regime_sctlr(), regime_el(),
>   etc would need to pass both an mmu_idx and the security_space,
>   so they can tell whether this is a translation regime
>   controlled by EL1 or EL3 (and so whether to look at SCTLR.S
>   or SCTLR.NS, etc).
> 
> So now I'm wondering if this merge was a good idea after all.
> Should we do all that replumbing required, or should we
> instead revert this and take the "straightforward" approach
> described in the commit message above of adding some extra
> MMU indexes?

It might be easier to add the extra mmu indexes.

We'll have to re-use ARMMMUIdx_E3 for EL30_3, I think, because we only have 2 mmu_idx left 
available.


r~


> 
> (I suspect that this commit is likely also the cause of
> https://gitlab.com/qemu-project/qemu/-/issues/2588 )
> 
> -- PMM

