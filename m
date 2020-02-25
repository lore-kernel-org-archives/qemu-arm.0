Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1094475lfg;
        Mon, 24 Feb 2020 19:18:13 -0800 (PST)
X-Google-Smtp-Source: APXvYqxNbR2sDWFSPq/IDJSESkzOm9IalmdjqaBW3A2xyTj1uHBzvT2NiFbM72A3g1uPjqnmbpDx
X-Received: by 2002:a05:620a:24d:: with SMTP id q13mr46470410qkn.99.1582600693730;
        Mon, 24 Feb 2020 19:18:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582600693; cv=none;
        d=google.com; s=arc-20160816;
        b=QhE8MKv74YzMZsAlergddaGyjdsbBBfzKBLgh/eAwUDm4NR6i1s0lfxeE1Q/vr3Xup
         oCl0JSZ86KvdUxP7dwX0lq8JGm73Q9ekoLZXxeEg253ulQqqszKuhiQanezMYQXtsf4L
         004kL+62lo50QVqb9ZwABNp7jJ2xkdsC2VFERRFEzYbxHds+YBnFizIK4cHNwTrYNPkS
         r9kcCtiukqwjIQQvMqB7K46xie7EQd7LDbFgxgFO/QW6ToOv13vk4d7zgkVWRcnj7Api
         RaltquNqCvZoKoW/8WHom/jIehzUddGK03l6sZf947xRZwVkn1SzuFja9mw5MjHSzi3P
         AWVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=DU27Bkp1EAeAHb9U8LmR6pdGFxRI9NTba4dzCu3wrt0=;
        b=uHxqQvfvNJKMYx/Apjbt5cvfK9OPgiZfmMWJ//YORvsZVazAiUqIsLv+QgJcviLikn
         iXEpo7xqyY3PJe6JQUKMj4/7bsv6NmK8g4jDj6scJpqgJG+itD4qe3Udm7oM248FLx7v
         LjBQ3RRx5BWTA/IMdN/scAXI1nYRqRwlKN/FKxTH8/Xt29nFRClnrgEq0JwvO9xAUt1v
         nx6Hpl8yjinOmKVRDV3h+WqNk+II6IJ0WsLb5czbuelCz0cttKz7oYQt3v8QCRu5OS/z
         /2BOKmJVJ2msklvsHumTYdhNJ+G4CLxebcla1Z9xBj5BsuxCcGFpKNDc5V292ZGwON7P
         4Wnw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HRRRyDdQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h55si6651097qtb.87.2020.02.24.19.18.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2020 19:18:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HRRRyDdQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6Qjd-0007wb-6a
	for alex.bennee@linaro.org; Mon, 24 Feb 2020 22:18:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46408)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j6Qft-0002x6-Vj
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 22:14:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j6Qfs-0005Lm-7F
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 22:14:21 -0500
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:46171)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j6Qfr-0005LI-Vp
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 22:14:20 -0500
Received: by mail-pg1-x534.google.com with SMTP id y30so6135254pga.13
 for <qemu-arm@nongnu.org>; Mon, 24 Feb 2020 19:14:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DU27Bkp1EAeAHb9U8LmR6pdGFxRI9NTba4dzCu3wrt0=;
 b=HRRRyDdQTRP+IbGGsMgnpXinkO9Dgd+6mo8G9FvTBBdLJjxAUbGd13aIZ0NbLY1M4q
 QXxlUT37USTIPRmhXaWVzuLSOTq2935aJP5IHpG5NY/P1d64oopZksemHWWuvr01NXJx
 +2vHItKZ4dbPqlDMx7tIkm6vKcVFpAiBDhgyNqFWz//9NyCyoyPLzhUGmv2qOB81tit/
 XoJqPIYwrtdXZx16U7tCRaogumbFjFSIcPb0iDCJ9VHWALukgsKoO6owcDkq292QaPIB
 qNwpavpLWzUfUzlCiHcTVTT1a7y54mly/PNe+PxOk3P/G/w3/WJOiXrIE/pbx0TyOjfr
 lhxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DU27Bkp1EAeAHb9U8LmR6pdGFxRI9NTba4dzCu3wrt0=;
 b=ExjVG3Ch6ZbBTwZlwvD8Xf1Ho8r7dmLqoqWvMdvkgQycVw41MVl2sQmHDNJyJg5/Op
 IUYEG+GhhjVb7wpBpNeZp7WTOCIWQTMYOuDpkurmneKL1k4lPwfdVtxXUYEKwzhwT+uM
 aydOEVNf2yhGTWbmHu2eL0JQ9DuUZcHp7fXuB3u6Qil+BnJVu0MR7mMqmLhUE3cnvs6b
 E4TAPUyxrukyEyLCPUtIM+1x3mMzKZJlHWgiIicVEgHzEgXpYD32PJwc2VK/27Bp/B03
 quiADMBaYHsFjB/oRpo3spqPpxO0npLT+AM3i8Hnzz2LqLVjio9GfQWpGu9zimPNM27S
 uI9A==
X-Gm-Message-State: APjAAAVNG7yTyLvbwS+IRoXF/oTlXK+poABYma8nGofLLtfeQTuHh4np
 Px6A00+plZEsXhpIjOYI3oW1xw==
X-Received: by 2002:a63:cf4f:: with SMTP id b15mr32776926pgj.287.1582600458823; 
 Mon, 24 Feb 2020 19:14:18 -0800 (PST)
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net.
 [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id q66sm14975242pfq.27.2020.02.24.19.14.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2020 19:14:18 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/8] target/arm: Move helper_dc_zva to helper-a64.c
Date: Mon, 24 Feb 2020 19:14:10 -0800
Message-Id: <20200225031414.15649-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200225031414.15649-1-richard.henderson@linaro.org>
References: <20200225031222.15434-1-richard.henderson@linaro.org>
 <20200225031414.15649-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::534
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: f/7RDYX0xYBl

This is an aarch64-only function.  Move it out of the shared file.
This patch is code movement only.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-a64.h |  1 +
 target/arm/helper.h     |  1 -
 target/arm/helper-a64.c | 91 ++++++++++++++++++++++++++++++++++++++++
 target/arm/op_helper.c  | 93 -----------------------------------------
 4 files changed, 92 insertions(+), 94 deletions(-)

diff --git a/target/arm/helper-a64.h b/target/arm/helper-a64.h
index a915c1247f..b1a5935f61 100644
--- a/target/arm/helper-a64.h
+++ b/target/arm/helper-a64.h
@@ -90,6 +90,7 @@ DEF_HELPER_2(advsimd_f16touinth, i32, f16, ptr)
 DEF_HELPER_2(sqrt_f16, f16, f16, ptr)
 
 DEF_HELPER_2(exception_return, void, env, i64)
+DEF_HELPER_2(dc_zva, void, env, i64)
 
 DEF_HELPER_FLAGS_3(pacia, TCG_CALL_NO_WG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_3(pacib, TCG_CALL_NO_WG, i64, env, i64, i64)
diff --git a/target/arm/helper.h b/target/arm/helper.h
index fcbf504121..72eb9e6a1a 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -559,7 +559,6 @@ DEF_HELPER_FLAGS_3(crypto_sm4ekey, TCG_CALL_NO_RWG, void, ptr, ptr, ptr)
 
 DEF_HELPER_FLAGS_3(crc32, TCG_CALL_NO_RWG_SE, i32, i32, i32, i32)
 DEF_HELPER_FLAGS_3(crc32c, TCG_CALL_NO_RWG_SE, i32, i32, i32, i32)
-DEF_HELPER_2(dc_zva, void, env, i64)
 
 DEF_HELPER_FLAGS_5(gvec_qrdmlah_s16, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
index 95e9e879ca..c0a40c5fa9 100644
--- a/target/arm/helper-a64.c
+++ b/target/arm/helper-a64.c
@@ -18,6 +18,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "cpu.h"
 #include "exec/gdbstub.h"
 #include "exec/helper-proto.h"
@@ -1109,4 +1110,94 @@ uint32_t HELPER(sqrt_f16)(uint32_t a, void *fpstp)
     return float16_sqrt(a, s);
 }
 
+void HELPER(dc_zva)(CPUARMState *env, uint64_t vaddr_in)
+{
+    /*
+     * Implement DC ZVA, which zeroes a fixed-length block of memory.
+     * Note that we do not implement the (architecturally mandated)
+     * alignment fault for attempts to use this on Device memory
+     * (which matches the usual QEMU behaviour of not implementing either
+     * alignment faults or any memory attribute handling).
+     */
 
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
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index af3020b78f..eb0de080f1 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -17,7 +17,6 @@
  * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  */
 #include "qemu/osdep.h"
-#include "qemu/units.h"
 #include "qemu/log.h"
 #include "qemu/main-loop.h"
 #include "cpu.h"
@@ -936,95 +935,3 @@ uint32_t HELPER(ror_cc)(CPUARMState *env, uint32_t x, uint32_t i)
         return ((uint32_t)x >> shift) | (x << (32 - shift));
     }
 }
-
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
-- 
2.20.1

