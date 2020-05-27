Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id t6sm2202626wma.4.2020.05.27.03.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2020 03:05:50 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 128271FF8C;
	Wed, 27 May 2020 11:05:47 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Bug 1880225 <1880225@bugs.launchpad.net>,
	Richard Henderson <richard.henderson@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Riku Voipio <riku.voipio@iki.fi>,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH  v1 2/3] linux-user: deal with address wrap for ARM_COMMPAGE on 32 bit
Date: Wed, 27 May 2020 11:05:45 +0100
Message-Id: <20200527100546.29297-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200527100546.29297-1-alex.bennee@linaro.org>
References: <20200527100546.29297-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: hpdEtz2ALjU2

We rely on the pointer to wrap when accessing the high address of the
COMMPAGE so it lands somewhere reasonable. However on 32 bit hosts we
cannot afford just to map the entire 4gb address range. The old mmap
trial and error code handled this by just checking we could map both
the guest_base and the computed COMMPAGE address.

We can't just manipulate loadaddr to get what we want so we introduce
an offset which pgb_find_hole can apply when looking for a gap for
guest_base that ensures there is space left to map the COMMPAGE
afterwards.

This is arguably a little inefficient for the one 32 bit
value (kuser_helper_version) we need to keep there given all the
actual code entries are picked up during the translation phase.

Fixes: ee94743034b
Bug: https://bugs.launchpad.net/qemu/+bug/1880225
Cc: Bug 1880225 <1880225@bugs.launchpad.net>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>
---
 linux-user/elfload.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index d6027867a1a..31defce95b5 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -2145,7 +2145,7 @@ static uintptr_t pgd_find_hole_fallback(uintptr_t guest_size, uintptr_t brk, lon
 
 /* Return value for guest_base, or -1 if no hole found. */
 static uintptr_t pgb_find_hole(uintptr_t guest_loaddr, uintptr_t guest_size,
-                               long align)
+                               long align, uintptr_t offset)
 {
     GSList *maps, *iter;
     uintptr_t this_start, this_end, next_start, brk;
@@ -2171,7 +2171,7 @@ static uintptr_t pgb_find_hole(uintptr_t guest_loaddr, uintptr_t guest_size,
 
         this_end = ((MapInfo *)iter->data)->start;
         next_start = ((MapInfo *)iter->data)->end;
-        align_start = ROUND_UP(this_start, align);
+        align_start = ROUND_UP(this_start + offset, align);
 
         /* Skip holes that are too small. */
         if (align_start >= this_end) {
@@ -2221,6 +2221,7 @@ static void pgb_static(const char *image_name, abi_ulong orig_loaddr,
 {
     uintptr_t loaddr = orig_loaddr;
     uintptr_t hiaddr = orig_hiaddr;
+    uintptr_t offset = 0;
     uintptr_t addr;
 
     if (hiaddr != orig_hiaddr) {
@@ -2234,18 +2235,19 @@ static void pgb_static(const char *image_name, abi_ulong orig_loaddr,
     if (ARM_COMMPAGE) {
         /*
          * Extend the allocation to include the commpage.
-         * For a 64-bit host, this is just 4GiB; for a 32-bit host,
-         * the address arithmetic will wrap around, but the difference
-         * will produce the correct allocation size.
+         * For a 64-bit host, this is just 4GiB; for a 32-bit host we
+         * need to ensure there is space bellow the guest_base so we
+         * can map the commpage in the place needed when the address
+         * arithmetic wraps around.
          */
         if (sizeof(uintptr_t) == 8 || loaddr >= 0x80000000u) {
             hiaddr = (uintptr_t)4 << 30;
         } else {
-            loaddr = ARM_COMMPAGE & -align;
+            offset = (128 * KiB);
         }
     }
 
-    addr = pgb_find_hole(loaddr, hiaddr - loaddr, align);
+    addr = pgb_find_hole(loaddr, hiaddr - loaddr, align, offset);
     if (addr == -1) {
         /*
          * If ARM_COMMPAGE, there *might* be a non-consecutive allocation
@@ -2280,7 +2282,7 @@ static void pgb_dynamic(const char *image_name, long align)
          * just above that, and maximises the positive guest addresses.
          */
         commpage = ARM_COMMPAGE & -align;
-        addr = pgb_find_hole(commpage, -commpage, align);
+        addr = pgb_find_hole(commpage, -commpage, align, 0);
         assert(addr != -1);
         guest_base = addr;
     }
-- 
2.20.1
