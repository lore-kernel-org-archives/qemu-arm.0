Received: by 2002:a17:907:d043:b0:9d0:bf65:29fa with SMTP id vb3csp378462ejc;
        Fri, 27 Oct 2023 10:56:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFs4747S8kSNK0oPsFUgVMJ6+naVK2IziEv3KRC3zgeUZ5nPnpDojeNEgqqJmli32OTWxB
X-Received: by 2002:a05:620a:8f82:b0:76f:d65:af24 with SMTP id ri2-20020a05620a8f8200b0076f0d65af24mr3068469qkn.27.1698429398261;
        Fri, 27 Oct 2023 10:56:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698429398; cv=none;
        d=google.com; s=arc-20160816;
        b=wSa8cEBxrE6YmOvjJvStg6K+rj8csT3ZELJaM9sVab9Bv8Dst8laE+W2BuvGpUpt8S
         k+4QJR7OdgtusrJk6RHHeUYvYYdCffEzSeDxzpLCGa9FacGO2m4WB/waPUXsQFyKIi8z
         8sPQZVdw0Gect7jyzV0NsE65a0CPt4lfWK0OthvmhQqO4Bf4EOFl4sko6lOGT45tZwjn
         cC9IpGxKZIZfjIqgKpCtqYOwi2txO6ZNLrjpohf0IA2UX0Drq0QkotsAxjFw5AKpfXq+
         P8K4OiY0hy0wevjzmsZ6jFOH3oytMW2YkXwngGIx1GYHQqf4XPnPEE+SsiSLI0V3UUhO
         LIGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=MuGIUUMeu9kS2/ivPFf4UnjeqgW1EO47R/btQeZe/nU=;
        fh=jnbnc+JA8os8BNrWArfY9mDntgDud8nPmN5Do23zP6g=;
        b=0EN5u8ncxhGr44mTnBrmMuGlhTZdG6EA4agWBIl3IAeRZpuR7VUCvQNGcYUcEgPq6r
         pxcL3f4xSftNE4B0W1tOQfZvgfcR6xqil8/JNZKVWM8Xyqx7tJ6I8UYXPx8MQFLN649Z
         jnRbqnF/UaroMPY86FTfieNEMtKiJldLGQ0jWHnjLhmE5NcWladb4gp0j91w/TU6ded5
         a4PoOgdyHY26ej3eEs5MLAoF21msa5kk9Lcy6RE2Q9VbuRAnkTZwMd2+XvV+vxAMVodO
         8/f67U5SZ/7WvwBgM+RMJNx+oBlm3r4iGEV5IKRL0bWZSpDzEhcvvtIrJ5PSBmGfBHBs
         U4Mw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="dM/xWhjp";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g17-20020ac87d11000000b004181b8ae8edsi983200qtb.246.2023.10.27.10.56.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Oct 2023 10:56:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="dM/xWhjp";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qwR3y-0006bD-Vj; Fri, 27 Oct 2023 13:56:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3qPk7ZQwKCLsobcjiftufgbohpphmf.dpnrfnv-bsnopohov.psh@flex--nabihestefan.bounces.google.com>)
 id 1qwR3v-0006VY-Vd
 for qemu-arm@nongnu.org; Fri, 27 Oct 2023 13:56:00 -0400
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3qPk7ZQwKCLsobcjiftufgbohpphmf.dpnrfnv-bsnopohov.psh@flex--nabihestefan.bounces.google.com>)
 id 1qwR3r-0007lz-Rr
 for qemu-arm@nongnu.org; Fri, 27 Oct 2023 13:55:58 -0400
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-5a7d261a84bso19356497b3.3
 for <qemu-arm@nongnu.org>; Fri, 27 Oct 2023 10:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1698429352; x=1699034152; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=MuGIUUMeu9kS2/ivPFf4UnjeqgW1EO47R/btQeZe/nU=;
 b=dM/xWhjpCkGuo/P4hquh96GB9/VlKjiTC7p2AtBrCylBpqRIAivgQsVgcvrKwJTU0b
 6nkiNbgFAIKzJVges+ZnNK2WbZZldIBKYkseCY6Nt3LkXj6s61e6AtJ+g/3oco7YX2Df
 ILoW1QaenlGhxdMRKiLIdimkHwQhY2MiaDtAiE7zvrymfUvBJH2gP6TH6zRgSpwbRcMF
 vCdgq2gbl1Zfq0wDLiaLcvO/M5CBpCXExCtdsuVWxojQL5JPNVEALjXkHw4YGVeKTEzK
 IxtKo3M9k8az/GE1MWnhwaYvMGeJkFSzZH8H1xr+awnQmU8hMgzSh9KTrxSbjcVI3eIa
 0eUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698429352; x=1699034152;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MuGIUUMeu9kS2/ivPFf4UnjeqgW1EO47R/btQeZe/nU=;
 b=UB8Er2FF+6jv5V2Trz7hPM7qxo8ngd/yiRpV/RBpSivV57ODkxX6/fD10flsCll5i7
 v2Te0izUgN95SFGYjfgc961Fdhh2txQVUwZJtGkFs6uCLqIai0QhjDfpaN+60oCCOCc0
 KhZp/v4ZmnHwl81nzUpNyVX33y1LnrNB/GwR2wSa0/d8t3jq5180MVHbTcGWZedC+nwM
 RDjnQC15QIerApO3w3t1VYWjWe1+TrFB3MMJ4tFH20eL2f+XBiD+nj34J2tKYilKpraf
 kl7xEjQQnDD+sGMHRwyHERzy/AVfb4Mm8tNoS/Sjye4QrFTk/hKw/0HjAOHw+OdxYICy
 +cpg==
X-Gm-Message-State: AOJu0YyKHxkOt19iLu4gaL4/2bfQdJpxiZ/59NSJi7scJakKOR5bJmIK
 ruJjuZvXfXGA1gnYjo4YzJ6wTLE9oo50C8eFT4c=
X-Received: from nabihestefan.c.googlers.com
 ([fda3:e722:ac3:cc00:20:ed76:c0a8:2737])
 (user=nabihestefan job=sendgmr) by 2002:a0d:dfce:0:b0:5a7:af47:9dda with SMTP
 id i197-20020a0ddfce000000b005a7af479ddamr71632ywe.9.1698429352317; Fri, 27
 Oct 2023 10:55:52 -0700 (PDT)
Date: Fri, 27 Oct 2023 17:55:31 +0000
In-Reply-To: <20231027175532.3601297-1-nabihestefan@google.com>
Mime-Version: 1.0
References: <20231027175532.3601297-1-nabihestefan@google.com>
X-Mailer: git-send-email 2.42.0.820.g83a721a137-goog
Message-ID: <20231027175532.3601297-11-nabihestefan@google.com>
Subject: [PATCH v5 10/11] hw/net: GMAC Tx Implementation
From: Nabih Estefan <nabihestefan@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 wuhaotsh@google.com, jasonwang@redhat.com, avi.fishman@nuvoton.com, 
 nabihestefan@google.com, kwliu@nuvoton.com, tomer.maimon@nuvoton.com, 
 Hila.Miranda-Kuzi@nuvoton.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1149;
 envelope-from=3qPk7ZQwKCLsobcjiftufgbohpphmf.dpnrfnv-bsnopohov.psh@flex--nabihestefan.bounces.google.com;
 helo=mail-yw1-x1149.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: lXc9EqCMZjse

From: Nabih Estefan Diaz <nabihestefan@google.com>

- Implementation of Transmit function for packets
- Implementation for reading and writing from and to descriptors in
  memory for Tx

NOTE: This function implements the steps detailed in the datasheet for
transmitting messages from the GMAC.

Change-Id: I5f6148eaf8548726a48db9d4a6d8796bb7ed12dc
Signed-off-by: Nabih Estefan <nabihestefan@google.com>
---
 hw/net/npcm_gmac.c  | 151 ++++++++++++++++++++++++++++++++++++++++++++
 hw/net/trace-events |   1 -
 2 files changed, 151 insertions(+), 1 deletion(-)

diff --git a/hw/net/npcm_gmac.c b/hw/net/npcm_gmac.c
index cd59ca5fd4..0098b00a49 100644
--- a/hw/net/npcm_gmac.c
+++ b/hw/net/npcm_gmac.c
@@ -267,6 +267,7 @@ static int gmac_write_tx_desc(dma_addr_t addr, struct NPCMGMACTxDesc *desc)
     }
     return 0;
 }
+
 static int gmac_rx_transfer_frame_to_buffer(uint32_t rx_buf_len,
                                             uint32_t *left_frame,
                                             uint32_t rx_buf_addr,
@@ -488,6 +489,156 @@ static ssize_t gmac_receive(NetClientState *nc, const uint8_t *buf, size_t len)
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
diff --git a/hw/net/trace-events b/hw/net/trace-events
index 2843f1eaf8..b19b9ec2ad 100644
--- a/hw/net/trace-events
+++ b/hw/net/trace-events
@@ -477,7 +477,6 @@ npcm_gmac_packet_desc_read(const char* name, uint32_t desc_addr) "%s: attempting
 npcm_gmac_packet_receive(const char* name, uint32_t len) "%s: RX packet length: 0x%04" PRIX32
 npcm_gmac_packet_receiving_buffer(const char* name, uint32_t buf_len, uint32_t rx_buf_addr) "%s: Receiving into Buffer size: 0x%04" PRIX32 " at address 0x%04" PRIX32
 npcm_gmac_packet_received(const char* name, uint32_t len) "%s: Reception finished, packet left: 0x%04" PRIX32
-npcm_gmac_packet_transmit(const char* name, uint16_t len) "%s: TX transmission start, packed length 0x%04" PRIX16
 npcm_gmac_packet_sent(const char* name, uint16_t len) "%s: TX packet sent!, length: 0x%04" PRIX16
 npcm_gmac_debug_desc_data(const char* name, void* addr, uint32_t des0, uint32_t des1, uint32_t des2, uint32_t des3)"%s: Address: %p Descriptor 0: 0x%04" PRIX32 " Descriptor 1: 0x%04" PRIX32 "Descriptor 2: 0x%04" PRIX32 " Descriptor 3: 0x%04" PRIX32
 npcm_gmac_packet_tx_desc_data(const char* name, uint32_t tdes0, uint32_t tdes1) "%s: Tdes0: 0x%04" PRIX32 " Tdes1: 0x%04" PRIX32
-- 
2.42.0.820.g83a721a137-goog

