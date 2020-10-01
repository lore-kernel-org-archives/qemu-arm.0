Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp60926lfq;
        Wed, 30 Sep 2020 17:38:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyr+Rogu7vVzUVplyMhKVk7aox3q8v+Z43xY2j8jLa3S+2+yjN1K5ftWGyxXzy4uZVhanRp
X-Received: by 2002:a25:1e42:: with SMTP id e63mr7139175ybe.78.1601512692878;
        Wed, 30 Sep 2020 17:38:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601512692; cv=none;
        d=google.com; s=arc-20160816;
        b=qxMA6vveZvKAM5D4Cvc6UKDR+fbJ6CpXRmVDiUw/N8BhRQFsOPI06bVpaJaaZcKfop
         HpMwW8VrKIxGZlqpMgGUNsGoFyWulnz+ERGXN/DVgky0yyITkAmsL+y4vNw8p48XWRx8
         ls/Vd5xc6igY1eDw17IPQyEhR6s5eq61G4XQ5lEqykkTSLlwyNZRcg6DKBaNNt1dMiSr
         gbO/C7tJp+dXIFk71mpG4k7FGi3s0t/q5frAi9KZ4e/7RNVpnwiFr/sNJX9CRTcQu8TW
         x9amPUak1Ksn5QmeUgr/GNhrn6UheNKMqvYOLD+bXtZTsrjyQQyRTWjf7Wz64hIy+6f7
         E5cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :subject:to:from:date:references:in-reply-to:message-id:mime-version
         :user-agent:dkim-signature:dkim-signature;
        bh=ad9oTYf42CSXnIkb9wrddznbrkkOlVdD1dWDk0wFhpE=;
        b=YWYj9JbUkdxXFnl7SyIbNwYcslbu2aMi3MdqJtQXQomMd5jY6n50EiW06AVvAGUBiV
         5J0rTzYo2naz5UZ/wE4OeYs0+w/SOK9P7g8XMYbR/YjvDtVvGLowRElTHLY709+e7t9m
         XdqRQo5/aNUcAh3Z94B3UobVIr9wJbXsx5YE3WL+MR3gRl6nZfi/KZjip6mB/7DbraLK
         Pnt9WKMZpH88OXhQTUHMums/EnqouGOrGYY0f5H6wEqX49As6oAx1hO+t0DNpZ/pVQmU
         IrICT8CTwniouCoQNUV4LetA75iZYIDF/dNZ/BwpHnQhgSOGh11q+2iB1BI6kM8yUwum
         9v5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm3 header.b=J62Ju40Y;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=a9z1A2GZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j145si3038688ybj.324.2020.09.30.17.38.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Sep 2020 17:38:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm3 header.b=J62Ju40Y;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=a9z1A2GZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kNmbs-0004nx-9T
	for alex.bennee@linaro.org; Wed, 30 Sep 2020 20:38:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1kNmbb-0004nZ-0t; Wed, 30 Sep 2020 20:37:55 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:47679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1kNmbX-00029t-RY; Wed, 30 Sep 2020 20:37:54 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id CA67E5C029D;
 Wed, 30 Sep 2020 20:37:50 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 30 Sep 2020 20:37:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm3; bh=ad9oT
 Yf42CSXnIkb9wrddznbrkkOlVdD1dWDk0wFhpE=; b=J62Ju40YhQo2Q7W2lWuDG
 9qkO43DEV7XyLxX0NpREMsvzgeBAWI62DZAUtRLFOQ5GJimCCTpK9GEWYs12wFuy
 Fk9gc8I1h3Qyo7jAibV0BKXdgZoxUIe/SVb8MXClSRnmyQ8k3gvPc0SblKCnKAMH
 WRXDckcxAha70qqwOXwzME2MpVXA5tv90z3Ujp07DKcxCJF/b5t2Q9f6i5VYNdeG
 E4U1AWH11Nkmj6as7NgrD1Wqn6roDvvRpId7ZGVgCQH9fHOoDH2M1hR6sSZBm6tq
 A+9U9E4ZJeEl10fd3iuyI5uULBWw080UXG5bxwR6vWos80H6TWjtUIj9NqAq8ln9
 A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=ad9oTYf42CSXnIkb9wrddznbrkkOlVdD1dWDk0wFh
 pE=; b=a9z1A2GZ+YREHnZv3x5IBoGMOWGNvl7dnGnXTYpLNCjMbOVnwho6Y5n08
 rqMBb0QeRlx6YoCckZXAisaZvkUlgh59NWe85GQ01uuDZVldFaEOqL44g8raPM63
 l3/9mEeREX8JinScB4EV8Ha4EhhQimebP5j37DXgHgfAD3ZtjK41ZKbU8VkT7htf
 ss8YrsrhXQXz2tSB3B0Vpt5WJYrVW1+0yvudlR0ZSxmrxDeAghdVVW4YVL7zkqwF
 mw/6T2xUCgObil+ZJ62Iip+8VQvHBtHd5JyHlKq7PWM9vD/ThBredq1gq6CtG7fI
 N8RfbISir447FUSrje/lNk3zY2uZQ==
X-ME-Sender: <xms:3SR1XylP6r_khHCZtsgDx0Fx9SxstFVqGATGjUFt4P9k3I3oBSPmrQ>
 <xme:3SR1X52mpAnMc3B77w-SiJSzYi5ob_h36uThFYeLvIm0GgURxZB32ZBLr-QXK4SdS
 89igLCeSxppkIgBvw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrfeefgdefkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepieffteejteeitddtheehheetfeeggfehheeljedvueefhffhjeeufedu
 hfeijeefnecuffhomhgrihhnpehoiihlrggsshdrohhrghenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:3SR1XwpX6L4ufYt_HQBztH2XJtyBiVEENNL-AKaZ7Oy8UJ5EgtLpWQ>
 <xmx:3SR1X2l3OzUxT2v4QWl9zjIUw3YMc5o00aY1AHLfS5NQENln4tC_ow>
 <xmx:3SR1Xw3yqXbfBoN7vYqMaiQN9PiTW3OGVPdEVQPQ0uuIS7lRQZr7MQ>
 <xmx:3iR1X9z_n2BftiBlNJnrUJ6v15T8TNlU5e5xAOoqTCFv91KSroEo0Q>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id B2045E0181; Wed, 30 Sep 2020 20:37:48 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-382-ge235179-fm-20200928.002-ge2351794
Mime-Version: 1.0
Message-Id: <9a77a08e-e931-4ffc-abc8-498e7cfaf802@www.fastmail.com>
In-Reply-To: <c18df4e1-99ad-8f73-378f-db00a8afa262@kaod.org>
References: <20200905212415.760452-1-f4bug@amsat.org>
 <e640309b-b694-e815-d64d-40dd453e52ef@amsat.org>
 <5e27c1f9-6d11-fa62-ba71-0020ce9d595b@kaod.org>
 <07b21d1d-fb5b-efb0-50f2-54a4b86df444@amsat.org>
 <4648c188-cacc-c532-857c-f0206f60e109@kaod.org>
 <fd68ae45-da39-44fe-b07f-2510481dbf7f@www.fastmail.com>
 <c18df4e1-99ad-8f73-378f-db00a8afa262@kaod.org>
Date: Thu, 01 Oct 2020 10:07:29 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Cameron Esfahani via" <qemu-devel@nongnu.org>
Subject: Re: [PATCH] hw/arm/aspeed: Map the UART5 device unconditionally
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=66.111.4.27; envelope-from=andrew@aj.id.au;
 helo=out3-smtp.messagingengine.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/30 20:37:50
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iViVFshSCFnt



On Wed, 30 Sep 2020, at 19:37, C=C3=A9dric Le Goater wrote:
> On 9/30/20 7:29 AM, Andrew Jeffery wrote:
> >=20
> >=20
> > On Fri, 18 Sep 2020, at 02:33, C=C3=A9dric Le Goater wrote:
> >> On 9/17/20 6:57 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> >>> On 9/16/20 7:51 AM, C=C3=A9dric Le Goater wrote:
> >>>> On 9/15/20 7:23 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> >>>>> ping?
> >>>>
> >>>> It's reviewed :=20
> >>>>
> >>>>   http://patchwork.ozlabs.org/project/qemu-devel/patch/2020090521=
2415.760452-1-f4bug@amsat.org/
> >>>>
> >>>
> >>> Yes I know :) This is part of my routine to check if a
> >>> patch hasn't been confirmed to be queued 1 week after the
> >>> last review, to ping the maintainer (because some
> >>> automatically flush patches older than 1month in their
> >>> mailbox).
> >>
> >> ooh. That's brutal.
> >>
> >>>> I will send a PR when I have more patches.
> >>>
> >>> Ah OK. I didn't know you would keep merging the Aspeed
> >>> patches. Since this was a single patch, I thought it would
> >>> go via the usual qemu-arm queue from Peter.
> >>
> >> sure. It could also. Fine with me. I have only three for the
> >> moment.=20
> >>
> >>> No rush, I just wanted to be sure the patch was not lost.
> >>> Also, once a patch is queued, I understand it is the
> >>> maintainer responsibility to keep rebasing the patch
> >>> queued.
> >>
> >> yes. I know. I have been taking care of Andrew's ADC patches=20
> >> since 2017 ... cough cough :)
> >=20
> > Agh!
>=20
> Does that mean "I will work on it !" ? :)

I'll see what I can do, I've recently started to rearrange my task queue=
.

Andrew
