Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp6439956lff;
        Tue, 10 Dec 2019 14:18:05 -0800 (PST)
X-Google-Smtp-Source: APXvYqwM/GgRyKIPqtsBycGqKj+bLJB5k1k0prBoWROHn+RWg0U8zgNIspEAm8ujTvQYrOaTsBFr
X-Received: by 2002:a05:6830:1d4c:: with SMTP id p12mr70401oth.198.1576016285414;
        Tue, 10 Dec 2019 14:18:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576016285; cv=none;
        d=google.com; s=arc-20160816;
        b=pupa+u5QHromLCTv1ugtFGBnZItBoNRKmaWZdbEm/fwwCp1odSgMEeJXYpmdBDQLm5
         ztc+0L4ihkJBdin4FbVbaruxPJy138CKngPhKHMwbmU/9BvvRo6zfgqgDcNUn4BedKcN
         hlWaB7lbj2c5GGkqNs8lYrURl75N6fX8/pIUPZM2TkLnLtAsfxB9QMG8/KKQA+Qcn5qA
         r8bv9Z/QS1TOCHrXOuvBsQP6boq31I/lbhauBJm/OEsDBIlbgUK/AhWkns+sXVKhGjGB
         i9omD2pidhKBvsvVXgQBxXN/mMHDsR1Tmh0UP46nvwtOzNS9sDNFJVCLFPBcECSFArPU
         GN+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :subject:to:from:date:references:in-reply-to:message-id:mime-version
         :user-agent:dkim-signature:dkim-signature;
        bh=3kGtzjp6D7Ka8D3pEkJj4zEeNC+L5CcFXQR/+ho4LW8=;
        b=Xw+jK5dFwaiadQel+u4nwBoZ4ibaRvXxeKKGoCULB/cchX0awNQn5zwfjh9L6UYyeM
         EkKrFACCSj8OPTWu3ukPC77d4A3wAIGv2sCUyufHWtMBfevouT12haQ9MyYzYHkM8t73
         n3d3ZxBv4M5jOraZuPYeSV+c4G7vmSOaWdYbLwSspCPqi4xwwyRXTl+ulB/rN0vexIw/
         wkUOdfRa6amD7HINAb9SDX4kk7uEgNJ8ZgWBD5FqM72Wlxj3/K2DkcUpNM6ZkPfkTM77
         29bBetuHJ5H7itd/eGlJMGbPGbRQWxN16TQFfCFz03n1sAYkAYBIq3jsQqBuoytmr9Km
         YWMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm1 header.b=gn61h7Xj;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=GBKwuY7n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x126si2688192oix.53.2019.12.10.14.18.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2019 14:18:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm1 header.b=gn61h7Xj;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=GBKwuY7n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ienpU-0000BW-5v
	for alex.bennee@linaro.org; Tue, 10 Dec 2019 17:18:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34091)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <andrew@aj.id.au>) id 1ienp7-00009T-CV
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 17:17:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <andrew@aj.id.au>) id 1ienp6-00064a-G8
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 17:17:41 -0500
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:46001)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <andrew@aj.id.au>)
 id 1ienp6-00063i-Ap; Tue, 10 Dec 2019 17:17:40 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 07B15ED3;
 Tue, 10 Dec 2019 17:17:38 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Tue, 10 Dec 2019 17:17:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm1; bh=3kGtz
 jp6D7Ka8D3pEkJj4zEeNC+L5CcFXQR/+ho4LW8=; b=gn61h7XjJ+L+CZjx1+Wtf
 khaU/OmeECCNZaZuWkHfmuhuW6SeZMF8CluM1xwV+29ttGJMEjXyn+yIS6U9NN0g
 m2rarxcxDZwx6P/aRq25+ieTGKrk4VsvaMwOMDq7C3bW2XYnH0J9okWMuL5oC3IV
 KHVlCoRIU+/KLwvJS0D1zQJMDlraP3q7rMGgfELjQuk6lb4vBUZLmPq049s0SOck
 OKYGYGMUvOJlmfJkkmerORjGWvGIwGAfF1hilcutXAtsZT8C0u5DhcX7j+bJlpyv
 YhbyjovObBd4l354iDu+0jom552crXsqVqpENBSo+b9DwuSUVWyLCKpL1lB+n0kX
 A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=3kGtzjp6D7Ka8D3pEkJj4zEeNC+L5CcFXQR/+ho4L
 W8=; b=GBKwuY7ncsqFIc0lMp09ceJUEAC9nNLQl9QV4ic2xD3ADI/mu8P0jS+Cs
 A9rS8ByOdKKFTvT3FbcIfiIQ74NaQcSa6vuAPEM2/vlvJC7Kc8RL54WidcXsC+SH
 cyuhbriRAMTjAEMBpdJBX5PUJ/nflUzUUTy9a4A4E8fr9l/yTA0TR/nw1Nkm7f/4
 JLkx+2STDwE3hPuZwvSg7rDI+Mfnrqg7ZNOap06mdu0Zeel4VStY+vezl5uyArRF
 x+4EA2/0Lkle6RdMeMXKbazPKWN174vrRTc+7kUZrUB+VgqsVI7IEWUoojnrWQ6g
 Qg1/8RfA4Az5tr0LsS6GkgdTKNSLg==
X-ME-Sender: <xms:ghnwXV39J3kQfVAeH3xRdkJqy_gzIdIC4EFQgoKF6r42Nn8HvajoBQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudelfedgudehlecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdet
 nhgurhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurf
 grrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhs
 thgvrhfuihiivgeptd
X-ME-Proxy: <xmx:ghnwXWi9pO5FSTUZdq0kLU_RbJwnX2zfsN0WVobiivr8aCOyBcYGIQ>
 <xmx:ghnwXWVDWYtjiRZmr8tr2qXckh6y1Kq-C11JR7c3AXKlcH9jM46OCg>
 <xmx:ghnwXVAq83K8ssw-y_N0dYNwt-vH1FHTdo76kGPAFLAMGfQ9NmNrSg>
 <xmx:ghnwXcAFMzV2YRIKL9fk3mcx4lrLaCaidGJ232BWPR-71jTEdTvOcw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 2E52EE00A5; Tue, 10 Dec 2019 17:17:38 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-679-g1f7ccac-fmstable-20191210v1
Mime-Version: 1.0
Message-Id: <94dbdf58-399b-49ca-b644-87f54795a7a1@www.fastmail.com>
In-Reply-To: <378a875a-17c8-3b35-9753-2158e86c5412@kaod.org>
References: <cover.da2612e7c1835c563b20851f0ac26c7b175428fc.1575938234.git-series.andrew@aj.id.au>
 <378a875a-17c8-3b35-9753-2158e86c5412@kaod.org>
Date: Wed, 11 Dec 2019 08:49:16 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org
Subject: Re: [PATCH 0/2] hw/arm: ast2600: Wire up eMMC controller
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 64.147.123.24
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 18gPY3yIL7XD



On Tue, 10 Dec 2019, at 19:23, C=C3=A9dric Le Goater wrote:
> On 10/12/2019 01:52, Andrew Jeffery wrote:
> > Hello,
> >=20
> > The AST2600 has an additional SDHCI intended for use as an eMMC boot=
 source.
>=20
> Have you also considered booting the QEMU Aspeed AST2600 machine=20
> from the eMMC device ?
>=20

I hadn't got that far. I was surprised we hadn't yet wired up the eMMC c=
ontroller at
all, so I solved that problem first :)

Andrew
