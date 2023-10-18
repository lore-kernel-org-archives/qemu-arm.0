Received: by 2002:a17:906:b794:b0:9b6:5cec:e61e with SMTP id dt20csp22068ejb;
        Wed, 18 Oct 2023 11:15:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2gzVUxxqmzL6VEhZZKaHh4y7c6gy8kOQZ6wFvQ0J6kwI3Tz5JdYoUnfVgHAqALcOHAipf
X-Received: by 2002:a05:6214:186b:b0:66c:fbad:5026 with SMTP id eh11-20020a056214186b00b0066cfbad5026mr7470334qvb.29.1697652956900;
        Wed, 18 Oct 2023 11:15:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697652956; cv=none;
        d=google.com; s=arc-20160816;
        b=jSYpP8Unv7jMB6jvlc9J744s8pkzKJ2K4oPPTCDQEzGKNc3DkeDV222YDOwL5pAH2p
         +v0syBPAh20rGudGhSw2Ueq8yJpSgZ6CUCwIg/UcY/tM86n3WcJqBGefenmOGODX+PD0
         c94vq2w23pOKb+75DANg9HWPo+6xO228XBQikj090RqsVSR6C4vBVrDqkKZlpExIzHMQ
         93zB/wq2cYhJM+QVH91wI73+ZTOJr0VKeNYm8PCLhYSBLBaQv1Be1sE48KVQlNv0O5ZL
         KBZ5k4C1SR7ISBuhbLXj+WioAKYmBAxqF5ycHWw7zn6f/feeG4vzqoR+Sgc+Ok4TtARf
         IIdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=nh01iEPPwo2DNCBp0O2gNQtksVnVX5vHAAbfR1EPO/o=;
        fh=8TcdNm2PUOSTOLTAPwKw1HRZgze8qTDV0WK6iGCckjQ=;
        b=tKS7jyCCCANfHQDsZi2mvq5oFfRodGVIeAM1XunTwc+uZby1Dycx7SeQpvI1Y5Bak+
         CTUDLpbBvGAlNUyMmNV89ImghMEQMhQB82B5vZ+YHFmarj9trsV9nn17SpNi5wwsgAKO
         Sx5eaEvFIq6lXFOS0AKDfFo6PUOQKTqLfdcpG9qQpK9/55ZXmOT5tGCEj6DaNupTuK/h
         ItEVTLjEZhHQQciyGgiQdEOlKJPUXBTS9X+QsSRUvG0jkwyM49TV3HzmHFbQ2lAtg+gc
         HrSJzOnhDbPEMLT10lL02f+fvcHSFVC5rkVox3G9tP0vdaeYiqAKLN3sWJeEVds/UThQ
         UilA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=LNhsimEk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cu17-20020a05621417d100b0066cfafee84fsi322309qvb.507.2023.10.18.11.15.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Oct 2023 11:15:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=LNhsimEk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtB2p-0000WR-6n; Wed, 18 Oct 2023 14:13:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3PiAwZQwKCG8aNOVURfgRSNaTbbTYR.PbZdRZh-NeZabaTah.beT@flex--nabihestefan.bounces.google.com>)
 id 1qtB2n-0000Oo-FT
 for qemu-arm@nongnu.org; Wed, 18 Oct 2023 14:13:21 -0400
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3PiAwZQwKCG8aNOVURfgRSNaTbbTYR.PbZdRZh-NeZabaTah.beT@flex--nabihestefan.bounces.google.com>)
 id 1qtB2l-0008Kd-KP
 for qemu-arm@nongnu.org; Wed, 18 Oct 2023 14:13:21 -0400
Received: by mail-yb1-xb4a.google.com with SMTP id
 3f1490d57ef6-d9a3e5f1742so10434562276.0
 for <qemu-arm@nongnu.org>; Wed, 18 Oct 2023 11:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1697652798; x=1698257598; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=nh01iEPPwo2DNCBp0O2gNQtksVnVX5vHAAbfR1EPO/o=;
 b=LNhsimEkNnWt8bly90SWSOhA3x4JhBDbFTXufJp5h6/gyy+YGtfQQsVJ8t8BmwlN1Z
 8WOp2J2WAs6BzSQYMfKOg6TbjBa3P03bPB44VX2l5z5V9+B8hoQ7sD+XPpF6kvKprAWL
 R9VJS1ZemGYhQzesR7r68aL28He9O0b3TT6r0AT7SY+GPXf5uDLaTu8V2xaCVLmAHdXw
 kbIm+q3rZuCRGNX5VYWO5NXJZNuyDXPiW+Cz5sUOtXHMla0udD6CEjIQzA4n/D64VFq/
 OpJxUMyBY11f+QzP6vT4aKRVTGewIjI8eEs4WVTG3RQcwIbyE1yv09BrX9V2whVbsNPj
 akwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697652798; x=1698257598;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nh01iEPPwo2DNCBp0O2gNQtksVnVX5vHAAbfR1EPO/o=;
 b=LM9kTrvF5futzE/p/PgSsWQUrmJU1C8F1zO0rS+VAUCKUEPwuL/qTOReZDIJhho9eK
 YE8N7RN9cgcoIlEP5y4193IO48NcE8OJSdH+OnM3qUejWFuYlCJw3Om/j94/IolKgvTk
 fJM3fsO150H8EssFCU1HADKqHuiTYp63qEu9DSw7b/pSOLEbIPgpm87DQgaiRBo/4/7E
 gF9ZbAN85euMqgGoitL+osm+5UKa7Wg5WULLY3TA9djBcFBRDhbmNvBq15RDr8o7acKj
 Y3JjZsa5zvNBBlnIh+XuC5a/NNFVe9n6FDG9zujlOcr2YdwTb0U/rloEL5L7SYlBtEKE
 Ufbg==
X-Gm-Message-State: AOJu0Yy5HI5qqy6pDYesVZIcsWvTKID7LPWCZKaFvh8prn+3+MZRZGTW
 D0ckvhhuhhg5kAMZDXZz4J/y/IMo93MW91z3y/s=
X-Received: from nabihestefan.c.googlers.com
 ([fda3:e722:ac3:cc00:20:ed76:c0a8:2737])
 (user=nabihestefan job=sendgmr) by 2002:a25:4cc8:0:b0:d9a:c218:8177 with SMTP
 id z191-20020a254cc8000000b00d9ac2188177mr2581yba.8.1697652798170; Wed, 18
 Oct 2023 11:13:18 -0700 (PDT)
Date: Wed, 18 Oct 2023 18:12:58 +0000
In-Reply-To: <20231018181259.748819-1-nabihestefan@google.com>
Mime-Version: 1.0
References: <20231018181259.748819-1-nabihestefan@google.com>
X-Mailer: git-send-email 2.42.0.655.g421f12c284-goog
Message-ID: <20231018181259.748819-11-nabihestefan@google.com>
Subject: [PATCH v4 10/11] hw/net: GMAC Tx Implementation
From: Nabih Estefan <nabihestefan@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 wuhaotsh@google.com, jasonwang@redhat.com, avi.fishman@nuvoton.com, 
 nabihestefan@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3PiAwZQwKCG8aNOVURfgRSNaTbbTYR.PbZdRZh-NeZabaTah.beT@flex--nabihestefan.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
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
X-TUID: euxiPFNrhVzy

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
index cd59ca5fd4..bfceffbb9c 100644
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
@@ -488,6 +489,157 @@ static ssize_t gmac_receive(NetClientState *nc, const uint8_t *buf, size_t len)
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

