Received: by 10.25.150.194 with SMTP id y185csp2418289lfd;
        Tue, 29 Nov 2016 07:59:03 -0800 (PST)
X-Received: by 10.200.42.232 with SMTP id c37mr26819274qta.145.1480435143509;
        Tue, 29 Nov 2016 07:59:03 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r68si35189397qkc.242.2016.11.29.07.59.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Nov 2016 07:59:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37764 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cBkoA-0001E8-7w
	for alex.bennee@linaro.org; Tue, 29 Nov 2016 10:59:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39676)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cBkcT-0007iC-Cd
	for qemu-arm@nongnu.org; Tue, 29 Nov 2016 10:46:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cBkcP-0005Qf-DP
	for qemu-arm@nongnu.org; Tue, 29 Nov 2016 10:46:57 -0500
Received: from 15.mo1.mail-out.ovh.net ([188.165.38.232]:59095)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1cBkcP-0005Pv-6O
	for qemu-arm@nongnu.org; Tue, 29 Nov 2016 10:46:53 -0500
Received: from player795.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo1.mail-out.ovh.net (Postfix) with ESMTP id CA3EA1F914
	for <qemu-arm@nongnu.org>; Tue, 29 Nov 2016 16:46:51 +0100 (CET)
Received: from hermes.lab.toulouse-stg.fr.ibm.com
	(deibp9eh1--blueice2n7.emea.ibm.com [195.212.29.169])
	(Authenticated sender: clg@kaod.org)
	by player795.ha.ovh.net (Postfix) with ESMTPSA id 6F7331200B2;
	Tue, 29 Nov 2016 16:46:43 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Nov 2016 16:43:53 +0100
Message-Id: <1480434248-27138-16-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1480434248-27138-1-git-send-email-clg@kaod.org>
References: <1480434248-27138-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 11739476854661548817
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrfeejgddvtdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 188.165.38.232
Subject: [Qemu-arm] [PATCH for-2.9 15/30] aspeed/smc: introduce a
 aspeed_smc_flash_update_cs() helper
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
	Marcin Krzeminski <marcin.krzeminski@nokia.com>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UhPUT9R08WGF

aspeed_smc_update_cs() was uselessly looping on all CS to update their
status.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/ssi/aspeed_smc.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 66622f198a2f..1c6c5089f265 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -414,15 +414,6 @@ static void aspeed_smc_flash_update_cs(AspeedSMCFlas=
h *fl)
     qemu_set_irq(s->cs_lines[fl->id], aspeed_smc_is_ce_stop_active(fl));
 }
=20
-static void aspeed_smc_update_cs(const AspeedSMCState *s)
-{
-    int i;
-
-    for (i =3D 0; i < s->num_cs; ++i) {
-        aspeed_smc_flash_update_cs(&s->flashes[i]);
-    }
-}
-
 static void aspeed_smc_reset(DeviceState *d)
 {
     AspeedSMCState *s =3D ASPEED_SMC(d);
@@ -436,6 +427,7 @@ static void aspeed_smc_reset(DeviceState *d)
     /* Unselect all slaves */
     for (i =3D 0; i < s->num_cs; ++i) {
         s->regs[s->r_ctrl0 + i] |=3D CTRL_CE_STOP_ACTIVE;
+        qemu_set_irq(s->cs_lines[i], true);
     }
=20
     /* setup default segment register values for all */
@@ -443,8 +435,6 @@ static void aspeed_smc_reset(DeviceState *d)
         s->regs[R_SEG_ADDR0 + i] =3D
             aspeed_smc_segment_to_reg(&s->ctrl->segments[i]);
     }
-
-    aspeed_smc_update_cs(s);
 }
=20
 static uint64_t aspeed_smc_read(void *opaque, hwaddr addr, unsigned int =
size)
@@ -494,8 +484,9 @@ static void aspeed_smc_write(void *opaque, hwaddr add=
r, uint64_t data,
         addr =3D=3D s->r_ce_ctrl) {
         s->regs[addr] =3D value;
     } else if (addr >=3D s->r_ctrl0 && addr < s->r_ctrl0 + s->num_cs) {
+        int cs =3D addr - s->r_ctrl0;
         s->regs[addr] =3D value;
-        aspeed_smc_update_cs(s);
+        aspeed_smc_flash_update_cs(&s->flashes[cs]);
     } else if (addr >=3D R_SEG_ADDR0 &&
                addr < R_SEG_ADDR0 + s->ctrl->max_slaves) {
         int cs =3D addr - R_SEG_ADDR0;
--=20
2.7.4

