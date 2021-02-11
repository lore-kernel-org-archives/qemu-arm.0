Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp2302431lfc;
        Thu, 11 Feb 2021 06:18:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyGcn7fQwjHqdQB8DM5dGJasznCx3BOK2KbG7K1pMuJN5b1dAjGjWAuzmc9pm9inhQgWGTI
X-Received: by 2002:a25:4c8a:: with SMTP id z132mr12789577yba.350.1613053106244;
        Thu, 11 Feb 2021 06:18:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613053106; cv=none;
        d=google.com; s=arc-20160816;
        b=c1iJIeNKbkp66XTGna96pTbwkwfrA4UQlBSi71rOvn8Q8JhhjrU0o8gVGmPcwHD6L6
         r0wzFQKLVx7sdES8rVb5K5ZAyWIEL8EJXIk0ySZMYjy4zNLoKlXDIt3ktI/9iul6xTjp
         67tfF3OiFjUf0A4whPTGk4MMYNohPp2dZz8Mx0amSXLoSVrEyD17Zfk6MFtWNnfNeyXt
         nXUxvR6gBdtLe3eghPn6AKnuXYozBHnzW4tR+TULQeMiZZ9zNeZlPra40uvC2l3W8D1+
         NFgT4g/LrBUgkN/Kpe0LmF1+7Zpd5IALIfG0iAEW6JKUTKcM0WdXSENTzQp8XhPZUEmW
         uwKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ZgajD4GVdukUaJwhlU9+CkgVqEYFIUQ6PIIepWOOktw=;
        b=NJjTIlezwFdqbs8OFxp3i4YpJtlTs8Wh/cczn/Atfl4TrJ6iLBA65xosne3PGJmfmp
         TqnClqfM6ZR/xrBU9mnuukZhlchl5AGQoSr47OlGRBYt53g3vgWaAEU8YkjzRFT+dEaj
         EpdofdnUGEa7g4yyNelQj+Hicskx4WwdmK5688Wqwxe3z0hVtmIHyjmdMnN1VIFqz9BK
         8zOsafGYBJ/haELQCvOss7aKrFYV6/pzs7m/KaGRAo2SVGPt5pCYx3r+LgAEhVJJ7wBI
         75qdi3yNa759tgc3PNKsMB03nZQj8tA5Yg2UjsbhF2jdsh1ai+AtfnXMvtmaOx2UyB/A
         Ag9w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mxHjQPbn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d1si5827015ybi.151.2021.02.11.06.18.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Feb 2021 06:18:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mxHjQPbn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lACnZ-0001tY-Hx
	for alex.bennee@linaro.org; Thu, 11 Feb 2021 09:18:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lACl0-0006Xv-AK
 for qemu-arm@nongnu.org; Thu, 11 Feb 2021 09:15:48 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:35317)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lACkd-00074k-43
 for qemu-arm@nongnu.org; Thu, 11 Feb 2021 09:15:44 -0500
Received: by mail-wm1-x32a.google.com with SMTP id n10so4028241wmq.0
 for <qemu-arm@nongnu.org>; Thu, 11 Feb 2021 06:15:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZgajD4GVdukUaJwhlU9+CkgVqEYFIUQ6PIIepWOOktw=;
 b=mxHjQPbnAOwyIEKW8BVHA7AJCSbUZZzemaLcX4aS661Fzv+L0BYBkH+jOzElLOYRcp
 vPRLo98OBBPOIkJyRz0jjjcymH1sAECaRy9O25jjM0V8OXucfJl/vqkpiqr2eMqgAS1/
 DXmDNzsJHDmiTqA6JlaVzgRpS/WRGYVdTzMvVO5CePEJpvYW4RvBhwpaPYv7oVpOfWcq
 Rz/y/BDoi4uF2W576vrIz0CsZkqCPwCfmV/KFXMC+fRtY10E4Xi+ZNCHrRZngtnXin34
 o8Vgm1ctaVds3CplWGA4iGC9rLquXNK31mr1gz3uWJuRZorDwAlivVL70Nn902aBj80C
 D+1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZgajD4GVdukUaJwhlU9+CkgVqEYFIUQ6PIIepWOOktw=;
 b=K209PNrus3KAYR0mswNinidSFljPS+CjLQf27dKv7VLbn4bxBoXZ+hLwTbpIu/H4J3
 W7H8aFGifyaMs4Sy8Pkz1bdf0mE3iO3yqGl+/A9EmmJ7UOQcAtLl47BlVGT6RecU2OQl
 fKoKuJzFLQtiO6MczumLePtzZiKdyTsSyAx/8c+RRxHNjAQnpIktK14qoFEIx5Ho38TJ
 AelyOq4NacI4SaB6h0Bu25FGcg3IuVC+056dDxr29pm3QRDt7C0vWhWBl+s6B4Pb5A00
 UJLAmNBPfiZ7wcDcZc88oWpquTCgP0ERVcKYx3nVuOu2wkYTwWMWn0iQB7bOqcekijWy
 jgJw==
X-Gm-Message-State: AOAM5322DHvoCJac1be0DL6s4ti36U16bx59kZuA7RCnw9JgGL9pldLn
 LkKC8jIQt/DlCQMYv3ENXZNximwYiHhfEw==
X-Received: by 2002:a1c:f002:: with SMTP id a2mr126412wmb.117.1613052920778;
 Thu, 11 Feb 2021 06:15:20 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id h13sm5223291wrv.20.2021.02.11.06.15.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 06:15:20 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 4/9] hw/display/pxa2xx_lcd: Remove dead code for non-32-bpp
 surfaces
Date: Thu, 11 Feb 2021 14:15:10 +0000
Message-Id: <20210211141515.8755-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210211141515.8755-1-peter.maydell@linaro.org>
References: <20210211141515.8755-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zFlP6ks9ayXu

For a long time now the UI layer has guaranteed that the console
surface is always 32 bits per pixel.  Remove the legacy dead code
from the pxa2xx_lcd display device which was handling the possibility
that the console surface was some other format.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/display/pxa2xx_lcd.c | 79 +++++++++--------------------------------
 1 file changed, 17 insertions(+), 62 deletions(-)

diff --git a/hw/display/pxa2xx_lcd.c b/hw/display/pxa2xx_lcd.c
index dfff9949627..786a777629f 100644
--- a/hw/display/pxa2xx_lcd.c
+++ b/hw/display/pxa2xx_lcd.c
@@ -45,7 +45,6 @@ struct PXA2xxLCDState {
 
     int invalidated;
     QemuConsole *con;
-    drawfn *line_fn[2];
     int dest_width;
     int xres, yres;
     int pal_for;
@@ -188,6 +187,9 @@ typedef struct QEMU_PACKED {
 #define LDCMD_SOFINT	(1 << 22)
 #define LDCMD_PAL	(1 << 26)
 
+#define BITS 32
+#include "pxa2xx_template.h"
+
 /* Route internal interrupt lines to the global IC */
 static void pxa2xx_lcdc_int_update(PXA2xxLCDState *s)
 {
@@ -674,14 +676,21 @@ static void pxa2xx_palette_parse(PXA2xxLCDState *s, int ch, int bpp)
     }
 }
 
+static inline drawfn pxa2xx_drawfn(PXA2xxLCDState *s)
+{
+    if (s->transp) {
+        return pxa2xx_draw_fn_32t[s->bpp];
+    } else {
+        return pxa2xx_draw_fn_32[s->bpp];
+    }
+}
+
 static void pxa2xx_lcdc_dma0_redraw_rot0(PXA2xxLCDState *s,
                 hwaddr addr, int *miny, int *maxy)
 {
     DisplaySurface *surface = qemu_console_surface(s->con);
     int src_width, dest_width;
-    drawfn fn = NULL;
-    if (s->dest_width)
-        fn = s->line_fn[s->transp][s->bpp];
+    drawfn fn = pxa2xx_drawfn(s);
     if (!fn)
         return;
 
@@ -710,9 +719,7 @@ static void pxa2xx_lcdc_dma0_redraw_rot90(PXA2xxLCDState *s,
 {
     DisplaySurface *surface = qemu_console_surface(s->con);
     int src_width, dest_width;
-    drawfn fn = NULL;
-    if (s->dest_width)
-        fn = s->line_fn[s->transp][s->bpp];
+    drawfn fn = pxa2xx_drawfn(s);
     if (!fn)
         return;
 
@@ -742,10 +749,7 @@ static void pxa2xx_lcdc_dma0_redraw_rot180(PXA2xxLCDState *s,
 {
     DisplaySurface *surface = qemu_console_surface(s->con);
     int src_width, dest_width;
-    drawfn fn = NULL;
-    if (s->dest_width) {
-        fn = s->line_fn[s->transp][s->bpp];
-    }
+    drawfn fn = pxa2xx_drawfn(s);
     if (!fn) {
         return;
     }
@@ -776,10 +780,7 @@ static void pxa2xx_lcdc_dma0_redraw_rot270(PXA2xxLCDState *s,
 {
     DisplaySurface *surface = qemu_console_surface(s->con);
     int src_width, dest_width;
-    drawfn fn = NULL;
-    if (s->dest_width) {
-        fn = s->line_fn[s->transp][s->bpp];
-    }
+    drawfn fn = pxa2xx_drawfn(s);
     if (!fn) {
         return;
     }
@@ -990,17 +991,6 @@ static const VMStateDescription vmstate_pxa2xx_lcdc = {
     }
 };
 
-#define BITS 8
-#include "pxa2xx_template.h"
-#define BITS 15
-#include "pxa2xx_template.h"
-#define BITS 16
-#include "pxa2xx_template.h"
-#define BITS 24
-#include "pxa2xx_template.h"
-#define BITS 32
-#include "pxa2xx_template.h"
-
 static const GraphicHwOps pxa2xx_ops = {
     .invalidate  = pxa2xx_invalidate_display,
     .gfx_update  = pxa2xx_update_display,
@@ -1010,7 +1000,6 @@ PXA2xxLCDState *pxa2xx_lcdc_init(MemoryRegion *sysmem,
                                  hwaddr base, qemu_irq irq)
 {
     PXA2xxLCDState *s;
-    DisplaySurface *surface;
 
     s = (PXA2xxLCDState *) g_malloc0(sizeof(PXA2xxLCDState));
     s->invalidated = 1;
@@ -1024,41 +1013,7 @@ PXA2xxLCDState *pxa2xx_lcdc_init(MemoryRegion *sysmem,
     memory_region_add_subregion(sysmem, base, &s->iomem);
 
     s->con = graphic_console_init(NULL, 0, &pxa2xx_ops, s);
-    surface = qemu_console_surface(s->con);
-
-    switch (surface_bits_per_pixel(surface)) {
-    case 0:
-        s->dest_width = 0;
-        break;
-    case 8:
-        s->line_fn[0] = pxa2xx_draw_fn_8;
-        s->line_fn[1] = pxa2xx_draw_fn_8t;
-        s->dest_width = 1;
-        break;
-    case 15:
-        s->line_fn[0] = pxa2xx_draw_fn_15;
-        s->line_fn[1] = pxa2xx_draw_fn_15t;
-        s->dest_width = 2;
-        break;
-    case 16:
-        s->line_fn[0] = pxa2xx_draw_fn_16;
-        s->line_fn[1] = pxa2xx_draw_fn_16t;
-        s->dest_width = 2;
-        break;
-    case 24:
-        s->line_fn[0] = pxa2xx_draw_fn_24;
-        s->line_fn[1] = pxa2xx_draw_fn_24t;
-        s->dest_width = 3;
-        break;
-    case 32:
-        s->line_fn[0] = pxa2xx_draw_fn_32;
-        s->line_fn[1] = pxa2xx_draw_fn_32t;
-        s->dest_width = 4;
-        break;
-    default:
-        fprintf(stderr, "%s: Bad color depth\n", __func__);
-        exit(1);
-    }
+    s->dest_width = 4;
 
     vmstate_register(NULL, 0, &vmstate_pxa2xx_lcdc, s);
 
-- 
2.20.1

