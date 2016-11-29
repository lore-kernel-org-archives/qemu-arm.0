Received: by 10.25.150.194 with SMTP id y185csp2470599lfd;
        Tue, 29 Nov 2016 09:42:38 -0800 (PST)
X-Received: by 10.237.44.67 with SMTP id f61mr28043439qtd.244.1480441358792;
        Tue, 29 Nov 2016 09:42:38 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e30si28091134qtd.47.2016.11.29.09.42.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Nov 2016 09:42:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38442 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cBmQP-0007KW-8T
	for alex.bennee@linaro.org; Tue, 29 Nov 2016 12:42:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46998)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cBmQI-0007Hw-Dm
	for qemu-arm@nongnu.org; Tue, 29 Nov 2016 12:42:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cBmQE-0001PI-AN
	for qemu-arm@nongnu.org; Tue, 29 Nov 2016 12:42:30 -0500
Received: from 3.mo69.mail-out.ovh.net ([188.165.52.203]:33917)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1cBmQD-0001Og-SE
	for qemu-arm@nongnu.org; Tue, 29 Nov 2016 12:42:26 -0500
Received: from player699.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo69.mail-out.ovh.net (Postfix) with ESMTP id 518B7CE91
	for <qemu-arm@nongnu.org>; Tue, 29 Nov 2016 18:42:24 +0100 (CET)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player699.ha.ovh.net (Postfix) with ESMTPSA id 2147C240090;
	Tue, 29 Nov 2016 18:42:15 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Nov 2016 18:42:00 +0100
Message-Id: <1480441323-31417-2-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1480441323-31417-1-git-send-email-clg@kaod.org>
References: <1480441323-31417-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 13690942867501189905
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrfeejgddvfeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 188.165.52.203
Subject: [Qemu-arm] [RFC PATCH 1/4] net: add FTGMAC100 support
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
X-TUID: HUYcO0rqgn2m

The FTGMAC100 device is an Ethernet controller configured and
controlled via a set of registers available on AHB bus. Packets are
transmitted and received using DMA ring buffers. There are a MAC and
MII/GMII interfaces.

The model is for the moment complete enough to satisfy the Linux
kernel but there are areas that need some more attention :

 - PHY registers
 - Automatic receive/transmit polling, no timers are used to poll the
   ring buffers descriptors. We just expect the qemu nic backend to
   push packets when they arrive.
 - CRC

And some are still on the TODO list (not used today in the drivers) :

 - Ethernet Address Filtering
 - Multicast
 - High priority queues
 - VLAN
 - NCSI, may be we could add n/w filters
 - etc.

The code is based on the Coldfire Fast Ethernet Controller model.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Tested-by: Andrew Jeffery <andrew@aj.id.au>
---
 default-configs/arm-softmmu.mak |   1 +
 hw/net/Makefile.objs            |   1 +
 hw/net/ftgmac100.c              | 855 ++++++++++++++++++++++++++++++++++=
++++++
 include/hw/net/ftgmac100.h      |  51 +++
 4 files changed, 908 insertions(+)
 create mode 100644 hw/net/ftgmac100.c
 create mode 100644 include/hw/net/ftgmac100.h

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmm=
u.mak
index 6de3e16a3e11..612f6e69f255 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -28,6 +28,7 @@ CONFIG_LAN9118=3Dy
 CONFIG_SMC91C111=3Dy
 CONFIG_ALLWINNER_EMAC=3Dy
 CONFIG_IMX_FEC=3Dy
+CONFIG_FTGMAC100=3Dy
 CONFIG_DS1338=3Dy
 CONFIG_PFLASH_CFI01=3Dy
 CONFIG_PFLASH_CFI02=3Dy
diff --git a/hw/net/Makefile.objs b/hw/net/Makefile.objs
index 610ed3e7ae64..7ca51d85a672 100644
--- a/hw/net/Makefile.objs
+++ b/hw/net/Makefile.objs
@@ -26,6 +26,7 @@ common-obj-$(CONFIG_IMX_FEC) +=3D imx_fec.o
 common-obj-$(CONFIG_CADENCE) +=3D cadence_gem.o
 common-obj-$(CONFIG_STELLARIS_ENET) +=3D stellaris_enet.o
 common-obj-$(CONFIG_LANCE) +=3D lance.o
+common-obj-$(CONFIG_FTGMAC100) +=3D ftgmac100.o
=20
 obj-$(CONFIG_ETRAXFS) +=3D etraxfs_eth.o
 obj-$(CONFIG_COLDFIRE) +=3D mcf_fec.o
diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
new file mode 100644
index 000000000000..4a7f865f226b
--- /dev/null
+++ b/hw/net/ftgmac100.c
@@ -0,0 +1,855 @@
+/*
+ * Faraday FTGMAC100 Gigabit Ethernet
+ *
+ * Copyright (C) 2016 IBM Corp.
+ *
+ * Based on Coldfire Fast Ethernet Controller emulation.
+ *
+ * Copyright (c) 2007 CodeSourcery.
+ *
+ * This code is licensed under the GPL version 2 or later. See the
+ * COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/net/ftgmac100.h"
+#include "sysemu/dma.h"
+#include "qemu/log.h"
+
+/* For crc32 */
+#include <zlib.h>
+
+/*
+ * FTGMAC100 registers
+ */
+#define FTGMAC100_ISR             0x00
+#define FTGMAC100_IER             0x04
+#define FTGMAC100_MAC_MADR        0x08
+#define FTGMAC100_MAC_LADR        0x0c
+
+#define FTGMAC100_NPTXPD          0x18
+#define FTGMAC100_RXPD            0x1C
+#define FTGMAC100_NPTXR_BADR      0x20
+#define FTGMAC100_RXR_BADR        0x24
+#define FTGMAC100_APTC            0x34
+#define FTGMAC100_RBSR            0x4c
+
+#define FTGMAC100_MACCR           0x50
+#define FTGMAC100_PHYCR           0x60
+#define FTGMAC100_PHYDATA         0x64
+
+/*
+ * Interrupt status register & interrupt enable register
+ */
+#define FTGMAC100_INT_RPKT_BUF    (1 << 0)
+#define FTGMAC100_INT_RPKT_FIFO   (1 << 1)
+#define FTGMAC100_INT_NO_RXBUF    (1 << 2)
+#define FTGMAC100_INT_RPKT_LOST   (1 << 3)
+#define FTGMAC100_INT_XPKT_ETH    (1 << 4)
+#define FTGMAC100_INT_XPKT_FIFO   (1 << 5)
+#define FTGMAC100_INT_NO_NPTXBUF  (1 << 6)
+#define FTGMAC100_INT_XPKT_LOST   (1 << 7)
+#define FTGMAC100_INT_AHB_ERR     (1 << 8)
+#define FTGMAC100_INT_PHYSTS_CHG  (1 << 9)
+#define FTGMAC100_INT_NO_HPTXBUF  (1 << 10)
+
+/*
+ * Automatic polling timer control register
+ */
+#define FTGMAC100_APTC_RXPOLL_CNT(x)        ((x) & 0xf)
+#define FTGMAC100_APTC_RXPOLL_TIME_SEL      (1 << 4)
+#define FTGMAC100_APTC_TXPOLL_CNT(x)        (((x) >> 8) & 0xf)
+#define FTGMAC100_APTC_TXPOLL_TIME_SEL      (1 << 12)
+
+/*
+ * PHY control register
+ */
+#define FTGMAC100_PHYCR_MIIRD               (1 << 26)
+#define FTGMAC100_PHYCR_MIIWR               (1 << 27)
+
+/*
+ * PHY data register
+ */
+#define FTGMAC100_PHYDATA_MIIWDATA(x)       ((x) & 0xffff)
+#define FTGMAC100_PHYDATA_MIIRDATA(phydata) (((phydata) >> 16) & 0xffff)
+
+/*
+ * MAC control register
+ */
+#define FTGMAC100_MACCR_TXDMA_EN         (1 << 0)
+#define FTGMAC100_MACCR_RXDMA_EN         (1 << 1)
+#define FTGMAC100_MACCR_TXMAC_EN         (1 << 2)
+#define FTGMAC100_MACCR_RXMAC_EN         (1 << 3)
+#define FTGMAC100_MACCR_RM_VLAN          (1 << 4)
+#define FTGMAC100_MACCR_HPTXR_EN         (1 << 5)
+#define FTGMAC100_MACCR_LOOP_EN          (1 << 6)
+#define FTGMAC100_MACCR_ENRX_IN_HALFTX   (1 << 7)
+#define FTGMAC100_MACCR_FULLDUP          (1 << 8)
+#define FTGMAC100_MACCR_GIGA_MODE        (1 << 9)
+#define FTGMAC100_MACCR_CRC_APD          (1 << 10)
+#define FTGMAC100_MACCR_RX_RUNT          (1 << 12)
+#define FTGMAC100_MACCR_JUMBO_LF         (1 << 13)
+#define FTGMAC100_MACCR_RX_ALL           (1 << 14)
+#define FTGMAC100_MACCR_HT_MULTI_EN      (1 << 15)
+#define FTGMAC100_MACCR_RX_MULTIPKT      (1 << 16)
+#define FTGMAC100_MACCR_RX_BROADPKT      (1 << 17)
+#define FTGMAC100_MACCR_DISCARD_CRCERR   (1 << 18)
+#define FTGMAC100_MACCR_FAST_MODE        (1 << 19)
+#define FTGMAC100_MACCR_SW_RST           (1 << 31)
+
+/*
+ * Transmit descriptor, aligned to 16 bytes
+ */
+struct ftgmac100_txdes {
+        unsigned int        txdes0;
+        unsigned int        txdes1;
+        unsigned int        txdes2;      /* not used by HW */
+        unsigned int        txdes3;      /* TXBUF_BADR */
+} __attribute__ ((aligned(16)));
+
+#define FTGMAC100_TXDES0_TXBUF_SIZE(x)   ((x) & 0x3fff)
+#define FTGMAC100_TXDES0_EDOTR           (1 << 15)
+#define FTGMAC100_TXDES0_CRC_ERR         (1 << 19)
+#define FTGMAC100_TXDES0_LTS             (1 << 28)
+#define FTGMAC100_TXDES0_FTS             (1 << 29)
+#define FTGMAC100_TXDES0_TXDMA_OWN       (1 << 31)
+
+#define FTGMAC100_TXDES1_VLANTAG_CI(x)   ((x) & 0xffff)
+#define FTGMAC100_TXDES1_INS_VLANTAG     (1 << 16)
+#define FTGMAC100_TXDES1_TCP_CHKSUM      (1 << 17)
+#define FTGMAC100_TXDES1_UDP_CHKSUM      (1 << 18)
+#define FTGMAC100_TXDES1_IP_CHKSUM       (1 << 19)
+#define FTGMAC100_TXDES1_LLC             (1 << 22)
+#define FTGMAC100_TXDES1_TX2FIC          (1 << 30)
+#define FTGMAC100_TXDES1_TXIC            (1 << 31)
+
+/*
+ * Receive descriptor, aligned to 16 bytes
+ */
+struct ftgmac100_rxdes {
+        unsigned int        rxdes0;
+        unsigned int        rxdes1;
+        unsigned int        rxdes2;      /* not used by HW */
+        unsigned int        rxdes3;      /* RXBUF_BADR */
+} __attribute__ ((aligned(16)));
+
+#define FTGMAC100_RXDES0_VDBC            0x3fff
+#define FTGMAC100_RXDES0_EDORR           (1 << 15)
+#define FTGMAC100_RXDES0_MULTICAST       (1 << 16)
+#define FTGMAC100_RXDES0_BROADCAST       (1 << 17)
+#define FTGMAC100_RXDES0_RX_ERR          (1 << 18)
+#define FTGMAC100_RXDES0_CRC_ERR         (1 << 19)
+#define FTGMAC100_RXDES0_FTL             (1 << 20)
+#define FTGMAC100_RXDES0_RUNT            (1 << 21)
+#define FTGMAC100_RXDES0_RX_ODD_NB       (1 << 22)
+#define FTGMAC100_RXDES0_FIFO_FULL       (1 << 23)
+#define FTGMAC100_RXDES0_PAUSE_OPCODE    (1 << 24)
+#define FTGMAC100_RXDES0_PAUSE_FRAME     (1 << 25)
+#define FTGMAC100_RXDES0_LRS             (1 << 28)
+#define FTGMAC100_RXDES0_FRS             (1 << 29)
+#define FTGMAC100_RXDES0_RXPKT_RDY       (1 << 31)
+
+#define FTGMAC100_RXDES1_VLANTAG_CI      0xffff
+#define FTGMAC100_RXDES1_PROT_MASK       (0x3 << 20)
+#define FTGMAC100_RXDES1_PROT_NONIP      (0x0 << 20)
+#define FTGMAC100_RXDES1_PROT_IP         (0x1 << 20)
+#define FTGMAC100_RXDES1_PROT_TCPIP      (0x2 << 20)
+#define FTGMAC100_RXDES1_PROT_UDPIP      (0x3 << 20)
+#define FTGMAC100_RXDES1_LLC             (1 << 22)
+#define FTGMAC100_RXDES1_DF              (1 << 23)
+#define FTGMAC100_RXDES1_VLANTAG_AVAIL   (1 << 24)
+#define FTGMAC100_RXDES1_TCP_CHKSUM_ERR  (1 << 25)
+#define FTGMAC100_RXDES1_UDP_CHKSUM_ERR  (1 << 26)
+#define FTGMAC100_RXDES1_IP_CHKSUM_ERR   (1 << 27)
+
+/*
+ * PHY values (to be defined elsewhere ...)
+ */
+#define PHY_INT_ENERGYON            (1 << 7)
+#define PHY_INT_AUTONEG_COMPLETE    (1 << 6)
+#define PHY_INT_FAULT               (1 << 5)
+#define PHY_INT_DOWN                (1 << 4)
+#define PHY_INT_AUTONEG_LP          (1 << 3)
+#define PHY_INT_PARFAULT            (1 << 2)
+#define PHY_INT_AUTONEG_PAGE        (1 << 1)
+
+/* Common Buffer Descriptor  */
+typedef struct {
+    uint32_t        des0;
+    uint32_t        des1;
+    uint32_t        des2;        /* not used by HW */
+    uint32_t        des3;        /* TXBUF_BADR */
+} Ftgmac100Desc  __attribute__ ((aligned(16)));
+
+/* max frame size is :
+ *
+ *   9216 for Jumbo frames (+ 4 for VLAN)
+ *   1518 for other frames (+ 4 for VLAN)
+ */
+#define FTGMAC100_MAX_FRAME_SIZE(s)                             \
+    ((s->maccr & FTGMAC100_MACCR_JUMBO_LF ? 9216 : 1518) + 4)
+
+static void ftgmac100_update_irq(Ftgmac100State *s);
+
+/*
+ * The MII phy could raise a GPIO to the processor which in turn
+ * could be handled as an interrpt by the OS.
+ * For now we don't handle any GPIO/interrupt line, so the OS will
+ * have to poll for the PHY status.
+ */
+static void phy_update_irq(Ftgmac100State *s)
+{
+    ftgmac100_update_irq(s);
+}
+
+static void phy_update_link(Ftgmac100State *s)
+{
+    /* Autonegotiation status mirrors link status.  */
+    if (qemu_get_queue(s->nic)->link_down) {
+        s->phy_status &=3D ~0x0024;
+        s->phy_int |=3D PHY_INT_DOWN;
+    } else {
+        s->phy_status |=3D 0x0024;
+        s->phy_int |=3D PHY_INT_ENERGYON;
+        s->phy_int |=3D PHY_INT_AUTONEG_COMPLETE;
+    }
+    phy_update_irq(s);
+}
+
+static void ftgmac100_set_link(NetClientState *nc)
+{
+    phy_update_link(FTGMAC100(qemu_get_nic_opaque(nc)));
+}
+
+static void phy_reset(Ftgmac100State *s)
+{
+    s->phy_status =3D 0x7809;
+    s->phy_control =3D 0x3000;
+    s->phy_advertise =3D 0x01e1;
+    s->phy_int_mask =3D 0;
+    s->phy_int =3D 0;
+    phy_update_link(s);
+}
+
+static uint32_t do_phy_read(Ftgmac100State *s, int reg)
+{
+    uint32_t val;
+
+    if (reg > 31) {
+        /* we only advertise one phy */
+        return 0;
+    }
+
+    switch (reg) {
+    case 0:     /* Basic Control */
+        val =3D s->phy_control;
+        break;
+    case 1:     /* Basic Status */
+        val =3D s->phy_status;
+        break;
+    case 2:     /* ID1 */
+        val =3D 0x0007;
+        break;
+    case 3:     /* ID2 */
+        val =3D 0xc0d1;
+        break;
+    case 4:     /* Auto-neg advertisement */
+        val =3D s->phy_advertise;
+        break;
+    case 5:     /* Auto-neg Link Partner Ability */
+        val =3D 0x0f71;
+        break;
+    case 6:     /* Auto-neg Expansion */
+        val =3D 1;
+        break;
+        val =3D 0x0800;
+        break;
+    case 29:    /* Interrupt source.  */
+        val =3D s->phy_int;
+        s->phy_int =3D 0;
+        phy_update_irq(s);
+        break;
+    case 30:    /* Interrupt mask */
+        val =3D s->phy_int_mask;
+        break;
+    case 0x0a: /* 1000BASE-T status  */
+    case 17:
+    case 18:
+    case 27:
+    case 31:
+        qemu_log_mask(LOG_UNIMP, "%s: reg %d not implemented\n",
+                      __func__, reg);
+        val =3D 0;
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad address at offset %d\n",
+                      __func__, reg);
+        val =3D 0;
+        break;
+    }
+
+    return val;
+}
+
+static void do_phy_write(Ftgmac100State *s, int reg, uint32_t val)
+{
+    if (reg > 31) {
+        /* we only advertise one phy */
+        return;
+    }
+
+    switch (reg) {
+    case 0:     /* Basic Control */
+        if (val & 0x8000) {
+            phy_reset(s);
+        } else {
+            s->phy_control =3D val & 0x7980;
+            /* Complete autonegotiation immediately.  */
+            if (val & 0x1000) {
+                s->phy_status |=3D 0x0020;
+            }
+        }
+        break;
+    case 4:     /* Auto-neg advertisement */
+        s->phy_advertise =3D (val & 0x2d7f) | 0x80;
+        break;
+    case 30:    /* Interrupt mask */
+        s->phy_int_mask =3D val & 0xff;
+        phy_update_irq(s);
+        break;
+    case 17:
+    case 18:
+    case 27:
+    case 31:
+        qemu_log_mask(LOG_UNIMP, "%s: reg %d not implemented\n",
+                      __func__, reg);
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad address at offset %d\n",
+                      __func__, reg);
+        break;
+    }
+}
+
+static void ftgmac100_read_bd(Ftgmac100Desc *bd, dma_addr_t addr)
+{
+    dma_memory_read(&address_space_memory, addr, bd, sizeof(*bd));
+    bd->des0 =3D le32_to_cpu(bd->des0);
+    bd->des1 =3D le32_to_cpu(bd->des1);
+    bd->des2 =3D le32_to_cpu(bd->des2);
+    bd->des3 =3D le32_to_cpu(bd->des3);
+}
+
+static void ftgmac100_write_bd(Ftgmac100Desc *bd, dma_addr_t addr)
+{
+    Ftgmac100Desc lebd;
+    lebd.des0 =3D cpu_to_le32(bd->des0);
+    lebd.des1 =3D cpu_to_le32(bd->des1);
+    lebd.des2 =3D cpu_to_le32(bd->des2);
+    lebd.des3 =3D cpu_to_le32(bd->des3);
+    dma_memory_write(&address_space_memory, addr, &lebd, sizeof(lebd));
+}
+
+static void ftgmac100_update_irq(Ftgmac100State *s)
+{
+    uint32_t active;
+    uint32_t changed;
+
+    active =3D s->isr & s->ier;
+    changed =3D active ^ s->irq_state;
+    if (changed) {
+        qemu_set_irq(s->irq, active);
+    }
+    s->irq_state =3D active;
+}
+
+/* Locate a possible first descriptor to transmit. When Linux resets
+ * the device, the indexes of ring buffers are cleared but the dma
+ * buffers are not, so we need to find a starting point.
+ */
+static uint32_t ftgmac100_find_txdes(Ftgmac100State *s, uint32_t addr)
+{
+    Ftgmac100Desc bd;
+
+    while (1) {
+        ftgmac100_read_bd(&bd, addr);
+        if (bd.des0 & (FTGMAC100_TXDES0_FTS | FTGMAC100_TXDES0_EDOTR)) {
+            break;
+        }
+        addr +=3D sizeof(Ftgmac100Desc);
+    }
+    return addr;
+}
+
+static void ftgmac100_do_tx(Ftgmac100State *s)
+{
+    int frame_size =3D 0;
+    uint8_t frame[FTGMAC100_MAX_FRAME_SIZE(s)];
+    uint8_t *ptr =3D frame;
+    uint32_t addr;
+
+    addr =3D ftgmac100_find_txdes(s, s->tx_descriptor);
+
+    while (1) {
+        Ftgmac100Desc bd;
+        int len;
+
+        ftgmac100_read_bd(&bd, addr);
+        if ((bd.des0 & FTGMAC100_TXDES0_TXDMA_OWN) =3D=3D 0) {
+            /* Run out of descriptors to transmit.  */
+            s->isr |=3D FTGMAC100_INT_NO_NPTXBUF;
+            break;
+        }
+        len =3D bd.des0 & 0x3FFF;
+        if (frame_size + len > FTGMAC100_MAX_FRAME_SIZE(s)) {
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: frame too big : %d bytes=
\n",
+                          __func__, len);
+            len =3D FTGMAC100_MAX_FRAME_SIZE(s) - frame_size;
+        }
+        dma_memory_read(&address_space_memory, bd.des3, ptr, len);
+        ptr +=3D len;
+        frame_size +=3D len;
+        if (bd.des0 & FTGMAC100_TXDES0_LTS) {
+            /* Last buffer in frame.  */
+            qemu_send_packet(qemu_get_queue(s->nic), frame, len);
+            ptr =3D frame;
+            frame_size =3D 0;
+            if (bd.des1 & FTGMAC100_TXDES1_TXIC) {
+                s->isr |=3D FTGMAC100_INT_XPKT_ETH;
+            }
+        }
+
+        if (bd.des1 & FTGMAC100_TXDES1_TX2FIC) {
+            s->isr |=3D FTGMAC100_INT_XPKT_FIFO;
+        }
+        bd.des0 &=3D ~FTGMAC100_TXDES0_TXDMA_OWN;
+
+        /* Write back the modified descriptor.  */
+        ftgmac100_write_bd(&bd, addr);
+        /* Advance to the next descriptor.  */
+        if (bd.des0 & FTGMAC100_TXDES0_EDOTR) {
+            addr =3D s->tx_ring;
+        } else {
+            addr +=3D sizeof(Ftgmac100Desc);
+        }
+    }
+
+    s->tx_descriptor =3D addr;
+
+    ftgmac100_update_irq(s);
+}
+
+static void ftgmac100_enable_rx(Ftgmac100State *s)
+{
+    Ftgmac100Desc bd;
+    uint32_t full;
+
+    /* Find an empty descriptor to use */
+    while (1) {
+        ftgmac100_read_bd(&bd, s->rx_descriptor);
+        full =3D (bd.des0 & FTGMAC100_RXDES0_RXPKT_RDY);
+        if (!full || bd.des0 & FTGMAC100_TXDES0_EDOTR) {
+            break;
+        }
+        s->rx_descriptor +=3D sizeof(Ftgmac100Desc);
+    }
+
+    s->rx_enabled =3D (full =3D=3D 0);
+    if (s->rx_enabled) {
+        qemu_flush_queued_packets(qemu_get_queue(s->nic));
+    }
+}
+
+/*
+ * This is purely informative. The HW can poll the RW (and RX) ring
+ * buffers for available descriptors but we don't need to trigger a
+ * timer for that in qemu.
+ */
+static uint32_t ftgmac100_rxpoll(Ftgmac100State *s)
+{
+    /* Polling times :
+     *
+     * Speed      TIME_SEL=3D0    TIME_SEL=3D1
+     *
+     *    10         51.2 ms      819.2 ms
+     *   100         5.12 ms      81.92 ms
+     *  1000        1.024 ms     16.384 ms
+     */
+    static const int div[] =3D { 20, 200, 1000 };
+
+    uint32_t cnt =3D 1024 * FTGMAC100_APTC_RXPOLL_CNT(s->aptcr);
+    uint32_t speed =3D (s->maccr & FTGMAC100_MACCR_FAST_MODE) ? 1 : 0;
+    uint32_t period;
+
+    if (s->aptcr & FTGMAC100_APTC_RXPOLL_TIME_SEL) {
+        cnt <<=3D 4;
+    }
+
+    if (s->maccr & FTGMAC100_MACCR_GIGA_MODE) {
+        speed =3D 2;
+    }
+
+    period =3D cnt / div[speed];
+
+    return period;
+}
+
+static void ftgmac100_reset(DeviceState *d)
+{
+    Ftgmac100State *s =3D FTGMAC100(d);
+
+    /* Reset the FTGMAC100 */
+    s->isr =3D 0;
+    s->ier =3D 0;
+    s->rx_enabled =3D 0;
+    s->maccr =3D 0;
+    s->rx_ring =3D 0;
+    s->rx_descriptor =3D 0;
+    s->rbsr =3D 0x640; /* HW default according to u-boot driver */
+    s->tx_ring =3D 0;
+    s->tx_descriptor =3D 0;
+    s->phycr =3D 0;
+    s->phydata =3D 0;
+    s->aptcr =3D 0;
+
+    /* and the PHY */
+    phy_reset(s);
+}
+
+static uint64_t ftgmac100_read(void *opaque, hwaddr addr, unsigned size)
+{
+    Ftgmac100State *s =3D FTGMAC100(opaque);
+
+    switch (addr & 0xff) {
+    case FTGMAC100_ISR:
+        return s->isr;
+    case FTGMAC100_IER:
+        return s->ier;
+    case FTGMAC100_MAC_MADR:
+        return (s->conf.macaddr.a[0] << 8)  | s->conf.macaddr.a[1];
+    case FTGMAC100_MAC_LADR:
+        return (s->conf.macaddr.a[2] << 24) | (s->conf.macaddr.a[3] << 1=
6) |
+               (s->conf.macaddr.a[4] << 8)  |  s->conf.macaddr.a[5];
+    case FTGMAC100_MACCR:
+        return s->maccr;
+    case FTGMAC100_PHYCR:
+        return s->phycr;
+    case FTGMAC100_PHYDATA:
+        return s->phydata;
+
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "[%s]%s: Bad address at offset 0x=
%"
+                      HWADDR_PRIx "\n", TYPE_FTGMAC100, __func__, addr);
+        return 0;
+    }
+}
+
+static void ftgmac100_write(void *opaque, hwaddr addr,
+                          uint64_t value, unsigned size)
+{
+    Ftgmac100State *s =3D FTGMAC100(opaque);
+
+    switch (addr & 0xff) {
+    case FTGMAC100_ISR: /* Interrupt status */
+        s->isr &=3D ~value;
+        break;
+    case FTGMAC100_IER: /* Interrupt control */
+        s->ier =3D value;
+        break;
+    case FTGMAC100_MAC_MADR: /* MAC */
+        s->conf.macaddr.a[0] =3D value >> 8;
+        s->conf.macaddr.a[1] =3D value;
+        break;
+    case FTGMAC100_MAC_LADR:
+        s->conf.macaddr.a[2] =3D value >> 24;
+        s->conf.macaddr.a[3] =3D value >> 16;
+        s->conf.macaddr.a[4] =3D value >> 8;
+        s->conf.macaddr.a[5] =3D value;
+        break;
+
+    case FTGMAC100_RXR_BADR: /* Ring buffer address */
+        s->rx_ring =3D value;
+        s->rx_descriptor =3D s->rx_ring;
+        break;
+
+    case FTGMAC100_RBSR: /* DMA buffer size */
+        s->rbsr =3D value;
+        break;
+
+    case FTGMAC100_NPTXR_BADR: /* Transmit buffer address */
+        s->tx_ring =3D value;
+        s->tx_descriptor =3D s->tx_ring;
+        break;
+
+    case FTGMAC100_NPTXPD: /* Trigger transmit */
+        if (s->maccr & FTGMAC100_MACCR_TXDMA_EN) {
+            ftgmac100_do_tx(s);
+        }
+        break;
+
+    case FTGMAC100_RXPD: /* Receive Poll Demand Register */
+        if ((s->maccr & FTGMAC100_MACCR_RXDMA_EN) && !s->rx_enabled) {
+            /*
+             * TODO: This is used by the U-Boot driver.
+             */
+            ftgmac100_enable_rx(s);
+        }
+        break;
+
+    case FTGMAC100_APTC: /* Automatic polling */
+        s->aptcr =3D value;
+
+        if (FTGMAC100_APTC_RXPOLL_CNT(s->aptcr)) {
+            ftgmac100_rxpoll(s);
+        }
+
+        if (FTGMAC100_APTC_TXPOLL_CNT(s->aptcr)) {
+            qemu_log_mask(LOG_UNIMP, "%s: no transmit polling\n", __func=
__);
+        }
+        break;
+
+    case FTGMAC100_MACCR: /* MAC Device control */
+        s->maccr =3D value;
+        if (value & FTGMAC100_MACCR_SW_RST) {
+            ftgmac100_reset(DEVICE(s));
+        }
+
+        if ((s->maccr & FTGMAC100_MACCR_RXDMA_EN) && !s->rx_enabled) {
+            ftgmac100_enable_rx(s);
+        }
+
+        if ((s->maccr & FTGMAC100_MACCR_RXDMA_EN) =3D=3D 0) {
+            s->rx_enabled =3D 0;
+        }
+        break;
+
+    case FTGMAC100_PHYCR:  /* PHY Device control */
+        s->phycr =3D value;
+        if (value & FTGMAC100_PHYCR_MIIWR) {
+            do_phy_write(s, extract32(value, 21, 5), s->phydata & 0xffff=
);
+            s->phycr &=3D ~FTGMAC100_PHYCR_MIIWR;
+       } else {
+            s->phydata =3D do_phy_read(s, extract32(value, 21, 5)) << 16=
;
+            s->phycr &=3D ~FTGMAC100_PHYCR_MIIRD;
+       }
+        break;
+    case FTGMAC100_PHYDATA:
+        s->phydata =3D value;
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "[%s]%s: Bad address at offset 0x=
%"
+                      HWADDR_PRIx "\n", TYPE_FTGMAC100, __func__, addr);
+        break;
+    }
+
+    ftgmac100_update_irq(s);
+}
+
+static bool packet_is_broadcast(const uint8_t *buf)
+{
+    static const unsigned char sa_bcast[6] =3D {0xff, 0xff, 0xff,
+                                              0xff, 0xff, 0xff};
+    return memcmp(buf, sa_bcast, 6) =3D=3D 0;
+}
+
+static int ftgmac100_can_receive(NetClientState *nc)
+{
+    Ftgmac100State *s =3D FTGMAC100(qemu_get_nic_opaque(nc));
+
+    return s->rx_enabled;
+}
+
+static ssize_t ftgmac100_receive(NetClientState *nc, const uint8_t *buf,
+                               size_t len)
+{
+    Ftgmac100State *s =3D FTGMAC100(qemu_get_nic_opaque(nc));
+    Ftgmac100Desc bd;
+    uint32_t flags =3D 0;
+    uint32_t addr;
+    uint32_t crc;
+    uint32_t buf_addr;
+    uint8_t *crc_ptr;
+    unsigned int buf_len;
+    size_t size =3D len;
+    uint32_t first =3D FTGMAC100_RXDES0_FRS;
+
+    if (!s->rx_enabled) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Unexpected packet\n", __func=
__);
+        return 0;
+    }
+
+    /* FIXME: Pad short packets.  */
+
+    /* 4 bytes for the CRC.  */
+    size +=3D 4;
+    crc =3D cpu_to_be32(crc32(~0, buf, size));
+    crc_ptr =3D (uint8_t *) &crc;
+
+    /* Huge frames are truncted.  */
+    if (size > FTGMAC100_MAX_FRAME_SIZE(s)) {
+        size =3D FTGMAC100_MAX_FRAME_SIZE(s);
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: frame too big : %zd bytes\n"=
,
+                      __func__, size);
+        flags |=3D FTGMAC100_RXDES0_FTL | FTGMAC100_RXDES0_RX_ERR;
+    }
+
+    if (packet_is_broadcast(buf)) {
+        flags |=3D FTGMAC100_RXDES0_BROADCAST;
+    }
+
+    addr =3D s->rx_descriptor;
+    while (size > 0) {
+        ftgmac100_read_bd(&bd, addr);
+        if (bd.des0 & FTGMAC100_RXDES0_RXPKT_RDY) {
+            /* No descriptors available.  Bail out.  */
+            /*
+             * FIXME: This is wrong. We should probably either
+             * save the remainder for when more RX buffers are
+             * available, or flag an error.
+             */
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: Lost end of frame\n",
+                          __func__);
+            s->isr |=3D FTGMAC100_INT_NO_RXBUF;
+            break;
+        }
+        buf_len =3D (size <=3D s->rbsr) ? size : s->rbsr;
+        bd.des0 |=3D buf_len & 0x3fff;
+        size -=3D buf_len;
+
+        /* The last 4 bytes are the CRC.  */
+        if (size < 4) {
+            buf_len +=3D size - 4;
+        }
+        buf_addr =3D bd.des3;
+        dma_memory_write(&address_space_memory, buf_addr, buf, buf_len);
+        buf +=3D buf_len;
+        if (size < 4) {
+            dma_memory_write(&address_space_memory, buf_addr + buf_len,
+                             crc_ptr, 4 - size);
+            crc_ptr +=3D 4 - size;
+        }
+
+        bd.des0 |=3D first | FTGMAC100_RXDES0_RXPKT_RDY;
+        first =3D 0;
+        if (size =3D=3D 0) {
+            /* Last buffer in frame.  */
+            bd.des0 |=3D flags | FTGMAC100_RXDES0_LRS;
+            s->isr |=3D FTGMAC100_INT_RPKT_BUF;
+        } else {
+            s->isr |=3D FTGMAC100_INT_RPKT_FIFO;
+        }
+        ftgmac100_write_bd(&bd, addr);
+        if (bd.des0 & FTGMAC100_RXDES0_EDORR) {
+            addr =3D s->rx_ring;
+        } else {
+            addr +=3D sizeof(Ftgmac100Desc);
+        }
+    }
+    s->rx_descriptor =3D addr;
+
+    ftgmac100_enable_rx(s);
+    ftgmac100_update_irq(s);
+    return len;
+}
+
+static const MemoryRegionOps ftgmac100_ops =3D {
+    .read =3D ftgmac100_read,
+    .write =3D ftgmac100_write,
+    .valid.min_access_size =3D 4,
+    .valid.max_access_size =3D 4,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
+};
+
+static void ftgmac100_cleanup(NetClientState *nc)
+{
+    Ftgmac100State *s =3D FTGMAC100(qemu_get_nic_opaque(nc));
+
+    s->nic =3D NULL;
+}
+
+static NetClientInfo net_ftgmac100_info =3D {
+    .type =3D NET_CLIENT_DRIVER_NIC,
+    .size =3D sizeof(NICState),
+    .can_receive =3D ftgmac100_can_receive,
+    .receive =3D ftgmac100_receive,
+    .cleanup =3D ftgmac100_cleanup,
+    .link_status_changed =3D ftgmac100_set_link,
+};
+
+static void ftgmac100_realize(DeviceState *dev, Error **errp)
+{
+    Ftgmac100State *s =3D FTGMAC100(dev);
+    SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
+
+    memory_region_init_io(&s->iomem, OBJECT(dev), &ftgmac100_ops, s,
+                          TYPE_FTGMAC100, 0x2000);
+    sysbus_init_mmio(sbd, &s->iomem);
+    sysbus_init_irq(sbd, &s->irq);
+    qemu_macaddr_default_if_unset(&s->conf.macaddr);
+
+    s->conf.peers.ncs[0] =3D nd_table[0].netdev;
+
+    s->nic =3D qemu_new_nic(&net_ftgmac100_info, &s->conf,
+                          object_get_typename(OBJECT(dev)), DEVICE(dev)-=
>id,
+                          s);
+    qemu_format_nic_info_str(qemu_get_queue(s->nic), s->conf.macaddr.a);
+}
+
+static const VMStateDescription vmstate_ftgmac100 =3D {
+    .name =3D TYPE_FTGMAC100,
+    .version_id =3D 1,
+    .minimum_version_id =3D 1,
+    .fields =3D (VMStateField[]) {
+        VMSTATE_UINT32(irq_state, Ftgmac100State),
+        VMSTATE_UINT32(isr, Ftgmac100State),
+        VMSTATE_UINT32(ier, Ftgmac100State),
+        VMSTATE_UINT32(rx_enabled, Ftgmac100State),
+        VMSTATE_UINT32(rx_ring, Ftgmac100State),
+        VMSTATE_UINT32(rbsr, Ftgmac100State),
+        VMSTATE_UINT32(tx_ring, Ftgmac100State),
+        VMSTATE_UINT32(rx_descriptor, Ftgmac100State),
+        VMSTATE_UINT32(tx_descriptor, Ftgmac100State),
+        VMSTATE_UINT32(maccr, Ftgmac100State),
+        VMSTATE_UINT32(phycr, Ftgmac100State),
+        VMSTATE_UINT32(phydata, Ftgmac100State),
+        VMSTATE_UINT32(aptcr, Ftgmac100State),
+
+        VMSTATE_UINT32(phy_status, Ftgmac100State),
+        VMSTATE_UINT32(phy_control, Ftgmac100State),
+        VMSTATE_UINT32(phy_advertise, Ftgmac100State),
+        VMSTATE_UINT32(phy_int, Ftgmac100State),
+        VMSTATE_UINT32(phy_int_mask, Ftgmac100State),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static Property ftgmac100_properties[] =3D {
+    DEFINE_NIC_PROPERTIES(Ftgmac100State, conf),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void ftgmac100_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+
+    dc->vmsd =3D &vmstate_ftgmac100;
+    dc->reset =3D ftgmac100_reset;
+    dc->props =3D ftgmac100_properties;
+    set_bit(DEVICE_CATEGORY_NETWORK, dc->categories);
+    dc->realize =3D ftgmac100_realize;
+    dc->desc =3D "Faraday FTGMAC100 Gigabit Ethernet emulation";
+}
+
+static const TypeInfo ftgmac100_info =3D {
+    .name =3D TYPE_FTGMAC100,
+    .parent =3D TYPE_SYS_BUS_DEVICE,
+    .instance_size =3D sizeof(Ftgmac100State),
+    .class_init =3D ftgmac100_class_init,
+};
+
+static void ftgmac100_register_types(void)
+{
+    type_register_static(&ftgmac100_info);
+}
+
+type_init(ftgmac100_register_types)
diff --git a/include/hw/net/ftgmac100.h b/include/hw/net/ftgmac100.h
new file mode 100644
index 000000000000..1aa22de9e450
--- /dev/null
+++ b/include/hw/net/ftgmac100.h
@@ -0,0 +1,51 @@
+/*
+ * Faraday FTGMAC100 Gigabit Ethernet
+ *
+ * Copyright (C) 2016 IBM Corp.
+ *
+ * This code is licensed under the GPL version 2 or later. See the
+ * COPYING file in the top-level directory.
+ */
+
+#ifndef FTGMAC100_H
+#define FTGMAC100_H
+
+#define TYPE_FTGMAC100 "ftgmac100"
+#define FTGMAC100(obj) OBJECT_CHECK(Ftgmac100State, (obj), TYPE_FTGMAC10=
0)
+
+#include "hw/sysbus.h"
+#include "net/net.h"
+
+typedef struct Ftgmac100State {
+    /*< private >*/
+    SysBusDevice parent_obj;
+
+    /*< public >*/
+    NICState *nic;
+    NICConf conf;
+    qemu_irq irq;
+    MemoryRegion iomem;
+
+    uint32_t irq_state;
+    uint32_t isr;
+    uint32_t ier;
+    uint32_t rx_enabled;
+    uint32_t rx_ring;
+    uint32_t rbsr;
+    uint32_t rx_descriptor;
+    uint32_t tx_ring;
+    uint32_t tx_descriptor;
+    uint32_t maccr;
+    uint32_t phycr;
+    uint32_t phydata;
+    uint32_t aptcr;
+
+    uint32_t phy_status;
+    uint32_t phy_control;
+    uint32_t phy_advertise;
+    uint32_t phy_int;
+    uint32_t phy_int_mask;
+
+} Ftgmac100State;
+
+#endif
--=20
2.7.4

