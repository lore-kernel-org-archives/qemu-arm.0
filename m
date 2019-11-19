Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp587185lfc;
        Tue, 19 Nov 2019 06:15:18 -0800 (PST)
X-Google-Smtp-Source: APXvYqzV+XGwujHLAA40yNHnBQseRPvHLYr87LOOaSgX/Z5kmZGUBV7ylGooPBEXoBdaWhK0RBMO
X-Received: by 2002:a0c:b062:: with SMTP id l31mr31647977qvc.43.1574172918806;
        Tue, 19 Nov 2019 06:15:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574172918; cv=none;
        d=google.com; s=arc-20160816;
        b=j/WkkVSJQQYTzDe8m8k3udG4L77Mm46BPqLfKf4KbOcCr3z1UJVduC6XfBmLS3OlKD
         Pr8++THM0WlSjir2IOYeeh+fEhvUSGJmi+PYq9NcLr1Izjk7e/CAJG2dN3rNh9/J5nTL
         Gk+a2BQ04EUolv9RNl13CevlTwX3CJNs20bJFm8Hd4XoI7+dCzTdlYqriynGoO6RmT5T
         L/9T5RSzyUlu+f3P3jmMPk2T1rtZ9eHLTYkZNvUvOsxRfrP11iWDjKKeJM2btYD5jBY1
         mvFrbpr1cakrZlzsHmjTaO4xabF5bH8FSZTFefWi71wiYH7xavOcIwSMhgdg71bMRfrm
         2Qzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=sW+Bf+Jz77i8sM9Qw9sDuPzwOcQuiD68DTpsdgJaS0c=;
        b=u1Jg+I4q31l/G1XNz2czzFGTj+4ME/fwZIIdDlEasUPnkIBagYGIvRnF4LnYli8HtV
         Vzb8c1+hpXVmZyB+w14EkpOtOgyi1gXhuTFfeZuZONGfUbDhwP82C/23gBzuC1RBrfL7
         S01ezrIfe3m2Nab19yhN22zVjvfF0vpTUZZ35NBTTXJMqHT3LyHqH0fa1V8IkF3Nuuw7
         9OTQryqjb7GQIujEY95HkTaeif9yDdTQkOAGuvbFSnTkzx7Ga+bf/1+bkGpZ+rXgVLcw
         tOYYFeFacCZWOEKwGWH9MjLhrs+oOoeP4d7DlJkuGR5ipUkacjNtJuvDEISNfz6zbHWf
         VYcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y3si12745950qvf.205.2019.11.19.06.15.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Nov 2019 06:15:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iX4Hl-0008UJ-CZ
	for alex.bennee@linaro.org; Tue, 19 Nov 2019 09:15:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42111)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iX4GJ-0006wl-GS
 for qemu-arm@nongnu.org; Tue, 19 Nov 2019 09:13:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iX4GI-0005bf-Bh
 for qemu-arm@nongnu.org; Tue, 19 Nov 2019 09:13:47 -0500
Received: from 9.mo6.mail-out.ovh.net ([87.98.171.146]:60975)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iX4GI-0005b7-69
 for qemu-arm@nongnu.org; Tue, 19 Nov 2019 09:13:46 -0500
Received: from player795.ha.ovh.net (unknown [10.109.146.1])
 by mo6.mail-out.ovh.net (Postfix) with ESMTP id 5F1421ED3E1
 for <qemu-arm@nongnu.org>; Tue, 19 Nov 2019 15:13:44 +0100 (CET)
Received: from kaod.org (deibp9eh1--blueice1n4.emea.ibm.com [195.212.29.166])
 (Authenticated sender: clg@kaod.org)
 by player795.ha.ovh.net (Postfix) with ESMTPSA id 45A4EC18ACC4;
 Tue, 19 Nov 2019 14:13:37 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 10/17] aspeed/smc: Restore default AHB window mapping at reset
Date: Tue, 19 Nov 2019 15:12:04 +0100
Message-Id: <20191119141211.25716-11-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191119141211.25716-1-clg@kaod.org>
References: <20191119141211.25716-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 17913067520693668625
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudegkedgiedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdqfffguegfifdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpudelhedrvdduvddrvdelrdduieeinecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejleehrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghenucevlhhushhtvghrufhiiigvpeeh
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 87.98.171.146
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
X-TUID: 88vHQXXH2Yzo

The current model only restores the Segment Register values but leaves
the previous CS mapping behind. Introduce a helper setting the
register value and mapping the region at the requested address. Use
this helper when a Segment register is set and at reset.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
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

