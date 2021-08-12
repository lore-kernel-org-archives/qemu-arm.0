Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp311667lff;
        Thu, 12 Aug 2021 05:23:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwFAiiYpCU1s8k40gpiaIuWiGAy2b3DoGBsc0+dx4UF14KSsQ32cNmhtXwGfAHkHlIXtf2u
X-Received: by 2002:a67:4382:: with SMTP id q124mr1613835vsa.6.1628771032252;
        Thu, 12 Aug 2021 05:23:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628771032; cv=none;
        d=google.com; s=arc-20160816;
        b=a9WA/y7vuydQAq/wVshQiRWVGBsXSulSNamMe3/uknwd7CgIjJl3IFMbg1ua7fyCDL
         CphhtkjHTMi2SnZe5RT5jngZAkgfdj5IynTMZeLo5FLUKzGtAo9UUx7j6PKC2cdxZ30R
         IAyRuyso6hvh3eZQPvir2tp18HwX1iEu5j6PVlMl0J9PFWsIcaOlDtgUspb2F9yrXeKr
         spv/VAJFY+KCMnxu+h32KFSF0feoiLDBmNwAbWkZ2zCIuvw4/6Ccl+XYopTm8rpdA8v8
         aK4blSHPmltpl/WehrQl5r1uyUazJuJNzevAAnEbUU1PNNUk9iUoB7y/3sZK/jjU5jOi
         yLLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FB1Nqq2kM3Ah3RRR9gw4IQx5hqcTQ+AmfQ9BChqvCLk=;
        b=PGDGqsGUzvopdhhsPIcv/KK7leP55zL0C2YVwnCpsP3QtK1AY+/wYBUP0eI8a3HVBE
         4vvKwg2Dvvlykj7vvfK/p2RVmIbQgt7nrKYshgbvwAyze5WufSeLmUbAP4kPoc3DeNYT
         nsrJiAFVPxLxS45efMZvRoX/qOE2+kZa6VrrAw1CKezBTtakVB+Q5ydtLtJSsIf71p+x
         gtmmJcwNv3UZ/5aTF4CFcpbJygjohAEiepWL1wGYC58OAyf0aX5QGxXgUtfqFw6elxae
         eNVdoGggI0OZwOnrrW1DXUAO8IF0up2wlA2jQx2JtT3WeIqVX0UYNnKeAN8i8Ul4U8Gg
         xj7g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vLOvQOzX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w75si861594vsw.319.2021.08.12.05.23.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Aug 2021 05:23:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vLOvQOzX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mE9kV-0007Nc-Jv
	for alex.bennee@linaro.org; Thu, 12 Aug 2021 08:23:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mE9kM-0007N5-OG
 for qemu-arm@nongnu.org; Thu, 12 Aug 2021 08:23:42 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:36852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mE9kL-0006un-3T
 for qemu-arm@nongnu.org; Thu, 12 Aug 2021 08:23:42 -0400
Received: by mail-ed1-x52e.google.com with SMTP id b7so9432214edu.3
 for <qemu-arm@nongnu.org>; Thu, 12 Aug 2021 05:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FB1Nqq2kM3Ah3RRR9gw4IQx5hqcTQ+AmfQ9BChqvCLk=;
 b=vLOvQOzXoAbNIb+fE1NWVy2WRB/Wh2E65jIRaxEw9BUdl+U4iGPFX/InomcpsfEw9+
 GS+FyVaJdV7/PCFvoBTSP2Hpz1E2X5VkqjuwVXsTU46AouGVL9+aogoomO+rEmo35QQX
 6XnATIFb2L7utiH64jKevz930LCThMUu60pQ5FIvPfXnF2E+hCaMFkWLgjOl6atH+2G2
 puS3erNzkTOB5AytROIILyY3+9ZMNJIx7eAgusOtu/INwFHY38SXQHU5x/RUDD7g9mIf
 n+RwcVwK+zRP7y+9iTXLND1sKw3bsJOVGUUfrLcjkdiFJasfO2EPyBruV8zt8jOBbqgL
 SpOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FB1Nqq2kM3Ah3RRR9gw4IQx5hqcTQ+AmfQ9BChqvCLk=;
 b=Oq8jZwZQxFhWmMxWhevnWoBKCdd/XJQBFsoTw4K5E/dSfBKEp9heE6QlAUJb1Dsxu+
 wPgYDBmUOuLByUJ6H9Ph5XpSEaOe+VT1zN3Bd41uzyPxJ9O/wB4MT5s51IbUevA6m74W
 cdAnM/ir8ygp/uNDqLpjfSdSF2ZUE2fc49CvjHyCVcKKArxP6QuxtFxO19ZHwO2Eo5am
 LNUS6Cbli6iNx1pVrc96lCidRt7QgnOXK+HPu5QbRnEga1nzIOjuv1DyferG6Q/n7eD2
 jphPRxRx8RnvqzdAlz91RrwHbFyRdz9pJdElQJ7w4AfHmmVUuqg+bFPao2pVqK3dKBRH
 EUAA==
X-Gm-Message-State: AOAM532ut1UAFAIU38mQwyLSqSf7vU79XWmTwzSN0hb+jymEUK4ljZ3P
 sKs1z/lAeKynowfZnCMBOcV5UhEU7zFZ7de0v8uX0A==
X-Received: by 2002:a50:f615:: with SMTP id c21mr5293629edn.146.1628771019034; 
 Thu, 12 Aug 2021 05:23:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210812093356.1946-1-peter.maydell@linaro.org>
 <20210812093356.1946-10-peter.maydell@linaro.org>
 <6a0f3bcc-cb85-2f02-32f3-3ea85b0b9c43@crans.org>
In-Reply-To: <6a0f3bcc-cb85-2f02-32f3-3ea85b0b9c43@crans.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Aug 2021 13:22:54 +0100
Message-ID: <CAFEAcA-byMR2cEj6FCcGRFztNLsW3_-LR3v5B5+VVy69xfAU8g@mail.gmail.com>
Subject: Re: [PATCH for-6.2 09/25] clock: Provide builtin multiplier/divider
To: Alexandre IOOSS <erdnaxe@crans.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>,
 Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vX5tTUrpyh0F

On Thu, 12 Aug 2021 at 13:08, Alexandre IOOSS <erdnaxe@crans.org> wrote:
>
>
> On 8/12/21 11:33 AM, Peter Maydell wrote:
> > It is quite common for a clock tree to involve possibly programmable
> > clock multipliers or dividers, where the frequency of a clock is for
> > instance divided by 8 to produce a slower clock to feed to a
> > particular device.
> >
> > Currently we provide no convenient mechanism for modelling this.  You
> > can implement it by having an input Clock and an output Clock, and
> > manually setting the period of the output clock in the period-changed
> > callback of the input clock, but that's quite clunky.
> >
> > This patch adds support in the Clock objects themselves for setting a
> > multiplier or divider.  The effect of setting this on a clock is that
> > when the clock's period is changed, all the children of the clock are
> > set to period * multiplier / divider, rather than being set to the
> > same period as the parent clock.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >   docs/devel/clocks.rst   | 23 +++++++++++++++++++++++
> >   include/hw/clock.h      | 29 +++++++++++++++++++++++++++++
> >   hw/core/clock-vmstate.c | 24 +++++++++++++++++++++++-
> >   hw/core/clock.c         | 29 +++++++++++++++++++++++++----
> >   4 files changed, 100 insertions(+), 5 deletions(-)
> >
> > diff --git a/docs/devel/clocks.rst b/docs/devel/clocks.rst
> > index 956bd147ea0..430fbd842e5 100644
> > --- a/docs/devel/clocks.rst
> > +++ b/docs/devel/clocks.rst
> > @@ -260,6 +260,29 @@ clocks get the new clock period value: *Clock 2*, *Clock 3* and *Clock 4*.
> >   It is not possible to disconnect a clock or to change the clock connection
> >   after it is connected.
> >
> > +Clock multiplier and divider settings
> > +-------------------------------------
> > +
> > +By default, when clocks are connected together, the child
> > +clocks run with the same period as their source (parent) clock.
> > +The Clock API supports a built-in period multiplier/divider
> > +mechanism so you can configure a clock to make its children
> > +run at a different period from its own. If you call the
> > +``clock_set_mul_div()`` function you can specify the clock's
> > +multiplier and divider values. The children of that clock
> > +will all run with a period of ``parent_period * multiplier / divider``.
> > +For instance, if the clock has a frequency of 8MHz and you set its
> > +multiplier to 2 and its divider to 3, the child clocks will run
> > +at 12MHz.
> > +
> > +You can change the multiplier and divider of a clock at runtime,
> > +so you can use this to model clock controller devices which
> > +have guest-programmable frequency multipliers or dividers.
>
> This looks nice!
> Does this imply that if I am going to implement the STM32 RCC (Reset and
> Clock Controller) device, then I should use this new feature?

I haven't looked at the RCC spec in detail, but yeah, I'd expect
that you'd have a device with one (or perhaps more) input clocks
and a lot of output clocks, and as the guest writes to registers
that set divider/multiplier settings you'd use clock_set_mul_div()
to configure the appropriate output clocks.

-- PMM
