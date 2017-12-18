Received: by 10.223.159.74 with SMTP id f10csp2994473wrg;
        Mon, 18 Dec 2017 10:47:58 -0800 (PST)
X-Google-Smtp-Source: ACJfBos2z68i8yetYOC+gGukH4eHQUBVoeyZwXPfCwd2N8dKwtrJclrM/pnW3v933AvPNN7eHhlJ
X-Received: by 10.37.177.39 with SMTP id g39mr597108ybj.415.1513622878497;
        Mon, 18 Dec 2017 10:47:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513622878; cv=none;
        d=google.com; s=arc-20160816;
        b=cNWHEUgyBgWN8mV0CrXEUsz9blAZFND5yvK24JC3+Dy0IP3mH84uHwdGa4drZBpc7e
         SV+vVQ73/ovd61cw2nJ3k9z7SVyn5faR6mOQGOqanmmlH3tXDKVWI6eybQcNhaJHqNiA
         RGCP+FyeZw5dsgHahPYCLLYfDp6MifqgyC4hztE5o2mHwtm1YRqvl7UARKJbdMkOzDnD
         hIe6ffUalqvRUCl8zqhoE2otJ/82SMCoa9G0NXITwYddAFVuK1c3ly1FVXqOkjqOdU6y
         jYUO5sD9JvIPgi+tq4e1CPiJIgNlMWj8J3eDyW2Mu150gUxstcD7O6bgCR7qh8Czakex
         ezkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=B9w/xv6dl+dsoGKHoDlcAQW8Ls7nRo+YPhDgGizIB2U=;
        b=LKzAsnnkBuDo9tnd4Gfpc2hJn/xn8kiEtQ3IWFYKLpx0qaHbEkdY372SFZo3ldRyNL
         U04uYvcH2ZlghTWKw7XH81vNnF7MbbubvD4gSaPCritOV9GpKuR6CwJ62uzVF5BZNoie
         q74W1IyWOYAwRTX46ZR08h6VvpVj6wXOcrHhQealpzou8FcWuxDHoM6WuXbJZMvmfrSO
         VdLa23hIkp0N55ZdHba9deMv+1qak9X0m//Lk4zYQbwMSC8n9w7X2X4S0aGRWU4zw8u9
         n1b+vuheGcXB3Cb1k3M9x4qCEzZlLsO+CZnuPYvRqJerCBp0qH9pOk7hFf8hAsuYPuBA
         Jh8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AS/hvW+w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q1si2528643ywj.56.2017.12.18.10.47.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Dec 2017 10:47:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AS/hvW+w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53107 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eR0SD-0005BN-Ra
	for alex.bennee@linaro.org; Mon, 18 Dec 2017 13:47:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55687)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eQzUS-0008CD-0u
	for qemu-arm@nongnu.org; Mon, 18 Dec 2017 12:46:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eQzUQ-000201-6K
	for qemu-arm@nongnu.org; Mon, 18 Dec 2017 12:46:12 -0500
Received: from mail-pl0-x244.google.com ([2607:f8b0:400e:c01::244]:36559)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1eQzUP-0001xx-TQ
	for qemu-arm@nongnu.org; Mon, 18 Dec 2017 12:46:10 -0500
Received: by mail-pl0-x244.google.com with SMTP id b12so5234071plm.3
	for <qemu-arm@nongnu.org>; Mon, 18 Dec 2017 09:46:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=B9w/xv6dl+dsoGKHoDlcAQW8Ls7nRo+YPhDgGizIB2U=;
	b=AS/hvW+wQGZ7T1x5egFaHVGg31uyBicf4pApqN41rVHsepYAfXnh4nYbtxHMODa7gA
	TN8XUu8Yptuc57Gk6tQmdzTMuy3AZkUqU1ZgYMvuqQqBvxJb8G7UGKDICOZHW2v1U6nr
	SO71ddve34BnGkyZr+NcsApHfN5ZpZZM+TZ+Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=B9w/xv6dl+dsoGKHoDlcAQW8Ls7nRo+YPhDgGizIB2U=;
	b=U3Nzr339g3gAnlzdk0r6YdRmOpiPVIeH7f31q3DUy1l+V+uAXRITrsFNPH+zuHwNOw
	IgQA2q13JpRIOL5TnQjpOZyelTHC5hpppfNBrzMWVhgMfb9xKrqA86haAj1h+kTi1efg
	LomxpeRKrOtl0iT2MCcxlJ5gDGXYubhiZMsN22PelovcWGx/wrTTUYhrnuwEY8/GDwVi
	BzMYkOihC2s3ZI+znqkbqjyvwQQyuNPzaNqGxoM4o7laNWJB64rjaAkO/OBWEjysj8Sw
	Yd3aol4fSaIhfh58CEdgek0/KmD9vFNvCVlNo/+vD2+XoFDx+HxYyQeI4tDPY49WtuHR
	O3ig==
X-Gm-Message-State: AKGB3mKtbWL33iCCbkYmnVnpXTo1SaByHl/L89V+T8NcEF8VXLEP2rXj
	22QCEVUvF6gla1z+doj5mgnYKg==
X-Received: by 10.84.209.136 with SMTP id y8mr442838plh.439.1513619168832;
	Mon, 18 Dec 2017 09:46:08 -0800 (PST)
Received: from cloudburst.twiddle.net (174-21-7-63.tukw.qwest.net.
	[174.21.7.63]) by smtp.gmail.com with ESMTPSA id
	t84sm26209657pfe.160.2017.12.18.09.46.07
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 18 Dec 2017 09:46:07 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 18 Dec 2017 09:45:38 -0800
Message-Id: <20171218174552.18871-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20171218174552.18871-1-richard.henderson@linaro.org>
References: <20171218174552.18871-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::244
Subject: [Qemu-arm] [PATCH 09/23] target/arm: Handle SVE registers when
 using clear_vec_high
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
X-TUID: 0313bBHaHh4J

When storing to an AdvSIMD FP register, all of the high
bits of the SVE register are zeroed.  Therefore, call it
more often with is_q as a parameter.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 157 +++++++++++++++------------------------------
 1 file changed, 51 insertions(+), 106 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index b951045820..9e15a4b1ae 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -533,17 +533,19 @@ static TCGv_i32 read_fp_sreg(DisasContext *s, int reg)
     return v;
 }
 
-/* Clear the bits above an 64-bit vector.
+/* Clear the bits above an N-bit vector, for N = (is_q ? 128 : 64).
  * If SVE is not enabled, then there are only 128 bits in the vector.
  */
-static void clear_vec_high(DisasContext *s, int rd)
+static void clear_vec_high(DisasContext *s, bool is_q, int rd)
 {
     unsigned ofs = fp_reg_offset(s, rd, MO_64);
     unsigned vsz = vec_full_reg_size(s);
-    TCGv_i64 tcg_zero = tcg_const_i64(0);
 
-    tcg_gen_st_i64(tcg_zero, cpu_env, ofs + 8);
-    tcg_temp_free_i64(tcg_zero);
+    if (is_q) {
+        TCGv_i64 tcg_zero = tcg_const_i64(0);
+        tcg_gen_st_i64(tcg_zero, cpu_env, ofs + 8);
+        tcg_temp_free_i64(tcg_zero);
+    }
     if (vsz > 16) {
         tcg_gen_gvec_dup8i(ofs + 16, vsz - 16, vsz - 16, 0);
     }
@@ -554,7 +556,7 @@ void write_fp_dreg(DisasContext *s, int reg, TCGv_i64 v)
     unsigned ofs = fp_reg_offset(s, reg, MO_64);
 
     tcg_gen_st_i64(v, cpu_env, ofs);
-    clear_vec_high(s, reg);
+    clear_vec_high(s, false, reg);
 }
 
 static void write_fp_sreg(DisasContext *s, int reg, TCGv_i32 v)
@@ -915,6 +917,8 @@ static void do_fp_ld(DisasContext *s, int destidx, TCGv_i64 tcg_addr, int size)
 
     tcg_temp_free_i64(tmplo);
     tcg_temp_free_i64(tmphi);
+
+    clear_vec_high(s, true, destidx);
 }
 
 /*
@@ -2670,12 +2674,13 @@ static void disas_ldst_multiple_struct(DisasContext *s, uint32_t insn)
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
@@ -2818,10 +2823,9 @@ static void disas_ldst_single_struct(DisasContext *s, uint32_t insn)
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
@@ -6659,7 +6663,6 @@ static void handle_vec_simd_sqshrn(DisasContext *s, bool is_scalar, bool is_q,
     }
 
     if (!is_q) {
-        clear_vec_high(s, rd);
         write_vec_element(s, tcg_final, rd, 0, MO_64);
     } else {
         write_vec_element(s, tcg_final, rd, 1, MO_64);
@@ -6672,7 +6675,8 @@ static void handle_vec_simd_sqshrn(DisasContext *s, bool is_scalar, bool is_q,
     tcg_temp_free_i64(tcg_rd);
     tcg_temp_free_i32(tcg_rd_narrowed);
     tcg_temp_free_i64(tcg_final);
-    return;
+
+    clear_vec_high(s, is_q, rd);
 }
 
 /* SQSHLU, UQSHL, SQSHL: saturating left shifts */
@@ -6736,10 +6740,7 @@ static void handle_simd_qshl(DisasContext *s, bool scalar, bool is_q,
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
@@ -6788,8 +6789,8 @@ static void handle_simd_qshl(DisasContext *s, bool scalar, bool is_q,
         }
         tcg_temp_free_i32(tcg_shift);
 
-        if (!is_q && !scalar) {
-            clear_vec_high(s, rd);
+        if (!scalar) {
+            clear_vec_high(s, is_q, rd);
         }
     }
 }
@@ -6831,10 +6832,8 @@ static void handle_simd_intfp_conv(DisasContext *s, int rd, int rn,
                 write_vec_element(s, tcg_double, rd, pass, MO_64);
             }
         }
-
         tcg_temp_free_i64(tcg_int64);
         tcg_temp_free_i64(tcg_double);
-
     } else {
         TCGv_i32 tcg_int32 = tcg_temp_new_i32();
         TCGv_i32 tcg_float = tcg_temp_new_i32();
@@ -6887,20 +6886,17 @@ static void handle_simd_intfp_conv(DisasContext *s, int rd, int rn,
                 write_vec_element_i32(s, tcg_float, rd, pass, size);
             }
         }
-
         tcg_temp_free_i32(tcg_int32);
         tcg_temp_free_i32(tcg_float);
-
-        if ((size == MO_32 && elements == 2) ||
-            (size == MO_16 && elements == 4)) {
-            clear_vec_high(s, rd);
-        }
     }
 
     tcg_temp_free_ptr(tcg_fpst);
     if (fracbits || size == MO_64) {
         tcg_temp_free_i32(tcg_shift);
     }
+    if (elements > 1) {
+        clear_vec_high(s, (elements << size) > 8, rd);
+    }
 }
 
 /* UCVTF/SCVTF - Integer to FP conversion */
@@ -6988,9 +6984,7 @@ static void handle_simd_shift_fpint_conv(DisasContext *s, bool is_scalar,
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
@@ -7009,8 +7003,8 @@ static void handle_simd_shift_fpint_conv(DisasContext *s, bool is_scalar,
             }
             tcg_temp_free_i32(tcg_op);
         }
-        if (!is_q && !is_scalar) {
-            clear_vec_high(s, rd);
+        if (!is_scalar) {
+            clear_vec_high(s, is_q, rd);
         }
     }
 
@@ -7491,13 +7485,9 @@ static void handle_3same_float(DisasContext *s, int size, int elements,
             tcg_temp_free_i32(tcg_op2);
         }
     }
-
     tcg_temp_free_ptr(fpst);
 
-    if ((elements << size) < 4) {
-        /* scalar, or non-quad vector op */
-        clear_vec_high(s, rd);
-    }
+    clear_vec_high(s, elements * (size ? 8 : 4) > 8, rd);
 }
 
 /* AdvSIMD scalar three same
@@ -8005,13 +7995,10 @@ static void handle_2misc_fcmp_zero(DisasContext *s, int opcode,
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
+        clear_vec_high(s, !is_scalar, rd);
     } else {
         TCGv_i32 tcg_op = tcg_temp_new_i32();
         TCGv_i32 tcg_zero = tcg_const_i32(0);
@@ -8063,8 +8050,8 @@ static void handle_2misc_fcmp_zero(DisasContext *s, int opcode,
         tcg_temp_free_i32(tcg_res);
         tcg_temp_free_i32(tcg_zero);
         tcg_temp_free_i32(tcg_op);
-        if (!is_q && !is_scalar) {
-            clear_vec_high(s, rd);
+        if (!is_scalar) {
+            clear_vec_high(s, is_q, rd);
         }
     }
 
@@ -8100,12 +8087,9 @@ static void handle_2misc_reciprocal(DisasContext *s, int opcode,
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
@@ -8145,8 +8129,8 @@ static void handle_2misc_reciprocal(DisasContext *s, int opcode,
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
@@ -8259,9 +8243,7 @@ static void handle_2misc_narrow(DisasContext *s, bool scalar,
         write_vec_element_i32(s, tcg_res[pass], rd, destelt + pass, MO_32);
         tcg_temp_free_i32(tcg_res[pass]);
     }
-    if (!is_q) {
-        clear_vec_high(s, rd);
-    }
+    clear_vec_high(s, is_q, rd);
 }
 
 /* Remaining saturating accumulating ops */
@@ -8286,12 +8268,9 @@ static void handle_2misc_satacc(DisasContext *s, bool is_scalar, bool is_u,
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
@@ -8349,13 +8328,9 @@ static void handle_2misc_satacc(DisasContext *s, bool is_scalar, bool is_u,
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
 
@@ -8855,9 +8830,7 @@ static void handle_vec_simd_shri(DisasContext *s, bool is_q, bool is_u,
     tcg_temp_free_i64(tcg_round);
 
  done:
-    if (!is_q) {
-        clear_vec_high(s, rd);
-    }
+    clear_vec_high(s, is_q, rd);
 }
 
 static void gen_shl8_ins_i64(TCGv_i64 d, TCGv_i64 a, unsigned shift)
@@ -9045,19 +9018,18 @@ static void handle_vec_simd_shrn(DisasContext *s, bool is_q,
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
 
 
@@ -9451,9 +9423,7 @@ static void handle_3rd_narrowing(DisasContext *s, int is_q, int is_u, int size,
         write_vec_element_i32(s, tcg_res[pass], rd, pass + part, MO_32);
         tcg_temp_free_i32(tcg_res[pass]);
     }
-    if (!is_q) {
-        clear_vec_high(s, rd);
-    }
+    clear_vec_high(s, is_q, rd);
 }
 
 static void handle_pmull_64(DisasContext *s, int is_q, int rd, int rn, int rm)
@@ -9877,9 +9847,7 @@ static void handle_simd_3same_pair(DisasContext *s, int is_q, int u, int opcode,
             write_vec_element_i32(s, tcg_res[pass], rd, pass, MO_32);
             tcg_temp_free_i32(tcg_res[pass]);
         }
-        if (!is_q) {
-            clear_vec_high(s, rd);
-        }
+        clear_vec_high(s, is_q, rd);
     }
 
     if (fpst) {
@@ -10372,10 +10340,7 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
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
@@ -10611,10 +10576,7 @@ static void disas_simd_three_reg_same_fp16(DisasContext *s, uint32_t insn)
 
     tcg_temp_free_ptr(fpst);
 
-    if (!is_q) {
-        /* non-quad vector op */
-        clear_vec_high(s, rd);
-    }
+    clear_vec_high(s, is_q, rd);
 }
 
 /* AdvSIMD three same extra
@@ -10846,9 +10808,7 @@ static void handle_rev(DisasContext *s, int opcode, bool u,
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
@@ -11499,9 +11459,7 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
             tcg_temp_free_i32(tcg_op);
         }
     }
-    if (!is_q) {
-        clear_vec_high(s, rd);
-    }
+    clear_vec_high(s, is_q, rd);
 
     if (need_rmode) {
         gen_helper_set_rmode(tcg_rmode, tcg_rmode, cpu_env);
@@ -11778,9 +11736,7 @@ static void disas_simd_two_reg_misc_fp16(DisasContext *s, uint32_t insn)
             tcg_temp_free_i32(tcg_op);
         }
 
-        if (!is_q) {
-            clear_vec_high(s, rd);
-        }
+        clear_vec_high(s, is_q, rd);
     }
 
     if (need_rmode) {
@@ -12029,12 +11985,8 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
             tcg_temp_free_i64(tcg_op);
             tcg_temp_free_i64(tcg_res);
         }
-
-        if (is_scalar) {
-            clear_vec_high(s, rd);
-        }
-
         tcg_temp_free_i64(tcg_idx);
+        clear_vec_high(s, !is_scalar, rd);
     } else if (!is_long) {
         /* 32 bit floating point, or 16 or 32 bit integer.
          * For the 16 bit scalar case we use the usual Neon helpers and
@@ -12198,12 +12150,8 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
             tcg_temp_free_i32(tcg_op);
             tcg_temp_free_i32(tcg_res);
         }
-
         tcg_temp_free_i32(tcg_idx);
-
-        if (!is_q) {
-            clear_vec_high(s, rd);
-        }
+        clear_vec_high(s, is_q, rd);
     } else {
         /* long ops: 16x16->32 or 32x32->64 */
         TCGv_i64 tcg_res[2];
@@ -12279,10 +12227,7 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
                 tcg_temp_free_i64(tcg_passres);
             }
             tcg_temp_free_i64(tcg_idx);
-
-            if (is_scalar) {
-                clear_vec_high(s, rd);
-            }
+            clear_vec_high(s, !is_scalar, rd);
         } else {
             TCGv_i32 tcg_idx = tcg_temp_new_i32();
 
-- 
2.14.3

