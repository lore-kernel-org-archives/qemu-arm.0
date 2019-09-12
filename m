Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1758733wrp;
        Wed, 11 Sep 2019 23:26:19 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx95fm2tE7BZ9EX2JHZh1jhkh3u2yrfXVTgcJu9UNmZ2Vejo/RF5RpKTCUDDuiGlJEGfez0
X-Received: by 2002:a50:fa99:: with SMTP id w25mr40161647edr.259.1568269579784;
        Wed, 11 Sep 2019 23:26:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568269579; cv=none;
        d=google.com; s=arc-20160816;
        b=cc4e6hMPsVdqq5mh/3euu6B91ElvzWl2TgLaSzY1A26G9qL3cwsbBTo7OQi6qjeScZ
         nRc7MHFVLL0BTBpTxEhiQL1q5bZ278hf+mcXK6gC+/s8O4wgekn7fgdCWYRNch/zx9Wr
         NIPQDu/pZn0vdhbTjzjTH3KKIiJx+uU9pmntKw7Da7ARtYU1PWz/mXOZUliQ0DHYvmE1
         E2fXnIQVlt+PgnQS/EMzqqnho5Exc4hi7by7vDLFVUKuUAoCYn63N587KZtFojXDqCpM
         k0GqqF5WQRwMGO/BamdDOQXzUiDr38RWodSBy/7H6TpmQH4Xv9we44CERFm+gxrjWTkk
         MmGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:from:date:references:in-reply-to
         :message-id:mime-version:user-agent:dkim-signature:dkim-signature;
        bh=Ph1EMADjDASZh3KN9TBm15v9QudwLsxsqj8JH8vxcFQ=;
        b=XzG4sXHX+4NtPYMImvpLlB9BSDivkY+z3kgqcLxNOXKRUcckP17tuXyFtFLH2Mo3XO
         kAb6rOfcdO85ayEKRCgpUE2kObbWwEDUrgHfxcgF998W2uxVZmakf3faUwEurekaS4PB
         L4uynWiJcx8aGcVdT/VLc1BEesuCpExUDC2lzZlsRH2VaQ0yuh5MUH7s4DkzgJaG7tMH
         mO7J9P62GHBixHm/rHsonNqlw5aaos3f8I5vnC59NW7QQQ3zxo2CuHXYiOyFVQr+QO+K
         nZ50op6+JRxLDoOQ9vQfrf6HFHqds/9doR+wBDT+OYJk8bjZS4PDmsIhPvWVfFA42ylc
         KhzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm3 header.b=FldCLZAE;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=opUmCwul;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id qh7si4102039ejb.280.2019.09.11.23.26.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Sep 2019 23:26:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm3 header.b=FldCLZAE;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=opUmCwul;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i8IYc-0004w4-GR
	for alex.bennee@linaro.org; Thu, 12 Sep 2019 02:26:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40971)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <andrew@aj.id.au>) id 1i8IXK-0004sM-PW
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 02:25:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <andrew@aj.id.au>) id 1i8IXI-0006Is-8N
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 02:24:58 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:47683)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <andrew@aj.id.au>)
 id 1i8IXA-0006Hl-SS; Thu, 12 Sep 2019 02:24:49 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 39C31224EC;
 Thu, 12 Sep 2019 02:24:47 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 12 Sep 2019 02:24:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm3; bh=Ph1EM
 ADjDASZh3KN9TBm15v9QudwLsxsqj8JH8vxcFQ=; b=FldCLZAEu7Bu+SbbAtymy
 xjVCaHWMDdJldL3J59cH6bStDNnRxX83XHD98EpjNs/LMLTsFb7SpOr+n4xY8rdu
 QVvMeJEB0ywswhcoISlJQNu4zTiDOB6nILTWP9aBXfrwLLc3tNAhqtl2e9VfA9hH
 7NnU2Q1WlRnkq0LpnvvJKNt69emlLA7mAK9KdiNR4e3CnNuxH2RHb9Qt322ZWLKC
 oUvtXw0G61GQP4ymeOembvOS2xN1cf1RYyTM6SN1Wvx9CYZ8qqduJ8pDOlchzTnS
 s7xN7qJNb/MphMakOGvIuECfLLBhQKU/2RIixgU9fTfC21VnSnxf7GTtl65aOD8+
 A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=Ph1EMADjDASZh3KN9TBm15v9QudwLsxsqj8JH8vxc
 FQ=; b=opUmCwulSMYT3f3NyXj0SYLvKxnYBJu3Ge19sq8Li8JDkvylDHqCop3JW
 02Q/hRRro3pnizFl4XC89MmDN7ALwDMXYt49mU070CbRy2hiWtVxE1K1aCUZr80b
 JhmlizGtQCBvFAoOYXwpbVSNa4gf2VtKEGuBK1bKQcr1OqF65YFyvwQZ+XrCz5KR
 Sl8u7dzkZ+575offH5TIcIhKan3G51r4rLMPfXeEw3A9E3pNGOnCqMP8h5Ul4PAV
 u3RBnPZMx+1XoEuLf34KsTSj9QJ9mfm+dG+ViAFeO+VNqY4pTAkJu9XldqMMhT/F
 ttgeWKewPyA6o1xkdnra0PUXbzyEQ==
X-ME-Sender: <xms:ruR5XWuVgipF3vjNDSGRKhiYQ_kL-xsKQs7DFCDEXGQsEocCeQOfMg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrtdeggddutdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedftehn
 ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucffoh
 hmrghinhepohiilhgrsghsrdhorhhgnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgu
 rhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:ruR5XRJPlKkOhBjIoMlehlH9j_4uWDOlrj-UqI2p7HUM3yf3SrPPwg>
 <xmx:ruR5XS_pIDl2yeEOGtwMYSG6R7EetzRdVwzZmybE5TXyUOg3ailYRQ>
 <xmx:ruR5XfC8V-Vku5KOSqnaEj9yx5X7jIRA5CGOz62KE-sCgln6SBBuhA>
 <xmx:r-R5XUm1S5B9Qkz9tVAPqLw5SrPlSkxfF2F1QffQDoV6wzthhVx8tg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 900EDE00A9; Thu, 12 Sep 2019 02:24:46 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-237-gf35468d-fmstable-20190912v1
Mime-Version: 1.0
Message-Id: <d0d2531e-7ee7-4e99-bab8-1fa6c6baf6c5@www.fastmail.com>
In-Reply-To: <a9fdcc8b-3a92-587f-28e8-5a997991532e@kaod.org>
References: <20190912032531.32546-1-andrew@aj.id.au>
 <a9fdcc8b-3a92-587f-28e8-5a997991532e@kaod.org>
Date: Thu, 12 Sep 2019 15:55:19 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.111.4.26
Subject: Re: [Qemu-devel] [PATCH v4] target-arm: Make the counter tick
 relative to cntfrq
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LTDBccseXNX6



On Thu, 12 Sep 2019, at 15:52, C=C3=A9dric Le Goater wrote:
> On 12/09/2019 05:25, Andrew Jeffery wrote:
> > Allow machines to configure CNTFRQ via a property if the ARM core
> > supports the generic timer. This is necessary on e.g. the ASPEED AST=
2600
> > SoC where the generic timer clock is run at 800MHz or above. The def=
ault
> > value for CNTFRQ remains at 62.50MHz (based on GTIMER_SCALE).
> >=20
> > CNTFRQ is a read-as-written co-processor register; the property sets=
 the
> > register's initial value which is used during realize() to configure=
 the
> > QEMUTimers that back the generic timers. Beyond that the firmware ca=
n to
> > do whatever it sees fit with the CNTFRQ register though changes to t=
he
> > value will not be reflected in the timers' rate.
> >=20
> > I've tested this using an out-of-tree AST2600 SoC model (Cortex-A7) =
with
> > the SDK u-boot that sets CNTFRQ as appropriate, and by starting/runn=
ing
> > machines with assorted ARM CPUs (palmetto-bmc with the ARM926EJ-S,
> > romulus-bmc with the ARM1176 and raspi2 with the Cortex-A53).
> >=20
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > ---
> > v4: Fix configuration for cores without a generic timer
> >=20
> > v3: https://patchwork.ozlabs.org/patch/1160634/
> > Peter - I think this addresses most of your feedback. I still reach =
into
> > the QEMUTimer to fetch out scale when adjusting the nexttick
> > calculation, but we no longer need to update the scale member and fo=
rce
> > a recalculation of the period.
> >=20
> > v2: https://patchwork.ozlabs.org/patch/1144389/
> > ---
> >  roms/SLOF           |  2 +-
> >  roms/skiboot        |  2 +-
> >  target/arm/cpu.c    | 43 +++++++++++++++++++++++++++++++++++-------=
-
> >  target/arm/cpu.h    |  3 +++
> >  target/arm/helper.c | 30 ++++++++++++++++++++++++++----
> >  5 files changed, 66 insertions(+), 14 deletions(-)
> >=20
> > diff --git a/roms/SLOF b/roms/SLOF
> > index 7bfe584e3219..ea221600a116 160000
> > --- a/roms/SLOF
> > +++ b/roms/SLOF
> > @@ -1 +1 @@
> > -Subproject commit 7bfe584e321946771692711ff83ad2b5850daca7
> > +Subproject commit ea221600a116883137ef90b2b7ab7d2472bc4f10
> > diff --git a/roms/skiboot b/roms/skiboot
> > index 261ca8e779e5..3a6fdede6ce1 160000
> > --- a/roms/skiboot
> > +++ b/roms/skiboot
> > @@ -1 +1 @@
> > -Subproject commit 261ca8e779e5138869a45f174caa49be6a274501
> > +Subproject commit 3a6fdede6ce117facec0108afe716cf5d0472c3f
>=20
>=20
> The changes above seem not related.

How did they get in there? :eyeroll:

Thanks. v5 I guess.

Andrew
