Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp1804746lfc;
        Fri, 28 Aug 2020 14:41:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzgsi5mCQb1yVBdu2BNQiIxTrzG66ylLRA7y/eO5AVatEcU4d7R6GlKI5VM1+4juW8NPiBh
X-Received: by 2002:a25:6b4e:: with SMTP id o14mr5034017ybm.506.1598650889961;
        Fri, 28 Aug 2020 14:41:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598650889; cv=none;
        d=google.com; s=arc-20160816;
        b=iUJ+ZhvIV+7vVoSTvEyNJf71HCK+l5ZX39OmVo0K1NbNZtRfSSjkZh9omKu6YB3tfg
         Y2rmZgfrlcjNYSX4wR8K8VjyYPSBAMZ+tPUPr46XmWZQuqssIChdDjtMzVdBN2w4ryOV
         KKLZEGHFJldJ/nJNS/xgUA7Q/InGOtGI7V4PT88gcdIex92ljGkrm0JRDghP/5MKQhEE
         gSXLXZKZxAvxfY6rDr73lyKwnGXefZTBUHoo1Ccj/460ygvQzylnLw7O7tq9nq6S9UTE
         lD/EZszZZtciRtWofMULPA9kbWi5RL3mip2sBEse0hhBkCxqa14W0SrZVKwblQC1YBnD
         RVJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WAAqBab0dsaOmEhirldciEMZEwkJuEViOintycNFPAM=;
        b=BRVgrgxiWiTf4owVKihcMGnLDZ6F+Zf/aGBV61dHTh/jTWer74FIha2jsTOWL1jK0M
         4cH5RgwCJGmtZ/JmbZEVKPUClVTDYtqiuUwTMNOApyXcNWZYse9WjWHZcj6dF6bKOOQl
         AaBz/v6SQhlRoSsK8smuWwslQq1IDSatpnUCHJbW1L3VyiVJtESHEDkqctvMkUMyUZiY
         JSV+si9u9QOofYTxG+qDKAvST0/+EqN4oPzf09cTZY+6cbF3CbsIGlavT3fYErOVj6KD
         JWpJqy9SJtUnlrw17Om5ck0EJ9Ut63FBsm0Ffac2FrZs6tFuhcRtnCkgbhYCJahOLncu
         LqnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=N9yLLRLg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x20si530853ybd.409.2020.08.28.14.41.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Aug 2020 14:41:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=N9yLLRLg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kBm7l-0004CA-CQ
	for alex.bennee@linaro.org; Fri, 28 Aug 2020 17:41:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kBm71-0003TX-Bk
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 17:40:43 -0400
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:44101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kBm6z-0003Ih-3O
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 17:40:42 -0400
Received: by mail-ej1-x641.google.com with SMTP id bo3so960144ejb.11
 for <qemu-arm@nongnu.org>; Fri, 28 Aug 2020 14:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WAAqBab0dsaOmEhirldciEMZEwkJuEViOintycNFPAM=;
 b=N9yLLRLggf0d37kPNyOcqRtC6aabQpbRQJAKop/MHxZWLyuIwsQe1Kkr5gNuuUz+Ay
 Rz4hpMQyTVOl+Fs3ezqSIaT9NNlaE+1f3Ke72kck3s8G7whNlaJTKxBzJnytQ3AGZhSg
 ojUc0MixGAQoVBz/b9TLQGMfci8SZGvB4pq7XMWca2cIBKp7ZG5XncBL3WRMxGh8XSpY
 EqiaIlWvqwhv/D5apwAbMPtzdP8Qs+mXaKEDn+XUxen/sw5ZLnMlgq4hVRuGnAPRjUJ5
 eAgMGSmBjhx1t3TUH9Iv7hnTkRjGzvCeWLSX7FJ1rzr8Gqt5Tor+ONO3xbnq2cDG+wRH
 vgOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WAAqBab0dsaOmEhirldciEMZEwkJuEViOintycNFPAM=;
 b=sPleyRqIXT4+3ZxcO2XaIycim7D+TrWBOSltn/nO/OnoTv1Ufyr9fJV64XB/cEvksp
 jIxKbq7I6xMXCuUvtEykQ2YpN4PRSW/wnMqy0vJEPSXbtj7mhm4iI3NIxuVL2Zn44XTL
 eyhL+ED7nZ3OsFFLuYe4WaZeBvRZZyUqAxvWSvwyXCRJ6GARcY4tmajuz9qPZ4LmiIGq
 FaEtfGE5PZj1py9wg/l10HfLR55Evcr6YBIgzcl3l92bQM+gaeT9xIdbLEyRdtP/QTvC
 hfU8/nlUeSdEEj1uJJtWnNgSW1+jalCuMvX5vOiRRSTjywenivl2+edGf6RCdL/6q6KL
 UM4Q==
X-Gm-Message-State: AOAM5315dd+BLFOuECNPMQxoOt6Nx7RlGFLzejVSeMw/uU7bcKIyyBNq
 7J7kJkzHvLGEQ51RJX+Sa2wyMzy3k4//OQU2qZLl5w==
X-Received: by 2002:a17:906:f28b:: with SMTP id
 gu11mr717177ejb.407.1598650839367; 
 Fri, 28 Aug 2020 14:40:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200828183354.27913-1-peter.maydell@linaro.org>
 <20200828183354.27913-25-peter.maydell@linaro.org>
 <55675521-a61c-186c-599f-7373e9165184@linaro.org>
In-Reply-To: <55675521-a61c-186c-599f-7373e9165184@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 28 Aug 2020 22:40:28 +0100
Message-ID: <CAFEAcA87JLog+Ly5wvRi2bOvwDvFVL5mjpnkeB3h+pckbnNMmQ@mail.gmail.com>
Subject: Re: [PATCH v2 24/45] target/arm: Implement fp16 for Neon VRECPE,
 VRSQRTE using gvec
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x641.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: ESHwhEqoTXG9

On Fri, 28 Aug 2020 at 21:10, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 8/28/20 11:33 AM, Peter Maydell wrote:
> > We already have gvec helpers for floating point VRECPE and
> > VRQSRTE, so convert the Neon decoder to use them and
> > add the fp16 support.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >  target/arm/translate-neon.c.inc | 29 +++++++++++++++++++++++++++--
> >  1 file changed, 27 insertions(+), 2 deletions(-)
> >
> > diff --git a/target/arm/translate-neon.c.inc b/target/arm/translate-neon.c.inc
> > index 9d0959517fa..872f093a1fc 100644
> > --- a/target/arm/translate-neon.c.inc
> > +++ b/target/arm/translate-neon.c.inc
> > @@ -3857,13 +3857,38 @@ static bool do_2misc_fp(DisasContext *s, arg_2misc *a,
> >          return do_2misc_fp(s, a, FUNC);                         \
> >      }
> >
> > -DO_2MISC_FP(VRECPE_F, gen_helper_recpe_f32)
> > -DO_2MISC_FP(VRSQRTE_F, gen_helper_rsqrte_f32)
> >  DO_2MISC_FP(VCVT_FS, gen_helper_vfp_sitos)
> >  DO_2MISC_FP(VCVT_FU, gen_helper_vfp_uitos)
> >  DO_2MISC_FP(VCVT_SF, gen_helper_vfp_tosizs)
> >  DO_2MISC_FP(VCVT_UF, gen_helper_vfp_touizs)
> >
> > +#define DO_2MISC_FP_VEC(INSN, HFUNC, SFUNC)                             \
> > +    static void gen_##INSN(unsigned vece, uint32_t rd_ofs,              \
> > +                           uint32_t rm_ofs,                             \
> > +                           uint32_t oprsz, uint32_t maxsz)              \
> > +    {                                                                   \
> > +        static gen_helper_gvec_2_ptr * const fns[4] = {                 \
> > +            NULL, HFUNC, SFUNC, NULL,                                   \
> > +        };                                                              \
> > +        TCGv_ptr fpst;                                                  \
> > +        fpst = fpstatus_ptr(vece == 1 ? FPST_STD_F16 : FPST_STD);       \
>
> Perhaps clearer with MO_16 instead of 1.

OK (matches what we've mostly used elsewhere when selecting the
argument to fpstatus_ptr()).

> > +        tcg_gen_gvec_2_ptr(rd_ofs, rm_ofs, fpst, oprsz, maxsz, 0,       \
> > +                           fns[vece]);                                  \
> > +        tcg_temp_free_ptr(fpst);                                        \
> > +    }                                                                   \
> > +    static bool trans_##INSN(DisasContext *s, arg_2misc *a)             \
> > +    {                                                                   \
> > +        if (a->size == 0 ||                                             \
> > +            (a->size == 1 && !dc_isar_feature(aa32_fp16_arith, s)))     \
> > +        {                                                               \
>
> Likewise

Here I'm not so sure -- the thing you'd be cross-checking the size
against is the Arm ARM, which uses '01' and '10' (or '1' and '0', depending
on the insn), since it's the raw size field from the insn we're
looking at, not the data-type size. They happen to be the same values
for this insn, but aren't for all insns. (VADD (fp) and the other
@3same_fp patterns are examples of the other encoding.)

The other approach would be to standardize on "the decodetree pattern
always converts the size to the data-type size, regardless of how
it's encoded in the insn fields", and then you could check against
MO_16 here. Would that be better ?

> , and the { is on the wrong line.

Will fix.

thanks
-- PMM
