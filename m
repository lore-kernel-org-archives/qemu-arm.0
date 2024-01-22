Received: by 2002:a17:906:2b99:b0:a2e:1324:ea5c with SMTP id m25csp2639509ejg;
        Mon, 22 Jan 2024 09:38:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEdTVYnFcNvO+2cEvfP4c1ZQja0CRFM6cUJEz1SU8bFUKPjK+SMhKeYhOFNUH793P+N2zcb
X-Received: by 2002:a4a:d98e:0:b0:599:7699:98d2 with SMTP id k14-20020a4ad98e000000b00599769998d2mr2063932oou.3.1705945101011;
        Mon, 22 Jan 2024 09:38:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705945100; cv=none;
        d=google.com; s=arc-20160816;
        b=k0YhaP/eNTYSggRieASU1CKiWKNFfNZXoH9zdbHf8Df8YbpH7wy21LYUDS+yjfVQrh
         6FL/FTeSK2qWx56eL4mJOlcSwjRJO0a026Ur8Jzm1euvPArHT0gIXgPMctmzWVEfgk99
         JScDsGt6ZDgADq0O4nynNyoi2n0lPJQFZtgvdjasoNb0wxlUhEFoBJFFlL816bt6i9b4
         dRPRWmnu6Bv5LzuuC84pWtPErnpE7qhL9FG3KzaTRPiviyEhAjHGTZ7nNySD1qmGaaTa
         cxsfWPTAxRAL53K7eiYGJ2Dt69dq/MoEvAGAtA61CXihT8qFjKv2o2GqggveUI+mF9t9
         xqXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=dmBRjCWI2wWFg92vOVYEqrX0sg8fOmiOTL/WlzQVzq0=;
        fh=+aVB0apLn7P4p3cMF9Qg7nFZ6+AnRx2Fcri+oFjNFtM=;
        b=IlVzzHJ+YzzvHDQ7lrmEQSkvAbuSzqHqqHYSA58xG9kwFTAqdMd61oUXcIS8GB1mr0
         Tgq4Fd563+jcbc/NULUXcHEP6vOnldez2SixgYdCftbfs/A0jOXAJyPXiyqehV/h/1C+
         jJrx91cOXBuFrP+EFTQsJzW3HJfxGmIQFFpuJovagtjVIx63q5bgjplKUjDOPftjgO9z
         WCf2z40316Y0X5KibkW45Mv/X/JBkwPebSnDBAOeifj1NzOemqpcvXTyuD3hOUwnNdVI
         yGBnflKGDh35pOjh+sjAUkHCnrxDI2ukgk0Div4fxqJ8GENTJfZlyPNmjJ4k+9XmWPB2
         lNGg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=yT3lkwmw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o11-20020a0ccb0b000000b0067ee3520aefsi5952229qvk.151.2024.01.22.09.38.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jan 2024 09:38:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=yT3lkwmw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rRyEn-0000EE-FI; Mon, 22 Jan 2024 12:37:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <31KeuZQwKCBM6tu10xBCxyt6z77z4x.v759x5D-tA5676z6D.7Az@flex--nabihestefan.bounces.google.com>)
 id 1rRyEi-00009j-Fx
 for qemu-arm@nongnu.org; Mon, 22 Jan 2024 12:37:29 -0500
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <31KeuZQwKCBM6tu10xBCxyt6z77z4x.v759x5D-tA5676z6D.7Az@flex--nabihestefan.bounces.google.com>)
 id 1rRyEg-000412-Gq
 for qemu-arm@nongnu.org; Mon, 22 Jan 2024 12:37:28 -0500
Received: by mail-pf1-x44a.google.com with SMTP id
 d2e1a72fcca58-6dbcdfde0eeso1164232b3a.1
 for <qemu-arm@nongnu.org>; Mon, 22 Jan 2024 09:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1705945044; x=1706549844; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=dmBRjCWI2wWFg92vOVYEqrX0sg8fOmiOTL/WlzQVzq0=;
 b=yT3lkwmwzNzd0C3iWAuatXSI023BdakWJWhJfR9R0lrMfHFU+EuGjly5fehssr4342
 9o6F/qIn0ex2wqrxZOoa6nKaIsHlO7a5OMU+dRKwBKnzxMKequK0NoQ/0oV2d3Y1t+bb
 zl8B8jKqK7HyIvHmFM+T/M/IbHpa9Sf0kPh75bF4JtxAoM3LbIxp6tuSSUYrQJD6WnNy
 bea+8fyC0Y5IcAiD8KtnfSxGxuJy6y/pp5KjEGhEWA49dWsXi31eMLjqL8VxjQxjAnkL
 gEWzw7i4uoLhHJcXSyniO4YpKxPqy/hIpWkABQ9PK5phjAKBQTBmqUPRb2aukxq1N0hq
 1VwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705945044; x=1706549844;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dmBRjCWI2wWFg92vOVYEqrX0sg8fOmiOTL/WlzQVzq0=;
 b=CQcwSnW92nHVMq/SOxLsAYTr2lkyr0tvsStBcHCUrGlSs2ARhoaBZaMoUguk4dc+ro
 FGZIzNoc8ju+wJ8aQkpSfRWdTYr9QLGbmJ0rr1NRMCSbvB/yo2IqnR7b5zWN9M3WAL6f
 mwiwukLMCmZGrg8F0K/IHPyhn3t2pnSCmg9Fmxyn4Xp6fRS+hMHGRS45b88YxnHc716Y
 JxLmckY789x0cRMtFY5JaNYtyry+KTlNuSlpo2kwACaef8Bu6fIvmsqVl60ao0gzphEy
 JCdz84+e6bLeMtQj05HeivV2Ho02qRXLrLGK9PdeVhhJ3tp9ZPpy+U/2kdwih3btGlXr
 gUPQ==
X-Gm-Message-State: AOJu0Yz+9ULSmyTMszmd2P0Cslo4b4syJi3ZM8OZN4ZIGAI11ApqH15F
 qHVDBKB9gB78a/RvHyEHMy8dOrNs3bQuSVKyaF1ApycQ0XQN735vWdiVTRIrWOSh0+PdRcGoC3x
 sGOtkjyi4tNCyqfbsavxb4qeMXQ==
X-Received: from nabihestefan.c.googlers.com
 ([fda3:e722:ac3:cc00:20:ed76:c0a8:2737])
 (user=nabihestefan job=sendgmr) by 2002:a05:6a00:1a8f:b0:6d9:b7cb:3b7f with
 SMTP id e15-20020a056a001a8f00b006d9b7cb3b7fmr493181pfv.6.1705945044276; Mon,
 22 Jan 2024 09:37:24 -0800 (PST)
Date: Mon, 22 Jan 2024 17:37:05 +0000
In-Reply-To: <20240122173706.4019545-1-nabihestefan@google.com>
Mime-Version: 1.0
References: <20240122173706.4019545-1-nabihestefan@google.com>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
Message-ID: <20240122173706.4019545-9-nabihestefan@google.com>
Subject: [PATCH v14 8/9] hw/net: GMAC Tx Implementation
From: Nabih Estefan <nabihestefan@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 wuhaotsh@google.com, jasowang@redhat.com, avi.fishman@nuvoton.com, 
 nabihestefan@google.com, kwliu@nuvoton.com, tomer.maimon@nuvoton.com, 
 Hila.Miranda-Kuzi@nuvoton.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::44a;
 envelope-from=31KeuZQwKCBM6tu10xBCxyt6z77z4x.v759x5D-tA5676z6D.7Az@flex--nabihestefan.bounces.google.com;
 helo=mail-pf1-x44a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: RPhUcKotwg2M

From: Nabih Estefan Diaz <nabihestefan@google.com>

- Implementation of Transmit function for packets
- Implementation for reading and writing from and to descriptors in
  memory for Tx

Added relevant trace-events

NOTE: This function implements the steps detailed in the datasheet for
transmitting messages from the GMAC.

Change-Id: Icf14f9fcc6cc7808a41acd872bca67c9832087e6
Signed-off-by: Nabih Estefan <nabihestefan@google.com>
Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
---
 hw/net/npcm_gmac.c  | 203 ++++++++++++++++++++++++++++++++++++++++++++
 hw/net/trace-events |   2 +
 2 files changed, 205 insertions(+)

diff --git a/hw/net/npcm_gmac.c b/hw/net/npcm_gmac.c
index b2b9314f5e..a0b1cd9356 100644
--- a/hw/net/npcm_gmac.c
+++ b/hw/net/npcm_gmac.c
@@ -235,6 +235,37 @@ static int gmac_write_rx_desc(dma_addr_t addr, struct NPCMGMACRxDesc *desc)
     return 0;
 }
 
+static int gmac_read_tx_desc(dma_addr_t addr, struct NPCMGMACTxDesc *desc)
+{
+    if (dma_memory_read(&address_space_memory, addr, desc,
+                        sizeof(*desc), MEMTXATTRS_UNSPECIFIED)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Failed to read descriptor @ 0x%"
+                      HWADDR_PRIx "\n", __func__, addr);
+        return -1;
+    }
+    desc->tdes0 = le32_to_cpu(desc->tdes0);
+    desc->tdes1 = le32_to_cpu(desc->tdes1);
+    desc->tdes2 = le32_to_cpu(desc->tdes2);
+    desc->tdes3 = le32_to_cpu(desc->tdes3);
+    return 0;
+}
+
+static int gmac_write_tx_desc(dma_addr_t addr, struct NPCMGMACTxDesc *desc)
+{
+    struct NPCMGMACTxDesc le_desc;
+    le_desc.tdes0 = cpu_to_le32(desc->tdes0);
+    le_desc.tdes1 = cpu_to_le32(desc->tdes1);
+    le_desc.tdes2 = cpu_to_le32(desc->tdes2);
+    le_desc.tdes3 = cpu_to_le32(desc->tdes3);
+    if (dma_memory_write(&address_space_memory, addr, &le_desc,
+                        sizeof(le_desc), MEMTXATTRS_UNSPECIFIED)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Failed to write descriptor @ 0x%"
+                      HWADDR_PRIx "\n", __func__, addr);
+        return -1;
+    }
+    return 0;
+}
+
 static int gmac_rx_transfer_frame_to_buffer(uint32_t rx_buf_len,
                                             uint32_t *left_frame,
                                             uint32_t rx_buf_addr,
@@ -456,6 +487,155 @@ static ssize_t gmac_receive(NetClientState *nc, const uint8_t *buf, size_t len)
     return len;
 }
 
+static int gmac_tx_get_csum(uint32_t tdes1)
+{
+    uint32_t mask = TX_DESC_TDES1_CHKSM_INS_CTRL_MASK(tdes1);
+    int csum = 0;
+
+    if (likely(mask > 0)) {
+        csum |= CSUM_IP;
+    }
+    if (likely(mask > 1)) {
+        csum |= CSUM_TCP | CSUM_UDP;
+    }
+
+    return csum;
+}
+
+static void gmac_try_send_next_packet(NPCMGMACState *gmac)
+{
+    /*
+     * Comments about steps refer to steps for
+     * transmitting in page 384 of datasheet
+     */
+    uint16_t tx_buffer_size = 2048;
+    g_autofree uint8_t *tx_send_buffer = g_malloc(tx_buffer_size);
+    uint32_t desc_addr;
+    struct NPCMGMACTxDesc tx_desc;
+    uint32_t tx_buf_addr, tx_buf_len;
+    uint16_t length = 0;
+    uint8_t *buf = tx_send_buffer;
+    uint32_t prev_buf_size = 0;
+    int csum = 0;
+
+    /* steps 1&2 */
+    if (!gmac->regs[R_NPCM_DMA_HOST_TX_DESC]) {
+        gmac->regs[R_NPCM_DMA_HOST_TX_DESC] =
+            NPCM_DMA_HOST_TX_DESC_MASK(gmac->regs[R_NPCM_DMA_TX_BASE_ADDR]);
+    }
+    desc_addr = gmac->regs[R_NPCM_DMA_HOST_TX_DESC];
+
+    while (true) {
+        gmac_dma_set_state(gmac, NPCM_DMA_STATUS_TX_PROCESS_STATE_SHIFT,
+            NPCM_DMA_STATUS_TX_RUNNING_FETCHING_STATE);
+        if (gmac_read_tx_desc(desc_addr, &tx_desc)) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "TX Descriptor @ 0x%x can't be read\n",
+                          desc_addr);
+            return;
+        }
+        /* step 3 */
+
+        trace_npcm_gmac_packet_desc_read(DEVICE(gmac)->canonical_path,
+            desc_addr);
+        trace_npcm_gmac_debug_desc_data(DEVICE(gmac)->canonical_path, &tx_desc,
+            tx_desc.tdes0, tx_desc.tdes1, tx_desc.tdes2, tx_desc.tdes3);
+
+        /* 1 = DMA Owned, 0 = Software Owned */
+        if (!(tx_desc.tdes0 & TX_DESC_TDES0_OWN)) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "TX Descriptor @ 0x%x is owned by software\n",
+                          desc_addr);
+            gmac->regs[R_NPCM_DMA_STATUS] |= NPCM_DMA_STATUS_TU;
+            gmac_dma_set_state(gmac, NPCM_DMA_STATUS_TX_PROCESS_STATE_SHIFT,
+                NPCM_DMA_STATUS_TX_SUSPENDED_STATE);
+            gmac_update_irq(gmac);
+            return;
+        }
+
+        gmac_dma_set_state(gmac, NPCM_DMA_STATUS_TX_PROCESS_STATE_SHIFT,
+            NPCM_DMA_STATUS_TX_RUNNING_READ_STATE);
+        /* Give the descriptor back regardless of what happens. */
+        tx_desc.tdes0 &= ~TX_DESC_TDES0_OWN;
+
+        if (tx_desc.tdes1 & TX_DESC_TDES1_FIRST_SEG_MASK) {
+            csum = gmac_tx_get_csum(tx_desc.tdes1);
+        }
+
+        /* step 4 */
+        tx_buf_addr = tx_desc.tdes2;
+        gmac->regs[R_NPCM_DMA_CUR_TX_BUF_ADDR] = tx_buf_addr;
+        tx_buf_len = TX_DESC_TDES1_BFFR1_SZ_MASK(tx_desc.tdes1);
+        buf = &tx_send_buffer[prev_buf_size];
+
+        if ((prev_buf_size + tx_buf_len) > sizeof(buf)) {
+            tx_buffer_size = prev_buf_size + tx_buf_len;
+            tx_send_buffer = g_realloc(tx_send_buffer, tx_buffer_size);
+            buf = &tx_send_buffer[prev_buf_size];
+        }
+
+        /* step 5 */
+        if (dma_memory_read(&address_space_memory, tx_buf_addr, buf,
+                            tx_buf_len, MEMTXATTRS_UNSPECIFIED)) {
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: Failed to read packet @ 0x%x\n",
+                        __func__, tx_buf_addr);
+            return;
+        }
+        length += tx_buf_len;
+        prev_buf_size += tx_buf_len;
+
+        /* If not chained we'll have a second buffer. */
+        if (!(tx_desc.tdes1 & TX_DESC_TDES1_SEC_ADDR_CHND_MASK)) {
+            tx_buf_addr = tx_desc.tdes3;
+            gmac->regs[R_NPCM_DMA_CUR_TX_BUF_ADDR] = tx_buf_addr;
+            tx_buf_len = TX_DESC_TDES1_BFFR2_SZ_MASK(tx_desc.tdes1);
+            buf = &tx_send_buffer[prev_buf_size];
+
+            if ((prev_buf_size + tx_buf_len) > sizeof(buf)) {
+                tx_buffer_size = prev_buf_size + tx_buf_len;
+                tx_send_buffer = g_realloc(tx_send_buffer, tx_buffer_size);
+                buf = &tx_send_buffer[prev_buf_size];
+            }
+
+            if (dma_memory_read(&address_space_memory, tx_buf_addr, buf,
+                                tx_buf_len, MEMTXATTRS_UNSPECIFIED)) {
+                qemu_log_mask(LOG_GUEST_ERROR,
+                              "%s: Failed to read packet @ 0x%x\n",
+                              __func__, tx_buf_addr);
+                return;
+            }
+            length += tx_buf_len;
+            prev_buf_size += tx_buf_len;
+        }
+        if (tx_desc.tdes1 & TX_DESC_TDES1_LAST_SEG_MASK) {
+            net_checksum_calculate(tx_send_buffer, length, csum);
+            qemu_send_packet(qemu_get_queue(gmac->nic), tx_send_buffer, length);
+            trace_npcm_gmac_packet_sent(DEVICE(gmac)->canonical_path, length);
+            buf = tx_send_buffer;
+            length = 0;
+        }
+
+        /* step 6 */
+        gmac_dma_set_state(gmac, NPCM_DMA_STATUS_TX_PROCESS_STATE_SHIFT,
+            NPCM_DMA_STATUS_TX_RUNNING_CLOSING_STATE);
+        gmac_write_tx_desc(desc_addr, &tx_desc);
+        if (tx_desc.tdes1 & TX_DESC_TDES1_TX_END_RING_MASK) {
+            desc_addr = gmac->regs[R_NPCM_DMA_TX_BASE_ADDR];
+        } else if (tx_desc.tdes1 & TX_DESC_TDES1_SEC_ADDR_CHND_MASK) {
+            desc_addr = tx_desc.tdes3;
+        } else {
+            desc_addr += sizeof(tx_desc);
+        }
+        gmac->regs[R_NPCM_DMA_HOST_TX_DESC] = desc_addr;
+
+        /* step 7 */
+        if (tx_desc.tdes1 & TX_DESC_TDES1_INTERR_COMP_MASK) {
+            gmac->regs[R_NPCM_DMA_STATUS] |= NPCM_DMA_STATUS_TI;
+            gmac_update_irq(gmac);
+        }
+    }
+}
+
 static void gmac_cleanup(NetClientState *nc)
 {
     /* Nothing to do yet. */
@@ -610,6 +790,29 @@ static void npcm_gmac_write(void *opaque, hwaddr offset,
             NPCM_DMA_STATUS_RX_RUNNING_WAITING_STATE);
         break;
 
+    case A_NPCM_DMA_XMT_POLL_DEMAND:
+        /* We dont actually care about the value */
+        gmac_try_send_next_packet(gmac);
+        break;
+
+    case A_NPCM_DMA_CONTROL:
+        gmac->regs[offset / sizeof(uint32_t)] = v;
+        if (v & NPCM_DMA_CONTROL_START_STOP_TX) {
+            gmac_try_send_next_packet(gmac);
+        } else {
+            gmac_dma_set_state(gmac, NPCM_DMA_STATUS_TX_PROCESS_STATE_SHIFT,
+                NPCM_DMA_STATUS_TX_STOPPED_STATE);
+        }
+        if (v & NPCM_DMA_CONTROL_START_STOP_RX) {
+            gmac_dma_set_state(gmac, NPCM_DMA_STATUS_RX_PROCESS_STATE_SHIFT,
+                NPCM_DMA_STATUS_RX_RUNNING_WAITING_STATE);
+            qemu_flush_queued_packets(qemu_get_queue(gmac->nic));
+        } else {
+            gmac_dma_set_state(gmac, NPCM_DMA_STATUS_RX_PROCESS_STATE_SHIFT,
+                NPCM_DMA_STATUS_RX_STOPPED_STATE);
+        }
+        break;
+
     case A_NPCM_DMA_STATUS:
         /* Check that RO bits are not written to */
         if (NPCM_DMA_STATUS_RO_MASK(v)) {
diff --git a/hw/net/trace-events b/hw/net/trace-events
index f91b1a4a3d..78efa2ec2c 100644
--- a/hw/net/trace-events
+++ b/hw/net/trace-events
@@ -478,7 +478,9 @@ npcm_gmac_packet_desc_read(const char* name, uint32_t desc_addr) "%s: attempting
 npcm_gmac_packet_receive(const char* name, uint32_t len) "%s: RX packet length: 0x%04" PRIX32
 npcm_gmac_packet_receiving_buffer(const char* name, uint32_t buf_len, uint32_t rx_buf_addr) "%s: Receiving into Buffer size: 0x%04" PRIX32 " at address 0x%04" PRIX32
 npcm_gmac_packet_received(const char* name, uint32_t len) "%s: Reception finished, packet left: 0x%04" PRIX32
+npcm_gmac_packet_sent(const char* name, uint16_t len) "%s: TX packet sent!, length: 0x%04" PRIX16
 npcm_gmac_debug_desc_data(const char* name, void* addr, uint32_t des0, uint32_t des1, uint32_t des2, uint32_t des3)"%s: Address: %p Descriptor 0: 0x%04" PRIX32 " Descriptor 1: 0x%04" PRIX32 "Descriptor 2: 0x%04" PRIX32 " Descriptor 3: 0x%04" PRIX32
+npcm_gmac_packet_tx_desc_data(const char* name, uint32_t tdes0, uint32_t tdes1) "%s: Tdes0: 0x%04" PRIX32 " Tdes1: 0x%04" PRIX32
 
 # npcm_pcs.c
 npcm_pcs_reg_read(const char *name, uint16_t indirect_access_baes, uint64_t offset, uint16_t value) "%s: IND: 0x%02" PRIx16 " offset: 0x%04" PRIx64 " value: 0x%04" PRIx16
-- 
2.43.0.429.g432eaa2c6b-goog

