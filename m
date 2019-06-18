Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3984712wrg;
        Tue, 18 Jun 2019 10:34:40 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxiP9TxrANSf8yUljJPBztk8LXW9FY390QI37zFoNeyTz3nMGg7JIPQrBBxr8pHlqOGMg5k
X-Received: by 2002:a0c:d92b:: with SMTP id p40mr20055160qvj.34.1560879280400;
        Tue, 18 Jun 2019 10:34:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560879280; cv=none;
        d=google.com; s=arc-20160816;
        b=I8SihtfTwuBen+dy3LkJPu+3Q7LDpc2jnhxXRZeyocucAlym7r8CPF1bDND9B+c11e
         bUOSJoWAtfK+4iu9N9+prMAZZDyXE2N4BvzEIJ0JAYeWuhh8VxUlybAd9z0YFLI0ICua
         RN6dF0cFMDWYT//xwinMiqxJO0LMpAqCxAhnomWh9B8tETYmcPaPrwDEuidBTc2oBRI6
         3yrzEqoTeKzZnbSJkiXHPeq+9g2FZSPeX68b84asbvXa6A88i3VWKK9Mmrnls9WuRoXJ
         C5fA8aISJfPV6//bWXYT9ExCpTOK7f/l9HMnmBh2glY+X708wtW+SKV7C2BBbgkbvB7a
         TTIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=emzaqH5b1Azm9Uvz57tLDWf4xTj8BCtwigNm3PV7EJo=;
        b=0MbNsRLGBq/tupLsGTs65Y8EDEcOiPO3Hpx37gKcRIX5S0iEF8f8N8uWFahxTdNE5U
         qyg+Epb6bsk28OJXCHjgQBZd6INrdfOLRuiVMO8AcBD/3NMFD5perkSq+P2jJqZ79nQX
         DxQTgkGD/F0Y1A1ANo10XSgN9CvdrzWf0BK7QQZUeFo32XAuuGFZJMa1QfZmxM4OoeHK
         kcK7jRnZAtPzdlO44cmE7i4g6+r/UKjqVLOmIeC1QRyWoLufFTS+hhUABLYk1tK5C73F
         xaGxCqcJHTz0M20hWAUQQjKhSA2Zk2A7lCbdpiVGr1PKjADJzRvebQn6C+NPbeRshXrb
         LO0g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f63si10343003qke.124.2019.06.18.10.34.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Jun 2019 10:34:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60580 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hdI0G-0000Hw-0j
	for alex.bennee@linaro.org; Tue, 18 Jun 2019 13:34:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32864)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <clg@kaod.org>) id 1hdHOV-0001UU-TY
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 12:55:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1hdHOR-000629-1P
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 12:55:37 -0400
Received: from 3.mo177.mail-out.ovh.net ([46.105.36.172]:42011)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1hdHOQ-0005ws-PF
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 12:55:34 -0400
Received: from player157.ha.ovh.net (unknown [10.108.42.102])
 by mo177.mail-out.ovh.net (Postfix) with ESMTP id 2F04BFF658
 for <qemu-devel@nongnu.org>; Tue, 18 Jun 2019 18:55:30 +0200 (CEST)
Received: from kaod.org (lfbn-1-10649-41.w90-89.abo.wanadoo.fr [90.89.235.41])
 (Authenticated sender: clg@kaod.org)
 by player157.ha.ovh.net (Postfix) with ESMTPSA id 652116EB5504;
 Tue, 18 Jun 2019 16:55:22 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Jun 2019 18:53:08 +0200
Message-Id: <20190618165311.27066-19-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190618165311.27066-1-clg@kaod.org>
References: <20190618165311.27066-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 1693916413399173905
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrtddtgdejkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.36.172
Subject: [Qemu-devel] [PATCH v2 18/21] aspeed/smc: Calculate checksum on
 normal DMA
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
Cc: Christian Svensson <bluecmd@google.com>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EyjjTgKPbMij

From: Christian Svensson <bluecmd@google.com>

This patch adds the missing checksum calculation on normal DMA transfer.
According to the datasheet this is how the SMC should behave.

Verified on AST1250 that the hardware matches the behaviour.

Signed-off-by: Christian Svensson <bluecmd@google.com>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/ssi/aspeed_smc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 5c017f631ffd..9d0f17ce84ae 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -993,6 +993,7 @@ static void aspeed_smc_dma_rw(AspeedSMCState *s)
         s->regs[R_DMA_FLASH_ADDR] +=3D 4;
         s->regs[R_DMA_DRAM_ADDR] +=3D 4;
         s->regs[R_DMA_LEN] -=3D 4;
+        s->regs[R_DMA_CHECKSUM] +=3D data;
     }
 }
=20
--=20
2.21.0

