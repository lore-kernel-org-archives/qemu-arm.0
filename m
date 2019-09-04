Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp357106wrp;
        Wed, 4 Sep 2019 00:10:17 -0700 (PDT)
X-Google-Smtp-Source: APXvYqydiSzEYK3xuBMK2CmhNW8PKb9hAPAyrW093GPkJQCiKhIW8yM7VoGXc5ZrR6m0eLvx2hwG
X-Received: by 2002:a05:6402:1604:: with SMTP id f4mr35401574edv.59.1567581017580;
        Wed, 04 Sep 2019 00:10:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567581017; cv=none;
        d=google.com; s=arc-20160816;
        b=yaqlCwLp8EGkxk1EX+4O+/OG4sG34td9spJlxiNeZxY1HUp/oif2nHvYq9rzG7LazD
         4jaqjaw7VwfSrBwFW6MaDMFE14g3aVDEOiWgdb7flTplVjJWjPxHXulbblyhV09LijbU
         5hh7GWdvrdPfJfhy6J/tuo2BPZebrRGslVZgUXVLaeRDNYg2ABK5gUsW35X6tInyMEJD
         kwKOgpGZEqQThTned3EK8FYPvYX2H+oQr6LH08AlJa4L+7nQQ/05HxmM3ghPzUQfe4Xk
         pqD0LuJFVVd1okZOOiCthZ9U0iGhy0DJ87eW0RdvFXhsilirGc+EbCFcpgDeukBMAQoK
         aifA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=o4RlWdYtxqMlHbFVT9ZZ9VE8q8VzUqoXL6uIpokTRqM=;
        b=lp3aRysMy2sliW8iZR6AFFcP6aNPoSXnegzHQoX1NbOFLUMSH3Ke2n4u3JgiHVFFGI
         lqG+VzAGLoL18SwJnmzG6Vj8NHnSo9vcxwKXfbNEaXON+D/ATnhw2vLMVRJZDqANRHKM
         A0b//9hA7GEVMjNMsDMxl3BxrI4u+4Y+4er+RCcyU2x2x1yZp1C0eCQsVeSMSa2c8k5P
         sCb/Pi0nt4qfLbIoVfdXu0hkOgV5Cfp7KjT2aKIkb6cVHIiOyccitLKpHUxqI98niXFq
         R6AvzpTQrSyQqNxR/zDxA5mw88PDVCeWKoRmvdXxTarJYvPiOMRpbjDNLNYVkVHkB0Oe
         bKbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id rv27si3066040ejb.136.2019.09.04.00.10.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2019 00:10:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5PQl-0005yc-Ne
	for alex.bennee@linaro.org; Wed, 04 Sep 2019 03:10:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47949)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1i5PN0-0002E8-93
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 03:06:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1i5PMz-0006i9-CC
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 03:06:22 -0400
Received: from 6.mo69.mail-out.ovh.net ([46.105.50.107]:37787)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1i5PMz-0006gp-75
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 03:06:21 -0400
Received: from player690.ha.ovh.net (unknown [10.108.42.73])
 by mo69.mail-out.ovh.net (Postfix) with ESMTP id 294286847C
 for <qemu-arm@nongnu.org>; Wed,  4 Sep 2019 09:06:19 +0200 (CEST)
Received: from kaod.org (lfbn-1-2240-157.w90-76.abo.wanadoo.fr [90.76.60.157])
 (Authenticated sender: clg@kaod.org)
 by player690.ha.ovh.net (Postfix) with ESMTPSA id 563E094DCB0A;
 Wed,  4 Sep 2019 07:06:11 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Wed,  4 Sep 2019 09:05:04 +0200
Message-Id: <20190904070506.1052-9-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190904070506.1052-1-clg@kaod.org>
References: <20190904070506.1052-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 7091480566931950353
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrudejgedgudduvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.50.107
Subject: [Qemu-arm] [PATCH 08/10] aspeed/smc: Calculate checksum on normal
 DMA
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
Cc: Christian Svensson <bluecmd@google.com>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2koTj4U+osEG

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
index 5c3436db5e8f..9ffc7e01179a 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -989,6 +989,7 @@ static void aspeed_smc_dma_rw(AspeedSMCState *s)
         s->regs[R_DMA_FLASH_ADDR] +=3D 4;
         s->regs[R_DMA_DRAM_ADDR] +=3D 4;
         s->regs[R_DMA_LEN] -=3D 4;
+        s->regs[R_DMA_CHECKSUM] +=3D data;
     }
 }
=20
--=20
2.21.0

