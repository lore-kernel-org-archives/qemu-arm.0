Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp307246lff;
        Thu, 12 Dec 2019 20:27:34 -0800 (PST)
X-Google-Smtp-Source: APXvYqyf1hYZnlHURV7jiaOwn7PVCblfKIQ9d1Wds8CkhZe3Hwk696rZRcgX3+zt7WRjrXJtPUA3
X-Received: by 2002:a9d:69ce:: with SMTP id v14mr6063125oto.248.1576211254212;
        Thu, 12 Dec 2019 20:27:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576211254; cv=none;
        d=google.com; s=arc-20160816;
        b=nkl8lz1NeCWBNuTH4fphVJQYH9O/MC7sbWf1HUejpFnHrxKEPCRcLHU0oUXyxZZTIU
         yv6pqk3GpKoqjVAo+f0gcfWRgFwxpFHlqsFU8V+/NqWoh+h45kxYHhEyBCBuS/sNpUaG
         mkmGEE+IOi/XB/b25A3UW7tsUUhrEqwh/Zlw7woD5047xEBuvlUms2f/iZmp3iARuBR+
         X6FM/mDaUvki/8EL5B3gmXIpUhUcaM7NU2jm6O/91CaDUYkkaYVvTk7H/NrUyC0sAGTG
         dO2oSFIuUXOCM7T3zlHt/K5k1bmLFN36Wx9V3OpmjpC1MjZx+wZgJcSdNjy5a+oRDrjX
         uOTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature
         :dkim-signature;
        bh=PqgLhpy94OGx/TZUhKr14ouSOmhNdalV2V/031LW2zc=;
        b=w3TtICrpwGXpp2jOjLSzJ2xaXO/80v3ykJL27Hgp7TYK307LxM81PTOY60tll9eRUZ
         x8V/CyhRDFCimq50NI5foIAi3ICmVpv597sM5bu+THrwz8IUNzE3XXPTos3K85qn/IQ3
         MLHMhq00z8hPOAyVhFNus5z7rcgkXriYmX/39G87D2bA7MQYvY/gVMBpo472BazthwVa
         TLKnUGtd4IQWSaLAZTEHYivUA6FBY7z/KYDd6hS7ds6ZrfFvsoqdHAuWdWZ7zRBHYhkg
         4D5TcFM17lckjZQbeNGc0cvolE6qKUnN7qA+l4eQKJEAMw7ORRL0yj57y2j8HKMmZNG5
         tuIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm1 header.b=TQ20b1eK;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=fjtlUuFi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x207si4345144oif.30.2019.12.12.20.27.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Dec 2019 20:27:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm1 header.b=TQ20b1eK;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=fjtlUuFi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ifcY9-0003Oq-8D
	for alex.bennee@linaro.org; Thu, 12 Dec 2019 23:27:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54183)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <andrew@aj.id.au>) id 1ifcXu-0003M8-BF
 for qemu-arm@nongnu.org; Thu, 12 Dec 2019 23:27:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <andrew@aj.id.au>) id 1ifcXs-0003A9-TO
 for qemu-arm@nongnu.org; Thu, 12 Dec 2019 23:27:18 -0500
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:54753)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <andrew@aj.id.au>)
 id 1ifcXs-00035M-EX; Thu, 12 Dec 2019 23:27:16 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id F12AD877;
 Thu, 12 Dec 2019 23:27:13 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 12 Dec 2019 23:27:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=PqgLhpy94OGx/TZUhKr14ouSOm
 hNdalV2V/031LW2zc=; b=TQ20b1eKD9tveMzCEHh14gs1nOP7CDus0iJBcem7JE
 W1N7fTq9QC0oDxCMbs6FNEE1OhD/64Ch1F6UnpKqjDF/8hY0BzxrKATiazH5I+5l
 7+7cPTCKOIhdo5JuqIKD7E1JG6UlfAcOdihS04W2IBcdG0gD5QSgiMmBxW0LMRd2
 5zrP1TPkwu51xCEShImCDtEL791aVNEPcUBX9+Dhca2PDdcyxJG6r1BIMKjo9/wf
 19UXE6s3vxWhnVopngjgYU0LCD73aOH9iKUyl1EbUUxr1MSWxeFYVUDGl2gsj549
 aOcQh90rGX1AUy3cVLnOW3/Q1Cmw8u+iklmFYnaFnwNQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=PqgLhpy94OGx/TZUh
 Kr14ouSOmhNdalV2V/031LW2zc=; b=fjtlUuFiyE4jIDZ3KSWKN1GNKe9+zXfZm
 fpuP9YIwMCvdP62UyS9WOJ/YmQ2PQou19V02LzHCds9lM377pStfrYuRA6C3wJ0S
 GaY0d4NCUix9qK7H+fJj+fHrn6SL6o2ZPNxSojamgDODokHiaOLzWz56OcY/tv9x
 C03n3B3z+Jtf3VnV4XdXxEy8tzDjcsKni/YjWp/yNz7pEeGaYGE1EdC/KQCAt/0W
 Gfh5AsckbHI4xOAHn7NCTpGFIi5T6gtMA8Hwjdjqm4p/tVgwh1DTLP7Jn/mQcgXw
 xMMuIDkfMxONihV7+doR+dinxwSJ6FMPeMfCdHRQhL8RTSyeGG6wA==
X-ME-Sender: <xms:IBPzXdlMrB_MOnDJmOfb4k3215zaCAUKop6ZXCqZ9uuOZU0IZ0xsxQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudelkedgjedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegrjhdr
 ihgurdgruheqnecuffhomhgrihhnpehoiihlrggsshdrohhrghenucfkphepvddtvddrke
 durddukedrfedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhi
 ugdrrghunecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:IBPzXdGjmPDFsEAobpPH6MTrWKJcPrJ6djzR77tzJVexEs8ywzDpVA>
 <xmx:IBPzXepygpgOXjWZ9tol5MBD-fwWJB_WkSjZZSk2Eq4R4pR7aCHJKQ>
 <xmx:IBPzXR4zgA3paZxElv-tetBNg92gcVenbawa1JC1IedWwyGkBGx-_g>
 <xmx:IRPzXd0yGcDmFYHjWxycXSVzfZ5W3zuaQCEK9nZAzpvOFVyM6l1DRQ>
Received: from mistburn.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
 by mail.messagingengine.com (Postfix) with ESMTPA id 79FA980063;
 Thu, 12 Dec 2019 23:27:10 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: qemu-arm@nongnu.org
Subject: [PATCH v2 0/2] hw/arm: ast2600: Wire up eMMC controller
Date: Fri, 13 Dec 2019 14:58:40 +1030
Message-Id: <cover.fc3e5e495d85ebd919c1f06a1a2c7c7730518f9c.1576211124.git-series.andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 64.147.123.19
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
X-TUID: 9Xb5It1eaiS9

Hello,

The AST2600 has an additional SDHCI intended for use as an eMMC boot source.
These two patches rework the existing ASPEED SDHCI model to accommodate the
single-slot nature of the eMMC controller and wire it into the AST2600 SoC.

v2 contains some minor refactorings in response to issues pointed out by
Cedric.

v1 can be found here:

https://patchwork.ozlabs.org/cover/1206845/

Please review!

Andrew

Andrew Jeffery (2):
  hw/sd: Configure number of slots exposed by the ASPEED SDHCI model
  hw/arm: ast2600: Wire up the eMMC controller

 hw/arm/aspeed.c              | 27 +++++++++++++++++----------
 hw/arm/aspeed_ast2600.c      | 23 +++++++++++++++++++++++
 hw/arm/aspeed_soc.c          |  2 ++
 hw/sd/aspeed_sdhci.c         | 11 +++++++++--
 include/hw/arm/aspeed_soc.h  |  2 ++
 include/hw/sd/aspeed_sdhci.h |  1 +
 6 files changed, 54 insertions(+), 12 deletions(-)

base-commit: 6a4ef4e5d1084ce41fafa7d470a644b0fd3d9317
-- 
git-series 0.9.1
