Received: by 10.25.208.194 with SMTP id h185csp93127lfg;
        Thu, 21 Apr 2016 03:44:01 -0700 (PDT)
X-Received: by 10.140.251.195 with SMTP id w186mr17150697qhc.32.1461235441681;
        Thu, 21 Apr 2016 03:44:01 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o98si246269qge.88.2016.04.21.03.44.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Apr 2016 03:44:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38845 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1atC5Z-0005aS-6v
	for alex.bennee@linaro.org; Thu, 21 Apr 2016 06:44:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36984)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sylvain@iCladMac.local>) id 1atC3p-0002os-Me
	for qemu-devel@nongnu.org; Thu, 21 Apr 2016 06:42:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sylvain@iCladMac.local>) id 1atC3o-0004KR-GI
	for qemu-devel@nongnu.org; Thu, 21 Apr 2016 06:42:13 -0400
Received: from plr75-1-82-226-218-68.fbx.proxad.net ([82.226.218.68]:49886
	helo=iCladMac.local) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sylvain@iCladMac.local>)
	id 1atC3j-0004JQ-0x; Thu, 21 Apr 2016 06:42:07 -0400
Received: by iCladMac.local (Postfix, from userid 501)
	id C0FB51F38F0C; Thu, 21 Apr 2016 12:42:01 +0200 (CEST)
From: Sylvain Garrigues <sylvain@sylvaingarrigues.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org
Date: Thu, 21 Apr 2016 12:41:46 +0200
Message-Id: <1461235306-3393-1-git-send-email-sylvain@sylvaingarrigues.com>
X-Mailer: git-send-email 2.8.1
X-detected-operating-system: by eggs.gnu.org: Mac OS X  [generic]
X-Received-From: 82.226.218.68
Subject: [Qemu-devel] [PATCH] bcm2835_property: use cached values when
 querying framebuffer
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Sylvain Garrigues <sylvain@sylvaingarrigues.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7YiWwNC53T3r

As the framebuffer settings are copied into the result message before it is reconfigured, inconsistent behavior can happen when, for instance, you set with a sinle message the width, height, and depth, and ask at the same time to allocate the buffer and get the pitch and the size.

In this case, the reported pitch and size would be incorrect as they were computed with the initial values of width, height and depth, not the ones the client requested.

Signed-off-by: Sylvain Garrigues <sylvain@sylvaingarrigues.com>
---
 hw/misc/bcm2835_property.c | 31 ++++++++++++++++++++++---------
 1 file changed, 22 insertions(+), 9 deletions(-)

diff --git a/hw/misc/bcm2835_property.c b/hw/misc/bcm2835_property.c
index 530411f..0102144 100644
--- a/hw/misc/bcm2835_property.c
+++ b/hw/misc/bcm2835_property.c
@@ -21,6 +21,7 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
     int n;
     uint32_t offset, length, color;
     uint32_t xres, yres, xoffset, yoffset, bpp, pixo, alpha;
+    uint32_t tmp_xres, tmp_yres, tmp_xoffset, tmp_yoffset, tmp_bpp, tmp_pixo, tmp_alpha;
     uint32_t *newxres = NULL, *newyres = NULL, *newxoffset = NULL,
         *newyoffset = NULL, *newbpp = NULL, *newpixo = NULL, *newalpha = NULL;
 
@@ -139,7 +140,10 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
 
         case 0x00040001: /* Allocate buffer */
             stl_le_phys(&s->dma_as, value + 12, s->fbdev->base);
-            stl_le_phys(&s->dma_as, value + 16, s->fbdev->size);
+            tmp_xres = newxres != NULL ? *newxres : s->fbdev->xres;
+            tmp_yres = newyres != NULL ? *newyres : s->fbdev->yres;
+            tmp_bpp = newbpp != NULL ? *newbpp : s->fbdev->bpp;
+            stl_le_phys(&s->dma_as, value + 16, tmp_xres * tmp_yres * (tmp_bpp >> 3));
             resplen = 8;
             break;
         case 0x00048001: /* Release buffer */
@@ -150,8 +154,10 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
             break;
         case 0x00040003: /* Get display width/height */
         case 0x00040004:
-            stl_le_phys(&s->dma_as, value + 12, s->fbdev->xres);
-            stl_le_phys(&s->dma_as, value + 16, s->fbdev->yres);
+            tmp_xres = newxres != NULL ? *newxres : s->fbdev->xres;
+            tmp_yres = newyres != NULL ? *newyres : s->fbdev->yres;
+            stl_le_phys(&s->dma_as, value + 12, tmp_xres);
+            stl_le_phys(&s->dma_as, value + 16, tmp_yres);
             resplen = 8;
             break;
         case 0x00044003: /* Test display width/height */
@@ -167,7 +173,8 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
             resplen = 8;
             break;
         case 0x00040005: /* Get depth */
-            stl_le_phys(&s->dma_as, value + 12, s->fbdev->bpp);
+            tmp_bpp = newbpp != NULL ? *newbpp : s->fbdev->bpp;
+            stl_le_phys(&s->dma_as, value + 12, tmp_bpp);
             resplen = 4;
             break;
         case 0x00044005: /* Test depth */
@@ -179,7 +186,8 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
             resplen = 4;
             break;
         case 0x00040006: /* Get pixel order */
-            stl_le_phys(&s->dma_as, value + 12, s->fbdev->pixo);
+            tmp_pixo = newpixo != NULL ? *newpixo : s->fbdev->pixo;
+            stl_le_phys(&s->dma_as, value + 12, tmp_pixo);
             resplen = 4;
             break;
         case 0x00044006: /* Test pixel order */
@@ -191,7 +199,8 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
             resplen = 4;
             break;
         case 0x00040007: /* Get alpha */
-            stl_le_phys(&s->dma_as, value + 12, s->fbdev->alpha);
+            tmp_alpha = newalpha != NULL ? *newalpha : s->fbdev->alpha;
+            stl_le_phys(&s->dma_as, value + 12, tmp_alpha);
             resplen = 4;
             break;
         case 0x00044007: /* Test pixel alpha */
@@ -203,12 +212,16 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
             resplen = 4;
             break;
         case 0x00040008: /* Get pitch */
-            stl_le_phys(&s->dma_as, value + 12, s->fbdev->pitch);
+            tmp_xres = newxres != NULL ? *newxres : s->fbdev->xres;
+            tmp_bpp = newbpp != NULL ? *newbpp : s->fbdev->bpp;
+            stl_le_phys(&s->dma_as, value + 12, tmp_xres * (tmp_bpp >> 3));
             resplen = 4;
             break;
         case 0x00040009: /* Get virtual offset */
-            stl_le_phys(&s->dma_as, value + 12, s->fbdev->xoffset);
-            stl_le_phys(&s->dma_as, value + 16, s->fbdev->yoffset);
+            tmp_xoffset = newxoffset != NULL ? *newxoffset : s->fbdev->xoffset;
+            tmp_yoffset = newyoffset != NULL ? *newyoffset : s->fbdev->yoffset;
+            stl_le_phys(&s->dma_as, value + 12, tmp_xoffset);
+            stl_le_phys(&s->dma_as, value + 16, tmp_yoffset);
             resplen = 8;
             break;
         case 0x00044009: /* Test virtual offset */
-- 
2.8.1

