Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp459895lff;
        Thu, 12 Dec 2019 23:37:45 -0800 (PST)
X-Google-Smtp-Source: APXvYqwafPX5GKH2EdQhWDb30yKi9W09S692maQD4ti8LftfnT2e6ycH/jhnq+vqdVxGpruDDc/Q
X-Received: by 2002:a05:620a:4db:: with SMTP id 27mr12592989qks.146.1576222665082;
        Thu, 12 Dec 2019 23:37:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576222665; cv=none;
        d=google.com; s=arc-20160816;
        b=jPiTfe6S3/cJPQDJpq2yvPzndoHyvKlKmZM5MM38mpkNsDE43gFkqoDYwrJuJwAAMg
         HM+olTArIA6273zxQJPEF22XWAo/+xeewYIRKvbTszTz95ctJRWLWiSyW5dwLzTY7e6v
         OFDZiSAwkDic8Epa+b4UyZWm3O5+PaQ4uFlCOirEC/F8B06a6kaZuNC4UWEoMiwk59HR
         In+gza/72FmMKyT0TqkXAF4tjFmBRIHSiqZI62E2qowUXi9yyRdGOcnbRNE1RSjCfcRv
         XYE0hteRLaXmKI3aNDkG6IsSkbIIJJjI03xxxQVX5X2Za2BXA4SFJAotrXdQEHV59Iuy
         KRWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :subject:to:from:date:references:in-reply-to:message-id:mime-version
         :user-agent:dkim-signature:dkim-signature;
        bh=R7vvNQShjZstXykvSSp28e4ebWdGwPKaCuhGtz3SP9U=;
        b=bwRM0h2Dc8tiDrRA5XKGqt5LggSaa0fweRy0pRr0rCZ5SO4lDp1lVAs68rigL3LjkS
         EJH6Q+I8Ttc1IeEj0NkqDVrQ6mRLaxWtSzLR1sPNG6gx7WW5Scvd5i8WTZtGHpevmsgR
         zvMx4XpKCwxnkdle+iZTNbWQsshGpocIWGkbCaGBSioL2EATUbMVh7TtL6SvYcQzpDds
         0ghz3yHbMkUzrSSppAVgNbOgVMFILEypIswjK0kwwGB9k7zQR9YJyzQzyxDqS7G746N3
         aMlHdcj14UiFaMqw2TfwBfinPzl52FJnRlw8Jo3tOVD6FIfkqL/fmIoFc8SHm9qcZLtm
         553A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm1 header.b=UXrRXxlY;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b="b/MXrZne";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g187si4350259qke.326.2019.12.12.23.37.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Dec 2019 23:37:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm1 header.b=UXrRXxlY;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b="b/MXrZne";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iffWC-0000XU-Ev
	for alex.bennee@linaro.org; Fri, 13 Dec 2019 02:37:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53501)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <andrew@aj.id.au>) id 1iffW4-0000XL-Lm
 for qemu-arm@nongnu.org; Fri, 13 Dec 2019 02:37:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <andrew@aj.id.au>) id 1iffW3-0001B5-Lv
 for qemu-arm@nongnu.org; Fri, 13 Dec 2019 02:37:36 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:45253)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <andrew@aj.id.au>)
 id 1iffW3-00018Z-1i; Fri, 13 Dec 2019 02:37:35 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 6A25622706;
 Fri, 13 Dec 2019 02:37:34 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Fri, 13 Dec 2019 02:37:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm1; bh=R7vvN
 QShjZstXykvSSp28e4ebWdGwPKaCuhGtz3SP9U=; b=UXrRXxlY/RqY3GbUFkhrk
 SnylI3BL2xlgfwKqdVfSu4QPuBVZ5r8HhtKMLteQ/pR9PK52hgCI0jjcrfpQiyer
 QRt1O+lnQtVI8Wp6rj539BVkDp1/5t4MtWKNHD70JuiW+lcbEzk0IQyxmDq7HGH7
 D6/AVh27FRhy6dl9HDOMGPifZuBoTisrOPTu/yq1Ag73u7d9EcfFi9Gl2EX1ETMt
 CE9JEmvZ2csQYC25yk3Lit4DWf8mI6ZN+Q5Wnm/dy4kahrT9wsTm3/kZhM4X48Rq
 WTbLFjKVYPfxOAkjOX/HhKgsarUuZRKOWzzYAd9zmTT5NxG76uYhVVfPdeDZLdB9
 w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=R7vvNQShjZstXykvSSp28e4ebWdGwPKaCuhGtz3SP
 9U=; b=b/MXrZnenWgGj1row49Q8nWuHVIkklMIH/V09xnfKqYqvdzdPEyxuxQt8
 Tw7ggmBhoKuQu4W1vkxI52iaZwEgv5rfKkh138WrtF941mDFvrtdzAOz42aooegn
 oEHqDlc3aVjX01jaO1UUM7GY2c3gzpjIpqbAIsHG0Di4gSV5d5w1mBhuy+eDwPty
 AMazPPXxw4gT7AWPm/n4xv4TClbmXwsxYKFKX+zmwqN+9cF5GlXrdTh3HeM+cWKG
 ot85eF3OQcHmboLBvVcHgOm6AhNfX102FBn/BuLw8/120g1UMjp28zHQT2Y6A+sW
 3zG93CGgQpDyjBPq3b2OrZV3VLQWw==
X-ME-Sender: <xms:vT_zXcbzn5IWRBJmvNoh_KpYLuq9O43MMyG-Qva3FNxLqyzWH6RcNQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudelkedguddutdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdet
 nhgurhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurf
 grrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhs
 thgvrhfuihiivgeptd
X-ME-Proxy: <xmx:vT_zXYkCys5yL4M5eVP3bu9WGnNkJPk1UTCOANvYikT-JnqKd24bYA>
 <xmx:vT_zXXYUUZMFZoMmlKEE-IRTedz2SkEGa6kJwaIy8g_VzYteayX6uA>
 <xmx:vT_zXQA--z7XnBhP3TB4hqGAmUGuL0_LlqZsu-BzNfw1UKuHYNyagQ>
 <xmx:vj_zXSIqOv2Ax0xggKCMWf-RW-JP5Vu5nXaVGw6TdYbbMPpcPm_H8Q>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 9557DE00A2; Fri, 13 Dec 2019 02:37:33 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-680-g58d4e90-fmstable-20191213v1
Mime-Version: 1.0
Message-Id: <1d96ac9b-5eb2-43ec-bf21-334ee3fa4420@www.fastmail.com>
In-Reply-To: <16c90bb0-a3a9-06ec-e79a-bd98471d9e11@kaod.org>
References: <cover.fc3e5e495d85ebd919c1f06a1a2c7c7730518f9c.1576211124.git-series.andrew@aj.id.au>
 <16c90bb0-a3a9-06ec-e79a-bd98471d9e11@kaod.org>
Date: Fri, 13 Dec 2019 18:07:11 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org
Subject: Re: [PATCH v2 0/2] hw/arm: ast2600: Wire up eMMC controller
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 66.111.4.27
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
X-TUID: ldj2WFLHScHK



On Fri, 13 Dec 2019, at 18:03, C=C3=A9dric Le Goater wrote:
> On 13/12/2019 05:28, Andrew Jeffery wrote:
> > Hello,
> >=20
> > The AST2600 has an additional SDHCI intended for use as an eMMC boot=
 source.
> > These two patches rework the existing ASPEED SDHCI model to accommod=
ate the
> > single-slot nature of the eMMC controller and wire it into the AST26=
00 SoC.
> >=20
> > v2 contains some minor refactorings in response to issues pointed ou=
t by
> > Cedric.
> =20
>=20
> I think these patches are based on mainline. I fixed them locally on=20=

> my aspeed 5.0 branch and I plan to send them along with other aspeed=20=

> changes in the 5.0 timeframe. =20

Yeah, they're based on Peter's tree. I'll base future patches on yours.

Andrew
