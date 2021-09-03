Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1339400lfb;
        Fri, 3 Sep 2021 07:18:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyOXrqm6H26gjP332U+8Wcecai0K07xTjchUd29fEhN/amiMTdgCzgO8GGwzy2ODquEFmkd
X-Received: by 2002:a7b:c850:: with SMTP id c16mr8725165wml.22.1630678728687;
        Fri, 03 Sep 2021 07:18:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630678728; cv=none;
        d=google.com; s=arc-20160816;
        b=x6D8jz47ZMe56ZPfyZm1kF+Q75iZdRZq3M43M9PFzP12DRXcKsD9lF547GSArhNCmR
         gn/8H5kNJ0du3+3NN5rS20HxE1U+1QqbtwGQmLuDsWbS6ar0zqeMbyxnWqh3vCoOKooW
         vpPaaADKlifz1cTUPoFv60SoeW1aibaniiySZG6kfVefzHCELcjvNBqIIquM3qLDV+id
         2ggKNAnWxVmzcspi31VzG+ASwkfe+Tb0DfjZ8/KoCo2wDvSfoPgWNNrAOu05Si3fCJLI
         uv2qZdHYL/7GI0KDZCaVn00tCB3jFYmhGtnVlVj70IKfnP0CrJHiPkipVKSgzqvy/7d2
         ZDXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DNOO28MNYdnbyE/lnSORo4hFz6wy6QGqsVHy1LaC8Ts=;
        b=0NboBqB0LXhIJkv8KmRAJ+uDJrzqm1vmaGaGcffkEw4jfn6+xYpgZXKEaTqcL1ctfG
         bcGMvzTfKyslOWB6rNn9IGOEsWOySzQxhp9oWcZxQ5TmQymSbOrD0EiYGWglCGGMbkAy
         NlUhMkoumSm4KgdiPWQzCVwZAiQ5C/xohNMOIHe2Q3zRFCdsRndIUIcl2aiV44IEx+5q
         Kep24YZrlmM64sBhAB2GiWBYBOlP7f+pzhw+EkLpyOAzUuf1LSuGqlxTP4zFWDy9GWLN
         yoQ/eiQjIokAm3HJ8KYMYLYrEhadFHtkj/zlVYRFLfkrWB7Mw6zZlr/pbCL6oJjpQwcz
         BV/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="L/x+X6S6";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d7si4780897wri.124.2021.09.03.07.18.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Sep 2021 07:18:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="L/x+X6S6";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mMA1n-0004cT-SV
	for alex.bennee@linaro.org; Fri, 03 Sep 2021 10:18:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mMA1d-0004c7-NR
 for qemu-arm@nongnu.org; Fri, 03 Sep 2021 10:18:37 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:52756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mMA1c-0002gg-1O
 for qemu-arm@nongnu.org; Fri, 03 Sep 2021 10:18:37 -0400
Received: by mail-wm1-x333.google.com with SMTP id e26so3626371wmk.2
 for <qemu-arm@nongnu.org>; Fri, 03 Sep 2021 07:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DNOO28MNYdnbyE/lnSORo4hFz6wy6QGqsVHy1LaC8Ts=;
 b=L/x+X6S6smAi7Tt5aL2moZS9Qs816VN/SefnR1iCMQx5jXrwpxV8w+FSEv9bYMKzhd
 eAl+mZ0V/a8frB2vsCcxvsTbFzWq83pwNyDpf+sX1zYntO+qKWPFEG/ES0IXgrzeFxuF
 bGKtp105QbA4tEODeEskvBy+zIuHyzyNKA/sLDajcjMoYsmXHir5ZkJXVuR3xQ8+xvoi
 sRflvZzhDDboxW/ATg+6IOUDgT+oUXer+uUkBCAu2+DNy+uUC2VZuj7iuQogAc5vfzwy
 5JgALRIyEVLa8D2J8SWzFG0+l/b0J2X28k5clx2sdfR1LxaifBIoPqnA4mY5StxJjrie
 kBrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DNOO28MNYdnbyE/lnSORo4hFz6wy6QGqsVHy1LaC8Ts=;
 b=kYFABxpgsI+XMHYjQOdPcYilCLWGQzBpv9x3aBcACVp6h77aJA0MLoBhmd+6ekWsor
 ZMTnnGGpguZHZwfECZT6OOucb3QEhxyHVB+HtzSGH+Gh2gloeUxKhlxwbLRa/Hsg2vl8
 cyOLHqv82vDpZAi/1LsktG0jLTnhOktWIEEMaWm4vkS/LFpGN63imj5cdDmvJREwS8DK
 AtFQmIYfj+zZlDAq2LGpuNsbU8vzJTviIKtTooLeF9idv+PwjAGddpBFhTbI/BhknNWW
 46lSoxcIkMmrxNTjRD4uN9Lxxo1758UIScnv0C/vFwHs7Ssj9opxo3cA7d3dv3zBhQ3e
 6hfA==
X-Gm-Message-State: AOAM533+XkKad2RQkt0MnHnBRPMOc2Q5KlvaH8zAuFhF9gRXuh1uhm/G
 dSrmkQUeFlgFASvT6qzDckhu5W4LfHXXclaQ/4Xq7Q==
X-Received: by 2002:a7b:c246:: with SMTP id b6mr8532919wmj.37.1630678714550;
 Fri, 03 Sep 2021 07:18:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210902150910.15748-1-peter.maydell@linaro.org>
 <20210902150910.15748-2-peter.maydell@linaro.org>
 <76cd3594-f864-232c-8687-19a1d44ff07e@linaro.org>
In-Reply-To: <76cd3594-f864-232c-8687-19a1d44ff07e@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Sep 2021 15:17:45 +0100
Message-ID: <CAFEAcA8EoyaCSzA1vL_SHY50T6Fxjm420_pYgXx1_+E-nV-MBA@mail.gmail.com>
Subject: Re: [PATCH 1/4] target/arm: Add TB flag for "MVE insns not predicated"
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /C67NMYQJBg7

On Fri, 3 Sept 2021 at 14:58, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 9/2/21 5:09 PM, Peter Maydell wrote:
> > Our current codegen for MVE always calls out to helper functions,
> > because some byte lanes might be predicated. The common case is
> > that in fact there is no predication active and all lanes should
> > be updated together, so we can produce better code by detecting
> > that and using the TCG generic vector infrastructure.
> >
> > Add a TB flag that is set when we can guarantee that there
> > is no active MVE predication, and a bool in the DisasContext.
> > Subsequent patches will use this flag to generate improved
> > code for some instructions.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> > Another of those awkward-to-review patches where the interesting
> > question is "did I miss anywhere where we set v7m.vpr to non-0
> > or v7m.ltpsize to non-4 while in the middle of a TB ?" ...
> >
> > I've left the TB flag as non-cached because there seemed to
> > be an irritatingly large set of places where we'd have to do
> > an hflags recomputation.
>
> Indeed, non-cached seems like the right option.
>
> > +static bool mve_no_predication(CPUARMState *env)
> > +{
> > +    /*
> > +     * Return true if there is definitely no predication of MVE
> > +     * instructions for any reason. (Returning false even if there
> > +     * isn't any predication is OK; generated code will just be
> > +     * a little worse.)
> > +     * We do not account here for partial insn execution due to
> > +     * ECI bits as those are already in the TB flags elsewhere.
> > +     */
>
> I think you should go ahead and include that here, as it makes the test self-contained,
> and avoids you having to do this:
>
> > +        dc->mve_no_pred = EX_TBFLAG_M32(tb_flags, MVE_NO_PRED) && dc->eci == 0;

Yeah. I think I was initially thinking that I wanted the MVE_NO_PRED
flag to be cached in hflags, in which case you have to do the combination
with ECI here because the ECI/condexec bits are not cached. But if we're
happy for MVE_NO_PRED to be not cached then we can happily combine with
ECI directly in mve_no_predication().

> > +    /* VLLDM or VLSTM helpers might have updated vpr or ltpsize */
> > +    s->mve_no_pred = false;
>
> For a moment I was thinking that this was ok, just finish the rest of the TB and resync
> naturally, letting the end of the TB use the helpers.  But then I thought about goto_tb.
> If you have this potentially variable condition, you can't chain the links between this TB
> and the next.

I don't really understand what you mean here. What's the difference
between ending the TB now and translating a few more insns in
this TB before we end it?

thanks
-- PMM
