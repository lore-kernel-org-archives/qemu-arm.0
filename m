Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id v8sm9188933wmh.25.2018.02.27.06.38.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Feb 2018 06:39:05 -0800 (PST)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 1DF473E0C29;
	Tue, 27 Feb 2018 14:38:54 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	richard.henderson@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v4 16/31] arm/translate-a64: initial decode for simd_two_reg_misc_fp16
Date: Tue, 27 Feb 2018 14:38:37 +0000
Message-Id: <20180227143852.11175-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180227143852.11175-1-alex.bennee@linaro.org>
References: <20180227143852.11175-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: vYFKOyXecoiL

This actually covers two different sections of the encoding table:

   Advanced SIMD scalar two-register miscellaneous FP16
   Advanced SIMD two-register miscellaneous (FP16)

The difference between the two is covered by a combination of Q (bit
30) and S (bit 28). Notably the FRINTx instructions are only
available in the vector form.

This is just the decode skeleton which will be filled out by later
patches.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
v2
  - checkpatch cleanups
v3
  - update comment on group from following patches.
  - rm left over debug fpf
---
 target/arm/translate-a64.c | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 3487c0430f..9c1892c49a 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -11164,6 +11164,45 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
     }
 }
 
+/* AdvSIMD [scalar] two register miscellaneous (FP16)
+ *
+ *   31  30  29 28  27     24  23 22 21       17 16    12 11 10 9    5 4    0
+ * +---+---+---+---+---------+---+-------------+--------+-----+------+------+
+ * | 0 | Q | U | S | 1 1 1 0 | a | 1 1 1 1 0 0 | opcode | 1 0 |  Rn  |  Rd  |
+ * +---+---+---+---+---------+---+-------------+--------+-----+------+------+
+ *   mask: 1000 1111 0111 1110 0000 1100 0000 0000 0x8f7e 0c00
+ *   val:  0000 1110 0111 1000 0000 1000 0000 0000 0x0e78 0800
+ *
+ * This actually covers two groups where scalar access is governed by
+ * bit 28. A bunch of the instructions (float to integral) only exist
+ * in the vector form and are un-allocated for the scalar decode. Also
+ * in the scalar decode Q is always 1.
+ */
+static void disas_simd_two_reg_misc_fp16(DisasContext *s, uint32_t insn)
+{
+    int fpop, opcode, a;
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
+    opcode = extract32(insn, 12, 4);
+    a = extract32(insn, 23, 1);
+    fpop = deposit32(opcode, 5, 1, a);
+
+    switch (fpop) {
+    default:
+        fprintf(stderr, "%s: insn %#04x fpop %#2x\n", __func__, insn, fpop);
+        g_assert_not_reached();
+    }
+
+}
+
 /* AdvSIMD scalar x indexed element
  *  31 30  29 28       24 23  22 21  20  19  16 15 12  11  10 9    5 4    0
  * +-----+---+-----------+------+---+---+------+-----+---+---+------+------+
@@ -12236,6 +12275,7 @@ static const AArch64DecodeTable data_proc_simd[] = {
     { 0xce800000, 0xffe00000, disas_crypto_xar },
     { 0xce408000, 0xffe0c000, disas_crypto_three_reg_imm2 },
     { 0x0e400400, 0x9f60c400, disas_simd_three_reg_same_fp16 },
+    { 0x0e780800, 0x8f7e0c00, disas_simd_two_reg_misc_fp16 },
     { 0x00000000, 0x00000000, NULL }
 };
 
-- 
2.15.1
