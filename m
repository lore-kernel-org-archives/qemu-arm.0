Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp363681ejo;
        Mon, 11 Dec 2023 09:32:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF18pkszJIJjoG8xFqbIp8e4oazS9QAdp+79bFE2+jpxe0MBN3/Uli/E38nkagRiQb+4lEl
X-Received: by 2002:a05:620a:24c5:b0:77e:fba3:9d04 with SMTP id m5-20020a05620a24c500b0077efba39d04mr6274805qkn.104.1702315952728;
        Mon, 11 Dec 2023 09:32:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702315952; cv=none;
        d=google.com; s=arc-20160816;
        b=Jwtgyq2eGKct+0ZTnwJJsG/XrNGfygjDl2QZTwlzGkAnlO0ywkzia+wsCV04p5cN0y
         YYLZeIa9rH18PjHv/U2plej/Tj2IyCvBIRy1FO0YRkVUVs/ClreEM308P5WRAqJLAdqO
         +jHgm7bVkBjBsJMETvPUsUVs73ozyMn0BQFSgVTdyvHHvKye+Fx/k/Cy1dEP0FA6q1rj
         epeeZWM4E8xEab5nTbe/im8Wrhr1XAQpbhk6zX6CZ2P+maxzhyajGT77XbzHjws832z3
         vtUF4b823DwqIs9zQVSX16cG0h3waSzoNFd3RGWbBszhQxB9JKyQpx63FZtmjdIoUcra
         4fgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=FWeZ5FGlt6IzPGd18kEMHHcbHc+GxALBQ6tNk//sgj4=;
        fh=jnbnc+JA8os8BNrWArfY9mDntgDud8nPmN5Do23zP6g=;
        b=mzlL0yfxu8F/vXp/b4rIyvqHuuknc4tOyXl265YhDwTs4h7EKZZhjvUiAlHHLxgkRc
         r8AduwE9BqWEboOllnVFkg3T9VjZSeNw1ly5SBDxP4dPDP8BenxNJQR5UfBblmc8PVPH
         gdQNAB41P2rzlxHDHx+7VD5+KZi8uUNRUobAKTYIAu85e4voB77xOFdFBx/L6EBKNpry
         Ot2rV01wM/LSry/ERAZndJgD3aK1DiJw/mueyEq99Sk7n4agBGuPDH61sCMMXxeu3XDm
         dJXMUOAT7OLC9hEn5HYj0Vf2N3gVjmeyRumfUgla6QzXdJ6vO+SFcnU+s2ltudDpZUJg
         OHKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=2m+NQP8D;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id vr17-20020a05620a55b100b0077dd589e3fasi8138090qkn.769.2023.12.11.09.32.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Dec 2023 09:32:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=2m+NQP8D;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rCk7e-00015Q-48; Mon, 11 Dec 2023 12:31:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3K0d3ZQwKCsg1opwvs67sto1u22uzs.q204s08-rs9sz121u18.25u@flex--nabihestefan.bounces.google.com>)
 id 1rCk6w-0000fq-5D
 for qemu-devel@nongnu.org; Mon, 11 Dec 2023 12:30:30 -0500
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3K0d3ZQwKCsg1opwvs67sto1u22uzs.q204s08-rs9sz121u18.25u@flex--nabihestefan.bounces.google.com>)
 id 1rCk6n-0004mm-5d
 for qemu-devel@nongnu.org; Mon, 11 Dec 2023 12:30:29 -0500
Received: by mail-yb1-xb49.google.com with SMTP id
 3f1490d57ef6-db547d41413so3698939276.0
 for <qemu-devel@nongnu.org>; Mon, 11 Dec 2023 09:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1702315820; x=1702920620; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=FWeZ5FGlt6IzPGd18kEMHHcbHc+GxALBQ6tNk//sgj4=;
 b=2m+NQP8Dm/j6mRgsainTrE25uS5oBKpMII9kdRDWiEEAYknZaeEpAKYb1G8no6OGGY
 6cSs5YtqDADe7uL4rPn+/0VkHyR1nhhtZgCxV4eSHoPdcl/x5EGEqCEpqxJrwtRAFe4s
 BeM57Vw+jy78ImhTwFyIgQGYKDW0xGuh1kwcpX7eKQABTfS6CIh6Af6rlY4ZNURcJ2TQ
 xHP+YMl7uFvNFfpEK9uSVrFrEhXQ5KuHciCzjKsop7BZ0frXdPSsTX2l5QKiKClzA+5e
 mgz8mKQ95g0JKiExnC34z1GyF/HLyFIoGyzVq13OPTigi8Gr4Wqpf1nr/8KqlbBk/Ih5
 5rNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702315820; x=1702920620;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FWeZ5FGlt6IzPGd18kEMHHcbHc+GxALBQ6tNk//sgj4=;
 b=gqGdI5vQlEibn0oH39+ztYr+9gQyTUKPGL/h1DTbigZiAaZubEYFkFysfn3cMdOFGi
 BMZVrnHhQHpID2kAAqPtcGJR9b8dxIeU8hygePsMo91s1SlPWukXkt6LOoDWbE0GMfix
 xf2WbB6rk4mK+QaGVkfq7oHyciBwfl5wQgYgqup7w6EW3XHGA91krjXSny7OonzaXsaT
 BM46XxUU135DkeZJED+jlf7IKLFvo4dHgKoznzs3DRB2ipJ4b9n5A8+0fVvYkXdeiKV0
 /KYwWPo0tJMicF+YonREj3h4w4BNn/yo7xpdpB+ZC8xwmdqhNyYY57jSBMCPorfoCoCY
 UOaw==
X-Gm-Message-State: AOJu0Yws31wMXgSyuwtNx7f/bAqLgj0MUviQRfgB9npH3AushGA5MzJG
 98D/Q9bh1jE48zM2qrTCfPsWuElHqtAHYnKmdP0=
X-Received: from nabihestefan.c.googlers.com
 ([fda3:e722:ac3:cc00:20:ed76:c0a8:2737])
 (user=nabihestefan job=sendgmr) by 2002:a05:6902:14d:b0:db5:3aaf:5207 with
 SMTP id p13-20020a056902014d00b00db53aaf5207mr82129ybh.3.1702315819832; Mon,
 11 Dec 2023 09:30:19 -0800 (PST)
Date: Mon, 11 Dec 2023 17:29:51 +0000
In-Reply-To: <20231211172953.3164357-1-nabihestefan@google.com>
Mime-Version: 1.0
References: <20231211172953.3164357-1-nabihestefan@google.com>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
Message-ID: <20231211172953.3164357-11-nabihestefan@google.com>
Subject: [PATCH v6 10/11] hw/net: GMAC Tx Implementation
From: Nabih Estefan <nabihestefan@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 wuhaotsh@google.com, jasonwang@redhat.com, avi.fishman@nuvoton.com, 
 nabihestefan@google.com, kwliu@nuvoton.com, tomer.maimon@nuvoton.com, 
 Hila.Miranda-Kuzi@nuvoton.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3K0d3ZQwKCsg1opwvs67sto1u22uzs.q204s08-rs9sz121u18.25u@flex--nabihestefan.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: rlJaPL+eGMSz

From: Nabih Estefan Diaz <nabihestefan@google.com>

- Implementation of Transmit function for packets
- Implementation for reading and writing from and to descriptors in
  memory for Tx

NOTE: This function implements the steps detailed in the datasheet for
transmitting messages from the GMAC.

Change-Id: I5f6148eaf8548726a48db9d4a6d8796bb7ed12dc
Signed-off-by: Nabih Estefan <nabihestefan@google.com>
Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
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
index 9588dc151b..78efa2ec2c 100644
--- a/hw/net/trace-events
+++ b/hw/net/trace-events
@@ -478,7 +478,6 @@ npcm_gmac_packet_desc_read(const char* name, uint32_t desc_addr) "%s: attempting
 npcm_gmac_packet_receive(const char* name, uint32_t len) "%s: RX packet length: 0x%04" PRIX32
 npcm_gmac_packet_receiving_buffer(const char* name, uint32_t buf_len, uint32_t rx_buf_addr) "%s: Receiving into Buffer size: 0x%04" PRIX32 " at address 0x%04" PRIX32
 npcm_gmac_packet_received(const char* name, uint32_t len) "%s: Reception finished, packet left: 0x%04" PRIX32
-npcm_gmac_packet_transmit(const char* name, uint16_t len) "%s: TX transmission start, packed length 0x%04" PRIX16
 npcm_gmac_packet_sent(const char* name, uint16_t len) "%s: TX packet sent!, length: 0x%04" PRIX16
 npcm_gmac_debug_desc_data(const char* name, void* addr, uint32_t des0, uint32_t des1, uint32_t des2, uint32_t des3)"%s: Address: %p Descriptor 0: 0x%04" PRIX32 " Descriptor 1: 0x%04" PRIX32 "Descriptor 2: 0x%04" PRIX32 " Descriptor 3: 0x%04" PRIX32
 npcm_gmac_packet_tx_desc_data(const char* name, uint32_t tdes0, uint32_t tdes1) "%s: Tdes0: 0x%04" PRIX32 " Tdes1: 0x%04" PRIX32
-- 
2.43.0.472.g3155946c3a-goog

