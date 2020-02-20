Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp109984lfg;
        Wed, 19 Feb 2020 20:01:00 -0800 (PST)
X-Google-Smtp-Source: APXvYqy4z280eMPt6BnR+aphMchuKv0xhVSp+m5MfLsR1wKbJ/Zxdp/g4KoSzzBEt/pUE7hWpcpk
X-Received: by 2002:a0c:e8cd:: with SMTP id m13mr24141691qvo.102.1582171260312;
        Wed, 19 Feb 2020 20:01:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582171260; cv=none;
        d=google.com; s=arc-20160816;
        b=SToEE3iF3/9ZSx6nvadkYBvZbWtPrGi1WIGxveJBtRr/ov8r9nsSwXW2PFXVqQSIek
         8nZWLbjhA+KidR612m1SPlrjXDdL9KX3+dFqGJcHWUW6B9IoOx0jSHpkXdmpbKD6huQ1
         C3MUT8y6EbPKoQ8qgb+BD9bf2yLHzFlKI8g1ael143pIKXeHXRJB/MX0rz5XC1gmZeyc
         UpPi3yG4JMLumf4KLRtq9iKTnTGckLXTPb2Km3Uyhctx9aVFitHZfdpWMxDsvkMxcbuq
         HJQZM/Y8J/CHJaioWl9iI0UehLpcCYBJI4bhkuy5ZA91tkuO4+DG9MhQjbPbrzk8U7RU
         ZkAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :subject:to:from:date:references:in-reply-to:message-id:mime-version
         :user-agent:dkim-signature:dkim-signature;
        bh=etUlXaKb6s1XrkRtfVBx1UhOcc0NW5xvfVRd6PG5drM=;
        b=xUXmn/USP0AqsIOgVDjTfpvULAnCGsl1YEuGJse532YdhPARTveR7ga9QpWKGcdamq
         xWCsRShsQ2jUkbbPo/62TVVvepxtWHaNvk6Ul5M40wlPipD/q8MAGlgLPM4+X8i6VKsX
         PUzM6MF3RCWpkzNZAQPMl9oQgtOW+HvK8STL5dc6ATMZcUdcvCywJgmywr9pCJcpaQ/4
         selkEffLS5CACjvZo1VMGbtS1NXFLytr4Ls5R2RKH/hIe9EhaSRfRasMkGuD2WF2+ZpT
         NBTYsgBEs+OGqP8cBWH/mvgVRbGEx5mrDYHZ2BEvsFmM+P/ONdCcBjQg6uh9NGJrSfxt
         g9wA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm2 header.b=t5l+g7hA;
       dkim=fail header.i=@messagingengine.com header.s=fm2 header.b=HX1VIC8r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x20si918304qvv.137.2020.02.19.20.01.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Feb 2020 20:01:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm2 header.b=t5l+g7hA;
       dkim=fail header.i=@messagingengine.com header.s=fm2 header.b=HX1VIC8r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j4d1H-00083X-Lp
	for alex.bennee@linaro.org; Wed, 19 Feb 2020 23:00:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44282)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <andrew@aj.id.au>) id 1j4d18-000837-L5
 for qemu-arm@nongnu.org; Wed, 19 Feb 2020 23:00:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <andrew@aj.id.au>) id 1j4d17-00046P-Nf
 for qemu-arm@nongnu.org; Wed, 19 Feb 2020 23:00:50 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:59307)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <andrew@aj.id.au>)
 id 1j4d17-00046C-Gz; Wed, 19 Feb 2020 23:00:49 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id CF1F921DC4;
 Wed, 19 Feb 2020 23:00:46 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 19 Feb 2020 23:00:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm2; bh=etUlX
 aKb6s1XrkRtfVBx1UhOcc0NW5xvfVRd6PG5drM=; b=t5l+g7hAWUsdKhljlr7x4
 Wf273WTNbHDHye76yDtlYmREStCapYF+x5sYZkuzmQa7W8S725tFKI7jz5oF6CxF
 gXYTkilIGHi+9e2dnxjfkjffPaPW4e4uN2EY2RdWgbDTqOS1T95Z8fB4BeDvW0ff
 33xSB1yBamCa5XKDYY/ZIfGomaKDA6KuvTEVfEFmXMK4Nu69aTGxw/XRPlGiMWf9
 PPR2xshw3+riigqmvU8taFk0gk0KGWWbbTN0/kSOP5wYbXr3no8LHvJUEDyUKVB+
 4K4PZJWKiCjOC+QcOA2Rp9yaDI4DfRhTsk2EnUS2WCivK9gsHJYqohgLpcXvvfhM
 g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=etUlXaKb6s1XrkRtfVBx1UhOcc0NW5xvfVRd6PG5d
 rM=; b=HX1VIC8r+iICGIpQooJEzoASXWt4wdXU/ly57Ju38Tjo9kZrnzulniuTo
 qGBbSH1VgzGZQWoJqY7i/52fueVMCoKIVFLMRPoexmBK6/3i8RN/311KVQnCQY9Z
 oiQgomTRNHEtbCTiEQWPPtmgzih8SQJ16l4q1sEWCdi+PhzTi599Gq/Daws9PBZG
 WdgGoQMvj1ZmAlguxSWyoJEP+eLakBeC3sdROaCXOwpJg/GyiqG8wH3bnLzUiiOZ
 uSlKfre4PwAV2/GTgXaZybtrsf5irZ6iDk39CX+CdwfRkbs1CFL2Zjy9XT/EAygD
 EfkLvQfFns3PTlXv25Ul5m1+jMDBg==
X-ME-Sender: <xms:bQROXra6FTumU8XHMrMHbVN-9B89D0D98_yXvGKcp8H5X1YbTXtvNQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrkedugdeijecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuvehluh
 hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegr
 jhdrihgurdgruh
X-ME-Proxy: <xmx:bQROXk0RYWvSX8XHW3_T134k2VDgujGxZj2g3cGwOPID7lZ99eaVfw>
 <xmx:bQROXlcKRvnmMwA2u3KGHkgFQ9CaDcdLSW5WKDAFx70XUlVc1oXsbw>
 <xmx:bQROXpKyQIcFdohyQeHSiP4uwCW9C5642lydQpA5CgW9xB2_ru0PKg>
 <xmx:bgROXoW4MKK6ojP-dg6hd6S1AvBHr4B6-b3aRW6ngG27nDp8vbKq1Q>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id B3C34E00C0; Wed, 19 Feb 2020 23:00:45 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-802-g7a41c81-fmstable-20200203v1
Mime-Version: 1.0
Message-Id: <de73618c-b7ff-4524-8182-727e6ada1429@www.fastmail.com>
In-Reply-To: <20200206112645.21275-2-clg@kaod.org>
References: <20200206112645.21275-1-clg@kaod.org>
 <20200206112645.21275-2-clg@kaod.org>
Date: Thu, 20 Feb 2020 14:30:39 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 "Peter Maydell" <peter.maydell@linaro.org>
Subject: Re: [PATCH 1/2] aspeed/smc: Add some tracing
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 66.111.4.25
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
Cc: Andrew Geissler <geissonator@gmail.com>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nGc+ZEcO9Oer



On Thu, 6 Feb 2020, at 21:56, C=C3=A9dric Le Goater wrote:
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
