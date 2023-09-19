Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp3844923ejb;
        Tue, 19 Sep 2023 13:05:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFT+jrWrWCnPLlfRfGTQzKO4Pdhz5KA8vmingxlBLEagNLLO9cHiJikU+WBBtQAzOx07hs
X-Received: by 2002:a05:620a:2ac8:b0:767:3e13:6017 with SMTP id bn8-20020a05620a2ac800b007673e136017mr686096qkb.30.1695153920443;
        Tue, 19 Sep 2023 13:05:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695153920; cv=none;
        d=google.com; s=arc-20160816;
        b=lsLzs4/NtphRt3+KgDhFqgdpTX5xpBDyy9MIF9QttVulJQ/MQVJofFKJB48SlZrfY/
         ahDChyCXyXoZ/5xu6QfOqpEKz+914kkaksy8hhD8mH7qrLJJaA3bpAh/MMhq1xvlawRC
         4y6Hv/In2yjf9FgAMY5MMrx8Q46VFQbZFBoC4x9ouiYG+xouKYR8sxu5IOmCqalD/hNZ
         2Fr0a6gowrRzGY4qINW/Z9JdXp3caFAzyuf+Eq5Cz0U30nJ2KEGZy6u3W6SqzIS2BVId
         aBIrvSfAPFXkVmcib/Gx/Lj3qddiVLnjHP4R3SGceiawR/d4h5nzn8gNalAgno744ZBP
         goeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=TR6lgcRTcQaFiEy+trwn4gcpOsjR1yJslZ49WXNdWvA=;
        fh=rqW8fspY+jkdnllEY/nhhmwU/Ez30a3FOJ93N6rRdoo=;
        b=KILWgjVGavPPG07JP/a564X0IhKyn9I1RLELU+o6cr43ptLYsv44pLegUmzErNKHKC
         Ann5Pj+/z9Ba7RFOSYnJkcdFUQ6vd/R1bydV4779uNGnJp4YaFxfQAqxKqMccmpvf1IM
         cRVF3kKrOz38XDKtxyeMB08MQniDAaQ4ek6fuUeOy10CeukQx1aj4M5MUo8lG1F0dgnr
         34fet88L0QauG9LpOMGPR8Dl+r8CFpVVuPpnXSrbG7Pk11SxKOvIwwhOrDXqq1gHJJ2i
         ATmtD3HTsfLQVmKHdZ8EIS37qUnqcIuuA1U7uow5/kvwvcgvmriG6b9MI9hq98mg+4Nq
         Pgyg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=MusoEjRz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g5-20020a05620a218500b0076da7802c1csi7787063qka.59.2023.09.19.13.05.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Sep 2023 13:05:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=MusoEjRz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qigxu-0006BV-RA; Tue, 19 Sep 2023 16:04:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3KuEJZQwKCkMsfgnmjxyjkfslttlqj.htrvjrz-ij0jqstslsz.twl@flex--nabihestefan.bounces.google.com>)
 id 1qiezi-0005F8-QX
 for qemu-devel@nongnu.org; Tue, 19 Sep 2023 13:58:42 -0400
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3KuEJZQwKCkMsfgnmjxyjkfslttlqj.htrvjrz-ij0jqstslsz.twl@flex--nabihestefan.bounces.google.com>)
 id 1qiezA-00013s-Ig
 for qemu-devel@nongnu.org; Tue, 19 Sep 2023 13:58:42 -0400
Received: by mail-yb1-xb49.google.com with SMTP id
 3f1490d57ef6-cf4cb742715so6539720276.2
 for <qemu-devel@nongnu.org>; Tue, 19 Sep 2023 10:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1695146282; x=1695751082; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=TR6lgcRTcQaFiEy+trwn4gcpOsjR1yJslZ49WXNdWvA=;
 b=MusoEjRz8Pl+rBI/YpoIZhbn2C0ohMUKbKHv5anUS60f2MguY6dsdVboRAlpMiWtd5
 febTaMvj0/ZEq0b8tiySnSZ0Mp29TpIR2Vw6qAmjSsDktrDRc/gHEBZwB8/8jmoi3Wf8
 seDtHUrXRsfyoVU90OdFlkPlxZRI/Ay4xXLF0W35BqmceDWoqXZfuIaK/XYA9TZZr22t
 ArC16wE4phInbPy/lyvkj0OeGkcqEgVNxB7sITyFexJ9W4Vlgt6bE4XZL8ewsaaatKgP
 E3e7QkiXHvDbOzaAwbHcgUnM8pZJOB38zxshbrrN9esHljEBhiVf1SuZ/0hSfGkasItp
 DnPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695146282; x=1695751082;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TR6lgcRTcQaFiEy+trwn4gcpOsjR1yJslZ49WXNdWvA=;
 b=w7zQhxVz59juFQJQJ8xWq7t2oXn+tMLgC4r7pcJd7RBZNCjoo7n2E7RXz1xzEyZXRa
 h2zyKgVVLaw6QZOluXlLu/GXvkQ6ECwLBtBYAyhqn1+KJuHQjuka2mqOcv38eohM/dga
 l2NowmhMK78/iSyDo7uR7nfsRcMM7lJxfSIu9Sj1yz4lhAR1CcJ95/IeLREHgyRp71ha
 AxLxhpXG+X9r05cuU3Sc1X9E+MKvDumxD8vyh+Qq5zp6K7DKjChswohMJ+SmUTHs4keN
 5e6uL/nMISD93+TgNyIn0e0cVowdiEnny+Gz+BRnHZhvM4XBZXr+G0npy70GvO50YD7e
 4NIA==
X-Gm-Message-State: AOJu0Yxw1pQ9/qirWActXgPTZ0HacnaHoLCQbUmPUh2Okq31jHZoznLM
 aZirhfprGe8X2WySKEcT0xPOmnEy1xXcAD2Pl/E=
X-Received: from nabihestefan.c.googlers.com
 ([fda3:e722:ac3:cc00:20:ed76:c0a8:2737])
 (user=nabihestefan job=sendgmr) by 2002:a05:6902:a8a:b0:d80:183c:92b9 with
 SMTP id cd10-20020a0569020a8a00b00d80183c92b9mr6378ybb.4.1695146282102; Tue,
 19 Sep 2023 10:58:02 -0700 (PDT)
Date: Tue, 19 Sep 2023 17:57:23 +0000
In-Reply-To: <20230919175725.3413108-1-nabihestefan@google.com>
Mime-Version: 1.0
References: <20230919175725.3413108-1-nabihestefan@google.com>
X-Mailer: git-send-email 2.42.0.459.ge4e396fd5e-goog
Message-ID: <20230919175725.3413108-13-nabihestefan@google.com>
Subject: [PATCH 12/14] hw/net: GMAC Tx Implementation
From: Nabih Estefan <nabihestefan@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 wuhaotsh@google.com, jasonwang@redhat.com, Avi.Fishman@nuvoton.com, 
 Nabih Estefan Diaz <nabihestefan@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3KuEJZQwKCkMsfgnmjxyjkfslttlqj.htrvjrz-ij0jqstslsz.twl@flex--nabihestefan.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 19 Sep 2023 16:04:51 -0400
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
X-TUID: POHUwjXvIYf4

From: Nabih Estefan Diaz <nabihestefan@google.com>

- Implementation of Transmit function for packets
- Implementation for reading and writing from and to descriptors in
  memory for Tx

NOTE: This function implements the steps detailed in the datasheet for
transmitting messages from the GMAC.

Signed-off-by: Nabih Estefan Diaz <nabihestefan@google.com>
---
 hw/net/npcm_gmac.c | 150 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 150 insertions(+)

diff --git a/hw/net/npcm_gmac.c b/hw/net/npcm_gmac.c
index 67f123e3c4..c457b11e4d 100644
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
@@ -484,6 +485,155 @@ static ssize_t gmac_receive(NetClientState *nc, const uint8_t *buf, size_t len)
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
+            qemu_log_mask(LOG_GUEST_ERROR, "TX Descriptor @ 0x%x can't be read\n",
+                          desc_addr);
+            return;
+        }
+        /* step 3 */
+
+        trace_npcm_gmac_packet_desc_read(DEVICE(gmac)->canonical_path, desc_addr);
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

