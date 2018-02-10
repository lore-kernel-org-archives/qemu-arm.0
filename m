Received: by 10.28.71.27 with SMTP id u27csp2745724wma;
        Sat, 10 Feb 2018 15:11:32 -0800 (PST)
X-Google-Smtp-Source: AH8x225ekdx8gHIIHnU0ltWLiH9V0HLhLH4NGWVAfQZxHuyX4CzD0IR+0SPmxZjOqXxwT3KjufF1
X-Received: by 10.37.83.65 with SMTP id h62mr4339455ybb.73.1518304292062;
        Sat, 10 Feb 2018 15:11:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518304292; cv=none;
        d=google.com; s=arc-20160816;
        b=kMq8EotOO07TyL6YmZuEpGZ0l5v7BNCnUaBd5wyYKKQXYYbo+3xTmuUSJsgiPwB85L
         v9jMZMugNCp55MlCXjnV//mzijbaLewHnBLiVaMB4/L+wbEBidRCuOY8DtWIOiY2o6aj
         bPG9zqdoOA16iEdiOYqBBa1qlaH9DIUR60M7GmVW1pO+XHtxxpdq6lTTCUP7Mzp6zpjI
         Ebt5dXvfT41awexl0olJsUPo9Rgc44xJVrUenqUalfD4EXX5pqEuwC/heFLeWgWfvp0X
         uNKqgjAH87nbacyhdB0cb/Uh0L83vyeOKgG8xt3fjI8cmmRTtN6qhsIBiN+HWovZN4r4
         oXjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=0RZ/Dwu85IRJts+xxg49wprCBup0YeyQq2OHAWxr7S4=;
        b=W6Q6B7zZhGW2tL+s7z9JJrDj4AFV65+8gkIZ8UZdSes2Lg8F4Ev9rmm1F+uOFWwdeO
         yWoVMkx07nWXcEcQublWWQw2T3OZK2tQ5AcmmAAXqszvol116XlZH85/yHs/VP7Xaa8H
         vHkdu/NnLsoVtvke9H50DOaOUSf/dMoqnPs3qtChHtPOuM5ln25cQy6KMn2rwihcrkjk
         pK1HNMy8laIkv6NzvkpYcEVf5QyMu9DnQXskY/xJdbD5+DFu5hDzl3bZBDmaBRzy0Yr4
         F6Xk+SCyRzxpcSZJ04DFFGw4PK0TqTc4x5kaIBm7TqadM8FeybRg7A+GhKF7dgvOflY9
         oi6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jEnZiYXJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k126si981055ywb.591.2018.02.10.15.11.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 10 Feb 2018 15:11:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jEnZiYXJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46094 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ekeIt-0002Vd-E2
	for alex.bennee@linaro.org; Sat, 10 Feb 2018 18:11:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58749)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ekeDL-0006eB-8Y
	for qemu-arm@nongnu.org; Sat, 10 Feb 2018 18:05:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ekeDF-0008AN-U0
	for qemu-arm@nongnu.org; Sat, 10 Feb 2018 18:05:47 -0500
Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241]:43893)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1ekeDF-00088t-GJ
	for qemu-arm@nongnu.org; Sat, 10 Feb 2018 18:05:41 -0500
Received: by mail-pg0-x241.google.com with SMTP id f6so5476501pgs.10
	for <qemu-arm@nongnu.org>; Sat, 10 Feb 2018 15:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=0RZ/Dwu85IRJts+xxg49wprCBup0YeyQq2OHAWxr7S4=;
	b=jEnZiYXJB+t/RICbmVxBMRr8hio7Zzfw+/NhrIkVATu/DRFlXLMaKbv19Scz+6+/7j
	pD7uFIkeOikmQO2KUa+m0kU6VNJfzbTlzItpZoJM6k35CysQGSUp2aWk+B71ofdHZl3Y
	Cu3UY0RclRVfPKPS2wCSGwomYk6K5E0crj9wE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=0RZ/Dwu85IRJts+xxg49wprCBup0YeyQq2OHAWxr7S4=;
	b=gSi3qJfibsapkwE2uJ4xT4f5fZceOth/9XUuON/qjrvt523B/HLlq9kJv55TePK9PP
	bfonzWTm156BFwJifbhGNwkY4DO+VBEY74hIztLMdk6HOz7lLo7xOlUtmyaR8AM4fukr
	pSLrCosvxUg2jwHUvAhA212UO6icJy2fKn7UzD796x+Li1H8CwmF2EhVyYMC0sVyKL01
	bEZ8KqDPQqHEJ/DOLCAsK7ZpCsgR+QPgY1T6w6iEbSCqBwQPsx6UDVcesFS5gvivyJ9L
	Pwhkw1WZ1F942lasf+F2uLaZ6JA5I9j6444M0ZRJjOqyyud3yPGwRb+LoeKhoQHCYwKO
	1M4g==
X-Gm-Message-State: APf1xPDjEKdZ2d+A1mXhWo5o9zmSkcOI/sSWNqWFBGHcNksEWogyNHax
	CNLdEI6ATmjK8DlAbjJBp6yQdA==
X-Received: by 10.101.71.129 with SMTP id e1mr5865207pgs.430.1518303940329;
	Sat, 10 Feb 2018 15:05:40 -0800 (PST)
Received: from cloudburst.twiddle.net (174-21-6-47.tukw.qwest.net.
	[174.21.6.47]) by smtp.gmail.com with ESMTPSA id
	w10sm14122374pgr.57.2018.02.10.15.05.38
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 10 Feb 2018 15:05:39 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat, 10 Feb 2018 15:05:30 -0800
Message-Id: <20180210230530.8421-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180210230530.8421-1-richard.henderson@linaro.org>
References: <20180210230530.8421-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::241
Subject: [Qemu-arm] [PATCH 5/5] target/arm: Handle SVE registers when using
 clear_vec_high
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AQUGDKm6EkfN

When storing to an AdvSIMD FP register, all of the high
bits of the SVE register are zeroed.  Therefore, call it
more often with is_q as a parameter.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 162 +++++++++++++++++----------------------------
 1 file changed, 62 insertions(+), 100 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index e3881d4999..1c88539d62 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -602,13 +602,30 @@ static TCGv_i32 read_fp_sreg(DisasContext *s, int reg)
     return v;
 }
 
+/* Clear the bits above an N-bit vector, for N = (is_q ? 128 : 64).
+ * If SVE is not enabled, then there are only 128 bits in the vector.
+ */
+static void clear_vec_high(DisasContext *s, bool is_q, int rd)
+{
+    unsigned ofs = fp_reg_offset(s, rd, MO_64);
+    unsigned vsz = vec_full_reg_size(s);
+
+    if (!is_q) {
+        TCGv_i64 tcg_zero = tcg_const_i64(0);
+        tcg_gen_st_i64(tcg_zero, cpu_env, ofs + 8);
+        tcg_temp_free_i64(tcg_zero);
+    }
+    if (vsz > 16) {
+        tcg_gen_gvec_dup8i(ofs + 16, vsz - 16, vsz - 16, 0);
+    }
+}
+
 static void write_fp_dreg(DisasContext *s, int reg, TCGv_i64 v)
 {
-    TCGv_i64 tcg_zero = tcg_const_i64(0);
+    unsigned ofs = fp_reg_offset(s, reg, MO_64);
 
-    tcg_gen_st_i64(v, cpu_env, fp_reg_offset(s, reg, MO_64));
-    tcg_gen_st_i64(tcg_zero, cpu_env, fp_reg_hi_offset(s, reg));
-    tcg_temp_free_i64(tcg_zero);
+    tcg_gen_st_i64(v, cpu_env, ofs);
+    clear_vec_high(s, false, reg);
 }
 
 static void write_fp_sreg(DisasContext *s, int reg, TCGv_i32 v)
@@ -1009,6 +1026,8 @@ static void do_fp_ld(DisasContext *s, int destidx, TCGv_i64 tcg_addr, int size)
 
     tcg_temp_free_i64(tmplo);
     tcg_temp_free_i64(tmphi);
+
+    clear_vec_high(s, true, destidx);
 }
 
 /*
@@ -1124,17 +1143,6 @@ static void write_vec_element_i32(DisasContext *s, TCGv_i32 tcg_src,
     }
 }
 
-/* Clear the high 64 bits of a 128 bit vector (in general non-quad
- * vector ops all need to do this).
- */
-static void clear_vec_high(DisasContext *s, int rd)
-{
-    TCGv_i64 tcg_zero = tcg_const_i64(0);
-
-    write_vec_element(s, tcg_zero, rd, 1, MO_64);
-    tcg_temp_free_i64(tcg_zero);
-}
-
 /* Store from vector register to memory */
 static void do_vec_st(DisasContext *s, int srcidx, int element,
                       TCGv_i64 tcg_addr, int size)
@@ -2794,12 +2802,13 @@ static void disas_ldst_multiple_struct(DisasContext *s, uint32_t insn)
                     /* For non-quad operations, setting a slice of the low
                      * 64 bits of the register clears the high 64 bits (in
                      * the ARM ARM pseudocode this is implicit in the fact
-                     * that 'rval' is a 64 bit wide variable). We optimize
-                     * by noticing that we only need to do this the first
-                     * time we touch a register.
+                     * that 'rval' is a 64 bit wide variable).
+                     * For quad operations, we might still need to zero the
+                     * high bits of SVE.  We optimize by noticing that we only
+                     * need to do this the first time we touch a register.
                      */
-                    if (!is_q && e == 0 && (r == 0 || xs == selem - 1)) {
-                        clear_vec_high(s, tt);
+                    if (e == 0 && (r == 0 || xs == selem - 1)) {
+                        clear_vec_high(s, is_q, tt);
                     }
                 }
                 tcg_gen_addi_i64(tcg_addr, tcg_addr, ebytes);
@@ -2942,10 +2951,9 @@ static void disas_ldst_single_struct(DisasContext *s, uint32_t insn)
             write_vec_element(s, tcg_tmp, rt, 0, MO_64);
             if (is_q) {
                 write_vec_element(s, tcg_tmp, rt, 1, MO_64);
-            } else {
-                clear_vec_high(s, rt);
             }
             tcg_temp_free_i64(tcg_tmp);
+            clear_vec_high(s, is_q, rt);
         } else {
             /* Load/store one element per register */
             if (is_load) {
@@ -6718,7 +6726,6 @@ static void handle_vec_simd_sqshrn(DisasContext *s, bool is_scalar, bool is_q,
     }
 
     if (!is_q) {
-        clear_vec_high(s, rd);
         write_vec_element(s, tcg_final, rd, 0, MO_64);
     } else {
         write_vec_element(s, tcg_final, rd, 1, MO_64);
@@ -6731,7 +6738,8 @@ static void handle_vec_simd_sqshrn(DisasContext *s, bool is_scalar, bool is_q,
     tcg_temp_free_i64(tcg_rd);
     tcg_temp_free_i32(tcg_rd_narrowed);
     tcg_temp_free_i64(tcg_final);
-    return;
+
+    clear_vec_high(s, is_q, rd);
 }
 
 /* SQSHLU, UQSHL, SQSHL: saturating left shifts */
@@ -6795,10 +6803,7 @@ static void handle_simd_qshl(DisasContext *s, bool scalar, bool is_q,
             tcg_temp_free_i64(tcg_op);
         }
         tcg_temp_free_i64(tcg_shift);
-
-        if (!is_q) {
-            clear_vec_high(s, rd);
-        }
+        clear_vec_high(s, is_q, rd);
     } else {
         TCGv_i32 tcg_shift = tcg_const_i32(shift);
         static NeonGenTwoOpEnvFn * const fns[2][2][3] = {
@@ -6847,8 +6852,8 @@ static void handle_simd_qshl(DisasContext *s, bool scalar, bool is_q,
         }
         tcg_temp_free_i32(tcg_shift);
 
-        if (!is_q && !scalar) {
-            clear_vec_high(s, rd);
+        if (!scalar) {
+            clear_vec_high(s, is_q, rd);
         }
     }
 }
@@ -6901,13 +6906,11 @@ static void handle_simd_intfp_conv(DisasContext *s, int rd, int rn,
         }
     }
 
-    if (!is_double && elements == 2) {
-        clear_vec_high(s, rd);
-    }
-
     tcg_temp_free_i64(tcg_int);
     tcg_temp_free_ptr(tcg_fpst);
     tcg_temp_free_i32(tcg_shift);
+
+    clear_vec_high(s, elements << size == 16, rd);
 }
 
 /* UCVTF/SCVTF - Integer to FP conversion */
@@ -6995,9 +6998,7 @@ static void handle_simd_shift_fpint_conv(DisasContext *s, bool is_scalar,
             write_vec_element(s, tcg_op, rd, pass, MO_64);
             tcg_temp_free_i64(tcg_op);
         }
-        if (!is_q) {
-            clear_vec_high(s, rd);
-        }
+        clear_vec_high(s, is_q, rd);
     } else {
         int maxpass = is_scalar ? 1 : is_q ? 4 : 2;
         for (pass = 0; pass < maxpass; pass++) {
@@ -7016,8 +7017,8 @@ static void handle_simd_shift_fpint_conv(DisasContext *s, bool is_scalar,
             }
             tcg_temp_free_i32(tcg_op);
         }
-        if (!is_q && !is_scalar) {
-            clear_vec_high(s, rd);
+        if (!is_scalar) {
+            clear_vec_high(s, is_q, rd);
         }
     }
 
@@ -7502,10 +7503,7 @@ static void handle_3same_float(DisasContext *s, int size, int elements,
 
     tcg_temp_free_ptr(fpst);
 
-    if ((elements << size) < 4) {
-        /* scalar, or non-quad vector op */
-        clear_vec_high(s, rd);
-    }
+    clear_vec_high(s, elements * (size ? 8 : 4) > 8, rd);
 }
 
 /* AdvSIMD scalar three same
@@ -7831,13 +7829,11 @@ static void handle_2misc_fcmp_zero(DisasContext *s, int opcode,
             }
             write_vec_element(s, tcg_res, rd, pass, MO_64);
         }
-        if (is_scalar) {
-            clear_vec_high(s, rd);
-        }
-
         tcg_temp_free_i64(tcg_res);
         tcg_temp_free_i64(tcg_zero);
         tcg_temp_free_i64(tcg_op);
+
+        clear_vec_high(s, !is_scalar, rd);
     } else {
         TCGv_i32 tcg_op = tcg_temp_new_i32();
         TCGv_i32 tcg_zero = tcg_const_i32(0);
@@ -7888,8 +7884,8 @@ static void handle_2misc_fcmp_zero(DisasContext *s, int opcode,
         tcg_temp_free_i32(tcg_res);
         tcg_temp_free_i32(tcg_zero);
         tcg_temp_free_i32(tcg_op);
-        if (!is_q && !is_scalar) {
-            clear_vec_high(s, rd);
+        if (!is_scalar) {
+            clear_vec_high(s, is_q, rd);
         }
     }
 
@@ -7925,12 +7921,9 @@ static void handle_2misc_reciprocal(DisasContext *s, int opcode,
             }
             write_vec_element(s, tcg_res, rd, pass, MO_64);
         }
-        if (is_scalar) {
-            clear_vec_high(s, rd);
-        }
-
         tcg_temp_free_i64(tcg_res);
         tcg_temp_free_i64(tcg_op);
+        clear_vec_high(s, !is_scalar, rd);
     } else {
         TCGv_i32 tcg_op = tcg_temp_new_i32();
         TCGv_i32 tcg_res = tcg_temp_new_i32();
@@ -7970,8 +7963,8 @@ static void handle_2misc_reciprocal(DisasContext *s, int opcode,
         }
         tcg_temp_free_i32(tcg_res);
         tcg_temp_free_i32(tcg_op);
-        if (!is_q && !is_scalar) {
-            clear_vec_high(s, rd);
+        if (!is_scalar) {
+            clear_vec_high(s, is_q, rd);
         }
     }
     tcg_temp_free_ptr(fpst);
@@ -8077,9 +8070,7 @@ static void handle_2misc_narrow(DisasContext *s, bool scalar,
         write_vec_element_i32(s, tcg_res[pass], rd, destelt + pass, MO_32);
         tcg_temp_free_i32(tcg_res[pass]);
     }
-    if (!is_q) {
-        clear_vec_high(s, rd);
-    }
+    clear_vec_high(s, is_q, rd);
 }
 
 /* Remaining saturating accumulating ops */
@@ -8104,12 +8095,9 @@ static void handle_2misc_satacc(DisasContext *s, bool is_scalar, bool is_u,
             }
             write_vec_element(s, tcg_rd, rd, pass, MO_64);
         }
-        if (is_scalar) {
-            clear_vec_high(s, rd);
-        }
-
         tcg_temp_free_i64(tcg_rd);
         tcg_temp_free_i64(tcg_rn);
+        clear_vec_high(s, !is_scalar, rd);
     } else {
         TCGv_i32 tcg_rn = tcg_temp_new_i32();
         TCGv_i32 tcg_rd = tcg_temp_new_i32();
@@ -8167,13 +8155,9 @@ static void handle_2misc_satacc(DisasContext *s, bool is_scalar, bool is_u,
             }
             write_vec_element_i32(s, tcg_rd, rd, pass, MO_32);
         }
-
-        if (!is_q) {
-            clear_vec_high(s, rd);
-        }
-
         tcg_temp_free_i32(tcg_rd);
         tcg_temp_free_i32(tcg_rn);
+        clear_vec_high(s, is_q, rd);
     }
 }
 
@@ -8664,9 +8648,7 @@ static void handle_vec_simd_shri(DisasContext *s, bool is_q, bool is_u,
     tcg_temp_free_i64(tcg_round);
 
  done:
-    if (!is_q) {
-        clear_vec_high(s, rd);
-    }
+    clear_vec_high(s, is_q, rd);
 }
 
 static void gen_shl8_ins_i64(TCGv_i64 d, TCGv_i64 a, int64_t shift)
@@ -8855,19 +8837,18 @@ static void handle_vec_simd_shrn(DisasContext *s, bool is_q,
     }
 
     if (!is_q) {
-        clear_vec_high(s, rd);
         write_vec_element(s, tcg_final, rd, 0, MO_64);
     } else {
         write_vec_element(s, tcg_final, rd, 1, MO_64);
     }
-
     if (round) {
         tcg_temp_free_i64(tcg_round);
     }
     tcg_temp_free_i64(tcg_rn);
     tcg_temp_free_i64(tcg_rd);
     tcg_temp_free_i64(tcg_final);
-    return;
+
+    clear_vec_high(s, is_q, rd);
 }
 
 
@@ -9261,9 +9242,7 @@ static void handle_3rd_narrowing(DisasContext *s, int is_q, int is_u, int size,
         write_vec_element_i32(s, tcg_res[pass], rd, pass + part, MO_32);
         tcg_temp_free_i32(tcg_res[pass]);
     }
-    if (!is_q) {
-        clear_vec_high(s, rd);
-    }
+    clear_vec_high(s, is_q, rd);
 }
 
 static void handle_pmull_64(DisasContext *s, int is_q, int rd, int rn, int rm)
@@ -9671,9 +9650,7 @@ static void handle_simd_3same_pair(DisasContext *s, int is_q, int u, int opcode,
             write_vec_element_i32(s, tcg_res[pass], rd, pass, MO_32);
             tcg_temp_free_i32(tcg_res[pass]);
         }
-        if (!is_q) {
-            clear_vec_high(s, rd);
-        }
+        clear_vec_high(s, is_q, rd);
     }
 
     if (fpst) {
@@ -10161,10 +10138,7 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
             tcg_temp_free_i32(tcg_op2);
         }
     }
-
-    if (!is_q) {
-        clear_vec_high(s, rd);
-    }
+    clear_vec_high(s, is_q, rd);
 }
 
 /* AdvSIMD three same
@@ -10303,9 +10277,7 @@ static void handle_rev(DisasContext *s, int opcode, bool u,
             write_vec_element(s, tcg_tmp, rd, i, grp_size);
             tcg_temp_free_i64(tcg_tmp);
         }
-        if (!is_q) {
-            clear_vec_high(s, rd);
-        }
+        clear_vec_high(s, is_q, rd);
     } else {
         int revmask = (1 << grp_size) - 1;
         int esize = 8 << size;
@@ -10949,9 +10921,7 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
             tcg_temp_free_i32(tcg_op);
         }
     }
-    if (!is_q) {
-        clear_vec_high(s, rd);
-    }
+    clear_vec_high(s, is_q, rd);
 
     if (need_rmode) {
         gen_helper_set_rmode(tcg_rmode, tcg_rmode, cpu_env);
@@ -11130,11 +11100,8 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
             tcg_temp_free_i64(tcg_res);
         }
 
-        if (is_scalar) {
-            clear_vec_high(s, rd);
-        }
-
         tcg_temp_free_i64(tcg_idx);
+        clear_vec_high(s, !is_scalar, rd);
     } else if (!is_long) {
         /* 32 bit floating point, or 16 or 32 bit integer.
          * For the 16 bit scalar case we use the usual Neon helpers and
@@ -11238,10 +11205,7 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
         }
 
         tcg_temp_free_i32(tcg_idx);
-
-        if (!is_q) {
-            clear_vec_high(s, rd);
-        }
+        clear_vec_high(s, is_q, rd);
     } else {
         /* long ops: 16x16->32 or 32x32->64 */
         TCGv_i64 tcg_res[2];
@@ -11318,9 +11282,7 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
             }
             tcg_temp_free_i64(tcg_idx);
 
-            if (is_scalar) {
-                clear_vec_high(s, rd);
-            }
+            clear_vec_high(s, !is_scalar, rd);
         } else {
             TCGv_i32 tcg_idx = tcg_temp_new_i32();
 
-- 
2.14.3

