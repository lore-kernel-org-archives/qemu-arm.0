Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp6437198wrt;
        Wed, 3 Oct 2018 08:13:52 -0700 (PDT)
X-Google-Smtp-Source: ACcGV629V+b2EgFiF2HpTzz1XSFTmv4ifPE/BNYRI/0QUXCWsT6UDbVZZ9DjER2m7EMTDRdk1vmg
X-Received: by 2002:ac8:31fc:: with SMTP id i57-v6mr1590532qte.323.1538579631984;
        Wed, 03 Oct 2018 08:13:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538579631; cv=none;
        d=google.com; s=arc-20160816;
        b=dG7oL0PUhMXC6ghIgiTh/TC3m0ibWgLc2TpLJoVmrsx91PFuMnVZ3+sYmxvFgXmDaC
         BMjNETMNVOSZHzssnzPokM2viHhIsw+NvGtpv2AUaSUVKV+ni6q4U7QxRiu+P90EfzT+
         3BdsxUhOKNFiMZOgQjj4fD1RWUthEkNf9ranyIrRlzB621I4c990u9jYbNphjnEmlFQE
         FG2IcVlgIKtJfQMFOcjXiYUAGcMhUSE9ocHqTD66OBYapZ8PWCsesy4CkGcas6knzRTW
         7Jfkhjh8C1aTZdWi/GI5hCsxTHPM8G9uvyIzILv8P9bWwin3Q6r2qIi8JsddY7MhLJfg
         Jf+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=eIg7KNhUJ/2g8KgJ36U2q28z1ATwXQD6Tl26WArvSYk=;
        b=nyiXWAx/3jgBPxkqEExw82ueyzQ2tgNLo/HQjA1bM29miRW/4JlNefjyCAtZ/z5PO8
         4UmgbadeR4K6/X6R/dPjQXnMv14TDXnUtCiYpNNFxByOtFgsP3z1Khmsh4rdy5jB5O3+
         innsWlTMFXlzvnwbv+Sh8d1ZcwpuOg9fgsi9c76ogOUKWJmdyO7lnkz4kMpbvZzN9a90
         xw2DtIJIoyvWmnILPKJmO1Ef440OLXzz/dQePo2/vnGYI0TdDngrieyonExjzR566llJ
         yMDNI5kdnmfYn6TrVFiARO2bdQWvGWZjoaRhf1Iej4/VQwMoiSqxqZmkHCeO62vCoqf9
         bWhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=cv37pPek;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y190-v6si931321qka.39.2018.10.03.08.13.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Oct 2018 08:13:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=cv37pPek;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:49248 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g7iqV-0002IN-CX
	for alex.bennee@linaro.org; Wed, 03 Oct 2018 11:13:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48177)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1g7io8-0007dr-96
	for qemu-arm@nongnu.org; Wed, 03 Oct 2018 11:11:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1g7io7-00053j-2d
	for qemu-arm@nongnu.org; Wed, 03 Oct 2018 11:11:24 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:39781)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1g7inz-0004zi-Fo; Wed, 03 Oct 2018 11:11:16 -0400
Received: by mail-pg1-x52d.google.com with SMTP id r9-v6so1711946pgv.6;
	Wed, 03 Oct 2018 08:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=eIg7KNhUJ/2g8KgJ36U2q28z1ATwXQD6Tl26WArvSYk=;
	b=cv37pPekFxfP6WEwSauIucI2sbsKmiFEtM9N00MDjzf2G6KkF0BbvFKhxtneHkYVN2
	HUVDOnXD9Vm1j8BxOuQdggMyd4dGREa56kmOy0WILHbL7Mdlds84fcsy17hW/Wh7lmn+
	vnmUFBBhQzoVuqD/j/p10mdq4sRChn88Zzc0+Z+XP10FxNOvQXP/czPJ9pNtKiORhZO4
	0ugoBeUgdTjBmxgOfiKVWJ5XREWn53FFUQaotbR9lW6sLrN6bRgNab4S68/MAGpzrHci
	YhqRyAdhfw4O+w1lnjw7Nh6Tt/0cXeCYNPy07tY3LHLjNVBqcwIHvIoiIfAXKNO6Dg2e
	RQ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=eIg7KNhUJ/2g8KgJ36U2q28z1ATwXQD6Tl26WArvSYk=;
	b=MLr2esg8w5T4lBPhOOJAfZDkBHOl+aPJAwDj4aNaljCB6EyopKZC7Hv2wO+7oP+2/4
	93vxq3w5lCafR9AF5rs82d5Q7QtXRg8lblq22kv9ictFpIPOJvk006AKPr8lv2vErTLi
	Jo2ef6DJDA9mVVFsU5u3MyY7zmVWuICdlR1ZzZ/V4pnTVNjf7Ljm4GyJC/siYcydOi0Y
	lLREwjnngszh8Vr3M8rkQ8uGPT9X0QHe+Qq/cfVkT1RdqymaMDDXAZ/LXsH0UfAwSUr4
	5PaO8icFCuXPacd++y/VIZaL/PUJFixvnlgtiW3VrL19WKVXp9Rz4XZ5V97d0rqLkueX
	5GuQ==
X-Gm-Message-State: ABuFfog/OmInlLl/Bu5Td8k7Jgos56GdVH0K7OmR8w38ZZ5nfrd5v4BJ
	6rqpJIRu0iofxZ5wI2UNULZxSZr/UxE=
X-Received: by 2002:a63:ea0e:: with SMTP id
	c14-v6mr1668856pgi.361.1538579470534; 
	Wed, 03 Oct 2018 08:11:10 -0700 (PDT)
Received: from localhost ([149.199.62.254]) by smtp.gmail.com with ESMTPSA id
	n13-v6sm1922319pgr.73.2018.10.03.08.11.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Oct 2018 08:11:09 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Wed,  3 Oct 2018 22:07:39 +0700
Message-Id: <1538579266-8389-6-git-send-email-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1538579266-8389-1-git-send-email-edgar.iglesias@gmail.com>
References: <1538579266-8389-1-git-send-email-edgar.iglesias@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::52d
Subject: [Qemu-arm] [PATCH v1 05/12] net: cadence_gem: Add support for
 extended descriptors
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
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
	edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
	frasse.iglesias@gmail.com, alistair@alistair23.me,
	richard.henderson@linaro.org, frederic.konrad@adacore.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QmMozwRKKV2V

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Add support for extended descriptors with optional 64bit
addressing and timestamping. QEMU will not yet provide
timestamps (always leaving the valid timestamp bit as zero).

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/net/cadence_gem.c         | 69 ++++++++++++++++++++++++++++++++------------
 include/hw/net/cadence_gem.h |  2 +-
 2 files changed, 52 insertions(+), 19 deletions(-)

diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index 4d769b0..759c1d7 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -207,6 +207,9 @@
 #define GEM_NWCFG_BCAST_REJ    0x00000020 /* Reject broadcast packets */
 #define GEM_NWCFG_PROMISC      0x00000010 /* Accept all packets */
 
+#define GEM_DMACFG_ADDR_64B    (1U << 30)
+#define GEM_DMACFG_TX_BD_EXT   (1U << 29)
+#define GEM_DMACFG_RX_BD_EXT   (1U << 28)
 #define GEM_DMACFG_RBUFSZ_M    0x00FF0000 /* DMA RX Buffer Size mask */
 #define GEM_DMACFG_RBUFSZ_S    16         /* DMA RX Buffer Size shift */
 #define GEM_DMACFG_RBUFSZ_MUL  64         /* DMA RX Buffer Size multiplier */
@@ -302,9 +305,14 @@
 
 #define GEM_MODID_VALUE 0x00020118
 
-static inline unsigned tx_desc_get_buffer(uint32_t *desc)
+static inline uint64_t tx_desc_get_buffer(CadenceGEMState *s, uint32_t *desc)
 {
-    return desc[0];
+    uint64_t ret = desc[0];
+
+    if (s->regs[GEM_DMACFG] & GEM_DMACFG_ADDR_64B) {
+        ret |= (uint64_t)desc[2] << 32;
+    }
+    return ret;
 }
 
 static inline unsigned tx_desc_get_used(uint32_t *desc)
@@ -347,9 +355,30 @@ static inline void print_gem_tx_desc(uint32_t *desc, uint8_t queue)
     DB_PRINT("length:  %d\n", tx_desc_get_length(desc));
 }
 
-static inline unsigned rx_desc_get_buffer(uint32_t *desc)
+static inline uint64_t rx_desc_get_buffer(CadenceGEMState *s, uint32_t *desc)
 {
-    return desc[0] & ~0x3UL;
+    uint64_t ret = desc[0] & ~0x3UL;
+
+    if (s->regs[GEM_DMACFG] & GEM_DMACFG_ADDR_64B) {
+        ret |= (uint64_t)desc[2] << 32;
+    }
+    return ret;
+}
+
+static inline int gem_get_desc_len(CadenceGEMState *s, bool rx_n_tx)
+{
+    int ret = 2;
+
+    if (s->regs[GEM_DMACFG] & GEM_DMACFG_ADDR_64B) {
+        ret += 2;
+    }
+    if (s->regs[GEM_DMACFG] & (rx_n_tx ? GEM_DMACFG_RX_BD_EXT
+                                       : GEM_DMACFG_TX_BD_EXT)) {
+        ret += 2;
+    }
+
+    assert(ret <= DESC_MAX_NUM_WORDS);
+    return ret;
 }
 
 static inline unsigned rx_desc_get_wrap(uint32_t *desc)
@@ -419,7 +448,7 @@ static void gem_init_register_masks(CadenceGEMState *s)
     memset(&s->regs_ro[0], 0, sizeof(s->regs_ro));
     s->regs_ro[GEM_NWCTRL]   = 0xFFF80000;
     s->regs_ro[GEM_NWSTATUS] = 0xFFFFFFFF;
-    s->regs_ro[GEM_DMACFG]   = 0xFE00F000;
+    s->regs_ro[GEM_DMACFG]   = 0x8E00F000;
     s->regs_ro[GEM_TXSTATUS] = 0xFFFFFE08;
     s->regs_ro[GEM_RXQBASE]  = 0x00000003;
     s->regs_ro[GEM_TXQBASE]  = 0x00000003;
@@ -807,7 +836,8 @@ static void gem_get_rx_desc(CadenceGEMState *s, int q)
     DB_PRINT("read descriptor 0x%x\n", (unsigned)s->rx_desc_addr[q]);
     /* read current descriptor */
     cpu_physical_memory_read(s->rx_desc_addr[q],
-                             (uint8_t *)s->rx_desc[q], sizeof(s->rx_desc[q]));
+                             (uint8_t *)s->rx_desc[q],
+                             sizeof(uint32_t) * gem_get_desc_len(s, true));
 
     /* Descriptor owned by software ? */
     if (rx_desc_get_ownership(s->rx_desc[q]) == 1) {
@@ -926,9 +956,10 @@ static ssize_t gem_receive(NetClientState *nc, const uint8_t *buf, size_t size)
                 rx_desc_get_buffer(s->rx_desc[q]));
 
         /* Copy packet data to emulated DMA buffer */
-        cpu_physical_memory_write(rx_desc_get_buffer(s->rx_desc[q]) +
-                                                                 rxbuf_offset,
-                                  rxbuf_ptr, MIN(bytes_to_copy, rxbufsize));
+        cpu_physical_memory_write(rx_desc_get_buffer(s, s->rx_desc[q]) +
+                                                                  rxbuf_offset,
+                                  rxbuf_ptr,
+                                  MIN(bytes_to_copy, rxbufsize));
         rxbuf_ptr += MIN(bytes_to_copy, rxbufsize);
         bytes_to_copy -= MIN(bytes_to_copy, rxbufsize);
 
@@ -964,7 +995,7 @@ static ssize_t gem_receive(NetClientState *nc, const uint8_t *buf, size_t size)
         /* Descriptor write-back.  */
         cpu_physical_memory_write(s->rx_desc_addr[q],
                                   (uint8_t *)s->rx_desc[q],
-                                  sizeof(s->rx_desc[q]));
+                                  sizeof(uint32_t) * gem_get_desc_len(s, true));
 
         /* Next descriptor */
         if (rx_desc_get_wrap(s->rx_desc[q])) {
@@ -972,7 +1003,7 @@ static ssize_t gem_receive(NetClientState *nc, const uint8_t *buf, size_t size)
             s->rx_desc_addr[q] = s->regs[GEM_RXQBASE];
         } else {
             DB_PRINT("incrementing RX descriptor list\n");
-            s->rx_desc_addr[q] += 8;
+            s->rx_desc_addr[q] += 4 * gem_get_desc_len(s, true);
         }
 
         gem_get_rx_desc(s, q);
@@ -1069,7 +1100,8 @@ static void gem_transmit(CadenceGEMState *s)
 
         DB_PRINT("read descriptor 0x%" HWADDR_PRIx "\n", packet_desc_addr);
         cpu_physical_memory_read(packet_desc_addr,
-                                 (uint8_t *)desc, sizeof(desc));
+                                 (uint8_t *)desc,
+                                 sizeof(uint32_t) * gem_get_desc_len(s, false));
         /* Handle all descriptors owned by hardware */
         while (tx_desc_get_used(desc) == 0) {
 
@@ -1082,7 +1114,7 @@ static void gem_transmit(CadenceGEMState *s)
             /* The real hardware would eat this (and possibly crash).
              * For QEMU let's lend a helping hand.
              */
-            if ((tx_desc_get_buffer(desc) == 0) ||
+            if ((tx_desc_get_buffer(s, desc) == 0) ||
                 (tx_desc_get_length(desc) == 0)) {
                 DB_PRINT("Invalid TX descriptor @ 0x%x\n",
                          (unsigned)packet_desc_addr);
@@ -1101,7 +1133,7 @@ static void gem_transmit(CadenceGEMState *s)
             /* Gather this fragment of the packet from "dma memory" to our
              * contig buffer.
              */
-            cpu_physical_memory_read(tx_desc_get_buffer(desc), p,
+            cpu_physical_memory_read(tx_desc_get_buffer(s, desc), p,
                                      tx_desc_get_length(desc));
             p += tx_desc_get_length(desc);
             total_bytes += tx_desc_get_length(desc);
@@ -1124,7 +1156,8 @@ static void gem_transmit(CadenceGEMState *s)
                 if (tx_desc_get_wrap(desc)) {
                     s->tx_desc_addr[q] = s->regs[GEM_TXQBASE];
                 } else {
-                    s->tx_desc_addr[q] = packet_desc_addr + 8;
+                    s->tx_desc_addr[q] = packet_desc_addr +
+                                         4 * gem_get_desc_len(s, false);
                 }
                 DB_PRINT("TX descriptor next: 0x%08x\n", s->tx_desc_addr[q]);
 
@@ -1168,11 +1201,11 @@ static void gem_transmit(CadenceGEMState *s)
                 tx_desc_set_last(desc);
                 packet_desc_addr = s->regs[GEM_TXQBASE];
             } else {
-                packet_desc_addr += 8;
+                packet_desc_addr += 4 * gem_get_desc_len(s, false);
             }
             DB_PRINT("read descriptor 0x%" HWADDR_PRIx "\n", packet_desc_addr);
-            cpu_physical_memory_read(packet_desc_addr,
-                                     (uint8_t *)desc, sizeof(desc));
+            cpu_physical_memory_read(packet_desc_addr, (uint8_t *)desc,
+                                sizeof(uint32_t) * gem_get_desc_len(s, false));
         }
 
         if (tx_desc_get_used(desc)) {
diff --git a/include/hw/net/cadence_gem.h b/include/hw/net/cadence_gem.h
index b33ef65..00dbf4f 100644
--- a/include/hw/net/cadence_gem.h
+++ b/include/hw/net/cadence_gem.h
@@ -33,7 +33,7 @@
 #define CADENCE_GEM_MAXREG        (0x00000800 / 4) /* Last valid GEM address */
 
 /* Max number of words in a DMA descriptor.  */
-#define DESC_MAX_NUM_WORDS              2
+#define DESC_MAX_NUM_WORDS              6
 
 #define MAX_PRIORITY_QUEUES             8
 #define MAX_TYPE1_SCREENERS             16
-- 
2.7.4

