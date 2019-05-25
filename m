Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4327269wrg;
        Sat, 25 May 2019 08:31:45 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyHbFLtEHviRmqB+ZKicBXX2v3AMXUPzgjPiFanHKnjVS4U7TGnQgvq4CjwcwKY/FP5TTf6
X-Received: by 2002:a67:d815:: with SMTP id e21mr30789394vsj.35.1558798304940;
        Sat, 25 May 2019 08:31:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558798304; cv=none;
        d=google.com; s=arc-20160816;
        b=lOPnfkhjctjzLWvgZ+eMvsFOQmJQLNEO7X8I49SVKitCcft0dln23dUz0fztsTc1JT
         G/3i/4ltikzRqvifcMyp2NaPbxoXHaCa/ks4OkxLLe51Nrw4V07lF59MbZnNijmYAqwm
         Uy0xYK8JxUKYmDjLskTBPc1Z+xJkE56m+3Ncav3GzvjTr5LqNzddqvmJVPneijAKXwLY
         wMxp/Y2Mb+kF4FcLBEMmKBLEA8qVrU2W6W6dk7bcP2+2Zd0U0VHlkBaG640qT7HQzDuu
         /utQTuhk0UO8c7LTkuiV4WG7EAhIayOCsgbCwcbf4ZdpfHVF/qf+49DonxfnaMoLHj07
         5aSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=aaF56VrexTd8aBCkv42xmQs8yjkLjyZTodXVA5XvS14=;
        b=qSOLoo3CVgI9cpNOnBTfosDqrw4iYnILVpIMettrM9yc1IyiKp+QMzNmwJcUR9iIcJ
         XjmZPOdd1ZA7DIbfbtfdG6bmvthlZNDyynQeWGkkC7BAMEWkdmSiTm+gcRFIxEKfcCYR
         +wS9bk6/UvKyEt12iWqfpBjcnOb020osTalaOGQllw3yFfh30UfUTtcox+jQrRV1Rksz
         Yt0EOfNZnAgF4px9DP58XF12XNTZ9QUTEQ3qMjoGOk1zsbtV5jFuFo7bmzsK/dvEN1bp
         oxsvBPuH4ENVdQMNAd6lfMKQOGoGsUOfQy/Foa3NOFDUAMkwssN1mFlmEtusYLFh3wnw
         brQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b6si2443958uaj.40.2019.05.25.08.31.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 25 May 2019 08:31:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:43431 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hUYe8-0007lu-AQ
	for alex.bennee@linaro.org; Sat, 25 May 2019 11:31:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35912)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1hUYdo-0007i4-04
	for qemu-arm@nongnu.org; Sat, 25 May 2019 11:31:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1hUYNt-0003CG-Jl
	for qemu-arm@nongnu.org; Sat, 25 May 2019 11:14:58 -0400
Received: from 6.mo177.mail-out.ovh.net ([46.105.51.249]:42899)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1hUYNs-0003Aw-RE
	for qemu-arm@nongnu.org; Sat, 25 May 2019 11:14:57 -0400
Received: from player698.ha.ovh.net (unknown [10.108.42.196])
	by mo177.mail-out.ovh.net (Postfix) with ESMTP id 7F758FA602
	for <qemu-arm@nongnu.org>; Sat, 25 May 2019 17:14:55 +0200 (CEST)
Received: from kaod.org (lfbn-1-10649-41.w90-89.abo.wanadoo.fr [90.89.235.41])
	(Authenticated sender: clg@kaod.org)
	by player698.ha.ovh.net (Postfix) with ESMTPSA id 0F4CA625A8E4;
	Sat, 25 May 2019 15:14:49 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 25 May 2019 17:12:40 +0200
Message-Id: <20190525151241.5017-19-clg@kaod.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190525151241.5017-1-clg@kaod.org>
References: <20190525151241.5017-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 6624513580534565649
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddruddukedgkeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.51.249
Subject: [Qemu-arm] [PATCH 18/19] aspeed/smc: inject errors in DMA checksum
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PsoTwfoORCgM

Emulate read errors in the DMA Checksum Register for high frequencies
and optimistic settings of the Read Timing Compensation Register. This
will help in tuning the SPI timing calibration algorithm.

The values below are those to expect from the first flash device of
the FMC controller of a palmetto-bmc machine.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/ssi/aspeed_smc.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 406c30c60b3f..4c162912cf62 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -866,6 +866,30 @@ static void aspeed_smc_dma_calibration(AspeedSMCStat=
e *s)
     s->regs[s->r_ctrl0 + cs] |=3D CE_CTRL_CLOCK_FREQ(hclk_div);
 }
=20
+static bool aspeed_smc_inject_read_failure(AspeedSMCState *s)
+{
+    uint8_t delay =3D
+        (s->regs[R_DMA_CTRL] >> DMA_CTRL_DELAY_SHIFT) & DMA_CTRL_DELAY_M=
ASK;
+    uint8_t hclk_mask =3D
+        (s->regs[R_DMA_CTRL] >> DMA_CTRL_FREQ_SHIFT) & DMA_CTRL_FREQ_MAS=
K;
+
+    /*
+     * Typical values of a palmetto-bmc machine.
+     */
+    switch (aspeed_smc_hclk_divisor(hclk_mask)) {
+    case 4 ... 16:
+        return false;
+    case 3: /* at least one HCLK cycle delay */
+        return (delay & 0x7) < 1;
+    case 2: /* at least two HCLK cycle delay */
+        return (delay & 0x7) < 2;
+    case 1: /* (> 100MHz) is above the max freq of the controller */
+        return true;
+    default:
+        g_assert_not_reached();
+    }
+}
+
 /*
  * Accumulate the result of the reads to provide a checksum that will
  * be used to validate the read timing settings.
@@ -903,6 +927,11 @@ static void aspeed_smc_dma_checksum(AspeedSMCState *=
s)
         s->regs[R_DMA_FLASH_ADDR] +=3D 4;
         s->regs[R_DMA_LEN] -=3D 4;
     }
+
+    if (aspeed_smc_inject_read_failure(s)) {
+        s->regs[R_DMA_CHECKSUM] =3D 0xbadc0de;
+    }
+
 }
=20
 static void aspeed_smc_dma_rw(AspeedSMCState *s)
--=20
2.20.1

