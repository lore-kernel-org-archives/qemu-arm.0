Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp5135945lff;
        Mon, 9 Dec 2019 16:51:46 -0800 (PST)
X-Google-Smtp-Source: APXvYqzg4HD+Zpfu4CkKcyi8oxKXoFR0WBLreAFmuw9YRsCWLqoF6BJ/S6m0vxu+ANkuVOJwoZfX
X-Received: by 2002:a9d:4789:: with SMTP id b9mr24800068otf.110.1575939106477;
        Mon, 09 Dec 2019 16:51:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575939106; cv=none;
        d=google.com; s=arc-20160816;
        b=nIp5nCIAa7bJ46REtmGLK5jDIzV70qmcPYcT9Eqyxe9Ou8CBfIum428vilf7JwaBCH
         6++hzj1QXvUaVZEyoWXLyPb9BhCCUZaGPUkhFtnC5K0tEk/9EfKcW5kGcVsgr4VYU4jo
         slHWmd9PPPzW+u6JdXtvikO+L8zhZ4IN0J1GlPDOxb/vgHS+FDsIvvcq7xKShH0HYSxD
         swNpC1GtUPGSPZ8UewEBTOtheehrKzF/64DytPWfzg/+v5xnxpCI/tIrI/ymDQ8g2fJY
         dsH+Jmv7A7E6gI3zSTvy7NprIw+2QxfiZEwaQmqDV0BnSebWg+s5+QulVUCiARudc/Xv
         IUkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature
         :dkim-signature;
        bh=d1dmNORHMlpfYt+AMVjS4Tn/Y9CmVlh1D4pT80hKJvA=;
        b=IG7yVIOdLEKjloWTSJP1yJi9stT9579Z8bKhKbFU/KHwuSEDphlp500UAAdGnqplJ+
         M73XOtMylaDhEHK9Au3rlLGBayXu2epYy3XlWC6VXRL32liwObcfELHEZom80G6GZYUV
         yZLW+jG4kg+xxAtNTbVVrNeTGVFVg6Uf6KSUapgIRr+C8/oNPknZvTf9ETgB46bcYw2h
         iDc++P59uN02b+6B68zIiGcNAnyOAl3i28wzZcFp1TSMUk62eRUt1VjZoS8iUm26rd+P
         Ic3/TeDpflhE4lzT7tgzJqibKz0BQ7ZERtfS8PX2388m9xxvTWkH6sOw0Xf3CggImLrt
         WIkg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm1 header.b=EGANWB7O;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=dUBePxy4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s4si935840otd.113.2019.12.09.16.51.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Dec 2019 16:51:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm1 header.b=EGANWB7O;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=dUBePxy4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ieTke-0001Vq-HU
	for alex.bennee@linaro.org; Mon, 09 Dec 2019 19:51:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59203)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <andrew@aj.id.au>) id 1ieTkQ-0001Vj-DE
 for qemu-arm@nongnu.org; Mon, 09 Dec 2019 19:51:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <andrew@aj.id.au>) id 1ieTkP-0000M1-60
 for qemu-arm@nongnu.org; Mon, 09 Dec 2019 19:51:30 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:57901)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <andrew@aj.id.au>)
 id 1ieTkO-0000LK-Nt; Mon, 09 Dec 2019 19:51:29 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 609A522721;
 Mon,  9 Dec 2019 19:51:26 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 09 Dec 2019 19:51:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=d1dmNORHMlpfYt+AMVjS4Tn/Y9
 CmVlh1D4pT80hKJvA=; b=EGANWB7Okcu9K8aWsEYz4CRdtDGQsxLuLligsRB6ti
 JFImEmY7kDlEp+Aea0styf6bZIaEQIUIfsfOBTnpcnKgy766YU35QCrtAzGFmh01
 d8Yd0wrGpQYPl6/QvidlH51VzQmLxQekMrvuStk3Ar7J9QkzZbQYmvSqLjiGu8kU
 JaDnSrvWwGuVMq4JLNPylWzL64wm2xLkvicumQPal0rYjMO8pbbYNcNtK8bgBXvo
 Sp8yqctwnpO0up5Z5dwWk0Roa3mwziCMRQm+6dQD5MKsZDfgn7LUZf4RwSHXqpp5
 F3e5sTmDtKAAqHa4qDevny6NDncOtOr1lSu5T/Cgk/9A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=d1dmNORHMlpfYt+AM
 VjS4Tn/Y9CmVlh1D4pT80hKJvA=; b=dUBePxy4jB+2eJ8N6BIpIwWSdW60BtDH5
 f8GLISfI0IrWei4Zm7/FDjRCuLV7vVnCHkQnE2dRQ9kj+ppmyEK2M9oyhUsvNhmD
 hIKL8oi/Kd9RxgcxKOcj8tYl8Io6VPlPqsyjZzTK709I8fwGziQrzEeUZvFcsY/M
 RNNyAsgJvUS5uHnJka6ta02UT5LCJl0s0qxQSzBY86iqViXIL2ogdlnyqYnpLI49
 jb6XquB8VHtD1+VyfD5G2EDLO+PKHNHdx+tvl2ty3RcOg1zTkLn58mB9D2Yxobwx
 mo9y/QJp/uVkwtsScTlqz77jn2Q2REgEQR54d3Oiy7sxHgjuhkUgw==
X-ME-Sender: <xms:DezuXTDyjHNFYywOLvVtVNjEn483YPNwMxUDr2RuAAu8TtNN-of8TQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudelvddgvddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegrjhdr
 ihgurdgruheqnecukfhppedvtddvrdekuddrudekrdeftdenucfrrghrrghmpehmrghilh
 hfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:DezuXQkEf9j6xlgs_gHLWNuS4aW5NgSMIvJbWAeJgG8bjHLR073G3A>
 <xmx:DezuXS1_N2GIT4MIlmUigbvPnfx5x9rFXc0-C5wlD_VaIIuOyvi7lA>
 <xmx:DezuXYhw5BQe376ss99gDzmAOv-EjEEKpq_wmDe0KEygLkqhIqjfTQ>
 <xmx:DuzuXbCX0R4rOKucipTRUdBpaOgbl3c-3hGioVMizG1Pv2JMoskDAQ>
Received: from mistburn.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
 by mail.messagingengine.com (Postfix) with ESMTPA id 145E830600BD;
 Mon,  9 Dec 2019 19:51:22 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: qemu-arm@nongnu.org
Subject: [PATCH 0/2] hw/arm: ast2600: Wire up eMMC controller
Date: Tue, 10 Dec 2019 11:22:49 +1030
Message-Id: <cover.da2612e7c1835c563b20851f0ac26c7b175428fc.1575938234.git-series.andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, clg@kaod.org,
 joel@jms.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HkcD+hZHSJ9y

Hello,

The AST2600 has an additional SDHCI intended for use as an eMMC boot source.
These two patches rework the existing ASPEED SDHCI model to accommodate the
single-slot nature of the eMMC controller and wire it into the AST2600 SoC.

Please review!

Andrew

Andrew Jeffery (2):
  hw/sd: Configure number of slots exposed by the ASPEED SDHCI model
  hw/arm: ast2600: Wire up the eMMC controller

 hw/arm/aspeed.c              | 15 ++++++++++++++-
 hw/arm/aspeed_ast2600.c      | 23 +++++++++++++++++++++++
 hw/arm/aspeed_soc.c          |  3 +++
 hw/sd/aspeed_sdhci.c         | 11 +++++++++--
 include/hw/arm/aspeed_soc.h  |  2 ++
 include/hw/sd/aspeed_sdhci.h |  1 +
 6 files changed, 52 insertions(+), 3 deletions(-)

base-commit: 6a4ef4e5d1084ce41fafa7d470a644b0fd3d9317
-- 
git-series 0.9.1
