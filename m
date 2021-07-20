Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp5052119lfc;
        Tue, 20 Jul 2021 11:22:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxSc4sY8hZ/Kf+IU6rlm0XDZbpyV2W7sTURG/49mLLHLS4XHxz0iO4SfzzKfLdDm/kgsBUB
X-Received: by 2002:a25:6801:: with SMTP id d1mr43415153ybc.115.1626805352023;
        Tue, 20 Jul 2021 11:22:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626805352; cv=none;
        d=google.com; s=arc-20160816;
        b=qyjZEQwC+6P4vnne1wuZUWpfm2LkvZ2ZfY/b5SLzDRQ9H1AyIP1/w5JNUV3kpWY5Ok
         smNd5lhc5a+oSP1Fesa/E3ym6XM5fmN0Wgyc8wXtVcYdYc2AZeE4/WfXOcfl35hppIoV
         sbJV3bX1XNQP22sUUwXfmWT/ld8m0zZBRtFbaOZmcPQj4cfCobl9T+Y+1XNXfWbDoF8l
         7Qzp+QxE0otaYYmZuqdOv75CEc8tT7P7xrZltzqvPP2RI/08Q+fBh300kc9dxOuWQx8x
         ydWqzxdhrHM0IoyBGivnmL1XXhjBQCwnd06y09RsKNCxWLd7EDn0OuzOFQVtXt75MhcA
         ogpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+YfAD22Jw66ezaOC24V5pE3rC5yvIvB10KUaXT9/HQ0=;
        b=yJhoeT+QYfH7CkdxKtq/l7ATcbwpEvhllMVATR5OUxT8YGE1mikPacTHudBZQZszS4
         aS9o040QqOcP9PbH/LXFjV0BrF7zNM6VTCki2hH7X8Einwd0whikOf0Uu+2+EKdNF3qS
         aTMt+kTR58Dy5/elW3gZgSqLUwMgc4vfY34bZbSqXpTDhJ84fvL6wN2x+uZ1SyktaFH+
         /G0qvaWPgMoETLY/OT07Z/aNko9OqjNJIm0LQ45p1QaPO4efiDH+DjU3qQ/Iv3M6lRnK
         pCccuGdhtFWn7y5VF8jkh2Zqi8WhfndwRxiXtnqlK6Pyc+2rx0ZsFdtKHuwC9gmhfoP+
         xZog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qNpK5rNn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d31si24743623ybi.130.2021.07.20.11.22.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Jul 2021 11:22:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qNpK5rNn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m5uNz-0008St-F5
	for alex.bennee@linaro.org; Tue, 20 Jul 2021 14:22:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5uNk-0008RH-Sa
 for qemu-arm@nongnu.org; Tue, 20 Jul 2021 14:22:17 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:39749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5uNi-000493-J0
 for qemu-arm@nongnu.org; Tue, 20 Jul 2021 14:22:16 -0400
Received: by mail-ed1-x52c.google.com with SMTP id v1so29616768edt.6
 for <qemu-arm@nongnu.org>; Tue, 20 Jul 2021 11:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+YfAD22Jw66ezaOC24V5pE3rC5yvIvB10KUaXT9/HQ0=;
 b=qNpK5rNnju2eEomZC8nan0xpOHcD4hSwKVvjrTX0oGhep+gC8BedgpOLchS3v4evkZ
 qnuvp6AA3zOb3VOUWeybnqHrmjgvrptvXeYb3OaxStAJl7rXWLS1WkaYD/tj5fTGfdQR
 rLZjrApurINZdvg5bFsB7tKLkl5kigdIZIHRT76ap/DdEs+ag34G3SdUGkW/jwJK9ZsF
 9ZhPr8nSoIp95WHkzOwCUmFdjBDjK5DPJn61O+HDA1OS5duIkcFfSnYESldmQTii9aqF
 OprAppLpN1c+ZggtTq6IyFS3MjFrZT84TssOiPpD3KF6nLduimuZ+p7kkP2SikUlEU1E
 vI0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+YfAD22Jw66ezaOC24V5pE3rC5yvIvB10KUaXT9/HQ0=;
 b=cvKLDuGiR6Sr0R6F1EbQ6ai8Yu3CBuxIHwPWL7Onfcn557/YZ2rgYHxX+usdE2NvwD
 4674EEYTslTqFncuCXtAbHh0pz76saUOPG3ZzvTu6beodNH3RGE9i5yRoc2GgHNHiWqF
 tfYYw0kR206mFTy4cG/SysTxQxoJfBfUmgC3yULkBagwkVgT4Kn0KB8nFF7+Gaur0l4X
 xbQqHrpJ0v1sWY9qiGIBiNb5ygx3mLwuMQ9aOsI1oFsl6wsx1hhfEOZzOgZn1lNru6Wp
 96IVEkN5Yc+kBZTuItEKzZ8J4Oe8wGY2NZ9RR/pcG885/sJqv59YW73VRilbD3tTnAMk
 qMtA==
X-Gm-Message-State: AOAM5337/IRvjG5VCgMIiCDqFRJvxAsxCk6SxAk2sNUHnyQWytInnH9W
 sO/q9sB8oRkSb5E+ItTE5/fHh6of6KcPwuv/XOribw==
X-Received: by 2002:a05:6402:1ca4:: with SMTP id
 cz4mr42765840edb.52.1626805332299; 
 Tue, 20 Jul 2021 11:22:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210713133726.26842-1-peter.maydell@linaro.org>
 <20210713133726.26842-21-peter.maydell@linaro.org>
 <b38a6e37-084b-57c1-dc91-867e9308629b@linaro.org>
 <CAFEAcA81nfSPcYDk1FsVqAcxq5D4NXhtXP5c90_0MLtBVxvr0g@mail.gmail.com>
In-Reply-To: <CAFEAcA81nfSPcYDk1FsVqAcxq5D4NXhtXP5c90_0MLtBVxvr0g@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Jul 2021 19:21:31 +0100
Message-ID: <CAFEAcA8scVSuS=Yn0qCssNiS=wBeQSDJTYyL=z2Lm1J=uy_wOg@mail.gmail.com>
Subject: Re: [PATCH for-6.2 20/34] target/arm: Implement MVE integer min/max
 across vector
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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
X-TUID: z7xFTSJfaq35

On Mon, 19 Jul 2021 at 16:28, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Sat, 17 Jul 2021 at 21:46, Richard Henderson
> <richard.henderson@linaro.org> wrote:
> >
> > On 7/13/21 6:37 AM, Peter Maydell wrote:
> > > +/* Max and min of absolute values */
> > > +static int64_t do_maxa(int64_t n, int64_t m)
> > > +{
> > > +    if (n < 0) {
> > > +        n = -n;
> > > +    }
> > > +    if (m < 0) {
> > > +        m = -m;
> > > +    }
> > > +    return MAX(n, m);
> > > +}
> >
> > This doesn't look quite right.  The n operand is extracted unsigned, and only the m
> > operand is subjected to ABS.
>
> Yes, you're right (this patch does always extract ra (here n)
> unsigned, so the only case where it makes a difference is
> VMINAV when the input ra is negative). I noticed this wrinkle
> when implementing the FP variant of this insn, but missed it here.

In fact it doesn't make a difference for this integer version:
because we always extract n as an unsigned value, 'n' is always
positive (either because it's the initial unsigned 'ra' or
because it's the result of a previous do_maxa/do_mina, which
must also always be positive) and so taking the absolute value
of 'n' never affects it. But we might as well delete the unused code.

(For float it *does* make a difference, because there's no
"extract as unsigned" for floats, and so the input 'ra' and
thus the first 'n' can be negative there.)

-- PMM
