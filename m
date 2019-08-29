Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp1508814wrs;
        Wed, 28 Aug 2019 18:38:43 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyjl/XXjqLg6hODlHI+KsSurkJgjL+kqochVl8nRIK++fUyGo4f/zYUmeF/+cIFQmC3vHlB
X-Received: by 2002:ac8:376c:: with SMTP id p41mr7717528qtb.306.1567042723833;
        Wed, 28 Aug 2019 18:38:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567042723; cv=none;
        d=google.com; s=arc-20160816;
        b=i5DxqdZ8svqOlEgqKpx9AKCMEtXltfL2jAmkCGCeLfqSKB8rjGcnSYnKDdbZNF552Y
         NmGuAVW8cEjqJu6chv+dime5DPn5L7BR1FpWgVdX4qA3zyXg1+ITsG70KXlCSJXp3KMS
         mhi4IlEDYMEj0baF9dv+YtM9HKZe95pY9HEV8tv5kdTvfg2xFLhH2dPjvs3p5fWRnwYQ
         B1R/UUtIaTRoqwTG2sWS/0mDdghYQHkdP4uKdrx9ScZx/XPgbwCJAswXVaG2zQL1INXW
         99335RDjKwPNgNN086eSqLjeNCB/Lc0WzotKGpZWRl/VEmF4ebHmDF4fcnZ4FlJnwHq/
         E1LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:from:date:references
         :in-reply-to:message-id:mime-version:user-agent:dkim-signature
         :dkim-signature;
        bh=LVPie1C5fos3rwKR0Fk/z2o0YAIqln0QtTZkZZi43mM=;
        b=ZDRSgH2mVPqizJdXg59myttRGllzjYxlpu7HvghoUr7qXBqps41dTdlnZEfunbHNKG
         sl3Dg0Ik05TbPBKfLhPWMLx7jsDjGlQ8IHGc0WNqjnxZdrITRdeKUvCHyczOOQ6LxiYM
         j9wUDmoJyVJGiVCEZOWe58k/W2x1UqB32foVXL36gdxU09HHM2wS2jhm1QMDpd1oaCID
         gFGrRwLBu5WDDJNx5e5ThcO2+LxWANMFs7cC7AJfdgKwVmbBXSYasUOQW+uvJlYZxgjO
         CB5x/lY6QBentisYlf8C7mx5oVC6xYYRXiuz7LRG+WIrSymlbiwegca1upzCa7D0PzXu
         tSNw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm3 header.b=LmnOFb52;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=awK6v7D7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m12si748901qtf.221.2019.08.28.18.38.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Aug 2019 18:38:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm3 header.b=LmnOFb52;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=awK6v7D7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i39Od-0000Zu-8s
	for alex.bennee@linaro.org; Wed, 28 Aug 2019 21:38:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49505)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <andrew@aj.id.au>) id 1i39OU-0000Zm-2s
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 21:38:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <andrew@aj.id.au>) id 1i39OS-00007r-Sj
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 21:38:33 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:54253)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <andrew@aj.id.au>)
 id 1i39OS-00006q-Gp; Wed, 28 Aug 2019 21:38:32 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 0127C692;
 Wed, 28 Aug 2019 21:38:29 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 28 Aug 2019 21:38:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=LVPie1C5fos3rwKR0Fk/z2o0YAIqln0
 QtTZkZZi43mM=; b=LmnOFb52ycz31AUcCCdYrE/TIf4SkA4jhlDec3vfLOPGfm0
 mhfe0TeKUJHC57bITfFiffuYofz5oaeVr98o4ZAyA8ZfBLPN8JkcxLNaw2n9aJtI
 nG7S5/ZLle8xWYO0/lFU/vV660vKIq/dJxuNOhNbIw77511lrd0AjHFoci5jCWfG
 3af7/Fl7wyT2tovUmHxrfYJVIh8Z/ZB7FnGUOKvjXL/UcVEnsFhdELUalmmZheon
 BXLdG+JK1SVYOFETgZnpz2rgV79OvoG5cTtguyjifz+aEY0IOCCqPDRBE1c9i9oT
 AXs+EMrqT9Ain5rT22X7J9Tj3remDCgpO/YTyIg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=LVPie1
 C5fos3rwKR0Fk/z2o0YAIqln0QtTZkZZi43mM=; b=awK6v7D79UUM8kn1R+N8ul
 KofYZtYTIes7cAOxk2sg7IEQqOpXer1SCCsUPcxFQFi1nGqkQ3AMMoOFTlnI5ZSS
 xRQRv8l7JrANIhW4PPg4aC71C2eiH/Er+aPwO1EnNQF3TJTcNAWjq+Qlm3kFl5xr
 X3J5LlqzH6xFZVVgwHnnyGDPdIENELKkLmAhftZDlMGUjJ0oqnFarzJXjpOKbqwZ
 n5xXy0oUygmUbRJTu8Kt5OPP0HpWUdk0nLERAmZLB5iCsbg/TnV4UKdSHksQ1v/0
 AVFOj+l0UbB9hgOK3/hgCs00WXRTVxf9NM0BW3mudkPWr4U09Rzq/qB/CW57/3KQ
 ==
X-ME-Sender: <xms:lCxnXfUqYjMwP2lDhDScrPwwNN1c4UKi-tdrQ29Wy-p1t-ZRijp_XQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudeiuddggeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:lCxnXaYTAa-hpb0rbOqmktPiI4xtVeeLEzlyAvlbj02I7a9AQsG82g>
 <xmx:lCxnXeKKl83VlEvbmLpn4OGx0gkQOZ3ANc2hId-nsAry3IhsiBQ7bQ>
 <xmx:lCxnXd1dauJK2wa-7gjtoD-DOsIac59YSPnkbmOxcqhlwMAf1W2xiQ>
 <xmx:lSxnXcxmb4Z9A_PGFdlC8yoJn6YDy00U5ahx35egyoPxop82cUBfRQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 549DAE00A3; Wed, 28 Aug 2019 21:38:28 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-139-g73fcb67-fmstable-20190826v1
Mime-Version: 1.0
Message-Id: <4fd7e761-65e1-47f7-b7b4-ed90eafaae41@www.fastmail.com>
In-Reply-To: <CAFEAcA9dEKLneH5GJJsX84LTW_p9qBrGmr6yMxAYcNo-2EzHZg@mail.gmail.com>
References: <20190809054341.24728-1-andrew@aj.id.au>
 <CAFEAcA9dEKLneH5GJJsX84LTW_p9qBrGmr6yMxAYcNo-2EzHZg@mail.gmail.com>
Date: Thu, 29 Aug 2019 11:08:49 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Peter Maydell" <peter.maydell@linaro.org>
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 64.147.123.24
Subject: Re: [Qemu-arm] [PATCH v2] target-arm: Make the counter tick
 relative to cntfrq
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
X-TUID: nbf7n4YMUnMm



On Wed, 28 Aug 2019, at 01:39, Peter Maydell wrote:
> On Fri, 9 Aug 2019 at 06:43, Andrew Jeffery <andrew@aj.id.au> wrote:
> >
> > The use of GTIMER_SCALE assumes the clock feeding the generic timer is
> > 62.5MHz for all platforms. This is untrue in general, for example the
> > ASPEED AST2600 feeds the counter with either an 800 or 1200MHz clock,
> > and CNTFRQ is configured appropriately by u-boot.
> >
> > To cope with these values we need to take care of the quantization
> > caused by the clock scaling in terms of nanoseconds per clock by
> > calculating an effective frequency such that NANOSECONDS_PER_SECOND is
> > an integer multiple of the effective frequency. Failing to account for
> > the quantisation leads to sticky behaviour in the VM as the guest timer
> > subsystems account for the difference between delay time and the counter
> > value.
> >
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > ---
> > v2:
> > 1. Removed the user-mode change that broke v1
> > 2. Rearranged the implementation as a consequence of 1.
> >
> >  target/arm/helper.c | 51 ++++++++++++++++++++++++++++++++++++++++++---
> >  1 file changed, 48 insertions(+), 3 deletions(-)
> >
> > diff --git a/target/arm/helper.c b/target/arm/helper.c
> > index b74c23a9bc08..166a54daf278 100644
> > --- a/target/arm/helper.c
> > +++ b/target/arm/helper.c
> > @@ -2277,6 +2277,34 @@ static const ARMCPRegInfo v6k_cp_reginfo[] = {
> >
> >  #ifndef CONFIG_USER_ONLY
> >
> > +static void gt_recalc_timer(ARMCPU *cpu, int timeridx);
> > +static void gt_cntfrq_write(CPUARMState *env, const ARMCPRegInfo *ri,
> > +                            uint64_t value)
> > +{
> > +    uint64_t scale;
> > +    ARMCPU *cpu;
> > +    int i;
> > +
> > +    raw_write(env, ri, value);
> > +
> > +    /* Fix up the timer scaling */
> > +    cpu = env_archcpu(env);
> > +    scale = MAX(1, NANOSECONDS_PER_SECOND / value);
> > +    for (i = 0; i < NUM_GTIMERS; i++) {
> > +        if (!cpu->gt_timer[i]) {
> > +            continue;
> > +        }
> > +
> > +        cpu->gt_timer[i]->scale = scale;
> 
> Reaching into the internals of a QEMUTimer and changing
> the 'scale' value seems like a bad idea. If QEMUTimer doesn't
> have a facility for changing the frequency and we need one
> then we should add one at that API layer.

Yeah, fair point. It is an RFC patch for these kinds of reasons -
I solved the problem but wasn't at all convinced about the
shape of the solution.

> 
> Also, this isn't how the hardware works, I'm pretty sure.
> In hardware the timers tick at whatever frequency they're
> set up to tick, and CNTFRQ is just a reads-as-written register
> that firmware can fill in with an appropriate value that it's
> determined from somewhere for the benefit of other software.

Yes, I think you're right. Again, as above this got rid of the
problem, but needed some massaging. The write just was a
handy hook point to inject the change of frequency.

> 
> If on ASPEED SoCs the timer frequency is different, then we
> should model that by having CPU properties for timer frequency
> and having the SoC set those properties, I think.

Sounds good, I'll work on that approach.

Thanks for the feedback.

Andrew
