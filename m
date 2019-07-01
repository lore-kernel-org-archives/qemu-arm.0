Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2653237wru;
        Mon, 1 Jul 2019 06:26:06 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxWkF5cERuggjVkoZy7GF0Mzdi3De4ky2KcswwtRF1y/YaT5ThZxRZm+YanZ+QTMinfttOm
X-Received: by 2002:a0c:b12b:: with SMTP id q40mr22215327qvc.0.1561987565970;
        Mon, 01 Jul 2019 06:26:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561987565; cv=none;
        d=google.com; s=arc-20160816;
        b=woT7Of21z7k23x0mj+CTxLOs2zv9oNpbQVpDUqHAQ4P9/RhndUA8NcEcQZtY6cnX7S
         U2wARGKM13In5N6UfskN7azCehx/788wxGDxUSQJCHehDoxMQZWA/nC39PC6rJPLeTGo
         EINb+tWQjBe28Lmz1mmgnRcF2SLdv6hWmNfQLRUI2cLaajaVrxBMh/nhA4oD/41XDfHo
         6FvgNVFf7CCMbo2B8IC1xpoltX++/CPmTJ1oJ8ncybxiRQVvNJZ6uwbiBACKsbA2bFJA
         0RyAESALgXKeARoUbWx79vbaWpCm0OFC0ocrKQVVwxDu4fxMQy8H9uuCiXrjZBHHvDYg
         9t1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=JAcKeDS8mBtCglxSZ7DyfTbNQ/0+Tx6OQjpoXO/irtA=;
        b=zy7J+zPRPpBoLpScWxVQjKtmX/pLK3BApQXVyzkk6deXF1mFCWWXTgv0HaICgJ2Hln
         WsCyRRWP6BRDTdqbiLyXleazfwDs9GlqeoSW1lL1u7LKmpLHj0MHV3TVozj1Op2bapOJ
         TkuJ0X3voRfD/saR+YPWIx9JklB5Qkab4WS1Sya+g+L8OMAqg4BTZ7AmoVO1v9i5Y3r8
         S4yyh8XJXI8lZSxK7kLQYDlkDSjEuHz/1zPyyubRgYoHaSb2P1fv8Bonqf7Zr4kE4B2K
         VZv5wnIdJlCC7pAxDL3Fq3ouMy6mEWcDXT2DXPN4GKk2KJxZqfI+2G13pYxujSSUDa21
         vMng==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id d6si8138510qkb.46.2019.07.01.06.26.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jul 2019 06:26:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 16AE6811D8;
	Mon,  1 Jul 2019 13:26:05 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.170])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5DF0617DDD;
	Mon,  1 Jul 2019 13:26:02 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Yang Zhong <yang.zhong@intel.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Rob Bradford <robert.bradford@intel.com>,
	Samuel Ortiz <sameo@linux.intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andrew Jones <drjones@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v3 09/27] target/arm: Move the DC ZVA helper into op_helper
Date: Mon,  1 Jul 2019 15:24:58 +0200
Message-Id: <20190701132516.26392-10-philmd@redhat.com>
In-Reply-To: <20190701132516.26392-1-philmd@redhat.com>
References: <20190701132516.26392-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Mon, 01 Jul 2019 13:26:05 +0000 (UTC)
X-TUID: dlcuh9PNaTgQ

From: Samuel Ortiz <sameo@linux.intel.com>

Those helpers are a software implementation of the ARM v8 memory zeroing
op code. They should be moved to the op helper file, which is going to
eventually be built only when TCG is enabled.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Robert Bradford <robert.bradford@intel.com>
Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
[PMD: Rebased]
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/arm/helper.c    | 92 -----------------------------------------
 target/arm/op_helper.c | 93 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 93 insertions(+), 92 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index c77ed85215..a87fda9191 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -13308,98 +13308,6 @@ bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 #endif
 }
 
-void HELPER(dc_zva)(CPUARMState *env, uint64_t vaddr_in)
-{
-    /*
-     * Implement DC ZVA, which zeroes a fixed-length block of memory.
-     * Note that we do not implement the (architecturally mandated)
-     * alignment fault for attempts to use this on Device memory
-     * (which matches the usual QEMU behaviour of not implementing either
-     * alignment faults or any memory attribute handling).
-     */
-
-    ARMCPU *cpu = env_archcpu(env);
-    uint64_t blocklen = 4 << cpu->dcz_blocksize;
-    uint64_t vaddr = vaddr_in & ~(blocklen - 1);
-
-#ifndef CONFIG_USER_ONLY
-    {
-        /*
-         * Slightly awkwardly, QEMU's TARGET_PAGE_SIZE may be less than
-         * the block size so we might have to do more than one TLB lookup.
-         * We know that in fact for any v8 CPU the page size is at least 4K
-         * and the block size must be 2K or less, but TARGET_PAGE_SIZE is only
-         * 1K as an artefact of legacy v5 subpage support being present in the
-         * same QEMU executable. So in practice the hostaddr[] array has
-         * two entries, given the current setting of TARGET_PAGE_BITS_MIN.
-         */
-        int maxidx = DIV_ROUND_UP(blocklen, TARGET_PAGE_SIZE);
-        void *hostaddr[DIV_ROUND_UP(2 * KiB, 1 << TARGET_PAGE_BITS_MIN)];
-        int try, i;
-        unsigned mmu_idx = cpu_mmu_index(env, false);
-        TCGMemOpIdx oi = make_memop_idx(MO_UB, mmu_idx);
-
-        assert(maxidx <= ARRAY_SIZE(hostaddr));
-
-        for (try = 0; try < 2; try++) {
-
-            for (i = 0; i < maxidx; i++) {
-                hostaddr[i] = tlb_vaddr_to_host(env,
-                                                vaddr + TARGET_PAGE_SIZE * i,
-                                                1, mmu_idx);
-                if (!hostaddr[i]) {
-                    break;
-                }
-            }
-            if (i == maxidx) {
-                /*
-                 * If it's all in the TLB it's fair game for just writing to;
-                 * we know we don't need to update dirty status, etc.
-                 */
-                for (i = 0; i < maxidx - 1; i++) {
-                    memset(hostaddr[i], 0, TARGET_PAGE_SIZE);
-                }
-                memset(hostaddr[i], 0, blocklen - (i * TARGET_PAGE_SIZE));
-                return;
-            }
-            /*
-             * OK, try a store and see if we can populate the tlb. This
-             * might cause an exception if the memory isn't writable,
-             * in which case we will longjmp out of here. We must for
-             * this purpose use the actual register value passed to us
-             * so that we get the fault address right.
-             */
-            helper_ret_stb_mmu(env, vaddr_in, 0, oi, GETPC());
-            /* Now we can populate the other TLB entries, if any */
-            for (i = 0; i < maxidx; i++) {
-                uint64_t va = vaddr + TARGET_PAGE_SIZE * i;
-                if (va != (vaddr_in & TARGET_PAGE_MASK)) {
-                    helper_ret_stb_mmu(env, va, 0, oi, GETPC());
-                }
-            }
-        }
-
-        /*
-         * Slow path (probably attempt to do this to an I/O device or
-         * similar, or clearing of a block of code we have translations
-         * cached for). Just do a series of byte writes as the architecture
-         * demands. It's not worth trying to use a cpu_physical_memory_map(),
-         * memset(), unmap() sequence here because:
-         *  + we'd need to account for the blocksize being larger than a page
-         *  + the direct-RAM access case is almost always going to be dealt
-         *    with in the fastpath code above, so there's no speed benefit
-         *  + we would have to deal with the map returning NULL because the
-         *    bounce buffer was in use
-         */
-        for (i = 0; i < blocklen; i++) {
-            helper_ret_stb_mmu(env, vaddr + i, 0, oi, GETPC());
-        }
-    }
-#else
-    memset(g2h(vaddr), 0, blocklen);
-#endif
-}
-
 /* Note that signed overflow is undefined in C.  The following routines are
    careful to use unsigned types where modulo arithmetic is required.
    Failure to do so _will_ break on newer gcc.  */
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index b1952486c6..7c835d3ce7 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -17,6 +17,7 @@
  * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  */
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qemu/log.h"
 #include "qemu/main-loop.h"
 #include "cpu.h"
@@ -1325,3 +1326,95 @@ uint32_t HELPER(ror_cc)(CPUARMState *env, uint32_t x, uint32_t i)
         return ((uint32_t)x >> shift) | (x << (32 - shift));
     }
 }
+
+void HELPER(dc_zva)(CPUARMState *env, uint64_t vaddr_in)
+{
+    /*
+     * Implement DC ZVA, which zeroes a fixed-length block of memory.
+     * Note that we do not implement the (architecturally mandated)
+     * alignment fault for attempts to use this on Device memory
+     * (which matches the usual QEMU behaviour of not implementing either
+     * alignment faults or any memory attribute handling).
+     */
+
+    ARMCPU *cpu = env_archcpu(env);
+    uint64_t blocklen = 4 << cpu->dcz_blocksize;
+    uint64_t vaddr = vaddr_in & ~(blocklen - 1);
+
+#ifndef CONFIG_USER_ONLY
+    {
+        /*
+         * Slightly awkwardly, QEMU's TARGET_PAGE_SIZE may be less than
+         * the block size so we might have to do more than one TLB lookup.
+         * We know that in fact for any v8 CPU the page size is at least 4K
+         * and the block size must be 2K or less, but TARGET_PAGE_SIZE is only
+         * 1K as an artefact of legacy v5 subpage support being present in the
+         * same QEMU executable. So in practice the hostaddr[] array has
+         * two entries, given the current setting of TARGET_PAGE_BITS_MIN.
+         */
+        int maxidx = DIV_ROUND_UP(blocklen, TARGET_PAGE_SIZE);
+        void *hostaddr[DIV_ROUND_UP(2 * KiB, 1 << TARGET_PAGE_BITS_MIN)];
+        int try, i;
+        unsigned mmu_idx = cpu_mmu_index(env, false);
+        TCGMemOpIdx oi = make_memop_idx(MO_UB, mmu_idx);
+
+        assert(maxidx <= ARRAY_SIZE(hostaddr));
+
+        for (try = 0; try < 2; try++) {
+
+            for (i = 0; i < maxidx; i++) {
+                hostaddr[i] = tlb_vaddr_to_host(env,
+                                                vaddr + TARGET_PAGE_SIZE * i,
+                                                1, mmu_idx);
+                if (!hostaddr[i]) {
+                    break;
+                }
+            }
+            if (i == maxidx) {
+                /*
+                 * If it's all in the TLB it's fair game for just writing to;
+                 * we know we don't need to update dirty status, etc.
+                 */
+                for (i = 0; i < maxidx - 1; i++) {
+                    memset(hostaddr[i], 0, TARGET_PAGE_SIZE);
+                }
+                memset(hostaddr[i], 0, blocklen - (i * TARGET_PAGE_SIZE));
+                return;
+            }
+            /*
+             * OK, try a store and see if we can populate the tlb. This
+             * might cause an exception if the memory isn't writable,
+             * in which case we will longjmp out of here. We must for
+             * this purpose use the actual register value passed to us
+             * so that we get the fault address right.
+             */
+            helper_ret_stb_mmu(env, vaddr_in, 0, oi, GETPC());
+            /* Now we can populate the other TLB entries, if any */
+            for (i = 0; i < maxidx; i++) {
+                uint64_t va = vaddr + TARGET_PAGE_SIZE * i;
+                if (va != (vaddr_in & TARGET_PAGE_MASK)) {
+                    helper_ret_stb_mmu(env, va, 0, oi, GETPC());
+                }
+            }
+        }
+
+        /*
+         * Slow path (probably attempt to do this to an I/O device or
+         * similar, or clearing of a block of code we have translations
+         * cached for). Just do a series of byte writes as the architecture
+         * demands. It's not worth trying to use a cpu_physical_memory_map(),
+         * memset(), unmap() sequence here because:
+         *  + we'd need to account for the blocksize being larger than a page
+         *  + the direct-RAM access case is almost always going to be dealt
+         *    with in the fastpath code above, so there's no speed benefit
+         *  + we would have to deal with the map returning NULL because the
+         *    bounce buffer was in use
+         */
+        for (i = 0; i < blocklen; i++) {
+            helper_ret_stb_mmu(env, vaddr + i, 0, oi, GETPC());
+        }
+    }
+#else
+    memset(g2h(vaddr), 0, blocklen);
+#endif
+}
-- 
2.20.1
