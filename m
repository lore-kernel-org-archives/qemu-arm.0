Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6D60CD4F54
	for <qemu-arm@archiver.kernel.org>; Thu, 28 May 2026 15:29:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wScfN-0006tE-6H; Thu, 28 May 2026 11:29:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wScfM-0006sD-BI
 for qemu-arm@nongnu.org; Thu, 28 May 2026 11:29:00 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wScfJ-0004SX-Ic
 for qemu-arm@nongnu.org; Thu, 28 May 2026 11:29:00 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-48fde648a71so86089915e9.0
 for <qemu-arm@nongnu.org>; Thu, 28 May 2026 08:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779982136; x=1780586936; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=NIroeYUMzLe0BDNnaD3zQSeKlegN8RDvvosqpf7rBeg=;
 b=XWJLyYWMWWN0HsG9e9QMM8JBTmKoyaGixvbZ9lm4Wl02a/TKSUDm+XYsRjaoGLOzuI
 nJ9/aVGGG/JL/VsQOlEW/jw+EeCXEGIRrBi4UelKFIbPVdOaYgZxPMBkIfTrKI5rsvtI
 wjI6OiQNwt1HHiFqRt2r649wlYRDg4XvpkQmzQGKejEtDL5WKWG4slQ1thbMjiFLhI1t
 dLZemMCYtjR39ahtlB8UtHDJYhKj3+fiYOTUEpQgNRg7aMDInKDvwyxCNJdLWFOZ14ZL
 UF9arTIR4OHtrQHAIitgeOSB4rDr4ys+3RGuFD8fcdmeIRg7gxwSI9Hg9JeMwTbdpRHf
 /j4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779982136; x=1780586936;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=NIroeYUMzLe0BDNnaD3zQSeKlegN8RDvvosqpf7rBeg=;
 b=nJgNBe5HVfDAaw3zja0iRw/WeIHB1X9RZo8swprAAUZqi/u7KsSTqqObe1czBeSihs
 JzqUvcUcKCJa9jdToWe+D0IYVol2Sznwzd8AXkew6tyUHCs3BahJFbTVRX76sN/pz3Ms
 9GOEFYb29bq1Sp/T63/j0S7g3Q8PGL7+K7kiMAh3ess5yVDKBpYlWupWilNKpG0+tDbc
 GeGYDQMUuZDmc6BKPg3WJwXJCZ6vvT4RdFXlunmieBESdjWULAUs3YWZsc6VzIpbmvJf
 QjhNt3PXuvsbuWfiMTiwSUtDuzKJhGeN6IbI2ukVJkGulOJ7Dtj1sT8GMXu+W+TZzGwi
 afsg==
X-Gm-Message-State: AOJu0YxUqSIjhpJ4zR/AoVLbgrpGsVD/50/f5uTDngcuh3qgNLMWzHKS
 IusrOdBdzQ1TXrf0/Si8UnJGM3gh9eyBS1DpuC+5aik0E0GRIK1Qy16mkbfx6aCRKXHlXVfT4xl
 xc5bW
X-Gm-Gg: Acq92OHY5amMndXPuB7IxnX9rjmZXv/ptjGC7ii0wuSjasklVaqDh4Kp0DWJmcVDG8X
 YvFm9PqW9k41DzDiZQDSjQVF84EnSVSe3au1cf3r9EY7t9KN6FGhPORlIWRzR16fAZiEZWidkc8
 S4aXsGe2bhdJBqfq80NKP6f3mps0EpJSxMHwNdC5yyRlYalWxTrJcnPXrbf4oarq/WUovXwxusA
 m66sYC9xxLZ9BOUKmmPiA/+VyUC1o0pJwZ1KZEG6015YLeqPSf+wQ7m2L4l/t7P/wVJpK2tl/Yv
 MwqQyhNxZfMiyTHWYEwic8jcIZ6KdWITf26W69eIYLIe2BSgFQDvxaiEGUIk/2IbwjsbJ+Zm+g3
 zaFx2SiIikEhwdESIRP3dD4WEeAe5+XqmS0ks4MPOgAJIT0pcO98xbWrBcXrslJCMcgaKC1mkfO
 AlEAQ5VXa1ig2WV5bWzMTDpQZmu+c7UeDSfWZPqvi6s6NKWtQVbnxt93AUqUFTeEhPwzzyrVB/t
 pHo67PuGHY2AdXn16rSXeGqk00dfCeLXviu50R8KA==
X-Received: by 2002:a05:600c:3484:b0:490:3d48:6cb9 with SMTP id
 5b1f17b1804b1-49094785aeamr33089335e9.3.1779982135732; 
 Thu, 28 May 2026 08:28:55 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4908b7a70b9sm19116605e9.12.2026.05.28.08.28.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2026 08:28:54 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 1/3] hw/dma/omap_dma: Remove unused ifdeffed out code
Date: Thu, 28 May 2026 16:28:50 +0100
Message-ID: <20260528152852.3349928-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260528152852.3349928-1-peter.maydell@linaro.org>
References: <20260528152852.3349928-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The OMAP DMA device includes a lot of code which has been disabled
via ifdefs for over a decade. Whatever this unfinished development
work was, all knowledge of it is long gone, and we're unlikely to
be doing any serious work on this device model in future. If we
did, we'd likely have to start from scratch.

Remove all the ifdeffed out code. We will fix up the indentation
in a followup commit that has only whitespace changes.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/dma/omap_dma.c | 94 -----------------------------------------------
 1 file changed, 94 deletions(-)

diff --git a/hw/dma/omap_dma.c b/hw/dma/omap_dma.c
index b042e7c59c..a93d9ad196 100644
--- a/hw/dma/omap_dma.c
+++ b/hw/dma/omap_dma.c
@@ -343,9 +343,6 @@ static void omap_dma_transfer_generic(struct soc_dma_ch_s *dma)
     struct omap_dma_channel_s *ch = dma->opaque;
     struct omap_dma_reg_set_s *a = &ch->active_set;
     int bytes = dma->bytes;
-#ifdef MULTI_REQ
-    uint16_t status = ch->status;
-#endif
 
     do {
         /* Transfer a single element */
@@ -362,7 +359,6 @@ static void omap_dma_transfer_generic(struct soc_dma_ch_s *dma)
         a->dest += a->elem_delta[1];
         a->element ++;
 
-#ifndef MULTI_REQ
         if (a->element == a->elements) {
             /* End of Frame */
             a->element = 0;
@@ -375,78 +371,6 @@ static void omap_dma_transfer_generic(struct soc_dma_ch_s *dma)
                 ch->cpc = a->dest & 0xffff;
         }
     } while ((bytes -= ch->data_type));
-#else
-        /* If the channel is element synchronized, deactivate it */
-        if (ch->sync && !ch->fs && !ch->bs)
-            omap_dma_deactivate_channel(s, ch);
-
-        /* If it is the last frame, set the LAST_FRAME interrupt */
-        if (a->element == 1 && a->frame == a->frames - 1)
-            if (ch->interrupts & LAST_FRAME_INTR)
-                ch->status |= LAST_FRAME_INTR;
-
-        /* If the half of the frame was reached, set the HALF_FRAME
-           interrupt */
-        if (a->element == (a->elements >> 1))
-            if (ch->interrupts & HALF_FRAME_INTR)
-                ch->status |= HALF_FRAME_INTR;
-
-        if (ch->fs && ch->bs) {
-            a->pck_element ++;
-            /* Check if a full packet has been transferred.  */
-            if (a->pck_element == a->pck_elements) {
-                a->pck_element = 0;
-
-                /* Set the END_PKT interrupt */
-                if ((ch->interrupts & END_PKT_INTR) && !ch->src_sync)
-                    ch->status |= END_PKT_INTR;
-
-                /* If the channel is packet-synchronized, deactivate it */
-                if (ch->sync)
-                    omap_dma_deactivate_channel(s, ch);
-            }
-        }
-
-        if (a->element == a->elements) {
-            /* End of Frame */
-            a->element = 0;
-            a->src += a->frame_delta[0];
-            a->dest += a->frame_delta[1];
-            a->frame ++;
-
-            /* If the channel is frame synchronized, deactivate it */
-            if (ch->sync && ch->fs && !ch->bs)
-                omap_dma_deactivate_channel(s, ch);
-
-            /* If the channel is async, update cpc */
-            if (!ch->sync)
-                ch->cpc = a->dest & 0xffff;
-
-            /* Set the END_FRAME interrupt */
-            if (ch->interrupts & END_FRAME_INTR)
-                ch->status |= END_FRAME_INTR;
-
-            if (a->frame == a->frames) {
-                /* End of Block */
-                /* Disable the channel */
-
-                if (!ch->auto_init)
-                    omap_dma_disable_channel(s, ch);
-                else if (ch->repeat || ch->end_prog)
-                    omap_dma_channel_load(ch);
-                else {
-                    ch->waiting_end_prog = 1;
-                    omap_dma_deactivate_channel(s, ch);
-                }
-
-                if (ch->interrupts & END_BLOCK_INTR)
-                    ch->status |= END_BLOCK_INTR;
-            }
-        }
-    } while (status == ch->status && ch->active);
-
-    omap_dma_interrupts_update(s);
-#endif
 }
 
 enum {
@@ -475,13 +399,6 @@ static void omap_dma_transfer_setup(struct soc_dma_ch_s *dma)
     dest_p = &s->mpu->port[ch->port[1]];
     if ((!ch->constant_fill && !src_p->addr_valid(s->mpu, a->src)) ||
                     (!dest_p->addr_valid(s->mpu, a->dest))) {
-#if 0
-        /* Bus time-out */
-        if (ch->interrupts & TIMEOUT_INTR)
-            ch->status |= TIMEOUT_INTR;
-        omap_dma_deactivate_channel(s, ch);
-        continue;
-#endif
         printf("%s: Bus time-out in DMA%i operation\n",
                         __func__, dma->num);
     }
@@ -552,11 +469,6 @@ static void omap_dma_transfer_setup(struct soc_dma_ch_s *dma)
 
     /* Set appropriate interrupts and/or deactivate channels */
 
-#ifdef MULTI_REQ
-    /* TODO: should all of this only be done if dma->update, and otherwise
-     * inside omap_dma_transfer_generic below - check what's faster.  */
-    if (dma->update) {
-#endif
 
         /* If the channel is element synchronized, deactivate it */
         if (min_elems == elements[omap_dma_intr_element_sync])
@@ -612,9 +524,7 @@ static void omap_dma_transfer_setup(struct soc_dma_ch_s *dma)
 
         /* TODO: check if we really need to update anything here or perhaps we
          * can skip part of this.  */
-#ifndef MULTI_REQ
         if (dma->update) {
-#endif
             a->element += min_elems;
 
             frames = a->element / a->elements;
@@ -629,11 +539,7 @@ static void omap_dma_transfer_setup(struct soc_dma_ch_s *dma)
 
             /* TODO: if the destination port is IMIF or EMIFF, set the dirty
              * bits on it.  */
-#ifndef MULTI_REQ
         }
-#else
-    }
-#endif
 
     omap_dma_interrupts_update(s);
 }
-- 
2.43.0


