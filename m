Received: by 2002:adf:fb8f:0:0:0:0:0 with SMTP id a15csp5244390wrr;
        Thu, 14 Nov 2019 01:49:49 -0800 (PST)
X-Google-Smtp-Source: APXvYqxMYwznIe65oOIJIAboOZJeCYv4LA+C21qJSUPesJoazEDj+BDRNfHJykCNRrFQfPOoEpy1
X-Received: by 2002:a17:906:c797:: with SMTP id cw23mr7417634ejb.19.1573724989671;
        Thu, 14 Nov 2019 01:49:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573724989; cv=none;
        d=google.com; s=arc-20160816;
        b=vIDpSzAF9D/11p+GSHBkmm2vViHDIMPgSQAtclblQhJsvQ69V8MBzr9TLkIpgLs4p3
         hzy112UA9+R5rsqdgyfkU9gseeufBmT7USmaaBlLGvrNnukEispEHjU/XcGNNrW5cNh3
         7ePThEuqIDk2UEz1HFmfWPIJtJjdcObHhqwJorGc8xtwYA24eSvDB2DB64ge5Pg1AElb
         yPxeg2i22J/9kTeHW2JON+7yiU/nt4/FJJTA+KkvmgR3c8uhL/geyF4NjDPHp7luIqSu
         IU07nbNTwIyZUh/Bp3K5Qlau4JCKx7AhyLFlISZwldoJBiClKxJ0I5kPpoI67CDmpTpt
         Vr/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=9FUVJSjvatEiT/eS50h/OxSefLk8gFOimniR6V4KFkk=;
        b=i2FXvPsOlv1cAC8vwbt6rsiqAuS2tX6Dw4lE/hENgQDoy0VfLAQd7zsBX2MCbrc4zT
         YPnWSvQR/iJxGTgjzJuxsXOPAd8uZRNL/h+irsmwkv3xpamGxQatZ9hPzcrejd3pyeZM
         FPkmS3c7NIL7+F6DbLfh8ITpoNt7IsRKfD04cIbQAmZGAkg0xxJDKqSBxzYt2jjvsUyf
         Agjja3pjh4krS0PYRbkat1SCZ6zEk2VsYakHJ2hza2GOzLQhTp1H1J7cj4km/4I7LjX8
         qbEEX3wtR2RPQ1kS8y5AI48Pl/oOD1659ihMWz/2kNCvwyF/7KMawJIfsF5kaw5W7DeE
         DNKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o15si3047115ejh.124.2019.11.14.01.49.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Nov 2019 01:49:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iVBl6-0001yY-9L
	for alex.bennee@linaro.org; Thu, 14 Nov 2019 04:49:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37268)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iVBhg-0007if-FC
 for qemu-arm@nongnu.org; Thu, 14 Nov 2019 04:46:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iVBhe-0004Oq-NA
 for qemu-arm@nongnu.org; Thu, 14 Nov 2019 04:46:16 -0500
Received: from 10.mo4.mail-out.ovh.net ([188.165.33.109]:57736)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iVBhe-0004Iv-HA
 for qemu-arm@nongnu.org; Thu, 14 Nov 2019 04:46:14 -0500
Received: from player737.ha.ovh.net (unknown [10.108.42.82])
 by mo4.mail-out.ovh.net (Postfix) with ESMTP id 99652212A40
 for <qemu-arm@nongnu.org>; Thu, 14 Nov 2019 10:46:05 +0100 (CET)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player737.ha.ovh.net (Postfix) with ESMTPSA id 75B0F2A7832C;
 Thu, 14 Nov 2019 09:45:58 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 1/5] aspeed/smc: Restore default AHB window mapping at reset
Date: Thu, 14 Nov 2019 10:45:40 +0100
Message-Id: <20191114094544.30114-2-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191114094544.30114-1-clg@kaod.org>
References: <20191114094544.30114-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 2476135371268131601
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudeffedgtdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdqfffguegfifdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpledtrdejiedrhedtrddvvdefnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejfeejrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghenucevlhhushhtvghrufhiiigvpedt
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 188.165.33.109
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
X-TUID: kKBrOwncbc5e

The current model only restores the Segment Register values but leaves
the previous CS mapping behind. Introduce a helper setting the
register value and mapping the region at the requested address. Use
this helper when a Segment register is set and at reset.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/ssi/aspeed_smc.c | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index f0c7bbbad302..955ec21852ac 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -475,10 +475,26 @@ static bool aspeed_smc_flash_overlap(const AspeedSM=
CState *s,
     return false;
 }
=20
+static void aspeed_smc_flash_set_segment_region(AspeedSMCState *s, int c=
s,
+                                                uint64_t regval)
+{
+    AspeedSMCFlash *fl =3D &s->flashes[cs];
+    AspeedSegments seg;
+
+    s->ctrl->reg_to_segment(s, regval, &seg);
+
+    memory_region_transaction_begin();
+    memory_region_set_size(&fl->mmio, seg.size);
+    memory_region_set_address(&fl->mmio, seg.addr - s->ctrl->flash_windo=
w_base);
+    memory_region_set_enabled(&fl->mmio, true);
+    memory_region_transaction_commit();
+
+    s->regs[R_SEG_ADDR0 + cs] =3D regval;
+}
+
 static void aspeed_smc_flash_set_segment(AspeedSMCState *s, int cs,
                                          uint64_t new)
 {
-    AspeedSMCFlash *fl =3D &s->flashes[cs];
     AspeedSegments seg;
=20
     s->ctrl->reg_to_segment(s, new, &seg);
@@ -529,13 +545,7 @@ static void aspeed_smc_flash_set_segment(AspeedSMCSt=
ate *s, int cs,
     aspeed_smc_flash_overlap(s, &seg, cs);
=20
     /* All should be fine now to move the region */
-    memory_region_transaction_begin();
-    memory_region_set_size(&fl->mmio, seg.size);
-    memory_region_set_address(&fl->mmio, seg.addr - s->ctrl->flash_windo=
w_base);
-    memory_region_set_enabled(&fl->mmio, true);
-    memory_region_transaction_commit();
-
-    s->regs[R_SEG_ADDR0 + cs] =3D new;
+    aspeed_smc_flash_set_segment_region(s, cs, new);
 }
=20
 static uint64_t aspeed_smc_flash_default_read(void *opaque, hwaddr addr,
@@ -897,10 +907,10 @@ static void aspeed_smc_reset(DeviceState *d)
         qemu_set_irq(s->cs_lines[i], true);
     }
=20
-    /* setup default segment register values for all */
+    /* setup the default segment register values and regions for all */
     for (i =3D 0; i < s->ctrl->max_slaves; ++i) {
-        s->regs[R_SEG_ADDR0 + i] =3D
-            s->ctrl->segment_to_reg(s, &s->ctrl->segments[i]);
+        aspeed_smc_flash_set_segment_region(s, i,
+                    s->ctrl->segment_to_reg(s, &s->ctrl->segments[i]));
     }
=20
     /* HW strapping flash type for the AST2600 controllers  */
--=20
2.21.0

