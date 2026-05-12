Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A67DCD4F21
	for <qemu-arm@archiver.kernel.org>; Tue, 12 May 2026 20:36:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wMtoT-0002Vc-N7; Tue, 12 May 2026 16:34:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wMtoL-0002Qu-SL
 for qemu-arm@nongnu.org; Tue, 12 May 2026 16:34:40 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wMtoD-0002SA-Nt
 for qemu-arm@nongnu.org; Tue, 12 May 2026 16:34:33 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4891c00e7aeso51388305e9.2
 for <qemu-arm@nongnu.org>; Tue, 12 May 2026 13:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778618067; x=1779222867; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=1sSnHmTB/SBKMBx15QRwcaRSswHRaGmj+ZZKSu0bfJ0=;
 b=to39EsIV33kPlxM7Z4jtLk1uAtoAzhf7LIZJBf7eFCBKjQglITCg2qc2M5zKjhU5L4
 9Ja5Dfk9XOfJr3uPYZj2Y5R6l19WDeZkCHspMVHtv7MxTESsP9zyfT3FWFu9sj94cEjt
 T3+YXG0Ic9fSvTdTGD8bgqqkpSiJcMKjcM0mxW8478I+uSRn4A07aacAls/8kjyKrpZm
 Aagw8tMotCTMVJqphHr4c/3roOlJ8nwJfOBdtUs4qAyQ4nA4Y6H2ZHebOw8XKxZKK4xv
 8qiTy4TvFcahX4UvisuaXsql2XX/GYkWO1J0JUnCw35184d1avA7GK5yqGf6kwYB0tJg
 snPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778618067; x=1779222867;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=1sSnHmTB/SBKMBx15QRwcaRSswHRaGmj+ZZKSu0bfJ0=;
 b=sMea/wiUtMrGadmE3mLv0JRCyt+i+/wjeNZe1gkXwIIVa+TYdchswjN1bt0+TgnYEX
 kz7NGvraqF0DPNL+niQEf+DJTTUzOX29DPiPEovFLrZ7AG5P5Csk2ftWb7n8CJ3Sil6M
 FjoHuGQZiRElrmNyUXnf1qK9UDNNCXaxZixxroL+7z9G42cW2plUiv1BDnr5dtkANeZw
 Gp6KlL8BBPTJsFDKb2m/xQcx6n45vXx6wZdSYucGEjnJCa5rithNmhM96U/sa+Lh9l4v
 KZLA5wx0WigH9HaqmAN/bCaGiwhT6wOwlN9K29ZwThccq8sJkNzp3y9v8ykGn+3YNjNG
 7gvw==
X-Gm-Message-State: AOJu0Yx2W9GkhqGjm4XPBNyJz2ppo2/NLH5ewZTw5YG2d53YupzNK0/P
 7O+0jl8TLJy5WAbmFZNCd6ED1SIi3ENTL25dUIMiwO1IylX6gJaHmbW2jYCQ9kF9eBlkvO738Gf
 PmmrD
X-Gm-Gg: Acq92OHh8Ev7DggUAZeqwAW8koLzvNBdzfTOAst93YR+ksPqOGZTPk8/AQSXMPoCyNL
 7l9WTWpgS6JfuRmO6O8T/1WoHNSfexJDrGMED76Mjbyka2xwdcbEVpCC3FxldXFDGmr6eeFCfT1
 FvbF0S1vgyqFPWKdw/AP3rhxo7gSIsRgpWiBaa/nYwGga2UkLC3srMHLRazePNj+P7SxVZ8NFZf
 C8qwO5INB2ax1ONZxg3lva43o2/dfbTyE27hKZtzegoN3DPqw/klvMqVELwwkkLcq+rJ5AfZHNV
 gr++uVQOfGnrYGw7gS2gNtYJW+tJApHZ6ES4FnAO+E4syFAOwgIVP4DiPE0hKF6Z6kDFLrhCuxP
 9flm/AXf+vDuim7F03PtUtvpGn73p/dajaPqx578YDRsC5l1lI5p6PZPsAnKZkecOiZ5LwhxyeH
 CFbpjl/mrJ5P93AnoiIvSu4suz0Nj7S/HUIlPk1xJj/ua5TihD0jWqBRNqzJnBjczO+8CP01LAM
 YK0c/NHNNFICNDoX/XQRQvtw8oWSJk=
X-Received: by 2002:a05:600c:828d:b0:489:201c:dc46 with SMTP id
 5b1f17b1804b1-48fc9a0eda5mr5580965e9.12.1778618067024; 
 Tue, 12 May 2026 13:34:27 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fc8d69d0bsm16350635e9.13.2026.05.12.13.34.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2026 13:34:26 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 09/12] hw/dma/omap_dma: Remove omap_3_1_compatible_disable flag
Date: Tue, 12 May 2026 21:34:11 +0100
Message-ID: <20260512203414.3633237-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260512203414.3633237-1-peter.maydell@linaro.org>
References: <20260512203414.3633237-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

The OMAP DMA device has an omap_3_1_compatible_disable flag in its
channel struct, which the 3.2 version of the DMA block used to tell
whether it should behave compatibly with 3.1 or not.  Now we have no
3.2 support, the omap_3_1_compatible_disable flag is set to false and
can't be changed, so we can remove it, folding out all the conditions
where we were testing it as always-false.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/dma/omap_dma.c | 59 +++++++++++++++--------------------------------
 1 file changed, 19 insertions(+), 40 deletions(-)

diff --git a/hw/dma/omap_dma.c b/hw/dma/omap_dma.c
index 49348f40c5..fe43fec58d 100644
--- a/hw/dma/omap_dma.c
+++ b/hw/dma/omap_dma.c
@@ -73,9 +73,6 @@ struct omap_dma_channel_s {
     int fs;
     int bs;
 
-    /* compatibility */
-    int omap_3_1_compatible_disable;
-
     qemu_irq irq;
     struct omap_dma_channel_s *sibling;
 
@@ -144,7 +141,6 @@ static void omap_dma_channel_load(struct omap_dma_channel_s *ch)
 {
     struct omap_dma_reg_set_s *a = &ch->active_set;
     int i, normal;
-    int omap_3_1 = !ch->omap_3_1_compatible_disable;
 
     /*
      * TODO: verify address ranges and alignment
@@ -177,14 +173,14 @@ static void omap_dma_channel_load(struct omap_dma_channel_s *ch)
             break;
         case single_index:
             a->elem_delta[i] = ch->data_type +
-                    ch->element_index[omap_3_1 ? 0 : i] - 1;
+                    ch->element_index[0] - 1;
             a->frame_delta[i] = 0;
             break;
         case double_index:
             a->elem_delta[i] = ch->data_type +
-                    ch->element_index[omap_3_1 ? 0 : i] - 1;
-            a->frame_delta[i] = ch->frame_index[omap_3_1 ? 0 : i] -
-                    ch->element_index[omap_3_1 ? 0 : i];
+                    ch->element_index[0] - 1;
+            a->frame_delta[i] = ch->frame_index[0] -
+                    ch->element_index[0];
             break;
         default:
             break;
@@ -442,20 +438,13 @@ static void omap_dma_transfer_generic(struct soc_dma_ch_s *dma)
                 /* End of Block */
                 /* Disable the channel */
 
-                if (ch->omap_3_1_compatible_disable) {
+                if (!ch->auto_init)
                     omap_dma_disable_channel(s, ch);
-                    if (ch->link_enabled)
-                        omap_dma_enable_channel(s,
-                                        &s->ch[ch->link_next_ch]);
-                } else {
-                    if (!ch->auto_init)
-                        omap_dma_disable_channel(s, ch);
-                    else if (ch->repeat || ch->end_prog)
-                        omap_dma_channel_load(ch);
-                    else {
-                        ch->waiting_end_prog = 1;
-                        omap_dma_deactivate_channel(s, ch);
-                    }
+                else if (ch->repeat || ch->end_prog)
+                    omap_dma_channel_load(ch);
+                else {
+                    ch->waiting_end_prog = 1;
+                    omap_dma_deactivate_channel(s, ch);
                 }
 
                 if (ch->interrupts & END_BLOCK_INTR)
@@ -610,19 +599,13 @@ static void omap_dma_transfer_setup(struct soc_dma_ch_s *dma)
             /* End of Block */
             /* Disable the channel */
 
-            if (ch->omap_3_1_compatible_disable) {
+            if (!ch->auto_init)
                 omap_dma_disable_channel(s, ch);
-                if (ch->link_enabled)
-                    omap_dma_enable_channel(s, &s->ch[ch->link_next_ch]);
-            } else {
-                if (!ch->auto_init)
-                    omap_dma_disable_channel(s, ch);
-                else if (ch->repeat || ch->end_prog)
-                    omap_dma_channel_load(ch);
-                else {
-                    ch->waiting_end_prog = 1;
-                    omap_dma_deactivate_channel(s, ch);
-                }
+            else if (ch->repeat || ch->end_prog)
+                omap_dma_channel_load(ch);
+            else {
+                ch->waiting_end_prog = 1;
+                omap_dma_deactivate_channel(s, ch);
             }
 
             if (ch->interrupts & END_BLOCK_INTR)
@@ -711,7 +694,6 @@ void omap_dma_reset(struct soc_dma_s *dma)
         s->ch[i].cpc = 0x0000;
         s->ch[i].fs = 0;
         s->ch[i].bs = 0;
-        s->ch[i].omap_3_1_compatible_disable = 0;
         memset(&s->ch[i].active_set, 0, sizeof(s->ch[i].active_set));
         s->ch[i].priority = 0;
         s->ch[i].interleave_disabled = 0;
@@ -752,7 +734,7 @@ static int omap_dma_ch_reg_read(struct omap_dma_s *s,
     case 0x06:  /* SYS_DMA_CSR_CH0 */
         *value = ch->status;
         ch->status &= SYNC;
-        if (!ch->omap_3_1_compatible_disable && ch->sibling) {
+        if (ch->sibling) {
             *value |= (ch->sibling->status & 0x3f) << 6;
             ch->sibling->status &= SYNC;
         }
@@ -791,11 +773,8 @@ static int omap_dma_ch_reg_read(struct omap_dma_s *s,
         *value = ch->element_index[0];
         break;
 
-    case 0x18:  /* SYS_DMA_CPC_CH0 or DMA_CSAC */
-        if (ch->omap_3_1_compatible_disable)
-            *value = ch->active_set.src & 0xffff;   /* CSAC */
-        else
-            *value = ch->cpc;
+    case 0x18:  /* SYS_DMA_CPC_CH0 */
+        *value = ch->cpc;
         break;
 
     case 0x1a:  /* DMA_CDAC */
-- 
2.43.0


