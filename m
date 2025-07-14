Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DFD6C83F17
	for <qemu-arm@archiver.kernel.org>; Mon, 14 Jul 2025 17:59:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ubNSO-0002EJ-CQ; Mon, 14 Jul 2025 13:59:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ubMSk-0004a1-80
 for qemu-arm@nongnu.org; Mon, 14 Jul 2025 12:55:34 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ubMSi-0001JQ-6d
 for qemu-arm@nongnu.org; Mon, 14 Jul 2025 12:55:33 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4561a4a8bf2so12901495e9.1
 for <qemu-arm@nongnu.org>; Mon, 14 Jul 2025 09:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752512130; x=1753116930; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XB8LV3wRsOBPp4JPpXFjqFOjZLlAFG+bPFbYCEIwFxs=;
 b=Owg0guTatUlOe0bdf2ohgOheEFnIRITumbe3LrFvhDV3I+J/osTnc7UPuM+d0LygaA
 +w0UtvQEcBHLKytPT6jBOaLTMWnNFvF5CrvSK3GBDvBMTDJr4ACRfnDDbbAg/D5XyUcd
 G6B6k6IuWTho7S/lQO38gill8lNxmIT/W1rLe6rmMqRiBwPYFxo//FtPMSm0xFZkl2T3
 Ajm9xIjXDqNsq6IdYHhK/UQsIOhthKBs2I5H12P+FWDxMaGbI0Tzr9a0Z5FacKDxM6QG
 BSrv7MQf3m+1V0tDVXvlp5QsgKiYI/58Sl5d6xQSiav/XYmc1pbGYoQvEgND5A2AG0Gn
 T3tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752512130; x=1753116930;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XB8LV3wRsOBPp4JPpXFjqFOjZLlAFG+bPFbYCEIwFxs=;
 b=rXvV+M86Mhf4vY8N0HqslSffhsGzeASAlTRrCH99Yfas5v0tFy43CKC0yXPB3UohHk
 eVJQbBkYPVl0OfpIbsCDqnTLSsrn7dF9C9B4XIrjdvGJY3Ma4S4HaShb5ShoYv88YXn4
 RaLXte9VSe9AJHz5xPHzBCzlY992uYRuacj1I0EXp1NMQ5KM7neX3AIXoGnUyvBEGBs9
 J70q2DOIIEMB+cO8XOsf4/JF2kpKlkHoFRikHd+ZS5u8iDcV8MYavgFPdoRLS2lHOvmB
 zUbGMFJw19l0H8JgqPZZqZg49szXZx2QNGLyV+ShE2e6SGym9r81FDpmdbRMBVCJLC10
 igCQ==
X-Gm-Message-State: AOJu0YzBMGaH7hozB2Cr020uMOf8DK4e5Thy+GTVodr6A81BcAbiXL03
 gqVhNy6viblMF3KJFmcm/920UtK9tVITaJzDdKapwLKh6fMM1n7TY6FdKTuLDmheV4LP9ThD1db
 cvQIq
X-Gm-Gg: ASbGncueNWBs1IB7LsrVTs+OYdi7CW0sb0XOV+56Fwwk863oMyTwFCc/aCeF+kZ/YqW
 YDE0uQjXjcXcdWqSxsnJZ113lDehUGDu/V2LaI32dxsL1KOAa1GxRNtUUGfr+3pEV14NikXH349
 Y8CfKsuVmQNjsyZ4yg4YAm32XyEWQMxwH06eg3Q+jpMK96e+TpqxKuRARvlsrChOpMZ+8MnsIrV
 A5P2guhsnqMbFkIt3XA+tyJSCdz+6NXhuSGj2aPmsycUApvpm2xpeYK0zTkNNUExDhpIz94IMGB
 BQKx3+dIEpGhX9zHHoqP6+uVZrPmVDQ4RZalk5eTHFQNY6tprALcCWCRNGEMqUKuyj4IMDbyHn5
 O6wq0yqbPe/c0L/Zf2t2TskOGBxU5
X-Google-Smtp-Source: AGHT+IH+/REJ7B+DItU8aASH5jnaoFcfOBxm3LgKHunU9aheiEThUjx2kOxgBM45dgVhV+9NQZKjCg==
X-Received: by 2002:a05:6000:1882:b0:3a3:6595:9209 with SMTP id
 ffacd0b85a97d-3b5f2dfdfdfmr11245919f8f.36.1752512130542; 
 Mon, 14 Jul 2025 09:55:30 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8bd15bfsm13164665f8f.19.2025.07.14.09.55.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 09:55:29 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>,
 Jason Wang <jasowang@redhat.com>
Subject: [PATCH 4/4] hw/net/npcm_gmac.c: Drop 'buf' local variable
Date: Mon, 14 Jul 2025 17:55:23 +0100
Message-ID: <20250714165523.1956235-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250714165523.1956235-1-peter.maydell@linaro.org>
References: <20250714165523.1956235-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

We use the local variable 'buf' only when we call dma_memory_read(),
and it is always set to &tx_send_buffer[prev_buf_size] immediately
before both of those calls.  So remove the variable and pass
tx_send_buffer + prev_buf_size to dma_memory_read().

This fixes in passing a place where we set buf = tx_send_buffer
but never used that value because we always updated buf to
something else later before using it.

Coverity: CID 1534027
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/net/npcm_gmac.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/hw/net/npcm_gmac.c b/hw/net/npcm_gmac.c
index 0c17ae9b2a9..5e32cd3edf3 100644
--- a/hw/net/npcm_gmac.c
+++ b/hw/net/npcm_gmac.c
@@ -516,7 +516,6 @@ static void gmac_try_send_next_packet(NPCMGMACState *gmac)
     uint32_t desc_addr;
     struct NPCMGMACTxDesc tx_desc;
     uint32_t tx_buf_addr, tx_buf_len;
-    uint8_t *buf = tx_send_buffer;
     uint32_t prev_buf_size = 0;
     int csum = 0;
 
@@ -567,16 +566,15 @@ static void gmac_try_send_next_packet(NPCMGMACState *gmac)
         tx_buf_addr = tx_desc.tdes2;
         gmac->regs[R_NPCM_DMA_CUR_TX_BUF_ADDR] = tx_buf_addr;
         tx_buf_len = TX_DESC_TDES1_BFFR1_SZ_MASK(tx_desc.tdes1);
-        buf = &tx_send_buffer[prev_buf_size];
 
         if ((prev_buf_size + tx_buf_len) > tx_buffer_size) {
             tx_buffer_size = prev_buf_size + tx_buf_len;
             tx_send_buffer = g_realloc(tx_send_buffer, tx_buffer_size);
-            buf = &tx_send_buffer[prev_buf_size];
         }
 
         /* step 5 */
-        if (dma_memory_read(&address_space_memory, tx_buf_addr, buf,
+        if (dma_memory_read(&address_space_memory, tx_buf_addr,
+                            tx_send_buffer + prev_buf_size,
                             tx_buf_len, MEMTXATTRS_UNSPECIFIED)) {
             qemu_log_mask(LOG_GUEST_ERROR, "%s: Failed to read packet @ 0x%x\n",
                         __func__, tx_buf_addr);
@@ -589,15 +587,14 @@ static void gmac_try_send_next_packet(NPCMGMACState *gmac)
             tx_buf_addr = tx_desc.tdes3;
             gmac->regs[R_NPCM_DMA_CUR_TX_BUF_ADDR] = tx_buf_addr;
             tx_buf_len = TX_DESC_TDES1_BFFR2_SZ_MASK(tx_desc.tdes1);
-            buf = &tx_send_buffer[prev_buf_size];
 
             if ((prev_buf_size + tx_buf_len) > tx_buffer_size) {
                 tx_buffer_size = prev_buf_size + tx_buf_len;
                 tx_send_buffer = g_realloc(tx_send_buffer, tx_buffer_size);
-                buf = &tx_send_buffer[prev_buf_size];
             }
 
-            if (dma_memory_read(&address_space_memory, tx_buf_addr, buf,
+            if (dma_memory_read(&address_space_memory, tx_buf_addr,
+                                tx_send_buffer + prev_buf_size,
                                 tx_buf_len, MEMTXATTRS_UNSPECIFIED)) {
                 qemu_log_mask(LOG_GUEST_ERROR,
                               "%s: Failed to read packet @ 0x%x\n",
@@ -615,7 +612,6 @@ static void gmac_try_send_next_packet(NPCMGMACState *gmac)
             net_checksum_calculate(tx_send_buffer, length, csum);
             qemu_send_packet(qemu_get_queue(gmac->nic), tx_send_buffer, length);
             trace_npcm_gmac_packet_sent(DEVICE(gmac)->canonical_path, length);
-            buf = tx_send_buffer;
             prev_buf_size = 0;
         }
 
-- 
2.43.0


