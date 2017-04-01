Received: by 10.25.15.230 with SMTP id 99csp3476815lfp;
        Sat, 1 Apr 2017 06:00:04 -0700 (PDT)
X-Received: by 10.55.165.11 with SMTP id o11mr7148992qke.193.1491051604076;
        Sat, 01 Apr 2017 06:00:04 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 46si7284422qte.210.2017.04.01.06.00.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 01 Apr 2017 06:00:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51231 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cuIdN-0002rJ-C8
	for alex.bennee@linaro.org; Sat, 01 Apr 2017 09:00:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41877)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cuId6-0002ku-GX
	for qemu-arm@nongnu.org; Sat, 01 Apr 2017 08:59:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cuId2-0004Yj-4m
	for qemu-arm@nongnu.org; Sat, 01 Apr 2017 08:59:44 -0400
Received: from 18.mo5.mail-out.ovh.net ([178.33.45.10]:41473)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1cuId1-0004Xo-Ur
	for qemu-arm@nongnu.org; Sat, 01 Apr 2017 08:59:40 -0400
Received: from player799.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo5.mail-out.ovh.net (Postfix) with ESMTP id 89791E450E
	for <qemu-arm@nongnu.org>; Sat,  1 Apr 2017 14:59:38 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-10647-27.w90-89.abo.wanadoo.fr
	[90.89.233.27]) (Authenticated sender: clg@kaod.org)
	by player799.ha.ovh.net (Postfix) with ESMTPSA id 018D5520085;
	Sat,  1 Apr 2017 14:59:25 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Sat,  1 Apr 2017 14:57:55 +0200
Message-Id: <1491051477-10455-3-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1491051477-10455-1-git-send-email-clg@kaod.org>
References: <1491051477-10455-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 11833770971013221137
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelhedrleefgdehkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 178.33.45.10
Subject: [Qemu-arm] [PATCH 2/4] net/ftgmac100: add a 'aspeed' property
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
X-TUID: JkKnk6Gx2C8k

The Aspeed SoCs have a different definition of the end of the ring
buffer bit. Add a property to specify which set of bits should be used
by the NIC.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/net/ftgmac100.c         | 19 ++++++++++++++++---
 include/hw/net/ftgmac100.h |  4 ++++
 2 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
index 331e87391962..8867c435ba9d 100644
--- a/hw/net/ftgmac100.c
+++ b/hw/net/ftgmac100.c
@@ -133,6 +133,7 @@ struct ftgmac100_txdes {
 #define FTGMAC100_TXDES0_CRC_ERR         (1 << 19)
 #define FTGMAC100_TXDES0_LTS             (1 << 28)
 #define FTGMAC100_TXDES0_FTS             (1 << 29)
+#define FTGMAC100_TXDES0_EDOTR_ASPEED    (1 << 30)
 #define FTGMAC100_TXDES0_TXDMA_OWN       (1 << 31)
=20
 #define FTGMAC100_TXDES1_VLANTAG_CI(x)   ((x) & 0xffff)
@@ -168,6 +169,7 @@ struct ftgmac100_rxdes {
 #define FTGMAC100_RXDES0_PAUSE_FRAME     (1 << 25)
 #define FTGMAC100_RXDES0_LRS             (1 << 28)
 #define FTGMAC100_RXDES0_FRS             (1 << 29)
+#define FTGMAC100_RXDES0_EDORR_ASPEED    (1 << 30)
 #define FTGMAC100_RXDES0_RXPKT_RDY       (1 << 31)
=20
 #define FTGMAC100_RXDES1_VLANTAG_CI      0xffff
@@ -387,7 +389,7 @@ static uint32_t ftgmac100_find_txdes(Ftgmac100State *=
s, uint32_t addr)
=20
     while (1) {
         ftgmac100_read_bd(&bd, addr);
-        if (bd.des0 & (FTGMAC100_TXDES0_FTS | FTGMAC100_TXDES0_EDOTR)) {
+        if (bd.des0 & (FTGMAC100_TXDES0_FTS | s->txdes0_edotr)) {
             break;
         }
         addr +=3D sizeof(Ftgmac100Desc);
@@ -453,7 +455,7 @@ static void ftgmac100_do_tx(Ftgmac100State *s, uint32=
_t tx_ring,
         /* Write back the modified descriptor.  */
         ftgmac100_write_bd(&bd, addr);
         /* Advance to the next descriptor.  */
-        if (bd.des0 & FTGMAC100_TXDES0_EDOTR) {
+        if (bd.des0 & s->txdes0_edotr) {
             addr =3D tx_ring;
         } else {
             addr +=3D sizeof(Ftgmac100Desc);
@@ -856,7 +858,7 @@ static ssize_t ftgmac100_receive(NetClientState *nc, =
const uint8_t *buf,
             s->isr |=3D FTGMAC100_INT_RPKT_FIFO;
         }
         ftgmac100_write_bd(&bd, addr);
-        if (bd.des0 & FTGMAC100_RXDES0_EDORR) {
+        if (bd.des0 & s->rxdes0_edorr) {
             addr =3D s->rx_ring;
         } else {
             addr +=3D sizeof(Ftgmac100Desc);
@@ -897,6 +899,14 @@ static void ftgmac100_realize(DeviceState *dev, Erro=
r **errp)
     Ftgmac100State *s =3D FTGMAC100(dev);
     SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
=20
+    if (s->aspeed) {
+        s->txdes0_edotr =3D FTGMAC100_TXDES0_EDOTR_ASPEED;
+        s->rxdes0_edorr =3D FTGMAC100_RXDES0_EDORR_ASPEED;
+    } else {
+        s->txdes0_edotr =3D FTGMAC100_TXDES0_EDOTR;
+        s->rxdes0_edorr =3D FTGMAC100_RXDES0_EDORR;
+    }
+
     memory_region_init_io(&s->iomem, OBJECT(dev), &ftgmac100_ops, s,
                           TYPE_FTGMAC100, 0x2000);
     sysbus_init_mmio(sbd, &s->iomem);
@@ -941,11 +951,14 @@ static const VMStateDescription vmstate_ftgmac100 =3D=
 {
         VMSTATE_UINT32(phy_advertise, Ftgmac100State),
         VMSTATE_UINT32(phy_int, Ftgmac100State),
         VMSTATE_UINT32(phy_int_mask, Ftgmac100State),
+        VMSTATE_UINT32(txdes0_edotr, Ftgmac100State),
+        VMSTATE_UINT32(rxdes0_edorr, Ftgmac100State),
         VMSTATE_END_OF_LIST()
     }
 };
=20
 static Property ftgmac100_properties[] =3D {
+    DEFINE_PROP_BOOL("aspeed", Ftgmac100State, aspeed, false),
     DEFINE_NIC_PROPERTIES(Ftgmac100State, conf),
     DEFINE_PROP_END_OF_LIST(),
 };
diff --git a/include/hw/net/ftgmac100.h b/include/hw/net/ftgmac100.h
index 3bb4fe1a3ece..feb387bf0e2d 100644
--- a/include/hw/net/ftgmac100.h
+++ b/include/hw/net/ftgmac100.h
@@ -53,6 +53,10 @@ typedef struct Ftgmac100State {
     uint32_t phy_advertise;
     uint32_t phy_int;
     uint32_t phy_int_mask;
+
+    bool aspeed;
+    uint32_t txdes0_edotr;
+    uint32_t rxdes0_edorr;
 } Ftgmac100State;
=20
 #endif
--=20
2.7.4

