Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp1818843wrt;
        Wed, 10 Oct 2018 19:28:30 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62HLCwEcsxWJVdKy6cvpZ1gu6VyiDhX3sUjd+el0325RAMfIQ52A3B2NMCFoutbJBfFnYKQ
X-Received: by 2002:a0c:d238:: with SMTP id m53mr15291588qvh.195.1539224910197;
        Wed, 10 Oct 2018 19:28:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539224910; cv=none;
        d=google.com; s=arc-20160816;
        b=wcbIs1HkOLUoAAKOFPgTGYqdXIBCtBGaM6fbzuOVZtUFuMQPtV0+bc62Y3e9m5CR61
         sBOciLCBYNwf33iTJConEGbmWQHaTD477XS//LJZx4zoCCsUckpqBM11L/f3E2js1Bnb
         EDJ9SaD/V8z60RAyttW4AvnqpMIbBoUrMDM8wW82tK1pjx46XAzQDKP6rCkglRDHwesW
         dLgZ7vu/Tj1osNxauyJkF5FZBgIRsIB/i3rd8t172k2jFv8n3dXHtiWLrZx608OpWIme
         v/UQGnfQFWv51aaIGuCugjzE9Z0Jd/gwtQTT1Mfsm37koBS+MKbqXo4nvXdWLqT54om4
         sLyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=fFsvrKm4gciGypCuNSgPGrf2QrNVmIfJiqo8XHJxGlI=;
        b=zV47aEa3nNhh3+pXumEMcgVLiNbtZcBr9Q0ygujtIV7uuamuIUwKsm/rJouhoxRLT+
         Q2SBPDzdTi8D9momj1lgvLWVyD97pDLvrIbyeJabiv384U5xdTHPEcICjZLp93pe6VLx
         B6uxoX9g0vrWLyGsy2WZjaJe+HeAGey/eLwc9DmrSZCItfKVqZqVuoJircyA57DICdHg
         quPDbTANUHtGS5GuEHv7LtIddyeGmDRwc6Hcp0BR1Pch51pxv5gt6FHKfQtUnA6DvKgW
         vnb4oPpZ7Oab9Hn6unqxigfange0qfIfxbAX83cZ5fBVINm8DsOSndg+Tpy5zn0jorTJ
         UyKg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=mOiAGdQl;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h6-v6si4056073qkd.28.2018.10.10.19.28.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 10 Oct 2018 19:28:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=mOiAGdQl;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60010 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gAQiD-00007t-Lq
	for alex.bennee@linaro.org; Wed, 10 Oct 2018 22:28:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48652)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1gAQZl-0002Co-Eq
	for qemu-devel@nongnu.org; Wed, 10 Oct 2018 22:19:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1gAQZk-0004OI-Dw
	for qemu-devel@nongnu.org; Wed, 10 Oct 2018 22:19:45 -0400
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:45089)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1gAQZk-0004Ni-25; Wed, 10 Oct 2018 22:19:44 -0400
Received: by mail-lj1-x243.google.com with SMTP id j4-v6so6710610ljc.12;
	Wed, 10 Oct 2018 19:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=fFsvrKm4gciGypCuNSgPGrf2QrNVmIfJiqo8XHJxGlI=;
	b=mOiAGdQl11vYHs1cB9rlO+tdZZkHCt8aio0L4mH1rO/ew6QFebjA9lts/peXKOzBvV
	uIOIbQYTh3NLTPv+fB9w1GQqXJBjX269Jp7dZH3yQhWqpVclSSZ40XhcwlaCqQxPWFW/
	Gr7Yp2L/miWUc4eFqeb1qH+8+fSZhdr5x9MNYtw6Jkseq5RXbL+PNcuhVbK0lbqE65xu
	TN1v3t3vhtfHwhQW60gkuqC/mOXjWW4x8AqPPQDW6MNgtZuQ6xOn3GsYFPd4mCw6S3Tb
	RKgzR1kPL3Ouearz+h+PPs3Dl8afGS0t+xjDL7cq/A3bc3mRDIJg0kj49V+oV7aMXNBo
	YMFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=fFsvrKm4gciGypCuNSgPGrf2QrNVmIfJiqo8XHJxGlI=;
	b=tTaADaixewLSnYCyTtD98cksPjHWlYIFwa495O3bjQOWiQatbfvImjEksHshEWjZod
	oxZ50Nn3zGe3IqwaedKYk9pDRiweAYu2rC3M7UZMwrNiSzf8OodRxonLOfNchVnk7f99
	2pCeZWLBCrMBZ4EkI9oajWJggngeuqm+PwTmkGc5tK7+OH4EFcTmFPjHwgkODcIeAoE8
	qH+mrMU97A7e6iK7Lv39Hcghl5NRD8mLxvmcWKCLKO9WXrhWXqz5dqwB1yfEaoPVOore
	LReuwWUdkt3c7VXwvRsXA50miF2gl1yKUqB9qUYX1bWm2DyznNcfwpTspXYn1dg7p8+1
	a0bw==
X-Gm-Message-State: ABuFfoh3T+KHQSAXZwe/TdEtkKm9wZRCV5einBYqWWrxtGU8gXXXQxud
	77o2gtcMl87U9msodZUQ9qBgLTaLVTQ=
X-Received: by 2002:a2e:8514:: with SMTP id
	j20-v6mr21850034lji.111.1539224382540; 
	Wed, 10 Oct 2018 19:19:42 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
	by smtp.gmail.com with ESMTPSA id
	u70-v6sm5457971lfg.48.2018.10.10.19.19.41
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 10 Oct 2018 19:19:41 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Thu, 11 Oct 2018 04:19:25 +0200
Message-Id: <20181011021931.4249-7-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181011021931.4249-1-edgar.iglesias@gmail.com>
References: <20181011021931.4249-1-edgar.iglesias@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::243
Subject: [Qemu-devel] [PATCH v2 06/12] net: cadence_gem: Add support for
 selecting the DMA MemoryRegion
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
X-TUID: oPh0hbzbOD1Z

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Add support for selecting the Memory Region that the GEM
will do DMA to.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/net/cadence_gem.c         | 59 ++++++++++++++++++++++--------------
 include/hw/net/cadence_gem.h |  2 ++
 2 files changed, 39 insertions(+), 22 deletions(-)

diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index 759c1d71e0..a40f136285 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -28,6 +28,7 @@
 #include "hw/net/cadence_gem.h"
 #include "qapi/error.h"
 #include "qemu/log.h"
+#include "sysemu/dma.h"
 #include "net/checksum.h"
 
 #ifdef CADENCE_GEM_ERR_DEBUG
@@ -835,9 +836,9 @@ static void gem_get_rx_desc(CadenceGEMState *s, int q)
 {
     DB_PRINT("read descriptor 0x%x\n", (unsigned)s->rx_desc_addr[q]);
     /* read current descriptor */
-    cpu_physical_memory_read(s->rx_desc_addr[q],
-                             (uint8_t *)s->rx_desc[q],
-                             sizeof(uint32_t) * gem_get_desc_len(s, true));
+    address_space_read(&s->dma_as, s->rx_desc_addr[q], MEMTXATTRS_UNSPECIFIED,
+                       (uint8_t *)s->rx_desc[q],
+                       sizeof(uint32_t) * gem_get_desc_len(s, true));
 
     /* Descriptor owned by software ? */
     if (rx_desc_get_ownership(s->rx_desc[q]) == 1) {
@@ -956,10 +957,10 @@ static ssize_t gem_receive(NetClientState *nc, const uint8_t *buf, size_t size)
                 rx_desc_get_buffer(s->rx_desc[q]));
 
         /* Copy packet data to emulated DMA buffer */
-        cpu_physical_memory_write(rx_desc_get_buffer(s, s->rx_desc[q]) +
+        address_space_write(&s->dma_as, rx_desc_get_buffer(s, s->rx_desc[q]) +
                                                                   rxbuf_offset,
-                                  rxbuf_ptr,
-                                  MIN(bytes_to_copy, rxbufsize));
+                            MEMTXATTRS_UNSPECIFIED, rxbuf_ptr,
+                            MIN(bytes_to_copy, rxbufsize));
         rxbuf_ptr += MIN(bytes_to_copy, rxbufsize);
         bytes_to_copy -= MIN(bytes_to_copy, rxbufsize);
 
@@ -993,9 +994,10 @@ static ssize_t gem_receive(NetClientState *nc, const uint8_t *buf, size_t size)
         }
 
         /* Descriptor write-back.  */
-        cpu_physical_memory_write(s->rx_desc_addr[q],
-                                  (uint8_t *)s->rx_desc[q],
-                                  sizeof(uint32_t) * gem_get_desc_len(s, true));
+        address_space_write(&s->dma_as, s->rx_desc_addr[q],
+                            MEMTXATTRS_UNSPECIFIED,
+                            (uint8_t *)s->rx_desc[q],
+                            sizeof(uint32_t) * gem_get_desc_len(s, true));
 
         /* Next descriptor */
         if (rx_desc_get_wrap(s->rx_desc[q])) {
@@ -1099,9 +1101,9 @@ static void gem_transmit(CadenceGEMState *s)
         packet_desc_addr = s->tx_desc_addr[q];
 
         DB_PRINT("read descriptor 0x%" HWADDR_PRIx "\n", packet_desc_addr);
-        cpu_physical_memory_read(packet_desc_addr,
-                                 (uint8_t *)desc,
-                                 sizeof(uint32_t) * gem_get_desc_len(s, false));
+        address_space_read(&s->dma_as, packet_desc_addr,
+                           MEMTXATTRS_UNSPECIFIED, (uint8_t *)desc,
+                           sizeof(uint32_t) * gem_get_desc_len(s, false));
         /* Handle all descriptors owned by hardware */
         while (tx_desc_get_used(desc) == 0) {
 
@@ -1133,8 +1135,9 @@ static void gem_transmit(CadenceGEMState *s)
             /* Gather this fragment of the packet from "dma memory" to our
              * contig buffer.
              */
-            cpu_physical_memory_read(tx_desc_get_buffer(s, desc), p,
-                                     tx_desc_get_length(desc));
+            address_space_read(&s->dma_as, tx_desc_get_buffer(s, desc),
+                               MEMTXATTRS_UNSPECIFIED,
+                               p, tx_desc_get_length(desc));
             p += tx_desc_get_length(desc);
             total_bytes += tx_desc_get_length(desc);
 
@@ -1145,13 +1148,15 @@ static void gem_transmit(CadenceGEMState *s)
                 /* Modify the 1st descriptor of this packet to be owned by
                  * the processor.
                  */
-                cpu_physical_memory_read(s->tx_desc_addr[q],
-                                         (uint8_t *)desc_first,
-                                         sizeof(desc_first));
+                address_space_read(&s->dma_as, s->tx_desc_addr[q],
+                                   MEMTXATTRS_UNSPECIFIED,
+                                   (uint8_t *)desc_first,
+                                   sizeof(desc_first));
                 tx_desc_set_used(desc_first);
-                cpu_physical_memory_write(s->tx_desc_addr[q],
-                                          (uint8_t *)desc_first,
-                                          sizeof(desc_first));
+                address_space_write(&s->dma_as, s->tx_desc_addr[q],
+                                  MEMTXATTRS_UNSPECIFIED,
+                                  (uint8_t *)desc_first,
+                                   sizeof(desc_first));
                 /* Advance the hardware current descriptor past this packet */
                 if (tx_desc_get_wrap(desc)) {
                     s->tx_desc_addr[q] = s->regs[GEM_TXQBASE];
@@ -1204,8 +1209,9 @@ static void gem_transmit(CadenceGEMState *s)
                 packet_desc_addr += 4 * gem_get_desc_len(s, false);
             }
             DB_PRINT("read descriptor 0x%" HWADDR_PRIx "\n", packet_desc_addr);
-            cpu_physical_memory_read(packet_desc_addr, (uint8_t *)desc,
-                                sizeof(uint32_t) * gem_get_desc_len(s, false));
+            address_space_read(&s->dma_as, packet_desc_addr,
+                              MEMTXATTRS_UNSPECIFIED, (uint8_t *)desc,
+                              sizeof(uint32_t) * gem_get_desc_len(s, false));
         }
 
         if (tx_desc_get_used(desc)) {
@@ -1500,6 +1506,9 @@ static void gem_realize(DeviceState *dev, Error **errp)
     CadenceGEMState *s = CADENCE_GEM(dev);
     int i;
 
+    address_space_init(&s->dma_as,
+                       s->dma_mr ? s->dma_mr : get_system_memory(), "dma");
+
     if (s->num_priority_queues == 0 ||
         s->num_priority_queues > MAX_PRIORITY_QUEUES) {
         error_setg(errp, "Invalid num-priority-queues value: %" PRIx8,
@@ -1537,6 +1546,12 @@ static void gem_init(Object *obj)
                           "enet", sizeof(s->regs));
 
     sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->iomem);
+
+    object_property_add_link(obj, "dma", TYPE_MEMORY_REGION,
+                             (Object **)&s->dma_mr,
+                             qdev_prop_allow_set_link_before_realize,
+                             OBJ_PROP_LINK_STRONG,
+                             &error_abort);
 }
 
 static const VMStateDescription vmstate_cadence_gem = {
diff --git a/include/hw/net/cadence_gem.h b/include/hw/net/cadence_gem.h
index 00dbf4f72e..5426961d91 100644
--- a/include/hw/net/cadence_gem.h
+++ b/include/hw/net/cadence_gem.h
@@ -45,6 +45,8 @@ typedef struct CadenceGEMState {
 
     /*< public >*/
     MemoryRegion iomem;
+    MemoryRegion *dma_mr;
+    AddressSpace dma_as;
     NICState *nic;
     NICConf conf;
     qemu_irq irq[MAX_PRIORITY_QUEUES];
-- 
2.17.1

