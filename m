Received: by 10.223.150.237 with SMTP id u100csp2786708wrb;
        Mon, 6 Nov 2017 07:52:24 -0800 (PST)
X-Google-Smtp-Source: ABhQp+Qalv+1bHFSH+nznEEPK9kXfQ29OiT7BHIusm2BkP+00hrB2xUiY/ZJR/brT6l/X+1adfBg
X-Received: by 10.129.155.22 with SMTP id s22mr9939972ywg.491.1509983543936;
        Mon, 06 Nov 2017 07:52:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1509983543; cv=none;
        d=google.com; s=arc-20160816;
        b=Wf+wyzEpgYldZFfWIFSnfL94cDJtsB3yVLVa2JRH5pgpV9+miLaItWwMGU7g/879sY
         f31+j2udm3AsHTrCsMZqzY6yMXIqkd5thDDcOYun/8rwAMFcCUJd4hHvPS+wGVSkC9no
         3OuPaztdqHPlhLPwoL31biek9Vrp57reMYOlYc9iHhwaQfRZRfc5Nt00cBSfUwA6yNuY
         64MJ17R9WNdrMtP/PrA4wnwtYHytrb/QXfk71rsmphNg+I+MozWDze8+xXDw4F6Z1rFA
         RF+tX0HucMBl7vkhRhm/oAySsyHKudI6wHHJ2FHkPrAFqY+4CYlR1g6occ2BWLttQHY3
         7XUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=uXcssGQoKRHpGhBCXrKwO36pyNpxdC7uDDhdLY2Yq/s=;
        b=u0CKUPKK3fdhnzgmcMLZhdh8c8FYA5oeojg7vWaqy/rBP+OCaL1LQaNGwwo1wzNIn9
         yCSRG+9ej3oZ69m2r/yf59rh4DXBUXxwf+0WsgOer5Z2WcEhhTauEg4jYKMLfOiSo5Ua
         c9knomSj62cPiTZLIiY1tbxxxBtuq+FgdD5Xeq1i4Y5H/JzwMRTwa84ZTT4NpgO12yz2
         mjUhflwxZvbbCIkajU/eC/zy2DGwIN/4QtH/BjLnLQEiIoPd7ijE7p2f+uoNcz3gss2x
         UTm1p20awAapamEqtJtJUfy1HksEKiHLUy2u6ye5K6ek0twfh9OfRY3RRUpuSHdf0wAP
         BguA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=YknA8Bmr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t76si2790413ywe.307.2017.11.06.07.52.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Nov 2017 07:52:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=YknA8Bmr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:48782 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eBjhH-0001sR-As
	for alex.bennee@linaro.org; Mon, 06 Nov 2017 10:52:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33407)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eBjde-00074O-La
	for qemu-arm@nongnu.org; Mon, 06 Nov 2017 10:48:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eBjdd-0000Q4-1K
	for qemu-arm@nongnu.org; Mon, 06 Nov 2017 10:48:38 -0500
Received: from mail-pg0-x243.google.com ([2607:f8b0:400e:c05::243]:44212)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1eBjdc-0000Pd-OR; Mon, 06 Nov 2017 10:48:36 -0500
Received: by mail-pg0-x243.google.com with SMTP id j3so8525138pga.1;
	Mon, 06 Nov 2017 07:48:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=uXcssGQoKRHpGhBCXrKwO36pyNpxdC7uDDhdLY2Yq/s=;
	b=YknA8BmroKyiFL10G7edi1brsBAqXh8TbMovVSC+dg0HDuyoZnm5YCZQMk/MJmaozl
	YDsju5wohySs10zB9B129O5ZIk4BdE+Z3mbboRpJanxK5Z3a7f5fQp3I9TpkptpQ5eMr
	jbPr5MCLgRZH4cPzhecCy5AYlru2iuIyXH9yXz70d8dfbs9P+FR8rymUuiBSbCB+fHwJ
	TDI0Ra0e6Hr3hi3nAxJ0W3P3SdyaMRz+9ndFigAqhyNlfKWAX8yApQiCi07LXvntgtOM
	De/5LmABplD5khS9da4CSyEgYZlROQE1LgRiOvRc9o7lu3Zpk0Om9XUfQFNrv8AFcl0t
	ZOww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=uXcssGQoKRHpGhBCXrKwO36pyNpxdC7uDDhdLY2Yq/s=;
	b=lw4GvXvOx0IRExP6PbHnakWB07RFT63k1ENrEFqC1VtSR60SgnITkocGNabMMZEHoV
	pUDvmQJu9x5nPxg3eO87eb3PDY/96LGro2BNwhTzZ6nKHPw9BdYC1NXa7owJWG5SeZQc
	DpQ4EUuNCTAnzOeaewc51byhAl954AkssEuIJ9zyjWrhPxdiMXMjtLO+/5ZpZg4A7FkG
	oGMYSILJYolZwM827lTEMr/jwEbvdkTAbRW7zWtcj5YF8C1SJMa17DmxYIaDJxM7+bGI
	cF3s4vem2sBHpN9oqAOvw5NqTOcwIC3SI1lg24fj5NnGGzheLIkc17FMADCVtqp4z8a1
	iXew==
X-Gm-Message-State: AMCzsaXTEU361KMhRPViG9QiWsnteDSd5aNb7qjzmVYvlVW3CeVPu8EW
	bKtLJFz7En3BAzgXqHlWD85eKsZO8oQ=
X-Received: by 10.98.211.23 with SMTP id q23mr17126898pfg.28.1509983315513;
	Mon, 06 Nov 2017 07:48:35 -0800 (PST)
Received: from squirtle.lan (c-24-22-235-96.hsd1.wa.comcast.net.
	[24.22.235.96]) by smtp.gmail.com with ESMTPSA id
	x1sm22719590pfh.113.2017.11.06.07.48.34
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 06 Nov 2017 07:48:35 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon,  6 Nov 2017 07:47:50 -0800
Message-Id: <20171106154813.19936-8-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171106154813.19936-1-andrew.smirnov@gmail.com>
References: <20171106154813.19936-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::243
Subject: [Qemu-arm] [PATCH v3 07/30] imx_fec: Add support for multiple Tx
 DMA rings
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, yurovsky@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6AdaCzClS7l/

More recent version of the IP block support more than one Tx DMA ring,
so add the code implementing that feature.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: yurovsky@gmail.com
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 hw/net/imx_fec.c         | 106 ++++++++++++++++++++++++++++++++++++++---------
 include/hw/net/imx_fec.h |  18 +++++++-
 2 files changed, 102 insertions(+), 22 deletions(-)

diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
index 131e7fd734..38d8c27dcd 100644
--- a/hw/net/imx_fec.c
+++ b/hw/net/imx_fec.c
@@ -198,13 +198,13 @@ static const char *imx_eth_reg_name(IMXFECState *s, uint32_t index)
 
 static const VMStateDescription vmstate_imx_eth = {
     .name = TYPE_IMX_FEC,
-    .version_id = 2,
-    .minimum_version_id = 2,
+    .version_id = 3,
+    .minimum_version_id = 3,
     .fields = (VMStateField[]) {
         VMSTATE_UINT32_ARRAY(regs, IMXFECState, ENET_MAX),
         VMSTATE_UINT32(rx_descriptor, IMXFECState),
-        VMSTATE_UINT32(tx_descriptor, IMXFECState),
-
+        VMSTATE_UINT32_ARRAY(tx_descriptor, IMXFECState, ENET_TX_RING_NUM),
+        VMSTATE_UINT32(tx_ring_num, IMXFECState),
         VMSTATE_UINT32(phy_status, IMXFECState),
         VMSTATE_UINT32(phy_control, IMXFECState),
         VMSTATE_UINT32(phy_advertise, IMXFECState),
@@ -407,7 +407,7 @@ static void imx_fec_do_tx(IMXFECState *s)
     int frame_size = 0, descnt = 0;
     uint8_t frame[ENET_MAX_FRAME_SIZE];
     uint8_t *ptr = frame;
-    uint32_t addr = s->tx_descriptor;
+    uint32_t addr = s->tx_descriptor[0];
 
     while (descnt++ < IMX_MAX_DESC) {
         IMXFECBufDesc bd;
@@ -448,17 +448,47 @@ static void imx_fec_do_tx(IMXFECState *s)
         }
     }
 
-    s->tx_descriptor = addr;
+    s->tx_descriptor[0] = addr;
 
     imx_eth_update(s);
 }
 
-static void imx_enet_do_tx(IMXFECState *s)
+static void imx_enet_do_tx(IMXFECState *s, uint32_t index)
 {
     int frame_size = 0, descnt = 0;
     uint8_t frame[ENET_MAX_FRAME_SIZE];
     uint8_t *ptr = frame;
-    uint32_t addr = s->tx_descriptor;
+    uint32_t addr, int_txb, int_txf, tdsr;
+    size_t ring;
+
+    switch (index) {
+    case ENET_TDAR:
+        ring    = 0;
+        int_txb = ENET_INT_TXB;
+        int_txf = ENET_INT_TXF;
+        tdsr    = ENET_TDSR;
+        break;
+    case ENET_TDAR1:
+        ring    = 1;
+        int_txb = ENET_INT_TXB1;
+        int_txf = ENET_INT_TXF1;
+        tdsr    = ENET_TDSR1;
+        break;
+    case ENET_TDAR2:
+        ring    = 2;
+        int_txb = ENET_INT_TXB2;
+        int_txf = ENET_INT_TXF2;
+        tdsr    = ENET_TDSR2;
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: bogus value for index %x\n",
+                      __func__, index);
+        abort();
+        break;
+    }
+
+    addr = s->tx_descriptor[ring];
 
     while (descnt++ < IMX_MAX_DESC) {
         IMXENETBufDesc bd;
@@ -502,32 +532,32 @@ static void imx_enet_do_tx(IMXFECState *s)
             ptr = frame;
             frame_size = 0;
             if (bd.option & ENET_BD_TX_INT) {
-                s->regs[ENET_EIR] |= ENET_INT_TXF;
+                s->regs[ENET_EIR] |= int_txf;
             }
         }
         if (bd.option & ENET_BD_TX_INT) {
-            s->regs[ENET_EIR] |= ENET_INT_TXB;
+            s->regs[ENET_EIR] |= int_txb;
         }
         bd.flags &= ~ENET_BD_R;
         /* Write back the modified descriptor.  */
         imx_enet_write_bd(&bd, addr);
         /* Advance to the next descriptor.  */
         if ((bd.flags & ENET_BD_W) != 0) {
-            addr = s->regs[ENET_TDSR];
+            addr = s->regs[tdsr];
         } else {
             addr += sizeof(bd);
         }
     }
 
-    s->tx_descriptor = addr;
+    s->tx_descriptor[ring] = addr;
 
     imx_eth_update(s);
 }
 
-static void imx_eth_do_tx(IMXFECState *s)
+static void imx_eth_do_tx(IMXFECState *s, uint32_t index)
 {
     if (!s->is_fec && (s->regs[ENET_ECR] & ENET_ECR_EN1588)) {
-        imx_enet_do_tx(s);
+        imx_enet_do_tx(s, index);
     } else {
         imx_fec_do_tx(s);
     }
@@ -585,7 +615,7 @@ static void imx_eth_reset(DeviceState *d)
     }
 
     s->rx_descriptor = 0;
-    s->tx_descriptor = 0;
+    memset(s->tx_descriptor, 0, sizeof(s->tx_descriptor));
 
     /* We also reset the PHY */
     phy_reset(s);
@@ -791,6 +821,7 @@ static void imx_eth_write(void *opaque, hwaddr offset, uint64_t value,
                            unsigned size)
 {
     IMXFECState *s = IMX_FEC(opaque);
+    const bool single_tx_ring = s->tx_ring_num != 3;
     uint32_t index = offset >> 2;
 
     FEC_PRINTF("reg[%s] <= 0x%" PRIx32 "\n", imx_eth_reg_name(s, index),
@@ -813,10 +844,18 @@ static void imx_eth_write(void *opaque, hwaddr offset, uint64_t value,
             s->regs[index] = 0;
         }
         break;
-    case ENET_TDAR:
+    case ENET_TDAR1:    /* FALLTHROUGH */
+    case ENET_TDAR2:    /* FALLTHROUGH */
+        if (unlikely(single_tx_ring)) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "[%s]%s: trying to access TDAR2 or TDAR1\n",
+                          TYPE_IMX_FEC, __func__);
+            return;
+        }
+    case ENET_TDAR:     /* FALLTHROUGH */
         if (s->regs[ENET_ECR] & ENET_ECR_ETHEREN) {
             s->regs[index] = ENET_TDAR_TDAR;
-            imx_eth_do_tx(s);
+            imx_eth_do_tx(s, index);
         }
         s->regs[index] = 0;
         break;
@@ -828,8 +867,12 @@ static void imx_eth_write(void *opaque, hwaddr offset, uint64_t value,
         if ((s->regs[index] & ENET_ECR_ETHEREN) == 0) {
             s->regs[ENET_RDAR] = 0;
             s->rx_descriptor = s->regs[ENET_RDSR];
-            s->regs[ENET_TDAR] = 0;
-            s->tx_descriptor = s->regs[ENET_TDSR];
+            s->regs[ENET_TDAR]  = 0;
+            s->regs[ENET_TDAR1] = 0;
+            s->regs[ENET_TDAR2] = 0;
+            s->tx_descriptor[0] = s->regs[ENET_TDSR];
+            s->tx_descriptor[1] = s->regs[ENET_TDSR1];
+            s->tx_descriptor[2] = s->regs[ENET_TDSR2];
         }
         break;
     case ENET_MMFR:
@@ -907,7 +950,29 @@ static void imx_eth_write(void *opaque, hwaddr offset, uint64_t value,
         } else {
             s->regs[index] = value & ~7;
         }
-        s->tx_descriptor = s->regs[index];
+        s->tx_descriptor[0] = s->regs[index];
+        break;
+    case ENET_TDSR1:
+        if (unlikely(single_tx_ring)) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "[%s]%s: trying to access TDSR1\n",
+                          TYPE_IMX_FEC, __func__);
+            return;
+        }
+
+        s->regs[index] = value & ~7;
+        s->tx_descriptor[1] = s->regs[index];
+        break;
+    case ENET_TDSR2:
+        if (unlikely(single_tx_ring)) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "[%s]%s: trying to access TDSR2\n",
+                          TYPE_IMX_FEC, __func__);
+            return;
+        }
+
+        s->regs[index] = value & ~7;
+        s->tx_descriptor[2] = s->regs[index];
         break;
     case ENET_MRBR:
         s->regs[index] = value & 0x00003ff0;
@@ -1203,6 +1268,7 @@ static void imx_eth_realize(DeviceState *dev, Error **errp)
 
 static Property imx_eth_properties[] = {
     DEFINE_NIC_PROPERTIES(IMXFECState, conf),
+    DEFINE_PROP_UINT32("tx-ring-num", IMXFECState, tx_ring_num, 1),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/include/hw/net/imx_fec.h b/include/hw/net/imx_fec.h
index e482d1c13b..3a438127f9 100644
--- a/include/hw/net/imx_fec.h
+++ b/include/hw/net/imx_fec.h
@@ -52,6 +52,8 @@
 #define ENET_TFWR              81
 #define ENET_FRBR              83
 #define ENET_FRSR              84
+#define ENET_TDSR1             89
+#define ENET_TDSR2             92
 #define ENET_RDSR              96
 #define ENET_TDSR              97
 #define ENET_MRBR              98
@@ -66,6 +68,8 @@
 #define ENET_FTRL              108
 #define ENET_TACC              112
 #define ENET_RACC              113
+#define ENET_TDAR1             121
+#define ENET_TDAR2             123
 #define ENET_MIIGSK_CFGR       192
 #define ENET_MIIGSK_ENR        194
 #define ENET_ATCR              256
@@ -105,13 +109,18 @@
 #define ENET_INT_WAKEUP        (1 << 17)
 #define ENET_INT_TS_AVAIL      (1 << 16)
 #define ENET_INT_TS_TIMER      (1 << 15)
+#define ENET_INT_TXF2          (1 <<  7)
+#define ENET_INT_TXB2          (1 <<  6)
+#define ENET_INT_TXF1          (1 <<  3)
+#define ENET_INT_TXB1          (1 <<  2)
 
 #define ENET_INT_MAC           (ENET_INT_HB | ENET_INT_BABR | ENET_INT_BABT | \
                                 ENET_INT_GRA | ENET_INT_TXF | ENET_INT_TXB | \
                                 ENET_INT_RXF | ENET_INT_RXB | ENET_INT_MII | \
                                 ENET_INT_EBERR | ENET_INT_LC | ENET_INT_RL | \
                                 ENET_INT_UN | ENET_INT_PLR | ENET_INT_WAKEUP | \
-                                ENET_INT_TS_AVAIL)
+                                ENET_INT_TS_AVAIL | ENET_INT_TXF1 | \
+                                ENET_INT_TXB1 | ENET_INT_TXF2 | ENET_INT_TXB2)
 
 /* RDAR */
 #define ENET_RDAR_RDAR         (1 << 24)
@@ -234,6 +243,9 @@ typedef struct {
 
 #define ENET_BD_BDU            (1 << 31)
 
+#define ENET_TX_RING_NUM       3
+
+
 typedef struct IMXFECState {
     /*< private >*/
     SysBusDevice parent_obj;
@@ -246,7 +258,9 @@ typedef struct IMXFECState {
 
     uint32_t regs[ENET_MAX];
     uint32_t rx_descriptor;
-    uint32_t tx_descriptor;
+
+    uint32_t tx_descriptor[ENET_TX_RING_NUM];
+    uint32_t tx_ring_num;
 
     uint32_t phy_status;
     uint32_t phy_control;
-- 
2.13.6

