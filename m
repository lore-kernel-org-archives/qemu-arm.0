Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AFF4CCF2C4
	for <qemu-arm@archiver.kernel.org>; Sun, 18 Oct 2026 13:39:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xIR3t-0002XE-Lr; Sun, 18 Oct 2026 09:36:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcelomanzo@gmail.com>)
 id 1xIR3m-0002Nm-0e
 for qemu-arm@nongnu.org; Sun, 18 Oct 2026 09:36:23 -0400
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcelomanzo@gmail.com>)
 id 1xIR3j-0002J6-DV
 for qemu-arm@nongnu.org; Sun, 18 Oct 2026 09:36:21 -0400
Received: by mail-qv1-xf2e.google.com with SMTP id
 6a1803df08f44-917aca1aee5so13599096d6.2
 for <qemu-arm@nongnu.org>; Sun, 18 Oct 2026 06:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792330578; x=1792935378; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=9Et1SwVT6c27ho8zzGC6B2lEnBlfldMPSkHe4k33UXc=;
 b=a/JHXvHxHrbHBqH4xotEczX3IZNLldhZPMQGnJOaba7+Ey22FZM1frOAKVEuoAnsNz
 fIp6RaTzYxpnaDfU/NTlO6hSh+LUWXLTrdZuZCh5T0qhSfmI2ICM2TQnMJbZAclXBQeW
 UbUwraVdWY6nv82K4C7M4ea0BoQX5ZjYXhj6FufXyx9PjjZHwk/6yMPH545mmznuHJQd
 HRlFae6YDR0sQSotCj77OtsHVLV/RnpL9OJcgZtanaEvgYQNgniJ/fmvXaz6gtAkGurb
 QqILYzcEscqA5rIDKcogyXP5nfWsFjqF6tdNfQ7PmVZz3AAvT9g7s/OolnNwJPlmcaDq
 XURA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792330578; x=1792935378;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=9Et1SwVT6c27ho8zzGC6B2lEnBlfldMPSkHe4k33UXc=;
 b=lRHnoXkcuWTs8/YeH1CEGdstAZ3O+/3At958vG2jOs095NRjUtELaBl5ATtf3JoQ3Q
 bmBw7BiY3Dg2aRYq4Vaz/RRLuttIYVXr+sW9JstS1YYvzE1lzc0t4+JTygGzFOfiNd5C
 PfQVc3xVS993Pv+QKW8DEHZRcpGeOTXJzibI+muyPYuMnC40Ik9eOZzhBHSFrJeN+qXw
 26Tf3iEvTK684K9jUIO0GLyVTD+B0BD9Hc1d6N7XjT1qkNKo4ftP46l3EUWVMqHHqu1h
 VGu3kjkVsxCX8gz/QUdbgaGuYis1qY90IrFgt1JuqKZfWXZiWbt+boJwbzw6BZYz8rpC
 CKLw==
X-Forwarded-Encrypted: i=1;
 AKwUvBz3sDB3OSjqpNZzvH/fCfAqePXBpDcTYDs6AddBGrn+EUVGJbBV8BRlu5fi1HkaB2FRdEUBtM7AvQ==@nongnu.org
X-Gm-Message-State: AFq9FYIBRtBGigFXcSipUhiSaK9KUyQ7f0OR3vAi0eCqQIw5YP04JqhB
 t+xoMOKgFff2pTzJ8rm3eJPc5/kS6h8AeWIO0G+kPKGpIgUj9a91g7QK
X-Gm-Gg: AYBFou1beYMTPvLS/x2Fd5N2df3kFxMb8Beat2iiUq32rGMqRTCYb1MMH6hIZHhtQEq
 cARWJCQwIGpH/waQu3XpBuu57x8xOhaBdHtjCSc5uTWFnHbSSLZsBgONw5ifQ9Vh85E7lq63Yo8
 U8lBYbyfy/OFQFVIDCmjSYD6OJBU7garc6/anKKtReZm333ap1QhZtdckXmy/afOY9KaF+JwGE/
 4QR9iMLLhwQOhWU9UUMUZz9mVpFmueUCqfbyjkBopEHErV7PDiDf+QXKqqmTdnIBk51IUWmWKQB
 0yC4owIgg2iMroP83qXp7cO/tEjWceGjxLbUVptOM3f0MGv7kDb4IR4Gt+W6CAbAuqd4M35W4oG
 RfjaIjC1mfeoNTwaQh/MZKRxOPV/xmxpw5iGmW8XqnfJAvdG9eTr1+DM25xipIh8JW8svOAIoZn
 kMlRniYhfL2+DOBHtjM+d7db77Q7zYXmB8ylVPNFf0Wo4yf2h9SYy9oJgJG2MuwyZjXplveYcWE
 0Y9STqyuou2Uzl/V4hUcrNhTy6otzjVzxJDIk67iOhmy9ntF5W9t43OQKNBg3NQgKWr9LU=
X-Received: by 2002:a05:620a:4006:b0:93b:e578:583d with SMTP id
 af79cd13be357-93f29cc9251mr916696585a.21.1792330577934; 
 Sun, 18 Oct 2026 06:36:17 -0700 (PDT)
Received: from localhost.localdomain ([2606:6d00:159:2900:ecfc:9d0d:b95b:11bf])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-93f2a854bb7sm459056485a.23.2026.10.18.06.36.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 18 Oct 2026 06:36:17 -0700 (PDT)
From: Marcelo Manzo <marcelomanzo@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org, philmd@oss.qualcomm.com,
 Sergey Kambalin <serg.oker@gmail.com>,
 Sergey Kambalin <sergey.kambalin@auriga.com>,
 Marcelo Manzo <marcelomanzo@gmail.com>, Jason Wang <jasowangio@gmail.com>
Subject: [PATCH v4 12/17] hw/net/bcm2838_genet: implement GENET TX path
Date: Sun, 18 Oct 2026 09:35:58 -0400
Message-ID: <20261018133603.64323-13-marcelomanzo@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261018133603.64323-1-marcelomanzo@gmail.com>
References: <20261018133603.64323-1-marcelomanzo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2e;
 envelope-from=marcelomanzo@gmail.com; helo=mail-qv1-xf2e.google.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

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
---
 hw/net/bcm2838_genet.c         | 244 ++++++++++++++++++++++++++++++++-
 include/hw/net/bcm2838_genet.h |  17 +++
 2 files changed, 260 insertions(+), 1 deletion(-)

diff --git a/hw/net/bcm2838_genet.c b/hw/net/bcm2838_genet.c
index 331a598855..7274a66d8f 100644
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
@@ -493,7 +735,7 @@ static void bcm2838_genet_write(void *opaque, hwaddr offset, uint64_t value,
             break;
         case BCM2838_GENET_TDMA_REGS
             ... BCM2838_GENET_TDMA_REGS + sizeof(BCM2838GenetRegsTdma) - 1:
-            qemu_log_mask(LOG_UNIMP, "TDMA isn't implemented yet");
+            bcm2838_genet_tdma(s, offset, value);
             break;
         default:
             break;
diff --git a/include/hw/net/bcm2838_genet.h b/include/hw/net/bcm2838_genet.h
index 9566b2a29a..28529381d1 100644
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


