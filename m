Received: by 10.25.0.144 with SMTP id 138csp659548lfa;
        Thu, 13 Apr 2017 02:42:43 -0700 (PDT)
X-Received: by 10.55.17.84 with SMTP id b81mr1678312qkh.167.1492076563061;
        Thu, 13 Apr 2017 02:42:43 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v123si19632703qka.184.2017.04.13.02.42.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 13 Apr 2017 02:42:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48283 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cybGy-00023i-CP
	for alex.bennee@linaro.org; Thu, 13 Apr 2017 05:42:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40784)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cybGj-0001xj-2b
	for qemu-arm@nongnu.org; Thu, 13 Apr 2017 05:42:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cybGf-0000oW-3v
	for qemu-arm@nongnu.org; Thu, 13 Apr 2017 05:42:25 -0400
Received: from 3.mo178.mail-out.ovh.net ([46.105.44.197]:39354)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1cybGe-0000o9-Qk
	for qemu-arm@nongnu.org; Thu, 13 Apr 2017 05:42:21 -0400
Received: from player715.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo178.mail-out.ovh.net (Postfix) with ESMTP id 593973110E
	for <qemu-arm@nongnu.org>; Thu, 13 Apr 2017 11:42:19 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-1-10647-27.w90-89.abo.wanadoo.fr
	[90.89.233.27]) (Authenticated sender: clg@kaod.org)
	by player715.ha.ovh.net (Postfix) with ESMTPSA id 255DF1C007D;
	Thu, 13 Apr 2017 11:42:11 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Apr 2017 11:41:50 +0200
Message-Id: <1492076514-28821-2-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1492076514-28821-1-git-send-email-clg@kaod.org>
References: <1492076514-28821-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 5186739395961457425
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeliedrudekgddujecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.44.197
Subject: [Qemu-arm] [PATCH v2 1/5] hw/net: add MII definitions
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
Cc: Jan Kiszka <jan.kiszka@siemens.com>, Jason Wang <jasowang@redhat.com>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Dmitry Fleytman <dmitry@daynix.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NkZ1EZiqC7Kc

This adds comments on the Basic mode control and status registers bit
definitions. It also adds a couple of bits for 1000BASE-T and the
RealTek 8211E PHY for the FTGMAC100 model to use.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/net/mii.h | 71 +++++++++++++++++++++++++++++++++++++++-------=
------
 1 file changed, 53 insertions(+), 18 deletions(-)

diff --git a/include/hw/net/mii.h b/include/hw/net/mii.h
index 9fdd7bbe75f1..6ce48a6d7802 100644
--- a/include/hw/net/mii.h
+++ b/include/hw/net/mii.h
@@ -22,13 +22,20 @@
 #define MII_H
=20
 /* PHY registers */
-#define MII_BMCR            0
-#define MII_BMSR            1
-#define MII_PHYID1          2
-#define MII_PHYID2          3
-#define MII_ANAR            4
-#define MII_ANLPAR          5
-#define MII_ANER            6
+#define MII_BMCR            0  /* Basic mode control register */
+#define MII_BMSR            1  /* Basic mode status register */
+#define MII_PHYID1          2  /* ID register 1 */
+#define MII_PHYID2          3  /* ID register 2 */
+#define MII_ANAR            4  /* Autonegotiation advertisement */
+#define MII_ANLPAR          5  /* Autonegotiation lnk partner abilities =
*/
+#define MII_ANER            6  /* Autonegotiation expansion */
+#define MII_ANNP            7  /* Autonegotiation next page */
+#define MII_ANLPRNP         8  /* Autonegotiation link partner rx next p=
age */
+#define MII_CTRL1000        9  /* 1000BASE-T control */
+#define MII_STAT1000        10 /* 1000BASE-T status */
+#define MII_MDDACR          13 /* MMD access control */
+#define MII_MDDAADR         14 /* MMD access address data */
+#define MII_EXTSTAT         15 /* Extended Status */
 #define MII_NSR             16
 #define MII_LBREMR          17
 #define MII_REC             18
@@ -38,19 +45,33 @@
 /* PHY registers fields */
 #define MII_BMCR_RESET      (1 << 15)
 #define MII_BMCR_LOOPBACK   (1 << 14)
-#define MII_BMCR_SPEED      (1 << 13)
-#define MII_BMCR_AUTOEN     (1 << 12)
-#define MII_BMCR_FD         (1 << 8)
+#define MII_BMCR_SPEED100   (1 << 13)  /* LSB of Speed (100) */
+#define MII_BMCR_SPEED      MII_BMCR_SPEED100
+#define MII_BMCR_AUTOEN     (1 << 12) /* Autonegotiation enable */
+#define MII_BMCR_PDOWN      (1 << 11) /* Enable low power state */
+#define MII_BMCR_ISOLATE    (1 << 10) /* Isolate data paths from MII */
+#define MII_BMCR_ANRESTART  (1 << 9)  /* Auto negotiation restart */
+#define MII_BMCR_FD         (1 << 8)  /* Set duplex mode */
+#define MII_BMCR_CTST       (1 << 7)  /* Collision test */
+#define MII_BMCR_SPEED1000  (1 << 6)  /* MSB of Speed (1000) */
=20
-#define MII_BMSR_100TX_FD   (1 << 14)
-#define MII_BMSR_100TX_HD   (1 << 13)
-#define MII_BMSR_10T_FD     (1 << 12)
-#define MII_BMSR_10T_HD     (1 << 11)
-#define MII_BMSR_MFPS       (1 << 6)
-#define MII_BMSR_AN_COMP    (1 << 5)
-#define MII_BMSR_AUTONEG    (1 << 3)
-#define MII_BMSR_LINK_ST    (1 << 2)
+#define MII_BMSR_100TX_FD   (1 << 14) /* Can do 100mbps, full-duplex */
+#define MII_BMSR_100TX_HD   (1 << 13) /* Can do 100mbps, half-duplex */
+#define MII_BMSR_10T_FD     (1 << 12) /* Can do 10mbps, full-duplex */
+#define MII_BMSR_10T_HD     (1 << 11) /* Can do 10mbps, half-duplex */
+#define MII_BMSR_100T2_FD   (1 << 10) /* Can do 100mbps T2, full-duplex =
*/
+#define MII_BMSR_100T2_HD   (1 << 9)  /* Can do 100mbps T2, half-duplex =
*/
+#define MII_BMSR_EXTSTAT    (1 << 8)  /* Extended status in register 15 =
*/
+#define MII_BMSR_MFPS       (1 << 6)  /* MII Frame Preamble Suppression =
*/
+#define MII_BMSR_AN_COMP    (1 << 5)  /* Auto-negotiation complete */
+#define MII_BMSR_RFAULT     (1 << 4)  /* Remote fault */
+#define MII_BMSR_AUTONEG    (1 << 3)  /* Able to do auto-negotiation */
+#define MII_BMSR_LINK_ST    (1 << 2)  /* Link status */
+#define MII_BMSR_JABBER     (1 << 1)  /* Jabber detected */
+#define MII_BMSR_EXTCAP     (1 << 0)  /* Ext-reg capability */
=20
+#define MII_ANAR_PAUSE_ASYM (1 << 11) /* Try for asymetric pause */
+#define MII_ANAR_PAUSE      (1 << 10) /* Try for pause */
 #define MII_ANAR_TXFD       (1 << 8)
 #define MII_ANAR_TX         (1 << 7)
 #define MII_ANAR_10FD       (1 << 6)
@@ -58,17 +79,31 @@
 #define MII_ANAR_CSMACD     (1 << 0)
=20
 #define MII_ANLPAR_ACK      (1 << 14)
+#define MII_ANLPAR_PAUSEASY (1 << 11) /* can pause asymmetrically */
+#define MII_ANLPAR_PAUSE    (1 << 10) /* can pause */
 #define MII_ANLPAR_TXFD     (1 << 8)
 #define MII_ANLPAR_TX       (1 << 7)
 #define MII_ANLPAR_10FD     (1 << 6)
 #define MII_ANLPAR_10       (1 << 5)
 #define MII_ANLPAR_CSMACD   (1 << 0)
=20
+#define MII_ANER_NWAY       (1 << 0) /* Can do N-way auto-nego */
+
+#define MII_CTRL1000_FULL   (1 << 9)  /* 1000BASE-T full duplex */
+#define MII_CTRL1000_HALF   (1 << 8)  /* 1000BASE-T half duplex */
+
+#define MII_STAT1000_FULL   (1 << 11) /* 1000BASE-T full duplex */
+#define MII_STAT1000_HALF   (1 << 10) /* 1000BASE-T half duplex */
+
 /* List of vendor identifiers */
 /* RealTek 8201 */
 #define RTL8201CP_PHYID1    0x0000
 #define RTL8201CP_PHYID2    0x8201
=20
+/* RealTek 8211E */
+#define RTL8211E_PHYID1     0x001c
+#define RTL8211E_PHYID2     0xc915
+
 /* National Semiconductor DP83848 */
 #define DP83848_PHYID1      0x2000
 #define DP83848_PHYID2      0x5c90
--=20
2.7.4

