Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id p21sm418801wmc.28.2018.02.08.09.40.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Feb 2018 09:40:30 -0800 (PST)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id E009C3E0FB8;
	Thu,  8 Feb 2018 17:31:59 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 29/32] arm/translate-a64: add FP16 FMOV to simd_mod_imm
Date: Thu,  8 Feb 2018 17:31:54 +0000
Message-Id: <20180208173157.24705-30-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180208173157.24705-1-alex.bennee@linaro.org>
References: <20180208173157.24705-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: s2bLXEiOOQiD

Only one half-precision instruction has been added to this group.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - checkpatch fixes
---
 target/arm/translate-a64.c | 48 ++++++++++++++++++++++++++++++++++++----------
 1 file changed, 38 insertions(+), 10 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index fa21299061..b209f57d55 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -6160,6 +6160,8 @@ static void disas_simd_copy(DisasContext *s, uint32_t insn)
  *   MVNI - move inverted (shifted) imm into register
  *   ORR  - bitwise OR of (shifted) imm with register
  *   BIC  - bitwise clear of (shifted) imm with register
+ * With ARMv8.2 we also have:
+ *   FMOV half-precision
  */
 static void disas_simd_mod_imm(DisasContext *s, uint32_t insn)
 {
@@ -6176,8 +6178,11 @@ static void disas_simd_mod_imm(DisasContext *s, uint32_t insn)
     int i;
 
     if (o2 != 0 || ((cmode == 0xf) && is_neg && !is_q)) {
-        unallocated_encoding(s);
-        return;
+        /* Check for FMOV (vector, immediate) - half-precision */
+        if (!(arm_dc_feature(s, ARM_FEATURE_V8_FP16) && o2 && cmode == 0xf)) {
+            unallocated_encoding(s);
+            return;
+        }
     }
 
     if (!fp_access_check(s)) {
@@ -6235,19 +6240,42 @@ static void disas_simd_mod_imm(DisasContext *s, uint32_t insn)
                     imm |= 0x4000000000000000ULL;
                 }
             } else {
-                imm = (abcdefgh & 0x3f) << 19;
-                if (abcdefgh & 0x80) {
-                    imm |= 0x80000000;
-                }
-                if (abcdefgh & 0x40) {
-                    imm |= 0x3e000000;
+                if (o2) {
+                    /* FMOV (vector, immediate) - half-precision
+                     *
+                     * We don't need fancy immediate expansion, just:
+                     * imm16 = imm8<7>:NOT(imm8<6>):Replicate(imm8<6>,2):
+                     *         imm8<5:0>:Zeros(6);
+                     */
+                    uint32_t imm8_5_0 = extract32(abcdefgh, 0, 6);
+                    uint32_t imm8_6 = extract32(abcdefgh, 6, 1);
+                    uint32_t imm8_7 = extract32(abcdefgh, 7, 1);
+                    uint32_t imm8_6_rep = imm8_6 << 1 | imm8_6;
+                    uint32_t imm8_6_not = ~imm8_6;
+                    imm = deposit64(imm, 6, 6, imm8_5_0);
+                    imm = deposit64(imm, 12, 2, imm8_6_rep);
+                    imm = deposit64(imm, 14, 1, imm8_6_not);
+                    imm = deposit64(imm, 15, 1, imm8_7);
+                    /* now duplicate across the lanes */
+                    imm = bitfield_replicate(imm, 16);
                 } else {
-                    imm |= 0x40000000;
+                    imm = (abcdefgh & 0x3f) << 19;
+                    if (abcdefgh & 0x80) {
+                        imm |= 0x80000000;
+                    }
+                    if (abcdefgh & 0x40) {
+                        imm |= 0x3e000000;
+                    } else {
+                        imm |= 0x40000000;
+                    }
+                    imm |= (imm << 32);
                 }
-                imm |= (imm << 32);
             }
         }
         break;
+    default:
+        fprintf(stderr, "%s: cmode_3_1: %x\n", __func__, cmode_3_1);
+        g_assert_not_reached();
     }
 
     if (cmode_3_1 != 7 && is_neg) {
-- 
2.15.1
