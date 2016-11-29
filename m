Received: by 10.25.150.194 with SMTP id y185csp2470619lfd;
        Tue, 29 Nov 2016 09:42:41 -0800 (PST)
X-Received: by 10.200.38.39 with SMTP id u36mr27736165qtu.31.1480441361256;
        Tue, 29 Nov 2016 09:42:41 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o1si28063188qte.133.2016.11.29.09.42.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Nov 2016 09:42:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38443 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cBmQR-0007M9-Up
	for alex.bennee@linaro.org; Tue, 29 Nov 2016 12:42:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47035)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cBmQN-0007KV-2g
	for qemu-arm@nongnu.org; Tue, 29 Nov 2016 12:42:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cBmQM-0001S9-6C
	for qemu-arm@nongnu.org; Tue, 29 Nov 2016 12:42:35 -0500
Received: from 2.mo69.mail-out.ovh.net ([178.33.251.80]:37732)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1cBmQL-0001Rm-Vp
	for qemu-arm@nongnu.org; Tue, 29 Nov 2016 12:42:34 -0500
Received: from player699.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo69.mail-out.ovh.net (Postfix) with ESMTP id AF577CE40
	for <qemu-arm@nongnu.org>; Tue, 29 Nov 2016 18:42:32 +0100 (CET)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player699.ha.ovh.net (Postfix) with ESMTPSA id 4C73624006E;
	Tue, 29 Nov 2016 18:42:24 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Nov 2016 18:42:01 +0100
Message-Id: <1480441323-31417-3-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1480441323-31417-1-git-send-email-clg@kaod.org>
References: <1480441323-31417-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 13693194669944179473
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrfeejgddvfeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 178.33.251.80
Subject: [Qemu-arm] [RFC PATCH 2/4] net/ftgmac100: add a 'aspeed' property
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
X-TUID: EWWGN4Et/X4e

The Aspeed SoCs have a different definition of the end of the ring
buffer bit. Add a property to specify which set of bits should be used
by the NIC.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
---
 hw/net/ftgmac100.c         | 19 +++++++++++++++----
 include/hw/net/ftgmac100.h |  3 +++
 2 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
index 4a7f865f226b..fceeffcb7a7f 100644
--- a/hw/net/ftgmac100.c
+++ b/hw/net/ftgmac100.c
@@ -112,6 +112,7 @@ struct ftgmac100_txdes {
 #define FTGMAC100_TXDES0_CRC_ERR         (1 << 19)
 #define FTGMAC100_TXDES0_LTS             (1 << 28)
 #define FTGMAC100_TXDES0_FTS             (1 << 29)
+#define FTGMAC100_TXDES0_EDOTR_ASPEED    (1 << 30)
 #define FTGMAC100_TXDES0_TXDMA_OWN       (1 << 31)
=20
 #define FTGMAC100_TXDES1_VLANTAG_CI(x)   ((x) & 0xffff)
@@ -147,6 +148,7 @@ struct ftgmac100_rxdes {
 #define FTGMAC100_RXDES0_PAUSE_FRAME     (1 << 25)
 #define FTGMAC100_RXDES0_LRS             (1 << 28)
 #define FTGMAC100_RXDES0_FRS             (1 << 29)
+#define FTGMAC100_RXDES0_EDORR_ASPEED    (1 << 30)
 #define FTGMAC100_RXDES0_RXPKT_RDY       (1 << 31)
=20
 #define FTGMAC100_RXDES1_VLANTAG_CI      0xffff
@@ -373,7 +375,7 @@ static uint32_t ftgmac100_find_txdes(Ftgmac100State *=
s, uint32_t addr)
=20
     while (1) {
         ftgmac100_read_bd(&bd, addr);
-        if (bd.des0 & (FTGMAC100_TXDES0_FTS | FTGMAC100_TXDES0_EDOTR)) {
+        if (bd.des0 & (FTGMAC100_TXDES0_FTS | s->txdes0_edotr)) {
             break;
         }
         addr +=3D sizeof(Ftgmac100Desc);
@@ -427,7 +429,7 @@ static void ftgmac100_do_tx(Ftgmac100State *s)
         /* Write back the modified descriptor.  */
         ftgmac100_write_bd(&bd, addr);
         /* Advance to the next descriptor.  */
-        if (bd.des0 & FTGMAC100_TXDES0_EDOTR) {
+        if (bd.des0 & s->txdes0_edotr) {
             addr =3D s->tx_ring;
         } else {
             addr +=3D sizeof(Ftgmac100Desc);
@@ -448,7 +450,7 @@ static void ftgmac100_enable_rx(Ftgmac100State *s)
     while (1) {
         ftgmac100_read_bd(&bd, s->rx_descriptor);
         full =3D (bd.des0 & FTGMAC100_RXDES0_RXPKT_RDY);
-        if (!full || bd.des0 & FTGMAC100_TXDES0_EDOTR) {
+        if (!full || bd.des0 & s->txdes0_edotr) {
             break;
         }
         s->rx_descriptor +=3D sizeof(Ftgmac100Desc);
@@ -739,7 +741,7 @@ static ssize_t ftgmac100_receive(NetClientState *nc, =
const uint8_t *buf,
             s->isr |=3D FTGMAC100_INT_RPKT_FIFO;
         }
         ftgmac100_write_bd(&bd, addr);
-        if (bd.des0 & FTGMAC100_RXDES0_EDORR) {
+        if (bd.des0 & s->rxdes0_edorr) {
             addr =3D s->rx_ring;
         } else {
             addr +=3D sizeof(Ftgmac100Desc);
@@ -781,6 +783,14 @@ static void ftgmac100_realize(DeviceState *dev, Erro=
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
@@ -824,6 +834,7 @@ static const VMStateDescription vmstate_ftgmac100 =3D=
 {
 };
=20
 static Property ftgmac100_properties[] =3D {
+    DEFINE_PROP_BOOL("aspeed", Ftgmac100State, aspeed, false),
     DEFINE_NIC_PROPERTIES(Ftgmac100State, conf),
     DEFINE_PROP_END_OF_LIST(),
 };
diff --git a/include/hw/net/ftgmac100.h b/include/hw/net/ftgmac100.h
index 1aa22de9e450..7476011f0657 100644
--- a/include/hw/net/ftgmac100.h
+++ b/include/hw/net/ftgmac100.h
@@ -46,6 +46,9 @@ typedef struct Ftgmac100State {
     uint32_t phy_int;
     uint32_t phy_int_mask;
=20
+    bool aspeed;
+    uint32_t txdes0_edotr;
+    uint32_t rxdes0_edorr;
 } Ftgmac100State;
=20
 #endif
--=20
2.7.4

