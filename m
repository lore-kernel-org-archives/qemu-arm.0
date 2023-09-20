Received: by 2002:a17:906:5293:b0:9ae:5796:d6c1 with SMTP id c19csp180440ejm;
        Wed, 20 Sep 2023 15:19:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6IBkDV/wB/cbZZDI2CfgHN6AHipEaSI6xz7u8/4VX4SivvOAK7+jqqTAvn8RjOr/JCZKm
X-Received: by 2002:a0c:b54a:0:b0:658:2220:d833 with SMTP id w10-20020a0cb54a000000b006582220d833mr3044229qvd.0.1695248363175;
        Wed, 20 Sep 2023 15:19:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695248363; cv=none;
        d=google.com; s=arc-20160816;
        b=tUluXGHTWay3AcLsZ0K575uw4qCSOl0ouwJVspKleb12jKSK4sF7ghd5hk2wppudA3
         2TgupwI57yz6ynZQa6zUEZqkPA0Y5Ph1iQUi6vS9XrIpSQ+gFEAzn76YLSGQDYRQeFT5
         bpqNse52aN81zJiZOQA82xVe2Hwm2yPIYUl/xg/O5fdJSW8yVPNm1Q7dNm5n1me5QcIQ
         L0P5BIzidvPcB/WxtdfvY3lgQsXUb0sPOqULXfipPU19BKd6H/nRF6lfO23jjEjTjqRC
         2Xuh59rSUJoKeIJU7cwVC840xz82iKPEKnRNu56GQTNtYeYjpGZ2JfqzWElyCgjYwosH
         wIIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=jweCztyES2lxNuNIVIYITGJs3Xlco63astRvD/0s+74=;
        fh=5A9rIZi8Z8466MpVipzMSDtnAN6Xw5wyWrNfaUwsYuo=;
        b=kExDeZVb14qY+xQFPIkyU9UmpoLu3K2iYwQmFGeTzCvK3AKHD2BNOTTf2QgljkKjUf
         Vbb0Bog8DG+boDNcWyk8cM6FL42P3/5URsYlEaFOFJNKap9aV6dyo/HXrqHNZmlE7AXi
         RVguwZfvcbO74qWlSaR9CF9X5MaHRE2dqbleW1wmzMW66Yd6E6z+JB9FH+9aW4SYUC5k
         vpdqSHGWhOK5T91l74why0d8xa54vOnwfhAedQ0oNWe2KPYMKSi3MZXBMVc0U2mSgaYo
         YNKaMtRpHDWrB/oNCdwtpe2vJQkTRV9BA1ei3N5d0nNrbHh5CwP+o5lym5ZYeDB4HX4u
         q69Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=zEc1x11V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c6-20020a0ce146000000b00656432bd23fsi85227qvl.238.2023.09.20.15.19.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Sep 2023 15:19:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=zEc1x11V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qj5X0-0002h6-BA; Wed, 20 Sep 2023 18:18:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3vm8LZQwKCPkobcjiftufgbohpphmf.dpnrfnv-bsnopohov.psh@flex--nabihestefan.bounces.google.com>)
 id 1qj5Wr-0002U3-Qv
 for qemu-arm@nongnu.org; Wed, 20 Sep 2023 18:18:41 -0400
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3vm8LZQwKCPkobcjiftufgbohpphmf.dpnrfnv-bsnopohov.psh@flex--nabihestefan.bounces.google.com>)
 id 1qj5Wp-0008DH-IY
 for qemu-arm@nongnu.org; Wed, 20 Sep 2023 18:18:41 -0400
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-59b59e1ac70so4840407b3.1
 for <qemu-arm@nongnu.org>; Wed, 20 Sep 2023 15:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1695248318; x=1695853118; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=jweCztyES2lxNuNIVIYITGJs3Xlco63astRvD/0s+74=;
 b=zEc1x11VZ/RE04isVYDMILMihdkJRFeGtWCY4KfIKQX3DLyuFztwpCQtCbbqQDQe4H
 GFIboEOag64ibOgB121JQKN0Ohge0sOARdb73BTgrUznON26NF4+sCwu4beu9vVPFrNk
 r1BEnKzxMjGOdjlz3lNoDVVZxp7uoTMsI9SN2YJ5vsI6YQrh5ywCJOwxNBg0qlQ3ZJr4
 EEjtoaBkjTm82oUghqnqCGAu5lkgtPHDny49hX4CZsttggPd7EjH5o39HY4lZKcMoyVa
 sw3/rWYrfHPEwGS2Mf9koYWGe07PvO9QIBwbKYjqkyWey68dDJA1kfyg7in79lQNpMjM
 L2TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695248318; x=1695853118;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jweCztyES2lxNuNIVIYITGJs3Xlco63astRvD/0s+74=;
 b=SDwqbFmjQ4G/uUh5qd6O5bEGMiwCWImOzfzOwOjn9VJC7JgZ1lMabnnDL9O2jx9z8O
 iCsxmq/dpmzjrMjvXMjOWGMafVgiQuWTa36AGU6fxWh4TSvwQ/2+O5IaeaNvAOriaPyt
 Yn+YKiB9XuKt/19o5qMFog3+BzM/e2X8la6hEfNA8twdtA/x8kMcc3BXUmv4EmQl88Xl
 HEiqm0P2H0zgLHB/lb0N2D5EmBEAFg3fyohlNpuwXjb9BQ1OQFcI9MO0AoZk4bHO7txI
 nsVKzvganZadrEGx7Fp1yYGzb/N2pV994Mnom9d7ecf46hRiTU5nQ6l65bO18UyBQ0gP
 ftPA==
X-Gm-Message-State: AOJu0Yyprb5fUa7l/u3MNu9zMMWIUSpMr7gUqY9xmujgpAXoMBENnBC4
 d4EviqyvPe2dcA9N4sXetFIJhhqDLKwGy5gfL4Q=
X-Received: from nabihestefan.c.googlers.com
 ([fda3:e722:ac3:cc00:20:ed76:c0a8:2737])
 (user=nabihestefan job=sendgmr) by 2002:a25:d692:0:b0:d7e:add7:4de6 with SMTP
 id n140-20020a25d692000000b00d7eadd74de6mr57651ybg.4.1695248318049; Wed, 20
 Sep 2023 15:18:38 -0700 (PDT)
Date: Wed, 20 Sep 2023 22:18:18 +0000
In-Reply-To: <20230920221819.1106029-1-nabihestefan@google.com>
Mime-Version: 1.0
References: <20230920221819.1106029-1-nabihestefan@google.com>
X-Mailer: git-send-email 2.42.0.459.ge4e396fd5e-goog
Message-ID: <20230920221819.1106029-11-nabihestefan@google.com>
Subject: [PATCH v2 10/11] hw/net: GMAC Tx Implementation
From: Nabih Estefan <nabihestefan@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 wuhaotsh@google.com, jasonwang@redhat.com, avi.fishman@nuvoton.com, 
 Nabih Estefan Diaz <nabihestefan@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1149;
 envelope-from=3vm8LZQwKCPkobcjiftufgbohpphmf.dpnrfnv-bsnopohov.psh@flex--nabihestefan.bounces.google.com;
 helo=mail-yw1-x1149.google.com
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
X-TUID: DiSL5PSPHidS

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
index 67f123e3c4..678c30dfba 100644
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
@@ -484,6 +485,157 @@ static ssize_t gmac_receive(NetClientState *nc, const uint8_t *buf, size_t len)
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
2.42.0.459.ge4e396fd5e-goog

