Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1856462lfp;
        Mon, 20 Sep 2021 01:10:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyx6aM4d3VeLEdHvyQg+QOd+7birEtz3E7FZD2LWDZdfE/qv21YX7KsFmxtpoV9hSLA70G3
X-Received: by 2002:a6b:2bce:: with SMTP id r197mr17654146ior.212.1632125423895;
        Mon, 20 Sep 2021 01:10:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632125423; cv=none;
        d=google.com; s=arc-20160816;
        b=OXLT6KNkGM8Ylqb87PLfB3J8/fQqiernEttOPVRwDPmpP82zCtem1Hvh55eny46cuc
         qc1gc85rYJkGm0/ehl0prPBDFynCCpOmvJVlzk36BpzBL81Rn6g+B+xeE4fHAM1pWOft
         G4I670YbQD6Au1OhWlKeMdCP5G4Eb5bFcaxrrBQrWrhCLaUApYGdiwKHFua/3CMC3ra1
         lCGBsz1TC0KORasXxb4Fzyx2RuPMKT47dprJGC4ZUvEcbac5iKlJ2cJcvzOFJ6USQGpz
         Egh3deUPLY7VwPCXWMqreqAsiD7Fw7SswXIgFaqf9srM0J8MR00F/x3lMmX5lIFuTczO
         Hmug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=QMobFSiH0idTN0KuGdPHQqtiZi4a8ulVjW2IudMGXAo=;
        b=ewjbsBiJDzXFsTGjv+Bica6v3o15ADcZ5beOCc3lkXXqAfoxeLfQ7Rq9AOaG9HMque
         K12c/u55EuR00ptB9HiClilbr1D9o9QgDRdPCP8TnkY4/CEUl4NG6WT0Qhep0PLXK5lu
         3KgEEOWxvEN6yL4Iyis3+Xz7HdYNLZMb4otISBlx+bstYBMosQgyhDDlm4vqzHooqZEN
         2f1bPe9c6oJF3psAEn9XmKJgTgEkR52/vds1G0q2lX2XN6/A53rNoPq62HFp4Qw0yJZS
         K6iEydnin1eBwTL+zE0Q/zz/lMxBFry1W0ogV1/JcGeku3Uy9fXYn9Cnieg8G7fl9WNQ
         o1eQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c17si14348828jam.29.2021.09.20.01.10.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Sep 2021 01:10:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mSENb-0004Ph-7J
	for alex.bennee@linaro.org; Mon, 20 Sep 2021 04:10:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mSEMs-0004NK-4a
 for qemu-arm@nongnu.org; Mon, 20 Sep 2021 04:09:38 -0400
Received: from 9.mo548.mail-out.ovh.net ([46.105.48.137]:58605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mSEMp-0003fG-Vy
 for qemu-arm@nongnu.org; Mon, 20 Sep 2021 04:09:37 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.36])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id E7283206FD;
 Mon, 20 Sep 2021 08:09:30 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Mon, 20 Sep
 2021 10:09:30 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G00583941dc7-70a6-409f-9218-6b89e5be0299,
 C584E5EC745A9DFF7B561FC81DF43D5934FDEC9F) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 01/14] hw: arm: aspeed: Enable eth0 interface for
 aspeed-ast2600-evb
Date: Mon, 20 Sep 2021 10:09:15 +0200
Message-ID: <20210920080928.1055567-2-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210920080928.1055567-1-clg@kaod.org>
References: <20210920080928.1055567-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 4ffb6d2c-6b49-4649-8652-7ce5de828fed
X-Ovh-Tracer-Id: 4736097962334718825
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudeivdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=46.105.48.137; envelope-from=clg@kaod.org;
 helo=9.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Guenter Roeck <linux@roeck-us.net>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 88REEacn+8db

From: Guenter Roeck <linux@roeck-us.net>

Commit 7582591ae7 ("aspeed: Support AST2600A1 silicon revision") switched
the silicon revision for AST2600 to revision A1. On revision A1, the first
Ethernet interface is operational. Enable it.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20210808200457.889955-1-linux@roeck-us.net>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 9d43e26c51bb..ecf0c9cfacb8 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -959,7 +959,8 @@ static void aspeed_machine_ast2600_evb_class_init(ObjectClass *oc, void *data)
     amc->fmc_model = "w25q512jv";
     amc->spi_model = "mx66u51235f";
     amc->num_cs    = 1;
-    amc->macs_mask  = ASPEED_MAC1_ON | ASPEED_MAC2_ON | ASPEED_MAC3_ON;
+    amc->macs_mask = ASPEED_MAC0_ON | ASPEED_MAC1_ON | ASPEED_MAC2_ON |
+                     ASPEED_MAC3_ON;
     amc->i2c_init  = ast2600_evb_i2c_init;
     mc->default_ram_size = 1 * GiB;
     mc->default_cpus = mc->min_cpus = mc->max_cpus =
-- 
2.31.1

