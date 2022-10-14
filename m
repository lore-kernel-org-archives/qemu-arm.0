Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp553579ejn;
        Fri, 14 Oct 2022 10:50:36 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4dW1y6FsjSaNf/9CrQD3NDKeGHwdk/oPgKN6eAO+UAjAHG/4MHFmT3xcHrj1UdBLE+pyHn
X-Received: by 2002:a05:6214:4114:b0:4b1:c7b1:6fad with SMTP id kc20-20020a056214411400b004b1c7b16fadmr5387074qvb.76.1665769836775;
        Fri, 14 Oct 2022 10:50:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665769836; cv=none;
        d=google.com; s=arc-20160816;
        b=FGyzwbQapGbM7020sPCny9hAz7GCGZLQTtZmLzwbgI3iQaLSpMG+Un4qs3ysTOmqf/
         x9jGXhCnXJA3Rgcn8V7S6dNuuodXCBWAkMeqaT+zuFJWwcZpS3TbkzgJcTp0goBYLVgD
         UufXyh5mKFxXmpOtY/iWZusIHAL0GODogp/gYKUg5ygFgUhVd0a9oI+ocAN4aERN8Vbl
         6eJ2ZvhsH4vfyOQKQjQcErl99I/a2lqO+bVqnW8S8mSyUKrBEaFv4OXcv1LTUAzpobX5
         XA1UVMGawT8wLOlIc02TUkuWxao+LtvjJY5W0lDvd0hkT0A/ViIquntm+tSl1I0SWxZE
         JZXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=21ufqUHx7k63zJ2+vBgvQNyvAMpfgyfDDOG1LPEidS0=;
        b=TcuukGeV1dW1MnpadEEck8Nnb2YLgSTg77JYO1dRVVZ2hST5eormNrMQLht4uVSikn
         cr0SX2JXH4xSs4ViprH4c46nj7XmtyI/JCwGJTN9qizfnrTOo2bzOro/EqAwneAPQLMl
         HgySeskG74yh9lavurgH3el8+MzgMdON7UQiwxHq7rZ3wxI+98ZfIHx3QfQpxk6zuY2u
         kVBW+0rSaCZYttj9I9yYTjfjjPng7yBsIwKJ1IVuoqS2gjJait7X6Q+JUHDkCLuvnX9+
         A3evBo/07zbc8JTCgK+bCVKqMORbXnpvb/zLavSy/wSRgsxJqyvOYzFruVOLZvBX4lwv
         L58Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GA5q4oCz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x25-20020ae9f819000000b006ce1a3b5321si1597946qkh.252.2022.10.14.10.50.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Oct 2022 10:50:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GA5q4oCz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ojOpQ-0007So-5i
	for alex.bennee@linaro.org; Fri, 14 Oct 2022 13:50:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ojOok-0007QM-Vz
 for qemu-arm@nongnu.org; Fri, 14 Oct 2022 13:49:56 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:44942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ojOoh-0001Fv-PU
 for qemu-arm@nongnu.org; Fri, 14 Oct 2022 13:49:53 -0400
Received: by mail-pf1-x42f.google.com with SMTP id i3so5542657pfc.11
 for <qemu-arm@nongnu.org>; Fri, 14 Oct 2022 10:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=21ufqUHx7k63zJ2+vBgvQNyvAMpfgyfDDOG1LPEidS0=;
 b=GA5q4oCz7l97ZWnISeFd/O8xv5AsDJUQ64AFfcqDAlqPANDl51veaekJV7uYmQPsma
 m8cy6RzaNknFQLkIdiyMCgM8NNGlPl/LoShAe1CtWZsFx8q8ZzuVVCdiUen4WTEjsBrZ
 uT8kSPfxmoQ+l1aNYM22NKhUpfFTU8//N5+mv1yjFiwSJmSHpR0zh30bL96HRTCl0uE0
 chiCE+vKVGXqtaCxrlRs0UxGDKJE/iX4grAZldCiyIxfSFm1vzBYQgImVanJz6hOMqpP
 aPZ31kNGRIQM6l/5jCOBHAAy7qgCw4q5BUddl1m+bUINyplN69mveyGPOm4Vw2P08pnb
 61oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=21ufqUHx7k63zJ2+vBgvQNyvAMpfgyfDDOG1LPEidS0=;
 b=WSCr9mmtKzzOnmCysbVfkA81FtKNsiFo/bjTogULADd0jSXnyMBWbDuA/P5THvzAub
 RP7kx+CaidprtgVNDVpYmISwmGDql2iwJlpeQNEFYmTDJacjwR3QTcZZgRYsiCwkwpG8
 05KpPeLi/CmAIfA/HvDw3XtJHsrwUongSHG/mN4y4yAjvfx35eybCBd8HSao6RSIl0yS
 oKhIvKmyrWmV5mxROu+HR+ubusAwtD8wbDzptRgIEdLipo7Tlb/PlPuFzE9JhDD2w73E
 kwPQ3VkUf2kXMOJ59yo8MSOVs7CtcUd3TumITdvqneJ06PHl2NV+m9yeHE81fXpLrwxS
 gi+w==
X-Gm-Message-State: ACrzQf2Ioy8WULVwfVvMgScMr/8F5Hjx1gQilcqaFklVIkd6Xjc4VFrN
 fXAVBR8MAdaPW6i40WeLdR8Ca6/L2bTHhIyv1u7HJQ==
X-Received: by 2002:a63:2212:0:b0:43b:f03d:856a with SMTP id
 i18-20020a632212000000b0043bf03d856amr5537260pgi.192.1665769790360; Fri, 14
 Oct 2022 10:49:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220930220312.135327-1-richard.henderson@linaro.org>
 <20220930220312.135327-10-richard.henderson@linaro.org>
 <CAFEAcA_x9zJQy1_9_ySO+TNnnXnYPC3Uq37AN1jP65SuEMvJZw@mail.gmail.com>
 <d1196e9c-c983-0b74-9141-ac10154429cd@linaro.org>
In-Reply-To: <d1196e9c-c983-0b74-9141-ac10154429cd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 14 Oct 2022 18:49:38 +0100
Message-ID: <CAFEAcA8i1sFTA74Oudj3Z7CYYY3P2g0+BeaSy1E_R3HBkTv6dg@mail.gmail.com>
Subject: Re: [PATCH v5 9/9] target/arm: Enable TARGET_TB_PCREL
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42f.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: e1t87SaHKh6s

On Tue, 4 Oct 2022 at 20:27, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 10/4/22 09:23, Peter Maydell wrote:
> >> @@ -347,16 +354,22 @@ static void gen_exception_internal(int excp)
> >>
> >>   static void gen_exception_internal_insn(DisasContext *s, int excp)
> >>   {
> >> +    target_ulong pc_save = s->pc_save;
> >> +
> >>       gen_a64_update_pc(s, 0);
> >>       gen_exception_internal(excp);
> >>       s->base.is_jmp = DISAS_NORETURN;
> >> +    s->pc_save = pc_save;
> >
> > What is trashing s->pc_save that we have to work around like this,
> > here and in the other similar changes ?
>
> gen_a64_update_pc trashes pc_save.
>
> Off of the top of my head, I can't remember what conditionally uses exceptions (single
> step?).  But the usage pattern that is interesting is
>
>      brcond(x, y, L1)
>      update_pc(disp1);
>      exit-or-exception.
> L1:
>      update_pc(disp2);
>      exit-or-exception.
>
> where at L1 we should have the same pc_save value as we did at the brcond.  Saving and
> restoring around (at least some of) the DISAS_NORETURN points achieves that.

(I figured it would be easiest to continue this conversation
in this thread rather than breaking it up to reply to the v6
equivalent patch.)

I guess it does, but it feels like a weird place to be doing that.
If what we want is "at the label L1 we know the pc_save value
needs to be some specific thing", then shouldn't we
achieve that by setting pc_save to a specific value at that
point? e.g. wrapping gen_set_label() with a function that
does "set the label here, guest PC value is going to be this".
Which should generally be the save_pc value at the point
where you emit the brcond() to this label, right? Maybe you
could even have a little struct that wraps up "TCGLabel*
and the pc_save value associated with a branch to it".
But anyway, I think the less confusing way to handle this is
that the changes to pc_save happen at the label, because that's
where the runtime flow-of-control is already being dealt with.

Also, I think that you need to do something for the case
in translate.c where we call tcg_remove_ops_after() --
that now needs to fix pc_save back up to the value it had
when we called tcg_last_op(). (There is also one of those
in target/i386, I haven't checked whether the i386 pcrel
handling series took care of that.)

thanks
-- PMM
