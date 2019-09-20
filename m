Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp2016884wrp;
        Thu, 19 Sep 2019 23:14:04 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxMRJDZsJxNQRnQAmvaFOCnKYEtuOUjNbmyezui9V2CmqvAKiUIL9HVaeDfVtEa3wWNMjwm
X-Received: by 2002:aa7:c6c6:: with SMTP id b6mr12020014eds.19.1568960044323;
        Thu, 19 Sep 2019 23:14:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568960044; cv=none;
        d=google.com; s=arc-20160816;
        b=FBG1oe9Ie6cgVd3937gg/kHQuf6jwDQKZ1leldbUR7CwjCdvuApHGJ2abPvq2yCx6H
         iLNqawl1LJOtCJWrAsM46XkmbSImpHmXme3/4V9dir35IrDoPymoYQC5iJ/Llvzs36Bo
         gkhSjNqBTKJqcdUtCGSObbrpRVuTvRJblqz2k1jdQerVV5kxGTO+9kqAAiDAQQo8Y/Kn
         hhhF4LBcX0xhduOuxMWuQAQ2NXUUFGps9HSTyJB/nmY30qpB20C4MJF1UWyqQcpw7CNm
         qCbKK2VoaqVHj1iPT7T5Xo0yDtdbe1zCwNnxvRFxxC3xqrPJ+ygqX2wBdkClYv9lf5Av
         wEWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:from:date:references
         :in-reply-to:message-id:mime-version:user-agent:dkim-signature
         :dkim-signature;
        bh=LZSTyP8hhFA33zJ3/GxY0fvVBoarZilW6nvwlyPXnoc=;
        b=Q8x8dgLZfKBN/Bh/3q4qS9LZrlHo5ao4dFrIk+GmJkzBfdXXxWMXDcJcEBZzmC+iCO
         fOY/BHDOFB1hIHzXnJhY5JSio8k5pdgGDF1nYK25sw5pThDJV15oG1HOxy+ONBmqh2hA
         oziMeg1mAYofA0okVJILg6sv7DLRBAKn1rarMlrlnZfZ+OJSZyRJ4FNEzXvrL/cnt2Ec
         /EThiFkExL9gqAdNr/gm2Fqpl0PEP5hQitQt3ludxk5ICHgEVQHEq7b/n11cvzDrZLX7
         ZPs47Yqk1e5U6UoNr+aSLe60wD4aurJLh2k/ppXrSQbau6JUBmxCJAnzK7vjQO9c3sJD
         frTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm3 header.b=foMwp06P;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=kGW8zzqj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y1si535165ejr.272.2019.09.19.23.14.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Sep 2019 23:14:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm3 header.b=foMwp06P;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=kGW8zzqj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iBCB9-0002Iv-7Q
	for alex.bennee@linaro.org; Fri, 20 Sep 2019 02:14:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46754)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <andrew@aj.id.au>) id 1iBCAy-0002Ij-UR
 for qemu-arm@nongnu.org; Fri, 20 Sep 2019 02:13:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <andrew@aj.id.au>) id 1iBCAx-0001FA-WF
 for qemu-arm@nongnu.org; Fri, 20 Sep 2019 02:13:52 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:49749)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <andrew@aj.id.au>)
 id 1iBCAx-0001Ew-TE; Fri, 20 Sep 2019 02:13:51 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id DFE4F21FAE;
 Fri, 20 Sep 2019 02:13:50 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Fri, 20 Sep 2019 02:13:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=LZSTyP8hhFA33zJ3/GxY0fvVBoarZil
 W6nvwlyPXnoc=; b=foMwp06PjykJm6EluTBp+8KTBSgd26jcUt6qgmyuEYGWFmH
 2MowGygMfvvW/duWRFN1XdwZ5FwXZxLkB83G92lA8HgyVK+hLim1hSnGg3dKQKgo
 YtNiLqGhDQ7tqgSJmI0r8pPd+w5P0hrimvCCerd4mLGttD6TynsdCZDN6k+oo99v
 NAA4WLXlprsV2XUFBRxBl6Z8EE7I5F8SfYidN5isDV2ks6HNnSO/JyNu8IM4cCDI
 sRcm3tYBccFF02aiAjW43vQ9aJAkac63TfXaym2h16iZ8M0BAWU07zLqdfMKoKXj
 0EIGP8LltOaq+Rc3Rh+IsbA8nBw4XX5se+VP7nA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=LZSTyP
 8hhFA33zJ3/GxY0fvVBoarZilW6nvwlyPXnoc=; b=kGW8zzqjp/57kzW+Z7nRCC
 /1CjxEEn+TV8TCZDC7IL6mRSdp6Qt2hjml280AmLLGDt6FHvPLxx7TLKqRccEeIG
 OUp9uRe17GK5c9TQbOltD7o6LBewbmB+CAoTQ3D/LES3pijQ5hwNmxTNyvaWKouJ
 8TKmAz9lXKvFlN67b9xW+yZ6BKATq5N8XemhxZUPR+q3wIpd/DIRmVmjd+LDqpfD
 9bLYhpwwOCPCOX4DjzJ1/jzJNOcROlNs54mHBAPIAwObH+clqMDEoeyBD3nWaQFz
 XquXj+i9M4ZeTiIA//u7FsRKTP0wDYWnJvjsEOzUopz9RLZ5zzjXmx1aI5T7B3PA
 ==
X-ME-Sender: <xms:HW6EXVMXX_87ZIinGME7KdvXT_rbxWSZ3xqQauJj64KOseMKG5Ud4A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvddugddutdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:HW6EXaXshK7eaKNIyqpkaWCWtDaaEzQgeULzOaGLmT4AhfP9LoZCAw>
 <xmx:HW6EXVs73MHPpv2WvtsefuTP2qunpa4fSE6oHQyDxU3PGKmgEnPt2A>
 <xmx:HW6EXTYaewSyHkSHAVjKZDj_fimfOZEy8KtVumD_h2mvxXSGXzoJ5A>
 <xmx:Hm6EXWvFrC-LkhSHZxIjulJFC5IcLiXCSCyzChdvmiGIOm8mPEFVfQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id C4071E00A9; Fri, 20 Sep 2019 02:13:49 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-238-g170a812-fmstable-20190913v1
Mime-Version: 1.0
Message-Id: <6113c3cd-acd8-4f0a-915f-e189d6ebef84@www.fastmail.com>
In-Reply-To: <c9f58ca3-36ee-e8bb-a350-29729f4f24df@linaro.org>
References: <20190912065631.12473-1-andrew@aj.id.au>
 <CAFEAcA_h80VQVC0jE7v8kmsuXU=16+KXSKQ-qhuRNTct7X6X7g@mail.gmail.com>
 <c9f58ca3-36ee-e8bb-a350-29729f4f24df@linaro.org>
Date: Fri, 20 Sep 2019 15:44:26 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Richard Henderson" <richard.henderson@linaro.org>,
 "Peter Maydell" <peter.maydell@linaro.org>
Subject: =?UTF-8?Q?Re:_[Qemu-devel]_[PATCH_v5]_target-arm:_Make_the_counter_tick_?=
 =?UTF-8?Q?relative_to_cntfrq?=
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
Cc: qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Z/F3U7aBaGn7



On Wed, 18 Sep 2019, at 04:55, Richard Henderson wrote:
> On 9/17/19 12:14 PM, Peter Maydell wrote:
> >> +static Property arm_cpu_gt_cntfrq_property =
> >> +            DEFINE_PROP_UINT64("cntfrq", ARMCPU, gt_cntfrq,
> >> +                               (1000 * 1000 * 1000) / GTIMER_SCALE);
> > I think it would be helpful to have a comment saynig what units
> > this property is in.
> > 
> 
> Should this be NANOSECONDS_PER_SECOND?
> It's certainly a suspicious use of 1e9 otherwise.

You're right that it should be NANOSECONDS_PER_SECOND but
this was just code motion of the definition of the reset value for
CNTFRQ_EL0 in target/arm/helper.c.

Andrew
