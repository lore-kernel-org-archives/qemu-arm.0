Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id m129sm1971380wmf.2.2020.05.27.03.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2020 03:05:47 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id DADDD1FF87;
	Wed, 27 May 2020 11:05:46 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Riku Voipio <riku.voipio@iki.fi>,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH  v1 1/3] linux-user: provide fallback pgd_find_hole for bare chroots
Date: Wed, 27 May 2020 11:05:44 +0100
Message-Id: <20200527100546.29297-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200527100546.29297-1-alex.bennee@linaro.org>
References: <20200527100546.29297-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 2lw6I5koS7Nn

When running QEMU out of a chroot environment we may not have access
to /proc/self/maps. As there is no other "official" way to introspect
our memory map we need to fall back to the original technique of
repeatedly trying to mmap an address range until we find one that
works.

Fortunately it's not quite as ugly as the original code given we
already re-factored the complications of dealing with the
ARM_COMMPAGE. We do make an attempt to skip over brk() which is about
the only concrete piece of information we have about the address map
at this moment.

Fixes: ee9474303
Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 linux-user/elfload.c | 48 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 01a9323a637..d6027867a1a 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -2099,6 +2099,50 @@ static void pgb_have_guest_base(const char *image_name, abi_ulong guest_loaddr,
     }
 }
 
+/**
+ * pgd_find_hole_fallback: potential mmap address
+ * @guest_size: size of available space
+ * @brk: location of break
+ * @align: memory alignment
+ *
+ * This is a fallback method for finding a hole in the host address
+ * space if we don't have the benefit of being able to access
+ * /proc/self/map. It can potentially take a very long time as we can
+ * only dumbly iterate up the host address space seeing if the
+ * allocation would work.
+ */
+static uintptr_t pgd_find_hole_fallback(uintptr_t guest_size, uintptr_t brk, long align)
+{
+    uintptr_t base;
+
+    /* Start at the bottom and work our way up */
+    base = mmap_min_addr;
+
+    while (true) {
+        uintptr_t align_start, end;
+        align_start = ROUND_UP(base, align);
+        end = align_start + guest_size;
+
+        /* if brk is anywhere in the range give ourselves some room to grow. */
+        if (align_start <= brk && brk < end) {
+            base += 16 * MiB;
+            continue;
+        } else if (align_start + guest_size < align_start) {
+            /* we have run out of space */
+            return -1;
+        } else {
+            int flags = MAP_ANONYMOUS | MAP_PRIVATE | MAP_NORESERVE | MAP_FIXED;
+            void * mmap_start = mmap((void *) align_start, guest_size,
+                                     PROT_NONE, flags, -1, 0);
+            if (mmap_start != MAP_FAILED) {
+                munmap((void *) align_start, guest_size);
+                return (uintptr_t) mmap_start;
+            }
+            base += qemu_host_page_size;
+        }
+    }
+}
+
 /* Return value for guest_base, or -1 if no hole found. */
 static uintptr_t pgb_find_hole(uintptr_t guest_loaddr, uintptr_t guest_size,
                                long align)
@@ -2114,6 +2158,10 @@ static uintptr_t pgb_find_hole(uintptr_t guest_loaddr, uintptr_t guest_size,
     /* Read brk after we've read the maps, which will malloc. */
     brk = (uintptr_t)sbrk(0);
 
+    if (!maps) {
+        return pgd_find_hole_fallback(guest_size, brk, align);
+    }
+
     /* The first hole is before the first map entry. */
     this_start = mmap_min_addr;
 
-- 
2.20.1
