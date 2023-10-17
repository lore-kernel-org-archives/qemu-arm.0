Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp4256086ejc;
        Tue, 17 Oct 2023 16:05:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH71Mz7esYR9l6Pj5eSawG3Ef/QwqSnce8Eec4dS0kRBeSYfy+4S5q2YztxGUuyTjGKm/ft
X-Received: by 2002:a05:620a:4511:b0:76e:ef9e:9e59 with SMTP id t17-20020a05620a451100b0076eef9e9e59mr4300755qkp.4.1697583956704;
        Tue, 17 Oct 2023 16:05:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697583956; cv=none;
        d=google.com; s=arc-20160816;
        b=GhY7uvtt/8e0nH4Tbmh9+JafDyX0yxozX89l60gdq1EYRM1rlZwna+4r30xp812IAi
         gBz53ckFuPjqY/Za1HV+U7llVhRF+6cLf9a/gXLiBCtvWCf977dvUJzDlWbKGzPcrZJZ
         ixuNEGY8j49gnjSFEUNJPGqwpC5n/sTvtLtZa8ZYLl1vJgFCs2ESPzJxo6n4O+LcJUIN
         Eass2uAeOoXu4O6phrGxMFeTdPWsQAfGLTT+jTORWJ83wAKA2deUO3S4b4UcSz5wNK/f
         PdFOfylKniEgSEImWxFjaiu/71Qi8ZVrYkXed3eth2IzCTe1pc6EjRCfpRntBjolGj6C
         cJ1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=/2Lgv/FL2bISROten8VjU5JP29uAfB48k17zHhZHhrg=;
        fh=5A9rIZi8Z8466MpVipzMSDtnAN6Xw5wyWrNfaUwsYuo=;
        b=mzQLjX8vn3no+fGqcbnEGsyVJyhxN38MFQMrdytCgWwgmvz2PP+DXi0pGZxlcESOE/
         WZWhQFUTQMm08xueS5UT7kUfKhOXz5kk0h6nxMrG4WQVRzE1sHYl+D4AXa7VGk/gmzCy
         mlVDgl2GgAcrBj3kCWczRFw2dULcjtJak/FbYw7X1jb0ixKWJ9VPH57x+7qhZlRq4mmh
         a+IEEVkh5XVak2XeBCeSny3JZBTLt7ysOkXta0wsFwNx5EHcorO9c/ZyuMjSJCWro5ek
         lbmgNH9JD2Ny9kQuqKfYwLBp5jn3tH12RF1i5X5+YCtdaAWP4oMRp/vM+rgWmQLrBGpI
         11Cg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=Zz2DXmW1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z28-20020a05620a101c00b007758f5499b0si1791081qkj.426.2023.10.17.16.05.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Oct 2023 16:05:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=Zz2DXmW1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qst6i-0006Wt-Qf; Tue, 17 Oct 2023 19:04:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <36BIvZQwKCPkobcjiftufgbohpphmf.dpnrfnv-bsnopohov.psh@flex--nabihestefan.bounces.google.com>)
 id 1qst6h-0006OT-NS
 for qemu-arm@nongnu.org; Tue, 17 Oct 2023 19:04:11 -0400
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <36BIvZQwKCPkobcjiftufgbohpphmf.dpnrfnv-bsnopohov.psh@flex--nabihestefan.bounces.google.com>)
 id 1qst6f-0002Le-DV
 for qemu-arm@nongnu.org; Tue, 17 Oct 2023 19:04:11 -0400
Received: by mail-yb1-xb4a.google.com with SMTP id
 3f1490d57ef6-d9a528c2c8bso7683843276.1
 for <qemu-arm@nongnu.org>; Tue, 17 Oct 2023 16:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1697583848; x=1698188648; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=/2Lgv/FL2bISROten8VjU5JP29uAfB48k17zHhZHhrg=;
 b=Zz2DXmW1nxPGAxtaes/nORDD+P6KUseMb4iq+KdrjeCpE+kHbARoatNDbgnTnNw6os
 MalQ17z+OhlDho5ebcJzcc2T6UlvqmO1SiD2QV/9ePUPlSp/yYu0iQcfyC09lrPlLbu7
 kpGo4XI4dKqHMm+Ka9i98jL+B24pQzye1IkEZYzbhpuq0RhRMtlgpFmnjya2f8jdcGYe
 UwHAXmbvZn7/sHtocPn9czkUpPmkzF/Gov4067EN+bCPKQPVOKhFP2xOCnXi5sMfeIr/
 1h4OL08J/xeZ9oRp60qNvmfEyimNmdIGPVXB1CFvyXy3chrmkoifOCT8B0VVdTIPchbU
 bBnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697583848; x=1698188648;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/2Lgv/FL2bISROten8VjU5JP29uAfB48k17zHhZHhrg=;
 b=jFA3T9WmfsOCj33zCEul9lRNl8CSPt+GH36js6A9CpZLY9QR0UOboSsLeq380nqKec
 IOPbG6PIZTorwHcdtjfbUWnG6ea3KQTs+RlVrRobMJLQ38h6sbuB59iHCzzJ977Me559
 guKGqaKhlP7prdx8j6xnN+eTjPHkNkPZGr+7s3vP2gnsIid83yP4JQfsSMZTZua0j2yC
 MZYaDZkLm8DSM+gpmdit6E34YMPmQiD72hadNBscEjk5a7Cw3UAzbFLZnVo69EeuHyr0
 UmQ2+GD9tS51NZ2rYYsRnCiBZmROpfVNqA9n6bq+lG95faMH7Gyu3xyGAQAGzu24gB0Z
 DcNg==
X-Gm-Message-State: AOJu0Yy5oHKoQBH30xPiFFnwBYKuy10+sA/LtYcLwnORT6PKAxzAakr3
 d+2grdKeuwafnF1hBt2RnSNEgJpAQ4CGLs3z/OM=
X-Received: from nabihestefan.c.googlers.com
 ([fda3:e722:ac3:cc00:20:ed76:c0a8:2737])
 (user=nabihestefan job=sendgmr) by 2002:a25:8607:0:b0:d9b:f88c:ca2b with SMTP
 id y7-20020a258607000000b00d9bf88cca2bmr74839ybk.11.1697583848085; Tue, 17
 Oct 2023 16:04:08 -0700 (PDT)
Date: Tue, 17 Oct 2023 23:03:41 +0000
In-Reply-To: <20231017230342.311227-1-nabihestefan@google.com>
Mime-Version: 1.0
References: <20231017230342.311227-1-nabihestefan@google.com>
X-Mailer: git-send-email 2.42.0.655.g421f12c284-goog
Message-ID: <20231017230342.311227-11-nabihestefan@google.com>
Subject: [PATCH v3 10/11] hw/net: GMAC Tx Implementation
From: Nabih Estefan <nabihestefan@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 wuhaotsh@google.com, jasonwang@redhat.com, avi.fishman@nuvoton.com, 
 Nabih Estefan Diaz <nabihestefan@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=36BIvZQwKCPkobcjiftufgbohpphmf.dpnrfnv-bsnopohov.psh@flex--nabihestefan.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
X-TUID: xlio5A1xfs9g

From: Nabih Estefan Diaz <nabihestefan@google.com>

- Implementation of Transmit function for packets
- Implementation for reading and writing from and to descriptors in
  memory for Tx

NOTE: This function implements the steps detailed in the datasheet for
transmitting messages from the GMAC.

Signed-off-by: Nabih Estefan Diaz <nabihestefan@google.com>
---
 hw/net/npcm_gmac.c | 152 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 152 insertions(+)

diff --git a/hw/net/npcm_gmac.c b/hw/net/npcm_gmac.c
index a7c8b67223..688ac4be44 100644
--- a/hw/net/npcm_gmac.c
+++ b/hw/net/npcm_gmac.c
@@ -266,6 +266,7 @@ static int gmac_write_tx_desc(dma_addr_t addr, struct NPCMGMACTxDesc *desc)
     }
     return 0;
 }
+
 static int gmac_rx_transfer_frame_to_buffer(uint32_t rx_buf_len,
                                             uint32_t *left_frame,
                                             uint32_t rx_buf_addr,
@@ -487,6 +488,157 @@ static ssize_t gmac_receive(NetClientState *nc, const uint8_t *buf, size_t len)
     gmac->regs[R_NPCM_DMA_HOST_RX_DESC] = desc_addr;
     return len;
 }
+
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
+        trace_npcm_gmac_packet_transmit(DEVICE(gmac)->canonical_path, length);
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
-- 
2.42.0.655.g421f12c284-goog

