Received: by 10.25.150.194 with SMTP id y185csp2417163lfd;
        Tue, 29 Nov 2016 07:56:32 -0800 (PST)
X-Received: by 10.55.201.154 with SMTP id m26mr26921414qkl.59.1480434992071;
        Tue, 29 Nov 2016 07:56:32 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y142si35170688qkb.180.2016.11.29.07.56.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Nov 2016 07:56:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37748 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cBkli-0006tx-Qj
	for alex.bennee@linaro.org; Tue, 29 Nov 2016 10:56:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39558)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cBkc6-0007PH-57
	for qemu-devel@nongnu.org; Tue, 29 Nov 2016 10:46:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cBkc2-0005H2-2p
	for qemu-devel@nongnu.org; Tue, 29 Nov 2016 10:46:34 -0500
Received: from 19.mo1.mail-out.ovh.net ([178.32.97.206]:45690)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1cBkc1-0005GS-TN
	for qemu-devel@nongnu.org; Tue, 29 Nov 2016 10:46:30 -0500
Received: from player795.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo1.mail-out.ovh.net (Postfix) with ESMTP id 4698D1F410
	for <qemu-devel@nongnu.org>; Tue, 29 Nov 2016 16:46:28 +0100 (CET)
Received: from hermes.lab.toulouse-stg.fr.ibm.com
	(deibp9eh1--blueice2n7.emea.ibm.com [195.212.29.169])
	(Authenticated sender: clg@kaod.org)
	by player795.ha.ovh.net (Postfix) with ESMTPSA id 98779120079;
	Tue, 29 Nov 2016 16:46:20 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Nov 2016 16:43:50 +0100
Message-Id: <1480434248-27138-13-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1480434248-27138-1-git-send-email-clg@kaod.org>
References: <1480434248-27138-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 11733002930373823249
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrfeejgddvtdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 178.32.97.206
Subject: [Qemu-devel] [PATCH for-2.9 12/30] aspeed/smc: improve segment
 register support
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
Cc: Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Andrew Jeffery <andrew@aj.id.au>,
	Marcin Krzeminski <marcin.krzeminski@nokia.com>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Wn8KTCVdazeW

The HW does not enforce all the rules in the specs and allows a few
"curious" setups like zero size segments and overlaps. So change the
model to be in sync but keep the warnings which are always interesting
for debug.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
---
 hw/ssi/aspeed_smc.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 6e8403ebc246..78f5aed53247 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -253,7 +253,8 @@ static void aspeed_smc_flash_set_segment(AspeedSMCSta=
te *s, int cs,
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: Tried to change CS0 start address to 0x%"
                       HWADDR_PRIx "\n", s->ctrl->name, seg.addr);
-        return;
+        seg.addr =3D s->ctrl->flash_window_base;
+        new =3D aspeed_smc_segment_to_reg(&seg);
     }
=20
     /*
@@ -267,8 +268,10 @@ static void aspeed_smc_flash_set_segment(AspeedSMCSt=
ate *s, int cs,
         s->ctrl->segments[cs].size) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: Tried to change CS%d end address to 0x%"
-                      HWADDR_PRIx "\n", s->ctrl->name, cs, seg.addr);
-        return;
+                      HWADDR_PRIx "\n", s->ctrl->name, cs, seg.addr + se=
g.size);
+        seg.size =3D s->ctrl->segments[cs].addr + s->ctrl->segments[cs].=
size -
+            seg.addr;
+        new =3D aspeed_smc_segment_to_reg(&seg);
     }
=20
     /* Keep the segment in the overall flash window */
@@ -281,16 +284,14 @@ static void aspeed_smc_flash_set_segment(AspeedSMCS=
tate *s, int cs,
     }
=20
     /* Check start address vs. alignment */
-    if (seg.addr % seg.size) {
+    if (seg.size && !QEMU_IS_ALIGNED(seg.addr, seg.size)) {
         qemu_log_mask(LOG_GUEST_ERROR, "%s: new segment for CS%d is not =
"
                       "aligned : [ 0x%"HWADDR_PRIx" - 0x%"HWADDR_PRIx" ]=
\n",
                       s->ctrl->name, cs, seg.addr, seg.addr + seg.size);
     }
=20
-    /* And segments should not overlap */
-    if (aspeed_smc_flash_overlap(s, &seg, cs)) {
-        return;
-    }
+    /* And segments should not overlap (in the specs) */
+    aspeed_smc_flash_overlap(s, &seg, cs);
=20
     /* All should be fine now to move the region */
     memory_region_transaction_begin();
--=20
2.7.4

