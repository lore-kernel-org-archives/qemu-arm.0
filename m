Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp376372ejo;
        Mon, 11 Dec 2023 09:54:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEK6hcMXJMLehBMzffqEhxcmc7O2eswHsdhw1DJIuIdDb2wlMM1zQFThV6wHdqtd2pty580
X-Received: by 2002:a05:6830:143:b0:6d9:bc86:d02 with SMTP id j3-20020a056830014300b006d9bc860d02mr4713948otp.23.1702317245761;
        Mon, 11 Dec 2023 09:54:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702317245; cv=none;
        d=google.com; s=arc-20160816;
        b=EL3kEkfa6HJXqf/87gK3br48Pi3RuDwP9wGkB30vc3KdCztB1O9LJhVO8vVqLhL8Qw
         yiZt8dOVtcjIbwKwAw+esJVFbx0ulcpDjTnW8qVhdaMiuM7daIaO8SYIv2iUniRry2bg
         C7axwqnYAcq7VnDVKRhrVufD27PK5ebXQz2NihrFpmup6WJXo90Vh5ne8WAciSmoRD1r
         RMHsTkHdTAUJKV5w5b1jSDb2AQ8Xck+t2Ad8903fKSTTDxihz+dnTT9M9WfITUa3Cqzj
         VrCQuYZV/p1L/vxufQDDc3MTyJIgvvr1qBnslqG0u3SUJWVmrTrL1Pesl1wvkPpneEAx
         6y6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=Ws2Hhy+3n98F5pXj7QnYVqSgcwXnPCl6A8jmcec+Kyg=;
        fh=jnbnc+JA8os8BNrWArfY9mDntgDud8nPmN5Do23zP6g=;
        b=ofk/7RkzxqqHvk+nZtB6xRhRI4jYbgMJ7Q1pp1EpAnOQpb1VjZ2kPl3MQQAyleeAbg
         iFEBjGiOgBaGM2rji1WySzDFt3hq2loS1kmxGGOgGwz3KiqElNuenZwUCBUyUxBevcQs
         MKvR9ShbSnlxx+HynUB2CetGUxvBGJv7Oi2T9rAape1DF/O2/dg4SjvgVpdha2uRexH8
         JoKKYAwET1U5b/945NzQVjePQVCB6otLWTPRbXDiIkGFuoNbDoCFhMlAAieOG6Iuet78
         1KpAAemok39COjBckzwkjOQkpduKXh3x79MNkhyYQ3UExaOjANMHdJs8O6UtJBIYMXR9
         M/9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=un2x48IS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l18-20020ad44d12000000b0067a9b3d05b8si8760834qvl.110.2023.12.11.09.54.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Dec 2023 09:54:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=un2x48IS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rCkTQ-0004n4-8A; Mon, 11 Dec 2023 12:53:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3Ykx3ZQwKCAsylmtsp34pqlyrzzrwp.nzx1px5-l2xyzyry5.z2r@flex--nabihestefan.bounces.google.com>)
 id 1rCkSY-0003Qe-Nm
 for qemu-arm@nongnu.org; Mon, 11 Dec 2023 12:52:50 -0500
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3Ykx3ZQwKCAsylmtsp34pqlyrzzrwp.nzx1px5-l2xyzyry5.z2r@flex--nabihestefan.bounces.google.com>)
 id 1rCkST-0000Zr-Hy
 for qemu-arm@nongnu.org; Mon, 11 Dec 2023 12:52:49 -0500
Received: by mail-yb1-xb49.google.com with SMTP id
 3f1490d57ef6-db402e6f61dso5159540276.3
 for <qemu-arm@nongnu.org>; Mon, 11 Dec 2023 09:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1702317154; x=1702921954; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=Ws2Hhy+3n98F5pXj7QnYVqSgcwXnPCl6A8jmcec+Kyg=;
 b=un2x48IS44dis3wZ8wDxQ5Csj3p/vFrO+FU6g8k3JiI+TFwQ/25T7fwRWWoR8iCpC3
 I4yZNaZzAsVvJ8Q0uiKgMvyrlml889xtVCEBzN3puDsoVAJ792MH0nHtxR5wQNwSaf0Q
 ULZzytSZ25ce4foUdmDYGYAXJ/NoQozxXB3qU0Rr3YI6pk2LiyRaUHaEZVxdLY5MchAi
 60r9KErLeHgCfBxvCIhGq17s2JFCgoeEgJ9Gaerx7Lo/YHiWClDBSenKeVEbWFvYfA/0
 3sURk8HzDDC1tSPAYamlRlouXAjqBehfz7bdly9yUIcUB9sg3mxxXAlFQKLoYZfWHGBb
 inNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702317154; x=1702921954;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ws2Hhy+3n98F5pXj7QnYVqSgcwXnPCl6A8jmcec+Kyg=;
 b=Yhw0vMBzLMLlTdbPdcVpmPQDSa+A2ZLrFy8ecXScdhSztOi1bFl46//GQl12P0fkCZ
 3F+QtyvlSMXhqVEofO3I4ewNWz2O4dc+4weSFytcOPiEJ+u3MTG8L5q/q6+eex9Z28LK
 8/AV8vs4QXimU7W6hsk62AtQTSK+Y8+05JESgx7cDJhp+vgvOMghqyDUopybgGpgkjeO
 5Cg8ey8JwSStFiY+BpCcS/huaQ/83hwwKb18Jh0xPPzkpXrRotGGP6pT2N6GDwgKclks
 OkCivt3kZePOy00ujlQUCQIGjRi33ZzYIxOZwIXCOLvC55L6OeF8901p/Nw5jQXhIXTy
 4/6Q==
X-Gm-Message-State: AOJu0Yzv3CFVkZpJF8nw4nElmgizfSdHBULd8RcQxfNmn0dVNpiSZ5FB
 RcrYfAoGZP+FZhF4MJpmjEXdLrRAZVVDf9bXOV0=
X-Received: from nabihestefan.c.googlers.com
 ([fda3:e722:ac3:cc00:20:ed76:c0a8:2737])
 (user=nabihestefan job=sendgmr) by 2002:a25:5cb:0:b0:dbc:6715:4a34 with SMTP
 id 194-20020a2505cb000000b00dbc67154a34mr34191ybf.0.1702317154344; Mon, 11
 Dec 2023 09:52:34 -0800 (PST)
Date: Mon, 11 Dec 2023 17:52:13 +0000
In-Reply-To: <20231211175215.3216667-1-nabihestefan@google.com>
Mime-Version: 1.0
References: <20231211175215.3216667-1-nabihestefan@google.com>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
Message-ID: <20231211175215.3216667-11-nabihestefan@google.com>
Subject: [PATCH v7 10/11] hw/net: GMAC Tx Implementation
From: Nabih Estefan <nabihestefan@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 wuhaotsh@google.com, jasonwang@redhat.com, avi.fishman@nuvoton.com, 
 nabihestefan@google.com, kwliu@nuvoton.com, tomer.maimon@nuvoton.com, 
 Hila.Miranda-Kuzi@nuvoton.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3Ykx3ZQwKCAsylmtsp34pqlyrzzrwp.nzx1px5-l2xyzyry5.z2r@flex--nabihestefan.bounces.google.com;
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
X-TUID: vE0DERrzcHcw

From: Nabih Estefan Diaz <nabihestefan@google.com>

- Implementation of Transmit function for packets
- Implementation for reading and writing from and to descriptors in
  memory for Tx

NOTE: This function implements the steps detailed in the datasheet for
transmitting messages from the GMAC.

Change-Id: I6b8ba0736fa5cc866025cd43cb2a90100e458446
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

