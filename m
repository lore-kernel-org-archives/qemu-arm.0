Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp1814802wrt;
        Wed, 10 Oct 2018 19:23:44 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60Qf5qG9+QEs5eE1Nvxpjk1AEZdmROFOUclqPdaOi+nvdi0ZgVX0eEDZTzQPDFJE2R2hXEm
X-Received: by 2002:a0c:f042:: with SMTP id b2-v6mr28805750qvl.232.1539224624819;
        Wed, 10 Oct 2018 19:23:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539224624; cv=none;
        d=google.com; s=arc-20160816;
        b=AmBm/5VaOzRefDAYM6vKKRsvk5PhkOJbghZujlsHoHNrc5xN3Q2SsbvSjPhb2Y9H6H
         Y83oixkji1pGtJOPTMHFcVbypeQ5utRY6ywCyjWdsYa6vU4vFQbs5Nor7UK8uuuIr/Qy
         oH5Z7gb0uIm5FFUnaFFjFy9vLx89Hn1pegERzL0RwUmMuzGhKIdWnhw4BpGfdpks0KbU
         ReYhF8+NR7AoLeKmA64IbahI8NECG2do0iy/wkBhmT1bYA395XyakwC+fvQPh149sy46
         TM6XZqxRHhS67OK4ob1mmRPouUN8FtfQigik3LCM09AjLvCfj9PE10uzdofB2Wg5FoHG
         IUTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=0EQu0b7RMWKAQ01R9kLnWzc8ZLJswAUfMyJlMqWy2v4=;
        b=RQdtQthOM77l/OOqTD0CTwNDkx+jyzb6X+LhJjOeMaQKeOeEfeL5/Ce4tCJP7o/cQw
         Efb2LzaH0UweB2l6WJ4JHKlzpxA+BxB221mnXHuNvc66sDrO6yCgpls7+/n6QF+OtJZa
         08fAn9JcP7vImzO6UgK3e7b7Y/ru3AZdRYsZAndqW+z7NPppDCUTSiUR9HOa4zwFr1w2
         O3KbqiRtlkpbIjNsH1hM58v56xj48USVYzeH8NGG0UaThOA1mlSIRByOeE48Vz01Fc4x
         R6e6m+J78hh6Xiy7TV3jtZuEnJ/Wa+LKO33CnXkFTiJ2/wJKOVxj1U5Y64lDE8/J9IgZ
         QJ7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=D4JJLq9s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b11-v6si2443068qvl.127.2018.10.10.19.23.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 10 Oct 2018 19:23:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=D4JJLq9s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:59976 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gAQdc-0005Ak-6D
	for alex.bennee@linaro.org; Wed, 10 Oct 2018 22:23:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48760)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1gAQZu-0002Ig-CT
	for qemu-arm@nongnu.org; Wed, 10 Oct 2018 22:19:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1gAQZt-0004TY-C7
	for qemu-arm@nongnu.org; Wed, 10 Oct 2018 22:19:54 -0400
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141]:46674)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1gAQZl-0004OW-Ok; Wed, 10 Oct 2018 22:19:45 -0400
Received: by mail-lf1-x141.google.com with SMTP id z144-v6so5468161lff.13;
	Wed, 10 Oct 2018 19:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=0EQu0b7RMWKAQ01R9kLnWzc8ZLJswAUfMyJlMqWy2v4=;
	b=D4JJLq9sypum/wVI8s6rK/w/lYnMlQT4pjcqufIqEJwk/ZkMZYqqxdEZYpbc3Wca+8
	924/hWYi3gCLxLAm9mFvEMQPebFRUZJdb90gIuH68EmuIr6D+0D5wxJaGkYY+5CBRbq7
	oWcnf4+S1m5UkF/OBEZu2ZW3bpG6r9YLQY6sOg6JUOuZlWiZpsERdY3+USUAKmYlpPjp
	HEgukz0BBU1Tifsin7pIaI4iZRC9KhN9X8wuEJTy1GAvTCPAp1bDC7gPkYWtGWFmh/lC
	b0M7dwq2z/pdr1LCRdHh1CHPKPUd+CU1dF6+cKnAo/Uj6IKslSZgRGkItbkwOVXjZUsS
	IfZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=0EQu0b7RMWKAQ01R9kLnWzc8ZLJswAUfMyJlMqWy2v4=;
	b=MJjZrb6R3slGFo45iYZeJL+XzdiMtC9BNKDxcNG4FdxXB+tBTSukKI0GxyXT64LXas
	7E89KQcng+EjGfg88jwP15EcqJ1QwWDPzYKZHwi7oixQyXCBb0NU9pUSv2pQglQlUhM5
	T5pyoimCs54F1SRLfd93QcAWpPh+Hwzk31PFT+TudPlFt8P0mcN1hwuDxl7IFhQUEkMX
	3rpcvDM1mW+RiRSlS5E9ULOPLTYVu/ARUjSGzykCrqJF3q/cdtaNzujXzL3XkGDSTJmR
	ujhft3wpubcQrIkHZUDAKrj6Ulx88redEhfKhMNCzdC0jjSADPQI056LzIDVEzWHP/r+
	oUVw==
X-Gm-Message-State: ABuFfojbM4kS4Mu0Xh1O4xpFvYy7EjBDuLMsLA6/dp8C4QPg6bzNNl8O
	OCYRlP8/ZraIHDmSp1yph8NIIyQ/gyo=
X-Received: by 2002:a19:169d:: with SMTP id
	29-v6mr19164901lfw.151.1539224384102; 
	Wed, 10 Oct 2018 19:19:44 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
	by smtp.gmail.com with ESMTPSA id
	i143-v6sm3970430lfi.57.2018.10.10.19.19.43
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 10 Oct 2018 19:19:43 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Thu, 11 Oct 2018 04:19:26 +0200
Message-Id: <20181011021931.4249-8-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181011021931.4249-1-edgar.iglesias@gmail.com>
References: <20181011021931.4249-1-edgar.iglesias@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::141
Subject: [Qemu-arm] [PATCH v2 07/12] net: cadence_gem: Implement support for
 64bit descriptor addresses
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
	richard.henderson@linaro.org, frederic.konrad@adacore.com,
	philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 04KoFMhRyHk/

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Implement support for 64bit descriptor addresses.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/net/cadence_gem.c | 47 ++++++++++++++++++++++++++++++++++++--------
 1 file changed, 39 insertions(+), 8 deletions(-)

diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index a40f136285..550225c15b 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -153,6 +153,9 @@
 #define GEM_RECEIVE_Q1_PTR              (0x00000480 / 4)
 #define GEM_RECEIVE_Q7_PTR              (GEM_RECEIVE_Q1_PTR + 6)
 
+#define GEM_TBQPH                       (0x000004C8 / 4)
+#define GEM_RBQPH                       (0x000004D4 / 4)
+
 #define GEM_INT_Q1_ENABLE               (0x00000600 / 4)
 #define GEM_INT_Q7_ENABLE               (GEM_INT_Q1_ENABLE + 6)
 
@@ -832,18 +835,42 @@ static int get_queue_from_screen(CadenceGEMState *s, uint8_t *rxbuf_ptr,
     return 0;
 }
 
+static hwaddr gem_get_desc_addr(CadenceGEMState *s, bool tx, int q)
+{
+    hwaddr desc_addr = 0;
+
+    if (s->regs[GEM_DMACFG] & GEM_DMACFG_ADDR_64B) {
+        desc_addr = s->regs[tx ? GEM_TBQPH : GEM_RBQPH];
+    }
+    desc_addr <<= 32;
+    desc_addr |= tx ? s->tx_desc_addr[q] : s->rx_desc_addr[q];
+    return desc_addr;
+}
+
+static hwaddr gem_get_tx_desc_addr(CadenceGEMState *s, int q)
+{
+    return gem_get_desc_addr(s, true, q);
+}
+
+static hwaddr gem_get_rx_desc_addr(CadenceGEMState *s, int q)
+{
+    return gem_get_desc_addr(s, false, q);
+}
+
 static void gem_get_rx_desc(CadenceGEMState *s, int q)
 {
-    DB_PRINT("read descriptor 0x%x\n", (unsigned)s->rx_desc_addr[q]);
+    hwaddr desc_addr = gem_get_rx_desc_addr(s, q);
+
+    DB_PRINT("read descriptor 0x%" HWADDR_PRIx "\n", desc_addr);
+
     /* read current descriptor */
-    address_space_read(&s->dma_as, s->rx_desc_addr[q], MEMTXATTRS_UNSPECIFIED,
+    address_space_read(&s->dma_as, desc_addr, MEMTXATTRS_UNSPECIFIED,
                        (uint8_t *)s->rx_desc[q],
                        sizeof(uint32_t) * gem_get_desc_len(s, true));
 
     /* Descriptor owned by software ? */
     if (rx_desc_get_ownership(s->rx_desc[q]) == 1) {
-        DB_PRINT("descriptor 0x%x owned by sw.\n",
-                 (unsigned)s->rx_desc_addr[q]);
+        DB_PRINT("descriptor 0x%" HWADDR_PRIx " owned by sw.\n", desc_addr);
         s->regs[GEM_RXSTATUS] |= GEM_RXSTATUS_NOBUF;
         s->regs[GEM_ISR] |= GEM_INT_RXUSED & ~(s->regs[GEM_IMR]);
         /* Handle interrupt consequences */
@@ -947,6 +974,8 @@ static ssize_t gem_receive(NetClientState *nc, const uint8_t *buf, size_t size)
     q = get_queue_from_screen(s, rxbuf_ptr, rxbufsize);
 
     while (bytes_to_copy) {
+        hwaddr desc_addr;
+
         /* Do nothing if receive is not enabled. */
         if (!gem_can_receive(nc)) {
             assert(!first_desc);
@@ -994,7 +1023,8 @@ static ssize_t gem_receive(NetClientState *nc, const uint8_t *buf, size_t size)
         }
 
         /* Descriptor write-back.  */
-        address_space_write(&s->dma_as, s->rx_desc_addr[q],
+        desc_addr = gem_get_rx_desc_addr(s, q);
+        address_space_write(&s->dma_as, desc_addr,
                             MEMTXATTRS_UNSPECIFIED,
                             (uint8_t *)s->rx_desc[q],
                             sizeof(uint32_t) * gem_get_desc_len(s, true));
@@ -1098,7 +1128,7 @@ static void gem_transmit(CadenceGEMState *s)
 
     for (q = s->num_priority_queues - 1; q >= 0; q--) {
         /* read current descriptor */
-        packet_desc_addr = s->tx_desc_addr[q];
+        packet_desc_addr = gem_get_tx_desc_addr(s, q);
 
         DB_PRINT("read descriptor 0x%" HWADDR_PRIx "\n", packet_desc_addr);
         address_space_read(&s->dma_as, packet_desc_addr,
@@ -1144,16 +1174,17 @@ static void gem_transmit(CadenceGEMState *s)
             /* Last descriptor for this packet; hand the whole thing off */
             if (tx_desc_get_last(desc)) {
                 uint32_t desc_first[DESC_MAX_NUM_WORDS];
+                hwaddr desc_addr = gem_get_tx_desc_addr(s, q);
 
                 /* Modify the 1st descriptor of this packet to be owned by
                  * the processor.
                  */
-                address_space_read(&s->dma_as, s->tx_desc_addr[q],
+                address_space_read(&s->dma_as, desc_addr,
                                    MEMTXATTRS_UNSPECIFIED,
                                    (uint8_t *)desc_first,
                                    sizeof(desc_first));
                 tx_desc_set_used(desc_first);
-                address_space_write(&s->dma_as, s->tx_desc_addr[q],
+                address_space_write(&s->dma_as, desc_addr,
                                   MEMTXATTRS_UNSPECIFIED,
                                   (uint8_t *)desc_first,
                                    sizeof(desc_first));
-- 
2.17.1

