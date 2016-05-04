Received: by 10.25.208.137 with SMTP id h131csp188703lfg;
        Wed, 4 May 2016 07:16:58 -0700 (PDT)
X-Received: by 10.194.22.8 with SMTP id z8mr8762890wje.102.1462371418914;
        Wed, 04 May 2016 07:16:58 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id vb7si5115701wjb.179.2016.05.04.07.16.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 04 May 2016 07:16:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48192 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1axxbV-0007KH-Fx
	for alex.bennee@linaro.org; Wed, 04 May 2016 10:16:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54096)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1axxbL-00071C-CS
	for qemu-arm@nongnu.org; Wed, 04 May 2016 10:16:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1axxb9-0006zZ-03
	for qemu-arm@nongnu.org; Wed, 04 May 2016 10:16:25 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:56723)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1axxb8-0006uU-Lh; Wed, 04 May 2016 10:16:18 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1axxaj-0007ON-R4; Wed, 04 May 2016 15:15:53 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Wed,  4 May 2016 15:15:51 +0100
Message-Id: <1462371352-21498-2-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1462371352-21498-1-git-send-email-peter.maydell@linaro.org>
References: <1462371352-21498-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 1/2] hw/display/blizzard: Expand out macros
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
X-TUID: 5tn0wl4nK71m

Now that we can assume that only depth 32 is possible, there's no need
for the COPY_PIXEL1 and PIXEL_TYPE macros, and the SKIP_PIXEL, COPY_PIXEL
and SWAP_WORDS macros aren't used at all. Expand out COPY_PIXEL1 and
PIXEL_TYPE where they are used, delete the unused macro definitions, and
expand out the uses of glue(name_prefix, DEPTH).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/display/blizzard_template.h | 55 +++++++++++++-----------------------------
 1 file changed, 17 insertions(+), 38 deletions(-)

diff --git a/hw/display/blizzard_template.h b/hw/display/blizzard_template.h
index bc38d7a..ed96092 100644
--- a/hw/display/blizzard_template.h
+++ b/hw/display/blizzard_template.h
@@ -18,21 +18,8 @@
  * with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
-#define SKIP_PIXEL(to)         (to += deststep)
-#if DEPTH == 32
-# define PIXEL_TYPE            uint32_t
-# define COPY_PIXEL(to, from)  do { *to = from; SKIP_PIXEL(to); } while (0)
-# define COPY_PIXEL1(to, from) (*to++ = from)
-#else
-# error unknown bit depth
-#endif
-
-#ifdef HOST_WORDS_BIGENDIAN
-# define SWAP_WORDS	1
-#endif
-
-static void glue(blizzard_draw_line16_, DEPTH)(PIXEL_TYPE *dest,
-                const uint16_t *src, unsigned int width)
+static void blizzard_draw_line16_32(uint32_t *dest,
+                                    const uint16_t *src, unsigned int width)
 {
     uint16_t data;
     unsigned int r, g, b;
@@ -45,12 +32,12 @@ static void glue(blizzard_draw_line16_, DEPTH)(PIXEL_TYPE *dest,
         data >>= 6;
         r = (data & 0x1f) << 3;
         data >>= 5;
-        COPY_PIXEL1(dest, glue(rgb_to_pixel, DEPTH)(r, g, b));
+        *dest++ = rgb_to_pixel32(r, g, b);
     }
 }
 
-static void glue(blizzard_draw_line24mode1_, DEPTH)(PIXEL_TYPE *dest,
-                const uint8_t *src, unsigned int width)
+static void blizzard_draw_line24mode1_32(uint32_t *dest,
+                                         const uint8_t *src, unsigned int width)
 {
     /* TODO: check if SDL 24-bit planes are not in the same format and
      * if so, use memcpy */
@@ -61,15 +48,15 @@ static void glue(blizzard_draw_line24mode1_, DEPTH)(PIXEL_TYPE *dest,
         r[0] = *src ++;
         r[1] = *src ++;
         b[0] = *src ++;
-        COPY_PIXEL1(dest, glue(rgb_to_pixel, DEPTH)(r[0], g[0], b[0]));
+        *dest++ = rgb_to_pixel32(r[0], g[0], b[0]);
         b[1] = *src ++;
         g[1] = *src ++;
-        COPY_PIXEL1(dest, glue(rgb_to_pixel, DEPTH)(r[1], g[1], b[1]));
+        *dest++ = rgb_to_pixel32(r[1], g[1], b[1]);
     }
 }
 
-static void glue(blizzard_draw_line24mode2_, DEPTH)(PIXEL_TYPE *dest,
-                const uint8_t *src, unsigned int width)
+static void blizzard_draw_line24mode2_32(uint32_t *dest,
+                                         const uint8_t *src, unsigned int width)
 {
     unsigned int r, g, b;
     const uint8_t *end = src + width;
@@ -78,24 +65,24 @@ static void glue(blizzard_draw_line24mode2_, DEPTH)(PIXEL_TYPE *dest,
         src ++;
         b = *src ++;
         g = *src ++;
-        COPY_PIXEL1(dest, glue(rgb_to_pixel, DEPTH)(r, g, b));
+        *dest++ = rgb_to_pixel32(r, g, b);
     }
 }
 
 /* No rotation */
-static blizzard_fn_t glue(blizzard_draw_fn_, DEPTH)[0x10] = {
+static blizzard_fn_t blizzard_draw_fn_32[0x10] = {
     NULL,
     /* RGB 5:6:5*/
-    (blizzard_fn_t) glue(blizzard_draw_line16_, DEPTH),
+    (blizzard_fn_t) blizzard_draw_line16_32,
     /* RGB 6:6:6 mode 1 */
-    (blizzard_fn_t) glue(blizzard_draw_line24mode1_, DEPTH),
+    (blizzard_fn_t) blizzard_draw_line24mode1_32,
     /* RGB 8:8:8 mode 1 */
-    (blizzard_fn_t) glue(blizzard_draw_line24mode1_, DEPTH),
+    (blizzard_fn_t) blizzard_draw_line24mode1_32,
     NULL, NULL,
     /* RGB 6:6:6 mode 2 */
-    (blizzard_fn_t) glue(blizzard_draw_line24mode2_, DEPTH),
+    (blizzard_fn_t) blizzard_draw_line24mode2_32,
     /* RGB 8:8:8 mode 2 */
-    (blizzard_fn_t) glue(blizzard_draw_line24mode2_, DEPTH),
+    (blizzard_fn_t) blizzard_draw_line24mode2_32,
     /* YUV 4:2:2 */
     NULL,
     /* YUV 4:2:0 */
@@ -104,15 +91,7 @@ static blizzard_fn_t glue(blizzard_draw_fn_, DEPTH)[0x10] = {
 };
 
 /* 90deg, 180deg and 270deg rotation */
-static blizzard_fn_t glue(blizzard_draw_fn_r_, DEPTH)[0x10] = {
+static blizzard_fn_t blizzard_draw_fn_r_32[0x10] = {
     /* TODO */
     [0 ... 0xf] = NULL,
 };
-
-#undef DEPTH
-#undef SKIP_PIXEL
-#undef COPY_PIXEL
-#undef COPY_PIXEL1
-#undef PIXEL_TYPE
-
-#undef SWAP_WORDS
-- 
1.9.1

