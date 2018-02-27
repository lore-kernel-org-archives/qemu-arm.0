Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id c1sm10230586wre.10.2018.02.27.06.38.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Feb 2018 06:38:59 -0800 (PST)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 790BC3E0990;
	Tue, 27 Feb 2018 14:38:53 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	richard.henderson@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v4 08/31] arm/translate-a64: initial decode for simd_three_reg_same_fp16
Date: Tue, 27 Feb 2018 14:38:29 +0000
Message-Id: <20180227143852.11175-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180227143852.11175-1-alex.bennee@linaro.org>
References: <20180227143852.11175-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: oXiJUMVZQRiQ

This is the initial decode skeleton for the Advanced SIMD three same
instruction group.

The fprintf is purely to aid debugging as the additional instructions
are added. It will be removed once the group is complete.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 73 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 5dd54b7ac4..4828457b5b 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -10228,6 +10228,78 @@ static void disas_simd_three_reg_same(DisasContext *s, uint32_t insn)
     }
 }
 
+/*
+ * Advanced SIMD three same (ARMv8.2 FP16 variants)
+ *
+ *  31  30  29  28       24 23  22 21 20  16 15 14 13    11 10  9    5 4    0
+ * +---+---+---+-----------+---------+------+-----+--------+---+------+------+
+ * | 0 | Q | U | 0 1 1 1 0 | a | 1 0 |  Rm  | 0 0 | opcode | 1 |  Rn  |  Rd  |
+ * +---+---+---+-----------+---------+------+-----+--------+---+------+------+
+ *
+ * This includes FMULX, FCMEQ (register), FRECPS, FRSQRTS, FCMGE
+ * (register), FACGE, FABD, FCMGT (register) and FACGT.
+ *
+ */
+static void disas_simd_three_reg_same_fp16(DisasContext *s, uint32_t insn)
+{
+    int opcode, fpopcode;
+    int is_q, u, a, rm, rn, rd;
+    int datasize, elements;
+    int pass;
+    TCGv_ptr fpst;
+
+    if (!arm_dc_feature(s, ARM_FEATURE_V8_FP16)) {
+        unallocated_encoding(s);
+        return;
+    }
+
+    if (!fp_access_check(s)) {
+        return;
+    }
+
+    /* For these floating point ops, the U, a and opcode bits
+     * together indicate the operation.
+     */
+    opcode = extract32(insn, 11, 3);
+    u = extract32(insn, 29, 1);
+    a = extract32(insn, 23, 1);
+    is_q = extract32(insn, 30, 1);
+    rm = extract32(insn, 16, 5);
+    rn = extract32(insn, 5, 5);
+    rd = extract32(insn, 0, 5);
+
+    fpopcode = opcode | (a << 3) |  (u << 4);
+    datasize = is_q ? 128 : 64;
+    elements = datasize / 16;
+
+    fpst = get_fpstatus_ptr(true);
+
+    for (pass = 0; pass < elements; pass++) {
+        TCGv_i32 tcg_op1 = tcg_temp_new_i32();
+        TCGv_i32 tcg_op2 = tcg_temp_new_i32();
+        TCGv_i32 tcg_res = tcg_temp_new_i32();
+
+        read_vec_element_i32(s, tcg_op1, rn, pass, MO_16);
+        read_vec_element_i32(s, tcg_op2, rm, pass, MO_16);
+
+        switch (fpopcode) {
+        default:
+            fprintf(stderr, "%s: insn %#04x, fpop %#2x @ %#" PRIx64 "\n",
+                    __func__, insn, fpopcode, s->pc);
+            g_assert_not_reached();
+        }
+
+        write_vec_element_i32(s, tcg_res, rd, pass, MO_16);
+        tcg_temp_free_i32(tcg_res);
+        tcg_temp_free_i32(tcg_op1);
+        tcg_temp_free_i32(tcg_op2);
+    }
+
+    tcg_temp_free_ptr(fpst);
+
+    clear_vec_high(s, is_q, rd);
+}
+
 static void handle_2misc_widening(DisasContext *s, int opcode, bool is_q,
                                   int size, int rn, int rd)
 {
@@ -11975,6 +12047,7 @@ static const AArch64DecodeTable data_proc_simd[] = {
     { 0xce000000, 0xff808000, disas_crypto_four_reg },
     { 0xce800000, 0xffe00000, disas_crypto_xar },
     { 0xce408000, 0xffe0c000, disas_crypto_three_reg_imm2 },
+    { 0x0e400400, 0x9f60c400, disas_simd_three_reg_same_fp16 },
     { 0x00000000, 0x00000000, NULL }
 };
 
-- 
2.15.1
