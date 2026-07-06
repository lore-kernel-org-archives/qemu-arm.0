Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85432C43458
	for <qemu-arm@archiver.kernel.org>; Mon,  6 Jul 2026 17:34:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wgnCS-0007GR-T3; Mon, 06 Jul 2026 13:33:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wgnCI-0007E7-Cd
 for qemu-arm@nongnu.org; Mon, 06 Jul 2026 13:33:34 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wgnCF-00045z-57
 for qemu-arm@nongnu.org; Mon, 06 Jul 2026 13:33:34 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-493c19bad03so30936915e9.2
 for <qemu-arm@nongnu.org>; Mon, 06 Jul 2026 10:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783359209; x=1783964009; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=A0FNVhKwjG3aDw/GRmOzMnN8MY+Svb77ZDzchT5mAYc=;
 b=CK0y51EFpliVP2OZdPAeTlpHqiEYzCBkMs0ndn4VBYI2OW1A17PvwDY7t3r4sqiF6/
 z4By+HhfQuCvpiCdjCjACn9yfGQGIYW9y+O42tBWT2hGWdikQzdZvLE6uZwcbD3e9fIn
 yr1OrtI0nc7mf3JHFhlOWaWlejGBiJYewQp4hv3dAL1hZRVXFRUsEFtMAmfTuBWYnTfH
 4nP1j2L8a/9tS0zwTBNW2eCnDnrGBQxyxQIbzhs3Mqc9YqKN6iNz5/B2W/c2NxI1RRUP
 B9hKpD1kwpUSWO+1dbJnSA2it9Z624oUZxIsVSqKGPPRwD/lLO/UZ4e4V1yDbIj8p596
 wFrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783359209; x=1783964009;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=A0FNVhKwjG3aDw/GRmOzMnN8MY+Svb77ZDzchT5mAYc=;
 b=C85WAGWxDAjCNgqYOKDDySJqXrT41cJ6NmWNusbfejEI+XDVFD1q4tFLh+FtTQSMnA
 BRsPxMUiW0RLowRxuU9bUnalca5Ig9nL/uIJtSO4LMZ7qfmEYLeGhrcK+El/jIbpBff6
 FJFS4iG4763t81P88SQuvgApAJ+43mpj2o3trNw3UutQzeGglueSCEDwcSoDETtfRHuH
 nutlAALuksO8kHw+mh+N83cnbmLxbfBhbZWgMWN6Lf1SpaWyePSdCiCu2DJuCLDp//OK
 gZfXmqhQfOnhtWrQUB3YiZsdYOUXBcxj1Hsc3Dv7LVJ3QOrjxkR/5+p57tRgbPjaTLDu
 yNwQ==
X-Gm-Message-State: AOJu0YzxlTkqORv3tw07anlDjrqgYUiDV9jnPMeahAXSTO6LW62n/O1X
 xIDSwkczRQNDp+5mJDwCIYgdyUORXwenOgBoRsLxLwnxyPRf+eT/KLdCM9T8W5J/+cAQoGjB3A1
 OZQYHUGI0SQ==
X-Gm-Gg: AfdE7clBhJzoCiPLEtBuhJXw7v6TClwu3oNjOM1oFIwIWzKRBl971siXeER6mCZONgN
 /VD9jbBX7Pp+yLxDvm0KuJYmps2KwII/+haDs/jGhDYZGHraEh3Wc5SITFmbiyOdRHfXGDQTllW
 dhGCUHmDkW3xHi8n63bRO4sO2jBoNCenHvJDRyZFca5xQwAAqtkAp5dUujpsgFNnQPkuxwBfUi1
 hJyO83XraUWv5ni7BdUoLbTxMW8NLIphXopCGXzun/2tn5KZTBlVfTQk4xX4I267LAZaVTqIYGy
 r8811+0bctYSsytAWOm+wnBHOB0e3CZWGGts+zEpNBd0TXZKc3bkajn+4EOvsLccEqTy4vKZCtO
 dFetFuAaA06QdceB3zbo5z6feawRpcCnRtruAL2tMN1ZYhCQH1vwGcvSEHzFscK+Au3LGO0RZ86
 vWHkJ2jousOhnxgcFO/dGWWA8/O5P5sC9W1pkEyX7QzmVgBTfPdBlmysjR6iY2ESR+lB5duE0Ph
 NKCiNK1mRYitsk2bPu+pXrBcNNM719R
X-Received: by 2002:a05:600c:56c2:b0:493:d0b2:bc46 with SMTP id
 5b1f17b1804b1-493df0786dfmr13669655e9.28.1783359209020; 
 Mon, 06 Jul 2026 10:33:29 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493e006b6besm467365e9.2.2026.07.06.10.33.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2026 10:33:28 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 2/3] hw/display/exynos4210_fimd: Pass width to draw_line
 functions
Date: Mon,  6 Jul 2026 18:33:23 +0100
Message-ID: <20260706173324.804340-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260706173324.804340-1-peter.maydell@linaro.org>
References: <20260706173324.804340-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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

The draw_line functions currently assume the width of the line they
need to draw is w->rightbot_x - w->lefttop_x + 1, i.e.  the full
width of the guest-programmed window.  We want to be able to clamp
this to the overall screen size, which we can calculate in the
calling function.

Refactor to do this calculation in the caller and pass the
width as an argument to the draw_line functions.

Stable CC because this is a prerequisite for an upcoming bugfix
commit.

Cc: qemu-stable@nongnu.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/display/exynos4210_fimd.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/hw/display/exynos4210_fimd.c b/hw/display/exynos4210_fimd.c
index 43ad5fa0b4..52f2285cf5 100644
--- a/hw/display/exynos4210_fimd.c
+++ b/hw/display/exynos4210_fimd.c
@@ -282,7 +282,7 @@ struct Exynos4210fimdWindow {
 
     pixel_to_rgb_func *pixel_to_rgb;
     void (*draw_line)(Exynos4210fimdWindow *w, uint8_t *src, uint8_t *dst,
-            bool blend);
+                      uint32_t width, bool blend);
     uint32_t (*get_alpha)(Exynos4210fimdWindow *w, uint32_t pix_a);
     uint16_t lefttop_x, lefttop_y;   /* VIDOSD0 register */
     uint16_t rightbot_x, rightbot_y; /* VIDOSD1 register */
@@ -784,9 +784,9 @@ exynos4210_fimd_blend_pixel(Exynos4210fimdWindow *w, rgba p_bg, rgba *ret)
 /* Draw line with index in palette table in RAM frame buffer data */
 #define DEF_DRAW_LINE_PALETTE(N) \
 static void glue(draw_line_palette_, N)(Exynos4210fimdWindow *w, uint8_t *src, \
-               uint8_t *dst, bool blend) \
+                                        uint8_t *dst, uint32_t width, \
+                                        bool blend)                   \
 { \
-    int width = w->rightbot_x - w->lefttop_x + 1; \
     uint8_t *ifb = dst; \
     uint8_t swap = (w->wincon & FIMD_WINCON_SWAP) >> FIMD_WINCON_SWAP_SHIFT; \
     uint64_t data; \
@@ -813,9 +813,8 @@ static void glue(draw_line_palette_, N)(Exynos4210fimdWindow *w, uint8_t *src, \
 /* Draw line with direct color value in RAM frame buffer data */
 #define DEF_DRAW_LINE_NOPALETTE(N) \
 static void glue(draw_line_, N)(Exynos4210fimdWindow *w, uint8_t *src, \
-                    uint8_t *dst, bool blend) \
+                                uint8_t *dst, uint32_t width, bool blend) \
 { \
-    int width = w->rightbot_x - w->lefttop_x + 1; \
     uint8_t *ifb = dst; \
     uint8_t swap = (w->wincon & FIMD_WINCON_SWAP) >> FIMD_WINCON_SWAP_SHIFT; \
     uint64_t data; \
@@ -848,11 +847,10 @@ DEF_DRAW_LINE_NOPALETTE(32)
 
 /* Special draw line routine for window color map case */
 static void draw_line_mapcolor(Exynos4210fimdWindow *w, uint8_t *src,
-                       uint8_t *dst, bool blend)
+                               uint8_t *dst, uint32_t width, bool blend)
 {
     rgba p, p_old;
     uint8_t *ifb = dst;
-    int width = w->rightbot_x - w->lefttop_x + 1;
     uint32_t map_color = w->winmap & FIMD_WINMAP_COLOR_MASK;
 
     do {
@@ -1240,6 +1238,7 @@ static bool exynos4210_fimd_update(void *opaque)
     uint8_t *host_fb_addr;
     bool is_dirty = false;
     uint32_t global_width;
+    uint32_t window_width;
 
     if (!s || !s->console || !s->enabled ||
         surface_bits_per_pixel(qemu_console_surface(s->console)) == 0) {
@@ -1255,6 +1254,8 @@ static bool exynos4210_fimd_update(void *opaque)
         if ((w->wincon & FIMD_WINCON_ENWIN) && w->host_fb_addr) {
             scrn_height = w->rightbot_y - w->lefttop_y + 1;
             scrn_width = w->virtpage_width;
+            /* Number of bytes to actually draw */
+            window_width = w->rightbot_x - w->lefttop_x + 1;
             /* Total width of virtual screen page in bytes */
             inc_size = scrn_width + w->virtpage_offsize;
             host_fb_addr = w->host_fb_addr;
@@ -1273,7 +1274,8 @@ static bool exynos4210_fimd_update(void *opaque)
                     last_line = line;
                     w->draw_line(w, host_fb_addr, s->ifb +
                         w->lefttop_x * RGBA_SIZE + (w->lefttop_y + line) *
-                        global_width * RGBA_SIZE, blend);
+                                 global_width * RGBA_SIZE,
+                                 window_width, blend);
                 }
                 host_fb_addr += inc_size;
                 fb_line_addr += inc_size;
-- 
2.43.0


