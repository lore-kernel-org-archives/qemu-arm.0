Received: by 2002:a17:906:9502:b0:9a1:fa4e:495e with SMTP id u2csp1377464ejx;
        Mon, 11 Sep 2023 07:18:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHABALdqwfjAaAxmWYT9D9jC6sGboznKFD4ZckBoBgeLu55FCT+kvIWE64mYbXLhKiEEfgv
X-Received: by 2002:a67:fa52:0:b0:44d:4a41:893e with SMTP id j18-20020a67fa52000000b0044d4a41893emr9000621vsq.6.1694441913988;
        Mon, 11 Sep 2023 07:18:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694441913; cv=none;
        d=google.com; s=arc-20160816;
        b=TDeLFZNHSM+HcDvRydzD61aONE+K5enLRZMtqFhx0Waou9uHwkfns0dDmRDTwWBx4W
         uyRiwocjpqM337DD0Zy6w+oLpT86cMuT4+gludcdGB+3tb/ub9qmSlcJrKuZ1GbB9WJH
         jxkT30P73uG6MTbSewVW617z0bC27flS/Va11XrFD60vB1Xb5qLB1nl2mya7qIq15RWT
         LdnjparCF7t5zO9k7jMB2dCXlqiTm/agPRvfaI5QbOt9nKEeQei8m9KVQIBMHiooTud0
         1GMq6I+gSp9yWAbuaKkJ8FBEkzYYxIoeHlds2m32byWyDCaRF6FrkLBOewElPrNTE1/Y
         ZckA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=CO5KUZ0HbXPAFPvyvpsqqPg5wltk7sxJyxmy2Eh0KyM=;
        fh=PKodlsZ4sLOulf3vcyB9a9UvxkkwctzJ7UL5PZ8dNXQ=;
        b=JNrM2VSY62UYh8gBvbESnJBYc1MbGF4cH5tFUxH0Ar6zug/Oul7IO3vksSMsj5WDb3
         ouwsSB4kuEdhaKz2+igQ+4h07fooTplHAk7gK+e6MZJcfzGjHw14KFfrzn6zghpp829b
         Tfov5CfVksIkh1UI7Rc87TR24ErWF9wleTL3+AhwB16SQktEdXTlt80Mhb6DmAZuHTno
         FhGYeUnNFsZ8DV84WjdENy+s/dYXdjSZnVGYAMYqEW+UO4IWbo0uqYEvZ2N8nz8OuGl0
         31wYIzj0dXAeP3HnP32HnmmXmxCrw5iTYuGv7d9RIf7nPT8Q6po/wP1FfR40kxyPQtoT
         Gz7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X7aop9vW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dv12-20020a05620a1b8c00b0076787a8a594si4693187qkb.205.2023.09.11.07.18.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Sep 2023 07:18:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X7aop9vW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qfhjz-0000Bn-KV; Mon, 11 Sep 2023 10:18:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qfhjy-0000BI-Cx
 for qemu-arm@nongnu.org; Mon, 11 Sep 2023 10:18:14 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qfhju-0001IP-Tx
 for qemu-arm@nongnu.org; Mon, 11 Sep 2023 10:18:13 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-403061cdf2bso18799745e9.2
 for <qemu-arm@nongnu.org>; Mon, 11 Sep 2023 07:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694441889; x=1695046689; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CO5KUZ0HbXPAFPvyvpsqqPg5wltk7sxJyxmy2Eh0KyM=;
 b=X7aop9vWayS9AxLirlLJTzgtEHVOa3gK+nnd9XiQsRDdb6IFJ11gpAoC/3hxQk4ANh
 ULQo2Kub3PNj1p0lt2gWYr0obh9mb5XZzCCyB5iDIVsC021H/UQjh4maArbXix7dxL90
 smOmAjGAVBX4yc8pYhduQo3ZcIbkAIWY/PDxSfoCkk5lesx0dat+TYKLKgX5ey4IBw+n
 JR51r7gPy7PXwmB8w9LhcyPM4Xsw87gpNDnru+K3BLRMxQIbeXOr9MoO03fCs+LFlk/N
 pYCLLMO8fDHiXAF/Sh3SgXY9sC1y3gw55kennYJcPIyHukdpj3oOcCwjY7nMQAOPFbHK
 aRYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694441889; x=1695046689;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CO5KUZ0HbXPAFPvyvpsqqPg5wltk7sxJyxmy2Eh0KyM=;
 b=Jh8vNjng2cmjMzf6x/hWAr8bD8/p0kBI6ME6nK0dFHbq0pDIEtz4y6E+qbTsX9a9ey
 LrfiHJHIX10v5s2wTrUo8q5NXvEeAi16P1BG/Iggsr2bwy5QmnrBEh6ukVcgWIIXJOHZ
 TH64FKL17k572Tgw67TwSmf2He+X5uCdSfQIHI4fuhSuUKJ/qTSqa1eIygRUvJTsg3PC
 EAI3ASaJwNDYdg39+TLkm65ykt5oZu3v13J0n53D/V54gy+y5yJy2BMT4plHhZ/RGgDW
 QaHVx220hgi5NsqJrRoues2ij6vdBfVVpelg/fvnCZZVhdezNZOgRa8wuYKtIbgvEHr+
 kCYA==
X-Gm-Message-State: AOJu0Yxl0BJeE4leCRWBOztsb0AXSCOKDqcl+WUZckju/bk8d/bBSy+U
 n3Jg+zIE69MmIR28vpkK3t992ivx6TYgEcgg8PzpdQ==
X-Received: by 2002:a5d:6812:0:b0:317:f18b:a950 with SMTP id
 w18-20020a5d6812000000b00317f18ba950mr8175491wru.26.1694441888949; Mon, 11
 Sep 2023 07:18:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230907160340.260094-1-peter.maydell@linaro.org>
 <20230907160340.260094-12-peter.maydell@linaro.org>
 <fbc33e98-2f8e-d503-c219-20c2b6eb02d2@linaro.org>
In-Reply-To: <fbc33e98-2f8e-d503-c219-20c2b6eb02d2@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Sep 2023 15:17:57 +0100
Message-ID: <CAFEAcA8V_8wFpLJd7mNygEeU2iCdmMEZz4cXANXfwzD=FBGqkw@mail.gmail.com>
Subject: Re: [PATCH 11/14] target/arm: Implement the SETG* instructions
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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
X-TUID: SpUCqCvQkcJY

On Sat, 9 Sept 2023 at 17:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 9/7/23 09:03, Peter Maydell wrote:
> > The FEAT_MOPS SETG* instructions are very similar to the SET*
> > instructions, but as well as setting memory contents they also
> > set the MTE tags. They are architecturally required to operate
> > on tag-granule aligned regions only.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >   target/arm/internals.h         | 10 ++++
> >   target/arm/tcg/a64.decode      |  5 ++
> >   target/arm/tcg/helper-a64.c    | 92 +++++++++++++++++++++++++++++++---
> >   target/arm/tcg/mte_helper.c    | 40 +++++++++++++++
> >   target/arm/tcg/translate-a64.c | 20 +++++---
> >   5 files changed, 155 insertions(+), 12 deletions(-)
> >
> > diff --git a/target/arm/internals.h b/target/arm/internals.h
> > index a70a7fd50f6..642f77df29b 100644
> > --- a/target/arm/internals.h
> > +++ b/target/arm/internals.h
> > @@ -1300,6 +1300,16 @@ uint64_t mte_mops_probe(CPUARMState *env, uint64_t ptr, uint64_t size,
> >   void mte_check_fail(CPUARMState *env, uint32_t desc,
> >                       uint64_t dirty_ptr, uintptr_t ra);
> >
> > +/**
> > + * mte_mops_set_tags: Set MTE tags for a portion of a FEAT_MOPS operation
> > + * @env: CPU env
> > + * @dirty_ptr: Start address of memory region (dirty pointer)
> > + * @size: length of region (guaranteed not to cross page boundary)
> > + * @desc: MTEDESC descriptor word
> > + */
> > +void mte_mops_set_tags(CPUARMState *env, uint64_t dirty_ptr, uint64_t size,
> > +                       uint32_t desc);
> > +
> >   static inline int allocation_tag_from_addr(uint64_t ptr)
> >   {
> >       return extract64(ptr, 56, 4);
> > diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
> > index 8cddc207a6f..46caeb59fe5 100644
> > --- a/target/arm/tcg/a64.decode
> > +++ b/target/arm/tcg/a64.decode
> > @@ -569,3 +569,8 @@ STZ2G           11011001 11 1 ......... 11 ..... ..... @ldst_tag p=0 w=1
> >   SETP            00 011001110 ..... 00 . . 01 ..... ..... @set
> >   SETM            00 011001110 ..... 01 . . 01 ..... ..... @set
> >   SETE            00 011001110 ..... 10 . . 01 ..... ..... @set
> > +
> > +# Like SET, but also setting MTE tags
> > +SETGP           00 011101110 ..... 00 . . 01 ..... ..... @set
> > +SETGM           00 011101110 ..... 01 . . 01 ..... ..... @set
> > +SETGE           00 011101110 ..... 10 . . 01 ..... ..... @set
> > diff --git a/target/arm/tcg/helper-a64.c b/target/arm/tcg/helper-a64.c
> > index 73169eb0b56..96780067262 100644
> > --- a/target/arm/tcg/helper-a64.c
> > +++ b/target/arm/tcg/helper-a64.c
> > @@ -1103,6 +1103,54 @@ static uint64_t set_step(CPUARMState *env, uint64_t toaddr,
> >       return setsize;
> >   }
> >
> > +/*
> > + * Similar, but setting tags. The architecture requires us to do this
> > + * in 16-byte chunks. SETP accesses are not tag checked; they set
> > + * the tags.
> > + */
> > +static uint64_t set_step_tags(CPUARMState *env, uint64_t toaddr,
> > +                              uint64_t setsize, uint32_t data, int memidx,
> > +                              uint32_t *mtedesc, uintptr_t ra)
> > +{
> > +    void *mem;
> > +    uint64_t cleanaddr;
> > +
> > +    setsize = MIN(setsize, page_limit(toaddr));
> > +
> > +    cleanaddr = useronly_clean_ptr(toaddr);
> > +    /*
> > +     * Trapless lookup: returns NULL for invalid page, I/O,
> > +     * watchpoints, clean pages, etc.
> > +     */
> > +    mem = tlb_vaddr_to_host(env, cleanaddr, MMU_DATA_STORE, memidx);
> > +
> > +#ifndef CONFIG_USER_ONLY
> > +    if (unlikely(!mem)) {
> > +        /*
> > +         * Slow-path: just do one write. This will handle the
> > +         * watchpoint, invalid page, etc handling correctly.
> > +         * The architecture requires that we do 16 bytes at a time,
> > +         * and we know both ptr and size are 16 byte aligned.
> > +         * For clean code pages, the next iteration will see
> > +         * the page dirty and will use the fast path.
> > +         */
> > +        uint64_t repldata = data * 0x0101010101010101ULL;
> > +        cpu_stq_mmuidx_ra(env, toaddr, repldata, memidx, ra);
> > +        cpu_stq_mmuidx_ra(env, toaddr + 8, repldata, memidx, ra);
> > +        mte_mops_set_tags(env, toaddr, 16, *mtedesc);
> > +        return 16;
>
> You can use cpu_st16_mmu for one store.
>
> > @@ -1154,20 +1219,27 @@ void HELPER(setp)(CPUARMState *env, uint32_t syndrome, uint32_t mtedesc)
> >       int rd = mops_destreg(syndrome);
> >       int rs = mops_srcreg(syndrome);
> >       int rn = mops_sizereg(syndrome);
> > +    bool set_tags = mops_is_setg(syndrome);
> >       uint8_t data = env->xregs[rs];
> >       uint32_t memidx = FIELD_EX32(mtedesc, MTEDESC, MIDX);
> >       uint64_t toaddr = env->xregs[rd];
> >       uint64_t setsize = env->xregs[rn];
> >       uint64_t stagesetsize, step;
> >       uintptr_t ra = GETPC();
> > +    StepFn *stepfn = set_tags ? set_step_tags : set_step;
> >
> >       check_mops_enabled(env, ra);
> >
> >       if (setsize > INT64_MAX) {
> >           setsize = INT64_MAX;
> > +        if (set_tags) {
> > +            setsize &= ~0xf;
> > +        }
> >       }
>
> I think it would be a little better if set_tags was visible to the compiler, via inlining,
> so that all of the conditions can be folded away.

Do you mean having a separate triplet of helper functions
for setg, which then call an inline function shared with
the normal setp/setm/sete to do the actual work, rather than
passing "is this setg" via the syndrome ?

thanks
-- PMM
