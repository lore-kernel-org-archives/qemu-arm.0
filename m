Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp424835ejb;
        Sun, 18 Feb 2024 17:23:17 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVrJ1yRxpQm5J2MCAW8ZNq5Kh6wpRNEyCDmoTapYIGJEcoHcizLIg06/k7KiKj/LLXVQpD8n7H6yF3iPiEwW61LRLopA0W6
X-Google-Smtp-Source: AGHT+IE2l7fX9YPhuzGZEqH6NrgT4Z69ukprjrntY6ObTAnfSMNahZgIo4kH68Fo1EkEr1J8TwJe
X-Received: by 2002:a05:622a:3d0:b0:42c:71ea:9b28 with SMTP id k16-20020a05622a03d000b0042c71ea9b28mr15432746qtx.32.1708305796843;
        Sun, 18 Feb 2024 17:23:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708305796; cv=none;
        d=google.com; s=arc-20160816;
        b=QK2BqLGWmoyzQxJwDUSg4Xf1/4fVY9SaroGAPQtYT4WnHMY+IbCp5PaZuiSbweyo60
         s8RtPKoJWoD9ZwUQmM988HX9uxYN4G6JbmSGROy+tTXu1pFiQO+ZhpIMmbk5UDDfTozQ
         SWOkVuFdYNceavfAXvo4KfS648D6xy8yJATqcR52Lwzn9ZvD25Vyc4RX4g/ZE4dI8Tfv
         93don12KFqf0lkHdImtxvV7omqNLZ8jkmtIq4DXoVgp18Rka1787Rhnp4nsq5l8D4OCh
         CRSTAc+ucVHG8bXhukH/boJHtzl8YaXsiXhJWjV0JciC5qySMyApS/yvzz0eBMSyXHJY
         /WRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=+hjmG1A2tPvmGc3N2NipyVPILE0g9ff37LS2A1O0hS0=;
        fh=1CWWAdYo81brd4jeYOgzhc83mN/ncVbe89i2SJzFql0=;
        b=gBb+Qyzsq6zZNpFrAn5OILt8oEH6V4IUkuX6YDk7D3LJV+3BOuNCVLSCfNwT/PmVIS
         DJUJ2k/57kpad68IyJl7WokturIVxOlzBb4LNwp3BR3WCEtram+dy4HGbuxOK21kitNE
         iG9pHt8z8S4PGbxvNNTWdm+772zflWWqQeoQ/IxqooTU7SC1DNVCl08KAxo69o8XTT/s
         NWx+n5YkrF431ZEuZKdgDBFV609hz+gyvm/JTnsww4zoUlRfgsDfiOreaC2DhUdyvZ0R
         6KGNXAheJ3qCa3lNcJDYaKwExn/gpMgE3KarM4gfaNPd3mtdsYDpXrUkPbFcN1mrRmuo
         4rsA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=AXwD1TD0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c17-20020ac853d1000000b0042beb743fcbsi5047577qtq.446.2024.02.18.17.23.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 18 Feb 2024 17:23:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=AXwD1TD0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rbsIx-0003zB-Ck; Sun, 18 Feb 2024 20:18:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1rbsIe-0003YC-Kg; Sun, 18 Feb 2024 20:18:29 -0500
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1rbsIW-0004JW-PN; Sun, 18 Feb 2024 20:18:23 -0500
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-6080f44d128so11745967b3.2; 
 Sun, 18 Feb 2024 17:18:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708305496; x=1708910296; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+hjmG1A2tPvmGc3N2NipyVPILE0g9ff37LS2A1O0hS0=;
 b=AXwD1TD0rtl5V3Vl8smKCSC822FpuGgmSsfgD26tn/brgvQ6kjwIkCm8pA1eb/xfS3
 ac/JChV7yy3j7HmPmnB0ZtCo1RMh5UzRNBymfGBTfjlTndAyZenr6R/hSVSdTmy/eYmQ
 tQ3R+wUyMlO96QEK4aZYMkeJtaRlS5U3dxzIGZiUH87RdD3bWH17WeAc+MLvqmTYbSJG
 UHlren1SnYc7eFYdL4Vw7BCEPd0mRFUIFKufJ5lGx+13GclX9fcCYyYakrmmldMdtHWv
 kcBrlfHH8QH85fILQBndKGvk5JmAi3Oc7qyV1KZ60JR10W6UKxOqSXvYrsQQZKW+S43V
 9Lmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708305496; x=1708910296;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+hjmG1A2tPvmGc3N2NipyVPILE0g9ff37LS2A1O0hS0=;
 b=ibkyElysZq5EAVAZ91qqh9QkM+NKG5zmzm5VyCU0+Y3fiHtuwbRl9rzYvPuobTIsfM
 47epFYfLTFMkTjx5Z4mZKxV1KAeHy7JhdzEKXSprwi56enAMSkUpy4WIZTjbmkGpqy3l
 VNaMZ/2P4XcefiWz8Hz/BiZOCG/qO3XHcrB84TUfZZjB+mf8OUja3IxEmn2FB/6fVBLW
 RqIfkzaylRbFSFSroSl9G9zHU/+Uvewg8Bvl3/cGnaz8ewMkVV2RmRuliufqoNoqo+2Z
 rUEc3E5D7oCIx1Ok8mCWcGrdt5BPTdv8AhtZV12ednPYjc6RU6KEBYuTyX7+RL4Ff+BJ
 5dZQ==
X-Gm-Message-State: AOJu0Yy8W5eOfeBuEbQQWSIelqbWYTOfrYkwFUfIdiWlBSnU6VpBR5Vu
 EcLvMchfLpiaWR0rlOlBj2hw/z0Wit7zB/DyAPY/H+DG6ESj4uK7Tt2QRpmaI3E=
X-Received: by 2002:a05:690c:93:b0:607:d5f3:f02 with SMTP id
 be19-20020a05690c009300b00607d5f30f02mr14564314ywb.18.1708305496653; 
 Sun, 18 Feb 2024 17:18:16 -0800 (PST)
Received: from localhost.localdomain ([201.203.117.224])
 by smtp.gmail.com with ESMTPSA id
 m12-20020a819e0c000000b00607ff905ed3sm1204704ywj.58.2024.02.18.17.18.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Feb 2024 17:18:16 -0800 (PST)
From: Sergey Kambalin <serg.oker@gmail.com>
X-Google-Original-From: Sergey Kambalin <sergey.kambalin@auriga.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	Sergey Kambalin <sergey.kambalin@auriga.com>
Subject: [PATCH v5 27/41] Implement GENET TX path
Date: Sun, 18 Feb 2024 19:17:25 -0600
Message-Id: <20240219011739.2316619-28-sergey.kambalin@auriga.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240219011739.2316619-1-sergey.kambalin@auriga.com>
References: <20240219011739.2316619-1-sergey.kambalin@auriga.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=serg.oker@gmail.com; helo=mail-yw1-x1135.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: tlgBTLDfKSXf

Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
---
 hw/net/bcm2838_genet.c         | 221 ++++++++++++++++++++++++++++++++-
 include/hw/net/bcm2838_genet.h |  17 +++
 2 files changed, 237 insertions(+), 1 deletion(-)

diff --git a/hw/net/bcm2838_genet.c b/hw/net/bcm2838_genet.c
index 1fae3ecbc2..4c9b39a3ca 100644
--- a/hw/net/bcm2838_genet.c
+++ b/hw/net/bcm2838_genet.c
@@ -234,6 +234,13 @@ REG16(GENET_PHY_EXP_SEL,           0)
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
@@ -387,6 +394,218 @@ static uint64_t bcm2838_genet_mdio_cmd(BCM2838GenetState *s, uint64_t cmd)
     return cmd;
 }
 
+static void bcm2838_genet_xmit_packet(NetClientState *s, void *packet,
+                                      size_t size)
+{
+    uint8_t *buf = packet + sizeof(BCM2838GenetXmitStatus);
+    size_t len = size;
+    uint16_t len_type = 0;
+
+    len -= sizeof(BCM2838GenetXmitStatus);
+    net_checksum_calculate(buf, len, CSUM_ALL);
+
+    memcpy(&len_type, &buf[12], sizeof(len_type));
+    len_type = ntohs(len_type);
+    if (len_type < MAX_PAYLOAD_SIZE) {
+        len_type = len;
+        len_type = htons(len_type);
+        memcpy(&buf[12], &len_type, sizeof(len_type));
+    }
+
+    qemu_send_packet(s, buf, len);
+}
+
+static uint64_t bcm2838_genet_tx(BCM2838GenetState *s, unsigned int ring_index,
+                                 uint32_t prod_index,
+                                 uint32_t cons_index)
+{
+    const unsigned int DESC_SIZE_WORDS
+        = sizeof(BCM2838GenetTdmaDesc) / sizeof(uint32_t);
+    const uint64_t RING_START_ADDR
+        = ((uint64_t)s->regs.tdma.rings[ring_index].start_addr_hi << 32)
+            + s->regs.tdma.rings[ring_index].start_addr;
+    const uint64_t RING_END_ADDR
+        = ((uint64_t)s->regs.tdma.rings[ring_index].end_addr_hi << 32)
+            + s->regs.tdma.rings[ring_index].end_addr;
+
+    hwaddr data_addr;
+    uint64_t desc_index;
+    uint32_t desc_status = 0;
+    uint32_t buflength = 0;
+    uint64_t num_descs = 0;
+    uint64_t read_ptr
+        = ((uint64_t)s->regs.tdma.rings[ring_index].read_ptr_hi << 32)
+            + s->regs.tdma.rings[ring_index].read_ptr;
+    off_t packet_off = 0;
+
+    uint32_t prod_index_fld = FIELD_EX32(prod_index,
+                                         GENET_DMA_PROD_INDEX, INDEX);
+    uint32_t cons_index_fld = FIELD_EX32(cons_index,
+                                        GENET_DMA_CONS_INDEX, INDEX);
+
+    while (cons_index_fld != prod_index_fld) {
+        desc_index = read_ptr / DESC_SIZE_WORDS;
+        if (desc_index >= BCM2838_GENET_DMA_DESC_CNT) {
+            qemu_log_mask(
+                LOG_GUEST_ERROR,
+                "%s: invalid TX descriptor index %" PRIu64 " (exceeds %u)\n",
+                __func__, desc_index, BCM2838_GENET_DMA_DESC_CNT - 1);
+            break;
+        }
+        desc_status = s->regs.tdma.descs[desc_index].length_status;
+        data_addr = ((uint64_t)s->regs.tdma.descs[desc_index].address_hi << 32)
+            + s->regs.tdma.descs[desc_index].address_lo;
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
+        /* TODO: Add address_space_read() return value check */
+        address_space_read(&s->dma_as, data_addr,
+                                        MEMTXATTRS_UNSPECIFIED,
+                                        s->tx_packet + packet_off,
+                                        buflength);
+        packet_off += buflength;
+
+        if (FIELD_EX32(desc_status, GENET_RDMA_LENGTH_STATUS, EOP) != 0) {
+            bcm2838_genet_xmit_packet(qemu_get_queue(s->nic), s->tx_packet,
+                                                     packet_off);
+            packet_off = 0;
+        }
+
+        num_descs++;
+        cons_index_fld++;
+        s->regs.tdma.descs[desc_index].length_status =
+            FIELD_DP32(s->regs.tdma.descs[desc_index].length_status,
+                       GENET_RDMA_LENGTH_STATUS, OWN, 1);
+        read_ptr = read_ptr == RING_END_ADDR + 1 - DESC_SIZE_WORDS
+            ? RING_START_ADDR : read_ptr + DESC_SIZE_WORDS;
+    }
+
+    s->regs.tdma.rings[ring_index].read_ptr = read_ptr;
+    s->regs.tdma.rings[ring_index].read_ptr_hi = read_ptr >> 32;
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
+    bool dma_en = FIELD_EX32(ctrl_reg, GENET_DMA_CTRL, EN) != 0;
+    bool ring_en =
+        (FIELD_EX32(ring_cfg_reg, GENET_DMA_CTRL, EN) & ring_mask) != 0;
+    bool ring_buf_en =
+        (FIELD_EX32(ctrl_reg, GENET_DMA_CTRL, RING_BUF_EN) & ring_mask) != 0;
+    bool active = dma_en && ring_en && ring_buf_en;
+
+    trace_bcm2838_genet_tx_dma_ring_active(ring_index,
+                                           active ? "active" : "halted");
+    return active;
+}
+
+static void bcm2838_genet_tdma(BCM2838GenetState *s, hwaddr offset,
+                               uint64_t value)
+{
+    hwaddr ring_offset;
+    uint64_t num_descs_tx;
+    unsigned int ring_index;
+     uint32_t tx_intrs;
+    uint32_t cons_index;
+    uint32_t prod_index = value;
+    uint32_t ring_cfg = value;
+    uint32_t dma_ctrl = value;
+
+    uint32_t cons_index_fld;
+    uint32_t prod_index_fld =
+        FIELD_EX32(prod_index, GENET_DMA_PROD_INDEX, INDEX);
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
+                cons_index = s->regs.tdma.rings[ring_index].cons_index;
+                cons_index_fld = FIELD_EX32(cons_index,
+                                            GENET_DMA_CONS_INDEX, INDEX);
+                if (cons_index_fld != prod_index_fld) {
+                    trace_bcm2838_genet_tx_request(ring_index,
+                                                   prod_index_fld,
+                                                   cons_index_fld);
+                    num_descs_tx = bcm2838_genet_tx(s, ring_index, prod_index,
+                                                    cons_index);
+                    if (num_descs_tx > 0) {
+                        s->regs.tdma.rings[ring_index].cons_index =
+                            FIELD_DP32(s->regs.tdma.rings[ring_index].cons_index,
+                                       GENET_DMA_CONS_INDEX, INDEX,
+                                       cons_index + num_descs_tx);
+
+                        if (ring_index == BCM2838_GENET_DMA_RING_DEFAULT) {
+                            s->regs.intrl0.stat =
+                                FIELD_DP32(s->regs.intrl0.stat, GENET_INTRL_0,
+                                           TXDMA_MBDONE, 1);
+                        } else {
+                            tx_intrs =  FIELD_EX32(s->regs.intrl1.stat,
+                                                   GENET_INTRL_1, TX_INTRS);
+                            s->regs.intrl1.stat =
+                                FIELD_DP32(s->regs.intrl1.stat,
+                                           GENET_INTRL_1, TX_INTRS,
+                                           tx_intrs | 1 << ring_index);
+                        }
+                    }
+                }
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
+        if (exst_tdma_en != incm_tdma_en) {
+            s->regs.tdma.status = FIELD_DP32(s->regs.tdma.status,
+                                             GENET_DMA_STATUS,
+                                             DISABLED, !exst_tdma_en);
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
@@ -477,7 +696,7 @@ static void bcm2838_genet_write(void *opaque, hwaddr offset, uint64_t value,
             break;
         case BCM2838_GENET_TDMA_REGS
             ... BCM2838_GENET_TDMA_REGS + sizeof(BCM2838GenetRegsTdma) - 1:
-            qemu_log_mask(LOG_UNIMP, "TDMA isn't implemented yet");
+            bcm2838_genet_tdma(s, offset, value);
             break;
         default:
             break;
diff --git a/include/hw/net/bcm2838_genet.h b/include/hw/net/bcm2838_genet.h
index 7a483bd265..f96ea3a145 100644
--- a/include/hw/net/bcm2838_genet.h
+++ b/include/hw/net/bcm2838_genet.h
@@ -108,6 +108,21 @@ OBJECT_DECLARE_SIMPLE_TYPE(BCM2838GenetState, BCM2838_GENET)
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
@@ -403,6 +418,8 @@ struct BCM2838GenetState {
 
     qemu_irq irq_default;
     qemu_irq irq_prio;
+
+    uint8_t tx_packet[MAX_FRAME_SIZE];
 };
 
 #endif /* BCM2838_GENET_H */
-- 
2.34.1

