Received: by 2002:a17:906:f20a:b0:98d:b2f5:1316 with SMTP id gt10csp1474940ejb;
        Mon, 7 Aug 2023 07:04:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFlWPWXy45j8/rv6verR2q1J2u2iqLVTv7BMriXOwX9fNoU5uV+M75UUTvkJBfwA5pEBQ5P
X-Received: by 2002:a05:6102:41a0:b0:443:8053:f969 with SMTP id cd32-20020a05610241a000b004438053f969mr2767771vsb.17.1691417084761;
        Mon, 07 Aug 2023 07:04:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691417084; cv=none;
        d=google.com; s=arc-20160816;
        b=Dh1k8hwI8XdXuKVWXIVZu6qSpjXk7cZcLO4gr86jQNbFzK2TmoW0txWPsW+foq4F7W
         PWUs2t/cUZ2V52UrB/O/GhpRR/tezXYgtwRpZ8Jbra64CK0haKx67Q6nkdrMeVI6ri9p
         y5KeEvBrUpWKjhWuImlDJBCy4ShiXUiqYPefwJhTlRTJ53qh+jRyLkiJ+mU12wTEqi2g
         UBna4oxu7eVH3SOI+6zOFKAm9MiDvZjdJovgmCxhUKoiIfnLNFax72SiqvR9IGu03FKu
         6BHH74VtS7POB1nxBnmUUyiykzTlFMlmokN6yACAch6A3nTjRoGPeEwIHbdwb04crIr0
         4yYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=ybHOHddZSdETsR4kLtiwqTBuOOQ6Q7i/BQT8b36uuzU=;
        fh=AUWhDBBcQJl/cpkEHjYZxji9DdAuAu9jPeTYApU/3e0=;
        b=ou5wL1FlcjYwmHAApEQ0+D9QNaAZuGKJarMMLq9eIIe1BXdHKJ601H1aXFB3CTYSPn
         vb7NIZI+js2jOb5iQ/AW5NQdyuUqwOCaIc8udfFtuDWZMhGMwRNNV8BS+fZShH4Jh/4n
         dmDZxwiWa59cyLGMIBOmGYql03MYv1VEMZ+Pwp3qCNuYtEWQboryfqCX9E44SfvhVtFv
         zGt0RLS2jOZPtkrsdh1C1Y1xFJu7SizIMzvbJ9/BCmrOzyxYz2KyOAYd1YlyFqqEhZpX
         N0ftsdEQPMgSJ0tyXJnRFYlCzRhi8bZWSdWQ458e2z5KhlRC/PcXy8Rjj0/xzk1qWP8x
         bEEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bTyShhf8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s19-20020a9f3653000000b0078729a6c46dsi639313uad.72.2023.08.07.07.04.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Aug 2023 07:04:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bTyShhf8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qT0qC-0004tO-5D; Mon, 07 Aug 2023 10:04:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1qT0q4-0004rc-Cb
 for qemu-arm@nongnu.org; Mon, 07 Aug 2023 10:04:04 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1qT0py-0002aK-8O
 for qemu-arm@nongnu.org; Mon, 07 Aug 2023 10:04:02 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3fe12820bffso38940055e9.3
 for <qemu-arm@nongnu.org>; Mon, 07 Aug 2023 07:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691417036; x=1692021836;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ybHOHddZSdETsR4kLtiwqTBuOOQ6Q7i/BQT8b36uuzU=;
 b=bTyShhf8IE0IKMw9YHFUCYV18b5vflIFWe4VAi/7LQpyv8eEgNmdzUskFP/jxJaHSK
 GlFRnU8okN1JY8kWGKzbAYfkq0nyuDHxaRxUiKHHW2FHlInyYNGeqwd4Lbmiq8XbwBuY
 YwotIUjiyxvV3QEOFKddcNE+BJbb0pRC2Y+ksPp1h4CJDTZCYZWKtrBIyiCTUDbO8fR5
 hvujGC2CSEcBMBfV8f4EcPnrB9cPhdrwjKS5jP4sWxUhmzdp1mct7AoA4wkGJIX7L6jn
 +cXQIDRwrInM7c4zCHxIAhSGBz/PrXuvZzkJEUO9kNwskA8tzDIkaRApkLRwxBpSSl6h
 cOVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691417036; x=1692021836;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ybHOHddZSdETsR4kLtiwqTBuOOQ6Q7i/BQT8b36uuzU=;
 b=DkXcCWU7GPzT17AsNNqNCHDBBT6stj53vySzmm1GZXb6WMxGG6m3udlnViJprx3Px9
 1dEXmttJUf/bRqbTIVFdjCxnkxa4LSfTHyD4hyhWYR0t+4qujvozG8glq1GZ/Jby1f33
 ynTOWf52VdzVFIMT4o/RxN52bpUGnAlPxoKNdwj5Jxh5AL9ent7aYwJ6ts9R8SxGTeP9
 oq/Shzl0vj9Mql3M6edS/7YTc9cqqOLtRPzxM2RKQ9sN+n1jKWdNDdEXLRYBZvgBfhea
 /0b5Mmcn282YFKgFjT/ZIsJHx5eA6Rbe6/wmaBX5Rn15EDMYLg75VFoYPnNC3R41AcVX
 25Mg==
X-Gm-Message-State: AOJu0Yz+P1ORkY2CZMooiHcfDUCgvKzo12zEZRYX74yedfIbolMvIthR
 NW30rPfmS5jw3j7a6kxPkAUHgg==
X-Received: by 2002:a1c:f60b:0:b0:3fa:991c:2af9 with SMTP id
 w11-20020a1cf60b000000b003fa991c2af9mr5969338wmc.16.1691417036081; 
 Mon, 07 Aug 2023 07:03:56 -0700 (PDT)
Received: from myrica ([2.219.138.198]) by smtp.gmail.com with ESMTPSA id
 z10-20020a7bc7ca000000b003fbc9b9699dsm10752429wmk.45.2023.08.07.07.03.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 07:03:55 -0700 (PDT)
Date: Mon, 7 Aug 2023 15:03:57 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: richard.henderson@linaro.org, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: Re: [PATCH v2 5/6] target/arm/helper: Check SCR_EL3.{NSE,NS}
 encoding for AT instructions
Message-ID: <20230807140357.GA769137@myrica>
References: <20230802170157.401491-1-jean-philippe@linaro.org>
 <20230802170157.401491-6-jean-philippe@linaro.org>
 <CAFEAcA-0p2UhURwgLRnUxSK8ktFsULsHz5x3pu+h80VOPBrZvQ@mail.gmail.com>
 <CAFEAcA88J5QnuoJWOsVJj4qOhDHy-P4LMo+v5UdMLOQxy=pvQA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA88J5QnuoJWOsVJj4qOhDHy-P4LMo+v5UdMLOQxy=pvQA@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x334.google.com
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
X-TUID: I994B0fDM/C9

On Mon, Aug 07, 2023 at 10:54:05AM +0100, Peter Maydell wrote:
> On Fri, 4 Aug 2023 at 19:08, Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > On Wed, 2 Aug 2023 at 18:02, Jean-Philippe Brucker
> > <jean-philippe@linaro.org> wrote:
> > >
> > > The AT instruction is UNDEFINED if the {NSE,NS} configuration is
> > > invalid. Add a function to check this on all AT instructions that apply
> > > to an EL lower than 3.
> > >
> > > Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> > > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > > ---
> > >  target/arm/helper.c | 36 +++++++++++++++++++++++++-----------
> > >  1 file changed, 25 insertions(+), 11 deletions(-)
> > >
> > > diff --git a/target/arm/helper.c b/target/arm/helper.c
> > > index fbb03c364b..77dd80ad28 100644
> > > --- a/target/arm/helper.c
> > > +++ b/target/arm/helper.c
> > > @@ -3616,6 +3616,20 @@ static void ats1h_write(CPUARMState *env, const ARMCPRegInfo *ri,
> > >  #endif /* CONFIG_TCG */
> > >  }
> > >
> > > +static CPAccessResult at_e012_access(CPUARMState *env, const ARMCPRegInfo *ri,
> > > +                                     bool isread)
> > > +{
> > > +    /*
> > > +     * R_NYXTL: instruction is UNDEFINED if it applies to an Exception level
> > > +     * lower than EL3 and the combination SCR_EL3.{NSE,NS} is reserved.
> > > +     */
> > > +    if (cpu_isar_feature(aa64_rme, env_archcpu(env)) &&
> > > +        (env->cp15.scr_el3 & (SCR_NSE | SCR_NS)) == SCR_NSE) {
> > > +        return CP_ACCESS_TRAP;
> > > +    }
> >
> > The AArch64.AT() pseudocode and the text in the individual
> > AT insn descriptions ("When FEAT_RME is implemented, if the Effective
> > value of SCR_EL3.{NSE, NS} is a reserved value, this instruction is
> > UNDEFINED at EL3") say that this check needs an "arm_current_el(env) == 3"
> > condition too.
> 
> It's been pointed out to me that since trying to return from
> EL3 with SCR_EL3.{NSE,NS} == {1,0} is an illegal exception return,
> it's not actually possible to try to execute these insns in this
> state from any other EL than EL3. So we don't actually need
> to check for EL3 here.
> 
> QEMU's implementation of exception return is missing that
> check for illegal-exception-return on bad {NSE,NS}, though.

I can add a patch to check that exception return condition, and add a
comment here explaining that this can only happen when executing at EL3

Thanks,
Jean
