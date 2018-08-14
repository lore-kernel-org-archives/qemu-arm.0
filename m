Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp4160538wru;
        Tue, 14 Aug 2018 07:45:17 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPxNIc11dMWPwN3BfB/8UbScGJxBIRnJZ4mcGxv3TgiF052Lxgfjoxe/pCsp9YWweIWkC7qC
X-Received: by 2002:a37:3752:: with SMTP id e79-v6mr20934011qka.131.1534257917568;
        Tue, 14 Aug 2018 07:45:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534257917; cv=none;
        d=google.com; s=arc-20160816;
        b=UUsSogTDJY3kuGTZCYAYJACJIUWoJf+S+QNBCq14vmhAExmwH0IJ5vJRlMEXLq0JXV
         rp0yQt9e9kjUpw0LDgPBFsZ+6O+zfBDqkABFWKE1yObbtVLXmCOrCS+q8Rydehcu+6lF
         Ab9V+k4BI4SEX8hgHJFrIBxejeO4dQYng93HTU5t8UJYgRNQjE+QaA2l3OMThcZbq79P
         0uX4i8MyDOaHKgvwEheN/ygDkCv3kzwip94aw3BkbWDWITsmP916KL1byL5a2B04NXk+
         8AlF0Tc7paKseabeepwZQ30YwniPwbl/1JxiXheLAds8HfHpfR4P8rUHX86uSQI1HPN+
         s43A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=oN3MGkYdo1Vzd3Kl0F3+7Ar5cGYbBsVawLnTwr/nf7M=;
        b=PzDIZ/A5Ef4JHl10nbUBr3ymrTxBjZCfrb17fVqIz3Pm5Dc7nEj14qOQkddK8IjMLe
         l+M1imxQGodfQffQBhMs6nRUBCB9HMCYQTqckkpgQunONf+6vXdna8BkDtScvox6+FKN
         o63YzoMyt4l890AxnMeBCzBvQWy0K6ArhkXthWITmywcSqmHurwf0b5m/zwbRUrxioyB
         ftVFbPL+VpG88Fl1k7P2I2Ag8VlX/9fI8PirBWROsMa93+fpR2WRmkPAxS4/3pr7nNVe
         2O6v7IUbWuDg8qE0QouMrHgjJeGiLPtWfrVqLzGsJsEp3Nnexi9Y2xqvNbSdcxahlN1g
         DhFA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x17-v6si2592560qka.105.2018.08.14.07.45.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 14 Aug 2018 07:45:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44637 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fpaZR-0006DY-3s
	for alex.bennee@linaro.org; Tue, 14 Aug 2018 10:45:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48627)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fpaYv-0005v6-To
	for qemu-arm@nongnu.org; Tue, 14 Aug 2018 10:44:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fpaYu-0004Aq-Ti
	for qemu-arm@nongnu.org; Tue, 14 Aug 2018 10:44:45 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:44386)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fpaYu-0004AR-M7; Tue, 14 Aug 2018 10:44:44 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fpaYt-00070p-IR; Tue, 14 Aug 2018 15:44:43 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 14 Aug 2018 15:44:33 +0100
Message-Id: <20180814144436.679-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180814144436.679-1-peter.maydell@linaro.org>
References: <20180814144436.679-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 5/8] hw/display/bcm2835_fb: Abstract out
 calculation of pitch, size
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
X-TUID: LOy89J4Gdwqc

Abstract out the calculation of the pitch and size of the
framebuffer into functions that operate on the BCM2835FBConfig
struct -- these are about to get a little more complicated
when we add support for virtual and physical sizes differing.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/display/bcm2835_fb.h | 22 ++++++++++++++++++++++
 hw/display/bcm2835_fb.c         |  6 +++---
 hw/misc/bcm2835_property.c      |  4 ++--
 3 files changed, 27 insertions(+), 5 deletions(-)

diff --git a/include/hw/display/bcm2835_fb.h b/include/hw/display/bcm2835_fb.h
index 374de546121..95bcec7fe33 100644
--- a/include/hw/display/bcm2835_fb.h
+++ b/include/hw/display/bcm2835_fb.h
@@ -52,4 +52,26 @@ typedef struct {
 
 void bcm2835_fb_reconfigure(BCM2835FBState *s, BCM2835FBConfig *newconfig);
 
+/**
+ * bcm2835_fb_get_pitch: return number of bytes per line of the framebuffer
+ * @config: configuration info for the framebuffer
+ *
+ * Return the number of bytes per line of the framebuffer, ie the number
+ * that must be added to a pixel address to get the address of the pixel
+ * directly below it on screen.
+ */
+static inline uint32_t bcm2835_fb_get_pitch(BCM2835FBConfig *config)
+{
+    return config->xres * (config->bpp >> 3);
+}
+
+/**
+ * bcm2835_fb_get_size: return total size of framebuffer in bytes
+ * @config: configuration info for the framebuffer
+ */
+static inline uint32_t bcm2835_fb_get_size(BCM2835FBConfig *config)
+{
+    return config->yres * bcm2835_fb_get_pitch(config);
+}
+
 #endif
diff --git a/hw/display/bcm2835_fb.c b/hw/display/bcm2835_fb.c
index d95686c74c8..a6c0a0cc942 100644
--- a/hw/display/bcm2835_fb.c
+++ b/hw/display/bcm2835_fb.c
@@ -139,7 +139,7 @@ static void fb_update_display(void *opaque)
         return;
     }
 
-    src_width = s->config.xres * (s->config.bpp >> 3);
+    src_width = bcm2835_fb_get_pitch(&s->config);
     dest_width = s->config.xres;
 
     switch (surface_bits_per_pixel(surface)) {
@@ -204,8 +204,8 @@ static void bcm2835_fb_mbox_push(BCM2835FBState *s, uint32_t value)
 
     /* TODO - Manage properly virtual resolution */
 
-    pitch = s->config.xres * (s->config.bpp >> 3);
-    size = s->config.yres * pitch;
+    pitch = bcm2835_fb_get_pitch(&s->config);
+    size = bcm2835_fb_get_size(&s->config);
 
     stl_le_phys(&s->dma_as, value + 16, pitch);
     stl_le_phys(&s->dma_as, value + 32, s->config.base);
diff --git a/hw/misc/bcm2835_property.c b/hw/misc/bcm2835_property.c
index df0645d1b84..c8c4979bd26 100644
--- a/hw/misc/bcm2835_property.c
+++ b/hw/misc/bcm2835_property.c
@@ -146,7 +146,7 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
         case 0x00040001: /* Allocate buffer */
             stl_le_phys(&s->dma_as, value + 12, fbconfig.base);
             stl_le_phys(&s->dma_as, value + 16,
-                        fbconfig.xres * fbconfig.yres * fbconfig.bpp / 8);
+                        bcm2835_fb_get_size(&fbconfig));
             resplen = 8;
             break;
         case 0x00048001: /* Release buffer */
@@ -210,7 +210,7 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
             break;
         case 0x00040008: /* Get pitch */
             stl_le_phys(&s->dma_as, value + 12,
-                        fbconfig.xres * fbconfig.bpp / 8);
+                        bcm2835_fb_get_pitch(&fbconfig));
             resplen = 4;
             break;
         case 0x00040009: /* Get virtual offset */
-- 
2.18.0

