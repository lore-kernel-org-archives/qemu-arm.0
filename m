Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp777180ejc;
        Mon, 22 Aug 2022 02:02:10 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5JZpskf/zG9uEsBvQ0LEGRgILb2xf6DmCi1OUbogdTvD250HXGFZFBQI00GcYzkebvs+xe
X-Received: by 2002:a05:6214:e44:b0:496:b443:628b with SMTP id o4-20020a0562140e4400b00496b443628bmr14849903qvc.10.1661158930394;
        Mon, 22 Aug 2022 02:02:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661158930; cv=none;
        d=google.com; s=arc-20160816;
        b=X911J+HQyf9oBsUNmDC92BA3Vl5QSRWV5bUIgHLGp8yj+UPBVpT3/RKAbGq+XpDR+W
         yqY4jW+U1ONOsnPUjcLBo7qPiA5C85lpU8Bt8TquEI5iFAUsMkX+yPg88bZIEhJfX2Oo
         s0NCLi1ZNW++AcGrTLVeuMV3WC/FQScUOaIDnEIVtcilMb0WRgKTW3JndsRwxj8kmfUj
         zZ4OB2bjdD2XEqM5S7LT+CpPdfQ9Z/IJ8GdREnrT+YK36h6MwuZsz0QxKv838ZJePsGx
         DqXoKTeqF6a4/MF/UH7FB1x7mqCqfnRLZ5DZPo335NEy38B8oHPNA+boaDt1jglTy4lS
         x/tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=q7/0VJ80uqa1ouLnINRrqRT6ituxker7a/1wGsOkwfo=;
        b=T+Gazyi9EQQmtTYTzeufgRP4MTua4SF2sYqdKLbfC+zjo4x36obMaokXTzP+vfMJhB
         iFpKSkzW2mEq4Ytts72c0Fn8itn5Z0tK9RsB+pur5pAOGsdmNS715n8OFAroX1L4AYRA
         XHiGE0keVw8UytJVtKzJzG2KtowYixh4u2DwIuyK2bc5UaUwz4Lneo8w2SGywlt4+HdZ
         L4JW7vc7z/oRuwkk1ivmi0xdxQ9Hkm1u13fA0zZdSu/diXH5NNw14EUXBKIPjYEsD8kW
         W8PQ1jfIj/mir4vGvEdKZXjFxz8ZCXkL9YAImcg19ltgOvfAUEB3nFf/ybaOFVJyRGHD
         C2FA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U3alWppk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jf10-20020a0562142a4a00b00492cce62509si4496877qvb.116.2022.08.22.02.02.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Aug 2022 02:02:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U3alWppk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oQ3Jx-0002MI-Sg
	for alex.bennee@linaro.org; Mon, 22 Aug 2022 05:02:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQ3JH-00027O-1U
 for qemu-arm@nongnu.org; Mon, 22 Aug 2022 05:01:28 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d]:35487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQ3JD-0006Ak-GT
 for qemu-arm@nongnu.org; Mon, 22 Aug 2022 05:01:26 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-33365a01f29so274762527b3.2
 for <qemu-arm@nongnu.org>; Mon, 22 Aug 2022 02:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=q7/0VJ80uqa1ouLnINRrqRT6ituxker7a/1wGsOkwfo=;
 b=U3alWppkcvVizfwJi8Qsen6gOu3cXTf9YCgqG3WLxw8A9dUa21DfBrGwQKcbXFL8DB
 KWIfslygk9yor2dICE6YpY3rNV7SVmu2b7R24TMo56pt61INrXtkySB9wTccYARE4pP8
 oJTChRVsCmjQAoA8ns04cM498cdl8cIOtCNlX3AO5RUNY73cbM0jqDYoxqGVialUHlMO
 Vjz7xiVp/fpmDB8EHXzlDNT02GLN7ZySTkQGCLhRwDkaGbcuel0ltoPCyqRw4gc57w8D
 QooK3vETbesGCvPisHiIEoRGSzMy9T8VPPuhbsKhRwCPYJwYpcOdW29H74Apuf1BJwwV
 o1yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=q7/0VJ80uqa1ouLnINRrqRT6ituxker7a/1wGsOkwfo=;
 b=wL7G1PscLaAS90YnSMS64ifAwotIUKWzl2wWpQch1RvkcNsQWokSWEaZNUcg/U1i/e
 ZIDrzR6RIjxdg6N2wBXMAoujn0Fbi5b5QIIgPg8aNEaQ3EM+t16ztC3yT3ApZmLXEW90
 yLwh56WZz5TkIUzHHtK+PylEM7xaB97+GTM1vg3Va7v+m6SywQu8dZvYJ8Bd0EFR3xNX
 Mn1gIZ/ROaJML6W2TkvIWCE5AzMFovTgkU029QdGaVNrmM+SGnUoV5DG1E6CNpXRALBy
 Bqh1t0eyRjSK7Eu9ahOPveJvD7hTDIFdmkmZLzlWCBg57OSnH4V2+y71fH/NAxpKIr4u
 2Zgg==
X-Gm-Message-State: ACgBeo3sQtiIlqa6fN408BmlCOZqtAWB2y0Q2uWB6RS9bNNf7vaN9n+R
 YQLztYWIS6HHPA9nBY6W5zg7ZW4OGWY55hPcIHw6uQ==
X-Received: by 2002:a25:4e85:0:b0:695:8a88:903f with SMTP id
 c127-20020a254e85000000b006958a88903fmr7563529ybb.85.1661158881464; Mon, 22
 Aug 2022 02:01:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220811171619.1154755-1-peter.maydell@linaro.org>
 <20220811171619.1154755-10-peter.maydell@linaro.org>
 <2d2e3bf8-76cc-2364-7f72-956dd0ebe510@linaro.org>
In-Reply-To: <2d2e3bf8-76cc-2364-7f72-956dd0ebe510@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 22 Aug 2022 10:00:39 +0100
Message-ID: <CAFEAcA_CThC5mc4uPiuknPbBYm5nMg5GwFSNfzyAtrOu3ZRUYQ@mail.gmail.com>
Subject: Re: [PATCH 09/10] target/arm: Support 64-bit event counters for
 FEAT_PMUv3p5
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
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
X-TUID: IMHXPBjlzLBg

On Sat, 20 Aug 2022 at 19:54, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 8/11/22 10:16, Peter Maydell wrote:
> > +static bool pmevcntr_is_64_bit(CPUARMState *env, int counter)
> > +{
> > +    /* Return true if the specified event counter is configured to be 64 bit */
> > +
> > +    /* This isn't intended to be used with the cycle counter */
> > +    assert(counter < 31);
> > +
> > +    if (!cpu_isar_feature(any_pmuv3p5, env_archcpu(env))) {
> > +        return false;
> > +    }
> > +
> > +    if (arm_feature(env, ARM_FEATURE_EL2)) {
> > +        /*
> > +         * MDCR_EL2.HLP still applies even when EL2 is disabled in the
> > +         * current security state, so we don't use arm_mdcr_el2_eff() here.
> > +         */
> > +        bool hlp = env->cp15.mdcr_el2 & MDCR_HLP;
> > +        int hpmn = env->cp15.mdcr_el2 & MDCR_HPMN;
>
> The specs could be improved here, as the top of MDCR_EL2 says it doesn't apply if EL2
> isn't enabled in the security state, HLP has the exception noted above, but HPMN does not.
>   I conclude that HPMN is missing the exception, because nothing else makes sense.

I suspect (but haven't thought through) that not all of the things HPMN
controls apply when EL2 is disabled, so it's probably more complicated
than a blanket "applies even when EL2 is disabled" tag the way HLP does it.

thanks
-- PMM
