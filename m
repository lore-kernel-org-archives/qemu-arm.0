Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp314011lfy;
        Wed, 19 Aug 2020 03:11:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwSIvNb3+CYZQ7ssvUCulddCLaUzss73YNebPYm7koWy4K5yOVSfCvwSYWHqz8CSdyp5pSC
X-Received: by 2002:a25:86cf:: with SMTP id y15mr13933735ybm.25.1597831917197;
        Wed, 19 Aug 2020 03:11:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597831917; cv=none;
        d=google.com; s=arc-20160816;
        b=s/7gxagHV691CVtutVJ8UPi9WKx0uDD4f693vX/EnX2lXpDaUDrWv32zaydar8ag+D
         8CToEQPpsEJdBjglw8FsCqjfIq7UxGkSNbIc+whb9yPmvB3xAm3N7jJj3ieMZVVAast3
         pCVOmb9ZXFxjY0DHW1mSGcO3fUkyc5/OnO3TW4oHHnk9PGQbhj1PzoB9v6bFcVvrQOme
         WbTkF4mjYw2ifagJbJ1ikQ4Z0dZQL3ZbbjUQxN5g4t9AXbewUC5EnzEHod/uz5JsIGwd
         sIplwBXb/7RsGooWSDFipvOWUx4YwbBrfhPE2MsrDc9uIywW2+8tWLFukGUd/lo36uSa
         +gMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=P9RMCibbXH42m3ptbD5nGz2b4tcdz5PbuUWxE9R9t9g=;
        b=ZKXHf0gRvElzLEioONuvx89FNa68JtYeW7oPXu0xmXS92iDQzYI3L5/9iYynEbX133
         GvwPbBdLeihBj0Lz1cZtknSYXmITxlOSfj4WUGcfU06AW0SOYuL7D5eTb7u02E0pkOLK
         L5/GFSQuWfmMU1WdYWjyAvkQv4VjqzI2Nv8nGIJMIX+3VOD6Ujxnl7LS/7ZI8N9Deqjv
         kNeLG0JVCKiyKUKPHvWPa5jlvBozJ0tuX5TOmRnOWaIZ45aiBKuUAsu38kHV/y9aGTJx
         WeIHIk+bxWtVSgG5/5XsPaGUCd69Evt4fA4z3lj2zbsfaNs29kKA4C+/sMfsXm4TvP7I
         bvIA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t6si27074422ybo.46.2020.08.19.03.11.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Aug 2020 03:11:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k8L4W-0005EM-Ex
	for alex.bennee@linaro.org; Wed, 19 Aug 2020 06:11:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1k8L2t-0001DZ-GI; Wed, 19 Aug 2020 06:10:15 -0400
Received: from smtpout1.mo804.mail-out.ovh.net ([79.137.123.220]:50663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1k8L2p-0006W2-LJ; Wed, 19 Aug 2020 06:10:14 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.21])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id CC2855892830;
 Wed, 19 Aug 2020 12:10:02 +0200 (CEST)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Wed, 19 Aug
 2020 12:10:01 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G0048b6d88a7-e9a7-45f6-ba66-a1e32912608f,
 56ABA3BD09B5898CED80C8E013D4E39E9C6048D1) smtp.auth=clg@kaod.org
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 03/21] m25p80: Add support for n25q512ax3
Date: Wed, 19 Aug 2020 12:09:38 +0200
Message-ID: <20200819100956.2216690-4-clg@kaod.org>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200819100956.2216690-1-clg@kaod.org>
References: <20200819100956.2216690-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 0859f7d2-bd91-48e0-bb6f-0b2a21ccd539
X-Ovh-Tracer-Id: 18048456985036294950
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedruddtkedgvdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfhisehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephfekveeuieehvddvgeefhfevieeiieehuedutedtuefhueehhfdttdehgeeigeehnecuffhomhgrihhnpehmihgtrhhonhdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout1.mo804.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/19 06:10:01
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /iyZ1MitkEmf

Datasheet available here :

https://www.micron.com/-/media/client/global/Documents/Products/Data%20Sheet/NOR%20Flash/Serial%20NOR/N25Q/n25q_512mb_1ce_3v_65nm.pdf

Reviewed-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/block/m25p80.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 1696ab1f7821..8a3fd959e218 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -238,6 +238,7 @@ static const FlashPartInfo known_devices[] = {
     { INFO("n25q128",     0x20ba18,      0,  64 << 10, 256, 0) },
     { INFO("n25q256a",    0x20ba19,      0,  64 << 10, 512, ER_4K) },
     { INFO("n25q512a",    0x20ba20,      0,  64 << 10, 1024, ER_4K) },
+    { INFO("n25q512ax3",  0x20ba20,  0x1000,  64 << 10, 1024, ER_4K) },
     { INFO_STACKED("n25q00",    0x20ba21, 0x1000, 64 << 10, 2048, ER_4K, 4) },
     { INFO_STACKED("n25q00a",   0x20bb21, 0x1000, 64 << 10, 2048, ER_4K, 4) },
     { INFO_STACKED("mt25ql01g", 0x20ba21, 0x1040, 64 << 10, 2048, ER_4K, 2) },
-- 
2.25.4

