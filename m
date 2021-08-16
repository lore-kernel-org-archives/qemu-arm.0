Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp1173487lfg;
        Mon, 16 Aug 2021 02:06:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz5ILWW2A3ZmT2S1upjRh0LwSP2w99wFgJ4v7vmmtQ2cN2OkOM4lyR/jIgJnirs2D3O7Ngj
X-Received: by 2002:a92:b308:: with SMTP id p8mr11060397ilh.296.1629104786204;
        Mon, 16 Aug 2021 02:06:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629104786; cv=none;
        d=google.com; s=arc-20160816;
        b=glUOz/h9dkg/T/cUiPb8epJQbYn1gN3FFn470OSVpVmNwtfvulOdetuEemUY7J6L7m
         2f3DsF3DjtqG5qOK2g3SsGQvAxrMQxuda+UveLzmkbbBBYC5qXDK1y0z0+0yqdisrzrI
         HlgxzHo0H3gIWVLsSEBptX8CUWI48b2voZbEVjbjmr+w8akzmcJIP2QQj528dBlUeyKW
         avlj7kAqzVl6cB6VfGmCLLSuxFwn/ikI+i8AFsAY/DJAHEfJQNrXpFBScMIpAx4rL9Fd
         3w5h68zn7LxXTy0yi8R6Oc22i/o2qeOIfnXRm4w4XYkgSOxVexCtRbVFdexxwHzQSpZD
         poQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=570zq5057BNW8LKnNeZBJKDm3+vx4OzvmFtgbEfvMsY=;
        b=RKmqFygO78pVJ1IKZXjpbx1bNZhyyELhyMu79+G5zmMmk8REb5B1+vI48lGLb6HKCY
         ga8vWJZXtGuuyXSb7OTSYzUb09wbu0X0JybNYCR61I7WBuY74YTft+jCOEFftfqmugO7
         1IxK6GRTXXYWwc1I9HkPP9R/6pHtDXVCCksCWYT5fJTDh6OfYqKJKwvQFB0wJnNEbAgT
         Vrl2vHW7ucVeXn30/iTh59cXsBKa7Wp4ZUdMHIXPr7B75/DOgRRh1qMmnuzVpJ4fWBdy
         cFHxq05794kIH3DRB5BmnLTHD9VOkxhxqEPqLOrDdEjqP+5LpMUbU6lZepAAx11Er10j
         kAWg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NKwNNNhC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g7si14038284iov.41.2021.08.16.02.06.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Aug 2021 02:06:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NKwNNNhC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mFYZd-0003FP-HM
	for alex.bennee@linaro.org; Mon, 16 Aug 2021 05:06:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mFYZT-0003F1-Ec
 for qemu-arm@nongnu.org; Mon, 16 Aug 2021 05:06:15 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:39495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mFYZS-0002QY-3i
 for qemu-arm@nongnu.org; Mon, 16 Aug 2021 05:06:15 -0400
Received: by mail-ej1-x62e.google.com with SMTP id gr13so1334254ejb.6
 for <qemu-arm@nongnu.org>; Mon, 16 Aug 2021 02:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=570zq5057BNW8LKnNeZBJKDm3+vx4OzvmFtgbEfvMsY=;
 b=NKwNNNhChDmg8xmqcGNmXNsFlOaXhAQDO4mJUpN75t7I2T140WtjrqyFwjO3HNregi
 edNlBsOoNzns3gNjkXM4yyfIFGFsqtaf14QWKYTBRSgFum8bD7n+pddDIr5+N7UGRdKw
 c1putTYFii8r64d/C/xCprNqYHrMMXtQxlPAlbhPsi8OLEz2LZMR+DRyYZ3vMilEycK4
 yZ9pwA+Q5/PsdZEE/RmYKn0r5JpOx8EQZbgq3PBM/JWIP4dW+dcfRPfrh12DyHINcZWu
 DRxqHU/NXFXQZ7qrTMYKw4eTsXi8j0szy1LNlIeVPyP8olHKVEJUe/qhhkw3joKeebNx
 Ntcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=570zq5057BNW8LKnNeZBJKDm3+vx4OzvmFtgbEfvMsY=;
 b=ocMURZZnWEJ5UdBo1AmW0AgiWa5cnOWc4uI6sTWHzpDb8Lus+Fi9WaCVHAcm6R8Qd0
 l6LG0HwesOsFbA1EZeFh2Lq9C6O+Ro0khCSR5DFQYIhh72ItjVNR6eVvtnohNS7L3pei
 HSQWMp4EFPWQtzc2GY1VojsPerCmYo+33mVXP49Tsig1c94a5mvSIuHNo5zmNLcrkPdz
 WE7FQFFMtFZ+kSJxcNUlT0MHj6Vj84QwpwqWZl7fR0HW7S2Yu7LLt3e2GZV4RJ8Tnk6z
 wBLcBgnvd6tB8sNQ+TAG5NqzrZ4p11IcsK7xNa1FhocgNgGhqfm/ze73AooL7e6t1W2Q
 tQqA==
X-Gm-Message-State: AOAM532oRaBVn2Nw/Mul0rbV6cJbRmf92ooSjOWULz5aMwu9QfWlMUur
 V7XMbl9VLi+yK/TLs3ALRlVYQRreJd0ocDfwwkOG2Q==
X-Received: by 2002:a17:906:aac7:: with SMTP id
 kt7mr15135542ejb.4.1629104772802; 
 Mon, 16 Aug 2021 02:06:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210812093356.1946-1-peter.maydell@linaro.org>
 <20210812093356.1946-10-peter.maydell@linaro.org>
 <86d7a767-f53e-dfa2-3641-9e39512c0512@amsat.org>
In-Reply-To: <86d7a767-f53e-dfa2-3641-9e39512c0512@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Aug 2021 10:05:27 +0100
Message-ID: <CAFEAcA8DNSS-0oXCDWeFNkin=mbNePS3CamnCgvvC+89KOWXTw@mail.gmail.com>
Subject: Re: [PATCH for-6.2 09/25] clock: Provide builtin multiplier/divider
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
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
 Joel Stanley <joel@jms.id.au>, Alexandre Iooss <erdnaxe@crans.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: X8qnZPTjb2Rt

On Sun, 15 Aug 2021 at 17:32, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
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
>
> This is super nice!
>
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >  docs/devel/clocks.rst   | 23 +++++++++++++++++++++++
> >  include/hw/clock.h      | 29 +++++++++++++++++++++++++++++
> >  hw/core/clock-vmstate.c | 24 +++++++++++++++++++++++-
> >  hw/core/clock.c         | 29 +++++++++++++++++++++++++----
> >  4 files changed, 100 insertions(+), 5 deletions(-)
>
> > +void clock_set_mul_div(Clock *clk, uint32_t multiplier, uint32_t divid=
er)
> > +{
> > +    assert(divider !=3D 0);
>
> I only wonder if we shouldn't check clock_is_enabled() here.
> Maybe not assert, but at least report a GUEST_ERROR?

Setting the multiplier on a disabled clock doesn't seem like
an error to me. I would expect a common way for the guest to
program a clock-controller would be "first set the divider
and any other parameters; finally, enable the clock".

-- PMM
