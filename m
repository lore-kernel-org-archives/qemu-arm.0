Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp6437442wrt;
        Wed, 3 Oct 2018 08:14:03 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62OnerQPfGnEoo052f5+q218amf5MoHPW0H7RgLFvLbkuPSoWgsD+T4MB1FlNAa4snaslrv
X-Received: by 2002:a0c:d4c3:: with SMTP id y3-v6mr1670140qvh.106.1538579643204;
        Wed, 03 Oct 2018 08:14:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538579643; cv=none;
        d=google.com; s=arc-20160816;
        b=mJOfqaKgd6Oubvf498VX6bYEeuZgNwtjFDCe0MiMsoSMfdd4lRSPMGKrZrCFg82yX2
         8neoxXBeFs28hUSjZg8bDuNThiNm9cryO99Boy2iA6dKBOVjguhE5YHaSZ6XG7Lz80ni
         OFIgb/bwW7VzslZUhxtomYK/QZ2BdjFT130A34P2wdazYbj9OF0ujr3/OYxhQ5hK1HGc
         oF67m8/tV7RczUEwkBiqrwG9mM2D6f0ZHbM8eRFae53VTQ68EUVPJc7eOgie3tjEt0LG
         tt0FnTHFugGqgeQPZqEEJ2YixcTsCUJzXjCx3Qo0/0FpwDoL4SCRCBgiMcGd5lpvaQKB
         0O9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=BQHPdJ9A+i4isMKciLcPbndoZfjs8yaEIYBcNlf0oVY=;
        b=Q+LxRUywRzA/QdKAK1QnJcaDlDT1sDMp3qyfGEGA9IH4L//sF0OWZLLA3pf9reKyPO
         mw9qwrOSrSIOBTCFAUJGgIVhRjeYCIZde+TRqcAQDx3reBnip+ttuvtBVhM+jIPeWrzt
         k+HYRcB6tgI3vN6VMe9XVNUXv0R9kuuErWpVqRv/c60DGY/CAdy1n9boU3x8AnoEpLEa
         p7JFeWCcG72Lj0yxea+bMhXpDC6CSP7dE1E24LKm1CI0Aooi+4jzN/YtQI1SRMq5TdeZ
         R5EekAUcwkWmuGAsn147THyKVfSwMoOsbdmLLqyQ4NDzFNQlKj9ynILF61rSsLszPLFb
         nrJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ipBMtTen;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f198-v6si2176qka.333.2018.10.03.08.14.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Oct 2018 08:14:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ipBMtTen;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:49251 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g7iqg-0002U8-Kv
	for alex.bennee@linaro.org; Wed, 03 Oct 2018 11:14:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48323)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1g7iog-0008A8-Ar
	for qemu-arm@nongnu.org; Wed, 03 Oct 2018 11:12:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1g7ioa-0005iL-DG
	for qemu-arm@nongnu.org; Wed, 03 Oct 2018 11:11:58 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:44129)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1g7ioU-0005EI-2d; Wed, 03 Oct 2018 11:11:46 -0400
Received: by mail-pg1-x542.google.com with SMTP id g2-v6so1696995pgu.11;
	Wed, 03 Oct 2018 08:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=BQHPdJ9A+i4isMKciLcPbndoZfjs8yaEIYBcNlf0oVY=;
	b=ipBMtTenRbn3IhlXY8ixYMMQnMWhprSvaMqb9GV1r+lv3ONSGsCbAD4lJagpqr82yi
	55xKZjlFZlox/UGyFNyWJfEdgpn3tXhA/vKnCztGzuV2wTbnygnNOZXDXmlhJa+Z0Ndl
	cGHTM0AewvsYNRcn40qhNg1/X/waHwz9aFfSWz6zNMlLOvV5rjADcPVafii4ogNHrcsV
	BsZPg1yar7RnzBGcMgnh3IEcTSvJJY50sBL8SxSoOb4KN40nPWQA2PuSVGKXL+Jsr671
	+AFfJlaedE9WKvj1FV1Xx3dNlboCfeN7Y1SMRK9hmZzhtJHbME1RDDXaf9Gys/v/+jKj
	BNlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=BQHPdJ9A+i4isMKciLcPbndoZfjs8yaEIYBcNlf0oVY=;
	b=eycs/wczzUWsr7b2SJsOZCpOcvkEZaIAcLpqA5A6PaHvX23/t6+ol/p4s3qVV3ZRsT
	Vzn5W0YZgkz4xJqJJ6oCl663dRmtnI4R81EaDkDy+ezcqrgtexg6R1QzR+Miur3USC4a
	ZavH1XjgOJZjtd33d4IzbYQu20EXI1MnTKflX7LlF308TM/MTiBu6TBLP1zQ+3YdTFr7
	l6AkIPZr9P6r4FKHRIOmmDPqrzjBl4JBP+7f0cp5hqbuO3dJLVbxyRj1atGSIlb9AjQb
	3poV08oyYVLCw1HcZ47tkM6SLHNbwXuwR83XA96PhszDXbb0rR2mbPVy9JFXCfRU/GIR
	Tjnw==
X-Gm-Message-State: ABuFfogVfIzkP8Z38et5XTESc2c9kKdgo4CLFlGiUfb3ciNZpGwMnypR
	6ThFlYZovxxbSIMrmxmZKFsq0pBeC2g=
X-Received: by 2002:a63:b4b:: with SMTP id a11-v6mr1684333pgl.97.1538579504459;
	Wed, 03 Oct 2018 08:11:44 -0700 (PDT)
Received: from localhost ([149.199.62.254]) by smtp.gmail.com with ESMTPSA id
	70-v6sm3277385pfz.27.2018.10.03.08.11.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Oct 2018 08:11:43 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Wed,  3 Oct 2018 22:07:40 +0700
Message-Id: <1538579266-8389-7-git-send-email-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1538579266-8389-1-git-send-email-edgar.iglesias@gmail.com>
References: <1538579266-8389-1-git-send-email-edgar.iglesias@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: [Qemu-arm] [PATCH v1 06/12] net: cadence_gem: Add support for
 selecting the DMA MemoryRegion
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
X-TUID: 5cF1QLuwXLzP

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Add support for selecting the Memory Region that the GEM
will do DMA to.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/net/cadence_gem.c         | 63 ++++++++++++++++++++++++++++----------------
 include/hw/net/cadence_gem.h |  2 ++
 2 files changed, 43 insertions(+), 22 deletions(-)

diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index 759c1d7..ab02515 100644
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
+    address_space_read(s->dma_as, s->rx_desc_addr[q], MEMTXATTRS_UNSPECIFIED,
+                       (uint8_t *)s->rx_desc[q],
+                       sizeof(uint32_t) * gem_get_desc_len(s, true));
 
     /* Descriptor owned by software ? */
     if (rx_desc_get_ownership(s->rx_desc[q]) == 1) {
@@ -956,10 +957,10 @@ static ssize_t gem_receive(NetClientState *nc, const uint8_t *buf, size_t size)
                 rx_desc_get_buffer(s->rx_desc[q]));
 
         /* Copy packet data to emulated DMA buffer */
-        cpu_physical_memory_write(rx_desc_get_buffer(s, s->rx_desc[q]) +
+        address_space_write(s->dma_as, rx_desc_get_buffer(s, s->rx_desc[q]) +
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
+        address_space_write(s->dma_as, s->rx_desc_addr[q],
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
+        address_space_read(s->dma_as, packet_desc_addr,
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
+            address_space_read(s->dma_as, tx_desc_get_buffer(s, desc),
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
+                address_space_read(s->dma_as, s->tx_desc_addr[q],
+                                   MEMTXATTRS_UNSPECIFIED,
+                                   (uint8_t *)desc_first,
+                                   sizeof(desc_first));
                 tx_desc_set_used(desc_first);
-                cpu_physical_memory_write(s->tx_desc_addr[q],
-                                          (uint8_t *)desc_first,
-                                          sizeof(desc_first));
+                address_space_write(s->dma_as, s->tx_desc_addr[q],
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
+            address_space_read(s->dma_as, packet_desc_addr,
+                              MEMTXATTRS_UNSPECIFIED, (uint8_t *)desc,
+                              sizeof(uint32_t) * gem_get_desc_len(s, false));
         }
 
         if (tx_desc_get_used(desc)) {
@@ -1500,6 +1506,13 @@ static void gem_realize(DeviceState *dev, Error **errp)
     CadenceGEMState *s = CADENCE_GEM(dev);
     int i;
 
+    if (s->dma_mr) {
+        s->dma_as = g_malloc0(sizeof(AddressSpace));
+        address_space_init(s->dma_as, s->dma_mr, NULL);
+    } else {
+        s->dma_as = &address_space_memory;
+    }
+
     if (s->num_priority_queues == 0 ||
         s->num_priority_queues > MAX_PRIORITY_QUEUES) {
         error_setg(errp, "Invalid num-priority-queues value: %" PRIx8,
@@ -1537,6 +1550,12 @@ static void gem_init(Object *obj)
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
index 00dbf4f..c8f0751 100644
--- a/include/hw/net/cadence_gem.h
+++ b/include/hw/net/cadence_gem.h
@@ -45,6 +45,8 @@ typedef struct CadenceGEMState {
 
     /*< public >*/
     MemoryRegion iomem;
+    MemoryRegion *dma_mr;
+    AddressSpace *dma_as;
     NICState *nic;
     NICConf conf;
     qemu_irq irq[MAX_PRIORITY_QUEUES];
-- 
2.7.4

