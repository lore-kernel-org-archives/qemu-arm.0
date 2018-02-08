Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id a19sm573449wrg.9.2018.02.08.09.40.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Feb 2018 09:40:25 -0800 (PST)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 03ED13E0D1C;
	Thu,  8 Feb 2018 17:31:59 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 17/32] arm/translate-a64: initial decode for simd_two_reg_misc_fp16
Date: Thu,  8 Feb 2018 17:31:42 +0000
Message-Id: <20180208173157.24705-18-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180208173157.24705-1-alex.bennee@linaro.org>
References: <20180208173157.24705-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: t/mnMJPh3/z/

This actually covers two different sections of the encoding table:

   Advanced SIMD scalar two-register miscellaneous FP16
   Advanced SIMD two-register miscellaneous (FP16)

The difference between the two is covered by a combination of Q (bit
30) and S (bit 28). Notably the FRINTx instructions are only
available in the vector form.

This is just the decode skeleton which will be filled out by later
patches.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - checkpatch cleanups
---
 target/arm/translate-a64.c | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index f01bab801c..f939ca4d40 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -10724,6 +10724,45 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
     }
 }
 
+/* AdvSIMD [scalar] two register miscellaneous (FP16)
+ *
+ *   31  30  29 28  27     24  23 22 21       17 16    12 11 10 9    5 4    0
+ * +---+---+---+---+--------+---+-------------+--------+-----+------+------+
+ * | 0 | Q | U | S | 1 1 1 0 | a | 1 1 1 1 0 0 | opcode | 1 0 |  Rn  |  Rd  |
+ * +---+---+---+---+--------+---+-------------+--------+-----+------+------+
+ *   mask: 1000 1111 0111 1110 0000 1100 0000 0000 0x8f7e 0c00
+ *   val:  0000 1110 0111 1000 0000 1000 0000 0000 0x0e78 0800
+ *
+ * ???While the group is listed with bit 28 always set to 1 this is not
+ * always the case.????
+ *
+ * This actually covers two groups,
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
@@ -11459,6 +11498,7 @@ static const AArch64DecodeTable data_proc_simd[] = {
     { 0x5e000000, 0xff208c00, disas_crypto_three_reg_sha },
     { 0x5e280800, 0xff3e0c00, disas_crypto_two_reg_sha },
     { 0x0e400400, 0x9f60c400, disas_simd_three_reg_same_fp16 },
+    { 0x0e780800, 0x8f7e0c00, disas_simd_two_reg_misc_fp16 },
     { 0x00000000, 0x00000000, NULL }
 };
 
@@ -11472,6 +11512,8 @@ static void disas_data_proc_simd(DisasContext *s, uint32_t insn)
     if (fn) {
         fn(s, insn);
     } else {
+        /* fprintf(stderr, "%s: failed to find %#4x @ %#" PRIx64 "\n", */
+        /*         __func__, insn, s->pc); */
         unallocated_encoding(s);
     }
 }
-- 
2.15.1
