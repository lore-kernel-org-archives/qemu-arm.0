Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3307802lft;
        Mon, 4 Jul 2022 08:29:55 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vCTNJzPEgSeTWp0ePU4Z+XFtY/N+/T1HNLn68GVEbafr7GA8l0iFQhlDK1tYM+2qy8ZzU5
X-Received: by 2002:ac8:5846:0:b0:31d:40aa:4c41 with SMTP id h6-20020ac85846000000b0031d40aa4c41mr9131977qth.662.1656948595180;
        Mon, 04 Jul 2022 08:29:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656948595; cv=none;
        d=google.com; s=arc-20160816;
        b=marbVPYUFFQbA/hVQFUQR6Msa1I55B9E1dVApvDluKF1kdcvlzCu4RDeISs2zXsEJD
         00Hhar6FNBrw6a5EkM4ishl/5f46AHGu1dBcTQmiE+6zRaz/4q3juETnrMHrWOD0Z9J4
         PKe8AIRm4fvnFEljrH0rV3TEBAXLuhmP2X+WqGqHz27CmHEuv68D/tDoMVd/eooOhFpH
         bkbWotBbXEuagEhVV1RhBWZ8YAmYksTBOcE12pfYY8WJFjOWTR08XkPq2qhWbLEHSuOh
         dClIxOSw3bVr6mPsF97uxtGP8iv2jENbtsaeogUugDmZO33r5LzdjhclNhx+iepIcBpx
         yl3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=axUzXJT25gaTGOixzDSBa4XGgi9We+8IsX78+r6s7ng=;
        b=PrS9QO22PTF6g6h4KX7S7yvyEiGyVaN0C4BAcud0PSu1ana11pUJl53MnRap+pKAaj
         9pLqWSfwVjnu8Tmafr3o8x5/gsJks50by47We+ifMU63fOMQfCBh4mpomRHZBLEvbgeA
         DnGo9VY2gkOUkALQDo0pIidj5TBBLbU+gXYMOHzYMSoD61T4b4/tiWd/9OqJCWk+pkyF
         NlW6E+bvLlnLq7dbUTL+cZrtCo39h+kS/jN3Ooe5L1nsyxWztvYEQgtTPzS7Qs1CcUlc
         1fhp+aQMC1jzrgCBQENi+bUj59NeOOUjO6njokMRWdFIqFdEl6B+rrfcMCYyW+YOt2Sf
         V/DA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Jgy8lrTU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q9-20020a05620a038900b006af20f95826si12338037qkm.469.2022.07.04.08.29.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jul 2022 08:29:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Jgy8lrTU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8O1K-0002hj-L0
	for alex.bennee@linaro.org; Mon, 04 Jul 2022 11:29:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8Nzk-0007zn-If
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 11:28:16 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:41544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8Nzi-00034F-EW
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 11:28:16 -0400
Received: by mail-yb1-xb35.google.com with SMTP id b85so4203797yba.8
 for <qemu-arm@nongnu.org>; Mon, 04 Jul 2022 08:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=axUzXJT25gaTGOixzDSBa4XGgi9We+8IsX78+r6s7ng=;
 b=Jgy8lrTUq8Sv+FP1MB+qJlg6McwuhkQ3E4KXiOow3lj06I/IDgQR4cYts1SLx85dgU
 Dy3qIKnAhR3sOjPfQluK2N9W+iVTruLAUSp7aRC/njM8z7ivPlcqJzPe7+aB2vQIKT7/
 ZTAetrezbYmjJccBKpl4f0NN+CSFIrofGVHzc+EgP+cYgw0FA6sj9lVYLt+zJFkoUXJ8
 tfzpWBjBYDvhxFwoxtQ2lKpbAqOBm+JJxJITWyLPsk7d4J5zZDgXJA4Echfv+KnG4nG8
 6pQvFn437o2cANwFEqOdlPmWa6qPYxIlSZTPx00Synfdt0OO6E/yovUXo7K4NdWof+vX
 joqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=axUzXJT25gaTGOixzDSBa4XGgi9We+8IsX78+r6s7ng=;
 b=KvmQhIjfqDwEUJ9cFOYCAEcl4shAi8vchj3tIHe5k414jQSNDIKi6uc7K/PKo1CJ34
 sHvq5+sgpQf9ZnNLJ88OkesY7Q6mj5mlS2bfe0bdSts+ymJaDcCiiaUcd78sud+a95HW
 FbiVwEL5II1brYlsRerKnL6TrA2esnSEegg9is9AULd9aLXPGLmZ+Akw4PlW2vHEHUsW
 qchdL2nhvBpGOXux4jNH0UMFYrVrZPTebGDdkaYrtqOGd9pGCetCBElgfOEIBdvJagS8
 sogrIqmK9uf13dbqrprdv3f1AO+bMen8maL++Zj6Zzq+yv4oOK1tQoKWFMaJwuBkDYGv
 Iu8A==
X-Gm-Message-State: AJIora92jEigrV73S+k0V3smjSWGsWeHeiAQqs0P8yGasxW6AtW5T1pM
 sz3WTN7JZDTY+W/Vfju3G2+AZjffnJ2JzmSeyyivmw==
X-Received: by 2002:a25:d381:0:b0:66e:2943:1c9d with SMTP id
 e123-20020a25d381000000b0066e29431c9dmr12864882ybf.67.1656948493249; Mon, 04
 Jul 2022 08:28:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220703082419.770989-1-richard.henderson@linaro.org>
 <20220703082419.770989-2-richard.henderson@linaro.org>
In-Reply-To: <20220703082419.770989-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 16:28:02 +0100
Message-ID: <CAFEAcA-2fsJoHkaq1a_k+_D2V1J2oPkDZ+7Ua=tge--ay5HG7Q@mail.gmail.com>
Subject: Re: [PATCH 01/62] accel/tcg: Introduce PageEntryExtra
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb35.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GvLoElCmrTBn

On Sun, 3 Jul 2022 at 09:25, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Add an optional structure, controlled by TARGET_PAGE_ENTRY_EXTRA,
> that allows arbitrary extra data to be saved in the TLB for a
> given page.  Set it with tlb_set_page_with_extra() and fetch it
> with probe_access_extra().
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---



> -/* Add a new TLB entry. At most one entry for a given virtual address
> +/*
> + * Add a new TLB entry. At most one entry for a given virtual address
>   * is permitted. Only a single TARGET_PAGE_SIZE region is mapped, the
>   * supplied size is only used by tlb_flush_page.
>   *
>   * Called from TCG-generated code, which is under an RCU read-side
>   * critical section.
> + *
> + * Returns a pointer to the iotlb entry, with env_tlb(env)->c.lock
> + * still locked, for final additions to the iotlb entry.  The caller
> + * must unlock the lock.
>   */
> -void tlb_set_page_with_attrs(CPUState *cpu, target_ulong vaddr,
> -                             hwaddr paddr, MemTxAttrs attrs, int prot,
> -                             int mmu_idx, target_ulong size)
> +void tlb_set_page_with_extra(CPUState *cpu, target_ulong vaddr, hwaddr paddr,
> +                             MemTxAttrs attrs, PageEntryExtra extra,
> +                             int prot, int mmu_idx, target_ulong size)

The comment claims it returns a pointer to the iotlb entry, but
the code says it returns void... leftover from a previous design?

>  {
>      CPUArchState *env = cpu->env_ptr;
>      CPUTLB *tlb = env_tlb(env);

-- PMM
