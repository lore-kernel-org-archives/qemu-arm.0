Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86693CD4F21
	for <qemu-arm@archiver.kernel.org>; Tue, 12 May 2026 20:36:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wMtoU-0002W2-N6; Tue, 12 May 2026 16:34:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wMtoN-0002R3-4A
 for qemu-arm@nongnu.org; Tue, 12 May 2026 16:34:40 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wMtoF-0002Tk-B8
 for qemu-arm@nongnu.org; Tue, 12 May 2026 16:34:34 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-488a8ca4aadso54764615e9.3
 for <qemu-arm@nongnu.org>; Tue, 12 May 2026 13:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778618069; x=1779222869; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=t9k4mJ0mJoHclk3+nrD0mbmPSwGXLUxcP1ddS/QHoQQ=;
 b=nFXISXaY2TLeFTKR77SeexEOUVt14Yu59k4YvSG9s86Cc6VwC69OQG+R7mrUK+NGvP
 QSY/nePYCACcx58TefECjsdempaglfhgWBkX0erus4l86FFcvfriPVkQULh/f9Ce9CMg
 FFKYzb8jyTtsp1RGOT++vqVKQkqmiLtlXB1oFOMUZ3byoWg5kE0rk0IooR+NHxY30wyj
 BRDmMmbPjgrPuQ6XXIt3M3YAo7T++8549l4X6gGwJiqoschjrS5AYBiNoDOO1cy67p6p
 +SAMVLi3obnTGojpue/N0ceXlRLTC2yDGhA8PJQJXQH0IGapUiB9kUpIXn2Ts0IiyGsr
 ni1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778618069; x=1779222869;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=t9k4mJ0mJoHclk3+nrD0mbmPSwGXLUxcP1ddS/QHoQQ=;
 b=f6xN32FecIeGOp2ERpvowAos7FNWu+76T29nTb4tsAOkg4C0qiuzheqX3f5oXUNQVu
 DK5EnmT4qGdnO1XJ8ZbXltKSpzx/9cg0CVrqRjjOx9s3C3YY5k2iuUxNT1Ol2/MluxWp
 YGd2BvRD0Lb4Rwghss55ftdCCTUL5Q1u8xEHE45dd0S6HbTrnNCGb/4WCpxIwragFw9K
 rhAGe5otzmVSaPa23THIwTovT8RO2IhJdsXcED1PGYByANd/4UXejNUS7+3vQxSG8dpu
 KWpOtBaSPfpmgo9b8uFdmrxUCD6AzGwVgTqXp9iVivhCW3bCRSx8a2otz7NrdMBV+tLm
 f8ow==
X-Gm-Message-State: AOJu0YyQ+JqBp/FoDa+lnCnwyMk3u9mOxrogCvKiHY18rqLE79zojqmV
 fXhaaH0UXGyXaHRP/2NVXLOUa8p7ArW13duKFdhuGSXCRf5QMQLJsAM7rAd85N2XGo46UuTxrjK
 7usth
X-Gm-Gg: Acq92OEanLTXHiGOOqYyrUXCkUcLe0Tihr7C410mVZqEv/eGtJbNemXGeD4oxrp0mhb
 5rZuOyxb+VjbR+Hav61Kx0K1cwIQBA9Ys1///J8nuWkXVw7cq5ebM9V+Mq20zXUesU6h2EbLCAP
 HnKapavawUZylpAaC+IySeL7jhCcNAmNuOFYBD8W3QGHZd3S3kLXTlR4zzBLAdZ8LGJ+sbZB/+c
 qlwfxno4fSUKPA5TYsZMn8CtwbSJUb0ZLOLQhtnqk6f4IX/ZG9xpcivKDy81a4j4TsNnv4Mvgu0
 z4EMVqVL/iXV7+D06rO4vR4Fq+Nq3vutlvuQStUIHgFaNJs+TBumzBBFrkJfYFL0vCnW2TjUiv8
 w7yTaaywnPLIt+kSpl9J6pqmObfedaHlwNCMg92cRjnmy4MpQ6glyE1zicnej2RuFFyWLw2CXF7
 xKFGpXT97c/d8696fxhuUaRnxQok0lO5e1rJ/KCSQQw6DyDra8farn902OlclyX8FNw7LqNvQQX
 PB3PxOifZTOgLAtvvbGNiCGjsy8xvD/xW7gW/XXzA==
X-Received: by 2002:a05:600c:8b41:b0:488:b187:3c with SMTP id
 5b1f17b1804b1-48fc9a3320cmr5563825e9.14.1778618069185; 
 Tue, 12 May 2026 13:34:29 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fc8d69d0bsm16350635e9.13.2026.05.12.13.34.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2026 13:34:28 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 11/12] hw/dma/omap_dma: Remove unused ifdeffed out code
Date: Tue, 12 May 2026 21:34:13 +0100
Message-ID: <20260512203414.3633237-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260512203414.3633237-1-peter.maydell@linaro.org>
References: <20260512203414.3633237-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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

Remove all the ifdeffed out code.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/dma/omap_dma.c | 94 -----------------------------------------------
 1 file changed, 94 deletions(-)

diff --git a/hw/dma/omap_dma.c b/hw/dma/omap_dma.c
index b05e46724c..dea251afbc 100644
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


