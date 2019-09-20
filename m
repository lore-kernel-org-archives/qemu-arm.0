Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp2013353wrp;
        Thu, 19 Sep 2019 23:10:01 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx1N4jl6XnbSDWdvY20Y1KQycGodSWXqxZwypHSf77SW88XfrQ5bQQwnWyThta/UhejMqEU
X-Received: by 2002:ac8:2afb:: with SMTP id c56mr1532302qta.222.1568959801900;
        Thu, 19 Sep 2019 23:10:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568959801; cv=none;
        d=google.com; s=arc-20160816;
        b=TBWFx2Jp7BY5mpmX9flqbYhdmqmdJ/iZKjqN/QtrhL7n9ml1SWVTQJS50qdQg4WEnw
         yUuWIsMlbboWq0UKz+3Wj3NtQMzVZSAfZ1tt9LuD4X1VPIoCuWHKks7Ra/3k6ApevfL7
         9vJxuAo1ZDKOyEh0hUqHlP6l0O8PU+HJM2zLzDZykZF3hqnbdn9xe7SlBryIHo0zmRy4
         aLtzQHVQZ/7GW/A4c4AlfOqvP7F4imL/LubP6siiuzFU2Pw2wkS0rHsDQ6anzNvNjGPO
         GmABmZ7etL9ju5W+Nn4uHa4StpKYUXr+Y8+KEFuoTnADpRDeddSFVcBXPv3WHd6/vj8N
         Dqzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:from:date:references
         :in-reply-to:message-id:mime-version:user-agent:dkim-signature
         :dkim-signature;
        bh=4JulzxRjrCJADSN2RqTn4pcV4NnrlzTwZfpc+skoit8=;
        b=MGjnIE2cC/qws0i2TGYgIY1KhMpKZgCMToD+aPzuljC8fCIoIBdKyPAGalLJFacMAI
         2TC4/XdHtd6+vsMzQ7wsj+avHPfIxmeGaRazFEVX5KBSQYT1I3bqELhk4m7uaET7KPDw
         tSL1iAX/efIeTpCFB38rKfoxU+3vwjGFq1hEUVrxxGkWHR2Ytr3EmCcDAnZlKdDfy4HL
         h0chnZ6Q705lNIQGuemBMlTfl8RIpgN9tlhS82XP1RiRDVPFup4xgmNbD/SeclJnwp7t
         PC7iH+xLh77CudvghOu1qDah7H3xN5BkvB1XxSwwKXIsiz8pCStierZfqRdvPS2Hd8M+
         9OxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm3 header.b=D2aLkw1E;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=WOcGUeWw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a16si1517400qkn.148.2019.09.19.23.10.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Sep 2019 23:10:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm3 header.b=D2aLkw1E;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=WOcGUeWw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iBC7F-0008LY-6W
	for alex.bennee@linaro.org; Fri, 20 Sep 2019 02:10:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44139)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <andrew@aj.id.au>) id 1iBC74-0008Kq-El
 for qemu-arm@nongnu.org; Fri, 20 Sep 2019 02:09:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <andrew@aj.id.au>) id 1iBC73-0007Jv-Fi
 for qemu-arm@nongnu.org; Fri, 20 Sep 2019 02:09:50 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:34319)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <andrew@aj.id.au>)
 id 1iBC73-0007Ji-5Y; Fri, 20 Sep 2019 02:09:49 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id A6AD021E6A;
 Fri, 20 Sep 2019 02:09:48 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Fri, 20 Sep 2019 02:09:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=4JulzxRjrCJADSN2RqTn4pcV4NnrlzT
 wZfpc+skoit8=; b=D2aLkw1E8Y3ukKedAlYjBQJ1fntr2eTShj07rU3HJJu6ZPn
 2F5olAKZcLWVMY6idQB1v9TSBh94acgcl21/W+o4BhyZpF6hN7EL5/sk3hQoxTGI
 OqmyIL82SAKYnKsCDc3e/MirFttnDVrGVL+oCj4UEsWjWcoSgL2d3KSr9Su0mB+g
 3AIXus7HZc3bjCMtTpOa5guQQU9EnbKD/JxQpcud7j4vw7GRlf+VRY01bGPcxrRy
 377W6KL8syTLuzkkZBFUYe9x/NvjHUqV5uWEVJc2r79xMsQw5mZnsgymYersWYD/
 1su4HXqOlkCMC/9jDEUFiUrgIUP9+u5RXkALfaQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=4Julzx
 RjrCJADSN2RqTn4pcV4NnrlzTwZfpc+skoit8=; b=WOcGUeWwb5dvK1wYk3z3k1
 P2h/UQN6Fz6pUJKf2g1vuDxFPVTp44cVzJx77EwPsphC3/BcEqY+uKqzsFA2XPt0
 J6C4LAJkbpt1Vr5c6xmRzs5Ji1MTMbyGdcxLAaIdjP/AIBo6dtTaRNF162vA4+ME
 pPovKoGD8dwLYuDnfBOc6GWwuBo/KDC8YnvIHGaItbY2o/iO4kOS7/2j4W4mSUtT
 jPWKduy4ruQ+8fVHDVkPel/LUGPtUjRMZGt0aw0ie4tzwIUPiqollyha9ZZWTFyG
 gpZS897CH2DljYqO+PNEWr+BNEgSHxhVlQ/4GpYTSc42EGjJkfLTkxnBDfFmAO4Q
 ==
X-ME-Sender: <xms:K22EXXV2UCIfCJUL3HufMLdHr_1aofwaQ8-iHbvbvtQUMBox4EWmBA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvddugddutdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:K22EXZ-iwBdKsYPP8fjDG6UYYpKk5IEPjEstjfK21YLeMytPmTbm_A>
 <xmx:K22EXZi3eqjLWGy97OR333-EhxnBPYwknFtFiqNe3YGxJiO-crZthg>
 <xmx:K22EXdffuSg_DXOvL7ql7rYbn4yUAyRtgkf-XJErM4E06iN_VdV24g>
 <xmx:LG2EXVTuVVE6RK7PoSzAQgJFSONbeDx7qn3MKV5P__bs6INOzz7j8Q>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 81D46E00A9; Fri, 20 Sep 2019 02:09:47 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-238-g170a812-fmstable-20190913v1
Mime-Version: 1.0
Message-Id: <327db2f1-a146-472c-89f3-9187b2cb5f70@www.fastmail.com>
In-Reply-To: <CAFEAcA_h80VQVC0jE7v8kmsuXU=16+KXSKQ-qhuRNTct7X6X7g@mail.gmail.com>
References: <20190912065631.12473-1-andrew@aj.id.au>
 <CAFEAcA_h80VQVC0jE7v8kmsuXU=16+KXSKQ-qhuRNTct7X6X7g@mail.gmail.com>
Date: Fri, 20 Sep 2019 15:39:36 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Peter Maydell" <peter.maydell@linaro.org>
Subject: Re: [PATCH v5] target-arm: Make the counter tick relative to cntfrq
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.111.4.29
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
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VcdCs5ISFPh/



On Wed, 18 Sep 2019, at 01:44, Peter Maydell wrote:
> On Thu, 12 Sep 2019 at 07:56, Andrew Jeffery <andrew@aj.id.au> wrote:
> > diff --git a/target/arm/helper.c b/target/arm/helper.c
> > index 507026c9154b..09975704d47f 100644
> > --- a/target/arm/helper.c
> > +++ b/target/arm/helper.c
> > @@ -2409,7 +2409,21 @@ static CPAccessResult gt_stimer_access(CPUARMState *env,
> >
> >  static uint64_t gt_get_countervalue(CPUARMState *env)
> >  {
> > -    return qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) / GTIMER_SCALE;
> > +    uint64_t effective;
> > +
> > +    /*
> > +     * Deal with quantized clock scaling by calculating the effective frequency
> > +     * in terms of the timer scale.
> > +     */
> > +    if (env->cp15.c14_cntfrq <= NANOSECONDS_PER_SECOND) {
> > +        uint32_t scale = NANOSECONDS_PER_SECOND / env->cp15.c14_cntfrq;
> > +        effective = NANOSECONDS_PER_SECOND / scale;
> > +    } else {
> > +        effective = NANOSECONDS_PER_SECOND;
> > +    }
> 
> What is this doing, and why didn't we need to do it before?

I'll fix all of your other comments, but I think this question in particular is best
answered by turning the patch into a short series. It's a bit of a complex story.
I'll try to split what's going on into smaller steps so what I've done above is
better documented. The short story is there's asymmetry between converting
time to ticks and ticks to time that leads us to schedule timers in the past for
most CNTFRQ values if we don't do something like the above.

Andrew
