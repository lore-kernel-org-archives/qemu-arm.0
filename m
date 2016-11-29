Received: by 10.25.150.194 with SMTP id y185csp2419410lfd;
        Tue, 29 Nov 2016 08:01:06 -0800 (PST)
X-Received: by 10.55.190.1 with SMTP id o1mr24037511qkf.305.1480435266183;
        Tue, 29 Nov 2016 08:01:06 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p86si35248730qki.104.2016.11.29.08.01.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Nov 2016 08:01:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37776 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cBkq8-0002Vi-SF
	for alex.bennee@linaro.org; Tue, 29 Nov 2016 11:01:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39741)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cBkcg-0007rK-2g
	for qemu-devel@nongnu.org; Tue, 29 Nov 2016 10:47:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cBkcb-0005Vz-IA
	for qemu-devel@nongnu.org; Tue, 29 Nov 2016 10:47:10 -0500
Received: from 9.mo1.mail-out.ovh.net ([178.32.108.172]:52198)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1cBkcb-0005VH-C4
	for qemu-devel@nongnu.org; Tue, 29 Nov 2016 10:47:05 -0500
Received: from player795.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo1.mail-out.ovh.net (Postfix) with ESMTP id 32E661F575
	for <qemu-devel@nongnu.org>; Tue, 29 Nov 2016 16:47:00 +0100 (CET)
Received: from hermes.lab.toulouse-stg.fr.ibm.com
	(deibp9eh1--blueice2n7.emea.ibm.com [195.212.29.169])
	(Authenticated sender: clg@kaod.org)
	by player795.ha.ovh.net (Postfix) with ESMTPSA id EAD00120091;
	Tue, 29 Nov 2016 16:46:51 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Nov 2016 16:43:54 +0100
Message-Id: <1480434248-27138-17-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1480434248-27138-1-git-send-email-clg@kaod.org>
References: <1480434248-27138-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 11742010128600304401
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrfeejgddvtdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 178.32.108.172
Subject: [Qemu-devel] [PATCH for-2.9 16/30] aspeed/smc: autostrap CE0/1
 configuration
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
X-TUID: L65zUpJzZ954

HW autodetects the type and the size of the first and second flash
modules of the FMC controller.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
---
 hw/ssi/aspeed_smc.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 1c6c5089f265..72a44150b0a1 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -39,11 +39,14 @@
 #define   CONF_ENABLE_W2       18
 #define   CONF_ENABLE_W1       17
 #define   CONF_ENABLE_W0       16
-#define   CONF_FLASH_TYPE4     9
-#define   CONF_FLASH_TYPE3     7
-#define   CONF_FLASH_TYPE2     5
-#define   CONF_FLASH_TYPE1     3
-#define   CONF_FLASH_TYPE0     1
+#define   CONF_FLASH_TYPE4     8
+#define   CONF_FLASH_TYPE3     6
+#define   CONF_FLASH_TYPE2     4
+#define   CONF_FLASH_TYPE1     2
+#define   CONF_FLASH_TYPE0     0
+#define      CONF_FLASH_TYPE_NOR   0x0
+#define      CONF_FLASH_TYPE_NAND  0x1
+#define      CONF_FLASH_TYPE_SPI   0x2
=20
 /* CE Control Register */
 #define R_CE_CTRL            (0x04 / 4)
@@ -435,6 +438,19 @@ static void aspeed_smc_reset(DeviceState *d)
         s->regs[R_SEG_ADDR0 + i] =3D
             aspeed_smc_segment_to_reg(&s->ctrl->segments[i]);
     }
+
+    /* CE0 and CE1 HW strapping for FMC controllers : SPI flash type
+     * and 4BYTE mode
+     */
+    if (s->ctrl->segments =3D=3D aspeed_segments_fmc ||
+        s->ctrl->segments =3D=3D aspeed_segments_ast2500_fmc) {
+        s->regs[s->r_conf] |=3D (CONF_FLASH_TYPE_SPI << CONF_FLASH_TYPE0=
);
+        s->regs[s->r_conf] |=3D (CONF_FLASH_TYPE_SPI << CONF_FLASH_TYPE1=
);
+
+        /* We should be able to detect the flash size in some ways. */
+        s->regs[s->r_ce_ctrl] |=3D (1 << (CTRL_EXTENDED0));
+        s->regs[s->r_ce_ctrl] |=3D (1 << (CTRL_EXTENDED1));
+    }
 }
=20
 static uint64_t aspeed_smc_read(void *opaque, hwaddr addr, unsigned int =
size)
--=20
2.7.4

