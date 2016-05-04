Received: by 10.25.208.137 with SMTP id h131csp188945lfg;
        Wed, 4 May 2016 07:17:25 -0700 (PDT)
X-Received: by 10.194.172.228 with SMTP id bf4mr8867017wjc.123.1462371445565;
        Wed, 04 May 2016 07:17:25 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e18si5136556wjx.104.2016.05.04.07.17.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 04 May 2016 07:17:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48196 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1axxbv-00086E-UH
	for alex.bennee@linaro.org; Wed, 04 May 2016 10:17:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54187)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1axxbl-0007ku-Rw
	for qemu-arm@nongnu.org; Wed, 04 May 2016 10:17:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1axxbZ-00074t-Sr
	for qemu-arm@nongnu.org; Wed, 04 May 2016 10:16:52 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:56723)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1axxbZ-0006uU-Jd; Wed, 04 May 2016 10:16:45 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1axxak-0007OY-Bi; Wed, 04 May 2016 15:15:54 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Wed,  4 May 2016 15:15:52 +0100
Message-Id: <1462371352-21498-3-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1462371352-21498-1-git-send-email-peter.maydell@linaro.org>
References: <1462371352-21498-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 2/2] hw/display/blizzard: Remove
 blizzard_template.h
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
Cc: Eric Blake <eblake@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	Pooja Dhannawat <dhannawatpooja1@gmail.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UhtHhbms4Mf4

We no longer need to do the "multiply include this header" trick with
blizzard_template.h, and it is only used in a single .c file, so just
put its contents inline in blizzard.c.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/display/blizzard.c          | 79 +++++++++++++++++++++++++++++++++-
 hw/display/blizzard_template.h | 97 ------------------------------------------
 2 files changed, 77 insertions(+), 99 deletions(-)
 delete mode 100644 hw/display/blizzard_template.h

diff --git a/hw/display/blizzard.c b/hw/display/blizzard.c
index af0b51e..cbf07d1 100644
--- a/hw/display/blizzard.c
+++ b/hw/display/blizzard.c
@@ -925,8 +925,83 @@ static void blizzard_update_display(void *opaque)
     s->my[1] = 0;
 }
 
-#define DEPTH 32
-#include "blizzard_template.h"
+static void blizzard_draw_line16_32(uint32_t *dest,
+                                    const uint16_t *src, unsigned int width)
+{
+    uint16_t data;
+    unsigned int r, g, b;
+    const uint16_t *end = (const void *) src + width;
+    while (src < end) {
+        data = *src ++;
+        b = (data & 0x1f) << 3;
+        data >>= 5;
+        g = (data & 0x3f) << 2;
+        data >>= 6;
+        r = (data & 0x1f) << 3;
+        data >>= 5;
+        *dest++ = rgb_to_pixel32(r, g, b);
+    }
+}
+
+static void blizzard_draw_line24mode1_32(uint32_t *dest,
+                                         const uint8_t *src, unsigned int width)
+{
+    /* TODO: check if SDL 24-bit planes are not in the same format and
+     * if so, use memcpy */
+    unsigned int r[2], g[2], b[2];
+    const uint8_t *end = src + width;
+    while (src < end) {
+        g[0] = *src ++;
+        r[0] = *src ++;
+        r[1] = *src ++;
+        b[0] = *src ++;
+        *dest++ = rgb_to_pixel32(r[0], g[0], b[0]);
+        b[1] = *src ++;
+        g[1] = *src ++;
+        *dest++ = rgb_to_pixel32(r[1], g[1], b[1]);
+    }
+}
+
+static void blizzard_draw_line24mode2_32(uint32_t *dest,
+                                         const uint8_t *src, unsigned int width)
+{
+    unsigned int r, g, b;
+    const uint8_t *end = src + width;
+    while (src < end) {
+        r = *src ++;
+        src ++;
+        b = *src ++;
+        g = *src ++;
+        *dest++ = rgb_to_pixel32(r, g, b);
+    }
+}
+
+/* No rotation */
+static blizzard_fn_t blizzard_draw_fn_32[0x10] = {
+    NULL,
+    /* RGB 5:6:5*/
+    (blizzard_fn_t) blizzard_draw_line16_32,
+    /* RGB 6:6:6 mode 1 */
+    (blizzard_fn_t) blizzard_draw_line24mode1_32,
+    /* RGB 8:8:8 mode 1 */
+    (blizzard_fn_t) blizzard_draw_line24mode1_32,
+    NULL, NULL,
+    /* RGB 6:6:6 mode 2 */
+    (blizzard_fn_t) blizzard_draw_line24mode2_32,
+    /* RGB 8:8:8 mode 2 */
+    (blizzard_fn_t) blizzard_draw_line24mode2_32,
+    /* YUV 4:2:2 */
+    NULL,
+    /* YUV 4:2:0 */
+    NULL,
+    NULL, NULL, NULL, NULL, NULL, NULL,
+};
+
+/* 90deg, 180deg and 270deg rotation */
+static blizzard_fn_t blizzard_draw_fn_r_32[0x10] = {
+    /* TODO */
+    [0 ... 0xf] = NULL,
+};
 
 static const GraphicHwOps blizzard_ops = {
     .invalidate  = blizzard_invalidate_display,
diff --git a/hw/display/blizzard_template.h b/hw/display/blizzard_template.h
deleted file mode 100644
index ed96092..0000000
--- a/hw/display/blizzard_template.h
+++ /dev/null
@@ -1,97 +0,0 @@
-/*
- * QEMU Epson S1D13744/S1D13745 templates
- *
- * Copyright (C) 2008 Nokia Corporation
- * Written by Andrzej Zaborowski <andrew@openedhand.com>
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License as
- * published by the Free Software Foundation; either version 2 or
- * (at your option) version 3 of the License.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License along
- * with this program; if not, see <http://www.gnu.org/licenses/>.
- */
-
-static void blizzard_draw_line16_32(uint32_t *dest,
-                                    const uint16_t *src, unsigned int width)
-{
-    uint16_t data;
-    unsigned int r, g, b;
-    const uint16_t *end = (const void *) src + width;
-    while (src < end) {
-        data = *src ++;
-        b = (data & 0x1f) << 3;
-        data >>= 5;
-        g = (data & 0x3f) << 2;
-        data >>= 6;
-        r = (data & 0x1f) << 3;
-        data >>= 5;
-        *dest++ = rgb_to_pixel32(r, g, b);
-    }
-}
-
-static void blizzard_draw_line24mode1_32(uint32_t *dest,
-                                         const uint8_t *src, unsigned int width)
-{
-    /* TODO: check if SDL 24-bit planes are not in the same format and
-     * if so, use memcpy */
-    unsigned int r[2], g[2], b[2];
-    const uint8_t *end = src + width;
-    while (src < end) {
-        g[0] = *src ++;
-        r[0] = *src ++;
-        r[1] = *src ++;
-        b[0] = *src ++;
-        *dest++ = rgb_to_pixel32(r[0], g[0], b[0]);
-        b[1] = *src ++;
-        g[1] = *src ++;
-        *dest++ = rgb_to_pixel32(r[1], g[1], b[1]);
-    }
-}
-
-static void blizzard_draw_line24mode2_32(uint32_t *dest,
-                                         const uint8_t *src, unsigned int width)
-{
-    unsigned int r, g, b;
-    const uint8_t *end = src + width;
-    while (src < end) {
-        r = *src ++;
-        src ++;
-        b = *src ++;
-        g = *src ++;
-        *dest++ = rgb_to_pixel32(r, g, b);
-    }
-}
-
-/* No rotation */
-static blizzard_fn_t blizzard_draw_fn_32[0x10] = {
-    NULL,
-    /* RGB 5:6:5*/
-    (blizzard_fn_t) blizzard_draw_line16_32,
-    /* RGB 6:6:6 mode 1 */
-    (blizzard_fn_t) blizzard_draw_line24mode1_32,
-    /* RGB 8:8:8 mode 1 */
-    (blizzard_fn_t) blizzard_draw_line24mode1_32,
-    NULL, NULL,
-    /* RGB 6:6:6 mode 2 */
-    (blizzard_fn_t) blizzard_draw_line24mode2_32,
-    /* RGB 8:8:8 mode 2 */
-    (blizzard_fn_t) blizzard_draw_line24mode2_32,
-    /* YUV 4:2:2 */
-    NULL,
-    /* YUV 4:2:0 */
-    NULL,
-    NULL, NULL, NULL, NULL, NULL, NULL,
-};
-
-/* 90deg, 180deg and 270deg rotation */
-static blizzard_fn_t blizzard_draw_fn_r_32[0x10] = {
-    /* TODO */
-    [0 ... 0xf] = NULL,
-};
-- 
1.9.1

