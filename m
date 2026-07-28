Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30666C53219
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Jul 2026 14:21:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1woigU-0000O4-U2; Tue, 28 Jul 2026 10:21:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1woigT-0000Ne-8l
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 10:21:29 -0400
Received: from mail-yx1-xb12d.google.com ([2607:f8b0:4864:20::b12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1woigP-0005v3-1D
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 10:21:26 -0400
Received: by mail-yx1-xb12d.google.com with SMTP id
 956f58d0204a3-667b0ced2d3so5253290d50.2
 for <qemu-arm@nongnu.org>; Tue, 28 Jul 2026 07:21:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785248483; cv=none;
 d=google.com; s=arc-20260327;
 b=pUCcJ46tDchCgNcXpfOquEVbXsP1jPLQG9uPtmVWzK5kewPSoc28u8Y/ItU3EHgUlS
 wld8z6gmNBuW/S9riApUPjKGgVNc21xkx5MLs+Pj+NaLSbalv694t5D9m2ns8VMk5qHQ
 HkTRakbILAaq1GDRSdn/4Ufi/7Urutaahm4l05FHUep+h9StPuGZs97deGL7/J0l1nb7
 FXv3wOe4v1gNpvSDG+cBCeSFXvAQgLJFk/hVa7+m08ildFtYGJxzIQed/27g+Ck5Cw7Y
 3R2hB+7WlTILnKL2duuN5imC5MO6StPbk58vTMagkFAIHrpzCC1Iv7+tyo4FNDiv6LMz
 Gu8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=fzin/IsM5OqsI6fmAfgIVjv6Niy4XQcWkpkLsHG64os=;
 fh=Wfu8xHkaS/E/NfFmeNNGShoBT5D8uV9QXVjFisg1xa4=;
 b=muZHjGCDMHuGQ2coTCBbeCaMX/8AycKbeX0BQUs2g6jjb4fLxfLl8KuLpKkkFQ95Zr
 GQyROfL6MQkX4D33SBPP0FnQE164MBU6JEWewf6+dbpLMy0A7weGEy1nQlXa/S0Sgmmb
 ryPZ5XM2nS18oEzdCBr39gWg9vtns/FZy+SjiOc3XhFbJBse11H/xLxw2mYLwvZ9adB1
 ulBaB4z/wh8v84v3XPy9uARrgEpbeUO9eK+pgQJL71Oi1Ojt9c2aKb/TjTA36UzoUUc7
 CIOgHCYzo96RNRdvxRbQ+PKyiRrZQPZELibbj9gq9yzVA5XHl6WZK5QTeSSamSj+okIJ
 QFHQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785248483; x=1785853283; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=fzin/IsM5OqsI6fmAfgIVjv6Niy4XQcWkpkLsHG64os=;
 b=lPyR6rF4kfJQkax1KPw+9SXROOAobQHwjf0uCjuY18S6Q9xSXdypsha6tL2mZah3mU
 rclG1dU05CAGFEAYuw/zI7kl5rOOEX0Gnb+fSOeLoLdshJdM8q1wtF07xke79ZfrzmNk
 lreSOFazlHmL5qCld9hixvxg3RCsU8irNwn6bpNbVxjFFhO5F0+hv1wijwHNXS9PS7BV
 Sv7/TLTRMdvDMOaHmw24hwWK6FNWE7rH9pqh4lhN+ji0vhDa4fHYgKwr+oeDZcRFNjTd
 n0eC0BJ4uldys/AVWb6LAgBOatsF+ku1nGL5qj5YFn5govKvCdhpIuarCWbLz50JYJ3a
 cWwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785248483; x=1785853283;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=fzin/IsM5OqsI6fmAfgIVjv6Niy4XQcWkpkLsHG64os=;
 b=N3R6FdKFsdqX0qJIcXLCU8PRqfpoEPNzKQ/nD8vZatSmiL52X+zaOEHdjXavWhzLTL
 XOCX3cPVCp0QJiQ0DAeKdDLsG/6o5ZKemarxvSa0UzAXh3OT4ieq2s7VLVPv/Cac6v2W
 IoQeUtKPpmnFc0cr6+er+IA1xCKKzHtuxKGPheLTEL9jfx3GqB3sVoMGjkDatemOzOOl
 dm0ko+QkbmkuEH4wReItOVctEczSTemeUXj9rXLaojiC9V8fvtFZEmW2DGANXTyr8MDT
 wkwXiLI8y41hUO19hWk/YonHWKSaz4Z9D3z7C3ne/p1PI7K4WZ2qpnJkssL26ijIQUp0
 81Xw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq5VCLWf1yVMEORzyXIjEV3//zGDgqmpAaXuwkQy9mMYpB9e+dVoIoq4aTXjbq52sTemNJH5auI2w==@nongnu.org
X-Gm-Message-State: AOJu0YwagPTn0JjoBvIvYFv779uS69Qd37kOvrIxYhMGHEZw4YvhKfH0
 V+9WnLxx0/+Ka5hfmcBSetqSpwr5dCRMcO+amUFjS83ygiaCnfy1DYM2fpwf4i3Gv+Ztwz7hfh1
 e+0B4b+uqWqYbx8wt2/zKw6QOpa/R8oFxJjzdQ3321A==
X-Gm-Gg: AR+sD11ZWu6H1lE5kFeiuulVVmZ3iEJLPjXSEJZYAwDupzAVGPxPeqmoxwfadjYwvg4
 jQIOK3eb5jdgHxsJQP1z7K+xzDZxe6Fm2DIAH5lvg/1UIJljawurlwvhKQL1H0Qi1sm0MPnJIVR
 RMS64OgFsRZ7dC2h+KjGjyiammOsmT8uB08oLXNc814BVGFACFboENdPMKqty5+mgevAfkw/QJc
 VRpNmEIHp4D3H58DaAABTwJcHzdtvLcwbz8YDRbE3oyiI7Jy2guUTlB/ZQFGJ+7Afnn/mX4BqUU
 zhjrt8E0oStVyVZFPExRIy9Ds+H8UnYYotr2OUU0a5OsVy+DOacdPZqa
X-Received: by 2002:a05:690e:445:b0:664:ae68:33a2 with SMTP id
 956f58d0204a3-669057ff3f3mr822938d50.67.1785248483333; Tue, 28 Jul 2026
 07:21:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260717232306.378988-1-richard.henderson@linaro.org>
 <20260717232306.378988-6-richard.henderson@linaro.org>
In-Reply-To: <20260717232306.378988-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Jul 2026 15:21:12 +0100
X-Gm-Features: AUfX_myd12dQglp4aAEys021uKQB23XelQ60QlFJReHpqRr0E6hGcv3l9S4m20M
Message-ID: <CAFEAcA9gNvMD5YVTy2Zj51riyY9j+eCurQpH8M-ymb4yaf4-Kw@mail.gmail.com>
Subject: Re: [PATCH 04/17] target/arm: Raise alignment fault for DC_ZVA on
 Device memory
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12d.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Sat, 18 Jul 2026 at 00:26, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Raise alignment fault when DC_ZVA targets Device memory, as required
> by the architecture.  With MTE, an alignment exception is not always
> correctly ordered vs a tag check fail exception -- to be fixed in
> followup patches.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3005
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

>
> +void HELPER(dc_zva)(CPUARMState *env, uint64_t addr)
> +{
> +    uintptr_t ra = GETPC();
> +    size_t len = (size_t)4 << get_dczid_bs(env_archcpu(env));
> +    int mmu_idx = arm_env_mmu_index(env);
> +    MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;

I feel like some static analyzer or compiler is going to complain
that this assignment is pointless in the !CONFIG_USER_ONLY case.
Maybe better to set attrs = MEMTXATTRS_UNSPECIFIED inside the
#ifdef CONFIG_USER_ONLY block ?

> +    int flags;
> +    void *mem;
> +
> +    /* DC_ZVA requires that we supply the original pointer for traps. */
> +#ifdef CONFIG_USER_ONLY
> +    flags = probe_access_flags(env, addr, 0, MMU_DATA_STORE, mmu_idx,
> +                               false, &mem, ra);
> +#else
> +    CPUTLBEntryFull *full;
> +    flags = probe_access_full(env, addr, 0, MMU_DATA_STORE, mmu_idx,
> +                              false, &mem, &full, ra);

Is 0 really the right size to pass in here? Looking at
probe_access_full(), if you pass in a 0 size then it will
call notdirty_write() with a dirtysize parameter of 1,
which will then not invalidate or set the VGA/migration
dirty bits on the full range of memory we're about to clear.
This would be OK if we then went through the slowpath and
did a set of byte accesses, but probe_access_full() will
clear TLB_NOTDIRTY from the flags it returns to us if it
called notdirty_write(), so we will take the fastpath if
that was the only flag set.

Maybe probe_access_full(), probe_access_full_mmu() and
probe_access_flags() should not call notdirty_write() and
clear TLB_NOTDIRTY from the flags they return if the passed
in size is 0 ?

The notdirty_write() API also wants the base address of the
DC ZVA block (since that's where we will be writing from),
not the address from the guest.

(We may be getting away with some of this because of various
functions rounding up/down to full page addresses, but none
of these functions seem to document that, so we shouldn't
rely on it.)

> +    attrs = full->attrs;
> +#endif
> +
> +    flags = do_dcxva_traps(env, addr, len, mmu_idx, flags, attrs, ra);
> +
> +    /* After traps, treat as aligned blocks. */
> +    addr = addr & -len;
> +    mem = (void *)((uintptr_t)mem & -len);
> +
> +    do_dczva_0(env, addr, len, mem, mmu_idx, flags, ra);
> +}
> +
>  /*
>   * Perform an MTE checked access for DC_ZVA.
>   */
> --

-- PMM

