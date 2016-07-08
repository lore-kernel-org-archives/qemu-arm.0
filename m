Received: by 10.25.21.156 with SMTP id 28csp322021lfv;
        Fri, 8 Jul 2016 09:10:18 -0700 (PDT)
X-Received: by 10.200.36.13 with SMTP id c13mr9950310qtc.88.1467994218653;
        Fri, 08 Jul 2016 09:10:18 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n57si2379547qtc.24.2016.07.08.09.10.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Jul 2016 09:10:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46614 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bLYM5-0001Op-U6
	for alex.bennee@linaro.org; Fri, 08 Jul 2016 12:10:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51944)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bLYJl-0008N1-Ak
	for qemu-devel@nongnu.org; Fri, 08 Jul 2016 12:07:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bLYJk-0002HK-7X
	for qemu-devel@nongnu.org; Fri, 08 Jul 2016 12:07:53 -0400
Received: from 9.mo179.mail-out.ovh.net ([46.105.76.148]:33087)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bLYJj-0002Gv-Sl
	for qemu-devel@nongnu.org; Fri, 08 Jul 2016 12:07:52 -0400
Received: from player715.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo179.mail-out.ovh.net (Postfix) with ESMTP id 625AD100C43F
	for <qemu-devel@nongnu.org>; Fri,  8 Jul 2016 18:07:51 +0200 (CEST)
Received: from hermes.ibm.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player715.ha.ovh.net (Postfix) with ESMTPSA id 044C41C007D;
	Fri,  8 Jul 2016 18:07:44 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Fri,  8 Jul 2016 18:06:53 +0200
Message-Id: <1467994016-11678-3-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1467994016-11678-1-git-send-email-clg@kaod.org>
References: <1467994016-11678-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 14976439086490880785
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrfedtgdelvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 46.105.76.148
Subject: [Qemu-devel] [PATCH 2/5] ast2400: replace
 aspeed_smc_is_implemented()
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
X-TUID: BH540AGGHVn7

aspeed_smc_is_implemented() filters invalid registers in a peculiar
way. Let's remove it and open code the if conditions. It serves the
same purpose, the aesthetic is better, and new registers can easily be
added.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/ssi/aspeed_smc.c | 35 +++++++++++++++--------------------
 1 file changed, 15 insertions(+), 20 deletions(-)

diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index a371e302d448..854474b642ea 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -281,12 +281,6 @@ static void aspeed_smc_reset(DeviceState *d)
     aspeed_smc_update_cs(s);
 }
=20
-static bool aspeed_smc_is_implemented(AspeedSMCState *s, hwaddr addr)
-{
-    return (addr =3D=3D s->r_conf || addr =3D=3D s->r_timings || addr =3D=
=3D s->r_ce_ctrl ||
-            (addr >=3D s->r_ctrl0 && addr < s->r_ctrl0 + s->num_cs));
-}
-
 static uint64_t aspeed_smc_read(void *opaque, hwaddr addr, unsigned int =
size)
 {
     AspeedSMCState *s =3D ASPEED_SMC(opaque);
@@ -300,13 +294,16 @@ static uint64_t aspeed_smc_read(void *opaque, hwadd=
r addr, unsigned int size)
         return 0;
     }
=20
-    if (!aspeed_smc_is_implemented(s, addr)) {
+    if (addr =3D=3D s->r_conf ||
+        addr =3D=3D s->r_timings ||
+        addr =3D=3D s->r_ce_ctrl ||
+        (addr >=3D s->r_ctrl0 && addr < s->r_ctrl0 + s->num_cs)) {
+        return s->regs[addr];
+    } else {
         qemu_log_mask(LOG_UNIMP, "%s: not implemented: 0x%" HWADDR_PRIx =
"\n",
-                __func__, addr);
+                      __func__, addr);
         return 0;
     }
-
-    return s->regs[addr];
 }
=20
 static void aspeed_smc_write(void *opaque, hwaddr addr, uint64_t data,
@@ -324,20 +321,18 @@ static void aspeed_smc_write(void *opaque, hwaddr a=
ddr, uint64_t data,
         return;
     }
=20
-    if (!aspeed_smc_is_implemented(s, addr)) {
+    if (addr =3D=3D s->r_conf ||
+        addr =3D=3D s->r_timings ||
+        addr =3D=3D s->r_ce_ctrl) {
+        s->regs[addr] =3D value;
+    } else if (addr >=3D s->r_ctrl0 && addr < s->r_ctrl0 + s->num_cs) {
+        s->regs[addr] =3D value;
+        aspeed_smc_update_cs(s);
+    } else {
         qemu_log_mask(LOG_UNIMP, "%s: not implemented: 0x%" HWADDR_PRIx =
"\n",
                       __func__, addr);
         return;
     }
-
-    /*
-     * Not much to do apart from storing the value and set the cs
-     * lines if the register is a controlling one.
-     */
-    s->regs[addr] =3D value;
-    if (addr >=3D s->r_ctrl0 && addr < s->r_ctrl0 + s->num_cs) {
-        aspeed_smc_update_cs(s);
-    }
 }
=20
 static const MemoryRegionOps aspeed_smc_ops =3D {
--=20
2.1.4

