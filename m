Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id b10-v6sm7968130wrp.49.2018.07.19.08.42.54
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Jul 2018 08:42:54 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 1543E3E02A5;
	Thu, 19 Jul 2018 16:42:54 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: richard.henderson@linaro.org
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Claudio Fontana <claudio.fontana@huawei.com>,
	Richard Henderson <rth@twiddle.net>
Subject: [PATCH] tcg/aarch64: limit mul_vec size
Date: Thu, 19 Jul 2018 16:42:48 +0100
Message-Id: <20180719154248.29669-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: UfZdekouQhUB

In AdvSIMD we can only do 32x32 integer multiples although SVE is
capable of larger 64 bit multiples. As a result we can end up
generating invalid opcodes. Fix this by only reprting we can emit mul
vector ops if the size is small enough.

Fixes a crash on:

  sve-all-short-v8.3+sve@vq3/insn_mul_z_zi___INC.risu.bin

When running on AArch64 hardware.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tcg/aarch64/tcg-target.inc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tcg/aarch64/tcg-target.inc.c b/tcg/aarch64/tcg-target.inc.c
index 4562d36d1b..3d08bdd2e3 100644
--- a/tcg/aarch64/tcg-target.inc.c
+++ b/tcg/aarch64/tcg-target.inc.c
@@ -718,6 +718,7 @@ static void tcg_out_insn_3614(TCGContext *s, AArch64Insn insn, bool q,
 static void tcg_out_insn_3616(TCGContext *s, AArch64Insn insn, bool q,
                               unsigned size, TCGReg rd, TCGReg rn, TCGReg rm)
 {
+    tcg_debug_assert(!(insn == I3616_MUL && size == 3));
     tcg_out32(s, insn | q << 30 | (size << 22) | (rm & 0x1f) << 16
               | (rn & 0x1f) << 5 | (rd & 0x1f));
 }
@@ -2219,7 +2220,6 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
     switch (opc) {
     case INDEX_op_add_vec:
     case INDEX_op_sub_vec:
-    case INDEX_op_mul_vec:
     case INDEX_op_and_vec:
     case INDEX_op_or_vec:
     case INDEX_op_xor_vec:
@@ -2232,6 +2232,8 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
     case INDEX_op_shri_vec:
     case INDEX_op_sari_vec:
         return 1;
+    case INDEX_op_mul_vec:
+        return vece < MO_64 ? 1 : 0;
 
     default:
         return 0;
-- 
2.17.1
