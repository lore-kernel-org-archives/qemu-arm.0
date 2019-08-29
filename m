Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp1510663wrs;
        Wed, 28 Aug 2019 18:41:05 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzU4R3MFe3UFBto/iiiMaZLB4SI8Cwh8DDsM/dlZ0B2Me2k7v00KyEFJ2v9dneziYf+L+ax
X-Received: by 2002:a50:fb82:: with SMTP id e2mr7033647edq.15.1567042865094;
        Wed, 28 Aug 2019 18:41:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567042865; cv=none;
        d=google.com; s=arc-20160816;
        b=BsMRtszUmv7HIYz36X1spSzVtHQiXBl6n6KP5A+btugjEd1DuuWlMYUZDTtOBuKIVt
         gwbi3vY3y6feXyY5iXQE7A0CwqzSoGcmk4yVHWkp8BjBM7l7AYFZbLMrEmxc/vP71gmb
         a5NKf5riqRB3ZoDjG8z31JoHxVnXMO94MXkokozzCFqTnfQrVyqFpz9PBs6p9tCfAvzi
         fby2l29+nvJDOBgSzszJB0+HgzmA9yKUQ8H4gRKVsKazRuIu9PiQlS9x7P77jsvuzQAc
         Owk+ILBuOdbnL7lKnzhs8Avqpb7uu6bymRtcuXYo3TIkzx7nqdZ+T/Izv75isEC01DOL
         vLPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:from:date:references
         :in-reply-to:message-id:mime-version:user-agent:dkim-signature
         :dkim-signature;
        bh=ShfIbLfI8AI5s/PHeWY2YywrjtllFmT6P69tTyvhcwc=;
        b=RWgrlA75Vr0ayiSjZY8eHwaZLU3rViaLQtQymJhCRU43EFQMrKntko4899/GL4AFXT
         Cg0tyyoOHBkK2tQ+QGGCvnKiMuT4ZAanys98neU+m6Tasnog7lvfCb0udoBFzu8gq8oM
         QOkSMqEGA4XbYCLoTWUfhsfu44gpdHCEkoI9AkLaC9y3iOXV6RxHuz9Oo6MrmcJ6Egi0
         oTs2g3fz9H32ODQhCI3+CKeb8GYy4Y6ksUrNmC8OHK5T3FEOrYGBGHYrAL9hcISHae3D
         4h5W0adGa9wrhH3YNgpz1itkkBR2LtylNKVnw4galybeXKAcI8GatQFDebSLfI7lZgUO
         3Gcw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm3 header.b=iUZQ7Y+S;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=XZ+weQuU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x38si381490eda.45.2019.08.28.18.41.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Aug 2019 18:41:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm3 header.b=iUZQ7Y+S;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=XZ+weQuU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i39Qu-00027u-3X
	for alex.bennee@linaro.org; Wed, 28 Aug 2019 21:41:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49801)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <andrew@aj.id.au>) id 1i39Qm-00027X-Ii
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 21:40:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <andrew@aj.id.au>) id 1i39Ql-0000j5-Il
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 21:40:56 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:58261)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <andrew@aj.id.au>)
 id 1i39Ql-0000ix-BG; Wed, 28 Aug 2019 21:40:55 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 1B9966A3;
 Wed, 28 Aug 2019 21:40:54 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 28 Aug 2019 21:40:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=ShfIbLfI8AI5s/PHeWY2YywrjtllFmT
 6P69tTyvhcwc=; b=iUZQ7Y+S29XOkpKCHSKFlyXpNbdJJUWSznlkhpGZFIUoJsp
 dDlVhbl1YN/WXu0oIyKcLfSqd5gIwDhSnV/1BFp6kAuSkMW+B2FzvQQ8Im6CSExm
 uYNPcBIpoqwze0RwqCauaP8Wg4/liht27Nu+Fukr2qcWy6ExDicQJb+9GKlR+sdI
 u1JU2U9zLVJkKowaQK9BHy7aWqBkwpEqJpcWCImAfC407vqeblIheWESj+5yPVz5
 fDc827LhcAIWuxFUPg8YBlc6QyluOkQ8xxY6MaFKZjVLoiD8InLQWpoolwteOE0f
 ul7+1i9Gz0jwLWOb9VZA0lpTlCy2XxtVdKiDSwQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=ShfIbL
 fI8AI5s/PHeWY2YywrjtllFmT6P69tTyvhcwc=; b=XZ+weQuUC1EUiRIOcOabfB
 Wm8WG4JH/pmiFW8N9uekc7yo6e+YZ/StJ4MApCRHSOZxJNzOrv5qE0aNRJE+Z3/o
 RPY68uleTzMnSIX4gJY5rUd6kmVn+niAcgrXMumovNCpcgEsafZeyjr9WmSmAqYO
 ewfaCxJ7MlTzL5pw0Pn93yQNwLbX7llENmiaEZ3PpOxRsaF4pkxNURY+c3Z8rCPu
 Ih90loOPGW1LkcsBc8XOOVITp99pYPnj125EBtSY9r3v0XQxoItKOb2VH4EvsPGa
 snN2lmf1/Ej07SK0w9YmBetfuA4sfsJW0zih2isl8DdCm/jtOhP1zn8wvfEh75Ww
 ==
X-ME-Sender: <xms:JC1nXc9ZizH9tu6Y-B2GjDm7hFL78X2VWQ-3L1fR63VZoMokOyw1cg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudeiuddghedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:JC1nXdU1qzpzfM5ofYwBrou97DfVlZi-eTunuhf_PRbdlClY__SAdg>
 <xmx:JC1nXWcf4T1xfzo17Ype2pI-NecELLXzSIF1lCWcSFVu032qAgs3Zg>
 <xmx:JC1nXf8T1HS-W19igIP50y5RtL3oikcrseZlpO0v5OFLEIAPqgERdQ>
 <xmx:JS1nXdorRIIP8NE4JXeZ2zYh_QaNdsF3qg6CnrolOVC63EGBZlTpXQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 9286CE00A3; Wed, 28 Aug 2019 21:40:52 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-139-g73fcb67-fmstable-20190826v1
Mime-Version: 1.0
Message-Id: <453779dd-e66a-41e5-95e2-5268d799903e@www.fastmail.com>
In-Reply-To: <4fd7e761-65e1-47f7-b7b4-ed90eafaae41@www.fastmail.com>
References: <20190809054341.24728-1-andrew@aj.id.au>
 <CAFEAcA9dEKLneH5GJJsX84LTW_p9qBrGmr6yMxAYcNo-2EzHZg@mail.gmail.com>
 <4fd7e761-65e1-47f7-b7b4-ed90eafaae41@www.fastmail.com>
Date: Thu, 29 Aug 2019 11:11:14 +0930
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
X-TUID: 9x1OXmqUkqIN



On Thu, 29 Aug 2019, at 11:08, Andrew Jeffery wrote:
> 
> 
> On Wed, 28 Aug 2019, at 01:39, Peter Maydell wrote:
> > On Fri, 9 Aug 2019 at 06:43, Andrew Jeffery <andrew@aj.id.au> wrote:
> > >
> > > The use of GTIMER_SCALE assumes the clock feeding the generic timer is
> > > 62.5MHz for all platforms. This is untrue in general, for example the
> > > ASPEED AST2600 feeds the counter with either an 800 or 1200MHz clock,
> > > and CNTFRQ is configured appropriately by u-boot.
> > >
> > > To cope with these values we need to take care of the quantization
> > > caused by the clock scaling in terms of nanoseconds per clock by
> > > calculating an effective frequency such that NANOSECONDS_PER_SECOND is
> > > an integer multiple of the effective frequency. Failing to account for
> > > the quantisation leads to sticky behaviour in the VM as the guest timer
> > > subsystems account for the difference between delay time and the counter
> > > value.
> > >
> > > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > > ---
> > > v2:
> > > 1. Removed the user-mode change that broke v1
> > > 2. Rearranged the implementation as a consequence of 1.
> > >
> > >  target/arm/helper.c | 51 ++++++++++++++++++++++++++++++++++++++++++---
> > >  1 file changed, 48 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/target/arm/helper.c b/target/arm/helper.c
> > > index b74c23a9bc08..166a54daf278 100644
> > > --- a/target/arm/helper.c
> > > +++ b/target/arm/helper.c
> > > @@ -2277,6 +2277,34 @@ static const ARMCPRegInfo v6k_cp_reginfo[] = {
> > >
> > >  #ifndef CONFIG_USER_ONLY
> > >
> > > +static void gt_recalc_timer(ARMCPU *cpu, int timeridx);
> > > +static void gt_cntfrq_write(CPUARMState *env, const ARMCPRegInfo *ri,
> > > +                            uint64_t value)
> > > +{
> > > +    uint64_t scale;
> > > +    ARMCPU *cpu;
> > > +    int i;
> > > +
> > > +    raw_write(env, ri, value);
> > > +
> > > +    /* Fix up the timer scaling */
> > > +    cpu = env_archcpu(env);
> > > +    scale = MAX(1, NANOSECONDS_PER_SECOND / value);
> > > +    for (i = 0; i < NUM_GTIMERS; i++) {
> > > +        if (!cpu->gt_timer[i]) {
> > > +            continue;
> > > +        }
> > > +
> > > +        cpu->gt_timer[i]->scale = scale;
> > 
> > Reaching into the internals of a QEMUTimer and changing
> > the 'scale' value seems like a bad idea. If QEMUTimer doesn't
> > have a facility for changing the frequency and we need one
> > then we should add one at that API layer.
> 
> Yeah, fair point. It is an RFC patch

Ugh, I just looked at the subject and realised I hadn't added "RFC".

Too many things going on :/

Andrew
