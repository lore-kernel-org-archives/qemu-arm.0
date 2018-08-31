Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp480863wrd;
        Fri, 31 Aug 2018 04:23:13 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdahN8dJH1dxLzri+7p8hucjtwW6SvyCcPKhWz7V5UMYLcv5LigoNslYZyN776kLPFYRqpzS
X-Received: by 2002:ac8:269b:: with SMTP id 27-v6mr15848816qto.281.1535714593391;
        Fri, 31 Aug 2018 04:23:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535714593; cv=none;
        d=google.com; s=arc-20160816;
        b=mcNhbZ3gaG9lGAFoMddTvZd6W+trCwgJOneDiyOfv2xsXc0w8fuqj4JMuwZ26Dkjbf
         VDel07gq5/34cS344mI5gq6AOSelEg5YLIV2dA2aqBhBc5gLZMmRFZJ08DZ6eofKaYRj
         wbXHFfiKb2UfstHG+cQpucdCcIR7XKaqfoeWtmcF7yH2Pbq+yFDFTUi/3QD05io2ZP4R
         upuuTGQiZqurko+Gm0p10OLyHwQdhCk/U4YoJCNpykHhvcdKJcMEsSWj9XMFSqkcLb/s
         W8ve7tk5knpQcE+f5jRJvGcK66O454hARx63lkIs/bes8pB9FXPJzR+/9lRxDiq4MGYj
         xw/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=MAfdBwKOM5uOrYr6X4W0rn0xcD3AU0uKud2jvS36mKE=;
        b=pXGtUldj+LONvD6VtEmD7Rgmpsh5YFpdxzko5vNxOr3KaCmionUJPTVHi29m3Rue3+
         Kjyd+Vkjtj5dUXTSJrWkwepMYoU9WNg1CMlv97D7bCYlFRL/32QCDe6x1UBIwuwpeZId
         h6y3sk1SGG6eDySJSuur5PbVGF3iZRGqAAV1Encm5y70/Zlo9+uz8Sqfm+NxnFZr0EEN
         Z57Gksj5e2OV+/n+opM9yP8X5I4Y1K/VTIlV0qZo9BfqQfdDYPzXqGx6Ik1uDQAFp/xb
         qhjib43Mm5d5Fw7NK8h4joOdQex+n9wo0b5SKJESv0ZdO/ZvA4OpiHoKJib8oxtVVjUD
         PIXg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i3-v6si900600qkf.13.2018.08.31.04.23.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 31 Aug 2018 04:23:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53081 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fvhWC-0005Rz-Ti
	for alex.bennee@linaro.org; Fri, 31 Aug 2018 07:23:12 -0400
Received: from eggs.gnu.org ([208.118.235.92]:37282)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fvhVt-0004kf-IB
	for qemu-arm@nongnu.org; Fri, 31 Aug 2018 07:22:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fvhPP-0004c7-Pg
	for qemu-arm@nongnu.org; Fri, 31 Aug 2018 07:16:17 -0400
Received: from 10.mo6.mail-out.ovh.net ([87.98.157.236]:41574)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1fvhPP-0004bm-Iv
	for qemu-arm@nongnu.org; Fri, 31 Aug 2018 07:16:11 -0400
Received: from player714.ha.ovh.net (unknown [10.109.159.222])
	by mo6.mail-out.ovh.net (Postfix) with ESMTP id 0361E17976A
	for <qemu-arm@nongnu.org>; Fri, 31 Aug 2018 13:16:09 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-1-10605-110.w90-89.abo.wanadoo.fr
	[90.89.196.110]) (Authenticated sender: clg@kaod.org)
	by player714.ha.ovh.net (Postfix) with ESMTPSA id 796F23C00C7;
	Fri, 31 Aug 2018 13:16:00 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-devel@nongnu.org
Date: Fri, 31 Aug 2018 13:15:54 +0200
Message-Id: <20180831111555.15008-1-clg@kaod.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180831103816.13479-1-clg@kaod.org>
References: <20180831103816.13479-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 2556074264368876352
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtjedrhedtgdeflecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 87.98.157.236
Subject: [Qemu-arm] [PATCH 10/11] aspeed/smc: inject errors in DMA checksum
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
	Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
	Joel Stanley <joel@jms.id.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nTIXKMLMmg6X

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
index 983066f5ad1d..da2fedfcd3cd 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -745,6 +745,30 @@ static void aspeed_smc_dma_calibration(AspeedSMCStat=
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
@@ -774,6 +798,11 @@ static void aspeed_smc_dma_checksum(AspeedSMCState *=
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
2.17.1

