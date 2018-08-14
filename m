Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp4160149wru;
        Tue, 14 Aug 2018 07:44:57 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPyZFg+5ynZIcVaV3VNByDll4o4PJ82kY+rKL6PrXid/yiS63MAFpfXmaF2RIBV3sDINgARH
X-Received: by 2002:a37:d60f:: with SMTP id t15-v6mr20675172qki.316.1534257897434;
        Tue, 14 Aug 2018 07:44:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534257897; cv=none;
        d=google.com; s=arc-20160816;
        b=yyOOJP21vX53fjkIBorln/YuFaLZI5sO8NLYnvedEjpsYPBcQg114Rj0s9OrAZkZQb
         OaYHyuiQmXL5WdO5AnId+FPbrH20dC3tBTKl/wXEPIBn9BkuvMeeh9D3W9vlQs+mWZ0X
         TQVpTaREIdqkr0tWkYckfmDX4Z2mmvbmQNRGbd9S1FuoBaOLfwZgB/rMtRgMfq2tRzle
         i6VHABd8xUC0/2s+bV40aLgqEXo6W1geXEfP+ZXXLv/EECobdMkgyM3O6KnQcnV8Lm9i
         ujo5n5tbIeBJyeF+ZKNh4f9wUWVfaGPFJQlqUoAxdVLnU2fgzhv616fOd51cML8Zd3nM
         /yiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=RXRtLs1isfZ/FLPN+Wg4DU5nbd0Xrp0RCYvKs05CIF4=;
        b=yf3qn8lC/6ris08G3g9qa+0SO/4c7OcgqRmk3W/yPkIXVmDuktiFwVlOY1Ccfoek8z
         x9RQPrkhX/aTcobdyb7K/HeE+2IKqlVK5jT3xCzfyxs6cgTmBeDzLUBKRsD6iReb5fDH
         si1B7Y+Nhg7IeazyERos2gBVg1937ZTvntd2pbzSvH4xWd+lNjATW4CoyFrgOFt04qKG
         K5SbW4ebRU9t85v6UOGCCZFkgPOXMvumQHYzoLNQut2AcDoO7iR5Hh5D0SMFSyOvQHJx
         WZxtBW1Dnru9til3EbtmLXFgsG0bjtkCclmhFmKgulZ1UK1emu6Am+0z+jC+qEbAd61c
         R/Hw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j62-v6si5622507qte.202.2018.08.14.07.44.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 14 Aug 2018 07:44:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44631 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fpaZ6-0005vI-SM
	for alex.bennee@linaro.org; Tue, 14 Aug 2018 10:44:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48575)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fpaYt-0005uZ-RX
	for qemu-arm@nongnu.org; Tue, 14 Aug 2018 10:44:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fpaYs-00049X-Fs
	for qemu-arm@nongnu.org; Tue, 14 Aug 2018 10:44:43 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:44374)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fpaYs-00046w-5o; Tue, 14 Aug 2018 10:44:42 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fpaYq-0006z0-FZ; Tue, 14 Aug 2018 15:44:40 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 14 Aug 2018 15:44:30 +0100
Message-Id: <20180814144436.679-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180814144436.679-1-peter.maydell@linaro.org>
References: <20180814144436.679-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 2/8] hw/misc/bcm2835_property: Track fb settings
 using BCM2835FBConfig
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mFkxrAzZXZGy

Refactor the fb property setting code so that rather than
using a set of pointers to local variables to track
whether a config value has been updated in the current
mbox and if so what its new value is, we just copy
all the current settings of the fb at the start, and
then update that copy as we go along, before asking
the fb to switch to it at the end.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/display/bcm2835_fb.h |  4 +-
 hw/display/bcm2835_fb.c         | 27 ++---------
 hw/misc/bcm2835_property.c      | 80 ++++++++++++++-------------------
 3 files changed, 37 insertions(+), 74 deletions(-)

diff --git a/include/hw/display/bcm2835_fb.h b/include/hw/display/bcm2835_fb.h
index 8485825ba5f..b965698d28a 100644
--- a/include/hw/display/bcm2835_fb.h
+++ b/include/hw/display/bcm2835_fb.h
@@ -53,8 +53,6 @@ typedef struct {
     uint32_t pitch;
 } BCM2835FBState;
 
-void bcm2835_fb_reconfigure(BCM2835FBState *s, uint32_t *xres, uint32_t *yres,
-                            uint32_t *xoffset, uint32_t *yoffset, uint32_t *bpp,
-                            uint32_t *pixo, uint32_t *alpha);
+void bcm2835_fb_reconfigure(BCM2835FBState *s, BCM2835FBConfig *newconfig);
 
 #endif
diff --git a/hw/display/bcm2835_fb.c b/hw/display/bcm2835_fb.c
index 0ffad49ab8f..8155de5d0b1 100644
--- a/hw/display/bcm2835_fb.c
+++ b/hw/display/bcm2835_fb.c
@@ -213,34 +213,13 @@ static void bcm2835_fb_mbox_push(BCM2835FBState *s, uint32_t value)
     s->lock = false;
 }
 
-void bcm2835_fb_reconfigure(BCM2835FBState *s, uint32_t *xres, uint32_t *yres,
-                            uint32_t *xoffset, uint32_t *yoffset, uint32_t *bpp,
-                            uint32_t *pixo, uint32_t *alpha)
+void bcm2835_fb_reconfigure(BCM2835FBState *s, BCM2835FBConfig *newconfig)
 {
     s->lock = true;
 
     /* TODO: input validation! */
-    if (xres) {
-        s->config.xres = *xres;
-    }
-    if (yres) {
-        s->config.yres = *yres;
-    }
-    if (xoffset) {
-        s->config.xoffset = *xoffset;
-    }
-    if (yoffset) {
-        s->config.yoffset = *yoffset;
-    }
-    if (bpp) {
-        s->config.bpp = *bpp;
-    }
-    if (pixo) {
-        s->config.pixo = *pixo;
-    }
-    if (alpha) {
-        s->config.alpha = *alpha;
-    }
+
+    s->config = *newconfig;
 
     /* TODO - Manage properly virtual resolution */
 
diff --git a/hw/misc/bcm2835_property.c b/hw/misc/bcm2835_property.c
index c79f358702d..df0645d1b84 100644
--- a/hw/misc/bcm2835_property.c
+++ b/hw/misc/bcm2835_property.c
@@ -21,11 +21,14 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
     uint32_t tmp;
     int n;
     uint32_t offset, length, color;
-    uint32_t xres, yres, xoffset, yoffset, bpp, pixo, alpha;
-    uint32_t tmp_xres, tmp_yres, tmp_xoffset, tmp_yoffset;
-    uint32_t tmp_bpp, tmp_pixo, tmp_alpha;
-    uint32_t *newxres = NULL, *newyres = NULL, *newxoffset = NULL,
-        *newyoffset = NULL, *newbpp = NULL, *newpixo = NULL, *newalpha = NULL;
+
+    /*
+     * Copy the current state of the framebuffer config; we will update
+     * this copy as we process tags and then ask the framebuffer to use
+     * it at the end.
+     */
+    BCM2835FBConfig fbconfig = s->fbdev->config;
+    bool fbconfig_updated = false;
 
     value &= ~0xf;
 
@@ -141,12 +144,9 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
         /* Frame buffer */
 
         case 0x00040001: /* Allocate buffer */
-            stl_le_phys(&s->dma_as, value + 12, s->fbdev->config.base);
-            tmp_xres = newxres != NULL ? *newxres : s->fbdev->config.xres;
-            tmp_yres = newyres != NULL ? *newyres : s->fbdev->config.yres;
-            tmp_bpp = newbpp != NULL ? *newbpp : s->fbdev->config.bpp;
+            stl_le_phys(&s->dma_as, value + 12, fbconfig.base);
             stl_le_phys(&s->dma_as, value + 16,
-                        tmp_xres * tmp_yres * tmp_bpp / 8);
+                        fbconfig.xres * fbconfig.yres * fbconfig.bpp / 8);
             resplen = 8;
             break;
         case 0x00048001: /* Release buffer */
@@ -157,10 +157,8 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
             break;
         case 0x00040003: /* Get display width/height */
         case 0x00040004:
-            tmp_xres = newxres != NULL ? *newxres : s->fbdev->config.xres;
-            tmp_yres = newyres != NULL ? *newyres : s->fbdev->config.yres;
-            stl_le_phys(&s->dma_as, value + 12, tmp_xres);
-            stl_le_phys(&s->dma_as, value + 16, tmp_yres);
+            stl_le_phys(&s->dma_as, value + 12, fbconfig.xres);
+            stl_le_phys(&s->dma_as, value + 16, fbconfig.yres);
             resplen = 8;
             break;
         case 0x00044003: /* Test display width/height */
@@ -169,74 +167,64 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
             break;
         case 0x00048003: /* Set display width/height */
         case 0x00048004:
-            xres = ldl_le_phys(&s->dma_as, value + 12);
-            newxres = &xres;
-            yres = ldl_le_phys(&s->dma_as, value + 16);
-            newyres = &yres;
+            fbconfig.xres = ldl_le_phys(&s->dma_as, value + 12);
+            fbconfig.yres = ldl_le_phys(&s->dma_as, value + 16);
+            fbconfig_updated = true;
             resplen = 8;
             break;
         case 0x00040005: /* Get depth */
-            tmp_bpp = newbpp != NULL ? *newbpp : s->fbdev->config.bpp;
-            stl_le_phys(&s->dma_as, value + 12, tmp_bpp);
+            stl_le_phys(&s->dma_as, value + 12, fbconfig.bpp);
             resplen = 4;
             break;
         case 0x00044005: /* Test depth */
             resplen = 4;
             break;
         case 0x00048005: /* Set depth */
-            bpp = ldl_le_phys(&s->dma_as, value + 12);
-            newbpp = &bpp;
+            fbconfig.bpp = ldl_le_phys(&s->dma_as, value + 12);
+            fbconfig_updated = true;
             resplen = 4;
             break;
         case 0x00040006: /* Get pixel order */
-            tmp_pixo = newpixo != NULL ? *newpixo : s->fbdev->config.pixo;
-            stl_le_phys(&s->dma_as, value + 12, tmp_pixo);
+            stl_le_phys(&s->dma_as, value + 12, fbconfig.pixo);
             resplen = 4;
             break;
         case 0x00044006: /* Test pixel order */
             resplen = 4;
             break;
         case 0x00048006: /* Set pixel order */
-            pixo = ldl_le_phys(&s->dma_as, value + 12);
-            newpixo = &pixo;
+            fbconfig.pixo = ldl_le_phys(&s->dma_as, value + 12);
+            fbconfig_updated = true;
             resplen = 4;
             break;
         case 0x00040007: /* Get alpha */
-            tmp_alpha = newalpha != NULL ? *newalpha : s->fbdev->config.alpha;
-            stl_le_phys(&s->dma_as, value + 12, tmp_alpha);
+            stl_le_phys(&s->dma_as, value + 12, fbconfig.alpha);
             resplen = 4;
             break;
         case 0x00044007: /* Test pixel alpha */
             resplen = 4;
             break;
         case 0x00048007: /* Set alpha */
-            alpha = ldl_le_phys(&s->dma_as, value + 12);
-            newalpha = &alpha;
+            fbconfig.alpha = ldl_le_phys(&s->dma_as, value + 12);
+            fbconfig_updated = true;
             resplen = 4;
             break;
         case 0x00040008: /* Get pitch */
-            tmp_xres = newxres != NULL ? *newxres : s->fbdev->config.xres;
-            tmp_bpp = newbpp != NULL ? *newbpp : s->fbdev->config.bpp;
-            stl_le_phys(&s->dma_as, value + 12, tmp_xres * tmp_bpp / 8);
+            stl_le_phys(&s->dma_as, value + 12,
+                        fbconfig.xres * fbconfig.bpp / 8);
             resplen = 4;
             break;
         case 0x00040009: /* Get virtual offset */
-            tmp_xoffset = newxoffset != NULL ?
-                *newxoffset : s->fbdev->config.xoffset;
-            tmp_yoffset = newyoffset != NULL ?
-                *newyoffset : s->fbdev->config.yoffset;
-            stl_le_phys(&s->dma_as, value + 12, tmp_xoffset);
-            stl_le_phys(&s->dma_as, value + 16, tmp_yoffset);
+            stl_le_phys(&s->dma_as, value + 12, fbconfig.xoffset);
+            stl_le_phys(&s->dma_as, value + 16, fbconfig.yoffset);
             resplen = 8;
             break;
         case 0x00044009: /* Test virtual offset */
             resplen = 8;
             break;
         case 0x00048009: /* Set virtual offset */
-            xoffset = ldl_le_phys(&s->dma_as, value + 12);
-            newxoffset = &xoffset;
-            yoffset = ldl_le_phys(&s->dma_as, value + 16);
-            newyoffset = &yoffset;
+            fbconfig.xoffset = ldl_le_phys(&s->dma_as, value + 12);
+            fbconfig.yoffset = ldl_le_phys(&s->dma_as, value + 16);
+            fbconfig_updated = true;
             resplen = 8;
             break;
         case 0x0004000a: /* Get/Test/Set overscan */
@@ -287,10 +275,8 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
     }
 
     /* Reconfigure framebuffer if required */
-    if (newxres || newyres || newxoffset || newyoffset || newbpp || newpixo
-        || newalpha) {
-        bcm2835_fb_reconfigure(s->fbdev, newxres, newyres, newxoffset,
-                               newyoffset, newbpp, newpixo, newalpha);
+    if (fbconfig_updated) {
+        bcm2835_fb_reconfigure(s->fbdev, &fbconfig);
     }
 
     /* Buffer response code */
-- 
2.18.0

