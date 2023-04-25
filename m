Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp3716992ejm;
        Tue, 25 Apr 2023 12:34:38 -0700 (PDT)
X-Google-Smtp-Source: AKy350bSM0F6/5Z6Sm3gJTFdjUb5m1J++1/gdbdA/7nYszuobEvgCZzu+6B3ZPbY8S6jyN/mR6AN
X-Received: by 2002:ad4:5748:0:b0:5ef:519:b1a with SMTP id q8-20020ad45748000000b005ef05190b1amr32351218qvx.24.1682451278752;
        Tue, 25 Apr 2023 12:34:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682451278; cv=none;
        d=google.com; s=arc-20160816;
        b=g+X5zJVbmncD/80ouDh8MMASG5DU64Ks/XYJCLy8u+KCwWaocfUTtCTMhRXd3mPcaX
         4vJ/Y74U/raEPpo8QggT+0FsuGa4Ix+1XCvCfYDJlPLyAVU6JhRwsFW6eJK7Y0kYaXg3
         RnIHNqC2JPub8OqAG4S43GXiqXh6Z5Y4Ggp9KSpRDUFco4eLFWjQNaqwESoZ0IJ7wJJJ
         OOnfTLtTmzam8bi8zPBKnPT5ob14DGIixkZ1Qxtn/G7robb4hsevS9RM2sjzhl5nNUFF
         WzNOUCSzXI1fGj4MtHSww0YCzSEOm7SpbAc4Vc0vsdneSjg5JNWR1QwlCenP+oCFV1j2
         sbwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=TSknonhIYWt5umpLJq71osBBG655js63QRsSvJLPEd4=;
        b=YQWaCxO9ArhwSFUGDQWHcHtJRZb+Vzkt/23drfx+VGoqI7zt1mYwcCgs9D8Xlzgo2L
         iJGGHnD+qTYL1C0M2k0onqbwWU8U8KaYEaXCy3v1hsrAEz9BZHBaAWdrdes57jZGasVC
         +GKpMxvTe5+uTuBFUl7gA+qoFsRkBuO43iub2kunGU3Wr0N70cogBVBO8utIWAzr3tP+
         Mepe919mskD8qwpX6kUwa7PsRdR9KjD1AexMd0arZKSISYuuVRGRH8lLq6IZt9d7MgKs
         uc14S7XjOZk2xeiUUTglQMOj8pKpfeUpSm9G5awHzBJVV+kjraDEdYk+RmZTzpf99UIw
         /IuA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qCOExT+1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id iw9-20020a0562140f2900b005ef5fcb69fesi9345429qvb.245.2023.04.25.12.34.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Apr 2023 12:34:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qCOExT+1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1prOQN-0002X2-CU; Tue, 25 Apr 2023 15:34:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOQL-0002T2-GV
 for qemu-arm@nongnu.org; Tue, 25 Apr 2023 15:34:01 -0400
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOQE-0004dW-2G
 for qemu-arm@nongnu.org; Tue, 25 Apr 2023 15:34:01 -0400
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2aa39ce5d26so52829681fa.1
 for <qemu-arm@nongnu.org>; Tue, 25 Apr 2023 12:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682451232; x=1685043232;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TSknonhIYWt5umpLJq71osBBG655js63QRsSvJLPEd4=;
 b=qCOExT+1rz04oLGR5g6vna1z/8KI4bH+iFMsVLuItympwBqx41w+Sod3E9Ymj+nBM5
 ZIeheMa08YR6mfTD5LRFX5ntA2KXo/7pOtjUVAcKXYHaKO8dTnM+hMdB4yX1Amb2gPiP
 wB7lV3Ncw8E5gMkDiswpr7Tvbm93GupmW90TLVxkOELZgvDYoKP4c7OWh2pYciNEn7hI
 p9CapxX9QE1tSkl7e0hNAOL7S3Hh82CIzuRuoG8+jM3JVxCNsBbGLCm3YLi0PIaiTATd
 BAu95c2cNNzsHbQikv/ul+Fbi4omuj+VzJN/koEi1lV9ccP+LPFzv8jzODwp1EgnedaE
 gX0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682451232; x=1685043232;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TSknonhIYWt5umpLJq71osBBG655js63QRsSvJLPEd4=;
 b=WjYAjKPbpuD7xHSaRBVwE0MR3xR9UCGItEI66eGP+G+dTEjRHqVV9R0mGYZzaLY7vW
 XVN3qZ1TUmN1mFz7KElbvvdtbSIVZRdJJxUEuqQ4WuVMHa6mjPw7JxnTvlyPYdNSdNjB
 jJT8ofUDOpnFW9a27PiMRPALB6Ci+mb0RnzD1z5M7kuoLyUYr7jn0bbIwkXXadBsBa6F
 Ksl65A3hL0fnySpq0Z0O+0ZM8tdu1sKUpcrStDVMtr8Mtpx8YFjaHfnGDukK+jd0GA9J
 HNuy4ogWx175KDfEzWlKP9qbVlkwHJr3jdpIycbhoVL1NqjBV+5RIm2GkgNwlTyAauWD
 zSJw==
X-Gm-Message-State: AAQBX9cjdDKRn6Rm1u7xygDd3ixC8WS00NOvorM4ZMOhKdJuZQW7cPRG
 umdlsK9hRtffZgab8P/ZcXxa1w==
X-Received: by 2002:a2e:9456:0:b0:2a8:c7bb:eeaa with SMTP id
 o22-20020a2e9456000000b002a8c7bbeeaamr3538656ljh.24.1682451232403; 
 Tue, 25 Apr 2023 12:33:52 -0700 (PDT)
Received: from stoup.. ([91.209.212.61]) by smtp.gmail.com with ESMTPSA id
 z23-20020a2e8857000000b002a8c271de33sm2160484ljj.67.2023.04.25.12.33.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 12:33:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 philmd@linaro.org
Subject: [PATCH v3 13/57] meson: Detect atomic128 support with optimization
Date: Tue, 25 Apr 2023 20:31:02 +0100
Message-Id: <20230425193146.2106111-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425193146.2106111-1-richard.henderson@linaro.org>
References: <20230425193146.2106111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::231;
 envelope-from=richard.henderson@linaro.org; helo=mail-lj1-x231.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Lc/GOruDzPno

There is an edge condition prior to gcc13 for which optimization
is required to generate 16-byte atomic sequences.  Detect this.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/ldst_atomicity.c.inc | 38 ++++++++++++++++++-------
 meson.build                    | 52 ++++++++++++++++++++++------------
 2 files changed, 61 insertions(+), 29 deletions(-)

diff --git a/accel/tcg/ldst_atomicity.c.inc b/accel/tcg/ldst_atomicity.c.inc
index e61121d6bf..c43f101ebe 100644
--- a/accel/tcg/ldst_atomicity.c.inc
+++ b/accel/tcg/ldst_atomicity.c.inc
@@ -16,6 +16,23 @@
 #endif
 #define HAVE_al8_fast      (ATOMIC_REG_SIZE >= 8)
 
+/*
+ * If __alignof(unsigned __int128) < 16, GCC may refuse to inline atomics
+ * that are supported by the host, e.g. s390x.  We can force the pointer to
+ * have our known alignment with __builtin_assume_aligned, however prior to
+ * GCC 13 that was only reliable with optimization enabled.  See
+ *   https://gcc.gnu.org/bugzilla/show_bug.cgi?id=107389
+ */
+#if defined(CONFIG_ATOMIC128_OPT)
+# if !defined(__OPTIMIZE__)
+#  define ATTRIBUTE_ATOMIC128_OPT  __attribute__((optimize("O1")))
+# endif
+# define CONFIG_ATOMIC128
+#endif
+#ifndef ATTRIBUTE_ATOMIC128_OPT
+# define ATTRIBUTE_ATOMIC128_OPT
+#endif
+
 #if defined(CONFIG_ATOMIC128)
 # define HAVE_al16_fast    true
 #else
@@ -136,7 +153,8 @@ static inline uint64_t load_atomic8(void *pv)
  *
  * Atomically load 16 aligned bytes from @pv.
  */
-static inline Int128 load_atomic16(void *pv)
+static inline Int128 ATTRIBUTE_ATOMIC128_OPT
+load_atomic16(void *pv)
 {
 #ifdef CONFIG_ATOMIC128
     __uint128_t *p = __builtin_assume_aligned(pv, 16);
@@ -340,7 +358,8 @@ static uint64_t load_atom_extract_al16_or_exit(CPUArchState *env, uintptr_t ra,
  * cross an 16-byte boundary then the access must be 16-byte atomic,
  * otherwise the access must be 8-byte atomic.
  */
-static inline uint64_t load_atom_extract_al16_or_al8(void *pv, int s)
+static inline uint64_t ATTRIBUTE_ATOMIC128_OPT
+load_atom_extract_al16_or_al8(void *pv, int s)
 {
 #if defined(CONFIG_ATOMIC128)
     uintptr_t pi = (uintptr_t)pv;
@@ -676,28 +695,24 @@ static inline void store_atomic8(void *pv, uint64_t val)
  *
  * Atomically store 16 aligned bytes to @pv.
  */
-static inline void store_atomic16(void *pv, Int128 val)
+static inline void ATTRIBUTE_ATOMIC128_OPT
+store_atomic16(void *pv, Int128Alias val)
 {
 #if defined(CONFIG_ATOMIC128)
     __uint128_t *pu = __builtin_assume_aligned(pv, 16);
-    Int128Alias new;
-
-    new.s = val;
-    qatomic_set__nocheck(pu, new.u);
+    qatomic_set__nocheck(pu, val.u);
 #elif defined(CONFIG_CMPXCHG128)
     __uint128_t *pu = __builtin_assume_aligned(pv, 16);
     __uint128_t o;
-    Int128Alias n;
 
     /*
      * Without CONFIG_ATOMIC128, __atomic_compare_exchange_n will always
      * defer to libatomic, so we must use __sync_val_compare_and_swap_16
      * and accept the sequential consistency that comes with it.
      */
-    n.s = val;
     do {
         o = *pu;
-    } while (!__sync_bool_compare_and_swap_16(pu, o, n.u));
+    } while (!__sync_bool_compare_and_swap_16(pu, o, val.u));
 #else
     qemu_build_not_reached();
 #endif
@@ -779,7 +794,8 @@ static void store_atom_insert_al8(uint64_t *p, uint64_t val, uint64_t msk)
  *
  * Atomically store @val to @p masked by @msk.
  */
-static void store_atom_insert_al16(Int128 *ps, Int128Alias val, Int128Alias msk)
+static void ATTRIBUTE_ATOMIC128_OPT
+store_atom_insert_al16(Int128 *ps, Int128Alias val, Int128Alias msk)
 {
 #if defined(CONFIG_ATOMIC128)
     __uint128_t *pu, old, new;
diff --git a/meson.build b/meson.build
index c44d05a13f..f71653d0c8 100644
--- a/meson.build
+++ b/meson.build
@@ -2241,23 +2241,21 @@ config_host_data.set('HAVE_BROKEN_SIZE_MAX', not cc.compiles('''
         return printf("%zu", SIZE_MAX);
     }''', args: ['-Werror']))
 
-atomic_test = '''
+# See if 64-bit atomic operations are supported.
+# Note that without __atomic builtins, we can only
+# assume atomic loads/stores max at pointer size.
+config_host_data.set('CONFIG_ATOMIC64', cc.links('''
   #include <stdint.h>
   int main(void)
   {
-    @0@ x = 0, y = 0;
+    uint64_t x = 0, y = 0;
     y = __atomic_load_n(&x, __ATOMIC_RELAXED);
     __atomic_store_n(&x, y, __ATOMIC_RELAXED);
     __atomic_compare_exchange_n(&x, &y, x, 0, __ATOMIC_RELAXED, __ATOMIC_RELAXED);
     __atomic_exchange_n(&x, y, __ATOMIC_RELAXED);
     __atomic_fetch_add(&x, y, __ATOMIC_RELAXED);
     return 0;
-  }'''
-
-# See if 64-bit atomic operations are supported.
-# Note that without __atomic builtins, we can only
-# assume atomic loads/stores max at pointer size.
-config_host_data.set('CONFIG_ATOMIC64', cc.links(atomic_test.format('uint64_t')))
+  }'''))
 
 has_int128 = cc.links('''
   __int128_t a;
@@ -2275,21 +2273,39 @@ if has_int128
   # "do we have 128-bit atomics which are handled inline and specifically not
   # via libatomic". The reason we can't use libatomic is documented in the
   # comment starting "GCC is a house divided" in include/qemu/atomic128.h.
-  has_atomic128 = cc.links(atomic_test.format('unsigned __int128'))
+  # We only care about these operations on 16-byte aligned pointers, so
+  # force 16-byte alignment of the pointer, which may be greater than
+  # __alignof(unsigned __int128) for the host.
+  atomic_test_128 = '''
+    int main(int ac, char **av) {
+      unsigned __int128 *p = __builtin_assume_aligned(av[ac - 1], sizeof(16));
+      p[1] = __atomic_load_n(&p[0], __ATOMIC_RELAXED);
+      __atomic_store_n(&p[2], p[3], __ATOMIC_RELAXED);
+      __atomic_compare_exchange_n(&p[4], &p[5], p[6], 0, __ATOMIC_RELAXED, __ATOMIC_RELAXED);
+      return 0;
+    }'''
+  has_atomic128 = cc.links(atomic_test_128)
 
   config_host_data.set('CONFIG_ATOMIC128', has_atomic128)
 
   if not has_atomic128
-    has_cmpxchg128 = cc.links('''
-      int main(void)
-      {
-        unsigned __int128 x = 0, y = 0;
-        __sync_val_compare_and_swap_16(&x, y, x);
-        return 0;
-      }
-    ''')
+    # Even with __builtin_assume_aligned, the above test may have failed
+    # without optimization enabled.  Try again with optimizations locally
+    # enabled for the function.  See
+    #   https://gcc.gnu.org/bugzilla/show_bug.cgi?id=107389
+    has_atomic128_opt = cc.links('__attribute__((optimize("O1")))' + atomic_test_128)
+    config_host_data.set('CONFIG_ATOMIC128_OPT', has_atomic128_opt)
 
-    config_host_data.set('CONFIG_CMPXCHG128', has_cmpxchg128)
+    if not has_atomic128_opt
+      config_host_data.set('CONFIG_CMPXCHG128', cc.links('''
+        int main(void)
+        {
+          unsigned __int128 x = 0, y = 0;
+          __sync_val_compare_and_swap_16(&x, y, x);
+          return 0;
+        }
+      '''))
+    endif
   endif
 endif
 
-- 
2.34.1

