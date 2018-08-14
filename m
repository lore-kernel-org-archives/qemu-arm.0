Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp4160787wru;
        Tue, 14 Aug 2018 07:45:30 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPyXC5KQGm4ZUE2njZLUOsUUqLzcSM2XNgZ+IspRD5XFausCc/5qqg+QQ0FoeCCskgG7dK14
X-Received: by 2002:a37:ef0f:: with SMTP id j15-v6mr19413598qkk.399.1534257930852;
        Tue, 14 Aug 2018 07:45:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534257930; cv=none;
        d=google.com; s=arc-20160816;
        b=kCpaRwMOJYly+CPCP4Bujm+deqsjlCvgh/lXuqS1h66fTQvbPCjbTeVlohgIwXlETH
         WAZmcqZxPtHRTrTpsJI1sN4eA2Zo2kFhTyoQvFnxDBqgIlVo7u6g1DWoHOZgHiz9W2+Y
         YImgvccAa3utG5Be6hON4JAKAJBw3IHGwLQxepzUfcFECvwC9OEaSVaV3MQfAx5Dwvqs
         HeECHpfKHBgEFEBbePjW/UJ9YtsQhRMLkAz6Jaf9CEhmCkQHj0P/JUa3Ioz7YSvluRl7
         VN5Le/J3T+EbTe9CjvSh6HItFXQ2msVo1+5KEG0Y6od4xfeE9Prh97nLpnHvgwhBlzFF
         EgPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=0/43Fy9PhYaWY6nIwV+513sXRmA+6FmsW4hAO2XFnaY=;
        b=UqbOUVvL4Vf0TGcZPklxE538jDI7LGp4DAXr39b4WIsuI/hOn86QUcPnnHNVKqrp2D
         8cKxepjX2OrX7ToE47/V6esydS4AUDjPWQgG36kgdoqbyz3tJ9QpMruX1hR/eR8BVA3W
         eIPzzw23K+DDHj1vF9Y0Jp2zsmAFSzodMcNCsGCCy1LXfvp0QlkqIX2TzEcgrA9xskJQ
         vy+oQbgjvKfVsJdc2XqEkB9KJHf5GuAZlvAOrEqYS0bKUvWbqRcJRyGN7g/yJoCoD4YU
         lCsaG6kW0IUwqW29mwjdnWs1/t25T1ckBsmV1EX4Zn8oqj71gZth0i+MMV4Qp0efSlIv
         axNw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 186-v6si14146708qko.53.2018.08.14.07.45.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 14 Aug 2018 07:45:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44642 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fpaZe-00076F-8T
	for alex.bennee@linaro.org; Tue, 14 Aug 2018 10:45:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48707)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fpaYz-0005yq-7X
	for qemu-arm@nongnu.org; Tue, 14 Aug 2018 10:44:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fpaYx-0004Cz-Vz
	for qemu-arm@nongnu.org; Tue, 14 Aug 2018 10:44:49 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:44392)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fpaYx-0004Bm-MP; Tue, 14 Aug 2018 10:44:47 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fpaYu-000717-Hk; Tue, 14 Aug 2018 15:44:44 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 14 Aug 2018 15:44:34 +0100
Message-Id: <20180814144436.679-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180814144436.679-1-peter.maydell@linaro.org>
References: <20180814144436.679-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 6/8] hw/display/bcm2835_fb: Fix handling of
 virtual framebuffer
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
X-TUID: YbtNVLTDxQjb

The raspi framebuffir in bcm2835_fb supports the definition
of a virtual "viewport", which is smaller than the full
physical framebuffer size and at an adjustable offset within
it. Only the viewport area is sent to the screen. This allows
the guest to do things like double buffering, or scrolling
by adjusting the viewport origin. Currently QEMU doesn't
implement this at all.

Add support for this feature:
 * the property mailbox code needs to distinguish the
   virtual width/height from the physical width/height
 * the framebuffer code needs to do something with the
   virtual width/height/origin information

Note that the wiki documentation on the semantics of the
virtual and physical height and width has it the wrong way
around -- the virtual size is the size of the allocated
buffer, and the physical size is the size of the display,
so the virtual size is always the same as or larger than
the physical.

If the viewport size is set smaller than the physical
screen size, we ignore the viewport settings completely
and just display the physical screen area.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/display/bcm2835_fb.h |  6 ++++--
 hw/display/bcm2835_fb.c         | 28 ++++++++++++++++++++++------
 hw/misc/bcm2835_property.c      | 21 +++++++++++++++------
 3 files changed, 41 insertions(+), 14 deletions(-)

diff --git a/include/hw/display/bcm2835_fb.h b/include/hw/display/bcm2835_fb.h
index 95bcec7fe33..d992c60c120 100644
--- a/include/hw/display/bcm2835_fb.h
+++ b/include/hw/display/bcm2835_fb.h
@@ -62,7 +62,8 @@ void bcm2835_fb_reconfigure(BCM2835FBState *s, BCM2835FBConfig *newconfig);
  */
 static inline uint32_t bcm2835_fb_get_pitch(BCM2835FBConfig *config)
 {
-    return config->xres * (config->bpp >> 3);
+    uint32_t xres = MAX(config->xres, config->xres_virtual);
+    return xres * (config->bpp >> 3);
 }
 
 /**
@@ -71,7 +72,8 @@ static inline uint32_t bcm2835_fb_get_pitch(BCM2835FBConfig *config)
  */
 static inline uint32_t bcm2835_fb_get_size(BCM2835FBConfig *config)
 {
-    return config->yres * bcm2835_fb_get_pitch(config);
+    uint32_t yres = MAX(config->yres, config->yres_virtual);
+    return yres * bcm2835_fb_get_pitch(config);
 }
 
 #endif
diff --git a/hw/display/bcm2835_fb.c b/hw/display/bcm2835_fb.c
index a6c0a0cc942..76a10072b46 100644
--- a/hw/display/bcm2835_fb.c
+++ b/hw/display/bcm2835_fb.c
@@ -126,6 +126,18 @@ static void draw_line_src16(void *opaque, uint8_t *dst, const uint8_t *src,
     }
 }
 
+static bool fb_use_offsets(BCM2835FBConfig *config)
+{
+    /*
+     * Return true if we should use the viewport offsets.
+     * Experimentally, the hardware seems to do this only if the
+     * viewport size is larger than the physical screen. (It doesn't
+     * prevent the guest setting this silly viewport setting, though...)
+     */
+    return config->xres_virtual > config->xres &&
+        config->yres_virtual > config->yres;
+}
+
 static void fb_update_display(void *opaque)
 {
     BCM2835FBState *s = opaque;
@@ -134,12 +146,18 @@ static void fb_update_display(void *opaque)
     int last = 0;
     int src_width = 0;
     int dest_width = 0;
+    uint32_t xoff = 0, yoff = 0;
 
     if (s->lock || !s->config.xres) {
         return;
     }
 
     src_width = bcm2835_fb_get_pitch(&s->config);
+    if (fb_use_offsets(&s->config)) {
+        xoff = s->config.xoffset;
+        yoff = s->config.yoffset;
+    }
+
     dest_width = s->config.xres;
 
     switch (surface_bits_per_pixel(surface)) {
@@ -165,8 +183,9 @@ static void fb_update_display(void *opaque)
     }
 
     if (s->invalidate) {
+        hwaddr base = s->config.base + xoff + yoff * src_width;
         framebuffer_update_memory_section(&s->fbsection, s->dma_mr,
-                                          s->config.base,
+                                          base,
                                           s->config.yres, src_width);
     }
 
@@ -176,7 +195,8 @@ static void fb_update_display(void *opaque)
                                draw_line_src16, s, &first, &last);
 
     if (first >= 0) {
-        dpy_gfx_update(s->con, 0, first, s->config.xres, last - first + 1);
+        dpy_gfx_update(s->con, 0, first, s->config.xres,
+                       last - first + 1);
     }
 
     s->invalidate = false;
@@ -202,8 +222,6 @@ static void bcm2835_fb_mbox_push(BCM2835FBState *s, uint32_t value)
     s->config.base = s->vcram_base | (value & 0xc0000000);
     s->config.base += BCM2835_FB_OFFSET;
 
-    /* TODO - Manage properly virtual resolution */
-
     pitch = bcm2835_fb_get_pitch(&s->config);
     size = bcm2835_fb_get_size(&s->config);
 
@@ -224,8 +242,6 @@ void bcm2835_fb_reconfigure(BCM2835FBState *s, BCM2835FBConfig *newconfig)
 
     s->config = *newconfig;
 
-    /* TODO - Manage properly virtual resolution */
-
     s->invalidate = true;
     qemu_console_resize(s->con, s->config.xres, s->config.yres);
     s->lock = false;
diff --git a/hw/misc/bcm2835_property.c b/hw/misc/bcm2835_property.c
index c8c4979bd26..e3ab677891b 100644
--- a/hw/misc/bcm2835_property.c
+++ b/hw/misc/bcm2835_property.c
@@ -155,23 +155,32 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
         case 0x00040002: /* Blank screen */
             resplen = 4;
             break;
-        case 0x00040003: /* Get display width/height */
-        case 0x00040004:
+        case 0x00040003: /* Get physical display width/height */
             stl_le_phys(&s->dma_as, value + 12, fbconfig.xres);
             stl_le_phys(&s->dma_as, value + 16, fbconfig.yres);
             resplen = 8;
             break;
-        case 0x00044003: /* Test display width/height */
-        case 0x00044004:
+        case 0x00040004: /* Get virtual display width/height */
+            stl_le_phys(&s->dma_as, value + 12, fbconfig.xres_virtual);
+            stl_le_phys(&s->dma_as, value + 16, fbconfig.yres_virtual);
             resplen = 8;
             break;
-        case 0x00048003: /* Set display width/height */
-        case 0x00048004:
+        case 0x00044003: /* Test physical display width/height */
+        case 0x00044004: /* Test virtual display width/height */
+            resplen = 8;
+            break;
+        case 0x00048003: /* Set physical display width/height */
             fbconfig.xres = ldl_le_phys(&s->dma_as, value + 12);
             fbconfig.yres = ldl_le_phys(&s->dma_as, value + 16);
             fbconfig_updated = true;
             resplen = 8;
             break;
+        case 0x00048004: /* Set virtual display width/height */
+            fbconfig.xres_virtual = ldl_le_phys(&s->dma_as, value + 12);
+            fbconfig.yres_virtual = ldl_le_phys(&s->dma_as, value + 16);
+            fbconfig_updated = true;
+            resplen = 8;
+            break;
         case 0x00040005: /* Get depth */
             stl_le_phys(&s->dma_as, value + 12, fbconfig.bpp);
             resplen = 4;
-- 
2.18.0

