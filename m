Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp1811251wrt;
        Wed, 10 Oct 2018 19:21:25 -0700 (PDT)
X-Google-Smtp-Source: ACcGV619vTNg1QBtwwCXbys+3YwpuOzqbb3X8BD/t+XYaOQjFsX1mJek1GpGWxwRYkSvScrrT3TF
X-Received: by 2002:a37:1f88:: with SMTP id n8-v6mr28686432qkh.64.1539224485686;
        Wed, 10 Oct 2018 19:21:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539224485; cv=none;
        d=google.com; s=arc-20160816;
        b=K4X15OXNtow3Cd3utGCiEdzBjB7KyU7LN+k+kYOOiVFTCLKrwVZ0SJddNzdwup5UpS
         fUthSRPUb+GscwcDR/62V7MYLB3aiBbX9HreNAiY6vqZOLMpYz1HrcmgYqBfDLMMG1V5
         dXqi9WJjLjm9Msp4RKkTr6UR40eEbcVQFiJUlvrWbOlPIOVnBRkWoCr8jCOennKGftoJ
         u4izU4uA5O4zD976IAA7YXvp2g2UD09b7N6GitWiNGAQDj7qJ7J1YlUfF8PMnfJGHzzg
         Nakr+VLHozwjcsUql6GkGkPny+O7ZXItJm5uzQNjwnQnxTv7vA84kYOBOy9L43daf0lf
         T6FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=PoMNBb4y4WNcafGj9+0fzqR/7wJPoAHQ54741nz+/jI=;
        b=mzAAuzAd/YC3dFMxC7F1w7jWFD8uYjI6vs2PgmXMFObhLwioJBD0L8UOpm7ag45VdY
         FOPONIu+HC108FEhGV6sfhplVQgcfKDeREJHyC8Fy2o8O8nq/8G4FcFtjDd7ire0f06n
         2swsqy0I6flAViUQCASL/PG0L46Lt2f0aZ963t1e0A72Gioqc7XCHFi2jxjSPjtVRxLm
         Pss6uMgGoFJp+ZDQbL3iFChMT+b+7YZoiz0QTu870BEHt1MkatyHhoqq+JjIJVOTpRVE
         Oc8kxA4gn10MDtJsiCNUX6dmwMBqX+3WJ9sqQ65x3CAAKUxzW/9WYV9sRQUNj4ZvKtnB
         chPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=gbLe2Zwf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g8si3269428qvd.216.2018.10.10.19.21.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 10 Oct 2018 19:21:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=gbLe2Zwf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:59957 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gAQbN-0002j3-31
	for alex.bennee@linaro.org; Wed, 10 Oct 2018 22:21:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48638)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1gAQZj-0002Ay-Vo
	for qemu-devel@nongnu.org; Wed, 10 Oct 2018 22:19:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1gAQZi-0004NQ-R1
	for qemu-devel@nongnu.org; Wed, 10 Oct 2018 22:19:43 -0400
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:45088)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1gAQZi-0004MV-E6; Wed, 10 Oct 2018 22:19:42 -0400
Received: by mail-lj1-x242.google.com with SMTP id j4-v6so6710591ljc.12;
	Wed, 10 Oct 2018 19:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=PoMNBb4y4WNcafGj9+0fzqR/7wJPoAHQ54741nz+/jI=;
	b=gbLe2Zwf8nTGawqk9L/w+VCws6cXQglO8P6LSB5XvLqtbbi1q/Mz1nYfAUQMCCwPZW
	KdzXAir3J3kZQqFRiI7d3zdOIWwmiUz9/pmfQG5Bo727TdMk6Urp9mb3xqgI0EiIROo8
	LyF/NeJ4GIoIL1IeYqDfFUynmzBVgJbVLNYnTcUrQvF4+ZqDGexmd/TeAC4tOhwqSVBS
	R1HDWHXFPjTV4FXyO+j7mFvO1SHIkDNt3NLnAtePl0lXDHuXcp76q1teDVZJUL7/Xm3L
	EoYqZddbrlFc6wrnWeak7664rqyVA99TySs75k7mIedXZKslpExn0VL1bv4WfMoXyO9U
	k5Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=PoMNBb4y4WNcafGj9+0fzqR/7wJPoAHQ54741nz+/jI=;
	b=QhjxvDXeHOm3uh85Y0dhEgvfMg1O8T5HLHQJ6T0MUjfAVWULKQgWr6W5IxbEZLiCJD
	w1xdPPytZIARUQ5TZEEL9wVQ9MwCEHzuuaYLA7zdDQRIjgkX3FRGq7U6p3Jz7ICqIVoV
	zkrMllbeOSngBed7+/Okd90qNsm3uBnY3JLfc8yjZRiZ3haWMqTd7LKyYfOzRmhN9ZF1
	Ndah310mxqfyKCYlJVZR6VjdmnUL4NQJpZvAhYSgn6ldd0zf0aNj0WTwXH6iR8AW94/p
	mmhjqwgIivfS4yj76CTHsF8GwcYmdDBceda97lKcbwr+fZh7UJa06Rah8j49N7xHVW1Q
	FS6Q==
X-Gm-Message-State: ABuFfogrS5+NPxFhdrfnHXkE11QjJRPRQ7yZ62t0oyO9D7IlueHNnEFa
	VTKnHUdCwN5t3budjKDI0FErMJHIv/s=
X-Received: by 2002:a2e:47:: with SMTP id 68-v6mr23855146lja.123.1539224380815;
	Wed, 10 Oct 2018 19:19:40 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
	by smtp.gmail.com with ESMTPSA id
	l14-v6sm5814486ljc.68.2018.10.10.19.19.39
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 10 Oct 2018 19:19:39 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Thu, 11 Oct 2018 04:19:24 +0200
Message-Id: <20181011021931.4249-6-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181011021931.4249-1-edgar.iglesias@gmail.com>
References: <20181011021931.4249-1-edgar.iglesias@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::242
Subject: [Qemu-devel] [PATCH v2 05/12] net: cadence_gem: Add support for
 extended descriptors
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
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
	edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
	frasse.iglesias@gmail.com, alistair@alistair23.me,
	richard.henderson@linaro.org, frederic.konrad@adacore.com,
	philmd@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5lrMBKSUjAds

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Add support for extended descriptors with optional 64bit
addressing and timestamping. QEMU will not yet provide
timestamps (always leaving the valid timestamp bit as zero).

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/net/cadence_gem.c         | 69 ++++++++++++++++++++++++++----------
 include/hw/net/cadence_gem.h |  2 +-
 2 files changed, 52 insertions(+), 19 deletions(-)

diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index 4d769b0244..759c1d71e0 100644
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
index b33ef6513b..00dbf4f72e 100644
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
2.17.1

