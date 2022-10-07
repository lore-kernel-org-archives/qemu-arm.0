Received: by 2002:ac9:4144:0:0:0:0:0 with SMTP id u4csp307779ocg;
        Fri, 7 Oct 2022 02:03:16 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM42dB1/qSMqyONU0WcdlcgQBMitzB1i1WK12hfw2AOQ+fSm662SR8pkQwf5UvCl0dr31pgF
X-Received: by 2002:a05:620a:254f:b0:6bc:5763:de4b with SMTP id s15-20020a05620a254f00b006bc5763de4bmr2844489qko.207.1665133395910;
        Fri, 07 Oct 2022 02:03:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665133395; cv=none;
        d=google.com; s=arc-20160816;
        b=WhN4qJNsMjxuYZ4Gfaj7wUNQL9KUfCfwtno44TXZaQds4I0D1m8PRFVsSH1ma4wIIx
         59fGTT0g55mTHD9C8XLZ/uZqOkXRQaaOPX3AYA7Dcj+acKZN1CY6kC0KQR+WfzQicXdT
         eLbxT2kUtv4+U0UkNfBvzAnmvnKIgfXA+Y6WkWKfKaRQoxoFFbqqKzxknrBR13jEJq/d
         ewpBbiwf5PdYiqQxuBSCasMFZYyjboFiQo5OVzK5ZS7VrgAnTnRe6JGz/Y2EfY+tB+zD
         VaEMGR4I2tV9uO+LUMZnLeyLeyJp5j3UayBcrVLrogv7cRw8EqE90sIvzhopzWAQ3t9V
         uEzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=qXbBURHkGIrzTawmhhvYXAGr5Yq0Fg78373cxDqTwlo=;
        b=f6DE0+xHsD5nLS9zAXYFqRJPbbQtw4FnsfDNX+7uYFz01p0GUIAOoncS6lv5mRiE3F
         L9QzYti4YT5JBcg2BwjL47uqLI4HHR0JeI88jCQOpFuWsSrnotaYgGpbE3tbeagWT+uE
         CNYQaIBs32Y52O6NzmXXjFIVXG/T/XAVcm8mwg4khu3NZdoGctWcEWUeZIL+7XkjvqnV
         3AN3vjMN+V+GAGt1aBsVHUF+CFDuzIoCxa44hCgXOWJlZGqzqWJ7Ce9IewuqR8//FaiV
         sddIGi0NVv3doGYiH8S0IYWmBxy5TI6FkYqLKNpu/RwLJW0K3hBx8apVhHx4L3ws6a2W
         M1sg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M7GFPVFa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d17-20020ac847d1000000b00344f0a3aea2si876624qtr.239.2022.10.07.02.03.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Oct 2022 02:03:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M7GFPVFa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ogjGE-0006zb-CF
	for alex.bennee@linaro.org; Fri, 07 Oct 2022 05:03:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogjF3-0006xp-Rt
 for qemu-arm@nongnu.org; Fri, 07 Oct 2022 05:02:08 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:35831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogjF2-00051a-7f
 for qemu-arm@nongnu.org; Fri, 07 Oct 2022 05:02:01 -0400
Received: by mail-pg1-x534.google.com with SMTP id j71so4132691pge.2
 for <qemu-arm@nongnu.org>; Fri, 07 Oct 2022 02:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qXbBURHkGIrzTawmhhvYXAGr5Yq0Fg78373cxDqTwlo=;
 b=M7GFPVFaLOwIre0fjXEGB8xVJ4+PJ6Ijtthr/dvOfJvK5dUAOAKYsMeMpoLtYxWiP3
 BOhj1QmN2xDx6mfMCFdxAkcGcTXdQNnVJWsfY2R1x4wdONbKcnMgZeicA2RnoGy0Bmyv
 ou3LiNFPqcPAulFDjsnjn83XxLJFyG+2g7YXrY524zfUVkTSvL6rPUI+8JFuTb1zQomg
 Db+e9nCq5orQ20ev5IyKt4azbOEWB6ouRWqnw7KUgCvR5rh6w5bxUGgUA9na1fFR2HAH
 NQOVxrsWS9yuxNJNN59RNnsNAXQrVtXhQmq/uKQ+ZPTzCNkvnAke8DO5U3XvhHwAe03J
 x8sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qXbBURHkGIrzTawmhhvYXAGr5Yq0Fg78373cxDqTwlo=;
 b=JDO3SBeCWN4bKTQ7k5aff1eENOCnBj8RujM9ks9l152WfHhXWV7h+/xb23Yj9BJBNX
 WtQH/WE0S1SnKfYYCIZW19m7OsZCkLo8z9LAN1ylzPOSQq0f1HnlTPuaVK/GIVCaKWDj
 ZEyyiBn0Ec92MbvWstbyzYoqfulm1dA8xrQ0XLwy7ssb0rmy6/H1Fcd/Xgvpl+LqMBur
 foJ9wFF43tlMl19rIjm9Cw2Um1y/5VKKXTALVOJhT4uHiapqtBoUTFv7RL/NrqZo/XQb
 CV9r3P9B00XTrCnqmImA8AktxMlMXGiXW1/0+mHGsZXCywmaOWip0ZVzJn4pRkVirxRV
 DS6A==
X-Gm-Message-State: ACrzQf3KLhTJovT+4VqWkMnvmTBM767ouFu15Uwd0ChnphH9ic0I9J89
 Hpksrl4DJPEts+h84GRYsD+j1ez8AXulMYB8JYFrNQ==
X-Received: by 2002:a05:6a00:1584:b0:561:e48f:9faa with SMTP id
 u4-20020a056a00158400b00561e48f9faamr4200738pfk.51.1665133317741; Fri, 07 Oct
 2022 02:01:57 -0700 (PDT)
MIME-Version: 1.0
References: <20221001162318.153420-1-richard.henderson@linaro.org>
 <20221001162318.153420-28-richard.henderson@linaro.org>
In-Reply-To: <20221001162318.153420-28-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Oct 2022 10:01:45 +0100
Message-ID: <CAFEAcA9Vd6mwMf9-70vo=t_Yec+fPh3kM_jo7wn=oNi1+cvgkQ@mail.gmail.com>
Subject: Re: [PATCH v3 27/42] target/arm: Use softmmu tlbs for page table
 walking
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x534.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OgY6uI6dR1dr

On Sat, 1 Oct 2022 at 17:52, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> So far, limit the change to S1_ptw_translate, arm_ldl_ptw, and
> arm_ldq_ptw.  Use probe_access_full to find the host address,
> and if so use a host load.  If the probe fails, we've got our
> fault info already.  On the off chance that page tables are not
> in RAM, continue to use the address_space_ld* functions.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---


> -static bool ptw_attrs_are_device(uint64_t hcr, ARMCacheAttrs cacheattrs)
> +static bool S2_attrs_are_device(uint64_t hcr, uint8_t attrs)
>  {
>      /*
>       * For an S1 page table walk, the stage 1 attributes are always
> @@ -202,41 +203,72 @@ static bool ptw_attrs_are_device(uint64_t hcr, ARMCacheAttrs cacheattrs)
>       * With HCR_EL2.FWB == 1 this is when descriptor bit [4] is 0, ie
>       * when cacheattrs.attrs bit [2] is 0.
>       */
> -    assert(cacheattrs.is_s2_format);
>      if (hcr & HCR_FWB) {
> -        return (cacheattrs.attrs & 0x4) == 0;
> +        return (attrs & 0x4) == 0;
>      } else {
> -        return (cacheattrs.attrs & 0xc) == 0;
> +        return (attrs & 0xc) == 0;
>      }

The upcoming v8R support has its stage 2 attributes in the MAIR
format, so it might be a little awkward to assume the v8A-stage-2
format here rather than being able to add the "if !is_s2_format"
condition. I guess we'll deal with that when we get to it...

> +        env->tlb_fi = fi;
> +        flags = probe_access_full(env, addr, MMU_DATA_LOAD,
> +                                  arm_to_core_mmu_idx(s2_mmu_idx),
> +                                  true, hphys, &full, 0);
> +        env->tlb_fi = NULL;
> +
> +        if (unlikely(flags & TLB_INVALID_MASK)) {
> +            goto fail;
> +        }
> +        *gphys = full->phys_addr;
> +        pte_attrs = full->pte_attrs;
> +        pte_secure = full->attrs.secure;
> +    }
> +

> --- a/target/arm/tlb_helper.c
> +++ b/target/arm/tlb_helper.c
> @@ -208,10 +208,21 @@ bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>                        bool probe, uintptr_t retaddr)
>  {
>      ARMCPU *cpu = ARM_CPU(cs);
> -    ARMMMUFaultInfo fi = {};
>      GetPhysAddrResult res = {};
> +    ARMMMUFaultInfo local_fi, *fi;
>      int ret;
>
> +    /*
> +     * Allow S1_ptw_translate to see any fault generated here.
> +     * Since this may recurse, read and clear.
> +     */
> +    fi = cpu->env.tlb_fi;
> +    if (fi) {
> +        cpu->env.tlb_fi = NULL;
> +    } else {
> +        fi = memset(&local_fi, 0, sizeof(local_fi));
> +    }

This makes two architectures now that want to do "call a probe_access
function, and get information that's known in the architecture-specific
tlb_fill function", and need to do it via this awkward "have tlb_fill
know that it should stash the info away in the CPU state struct somewhere"
trick (the other being s390 tlb_fill_exc/tlb_fill_tec). But I don't
really have a better idea, so

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
