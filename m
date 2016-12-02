Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id y4sm6675556wjp.0.2016.12.02.09.35.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 02 Dec 2016 09:35:01 -0800 (PST)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 5B2003E018B;
	Fri,  2 Dec 2016 17:35:01 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: stefanha@redhat.com,
	peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org,
	cota@braap.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM)
Subject: [PATCH for-2.8] target-arm/translate-a64: fix gen_load_exclusive
Date: Fri,  2 Dec 2016 17:34:54 +0000
Message-Id: <20161202173454.19179-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.10.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: zArE6pE77Nh5

While testing rth's latest TCG patches with risu I found ldaxp was
broken. Investigating further I found it was broken by 1dd089d0 when
the cmpxchg atomic work was merged. As part of that change the code
attempted to be clever by doing a single 64 bit load and then shuffle
the data around to set the two 32 bit registers.

As I couldn't quite follow the endian magic I've simply partially
reverted the change to the original code gen_load_exclusive code. This
doesn't affect the cmpxchg functionality as that is all done on in
gen_store_exclusive part which is untouched.

I've also restored the comment that was removed (with a slight tweak
to mention cmpxchg).

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target-arm/translate-a64.c | 42 +++++++++++++++++++-----------------------
 1 file changed, 19 insertions(+), 23 deletions(-)

diff --git a/target-arm/translate-a64.c b/target-arm/translate-a64.c
index de48747..6dc27a6 100644
--- a/target-arm/translate-a64.c
+++ b/target-arm/translate-a64.c
@@ -1839,41 +1839,37 @@ static void disas_b_exc_sys(DisasContext *s, uint32_t insn)
     }
 }
 
+/*
+ * Load/Store exclusive instructions are implemented by remembering
+ * the value/address loaded, and seeing if these are the same
+ * when the store is performed. This is not actually the architecturally
+ * mandated semantics, but it works for typical guest code sequences
+ * and avoids having to monitor regular stores.
+ *
+ * The store exclusive uses the atomic cmpxchg primitives to avoid
+ * races in multi-threaded linux-user and when MTTCG softmmu is
+ * enabled.
+ */
 static void gen_load_exclusive(DisasContext *s, int rt, int rt2,
                                TCGv_i64 addr, int size, bool is_pair)
 {
     TCGv_i64 tmp = tcg_temp_new_i64();
-    TCGMemOp be = s->be_data;
+    TCGMemOp memop = s->be_data + size;
 
     g_assert(size <= 3);
+    tcg_gen_qemu_ld_i64(tmp, addr, get_mem_index(s), memop);
+
     if (is_pair) {
+        TCGv_i64 addr2 = tcg_temp_new_i64();
         TCGv_i64 hitmp = tcg_temp_new_i64();
 
-        if (size == 3) {
-            TCGv_i64 addr2 = tcg_temp_new_i64();
-
-            tcg_gen_qemu_ld_i64(tmp, addr, get_mem_index(s),
-                                MO_64 | MO_ALIGN_16 | be);
-            tcg_gen_addi_i64(addr2, addr, 8);
-            tcg_gen_qemu_ld_i64(hitmp, addr2, get_mem_index(s),
-                                MO_64 | MO_ALIGN | be);
-            tcg_temp_free_i64(addr2);
-        } else {
-            g_assert(size == 2);
-            tcg_gen_qemu_ld_i64(tmp, addr, get_mem_index(s),
-                                MO_64 | MO_ALIGN | be);
-            if (be == MO_LE) {
-                tcg_gen_extr32_i64(tmp, hitmp, tmp);
-            } else {
-                tcg_gen_extr32_i64(hitmp, tmp, tmp);
-            }
-        }
-
+        g_assert(size >= 2);
+        tcg_gen_addi_i64(addr2, addr, 1 << size);
+        tcg_gen_qemu_ld_i64(hitmp, addr2, get_mem_index(s), memop);
+        tcg_temp_free_i64(addr2);
         tcg_gen_mov_i64(cpu_exclusive_high, hitmp);
         tcg_gen_mov_i64(cpu_reg(s, rt2), hitmp);
         tcg_temp_free_i64(hitmp);
-    } else {
-        tcg_gen_qemu_ld_i64(tmp, addr, get_mem_index(s), size | MO_ALIGN | be);
     }
 
     tcg_gen_mov_i64(cpu_exclusive_val, tmp);
-- 
2.10.2
