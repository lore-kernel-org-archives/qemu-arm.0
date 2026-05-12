Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D90BCCD4F24
	for <qemu-arm@archiver.kernel.org>; Tue, 12 May 2026 20:36:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wMtoV-0002XM-M9; Tue, 12 May 2026 16:34:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wMtoF-0002Nw-J7
 for qemu-arm@nongnu.org; Tue, 12 May 2026 16:34:35 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wMtoC-0002RZ-5d
 for qemu-arm@nongnu.org; Tue, 12 May 2026 16:34:31 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4896c22fcbaso52492755e9.0
 for <qemu-arm@nongnu.org>; Tue, 12 May 2026 13:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778618066; x=1779222866; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=oMRIz1cYEobW+mCeavjxs++vW/jWBy8/z7iwSk26Nxs=;
 b=FxhFpBwgH+/1w/a/A8Wa+tI8PG+BZ208d7r8695oBwL2xr7DbkeMwovysQuBJTQ+Je
 jT+Qe8pweM4KJyHf4T8CGAhlXSv6zUw44f2ITD7jbImRxz0dm8jy6dmEsc4Pq99w5/So
 fR5szfjaE79lSnVLpyOhmUTNo70uNP226Oiuh6pYMt5iGJdRqRhVfsctveRqTPmqI7/4
 07R63gXNfdLVB8jDMbFpz2GBi/yLiQ4G07mg64JDt4xDhvsR5klhn/KnlcH9arm5g8AO
 XHWA+rrJ9A4b4qzNxu3RZHvrwQlwfaWaKTValc7JvpmHwlHMVIhGzjrSMIg8rqUYLuMs
 4pzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778618066; x=1779222866;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=oMRIz1cYEobW+mCeavjxs++vW/jWBy8/z7iwSk26Nxs=;
 b=oq9MValnJVklfdNTQtk1nbQSlSCv/9GkndJ6ECsspY1FYjsB+tmFJyDEyScBMv11pK
 KlOKXkGA8cj0ARWTMx0afDC8fU4rvG0eZOvohhdhuCKq32YTBUyW53fbTsINVZXF+5+9
 6cUWoiOmHJu7v59c/jpzpHrWkYG8edYpUbgZXQbjYWj9CFK9KhO1xHjJR2A9FhAaQ/c4
 rclH0yokCk77n30Dv4jKttm3/NMq8/6s7W0cWM8m1NmfilMQuC98xSK2aGg4tF2y7kEt
 IdArr/kR27VTiPxyOHpbvbXiPC4jGBpzs3l7PHnVy4/gxHKPtvwk9Gab68MQwTTCzRdq
 QT3A==
X-Gm-Message-State: AOJu0YwjzA7B/tiN82sYy0JW1EM3DgkULIgN15ktLVipUKvMUljVTZVT
 B7S32Fb8KctFOA1WbnPhFUbmqwbmDNJYJjjVNZmqGiTXgOF9EDL9TdAkIWPQ5WxwMUlD1uCPGrn
 PwJI8
X-Gm-Gg: Acq92OF7/6YatdEaSEhZe0APXfCQBp9K78kX/XdoiOxOoG1wk58lkchgx+GE/FYN0AH
 xh6Z2y/YivontDp+Qgf44h2ryGJQZ3iPBnmZPU9n0r/1DmiZT0wvvMyMfFld0xtR8ZGa/CqkkCh
 y0YzQXkR2FEyTUd5AgQhrai9Sn4UNsm1Gy8J/76gSOxexuOuWwpjU8tVAUMU/E3WpUX85Awiw/4
 qy8idyaI/sZtHZdZcu+lDMjL9Z8Z1eKjmE3LdSdZA6pWcKleL4A0ryEAswUkwgv41B49gRmgcSV
 uMv5bCpzkTap3aiDNW+wmuCr9jpR0bZxp0qw7Op8JtlJ5BOkgPWuQ0BVkyNSbuBUvQpegW/Hvcg
 ZRBsFSUAdkUldPlYNpSGqPL0QpdkUDBVxUP1N4N+e3wOzmvxELk/Y4HwAnBbrFDCF7o7fS0BPa7
 8jF/NYxHM36g334wk1ROQjdV4GyVsClIbMHC+mX/n9JzQRQoCGlErlRhppXuFSp5FOXX3DUuhLv
 cxQV1mZSK0cbKae1dBaAzIqQf/0KkE=
X-Received: by 2002:a05:600c:19ce:b0:48a:76a3:2b9b with SMTP id
 5b1f17b1804b1-48fc9a34866mr4834385e9.17.1778618065812; 
 Tue, 12 May 2026 13:34:25 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fc8d69d0bsm16350635e9.13.2026.05.12.13.34.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2026 13:34:24 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 08/12] hw/dma/omap_dma: Fold omap_dma_sys_read() and
 omap_dma_sys_write() into callers
Date: Tue, 12 May 2026 21:34:10 +0100
Message-ID: <20260512203414.3633237-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260512203414.3633237-1-peter.maydell@linaro.org>
References: <20260512203414.3633237-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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

Now we have removed the DMA 3.2 support, we call omap_dma_sys_read()
only for the single address offset 0x400, and similarly for
omap_dma_sys_write().  The other cases in those functions are DMA
3.2-only and now dead code.  Fold the 0x400 register directly into
the callers, and remove the rest.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/dma/omap_dma.c | 121 ++--------------------------------------------
 1 file changed, 5 insertions(+), 116 deletions(-)

diff --git a/hw/dma/omap_dma.c b/hw/dma/omap_dma.c
index 9a86d90b4e..49348f40c5 100644
--- a/hw/dma/omap_dma.c
+++ b/hw/dma/omap_dma.c
@@ -317,16 +317,6 @@ static void omap_dma_interrupts_3_1_update(struct omap_dma_s *s)
         qemu_irq_raise(ch[5].irq);
 }
 
-static void omap_dma_interrupts_3_2_update(struct omap_dma_s *s)
-{
-    struct omap_dma_channel_s *ch = s->ch;
-    int i;
-
-    for (i = s->chans; i; ch ++, i --)
-        if (ch->status)
-            qemu_irq_raise(ch->irq);
-}
-
 static void omap_dma_enable_3_1_mapping(struct omap_dma_s *s)
 {
     s->omap_3_1_mapping_disabled = 0;
@@ -334,13 +324,6 @@ static void omap_dma_enable_3_1_mapping(struct omap_dma_s *s)
     s->intr_update = omap_dma_interrupts_3_1_update;
 }
 
-static void omap_dma_disable_3_1_mapping(struct omap_dma_s *s)
-{
-    s->omap_3_1_mapping_disabled = 1;
-    s->chans = 16;
-    s->intr_update = omap_dma_interrupts_3_2_update;
-}
-
 static void omap_dma_process_request(struct omap_dma_s *s, int request)
 {
     int channel;
@@ -1106,98 +1089,6 @@ static int omap_dma_3_1_lcd_read(struct omap_dma_lcd_channel_s *s, int offset,
     return 0;
 }
 
-static int omap_dma_sys_write(struct omap_dma_s *s, int offset, uint16_t value)
-{
-    switch (offset) {
-    case 0x400: /* SYS_DMA_GCR */
-        s->gcr = value;
-        break;
-
-    case 0x404: /* DMA_GSCR */
-        if (value & 0x8)
-            omap_dma_disable_3_1_mapping(s);
-        else
-            omap_dma_enable_3_1_mapping(s);
-        break;
-
-    case 0x408: /* DMA_GRST */
-        if (value & 0x1)
-            omap_dma_reset(s->dma);
-        break;
-
-    default:
-        return 1;
-    }
-    return 0;
-}
-
-static int omap_dma_sys_read(struct omap_dma_s *s, int offset,
-                uint16_t *ret)
-{
-    switch (offset) {
-    case 0x400: /* SYS_DMA_GCR */
-        *ret = s->gcr;
-        break;
-
-    case 0x404: /* DMA_GSCR */
-        *ret = s->omap_3_1_mapping_disabled << 3;
-        break;
-
-    case 0x408: /* DMA_GRST */
-        *ret = 0;
-        break;
-
-    case 0x442: /* DMA_HW_ID */
-    case 0x444: /* DMA_PCh2_ID */
-    case 0x446: /* DMA_PCh0_ID */
-    case 0x448: /* DMA_PCh1_ID */
-    case 0x44a: /* DMA_PChG_ID */
-    case 0x44c: /* DMA_PChD_ID */
-        *ret = 1;
-        break;
-
-    case 0x44e: /* DMA_CAPS_0_U */
-        *ret = (s->caps[0] >> 16) & 0xffff;
-        break;
-    case 0x450: /* DMA_CAPS_0_L */
-        *ret = (s->caps[0] >>  0) & 0xffff;
-        break;
-
-    case 0x452: /* DMA_CAPS_1_U */
-        *ret = (s->caps[1] >> 16) & 0xffff;
-        break;
-    case 0x454: /* DMA_CAPS_1_L */
-        *ret = (s->caps[1] >>  0) & 0xffff;
-        break;
-
-    case 0x456: /* DMA_CAPS_2 */
-        *ret = s->caps[2];
-        break;
-
-    case 0x458: /* DMA_CAPS_3 */
-        *ret = s->caps[3];
-        break;
-
-    case 0x45a: /* DMA_CAPS_4 */
-        *ret = s->caps[4];
-        break;
-
-    case 0x460: /* DMA_PCh2_SR */
-    case 0x480: /* DMA_PCh0_SR */
-    case 0x482: /* DMA_PCh1_SR */
-    case 0x4c0: /* DMA_PChD_SR_0 */
-        qemu_log_mask(LOG_UNIMP,
-                      "%s: Physical Channel Status Registers not implemented\n",
-                      __func__);
-        *ret = 0xff;
-        break;
-
-    default:
-        return 1;
-    }
-    return 0;
-}
-
 static uint64_t omap_dma_read(void *opaque, hwaddr addr, unsigned size)
 {
     struct omap_dma_s *s = opaque;
@@ -1225,10 +1116,9 @@ static uint64_t omap_dma_read(void *opaque, hwaddr addr, unsigned size)
 
     case 0x404 ... 0x4fe:
         break;
-    case 0x400:
-        if (omap_dma_sys_read(s, addr, &ret))
-            break;
-        return ret;
+    case 0x400: /* SYS_DMA_GCR */
+        return s->gcr;
+        break;
 
     case 0xb00 ... 0xbfe:
         break;
@@ -1265,9 +1155,8 @@ static void omap_dma_write(void *opaque, hwaddr addr,
 
     case 0x404 ... 0x4fe:
         break;
-    case 0x400:
-        if (omap_dma_sys_write(s, addr, value))
-            break;
+    case 0x400: /* SYS_DMA_GCR */
+        s->gcr = value;
         return;
 
     case 0xb00 ... 0xbfe:
-- 
2.43.0


