Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp227512lfb;
        Thu, 9 Sep 2021 07:54:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxEjxFUDV+11uTzK4EgqrXEfCRxvGtaVqi0NCH8vWy3eq439f0AfjI/52Z7uXmGQJ1O8byG
X-Received: by 2002:a92:db4b:: with SMTP id w11mr2668098ilq.145.1631199278038;
        Thu, 09 Sep 2021 07:54:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631199278; cv=none;
        d=google.com; s=arc-20160816;
        b=JP2eyzDAjIWVGvM57LqnET0YU8XNRb3p3YKx4L44v3qcdn/3qP+bjEn1O91mEL9XZK
         /Pqtf1hUSFrFBNp4BEoKzVNGy7b37IWmn0+ikJMizYB4x1El1DOvQyD1wFDU69btIc6b
         FrmgClpiyv0F5Y1/HHzop8PtdB7bHKaKkopbIU81cibbLQUyw77tInzZ3pXZk9cfczkk
         K8Jeckm3BNfgXylpbHywn2Ql3YjwDtdV7sxPUAUC4KUnmHwTT2ioD8zKHc3ZV58/8535
         JTNZJ+iFA//NIfcDRuyHH+ZfzhQzGgJ2cM4EK5DOjUZNKr3Pbld+8VAj7dQr2GnF+D5t
         cJZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s37qy3pJpQotWQ5W3EedXxPZF2ZNAy2RUSXNbX8p3ks=;
        b=vCBCJtvsF8KNWmCfadgIeBRcMeuB7ImOKyKOHbyGzNUJW6Ql5swUVDotG4J89H1FhH
         RQiETMiWH/E7/F6D3oILhU2+UJWBAAq28Or67ADoOHm47+s77vt8YWtNAibUio3Q4G+f
         7N00+SsZQEzFRtlmTSevR1930E2BSTNo0dJXV0jgnb8T430wl8mGTL10FZQ2m5xkzRRq
         ZiieTWqPI3h4Ccu4EfJ3c6QXVcFNcGmYY2ESEebcn8zvgC+3rclBAVJ6zchxdgJnyidi
         rH/h1E3/Y5hxT6BI4F4n5FdN0zYKB8m1jF3PunBdpgy12aE9y5mDT2GWSrG23SsZsl5S
         oXug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wnt2bYof;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w10si1810101jaa.124.2021.09.09.07.54.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Sep 2021 07:54:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wnt2bYof;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mOLRl-0003Ow-EY
	for alex.bennee@linaro.org; Thu, 09 Sep 2021 10:54:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mOLRe-0003OV-Ea
 for qemu-arm@nongnu.org; Thu, 09 Sep 2021 10:54:30 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:43818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mOLRc-0004AJ-Qz
 for qemu-arm@nongnu.org; Thu, 09 Sep 2021 10:54:30 -0400
Received: by mail-wr1-x434.google.com with SMTP id b6so2951976wrh.10
 for <qemu-arm@nongnu.org>; Thu, 09 Sep 2021 07:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=s37qy3pJpQotWQ5W3EedXxPZF2ZNAy2RUSXNbX8p3ks=;
 b=wnt2bYof7vY3gxi1ot3asNzLf+CiiLZSgmWzrORXlQEyFLQvSb/TFTbqqpRHkWJOxx
 WdWzsl1AJDe6aP+DnuByGY3fdi2pbYrl3rFfBLoIuLvF8nQ/i6VYU5vFwNr14LSBI95u
 tI2Gro59FXxsypZ2vzy7+uvyUBsL9eR0pne88f4W7X1oLGh9MBx3Vv1v5JnuTYbmV8lG
 IweJz2hQHoZmoa+PAEMi450R22hWYHCuvGWfnM0NQtN9+A+7AXduudOZJzprMg5NVrsS
 pR13+iotPdS9D4TAMKd9J+VSr9XFL+vn6xZBvg/jn2yEn1m++rF+guwp6sZJqV0irmN6
 uKdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=s37qy3pJpQotWQ5W3EedXxPZF2ZNAy2RUSXNbX8p3ks=;
 b=MDPNkiY101mHBFxR2ZhXdmvE0T5zPMKaj0pysHfChxN5KqLi6q98molav8AY12mOPG
 5O8CgdREGy8ugOQsQGglScU34k7LTqPesLX4cItjCTPIDuqlNjsvsx+Y5vlI3d/rAhIS
 zwAQ7RxRlU3EBPfix/VMUn4F97Gj4cz2OsZO27tA3HSeFT6mQE5WsP8rdQ/WgWVQ1mCc
 WDwXBjPJ4B5NxI4CvQQof0VDaKJYFFKQKKWsVMp9RC6+UlCwCeX8T2UEMxIfpXDmk86M
 sy+AVVyUff86HFPVGWWMShZd9M62zkIjnHPpDthjbl7qJsNkSDsTJNPtBAHRZDLyGMmC
 0P8A==
X-Gm-Message-State: AOAM533jT3ZDsoLteb8y0H1mmHnN8HxrtaGRp7uKLLrmQrWh7ij7xXbn
 ntpjXJ9wP5uA9tyEzXEDY+AJSUTCwdDofTvjDYsoDQ==
X-Received: by 2002:a5d:4b4b:: with SMTP id w11mr993152wrs.302.1631199267201; 
 Thu, 09 Sep 2021 07:54:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210902150910.15748-1-peter.maydell@linaro.org>
 <20210902150910.15748-2-peter.maydell@linaro.org>
 <76cd3594-f864-232c-8687-19a1d44ff07e@linaro.org>
In-Reply-To: <76cd3594-f864-232c-8687-19a1d44ff07e@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Sep 2021 15:53:37 +0100
Message-ID: <CAFEAcA-k-6hLBXn+7S_WH3w2QHwXad5H6L_iSLYK+9dQxHvTxg@mail.gmail.com>
Subject: Re: [PATCH 1/4] target/arm: Add TB flag for "MVE insns not predicated"
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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
X-TUID: 8KhAW2jFcxSV

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

I found a reason why these should stay split, and it's related to the
discussion in this thread about TB flags whose state changes and whether
that means you need to end the TB. The TB flag state in the CONDEXEC bits
(ie including the ECI bits) changes for a lot of instructions, but we don't
need to end the TB because it always changes in the exact same way
regardless. A TB flag encoding just "MVE predication might happen
due to LTPSIZE and VPR" changes in only a few places, and we can end
the TB in those places. A single TB flag that mixes together all of
LTPSIZE, VPR and ECI can change state in a hard-to-disentangle way,
because a non-zero ECI can change to zero for just about any MVE insn.

If we keep MVE_NO_PRED and ECI distinct, then we don't need to consider
ECI updates when figuring out if we need to end the TB, which works out neater.

thanks
-- PMM
