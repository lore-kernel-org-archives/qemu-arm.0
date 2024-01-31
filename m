Received: by 2002:a17:906:724b:b0:a35:eedd:80b0 with SMTP id n11csp1164576ejk;
        Tue, 30 Jan 2024 16:25:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGsl7X+x4ip0ntfPs427X02+bYwqc0ro2hp/lQbYYWdt6biV314kTWsZtf+8V5EFrhRraEq
X-Received: by 2002:a05:6102:2a79:b0:46b:3a27:989c with SMTP id hp25-20020a0561022a7900b0046b3a27989cmr13046vsb.14.1706660751248;
        Tue, 30 Jan 2024 16:25:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706660751; cv=none;
        d=google.com; s=arc-20160816;
        b=JPYdekl0H5Ejr06ONj+3n4AaLzKnnUhhL8euACBmXtISgXFRXv5JrfH1A0S9PV9YuY
         dYCZUAQs1T1xqsw4kgzw5rncu8UOKwxlWkUwsBPSGIX26Hy2Uo0HrmqeSAyYiDaeXFWy
         b3c+ANDz7IGSj3I9jqL+ToGmhZtimhDwbp9Y15sti0DxCgLjtdIrCDjWPg1/+biPjKfC
         UrgADchf5ZUi45i9mfIHrKhLcxH6qk6BNXjADvw5Thz2XtlR5+jERBBWnPlU9rK+mjUg
         9WxWpLwOAixad2HUkBzaNRbGhVPLrl6X67OAnXUbdMlRB0RA2r5cjpoO7V+NBlOde05g
         pTPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=gEsdIN8b4EQ04ggQrgbYzK4nH9IMgJLq7dua3wvb2SQ=;
        fh=+aVB0apLn7P4p3cMF9Qg7nFZ6+AnRx2Fcri+oFjNFtM=;
        b=DI06R7Q0lFVem8VLNEfd1rNWMN/mreOkZ+2EPO61iVwcvnPeVpWoqcwk6HAp9NFxp9
         gNh5ahLzbWmLrQk9goojkPbDAQoNEKRQbEpGMxr7M6PVblLvsw46gIfj/dnyh57EoE5L
         b8BSuqKfXGrz/tm9pF68Uizja+Y0jOSNIPgTS1bTX3v+TEaAR5+/w+WaptiygOz3o032
         VeloeIOVOGe541E3kvpr0OpFQIzfCt2Ttuu+lZh1ckI3k6a3ySHYmlOkYOdqh3wwVcon
         XqFHntul0sQC+HWRbLJRxbwWcm4B2DzuM73/tSdDQm0ki0pn5nF3YkrZDcvtCes4ebja
         /A0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=zpKyUHsS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jq13-20020ad45fcd000000b0068c4d79aa72si6229867qvb.437.2024.01.30.16.25.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jan 2024 16:25:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=zpKyUHsS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rUyQ0-0002K0-PD; Tue, 30 Jan 2024 19:25:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3dpO5ZQwKCLckXYfebpqbcXkdlldib.Zljnbjr-Xojklkdkr.lod@flex--nabihestefan.bounces.google.com>)
 id 1rUyPy-0002IK-Nn
 for qemu-arm@nongnu.org; Tue, 30 Jan 2024 19:25:30 -0500
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3dpO5ZQwKCLckXYfebpqbcXkdlldib.Zljnbjr-Xojklkdkr.lod@flex--nabihestefan.bounces.google.com>)
 id 1rUyPw-0003sC-Ia
 for qemu-arm@nongnu.org; Tue, 30 Jan 2024 19:25:30 -0500
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-6002a655cc1so72031947b3.1
 for <qemu-arm@nongnu.org>; Tue, 30 Jan 2024 16:25:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1706660727; x=1707265527; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=gEsdIN8b4EQ04ggQrgbYzK4nH9IMgJLq7dua3wvb2SQ=;
 b=zpKyUHsSuoehfMWHJaJUTiECCVyI3uqjqwFQpLIwDQYcKC7smHbFnMWukXAMD5+QEk
 2LM3k8LwPO5Z6522x+B9D3T8S+wadxdf8vrWgoBFFuW1yl9Gm/2H8pYUkcW+Z//2bEA4
 +Aoj+LxeXVSzrSivl9xc0oC8ONPka5aYDGya83KiljIlQsCviaygHAJgimGoj3XoN8Z5
 JTKgFW9KSb3XPJnv8cnUuglpuBNgIiuE37JWf2F4AezZG8qmDX1KK+DMqeAzhAJWmXqO
 RIiimofVchberCxrvt9F7xFx52eSP9nO76lgBpkFYXYmaUMjVYAMvjHBdgSL5cO7Gwjw
 9LQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706660727; x=1707265527;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gEsdIN8b4EQ04ggQrgbYzK4nH9IMgJLq7dua3wvb2SQ=;
 b=gYOKcGy96wJZfGYTx5NY06G4LYZLZ8z0UbWgUK/3fQxfe2dkArGiSpR1BKo1WVPrDB
 Ni5+YXtDMJ65b+8Cbx6fSY+uO/7DKZ1elAviLxFmm6Wy28WYlRb7rXGVJTMjTZ5/T7WR
 v52TU3bDsQ2ZMPMXyQW8nL4e1wmRiV2K2CffmmpQM/NicZzv3prRZUzuHocM9BJzfxqC
 uhaaIh7bIFAeSNWJv+C9T2K+6R0pZSg6dhuzJJhE5wHiJN144emcH2HCKqW7dEKgmgrn
 qzUbpeEjJhTA72zkEgaeZjF79ADPZIo2dG7X2WxjZw3dDkDej/S2gasqwyUaGLEA6Qe4
 VRGg==
X-Gm-Message-State: AOJu0YwRKb1NVl+wiVa12P47KV4JW7kzF5raVWOfa+3ih89xyLA3z6FW
 jL8dJiW2ghs3wkELhOkM1k/OwiJ5hKMx5wYRAYAmqo3d/V8VfFKsp1xMZV3pnNKbGaIfd4Uqsff
 6Aqc9yHrlYfXY63eWhy7TxmA5zQ==
X-Received: from nabihestefan.c.googlers.com
 ([fda3:e722:ac3:cc00:20:ed76:c0a8:2737])
 (user=nabihestefan job=sendgmr) by 2002:a81:57c3:0:b0:5f9:4fa1:1a0b with SMTP
 id l186-20020a8157c3000000b005f94fa11a0bmr2141715ywb.0.1706660726878; Tue, 30
 Jan 2024 16:25:26 -0800 (PST)
Date: Wed, 31 Jan 2024 00:25:10 +0000
In-Reply-To: <20240131002511.986787-1-nabihestefan@google.com>
Mime-Version: 1.0
References: <20240131002511.986787-1-nabihestefan@google.com>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
Message-ID: <20240131002511.986787-6-nabihestefan@google.com>
Subject: [PATCH v16 5/6] hw/net: GMAC Tx Implementation
From: Nabih Estefan <nabihestefan@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 wuhaotsh@google.com, jasowang@redhat.com, avi.fishman@nuvoton.com, 
 nabihestefan@google.com, kwliu@nuvoton.com, tomer.maimon@nuvoton.com, 
 Hila.Miranda-Kuzi@nuvoton.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::114a;
 envelope-from=3dpO5ZQwKCLckXYfebpqbcXkdlldib.Zljnbjr-Xojklkdkr.lod@flex--nabihestefan.bounces.google.com;
 helo=mail-yw1-x114a.google.com
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
X-TUID: MFEzrRHErzPK

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
index a3c626e1b8..1b71e2526e 100644
--- a/hw/net/npcm_gmac.c
+++ b/hw/net/npcm_gmac.c
@@ -238,6 +238,37 @@ static int gmac_write_rx_desc(dma_addr_t addr, struct NPCMGMACRxDesc *desc)
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
@@ -459,6 +490,155 @@ static ssize_t gmac_receive(NetClientState *nc, const uint8_t *buf, size_t len)
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
@@ -613,6 +793,29 @@ static void npcm_gmac_write(void *opaque, hwaddr offset,
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

