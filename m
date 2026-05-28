Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C35ACD6E49
	for <qemu-arm@archiver.kernel.org>; Thu, 28 May 2026 15:29:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wScfO-0006u6-D2; Thu, 28 May 2026 11:29:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wScfM-0006sW-Lv
 for qemu-arm@nongnu.org; Thu, 28 May 2026 11:29:00 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wScfK-0004T5-VR
 for qemu-arm@nongnu.org; Thu, 28 May 2026 11:29:00 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4904c1ce4c1so68289775e9.3
 for <qemu-arm@nongnu.org>; Thu, 28 May 2026 08:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779982137; x=1780586937; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Ni1ZZ38evYDjUc2aiSCs5aWGdwGPh/14vFb7jqtkHNo=;
 b=AnDLCzBQDWGcnV/0UUTEQppl19bsjhvE4bla9bhLbYFSJwVOp3K/v6gblAmmz1cmHh
 /6TE+3sLSN7UtmjEsXEmSYpFAVY0osEBxtFqtXHruVDqtMQfTJkLk5XdE3a6YZ4Ec7Hx
 RnsSfh/4aaQ2DeplWl2jRnGCblLxg0s0JqvPqkVMVV8g+InGYOo9feWiUvLMztFjFAn/
 D7XlsyuJS0R3pzKaau/iM9gt3uGN+Dh6Y6/cm6IxoJI3g+RX6q34Gg3YoF2XeEMoQ5dN
 zEcOk6cO7HrKaBPx3k71bRq31Bjei64j5Y1ZQ68C8XbtnzW+ZEXuQ7GXhb+HrZ0b9VCW
 GQzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779982137; x=1780586937;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Ni1ZZ38evYDjUc2aiSCs5aWGdwGPh/14vFb7jqtkHNo=;
 b=bGKZ7h0M6MQELq4D34V0OZZM4ztlx2cMJF90PiMv9iZQtJ5QjXewihR5onXto7ndGi
 Y0GDMwpLmowlLUJ/bd+5WNAjM2YCDjiiT9BuzxYv8Oii53oFd+1bqocGknKaYZ0JOKIA
 J0KHGM4qDVuvmzq7Dfd/4PRnrnT4QGspMzS/WCKh3/Q4lfHCig5eihFTZvWxDwu88GN9
 bHETj/yI36/pbm/DXR2iyk3nL4rFuDYgIr3QI6EI2V5KZtBMtxmnmbNqS9W7Qj0C3A3m
 LOiXfPpMETJ9m9+lehRwLckvQgN3wsbhoCOJFg+kOeNIqxRrlBiAuSYjvxWJ3mQzLYLu
 Awfg==
X-Gm-Message-State: AOJu0Yw1dSxRpAfjv0NzHQMMXcvFTxqJBmuaNMz/yt0mzlleDI1D2Ktc
 XByPjNJU/QAuqOGlaEfMGeSUBC+iRX7KswHckjLYpD8PRN40j+qHvs15Gy0pQELZK9KvmXbgXit
 8QI3Z
X-Gm-Gg: Acq92OEySBWv+P1DhI/5+1sHUu7nRe4D6CQB86TNpPY9iERt+zgfqua7Q1jmlkz/zA5
 9MTB79LQdqvYtrwr86sj2zUpaHv/m2r4eyAlsbm8hePB6J0nrqdEreyRt/8f8ff/BGRaHqTitCv
 00qwBE9WEr4bkEaCNZrsLBuJPAZ3Zk+Xj64E6AGc9xIwyG1uYeRp30JQSSteDmTLNtbeo8NEOwx
 IhwfJORn6FI9+i/c4jJylAltAgMfyJ1RAaspt9JmSzVawjBpEEHXTUW3OeUBcE4bKZSf74mpWgR
 YRbyXf44wj7VLaObboD0b6nJF6AYwgYwJL7XWySFyVPid/Aw1snw8Bl+LZ2JF7/cGTAWoSizy3E
 RKSdJmcgaMuR/zrPJ7+C0rRXd99HKSon55bp3Ii2CQBUtwbo8DuzEptCQLh5178lG87PXtScsPF
 LhWOoe2a/uIVysKUX+EpixUPG627F2eRWfv2pGXR8o5wEWwOwJaRiX0XNbd/8BV1qFiighmrCWs
 xGsoIB2NHs5zMFJo1DHrBK5Ng6AnDaUAtSh64L18g==
X-Received: by 2002:a05:600c:8210:b0:490:4663:691b with SMTP id
 5b1f17b1804b1-490466369f4mr452921045e9.7.1779982137526; 
 Thu, 28 May 2026 08:28:57 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4908b7a70b9sm19116605e9.12.2026.05.28.08.28.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2026 08:28:56 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 2/3] hw/dma/omap_dma: Fix coding style in
 omap_dma_transfer_setup()
Date: Thu, 28 May 2026 16:28:51 +0100
Message-ID: <20260528152852.3349928-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260528152852.3349928-1-peter.maydell@linaro.org>
References: <20260528152852.3349928-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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

We're about to fix indent in a section of the
omap_dma_transfer_setup() function, which will make checkpatch
complain.  Since we're touching the code anyway, fix the uses of if()
with no braces and wrongly formatted multiline comments.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/dma/omap_dma.c | 51 ++++++++++++++++++++++++++++++-----------------
 1 file changed, 33 insertions(+), 18 deletions(-)

diff --git a/hw/dma/omap_dma.c b/hw/dma/omap_dma.c
index a93d9ad196..b8bbb707c4 100644
--- a/hw/dma/omap_dma.c
+++ b/hw/dma/omap_dma.c
@@ -471,49 +471,59 @@ static void omap_dma_transfer_setup(struct soc_dma_ch_s *dma)
 
 
         /* If the channel is element synchronized, deactivate it */
-        if (min_elems == elements[omap_dma_intr_element_sync])
+        if (min_elems == elements[omap_dma_intr_element_sync]) {
             omap_dma_deactivate_channel(s, ch);
+        }
 
         /* If it is the last frame, set the LAST_FRAME interrupt */
-        if (min_elems == elements[omap_dma_intr_last_frame])
+        if (min_elems == elements[omap_dma_intr_last_frame]) {
             ch->status |= LAST_FRAME_INTR;
+        }
 
-        /* If exactly half of the frame was reached, set the HALF_FRAME
-           interrupt */
-        if (min_elems == elements[omap_dma_intr_half_frame])
+        /*
+         * If exactly half of the frame was reached, set the HALF_FRAME
+         * interrupt
+         */
+        if (min_elems == elements[omap_dma_intr_half_frame]) {
             ch->status |= HALF_FRAME_INTR;
+        }
 
         /* If a full packet has been transferred, set the END_PKT interrupt */
-        if (min_elems == elements[omap_dma_intr_packet])
+        if (min_elems == elements[omap_dma_intr_packet]) {
             ch->status |= END_PKT_INTR;
+        }
 
         /* If the channel is packet-synchronized, deactivate it */
-        if (min_elems == elements[omap_dma_intr_packet_sync])
+        if (min_elems == elements[omap_dma_intr_packet_sync]) {
             omap_dma_deactivate_channel(s, ch);
+        }
 
         /* If the channel is frame synchronized, deactivate it */
-        if (min_elems == elements[omap_dma_intr_frame_sync])
+        if (min_elems == elements[omap_dma_intr_frame_sync]) {
             omap_dma_deactivate_channel(s, ch);
+        }
 
         /* Set the END_FRAME interrupt */
-        if (min_elems == elements[omap_dma_intr_frame])
+        if (min_elems == elements[omap_dma_intr_frame]) {
             ch->status |= END_FRAME_INTR;
+        }
 
         if (min_elems == elements[omap_dma_intr_block]) {
             /* End of Block */
             /* Disable the channel */
 
-            if (!ch->auto_init)
+            if (!ch->auto_init) {
                 omap_dma_disable_channel(s, ch);
-            else if (ch->repeat || ch->end_prog)
+            } else if (ch->repeat || ch->end_prog) {
                 omap_dma_channel_load(ch);
-            else {
+            } else {
                 ch->waiting_end_prog = 1;
                 omap_dma_deactivate_channel(s, ch);
             }
 
-            if (ch->interrupts & END_BLOCK_INTR)
+            if (ch->interrupts & END_BLOCK_INTR) {
                 ch->status |= END_BLOCK_INTR;
+            }
         }
 
         /* Update packet number */
@@ -522,8 +532,10 @@ static void omap_dma_transfer_setup(struct soc_dma_ch_s *dma)
             a->pck_element %= a->pck_elements;
         }
 
-        /* TODO: check if we really need to update anything here or perhaps we
-         * can skip part of this.  */
+        /*
+         * TODO: check if we really need to update anything here or perhaps we
+         * can skip part of this.
+         */
         if (dma->update) {
             a->element += min_elems;
 
@@ -534,11 +546,14 @@ static void omap_dma_transfer_setup(struct soc_dma_ch_s *dma)
             a->dest += min_elems * a->elem_delta[1] + frames * a->frame_delta[1];
 
             /* If the channel is async, update cpc */
-            if (!ch->sync && frames)
+            if (!ch->sync && frames) {
                 ch->cpc = a->dest & 0xffff;
+            }
 
-            /* TODO: if the destination port is IMIF or EMIFF, set the dirty
-             * bits on it.  */
+            /*
+             * TODO: if the destination port is IMIF or EMIFF, set the dirty
+             * bits on it.
+             */
         }
 
     omap_dma_interrupts_update(s);
-- 
2.43.0


