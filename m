Received: by 10.80.163.71 with SMTP id 65csp200922edn;
        Fri, 9 Sep 2016 09:35:29 -0700 (PDT)
X-Received: by 10.55.191.2 with SMTP id p2mr4878394qkf.77.1473438929575;
        Fri, 09 Sep 2016 09:35:29 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m32si2546619qtb.117.2016.09.09.09.35.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Sep 2016 09:35:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59040 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1biOm0-000444-Tb
	for alex.bennee@linaro.org; Fri, 09 Sep 2016 12:35:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53732)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1biObd-0003Zy-FE
	for qemu-devel@nongnu.org; Fri, 09 Sep 2016 12:24:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1biObX-00067i-SP
	for qemu-devel@nongnu.org; Fri, 09 Sep 2016 12:24:44 -0400
Received: from 8.mo178.mail-out.ovh.net ([46.105.74.227]:43284)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1biObX-00067U-NK
	for qemu-devel@nongnu.org; Fri, 09 Sep 2016 12:24:39 -0400
Received: from player714.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo178.mail-out.ovh.net (Postfix) with ESMTP id 4875BFFC95D
	for <qemu-devel@nongnu.org>; Fri,  9 Sep 2016 18:24:39 +0200 (CEST)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player714.ha.ovh.net (Postfix) with ESMTPSA id 081E93C0073;
	Fri,  9 Sep 2016 18:24:34 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Fri,  9 Sep 2016 18:22:57 +0200
Message-Id: <1473438177-26079-15-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1473438177-26079-1-git-send-email-clg@kaod.org>
References: <1473438177-26079-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 16305000979872189201
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeluddrieeggddutddvucdltddurdefledtrddttddmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 46.105.74.227
Subject: [Qemu-devel] [PATCH v5 14/14] aspeed: allocate RAM after the memory
 controller has checked the size
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
X-TUID: i7m2Lnaz02Iy

If the RAM size is invalid, the memory controller will use a default
value.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 562bbb253391..6b18c7f1727c 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -108,11 +108,6 @@ static void aspeed_board_init(MachineState *machine,
=20
     sc =3D ASPEED_SOC_GET_CLASS(&bmc->soc);
=20
-    memory_region_allocate_system_memory(&bmc->ram, NULL, "ram", ram_siz=
e);
-    memory_region_add_subregion(get_system_memory(), sc->info->sdram_bas=
e,
-                                &bmc->ram);
-    object_property_add_const_link(OBJECT(&bmc->soc), "ram", OBJECT(&bmc=
->ram),
-                                   &error_abort);
     object_property_set_int(OBJECT(&bmc->soc), ram_size, "ram-size",
                            &error_abort);
     object_property_set_int(OBJECT(&bmc->soc), cfg->hw_strap1, "hw-strap=
1",
@@ -120,6 +115,19 @@ static void aspeed_board_init(MachineState *machine,
     object_property_set_bool(OBJECT(&bmc->soc), true, "realized",
                              &error_abort);
=20
+    /*
+     * Allocate RAM after the memory controller has checked the size
+     * was valid. If not, a default value is used.
+     */
+    ram_size =3D object_property_get_int(OBJECT(&bmc->soc), "ram-size",
+                                       &error_abort);
+
+    memory_region_allocate_system_memory(&bmc->ram, NULL, "ram", ram_siz=
e);
+    memory_region_add_subregion(get_system_memory(), sc->info->sdram_bas=
e,
+                                &bmc->ram);
+    object_property_add_const_link(OBJECT(&bmc->soc), "ram", OBJECT(&bmc=
->ram),
+                                   &error_abort);
+
     aspeed_board_init_flashes(&bmc->soc.smc, "n25q256a", &error_abort);
     aspeed_board_init_flashes(&bmc->soc.spi, "mx25l25635e", &error_abort=
);
=20
--=20
2.7.4

