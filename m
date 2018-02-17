Received: by 10.28.71.27 with SMTP id u27csp2069887wma;
        Sat, 17 Feb 2018 10:24:08 -0800 (PST)
X-Google-Smtp-Source: AH8x2249Z7EBgqJNW5NNsczrBKUH/lquyZNFSg7/r030CW1HbHNI0+8NO4nG3oqVapzOjfn60HF8
X-Received: by 10.37.175.198 with SMTP id d6mr6970384ybj.430.1518891848328;
        Sat, 17 Feb 2018 10:24:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518891848; cv=none;
        d=google.com; s=arc-20160816;
        b=Yj69MgaAz6pg4zRSvzOu2XCi7qy/uPytGTxb6jbrtbItcp55gt1Ea+oN2HMeEWkaC7
         dDEX1/UoNbzD5cyk0QunW44KU1oVr8tMI+0rHKNflq4Fs3z8uPZ9+FzKqw0UH6BAGUHF
         Hj4nc4rEhIrZdjli1eaGFmU2k0HtSLIBgkyJVxjxhVNLN8zaP78cQofvP02aJn3oVz/c
         n3VNxrYlmGjaRGEaBNBg+cqTPlVc9kmlOMPNWK7YN8GAEYaqC/GWhJLDxct5FkzB+D4H
         9YPIP2zHsDs4/7rAGjSZJTxre21yuZn8d129yU3Qi5q7ezAv2sGlaTBRzP4XnPe1jBC5
         YnXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=vA65R0gM6DJd7CAtKhNwANG6CnipdIvbj0v8v4ws5v0=;
        b=xy24iAPFWu/d5cDE4BKoJYhS2h2h1uvhLlDrYV7zI/5rXXlVYb5cy5C2NzmreqHer8
         5g9Yo/29dEPIno0eF6ZkFEKcQ2l3nFz6LAuV9eiKwXWGTkRzwTCi2eb4BlgnPV8x2cw+
         V13V3ocRni6mW2wIeZxwbFqiYZrXeRhPiARUfx7mA1zPZYsuOgitZZ93YsKKxysJ5yr1
         tTjrJBNAVvg66Oi1jMB6p7mZ1VjBFGdWVWVZkb6oREUwarFVurR3NEJnMfQTEB+tipPP
         Ase0Tfh4n5e+KoNjwnVWTyO4jI/ULuCYcst55L4YhJkf9/9R7ZofMcAFJRN0Y9wc9Vyy
         W45Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LgbRx/i/;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y2si3570976ywe.341.2018.02.17.10.24.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 17 Feb 2018 10:24:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LgbRx/i/;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48050 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1en79b-0000No-J1
	for alex.bennee@linaro.org; Sat, 17 Feb 2018 13:24:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39496)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en793-00005O-Fe
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:23:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en791-0001RZ-E3
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:23:33 -0500
Received: from mail-pl0-x243.google.com ([2607:f8b0:400e:c01::243]:38166)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1en791-0001RL-4q
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:23:31 -0500
Received: by mail-pl0-x243.google.com with SMTP id h10so3438778plt.5
	for <qemu-arm@nongnu.org>; Sat, 17 Feb 2018 10:23:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=vA65R0gM6DJd7CAtKhNwANG6CnipdIvbj0v8v4ws5v0=;
	b=LgbRx/i/daKnKXWQzLRHf5X4pz1xKZrLZGJXjequ6vBRObYm2NGR6NKiPXBxahEO7O
	QYo96J9EF5aA2piYfxgNCkXC6vT1HkEu05fBkcCHYxt4uXI1de/8yb89sKvIO/iQnHVD
	YyQ0vEnZfIoyee8JZjCilSx/GFyjj7QUfMt7U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=vA65R0gM6DJd7CAtKhNwANG6CnipdIvbj0v8v4ws5v0=;
	b=Ep/pp+RMElr9oG0l+Jj7PxcVZ4Sweb0mwfbZWWKAC96NU8f8RGQnOtnVuJFloBJY3s
	Y8MlZ1LbD96lfsrd2KyUURX0DfuGOQ2M8lUKwXj0bCPkQcVS7uiyS3OmXjNT18KONxz2
	R6R9JMSdTQL2u509Wu0Tu+971t6Hqm+cK7YbG8odirJtFO/j+qPfJ6Hi+cTVoYOSmmGG
	sXhzinQJAUYAsLF5fZHRIB0gZc8apYaJbhP6g3OSgblXUOOTxqaCz1BhAf4YvGE2TTe4
	weogBnYHwMkZix2ArFoZzdzTK+7vk884RW7c81Txj7y+INA1L2MFKoshdhn1m/mJiTse
	BamA==
X-Gm-Message-State: APf1xPCNWm/3FmiiCo8EE21EEeDKzwdiWeIkWXiBy2ubO7e0n3YKF/vK
	QFN6MdaYfsSegX0AippsEyjfbQ==
X-Received: by 2002:a17:902:4c88:: with SMTP id
	b8-v6mr9492851ple.233.1518891810059; 
	Sat, 17 Feb 2018 10:23:30 -0800 (PST)
Received: from cloudburst.twiddle.net ([50.0.192.64])
	by smtp.gmail.com with ESMTPSA id
	h15sm13466712pfi.56.2018.02.17.10.23.28
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 17 Feb 2018 10:23:29 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat, 17 Feb 2018 10:22:18 -0800
Message-Id: <20180217182323.25885-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180217182323.25885-1-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::243
Subject: [Qemu-arm] [PATCH v2 02/67] target/arm: Introduce translate-a64.h
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hpiszkVaTdiI

Move some stuff that will be common to both translate-a64.c
and translate-sve.c.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.h | 110 +++++++++++++++++++++++++++++++++++++++++++++
 target/arm/translate-a64.c | 101 ++++++-----------------------------------
 2 files changed, 123 insertions(+), 88 deletions(-)
 create mode 100644 target/arm/translate-a64.h

diff --git a/target/arm/translate-a64.h b/target/arm/translate-a64.h
new file mode 100644
index 0000000000..e519aee314
--- /dev/null
+++ b/target/arm/translate-a64.h
@@ -0,0 +1,110 @@
+/*
+ *  AArch64 translation, common definitions.
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef TARGET_ARM_TRANSLATE_A64_H
+#define TARGET_ARM_TRANSLATE_A64_H
+
+void unallocated_encoding(DisasContext *s);
+
+#define unsupported_encoding(s, insn)                                    \
+    do {                                                                 \
+        qemu_log_mask(LOG_UNIMP,                                         \
+                      "%s:%d: unsupported instruction encoding 0x%08x "  \
+                      "at pc=%016" PRIx64 "\n",                          \
+                      __FILE__, __LINE__, insn, s->pc - 4);              \
+        unallocated_encoding(s);                                         \
+    } while (0)
+
+TCGv_i64 new_tmp_a64(DisasContext *s);
+TCGv_i64 new_tmp_a64_zero(DisasContext *s);
+TCGv_i64 cpu_reg(DisasContext *s, int reg);
+TCGv_i64 cpu_reg_sp(DisasContext *s, int reg);
+TCGv_i64 read_cpu_reg(DisasContext *s, int reg, int sf);
+TCGv_i64 read_cpu_reg_sp(DisasContext *s, int reg, int sf);
+void write_fp_dreg(DisasContext *s, int reg, TCGv_i64 v);
+TCGv_ptr get_fpstatus_ptr(bool);
+bool logic_imm_decode_wmask(uint64_t *result, unsigned int immn,
+                            unsigned int imms, unsigned int immr);
+uint64_t vfp_expand_imm(int size, uint8_t imm8);
+
+/* We should have at some point before trying to access an FP register
+ * done the necessary access check, so assert that
+ * (a) we did the check and
+ * (b) we didn't then just plough ahead anyway if it failed.
+ * Print the instruction pattern in the abort message so we can figure
+ * out what we need to fix if a user encounters this problem in the wild.
+ */
+static inline void assert_fp_access_checked(DisasContext *s)
+{
+#ifdef CONFIG_DEBUG_TCG
+    if (unlikely(!s->fp_access_checked || s->fp_excp_el)) {
+        fprintf(stderr, "target-arm: FP access check missing for "
+                "instruction 0x%08x\n", s->insn);
+        abort();
+    }
+#endif
+}
+
+/* Return the offset into CPUARMState of an element of specified
+ * size, 'element' places in from the least significant end of
+ * the FP/vector register Qn.
+ */
+static inline int vec_reg_offset(DisasContext *s, int regno,
+                                 int element, TCGMemOp size)
+{
+    int offs = 0;
+#ifdef HOST_WORDS_BIGENDIAN
+    /* This is complicated slightly because vfp.zregs[n].d[0] is
+     * still the low half and vfp.zregs[n].d[1] the high half
+     * of the 128 bit vector, even on big endian systems.
+     * Calculate the offset assuming a fully bigendian 128 bits,
+     * then XOR to account for the order of the two 64 bit halves.
+     */
+    offs += (16 - ((element + 1) * (1 << size)));
+    offs ^= 8;
+#else
+    offs += element * (1 << size);
+#endif
+    offs += offsetof(CPUARMState, vfp.zregs[regno]);
+    assert_fp_access_checked(s);
+    return offs;
+}
+
+/* Return the offset info CPUARMState of the "whole" vector register Qn.  */
+static inline int vec_full_reg_offset(DisasContext *s, int regno)
+{
+    assert_fp_access_checked(s);
+    return offsetof(CPUARMState, vfp.zregs[regno]);
+}
+
+/* Return a newly allocated pointer to the vector register.  */
+static inline TCGv_ptr vec_full_reg_ptr(DisasContext *s, int regno)
+{
+    TCGv_ptr ret = tcg_temp_new_ptr();
+    tcg_gen_addi_ptr(ret, cpu_env, vec_full_reg_offset(s, regno));
+    return ret;
+}
+
+/* Return the byte size of the "whole" vector register, VL / 8.  */
+static inline int vec_full_reg_size(DisasContext *s)
+{
+    return s->sve_len;
+}
+
+bool disas_sve(DisasContext *, uint32_t);
+
+#endif /* TARGET_ARM_TRANSLATE_A64_H */
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 032cbfa17d..e0e7ebf68c 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -36,13 +36,13 @@
 #include "exec/log.h"
 
 #include "trace-tcg.h"
+#include "translate-a64.h"
 
 static TCGv_i64 cpu_X[32];
 static TCGv_i64 cpu_pc;
 
 /* Load/store exclusive handling */
 static TCGv_i64 cpu_exclusive_high;
-static TCGv_i64 cpu_reg(DisasContext *s, int reg);
 
 static const char *regnames[] = {
     "x0", "x1", "x2", "x3", "x4", "x5", "x6", "x7",
@@ -392,22 +392,13 @@ static inline void gen_goto_tb(DisasContext *s, int n, uint64_t dest)
     }
 }
 
-static void unallocated_encoding(DisasContext *s)
+void unallocated_encoding(DisasContext *s)
 {
     /* Unallocated and reserved encodings are uncategorized */
     gen_exception_insn(s, 4, EXCP_UDEF, syn_uncategorized(),
                        default_exception_el(s));
 }
 
-#define unsupported_encoding(s, insn)                                    \
-    do {                                                                 \
-        qemu_log_mask(LOG_UNIMP,                                         \
-                      "%s:%d: unsupported instruction encoding 0x%08x "  \
-                      "at pc=%016" PRIx64 "\n",                          \
-                      __FILE__, __LINE__, insn, s->pc - 4);              \
-        unallocated_encoding(s);                                         \
-    } while (0)
-
 static void init_tmp_a64_array(DisasContext *s)
 {
 #ifdef CONFIG_DEBUG_TCG
@@ -425,13 +416,13 @@ static void free_tmp_a64(DisasContext *s)
     init_tmp_a64_array(s);
 }
 
-static TCGv_i64 new_tmp_a64(DisasContext *s)
+TCGv_i64 new_tmp_a64(DisasContext *s)
 {
     assert(s->tmp_a64_count < TMP_A64_MAX);
     return s->tmp_a64[s->tmp_a64_count++] = tcg_temp_new_i64();
 }
 
-static TCGv_i64 new_tmp_a64_zero(DisasContext *s)
+TCGv_i64 new_tmp_a64_zero(DisasContext *s)
 {
     TCGv_i64 t = new_tmp_a64(s);
     tcg_gen_movi_i64(t, 0);
@@ -453,7 +444,7 @@ static TCGv_i64 new_tmp_a64_zero(DisasContext *s)
  * to cpu_X[31] and ZR accesses to a temporary which can be discarded.
  * This is the point of the _sp forms.
  */
-static TCGv_i64 cpu_reg(DisasContext *s, int reg)
+TCGv_i64 cpu_reg(DisasContext *s, int reg)
 {
     if (reg == 31) {
         return new_tmp_a64_zero(s);
@@ -463,7 +454,7 @@ static TCGv_i64 cpu_reg(DisasContext *s, int reg)
 }
 
 /* register access for when 31 == SP */
-static TCGv_i64 cpu_reg_sp(DisasContext *s, int reg)
+TCGv_i64 cpu_reg_sp(DisasContext *s, int reg)
 {
     return cpu_X[reg];
 }
@@ -472,7 +463,7 @@ static TCGv_i64 cpu_reg_sp(DisasContext *s, int reg)
  * representing the register contents. This TCGv is an auto-freed
  * temporary so it need not be explicitly freed, and may be modified.
  */
-static TCGv_i64 read_cpu_reg(DisasContext *s, int reg, int sf)
+TCGv_i64 read_cpu_reg(DisasContext *s, int reg, int sf)
 {
     TCGv_i64 v = new_tmp_a64(s);
     if (reg != 31) {
@@ -487,7 +478,7 @@ static TCGv_i64 read_cpu_reg(DisasContext *s, int reg, int sf)
     return v;
 }
 
-static TCGv_i64 read_cpu_reg_sp(DisasContext *s, int reg, int sf)
+TCGv_i64 read_cpu_reg_sp(DisasContext *s, int reg, int sf)
 {
     TCGv_i64 v = new_tmp_a64(s);
     if (sf) {
@@ -498,72 +489,6 @@ static TCGv_i64 read_cpu_reg_sp(DisasContext *s, int reg, int sf)
     return v;
 }
 
-/* We should have at some point before trying to access an FP register
- * done the necessary access check, so assert that
- * (a) we did the check and
- * (b) we didn't then just plough ahead anyway if it failed.
- * Print the instruction pattern in the abort message so we can figure
- * out what we need to fix if a user encounters this problem in the wild.
- */
-static inline void assert_fp_access_checked(DisasContext *s)
-{
-#ifdef CONFIG_DEBUG_TCG
-    if (unlikely(!s->fp_access_checked || s->fp_excp_el)) {
-        fprintf(stderr, "target-arm: FP access check missing for "
-                "instruction 0x%08x\n", s->insn);
-        abort();
-    }
-#endif
-}
-
-/* Return the offset into CPUARMState of an element of specified
- * size, 'element' places in from the least significant end of
- * the FP/vector register Qn.
- */
-static inline int vec_reg_offset(DisasContext *s, int regno,
-                                 int element, TCGMemOp size)
-{
-    int offs = 0;
-#ifdef HOST_WORDS_BIGENDIAN
-    /* This is complicated slightly because vfp.zregs[n].d[0] is
-     * still the low half and vfp.zregs[n].d[1] the high half
-     * of the 128 bit vector, even on big endian systems.
-     * Calculate the offset assuming a fully bigendian 128 bits,
-     * then XOR to account for the order of the two 64 bit halves.
-     */
-    offs += (16 - ((element + 1) * (1 << size)));
-    offs ^= 8;
-#else
-    offs += element * (1 << size);
-#endif
-    offs += offsetof(CPUARMState, vfp.zregs[regno]);
-    assert_fp_access_checked(s);
-    return offs;
-}
-
-/* Return the offset info CPUARMState of the "whole" vector register Qn.  */
-static inline int vec_full_reg_offset(DisasContext *s, int regno)
-{
-    assert_fp_access_checked(s);
-    return offsetof(CPUARMState, vfp.zregs[regno]);
-}
-
-/* Return a newly allocated pointer to the vector register.  */
-static TCGv_ptr vec_full_reg_ptr(DisasContext *s, int regno)
-{
-    TCGv_ptr ret = tcg_temp_new_ptr();
-    tcg_gen_addi_ptr(ret, cpu_env, vec_full_reg_offset(s, regno));
-    return ret;
-}
-
-/* Return the byte size of the "whole" vector register, VL / 8.  */
-static inline int vec_full_reg_size(DisasContext *s)
-{
-    /* FIXME SVE: We should put the composite ZCR_EL* value into tb->flags.
-       In the meantime this is just the AdvSIMD length of 128.  */
-    return 128 / 8;
-}
-
 /* Return the offset into CPUARMState of a slice (from
  * the least significant end) of FP register Qn (ie
  * Dn, Sn, Hn or Bn).
@@ -620,7 +545,7 @@ static void clear_vec_high(DisasContext *s, bool is_q, int rd)
     }
 }
 
-static void write_fp_dreg(DisasContext *s, int reg, TCGv_i64 v)
+void write_fp_dreg(DisasContext *s, int reg, TCGv_i64 v)
 {
     unsigned ofs = fp_reg_offset(s, reg, MO_64);
 
@@ -637,7 +562,7 @@ static void write_fp_sreg(DisasContext *s, int reg, TCGv_i32 v)
     tcg_temp_free_i64(tmp);
 }
 
-static TCGv_ptr get_fpstatus_ptr(bool is_f16)
+TCGv_ptr get_fpstatus_ptr(bool is_f16)
 {
     TCGv_ptr statusptr = tcg_temp_new_ptr();
     int offset;
@@ -3130,8 +3055,8 @@ static inline uint64_t bitmask64(unsigned int length)
  * value (ie should cause a guest UNDEF exception), and true if they are
  * valid, in which case the decoded bit pattern is written to result.
  */
-static bool logic_imm_decode_wmask(uint64_t *result, unsigned int immn,
-                                   unsigned int imms, unsigned int immr)
+bool logic_imm_decode_wmask(uint64_t *result, unsigned int immn,
+                            unsigned int imms, unsigned int immr)
 {
     uint64_t mask;
     unsigned e, levels, s, r;
@@ -5164,7 +5089,7 @@ static void disas_fp_3src(DisasContext *s, uint32_t insn)
  * the range 01....1xx to 10....0xx, and the most significant 4 bits of
  * the mantissa; see VFPExpandImm() in the v8 ARM ARM.
  */
-static uint64_t vfp_expand_imm(int size, uint8_t imm8)
+uint64_t vfp_expand_imm(int size, uint8_t imm8)
 {
     uint64_t imm;
 
-- 
2.14.3

