Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp6692234lff;
        Tue, 17 Dec 2019 14:55:54 -0800 (PST)
X-Google-Smtp-Source: APXvYqyBtVzdiWf04gkQ4lHkVBJJd3C4l8yBmb5f1u4N6963clq+ZYWaOJ9wh6d7G2jM1wfhAeIv
X-Received: by 2002:ae9:ec0a:: with SMTP id h10mr381614qkg.303.1576623354635;
        Tue, 17 Dec 2019 14:55:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576623354; cv=none;
        d=google.com; s=arc-20160816;
        b=v76psXd4F3JiUtHm31qkt6WVjMYJtr9NeNKvegx31khtTOgByan1Ookmu7XqWHR6MQ
         Qh4B0TKegU8kOvpcX5mAI5See1fzKGAe9V/EwJ5TS7xt/C5+20PhysSGOO1NT6PjTpTg
         FNs2cDl8jpzjlZg8KPs1GOqdH0vgqUOR0l2F7Xx2zilb+CRO8P7FR100pEO9uJkPy95l
         RLvcqLfIOiTh8SeHn+9a6piF6uDnvkikShPPWpeCwMR+DSdUgcVxagVJx3/8HM+BqMs4
         2d9iwfC+6mRgFLqC7g2nEz8/jVt+jPlsss3I90KoBdjm2ECd7dWxqMoyB9046vRAi/aK
         2Ahg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:from:date:references
         :in-reply-to:message-id:mime-version:user-agent:dkim-signature
         :dkim-signature;
        bh=KcoJQ6orCIk0G2Qck/G/g+pS1XQXN0tv4qqhSbQjCv0=;
        b=Rh1hzvtceds9Mvr9KeuT4VAMtlH6MkwLBukDhZuAqES96GzO1ZyfbLW077lK33y6fC
         EulSuy6E4HTnIzObOBaew5U31NWeVNVKd2xBqaB94MDeJSY46vm/dXkshNQCi6pkJ1kB
         +kgnd/W/G7LjEU4ojrKwJJVSfXkKihu1hG/RSYT2Bw09KnPHzBLUH5aayYJCyZcjSEGi
         QnVuHuzW2N3dr3eHH73n61RU/r6n1aiJqeQJlSQfANUEdnmAvfS2xEG/rtKfEuotgSMH
         gcJNlvLOJDc+QY71mugQUq8b0Mdmom1CqnY3cgOQw9kKqDiyS2rX3f9j6F5qfD8sU+tE
         axnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm1 header.b=gci2Rvxx;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b="kVMQ/VrK";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r26si49898qtn.7.2019.12.17.14.55.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Dec 2019 14:55:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm1 header.b=gci2Rvxx;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b="kVMQ/VrK";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ihLkv-0003YT-Qh
	for alex.bennee@linaro.org; Tue, 17 Dec 2019 17:55:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48032)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <andrew@aj.id.au>) id 1ihLkj-0003Xb-G0
 for qemu-arm@nongnu.org; Tue, 17 Dec 2019 17:55:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <andrew@aj.id.au>) id 1ihLke-0006JK-LO
 for qemu-arm@nongnu.org; Tue, 17 Dec 2019 17:55:41 -0500
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:38723)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <andrew@aj.id.au>)
 id 1ihLke-0006Cv-1W; Tue, 17 Dec 2019 17:55:36 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id CE2E842D;
 Tue, 17 Dec 2019 17:55:32 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Tue, 17 Dec 2019 17:55:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=KcoJQ6orCIk0G2Qck/G/g+pS1XQXN0t
 v4qqhSbQjCv0=; b=gci2Rvxx/RZjmGiyjFXURoSjFHmOIrXbz0bhVqo1t2qj4Fg
 M25NAfO1M8M+ibyL7Ckdv5dhRJHe+cHAsbOLMkxjfhDD1pyqXWc/Nqfp75YI/A+k
 E6naJZjJdUTsrnWj+W1Wkac9WqIV6fP1WW3/+Rs3V4wBDFnnOiwVm+brQB1/eQg0
 OXMod5lEjGJvVDELsyZuGHsceezHN6p9RvKkzsibzP3A/7fOB467dmzJX9RBWBUC
 cXPmkoecfZID1Pss+cyYgdQGJv6Z9poD3kzWhKgp8I3tAd9v/9XGk4ZduNlK6aXw
 poEByApbtM7kGZ0HunPWm/AopsyFdcoc9CF9Iag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=KcoJQ6
 orCIk0G2Qck/G/g+pS1XQXN0tv4qqhSbQjCv0=; b=kVMQ/VrKkhKtEf7DFxsMMR
 XoEnQRAt8hgLKvzw3Cx3HjjiTMU5FZDqQjwO5zw9YR76l9n46SPEh0NxhDrBkFXL
 4ALmtvUCTvFZPfri/IjBj9Idd5CNNlMU3OafMPZEVVLvGomcgtUV4LFUFUfRqtFe
 y5/Bc/+s2fuOX78dQ32VEArxqSwDsNkycUfiMlUrz30e/O47t0g/4STFF7sKqafa
 HCoehsYtx/3P/jos6/taABQxeWVvDXDTAcXrY4yOCAAc7iwgZPvuVBHlCy5D+peS
 CIvSh2UiScYWPen9ABS4wonk7Xje836haXgFIFh8i0CKnpFP4x+yZ93miCorAnzA
 ==
X-ME-Sender: <xms:41z5Xc7nij6_XFYfMuQq6cJWJun3W39I4KAOYb_qW7w3Z-DYRis1Ag>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvddtkedgtdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuffhomh
 grihhnpehoiihlrggsshdrohhrghenucfrrghrrghmpehmrghilhhfrhhomheprghnughr
 vgifsegrjhdrihgurdgruhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:41z5XREXLcECgW_m-eFYXqnCATHRSFh9AkD8tLUzvkapkU55sAYjcA>
 <xmx:41z5XXk08j8rhazqjjJiUqwlkWCIlkrfMuj-Wv0zloU9n3paDsxORw>
 <xmx:41z5XbkRmaXHPSGkhVVBTnXIdo_2Pa_Fll2dJYKWxHDmKFmAEVwScQ>
 <xmx:5Fz5XcibI17uxgWDDiqptZQiQ795FcBFpK0iVVDQ_LM55EWHERV02A>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id D91FBE00A2; Tue, 17 Dec 2019 17:55:31 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-689-g5a57b82-fmstable-20191216v1
Mime-Version: 1.0
Message-Id: <a947382d-e630-40b3-b94f-dadf4c76a2c7@www.fastmail.com>
In-Reply-To: <CAFEAcA8BquhddybX8X4gsoTs=r+cwGJ6_ebno1_xPJLVVHhm9g@mail.gmail.com>
References: <cover.ec85a2db47c3e10de70fba144e1bc75caf2f0a91.1576215453.git-series.andrew@aj.id.au>
 <CAFEAcA8BquhddybX8X4gsoTs=r+cwGJ6_ebno1_xPJLVVHhm9g@mail.gmail.com>
Date: Wed, 18 Dec 2019 09:27:14 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Peter Maydell" <peter.maydell@linaro.org>
Subject: =?UTF-8?Q?Re:_[PATCH_v3_0/4]_Expose_GT_CNTFRQ_as_a_CPU_property_to_suppo?=
 =?UTF-8?Q?rt_AST2600?=
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 64.147.123.20
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: D0A99F43gSwD



On Wed, 18 Dec 2019, at 01:55, Peter Maydell wrote:
> On Fri, 13 Dec 2019 at 05:48, Andrew Jeffery <andrew@aj.id.au> wrote:
> >
> > Hello,
> >
> > This is a v3 of the belated follow-up from a few of my earlier attempts to fix
> > up the ARM generic timer for correct behaviour on the ASPEED AST2600 SoC. The
> > AST2600 clocks the generic timer at the rate of HPLL, which is configured to
> > 1125MHz.  This is significantly quicker than the currently hard-coded generic
> > timer rate of 62.5MHz and so we see "sticky" behaviour in the guest.
> >
> > v2 can be found here:
> >
> > https://patchwork.ozlabs.org/cover/1203474/
> >
> > Changes since v2:
> >
> > * Address some minor review comments from Philippe and add tags
> >
> > Changes since v1:
> >
> > * Fix a user mode build failure from partial renaming of gt_cntfrq_period_ns()
> > * Add tags from Cedric and Richard
> >
> > Please review.
> >
> > Andrew
> >
> > Andrew Jeffery (4):
> >   target/arm: Remove redundant scaling of nexttick
> >   target/arm: Abstract the generic timer frequency
> >   target/arm: Prepare generic timer for per-platform CNTFRQ
> >   ast2600: Configure CNTFRQ at 1125MHz
> 
> 
> 
> 
> Applied to target-arm.next, thanks.

Thanks for your feedback throughout.

Andrew
