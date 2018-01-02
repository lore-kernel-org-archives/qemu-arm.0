Received: by 10.223.134.117 with SMTP id 50csp11159177wrw;
        Tue, 2 Jan 2018 11:40:18 -0800 (PST)
X-Google-Smtp-Source: ACJfBov/phJp0mcK7OSaqmQjFgTAGuFELwVfwwUiXcAp2SlbTHsUh6bf1jZNG155tdSjlhWkofUD
X-Received: by 10.129.136.7 with SMTP id y7mr12991246ywf.393.1514922018184;
        Tue, 02 Jan 2018 11:40:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1514922018; cv=none;
        d=google.com; s=arc-20160816;
        b=yGMbaB/F9DDMzf/9We1Ijhl202SIJGPSXQyuK8EmwpgjR86svalmCQk9nMefQjY53k
         8aO4UGy2MMnveVrUg4BWf9NOm+B3TYTufCmOQFC49OVswMmPsg6SqUzEhr+K10apkYCY
         ZXiDEIQadoPE2FUpLK+6zQe3+eDBbXfav1+yVTH6MQtpJMA+avRM/6mAX01vcs2J3eH4
         glbKndnAH7OSpr4lljnoqwJ8i4pz4L9xu6dMl2Oz8zj6GLPNR12ZzZ8WRCmPs5rCnnal
         SRInlfWPC/R8NhMi7v/mjyLAijeovXCM6IuthisM+bs6m4q1YXuRlkCJl3COHX3J97ZW
         ANlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=LhiP3hpi/ZVNEVgWfo4oqYY/H6ld3r0Ks8yRmNB8xhA=;
        b=jc1DbtZBlThF1+CsJLZ9kOvCjo+dyiUNu4a7xDnhJe2nXRzdWVRlL0zYYV1RsOS1Cy
         AUCDA6MfYjcVg24gnO8/FZgtIaPbexXO3STxRwFgktCiSlYoUQ5aEWQWfbuknzqo7EVK
         5OhkAuTAAEcx23RxfC/fMsuE0/9fmDH2QMeEi83oTMermmLAwzViDPangb/mk3wrOa7f
         il1TrflUIWnaV0AFClF34fWsilGVFkVkQGQPMOFnFoAUF6Z3G5SNLlDvdcEG19gY8sA9
         q0CSPw2HhqZWBHx08VtRqsbpMQWrT0syyyAbnu42dMr1x6imBskNbGjpekqHpKIj3+TV
         P8fQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=YiwQy24O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v3si8776363yba.395.2018.01.02.11.40.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 Jan 2018 11:40:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=YiwQy24O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:52925 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eWSQ5-0005xS-G4
	for alex.bennee@linaro.org; Tue, 02 Jan 2018 14:40:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58673)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eWSMf-0003JG-MK
	for qemu-arm@nongnu.org; Tue, 02 Jan 2018 14:36:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eWSMd-0000Mu-R8
	for qemu-arm@nongnu.org; Tue, 02 Jan 2018 14:36:45 -0500
Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243]:40890)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1eWSMd-0000MM-J0; Tue, 02 Jan 2018 14:36:43 -0500
Received: by mail-pf0-x243.google.com with SMTP id v26so26019756pfl.7;
	Tue, 02 Jan 2018 11:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=LhiP3hpi/ZVNEVgWfo4oqYY/H6ld3r0Ks8yRmNB8xhA=;
	b=YiwQy24O9asJoE8nSB6HVo0bRTXeoGx84t+oqYVZhDmo58QGElkjJrPKLWJMCCuB3p
	634IAAG1AwFHP3gXPUbM5owfUa/HzNRAdPEYmxTN5twPGXPFxEbhBI4PRopRjkbTR171
	m+SccTHb6CKOZB9AnsGrB6kNGnKlH8RMdvkF6yYmchR/IJjvsAGdZZbb8phDgZISNqSK
	afC8D8Ihg4gbocl5V/7ehcbw/oC1h3MfTKiygjlTF8LkSRYKIAVi3fhCOmCu/gvvEGXv
	6dqRPRA11lw9Zz3ypNcDSuyqQ/JpwI84gn5QD28T6BfNeGanSEBHi9ZDVGveaSMY9DRC
	XTwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=LhiP3hpi/ZVNEVgWfo4oqYY/H6ld3r0Ks8yRmNB8xhA=;
	b=t08zDdcNApKcDKHWxBKclV6tJbtQmfNZC43JajuNo8S6FIiOwFAhK1krxjf2PCLg/Q
	qONN843lQ4P9xFSlo41pyfKcgR3XWmjug89X/xooCAmZl+mrlv8eWnYInsa26VBDL/2X
	nPY6OER2Plp4QQg9XJC0Sur4pj6zUyxwBdTikxEvF1Fh2T16H88jmWoJJd2aPG3fmLBj
	jeMiaG8Les9YYzLO2TEcJIk5MmujVppnjKrw2gpACjRAb9jOwBaoc4LkzNSS1rXxi0f7
	EOoTwEaQKoxEQ4QLM7DT7LJlwr9YU+hsE+n0J7WdaoeL5ronhkp4Fzhlp44fxfBXEsKn
	RM7w==
X-Gm-Message-State: AKGB3mK4WxcqI+szaEPXPFvZzRM5XAUh4JF83f6l/BSTguM6Hv8HElLr
	p4LuKJros96zurRZb4Q9wRplBDIQSPw=
X-Received: by 10.98.98.5 with SMTP id w5mr46476847pfb.147.1514921802325;
	Tue, 02 Jan 2018 11:36:42 -0800 (PST)
Received: from squirtle.westlake.spaceflightindustries.com ([173.226.206.194])
	by smtp.gmail.com with ESMTPSA id
	g9sm97905951pfk.0.2018.01.02.11.36.41
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 02 Jan 2018 11:36:41 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Tue,  2 Jan 2018 11:36:19 -0800
Message-Id: <20180102193622.27215-9-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180102193622.27215-1-andrew.smirnov@gmail.com>
References: <20180102193622.27215-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::243
Subject: [Qemu-arm] [PATCH v3 08/11] imx_fec: Add support for multiple Tx
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
X-TUID: oRjWoQ6Jez+M

More recent version of the IP block support more than one Tx DMA ring,
so add the code implementing that feature.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: yurovsky@gmail.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 hw/net/imx_fec.c         | 133 ++++++++++++++++++++++++++++++++++++++++-------
 include/hw/net/imx_fec.h |  18 ++++++-
 2 files changed, 130 insertions(+), 21 deletions(-)

diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
index 825c879a28..77d27f763e 100644
--- a/hw/net/imx_fec.c
+++ b/hw/net/imx_fec.c
@@ -196,6 +196,31 @@ static const char *imx_eth_reg_name(IMXFECState *s, uint32_t index)
     }
 }
 
+/*
+ * Versions of this device with more than one TX descriptor save the
+ * 2nd and 3rd descriptors in a subsection, to maintain migration
+ * compatibility with previous versions of the device that only
+ * supported a single descriptor.
+ */
+static bool imx_eth_is_multi_tx_ring(void *opaque)
+{
+    IMXFECState *s = IMX_FEC(opaque);
+
+    return s->tx_ring_num > 1;
+}
+
+static const VMStateDescription vmstate_imx_eth_txdescs = {
+    .name = "imx.fec/txdescs",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = imx_eth_is_multi_tx_ring,
+    .fields = (VMStateField[]) {
+         VMSTATE_UINT32(tx_descriptor[1], IMXFECState),
+         VMSTATE_UINT32(tx_descriptor[2], IMXFECState),
+         VMSTATE_END_OF_LIST()
+    }
+};
+
 static const VMStateDescription vmstate_imx_eth = {
     .name = TYPE_IMX_FEC,
     .version_id = 2,
@@ -203,15 +228,18 @@ static const VMStateDescription vmstate_imx_eth = {
     .fields = (VMStateField[]) {
         VMSTATE_UINT32_ARRAY(regs, IMXFECState, ENET_MAX),
         VMSTATE_UINT32(rx_descriptor, IMXFECState),
-        VMSTATE_UINT32(tx_descriptor, IMXFECState),
-
+        VMSTATE_UINT32(tx_descriptor[0], IMXFECState),
         VMSTATE_UINT32(phy_status, IMXFECState),
         VMSTATE_UINT32(phy_control, IMXFECState),
         VMSTATE_UINT32(phy_advertise, IMXFECState),
         VMSTATE_UINT32(phy_int, IMXFECState),
         VMSTATE_UINT32(phy_int_mask, IMXFECState),
         VMSTATE_END_OF_LIST()
-    }
+    },
+    .subsections = (const VMStateDescription * []) {
+        &vmstate_imx_eth_txdescs,
+        NULL
+    },
 };
 
 #define PHY_INT_ENERGYON            (1 << 7)
@@ -406,7 +434,7 @@ static void imx_fec_do_tx(IMXFECState *s)
 {
     int frame_size = 0, descnt = 0;
     uint8_t *ptr = s->frame;
-    uint32_t addr = s->tx_descriptor;
+    uint32_t addr = s->tx_descriptor[0];
 
     while (descnt++ < IMX_MAX_DESC) {
         IMXFECBufDesc bd;
@@ -447,16 +475,47 @@ static void imx_fec_do_tx(IMXFECState *s)
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
+
     uint8_t *ptr = s->frame;
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
@@ -502,32 +561,32 @@ static void imx_enet_do_tx(IMXFECState *s)
 
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
@@ -585,7 +644,7 @@ static void imx_eth_reset(DeviceState *d)
     }
 
     s->rx_descriptor = 0;
-    s->tx_descriptor = 0;
+    memset(s->tx_descriptor, 0, sizeof(s->tx_descriptor));
 
     /* We also reset the PHY */
     phy_reset(s);
@@ -791,6 +850,7 @@ static void imx_eth_write(void *opaque, hwaddr offset, uint64_t value,
                            unsigned size)
 {
     IMXFECState *s = IMX_FEC(opaque);
+    const bool single_tx_ring = !imx_eth_is_multi_tx_ring(s);
     uint32_t index = offset >> 2;
 
     FEC_PRINTF("reg[%s] <= 0x%" PRIx32 "\n", imx_eth_reg_name(s, index),
@@ -813,10 +873,18 @@ static void imx_eth_write(void *opaque, hwaddr offset, uint64_t value,
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
@@ -828,8 +896,12 @@ static void imx_eth_write(void *opaque, hwaddr offset, uint64_t value,
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
@@ -907,7 +979,29 @@ static void imx_eth_write(void *opaque, hwaddr offset, uint64_t value,
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
@@ -1203,6 +1297,7 @@ static void imx_eth_realize(DeviceState *dev, Error **errp)
 
 static Property imx_eth_properties[] = {
     DEFINE_NIC_PROPERTIES(IMXFECState, conf),
+    DEFINE_PROP_UINT32("tx-ring-num", IMXFECState, tx_ring_num, 1),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/include/hw/net/imx_fec.h b/include/hw/net/imx_fec.h
index af0840a0fa..91ef8f89a6 100644
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
2.14.3

