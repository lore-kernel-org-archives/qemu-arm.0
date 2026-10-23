Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367E5606A31E
	for <qemu-arm@archiver.kernel.org>; Fri, 23 Oct 2026 14:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mTSZZTb2
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xKFoK-00014K-Iu; Fri, 23 Oct 2026 09:59:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcelomanzo@gmail.com>)
 id 1xKFoA-0000sl-QV
 for qemu-arm@nongnu.org; Fri, 23 Oct 2026 09:59:47 -0400
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcelomanzo@gmail.com>)
 id 1xKFo6-0004s7-3I
 for qemu-arm@nongnu.org; Fri, 23 Oct 2026 09:59:46 -0400
Received: by mail-qk1-x733.google.com with SMTP id
 af79cd13be357-93f2f2edb19so83088485a.0
 for <qemu-arm@nongnu.org>; Fri, 23 Oct 2026 06:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792763980; x=1793368780; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=mzBdjSBKg1Q++qGOd/5XnIQSACHnhsvl8Kc6qmyv4YA=;
 b=mTSZZTb2F4CkZArPhHtgwytZOxp45JfC4cT+ncHpk3kFaz+9ayQ7EQo9dOyWIssNwg
 Uhxt49IABjXiIN10VL+uV1lMO/MSPKa/jxb9mYVn/cpusVsjRlOvXaO/wiSwKiu6M0U1
 fG+1pJkD6ltoTz8eiNKQS6o2WIPsj8+DK2ROz3th0jCElYp0xi5XxNPoR6VezwWwdNWr
 IriYatCCCjKSGp3AKZ29ZVxqtuv9zYOg7AXayfbdfER+NlvIZNtkjrnEiz0PsNa9l1ky
 yY/OUvZuOHwuhNufoNfDg/HZEMAw+b1knDWMGw3mNQPipHCEkScEUrOPCsq03412HeL4
 2GnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792763980; x=1793368780;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=mzBdjSBKg1Q++qGOd/5XnIQSACHnhsvl8Kc6qmyv4YA=;
 b=toXIk/42a3/9EikKS+G8MeJ6jxVnQJWPrWBC0hwmwulOSZBRcxbzaCw9wCOQqMhs1U
 IamsPcgu3bxRkwrxK+GZS+vDdJAxyAdRAFCKuc4IkQzZD7+0b9ttEX/dKMAEYwQQj0hL
 LrZ1OK+GtStj8C7RazJhOlYSx+JUvs59VkXl912on6H5WkUs/wCeZhCnwAImJzvousz0
 18EUSWcjvGzxSrZLzbi41pjCIYjg27qL5kGell5SIIITyMO/jSj2FMPZ5kdXyuyG1zBz
 mBWPFal3/QoD8RC9xfwDzxG85FYFk0ffgCtPyU2Pbu3nmoSPuVC2MYcD866QGYHeH11H
 Ny0g==
X-Gm-Message-State: AFq9FYJqaF5xuNbkwV3gUvfFylm2m9WHPocliqQAsk6xVN2PiSqxduo9
 vw2M7rZBmfMrkTxNb6EsoRiiA2ps/sdHtY+51ER6QlLy1uSfj6FyTDNO
X-Gm-Gg: AYBFou06zvh2eb4BkoqxDIpzIKYzp3tkjlkNAmNGFliurjL9rg7asp/03zM+fu2l0+N
 KHy860pEs+CKn9+kvOBTXA6jDd0U91jzciHAFUqCrmUAyYLoIRAU1P/9cvorQaTsys8qve2iCCO
 YJQDojdcI+eQCp2yMcXXhhE6fGv5qcLtVXOvlcArh4Hq6rpuTqr60HdG9xShp/Rkf8hEZTzvKmn
 bq6w63/7UlCDL1LKbPZNrpejNPP2TKnbl5tA+OKkISiqwGK7NXFafzRAvEWXqgU8NRKidQ4i4xc
 epG2+QAzwKkcnmAxbilAsI9WONFsrhM+XM5Q4EaRnxMTk4ORZ/o0YqX3CbVJyfMZjy3zsWHg2I1
 WoUAdfo+Ghxbkb5watwCtXN7k1zBMx/85oxqO5Ne+WCb2TAjv/bf1J1MAwXJ+zWKrSlJ5afrVh6
 o14b/TtoY7mEPixvOGQKrdOGNaSoeCf68mpjuVZYE1cqTgdD5q6dubG7xkqgZ/Wi++sSiak/zu7
 HaoXM18fC0ljUSiEhj5OrtQUkWy3QXPvTvK+4Tai/Ojz66r51aSRdS7RZbS9a7bFWgQ2YnzE32n
 XEcHoUeRJNTCyJSLJ8wJRm7XD2OalAgaaF2WM0/c8HTGXvmyeS/4
X-Received: by 2002:a05:620a:2b4e:b0:93f:228c:5301 with SMTP id
 af79cd13be357-93f6f85ede5mr412273185a.64.1792763980001; 
 Fri, 23 Oct 2026 06:59:40 -0700 (PDT)
Received: from localhost.localdomain ([2606:6d00:159:2900:450e:e72b:156b:33d1])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-94047811552sm23741285a.18.2026.10.23.06.59.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 23 Oct 2026 06:59:39 -0700 (PDT)
From: Marcelo Manzo <marcelomanzo@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, philmd@oss.qualcomm.com,
 Sergey Kambalin <serg.oker@gmail.com>,
 Sergey Kambalin <sergey.kambalin@auriga.com>,
 Marcelo Manzo <marcelomanzo@gmail.com>, Jason Wang <jasowangio@gmail.com>
Subject: [PATCH v5 12/16] hw/net/bcm2838_genet: implement GENET TX path
Date: Fri, 23 Oct 2026 09:59:20 -0400
Message-ID: <20261023135924.64990-14-marcelomanzo@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261023135924.64990-1-marcelomanzo@gmail.com>
References: <20261023135924.64990-1-marcelomanzo@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::733;
 envelope-from=marcelomanzo@gmail.com; helo=mail-qk1-x733.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Sergey Kambalin <serg.oker@gmail.com>

Implement the transmit DMA ring handling: walk TX descriptors
between the consumer and producer index for a ring, pull frame data
out of guest memory, and hand completed frames to the netdev peer
via qemu_send_packet(), advancing the consumer index and raising the
TXDMA_MBDONE interrupt as descriptors complete.

Part of Sergey Kambalin's original Raspberry Pi 4B PCIe/GENET
networking series (patchwork series 829638, posted to qemu-devel in
2024, never merged). Carried forward and completed by Marcelo Manzo.

While carrying this forward, fix bcm2838_genet_tdma_ring_active():
it extracted the per-ring enable bit using the DMA_CTRL register's
1-bit EN field definition instead of DMA_RING_CFG's 17-bit EN field
(one bit per ring), so only ring 0 ever appeared active and TX
traffic hashed onto any other queue was silently dropped, eventually
tripping the guest's qdisc watchdog ("NETDEV WATCHDOG: transmit
queue N timed out") and breaking DHCP.

While carrying this forward, also:

 - Check that a frame is at least a status block plus an Ethernet
   header before looking at it, and that the descriptors of a frame
   don't add up to more than the TX buffer, so a guest can't make us
   read or write outside it.
 - Check that reading the frame data from guest memory succeeded.
 - Use lduw_be_p()/stw_be_p() for the length/type field.

Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
Signed-off-by: Marcelo Manzo <marcelomanzo@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/net/bcm2838_genet.c         | 244 ++++++++++++++++++++++++++++++++-
 include/hw/net/bcm2838_genet.h |  17 +++
 2 files changed, 260 insertions(+), 1 deletion(-)

diff --git a/hw/net/bcm2838_genet.c b/hw/net/bcm2838_genet.c
index 6aa40c6d1f..520e2adbc8 100644
--- a/hw/net/bcm2838_genet.c
+++ b/hw/net/bcm2838_genet.c
@@ -237,6 +237,13 @@ REG16(GENET_PHY_EXP_SEL,           0)
 FIELD(GENET_PHY_EXP_SEL, REG_ID,   0, 8)
 FIELD(GENET_PHY_EXP_SEL, BLOCK_ID, 8, 8)
 
+REG32(GENET_TX_CSUM_INFO,            0)
+FIELD(GENET_TX_CSUM_INFO, OFFSET,    0, 15)
+FIELD(GENET_TX_CSUM_INFO, PROTO_UDP, 15, 1)
+FIELD(GENET_TX_CSUM_INFO, START,     16, 15)
+FIELD(GENET_TX_CSUM_INFO, LV,        30, 1)
+
+
 static void bcm2838_genet_set_qemu_mac(BCM2838GenetState *s)
 {
     const MACAddr *addr = &s->nic_conf.macaddr;
@@ -402,6 +409,241 @@ static uint64_t bcm2838_genet_mdio_cmd(BCM2838GenetState *s, uint64_t cmd)
     return cmd;
 }
 
+/* Assemble a 64-bit value from its high and low 32-bit register halves */
+static uint64_t bcm2838_genet_make_u64(uint32_t hi, uint32_t lo)
+{
+    return ((uint64_t)hi << 32) | lo;
+}
+
+static void bcm2838_genet_xmit_packet(NetClientState *s, void *packet,
+                                      size_t size)
+{
+    uint8_t *buf = packet + sizeof(BCM2838GenetXmitStatus);
+    size_t len;
+    uint16_t len_type;
+
+    /* We need the status block and a whole Ethernet header (len/type at 12) */
+    if (size < sizeof(BCM2838GenetXmitStatus) + ETH_HLEN) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: TX frame too short (%zu bytes)\n", __func__, size);
+        return;
+    }
+
+    len = size - sizeof(BCM2838GenetXmitStatus);
+    net_checksum_calculate(buf, len, CSUM_ALL);
+
+    len_type = lduw_be_p(buf + 12);
+    if (len_type < MAX_PAYLOAD_SIZE) {
+        stw_be_p(buf + 12, len);
+    }
+
+    qemu_send_packet(s, buf, len);
+}
+
+static uint64_t bcm2838_genet_tx(BCM2838GenetState *s, unsigned int ring_index,
+                                 uint32_t prod_index,
+                                 uint32_t cons_index)
+{
+    BCM2838GenetTdmaRing *ring = &s->regs.tdma.rings[ring_index];
+    const unsigned int desc_size_words
+        = sizeof(BCM2838GenetTdmaDesc) / sizeof(uint32_t);
+    const uint64_t ring_start_addr
+        = bcm2838_genet_make_u64(ring->start_addr_hi, ring->start_addr);
+    const uint64_t ring_end_addr
+        = bcm2838_genet_make_u64(ring->end_addr_hi, ring->end_addr);
+
+    hwaddr data_addr;
+    uint64_t desc_index;
+    uint32_t desc_status = 0;
+    uint32_t buflength = 0;
+    uint64_t num_descs = 0;
+    uint64_t read_ptr
+        = bcm2838_genet_make_u64(ring->read_ptr_hi, ring->read_ptr);
+    size_t packet_off = 0;
+
+    uint32_t prod_index_fld = FIELD_EX32(prod_index,
+                                         GENET_DMA_PROD_INDEX, INDEX);
+    uint32_t cons_index_fld = FIELD_EX32(cons_index,
+                                        GENET_DMA_CONS_INDEX, INDEX);
+
+    while (cons_index_fld != prod_index_fld) {
+        desc_index = read_ptr / desc_size_words;
+        if (desc_index >= BCM2838_GENET_DMA_DESC_CNT) {
+            qemu_log_mask(
+                LOG_GUEST_ERROR,
+                "%s: invalid TX descriptor index %" PRIu64 " (exceeds %u)\n",
+                __func__, desc_index, BCM2838_GENET_DMA_DESC_CNT - 1);
+            break;
+        }
+        desc_status = s->regs.tdma.descs[desc_index].length_status;
+        data_addr = bcm2838_genet_make_u64(
+            s->regs.tdma.descs[desc_index].address_hi,
+            s->regs.tdma.descs[desc_index].address_lo);
+        trace_bcm2838_genet_tx(ring_index, desc_index, desc_status,
+                               data_addr);
+
+        if (FIELD_EX32(desc_status, GENET_RDMA_LENGTH_STATUS, SOP) != 0) {
+            packet_off = 0;
+        }
+
+        buflength = FIELD_EX32(desc_status,
+                               GENET_RDMA_LENGTH_STATUS, BUFLENGTH);
+
+        if (packet_off + buflength > sizeof(s->tx_packet)) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: TX frame too big (%zu + %u bytes, max %zu)\n",
+                          __func__, packet_off, buflength,
+                          sizeof(s->tx_packet));
+            break;
+        }
+
+        if (address_space_read(&s->dma_as, data_addr,
+                               MEMTXATTRS_UNSPECIFIED,
+                               s->tx_packet + packet_off,
+                               buflength) != MEMTX_OK) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: failed to read TX buffer at 0x%" HWADDR_PRIx
+                          "\n", __func__, data_addr);
+            break;
+        }
+        packet_off += buflength;
+
+        if (FIELD_EX32(desc_status, GENET_RDMA_LENGTH_STATUS, EOP) != 0) {
+            bcm2838_genet_xmit_packet(qemu_get_queue(s->nic), s->tx_packet,
+                                      packet_off);
+            packet_off = 0;
+        }
+
+        num_descs++;
+        cons_index_fld++;
+        s->regs.tdma.descs[desc_index].length_status =
+            FIELD_DP32(s->regs.tdma.descs[desc_index].length_status,
+                       GENET_RDMA_LENGTH_STATUS, OWN, 1);
+        read_ptr = read_ptr == ring_end_addr + 1 - desc_size_words
+            ? ring_start_addr : read_ptr + desc_size_words;
+    }
+
+    ring->read_ptr = read_ptr;
+    ring->read_ptr_hi = read_ptr >> 32;
+
+    return num_descs;
+}
+
+static bool bcm2838_genet_tdma_ring_active(BCM2838GenetState *s,
+                                           unsigned int ring_index)
+{
+    uint32_t ctrl_reg = s->regs.tdma.ctrl;
+    uint32_t ring_cfg_reg = s->regs.tdma.ring_cfg;
+    uint32_t ring_mask = 1 << ring_index;
+    bool dma_en = FIELD_EX32(ctrl_reg, GENET_DMA_CTRL, EN);
+    bool ring_en =
+        FIELD_EX32(ring_cfg_reg, GENET_DMA_RING_CFG, EN) & ring_mask;
+    bool ring_buf_en =
+        FIELD_EX32(ctrl_reg, GENET_DMA_CTRL, RING_BUF_EN) & ring_mask;
+    bool active = dma_en && ring_en && ring_buf_en;
+
+    trace_bcm2838_genet_tx_dma_ring_active(ring_index,
+                                           active ? "active" : "halted");
+    return active;
+}
+
+/* The guest wrote a ring's producer index: send what it has queued */
+static void bcm2838_genet_tdma_prod_index_write(BCM2838GenetState *s,
+                                                unsigned int ring_index,
+                                                uint32_t prod_index)
+{
+    BCM2838GenetTdmaRing *ring = &s->regs.tdma.rings[ring_index];
+    uint32_t cons_index = ring->cons_index;
+    uint32_t cons_index_fld = FIELD_EX32(cons_index,
+                                         GENET_DMA_CONS_INDEX, INDEX);
+    uint32_t prod_index_fld = FIELD_EX32(prod_index,
+                                         GENET_DMA_PROD_INDEX, INDEX);
+    uint64_t num_descs_tx;
+    uint32_t tx_intrs;
+
+    if (cons_index_fld == prod_index_fld) {
+        return;
+    }
+
+    trace_bcm2838_genet_tx_request(ring_index, prod_index_fld,
+                                   cons_index_fld);
+    num_descs_tx = bcm2838_genet_tx(s, ring_index, prod_index, cons_index);
+    if (num_descs_tx == 0) {
+        return;
+    }
+
+    ring->cons_index = FIELD_DP32(ring->cons_index, GENET_DMA_CONS_INDEX,
+                                  INDEX, cons_index + num_descs_tx);
+
+    if (ring_index == BCM2838_GENET_DMA_RING_DEFAULT) {
+        s->regs.intrl0.stat = FIELD_DP32(s->regs.intrl0.stat, GENET_INTRL_0,
+                                         TXDMA_MBDONE, 1);
+    } else {
+        tx_intrs = FIELD_EX32(s->regs.intrl1.stat, GENET_INTRL_1, TX_INTRS);
+        s->regs.intrl1.stat = FIELD_DP32(s->regs.intrl1.stat, GENET_INTRL_1,
+                                         TX_INTRS, tx_intrs | 1 << ring_index);
+    }
+}
+
+static void bcm2838_genet_tdma(BCM2838GenetState *s, hwaddr offset,
+                               uint64_t value)
+{
+    hwaddr ring_offset;
+    unsigned int ring_index;
+    uint32_t prod_index = value;
+    uint32_t ring_cfg = value;
+    uint32_t dma_ctrl = value;
+
+    uint32_t exst_tdma_en =
+        FIELD_EX32(s->regs.tdma.ctrl, GENET_DMA_CTRL, EN);
+    uint32_t exst_ring_en =
+        FIELD_EX32(s->regs.tdma.ring_cfg, GENET_DMA_RING_CFG, EN);
+    uint32_t incm_tdma_en =
+        FIELD_EX32(dma_ctrl, GENET_DMA_CTRL, EN);
+    uint32_t incm_ring_en =
+        FIELD_EX32(ring_cfg, GENET_DMA_RING_CFG, EN);
+    uint32_t incm_ring_buf_en =
+        FIELD_EX32(dma_ctrl, GENET_DMA_CTRL, RING_BUF_EN);
+
+    switch (offset) {
+    case BCM2838_GENET_TDMA_RINGS
+        ... BCM2838_GENET_TDMA_RINGS + sizeof(s->regs.tdma.rings) - 1:
+        ring_index = (offset - BCM2838_GENET_TDMA_RINGS)
+            / sizeof(BCM2838GenetTdmaRing);
+        if (bcm2838_genet_tdma_ring_active(s, ring_index)) {
+            ring_offset = offset - BCM2838_GENET_TDMA_RINGS
+                - ring_index * sizeof(BCM2838GenetTdmaRing);
+            switch (ring_offset) {
+            case BCM2838_GENET_TRING_PROD_INDEX:
+                bcm2838_genet_tdma_prod_index_write(s, ring_index,
+                                                    prod_index);
+                break;
+            default:
+                break;
+            }
+        }
+        break;
+    case BCM2838_GENET_TDMA_RING_CFG:
+        if (exst_ring_en != incm_ring_en) {
+            trace_bcm2838_genet_tx_dma_ring(incm_ring_en);
+        }
+        break;
+    case BCM2838_GENET_TDMA_CTRL:
+        s->regs.tdma.status = (~dma_ctrl) & GENET_DMA_ENABLE_MASK;
+        if (exst_tdma_en != incm_tdma_en) {
+            trace_bcm2838_genet_tx_dma(incm_tdma_en == 1
+                                       ? "enabled"
+                                       : "disabled");
+        }
+        if (exst_ring_en != incm_ring_buf_en) {
+            trace_bcm2838_genet_tx_dma_ring_buf(incm_ring_buf_en);
+        }
+        break;
+    default:
+        break;
+    }
+}
+
 static uint64_t bcm2838_genet_read(void *opaque, hwaddr offset, unsigned size)
 {
     uint64_t value = ~0;
@@ -500,7 +742,7 @@ static void bcm2838_genet_write(void *opaque, hwaddr offset, uint64_t value,
         break;
     case BCM2838_GENET_TDMA_REGS
         ... BCM2838_GENET_TDMA_REGS + sizeof(BCM2838GenetRegsTdma) - 1:
-        qemu_log_mask(LOG_UNIMP, "TDMA isn't implemented yet");
+        bcm2838_genet_tdma(s, offset, value);
         break;
     default:
         break;
diff --git a/include/hw/net/bcm2838_genet.h b/include/hw/net/bcm2838_genet.h
index 94ac457c04..f6a3cb7eef 100644
--- a/include/hw/net/bcm2838_genet.h
+++ b/include/hw/net/bcm2838_genet.h
@@ -110,6 +110,21 @@ OBJECT_DECLARE_SIMPLE_TYPE(BCM2838GenetState, BCM2838_GENET)
 #define BCM2838_GENET_PHY_EXP_SHD_BLOCKS_CNT 256
 #define BCM2838_GENET_PHY_EXP_SHD_REGS_CNT   256
 
+#define MAX_FRAME_SIZE                  0xFFF
+#define MAX_PACKET_SIZE                 1518
+#define MAX_PAYLOAD_SIZE                1500
+#define TX_MIN_PKT_SIZE                 60
+
+
+typedef struct BCM2838GenetXmitStatus {
+    uint32_t  length_status;  /* length and peripheral status */
+    uint32_t  ext_status;     /* Extended status */
+    uint32_t  rx_csum;        /* partial rx checksum */
+    uint32_t  unused1[9];     /* unused */
+    uint32_t  tx_csum_info;   /* Tx checksum info. */
+    uint32_t  unused2[3];     /* unused */
+} BCM2838GenetXmitStatus;
+
 typedef struct {
     uint32_t rev_ctrl;
     uint32_t port_ctrl;
@@ -402,6 +417,8 @@ struct BCM2838GenetState {
 
     qemu_irq irq_default;
     qemu_irq irq_prio;
+
+    uint8_t tx_packet[MAX_FRAME_SIZE];
 };
 
 /*
-- 
2.55.0


