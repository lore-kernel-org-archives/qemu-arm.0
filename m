Received: by 10.80.163.71 with SMTP id 65csp200907edn;
        Fri, 9 Sep 2016 09:35:25 -0700 (PDT)
X-Received: by 10.55.159.77 with SMTP id i74mr4935178qke.60.1473438925454;
        Fri, 09 Sep 2016 09:35:25 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t7si2549535qkb.186.2016.09.09.09.35.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Sep 2016 09:35:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59039 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1biOlw-00040s-Ph
	for alex.bennee@linaro.org; Fri, 09 Sep 2016 12:35:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53616)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1biObN-0003EX-TS
	for qemu-devel@nongnu.org; Fri, 09 Sep 2016 12:24:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1biObH-00062a-Rn
	for qemu-devel@nongnu.org; Fri, 09 Sep 2016 12:24:28 -0400
Received: from 9.mo178.mail-out.ovh.net ([46.105.75.45]:59726)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1biObH-00062Q-LK
	for qemu-devel@nongnu.org; Fri, 09 Sep 2016 12:24:23 -0400
Received: from player714.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo178.mail-out.ovh.net (Postfix) with ESMTP id 3A4D5FFC8F7
	for <qemu-devel@nongnu.org>; Fri,  9 Sep 2016 18:24:23 +0200 (CEST)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player714.ha.ovh.net (Postfix) with ESMTPSA id C10283C0065;
	Fri,  9 Sep 2016 18:24:17 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Fri,  9 Sep 2016 18:22:54 +0200
Message-Id: <1473438177-26079-12-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1473438177-26079-1-git-send-email-clg@kaod.org>
References: <1473438177-26079-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 16300497377393150737
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeluddrieeggddutddvucdltddurdefledtrddttddmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 46.105.75.45
Subject: [Qemu-devel] [PATCH v5 11/14] aspeed: calculate the RAM size bits
 at realize time
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6AUSgHlEcrws

There is no need to do this at each reset as the RAM size will not
change.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/misc/aspeed_sdmc.c         | 16 ++++++++++++++--
 include/hw/misc/aspeed_sdmc.h |  1 +
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/hw/misc/aspeed_sdmc.c b/hw/misc/aspeed_sdmc.c
index 244e5c0dc5ef..1d2825237728 100644
--- a/hw/misc/aspeed_sdmc.c
+++ b/hw/misc/aspeed_sdmc.c
@@ -192,7 +192,7 @@ static void aspeed_sdmc_reset(DeviceState *dev)
     case AST2400_A0_SILICON_REV:
         s->regs[R_CONF] |=3D
             ASPEED_SDMC_VGA_COMPAT |
-            ASPEED_SDMC_DRAM_SIZE(ast2400_rambits());
+            ASPEED_SDMC_DRAM_SIZE(s->ram_bits);
         break;
=20
     case AST2500_A0_SILICON_REV:
@@ -200,7 +200,7 @@ static void aspeed_sdmc_reset(DeviceState *dev)
         s->regs[R_CONF] |=3D
             ASPEED_SDMC_HW_VERSION(1) |
             ASPEED_SDMC_VGA_APERTURE(ASPEED_SDMC_VGA_64MB) |
-            ASPEED_SDMC_DRAM_SIZE(ast2500_rambits());
+            ASPEED_SDMC_DRAM_SIZE(s->ram_bits);
         break;
=20
     default:
@@ -219,6 +219,18 @@ static void aspeed_sdmc_realize(DeviceState *dev, Er=
ror **errp)
         return;
     }
=20
+    switch (s->silicon_rev) {
+    case AST2400_A0_SILICON_REV:
+        s->ram_bits =3D ast2400_rambits();
+        break;
+    case AST2500_A0_SILICON_REV:
+    case AST2500_A1_SILICON_REV:
+        s->ram_bits =3D ast2500_rambits();
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
     memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_sdmc_ops, s,
                           TYPE_ASPEED_SDMC, 0x1000);
     sysbus_init_mmio(sbd, &s->iomem);
diff --git a/include/hw/misc/aspeed_sdmc.h b/include/hw/misc/aspeed_sdmc.=
h
index 7e081f6d2b86..df7dce0edddf 100644
--- a/include/hw/misc/aspeed_sdmc.h
+++ b/include/hw/misc/aspeed_sdmc.h
@@ -25,6 +25,7 @@ typedef struct AspeedSDMCState {
=20
     uint32_t regs[ASPEED_SDMC_NR_REGS];
     uint32_t silicon_rev;
+    uint32_t ram_bits;
=20
 } AspeedSDMCState;
=20
--=20
2.7.4

