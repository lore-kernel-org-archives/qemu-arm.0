Received: by 2002:a17:906:d96:b0:a23:4dac:818 with SMTP id m22csp1779960eji;
        Tue, 19 Dec 2023 13:35:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH0vjUjZSXfqRnzFXuMfPkvc/P8SjyNBp6XapknhIo4lqCc6Jwn7eT88pVD63ajisUl++Js
X-Received: by 2002:a0c:f981:0:b0:67a:a721:e12e with SMTP id t1-20020a0cf981000000b0067aa721e12emr20890777qvn.91.1703021718735;
        Tue, 19 Dec 2023 13:35:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703021718; cv=none;
        d=google.com; s=arc-20160816;
        b=iDdj8USfU7642cYdbS6ka/xQg+CNgMF2UjMt/d4r9JD4HcNDNS+lNSP2Tg0srw0+Lz
         qw5IRx1Op+MEPjwJ/mwu69080K5rbU4MfT+dS+5xfL4SOyNt8/xmBGOsJeQeZ9yQDYwV
         OTx0sjsegruqTGs6VJinvcaFjiVH/oJ+3bYO+wjfTVqgWgsYnPVcsqxk6sJghmCCGCqU
         UABKS++sEW02H+oT16pLWBWGKeADmH3Osi+VUxKNwp79oaXO8aUJPtaJUrhkeImk/+EX
         m0mrw0PtNpURcnDuKjp9qO9AcT1UGV2fh8hshYZ3ELmNNvQkqpTP+3+35cELjSizd3av
         S5/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=EkaHwstt77H2oSvEnUV7KAJpD3VvTNcdl9x1HxBU+T8=;
        fh=+aVB0apLn7P4p3cMF9Qg7nFZ6+AnRx2Fcri+oFjNFtM=;
        b=ESi2ELhu2N59WfTIxzlCXprFFU172+Ch09xunYfZV6PZXoH4JTE79M+m7IjFIuHZun
         mgbQuvwOma9pg71xlD9NLLVVFZMxICS/7C4eGksdhH489QsCAZ0J/NyeA50hmqmQrIaz
         NXBtlcLpzhrUdQ1ByA/ugzY2UF4MssTNc5PqoG+tjHunSp6qt6H3j+g8v+jhqWUu0XAQ
         V4h/1Ikk4KIy0pXD3ZWNtxMbtPWo+61GWaPh/sNR7vx09Yij1sfEeWQ/YsGEa5xQEFsr
         ldp4Fj2IgakYiYPkfi8d5WHF0+KxTk0fLD/3ONyHwPYRneMezwG0T7upoQJPE/5wuksT
         UC5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=tzxJPK2d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d17-20020a0ce451000000b0067f2d9917e3si7870808qvm.293.2023.12.19.13.35.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Dec 2023 13:35:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=tzxJPK2d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rFhix-0007iq-B2; Tue, 19 Dec 2023 16:33:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3JgyCZQwKCHkkXYfebpqbcXkdlldib.Zljnbjr-Xojklkdkr.lod@flex--nabihestefan.bounces.google.com>)
 id 1rFhiV-0007WR-T9
 for qemu-arm@nongnu.org; Tue, 19 Dec 2023 16:33:35 -0500
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3JgyCZQwKCHkkXYfebpqbcXkdlldib.Zljnbjr-Xojklkdkr.lod@flex--nabihestefan.bounces.google.com>)
 id 1rFhiS-0003zj-4k
 for qemu-arm@nongnu.org; Tue, 19 Dec 2023 16:33:31 -0500
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-5e7ac088580so17891107b3.1
 for <qemu-arm@nongnu.org>; Tue, 19 Dec 2023 13:33:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1703021606; x=1703626406; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=EkaHwstt77H2oSvEnUV7KAJpD3VvTNcdl9x1HxBU+T8=;
 b=tzxJPK2diSCEYHJWEY82Ke/Wum0hADRb/DdantksL/QycXIUE8TYmK56fe0U0cqUlX
 O8/z8OKKN5kD/MhPHehvrfiUX0ZOLSeyUhmwL84m3ebz/x/DaDZvSY3XQ3O4cK5YxSNy
 B6jpZ22HGAPGnb9bde7ilLuFyjTV5LD1DKYIQJUvwLb2d6mvzY2RSMOQBLrvTbZvWwq2
 dHmuz1PUKZ+U2v/ZA3OEG7EgTWNWaOIoj+L9pNimnx3uxZ7sWOrFzvJpor08u1MVRjv4
 33Ke1Iy06u+u7hqCfg2a9w6TwkgCDfGlL8tY/YKf+BoW8IPy2dQWVidb8pmmTkiUN+SP
 sjkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703021606; x=1703626406;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EkaHwstt77H2oSvEnUV7KAJpD3VvTNcdl9x1HxBU+T8=;
 b=GlbSnVlm5BReCzaP40JIue5hZhhnx1UxRQWMK4ckbyZD58mCKtJVXUY1UpVZEkmL2Y
 nbINhd0rkqSQ9dSHsrT84mnilqxJK7pXRZgGPi2l9LS9ZI4s5kq9wl18WG6awBtAtmJG
 BhFweRhRpokl9X5higvhMbcwQzEdWsjj39fuDQ9EqPDRljQ4tLqleo1OdvyZJg+r/5Ck
 X5pduDWDXxvRHlWKD0rs0veeV++3qYNqHf8Yk8hf8HV5cJ+nz13dDnweifaXiPPHISUs
 EE60zlDuZuP03vvxZ7Ig1eSYBfsQEi/K+jhhAg25oayayMCqOuAAP78yYHOFuNdHTRiC
 SkkQ==
X-Gm-Message-State: AOJu0YyZ9bOpDAomwIFi9UE0i/ZkDBGV94EadbSiAyWbYCBWnCuL4ryv
 rXI7VPyae77dklEpZAsliA5Trh7u7uLwTQF28wk=
X-Received: from nabihestefan.c.googlers.com
 ([fda3:e722:ac3:cc00:20:ed76:c0a8:2737])
 (user=nabihestefan job=sendgmr) by 2002:a5b:783:0:b0:da3:b4ef:29fe with SMTP
 id b3-20020a5b0783000000b00da3b4ef29femr2476736ybq.13.1703021606166; Tue, 19
 Dec 2023 13:33:26 -0800 (PST)
Date: Tue, 19 Dec 2023 21:32:54 +0000
In-Reply-To: <20231219213255.604535-1-nabihestefan@google.com>
Mime-Version: 1.0
References: <20231219213255.604535-1-nabihestefan@google.com>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
Message-ID: <20231219213255.604535-10-nabihestefan@google.com>
Subject: [PATCH v9 09/10] hw/net: GMAC Tx Implementation
From: Nabih Estefan <nabihestefan@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 wuhaotsh@google.com, jasowang@redhat.com, avi.fishman@nuvoton.com, 
 nabihestefan@google.com, kwliu@nuvoton.com, tomer.maimon@nuvoton.com, 
 Hila.Miranda-Kuzi@nuvoton.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::114a;
 envelope-from=3JgyCZQwKCHkkXYfebpqbcXkdlldib.Zljnbjr-Xojklkdkr.lod@flex--nabihestefan.bounces.google.com;
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
X-TUID: k4WfW+6uJQjw

From: Nabih Estefan Diaz <nabihestefan@google.com>

- Implementation of Transmit function for packets
- Implementation for reading and writing from and to descriptors in
  memory for Tx

NOTE: This function implements the steps detailed in the datasheet for
transmitting messages from the GMAC.

Signed-off-by: Nabih Estefan <nabihestefan@google.com>
Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
---
 hw/net/npcm_gmac.c | 153 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 153 insertions(+)

diff --git a/hw/net/npcm_gmac.c b/hw/net/npcm_gmac.c
index fe7b0421ef..69e61b2b67 100644
--- a/hw/net/npcm_gmac.c
+++ b/hw/net/npcm_gmac.c
@@ -265,6 +265,7 @@ static int gmac_write_tx_desc(dma_addr_t addr, struct NPCMGMACTxDesc *desc)
     }
     return 0;
 }
+
 static int gmac_rx_transfer_frame_to_buffer(uint32_t rx_buf_len,
                                             uint32_t *left_frame,
                                             uint32_t rx_buf_addr,
@@ -487,6 +488,158 @@ static ssize_t gmac_receive(NetClientState *nc, const uint8_t *buf, size_t len)
     return len;
 }
 
+<<<<<<< HEAD
+=======
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
+>>>>>>> 107e0d0181 (hw/net: GMAC Tx Implementation)
 static void gmac_cleanup(NetClientState *nc)
 {
     /* Nothing to do yet. */
-- 
2.43.0.472.g3155946c3a-goog

