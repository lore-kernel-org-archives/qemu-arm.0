Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id k45sm10770888wrf.62.2018.02.27.06.48.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Feb 2018 06:48:00 -0800 (PST)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 2E10B3E166A;
	Tue, 27 Feb 2018 14:38:55 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	richard.henderson@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v4 30/31] arm/translate-a64: implement simd_scalar_three_reg_same_fp16
Date: Tue, 27 Feb 2018 14:38:51 +0000
Message-Id: <20180227143852.11175-31-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180227143852.11175-1-alex.bennee@linaro.org>
References: <20180227143852.11175-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: P5s8LW0upT5+

This covers the encoding group:

  Advanced SIMD scalar three same FP16

As all the helpers are already there it is simply a case of calling the
existing helpers in the scalar context.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
v2
  - checkpatch fixes
v3
  - check for FP16 feature
  - remove stray debug
  - make abs a bitwise operation
  - checkpatch long line
---
 target/arm/translate-a64.c | 99 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 9d3a6ac49f..52cecae047 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -7802,6 +7802,104 @@ static void disas_simd_scalar_three_reg_same(DisasContext *s, uint32_t insn)
     tcg_temp_free_i64(tcg_rd);
 }
 
+/* AdvSIMD scalar three same FP16
+ *  31 30  29 28       24 23  22 21 20  16 15 14 13    11 10  9  5 4  0
+ * +-----+---+-----------+---+-----+------+-----+--------+---+----+----+
+ * | 0 1 | U | 1 1 1 1 0 | a | 1 0 |  Rm  | 0 0 | opcode | 1 | Rn | Rd |
+ * +-----+---+-----------+---+-----+------+-----+--------+---+----+----+
+ * v: 0101 1110 0100 0000 0000 0100 0000 0000 => 5e400400
+ * m: 1101 1111 0110 0000 1100 0100 0000 0000 => df60c400
+ */
+static void disas_simd_scalar_three_reg_same_fp16(DisasContext *s,
+                                                  uint32_t insn)
+{
+    int rd = extract32(insn, 0, 5);
+    int rn = extract32(insn, 5, 5);
+    int opcode = extract32(insn, 11, 3);
+    int rm = extract32(insn, 16, 5);
+    bool u = extract32(insn, 29, 1);
+    bool a = extract32(insn, 23, 1);
+    int fpopcode = opcode | (a << 3) |  (u << 4);
+    TCGv_ptr fpst;
+    TCGv_i32 tcg_op1;
+    TCGv_i32 tcg_op2;
+    TCGv_i32 tcg_res;
+
+    switch (fpopcode) {
+    case 0x03: /* FMULX */
+    case 0x04: /* FCMEQ (reg) */
+    case 0x07: /* FRECPS */
+    case 0x0f: /* FRSQRTS */
+    case 0x14: /* FCMGE (reg) */
+    case 0x15: /* FACGE */
+    case 0x1a: /* FABD */
+    case 0x1c: /* FCMGT (reg) */
+    case 0x1d: /* FACGT */
+        break;
+    default:
+        unallocated_encoding(s);
+        return;
+    }
+
+    if (!arm_dc_feature(s, ARM_FEATURE_V8_FP16)) {
+        unallocated_encoding(s);
+    }
+
+    if (!fp_access_check(s)) {
+        return;
+    }
+
+    fpst = get_fpstatus_ptr(true);
+
+    tcg_op1 = tcg_temp_new_i32();
+    tcg_op2 = tcg_temp_new_i32();
+    tcg_res = tcg_temp_new_i32();
+
+    read_vec_element_i32(s, tcg_op1, rn, 0, MO_16);
+    read_vec_element_i32(s, tcg_op2, rm, 0, MO_16);
+
+    switch (fpopcode) {
+    case 0x03: /* FMULX */
+        gen_helper_advsimd_mulxh(tcg_res, tcg_op1, tcg_op2, fpst);
+        break;
+    case 0x04: /* FCMEQ (reg) */
+        gen_helper_advsimd_ceq_f16(tcg_res, tcg_op1, tcg_op2, fpst);
+        break;
+    case 0x07: /* FRECPS */
+        gen_helper_recpsf_f16(tcg_res, tcg_op1, tcg_op2, fpst);
+        break;
+    case 0x0f: /* FRSQRTS */
+        gen_helper_rsqrtsf_f16(tcg_res, tcg_op1, tcg_op2, fpst);
+        break;
+    case 0x14: /* FCMGE (reg) */
+        gen_helper_advsimd_cge_f16(tcg_res, tcg_op1, tcg_op2, fpst);
+        break;
+    case 0x15: /* FACGE */
+        gen_helper_advsimd_acge_f16(tcg_res, tcg_op1, tcg_op2, fpst);
+        break;
+    case 0x1a: /* FABD */
+        gen_helper_advsimd_subh(tcg_res, tcg_op1, tcg_op2, fpst);
+        tcg_gen_andi_i32(tcg_res, tcg_res, 0x7fff);
+        break;
+    case 0x1c: /* FCMGT (reg) */
+        gen_helper_advsimd_cgt_f16(tcg_res, tcg_op1, tcg_op2, fpst);
+        break;
+    case 0x1d: /* FACGT */
+        gen_helper_advsimd_acgt_f16(tcg_res, tcg_op1, tcg_op2, fpst);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    write_fp_sreg(s, rd, tcg_res);
+
+
+    tcg_temp_free_i32(tcg_res);
+    tcg_temp_free_i32(tcg_op1);
+    tcg_temp_free_i32(tcg_op2);
+    tcg_temp_free_ptr(fpst);
+}
+
 static void handle_2misc_64(DisasContext *s, int opcode, bool u,
                             TCGv_i64 tcg_rd, TCGv_i64 tcg_rn,
                             TCGv_i32 tcg_rmode, TCGv_ptr tcg_fpstatus)
@@ -12653,6 +12751,7 @@ static const AArch64DecodeTable data_proc_simd[] = {
     { 0xce408000, 0xffe0c000, disas_crypto_three_reg_imm2 },
     { 0x0e400400, 0x9f60c400, disas_simd_three_reg_same_fp16 },
     { 0x0e780800, 0x8f7e0c00, disas_simd_two_reg_misc_fp16 },
+    { 0x5e400400, 0xdf60c400, disas_simd_scalar_three_reg_same_fp16 },
     { 0x00000000, 0x00000000, NULL }
 };
 
-- 
2.15.1
