Received: by 10.25.208.194 with SMTP id h185csp1930626lfg;
        Tue, 19 Apr 2016 06:41:00 -0700 (PDT)
X-Received: by 10.194.175.168 with SMTP id cb8mr3309313wjc.56.1461073235049;
        Tue, 19 Apr 2016 06:40:35 -0700 (PDT)
Return-Path: <mttcg-owner@listserver.greensocs.com>
Received: from greensocs.com (greensocs.com. [193.104.36.180])
        by mx.google.com with ESMTP id 194si4351849wmj.31.2016.04.19.06.40.34;
        Tue, 19 Apr 2016 06:40:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of mttcg-owner@listserver.greensocs.com designates 193.104.36.180 as permitted sender) client-ip=193.104.36.180;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@virtualopensystems-com.20150623.gappssmtp.com;
       spf=pass (google.com: domain of mttcg-owner@listserver.greensocs.com designates 193.104.36.180 as permitted sender) smtp.mailfrom=mttcg-owner@listserver.greensocs.com
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 9422C2C0804;
	Tue, 19 Apr 2016 15:40:34 +0200 (CEST)
Authentication-Results: greensocs.com;
	dkim=pass (2048-bit key) header.d=virtualopensystems-com.20150623.gappssmtp.com header.i=@virtualopensystems-com.20150623.gappssmtp.com header.b=jAXRR3+u
X-Virus-Scanned: amavisd-new at greensocs.com
X-Spam-Flag: NO
X-Spam-Score: -1.898
X-Spam-Level:
X-Spam-Status: No, score=-1.898 tagged_above=-999 required=6.2
	tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	HEADER_FROM_DIFFERENT_DOMAINS=0.001, HK_RANDOM_ENVFROM=0.001]
	autolearn=no autolearn_force=no
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (2048-bit key)
	header.d=virtualopensystems-com.20150623.gappssmtp.com
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JYmhimOyiOX1; Tue, 19 Apr 2016 15:40:33 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 123)
	id A97582C0805; Tue, 19 Apr 2016 15:40:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 4650A2C0805
	for <mttcg@listserver.greensocs.com>; Tue, 19 Apr 2016 15:40:17 +0200 (CEST)
X-Virus-Scanned: amavisd-new at greensocs.com
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tOWfsJVFzVfU for <mttcg@listserver.greensocs.com>;
	Tue, 19 Apr 2016 15:40:16 +0200 (CEST)
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by greensocs.com (Postfix) with ESMTPS id 17C632C004E
	for <mttcg@listserver.greensocs.com>; Tue, 19 Apr 2016 15:39:57 +0200 (CEST)
Received: by mail-wm0-f68.google.com with SMTP id y144so5292326wmd.0
        for <mttcg@listserver.greensocs.com>; Tue, 19 Apr 2016 06:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=virtualopensystems-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=4/tR93+PnEmKCCT10UwnRvrI+SPYqnPWqQaeEYdfPoE=;
        b=jAXRR3+uSNYOXTrwsjF0CHFBsGUrhTw4fWrMHTSuuZ5qV4qQn9NmehBhLv6l7Ra8hA
         fiD05QecTTRNX4FE1DdNbIwHDKkhy7ToMCnNE1aXL4BlZugZKOFCpmlAQWGgbp9S94wH
         aJMhhwneDSeSXddIdz5ryw8bxf5UeJzN2vlTs8flNm8UrNZk/Bn0Qm9x3u1em+dY1p3s
         rSKSNVPa8vamEV5Vk2JLis+pZL0xYRUIMgGtNIL4NWwIMl42V46zC4CGqbNyqKFdC+Lz
         YVEjGzyCqtjnw4UwJwBiHS3jQi/QufwCXVKkBVCL70IWkZvhP96Ikevt+UHD9UhFFy+T
         j7eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=4/tR93+PnEmKCCT10UwnRvrI+SPYqnPWqQaeEYdfPoE=;
        b=jDmo/fXVdaESAq79K/HBnC5E1aI1WbRbjTJoMisrwurOUa6Ds16xiPBSnOnz5WvOLn
         kWiP5AvPDuTTi1QV7KWz4/vGp7cjPMsLBU3jur5+g2CznjMfFRgTHy+8t3V0iMv1bDh6
         BvN0qtwWnx+lApmnZ/i21rkXn2ZWuB5EhjNxbzrheNqcVwvdzz0WFLTjxDmmfcZhCg5F
         5fnv6cCyBi8bx4GBpEF4TmrE+bJXtgViGHFfMHfLAxfhO6hp3/uXHaM4TzepNNjHVPM3
         MZlp8zqdZx4DnsLNZTK2+ht7ro7ypucr3osmcDQJQkCCWSWhl3zxDA6pBZThgi2/TNdo
         /D/g==
X-Gm-Message-State: AOPr4FW3B1gQAeuZ3mD1n2npwpu4k3z6vPsMH8ZGTvMhWbXyUWIk7O4q4he7l+tU+dsmhg==
X-Received: by 10.28.17.144 with SMTP id 138mr25527232wmr.5.1461073197656;
        Tue, 19 Apr 2016 06:39:57 -0700 (PDT)
Received: from localhost.localdomain (LPuteaux-656-1-278-113.w80-15.abo.wanadoo.fr. [80.15.154.113])
        by smtp.googlemail.com with ESMTPSA id c85sm2789756wmd.0.2016.04.19.06.39.56
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 19 Apr 2016 06:39:56 -0700 (PDT)
From: Alvise Rigo <a.rigo@virtualopensystems.com>
To: qemu-devel@nongnu.org,
	mttcg@listserver.greensocs.com
Cc: jani.kokkonen@huawei.com,
	claudio.fontana@huawei.com,
	tech@virtualopensystems.com,
	alex.bennee@linaro.org,
	pbonzini@redhat.com,
	rth@twiddle.net,
	serge.fdrv@gmail.com,
	Alvise Rigo <a.rigo@virtualopensystems.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM)
Subject: [Qemu-devel] [RFC v8 14/14] target-arm: aarch64: Use ls/st exclusive for atomic insns
Date: Tue, 19 Apr 2016 15:39:31 +0200
Message-Id: <1461073171-22953-15-git-send-email-a.rigo@virtualopensystems.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <1461073171-22953-1-git-send-email-a.rigo@virtualopensystems.com>
References: <1461073171-22953-1-git-send-email-a.rigo@virtualopensystems.com>
Reply-To: Alvise Rigo <a.rigo@virtualopensystems.com>
X-Loop: mttcg@listserver.greensocs.com
X-Sequence: 207
Errors-to: mttcg-owner@listserver.greensocs.com
Precedence: list
Precedence: bulk
Sender: mttcg-request@listserver.greensocs.com
X-no-archive: yes
List-Id: <mttcg.listserver.greensocs.com>
List-Help: <mailto:sympa@listserver.greensocs.com?subject=help>
List-Subscribe: <mailto:sympa@listserver.greensocs.com?subject=subscribe%20mttcg>
List-Unsubscribe: <mailto:sympa@listserver.greensocs.com?subject=unsubscribe%20mttcg>
List-Post: <mailto:mttcg@listserver.greensocs.com>
List-Owner: <mailto:mttcg-request@listserver.greensocs.com>
List-Archive: <http://listserver.greensocs.com/wws/arc/mttcg>
X-TUID: ZPkhwcUrUIWS

Use the new LL/SC runtime helpers to handle the aarch64 atomic instructions
in softmmu_llsc_template.h.

The STXP emulation required a dedicated helper to handle the paired
doubleword case.

Suggested-by: Jani Kokkonen <jani.kokkonen@huawei.com>
Suggested-by: Claudio Fontana <claudio.fontana@huawei.com>
Signed-off-by: Alvise Rigo <a.rigo@virtualopensystems.com>
---
 target-arm/helper-a64.c    |  55 +++++++++++++++
 target-arm/helper-a64.h    |   2 +
 target-arm/translate-a64.c | 168 +++++++++++++++++++++++++--------------------
 target-arm/translate.c     |   7 --
 4 files changed, 149 insertions(+), 83 deletions(-)

diff --git a/target-arm/helper-a64.c b/target-arm/helper-a64.c
index c7bfb4d..170c59b 100644
--- a/target-arm/helper-a64.c
+++ b/target-arm/helper-a64.c
@@ -26,6 +26,7 @@
 #include "qemu/bitops.h"
 #include "internals.h"
 #include "qemu/crc32c.h"
+#include "tcg/tcg.h"
 #include <zlib.h> /* For crc32 */
 
 /* C2.4.7 Multiply and divide */
@@ -443,3 +444,57 @@ uint64_t HELPER(crc32c_64)(uint64_t acc, uint64_t val, uint32_t bytes)
     /* Linux crc32c converts the output to one's complement.  */
     return crc32c(acc, buf, bytes) ^ 0xffffffff;
 }
+
+/* STXP emulation for two 64 bit doublewords. We can't use directly two
+ * stcond_i64 accesses, otherwise the first will conclude the LL/SC pair.
+ * Instead, two normal 64-bit accesses are used and the CPUState is
+ * updated accordingly.
+ *
+ * We do not support paired STXPs to MMIO memory, this will become trivial
+ * when the softmmu will support 128bit memory accesses.
+ */
+target_ulong HELPER(stxp_i128)(CPUArchState *env, target_ulong addr,
+                               uint64_t vall, uint64_t valh,
+                               uint32_t mmu_idx)
+{
+    CPUState *cpu = ENV_GET_CPU(env);
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+    TCGMemOpIdx op;
+    target_ulong ret = 0;
+
+    if (!cpu->ll_sc_context) {
+        cpu->excl_succeeded = false;
+        ret = 1;
+        goto out;
+    }
+
+    op = make_memop_idx(MO_BEQ, mmu_idx);
+
+    /* According to section C6.6.191 of ARM ARM DDI 0487A.h, the access has
+     * to be quadword aligned. */
+    if (addr & 0xf) {
+        /* TODO: Do unaligned access */
+        qemu_log_mask(LOG_UNIMP, "aarch64: silently executing STXP quadword"
+                      "unaligned, exception not implemented yet.\n");
+    }
+
+    /* Setting excl_succeeded to true will make the store exclusive. */
+    cpu->excl_succeeded = true;
+    helper_ret_stq_mmu(env, addr, vall, op, GETRA());
+
+    if (!cpu->excl_succeeded) {
+        ret = 1;
+        goto out;
+    }
+
+    helper_ret_stq_mmu(env, addr + 8, valh, op, GETRA());
+    if (!cpu->excl_succeeded) {
+        ret = 1;
+    }
+
+out:
+    /* Unset LL/SC context */
+    cc->cpu_reset_excl_context(cpu);
+
+    return ret;
+}
diff --git a/target-arm/helper-a64.h b/target-arm/helper-a64.h
index 1d3d10f..4ecb118 100644
--- a/target-arm/helper-a64.h
+++ b/target-arm/helper-a64.h
@@ -46,3 +46,5 @@ DEF_HELPER_FLAGS_2(frecpx_f32, TCG_CALL_NO_RWG, f32, f32, ptr)
 DEF_HELPER_FLAGS_2(fcvtx_f64_to_f32, TCG_CALL_NO_RWG, f32, f64, env)
 DEF_HELPER_FLAGS_3(crc32_64, TCG_CALL_NO_RWG_SE, i64, i64, i64, i32)
 DEF_HELPER_FLAGS_3(crc32c_64, TCG_CALL_NO_RWG_SE, i64, i64, i64, i32)
+/* STXP helper */
+DEF_HELPER_5(stxp_i128, i64, env, i64, i64, i64, i32)
diff --git a/target-arm/translate-a64.c b/target-arm/translate-a64.c
index 80f6c20..d5f613e 100644
--- a/target-arm/translate-a64.c
+++ b/target-arm/translate-a64.c
@@ -37,9 +37,6 @@
 static TCGv_i64 cpu_X[32];
 static TCGv_i64 cpu_pc;
 
-/* Load/store exclusive handling */
-static TCGv_i64 cpu_exclusive_high;
-
 static const char *regnames[] = {
     "x0", "x1", "x2", "x3", "x4", "x5", "x6", "x7",
     "x8", "x9", "x10", "x11", "x12", "x13", "x14", "x15",
@@ -93,9 +90,6 @@ void a64_translate_init(void)
                                           offsetof(CPUARMState, xregs[i]),
                                           regnames[i]);
     }
-
-    cpu_exclusive_high = tcg_global_mem_new_i64(TCG_AREG0,
-        offsetof(CPUARMState, exclusive_high), "exclusive_high");
 }
 
 static inline ARMMMUIdx get_a64_user_mem_index(DisasContext *s)
@@ -1219,7 +1213,7 @@ static void handle_hint(DisasContext *s, uint32_t insn,
 
 static void gen_clrex(DisasContext *s, uint32_t insn)
 {
-    tcg_gen_movi_i64(cpu_exclusive_addr, -1);
+    gen_helper_atomic_clear(cpu_env);
 }
 
 /* CLREX, DSB, DMB, ISB */
@@ -1685,11 +1679,9 @@ static void disas_b_exc_sys(DisasContext *s, uint32_t insn)
 }
 
 /*
- * Load/Store exclusive instructions are implemented by remembering
- * the value/address loaded, and seeing if these are the same
- * when the store is performed. This is not actually the architecturally
- * mandated semantics, but it works for typical guest code sequences
- * and avoids having to monitor regular stores.
+ * If the softmmu is enabled, the translation of Load/Store exclusive
+ * instructions will rely on the gen_helper_{ldlink,stcond} helpers,
+ * offloading most of the work to the softmmu_llsc_template.h functions.
  *
  * In system emulation mode only one CPU will be running at once, so
  * this sequence is effectively atomic.  In user emulation mode we
@@ -1698,13 +1690,48 @@ static void disas_b_exc_sys(DisasContext *s, uint32_t insn)
 static void gen_load_exclusive(DisasContext *s, int rt, int rt2,
                                TCGv_i64 addr, int size, bool is_pair)
 {
-    TCGv_i64 tmp = tcg_temp_new_i64();
-    TCGMemOp memop = MO_TE + size;
+    /* In case @is_pair is set, we have to guarantee that at least the 128 bits
+     * accessed by a Load Exclusive Pair (64-bit variant) are protected. Since
+     * we do not have 128-bit helpers, we split the access in two halves, the
+     * first of them will set the exclusive region to cover at least 128 bits
+     * (this is why aarch64 has a custom cc->cpu_set_excl_protected_range which
+     * covers 128 bits).
+     * */
+    TCGv_i32 mem_idx = tcg_temp_new_i32();
+
+    tcg_gen_movi_i32(mem_idx, get_mem_index(s));
 
     g_assert(size <= 3);
-    tcg_gen_qemu_ld_i64(tmp, addr, get_mem_index(s), memop);
+
+    if (size < 3) {
+        TCGv_i32 tmp = tcg_temp_new_i32();
+
+        switch (size) {
+        case 0:
+            gen_helper_ldlink_i8(tmp, cpu_env, addr, mem_idx);
+            break;
+        case 1:
+            gen_helper_ldlink_i16(tmp, cpu_env, addr, mem_idx);
+            break;
+        case 2:
+            gen_helper_ldlink_i32(tmp, cpu_env, addr, mem_idx);
+            break;
+        default:
+            abort();
+        }
+
+        TCGv_i64 tmp64 = tcg_temp_new_i64();
+        tcg_gen_ext_i32_i64(tmp64, tmp);
+        tcg_gen_mov_i64(cpu_reg(s, rt), tmp64);
+
+        tcg_temp_free_i32(tmp);
+        tcg_temp_free_i64(tmp64);
+    } else {
+        gen_helper_ldlink_i64(cpu_reg(s, rt), cpu_env, addr, mem_idx);
+    }
 
     if (is_pair) {
+        TCGMemOp memop = MO_TE + size;
         TCGv_i64 addr2 = tcg_temp_new_i64();
         TCGv_i64 hitmp = tcg_temp_new_i64();
 
@@ -1712,16 +1739,11 @@ static void gen_load_exclusive(DisasContext *s, int rt, int rt2,
         tcg_gen_addi_i64(addr2, addr, 1 << size);
         tcg_gen_qemu_ld_i64(hitmp, addr2, get_mem_index(s), memop);
         tcg_temp_free_i64(addr2);
-        tcg_gen_mov_i64(cpu_exclusive_high, hitmp);
         tcg_gen_mov_i64(cpu_reg(s, rt2), hitmp);
         tcg_temp_free_i64(hitmp);
     }
 
-    tcg_gen_mov_i64(cpu_exclusive_val, tmp);
-    tcg_gen_mov_i64(cpu_reg(s, rt), tmp);
-
-    tcg_temp_free_i64(tmp);
-    tcg_gen_mov_i64(cpu_exclusive_addr, addr);
+    tcg_temp_free_i32(mem_idx);
 }
 
 #ifdef CONFIG_USER_ONLY
@@ -1735,68 +1757,62 @@ static void gen_store_exclusive(DisasContext *s, int rd, int rt, int rt2,
 }
 #else
 static void gen_store_exclusive(DisasContext *s, int rd, int rt, int rt2,
-                                TCGv_i64 inaddr, int size, int is_pair)
-{
-    /* if (env->exclusive_addr == addr && env->exclusive_val == [addr]
-     *     && (!is_pair || env->exclusive_high == [addr + datasize])) {
-     *     [addr] = {Rt};
-     *     if (is_pair) {
-     *         [addr + datasize] = {Rt2};
-     *     }
-     *     {Rd} = 0;
-     * } else {
-     *     {Rd} = 1;
-     * }
-     * env->exclusive_addr = -1;
-     */
-    TCGLabel *fail_label = gen_new_label();
-    TCGLabel *done_label = gen_new_label();
-    TCGv_i64 addr = tcg_temp_local_new_i64();
-    TCGv_i64 tmp;
-
-    /* Copy input into a local temp so it is not trashed when the
-     * basic block ends at the branch insn.
-     */
-    tcg_gen_mov_i64(addr, inaddr);
-    tcg_gen_brcond_i64(TCG_COND_NE, addr, cpu_exclusive_addr, fail_label);
+                                TCGv_i64 addr, int size, int is_pair)
+{
+    /* Don't bother to check if we are actually in exclusive context since the
+     * helpers keep care of it. */
+    TCGv_i32 mem_idx = tcg_temp_new_i32();
 
-    tmp = tcg_temp_new_i64();
-    tcg_gen_qemu_ld_i64(tmp, addr, get_mem_index(s), MO_TE + size);
-    tcg_gen_brcond_i64(TCG_COND_NE, tmp, cpu_exclusive_val, fail_label);
-    tcg_temp_free_i64(tmp);
+    tcg_gen_movi_i32(mem_idx, get_mem_index(s));
 
+    g_assert(size <= 3);
     if (is_pair) {
-        TCGv_i64 addrhi = tcg_temp_new_i64();
-        TCGv_i64 tmphi = tcg_temp_new_i64();
-
-        tcg_gen_addi_i64(addrhi, addr, 1 << size);
-        tcg_gen_qemu_ld_i64(tmphi, addrhi, get_mem_index(s), MO_TE + size);
-        tcg_gen_brcond_i64(TCG_COND_NE, tmphi, cpu_exclusive_high, fail_label);
-
-        tcg_temp_free_i64(tmphi);
-        tcg_temp_free_i64(addrhi);
-    }
+        if (size == 3) {
+            gen_helper_stxp_i128(cpu_reg(s, rd), cpu_env, addr, cpu_reg(s, rt),
+                                 cpu_reg(s, rt2), mem_idx);
+        } else if (size == 2) {
+            /* Paired single word case. After merging the two registers into
+             * one, we use one stcond_i64 to store the value to memory. */
+            TCGv_i64 val = tcg_temp_new_i64();
+            TCGv_i64 valh = tcg_temp_new_i64();
+            tcg_gen_shli_i64(valh, cpu_reg(s, rt2), 32);
+            tcg_gen_and_i64(val, valh, cpu_reg(s, rt));
+            gen_helper_stcond_i64(cpu_reg(s, rd), cpu_env, addr, val, mem_idx);
+            tcg_temp_free_i64(valh);
+            tcg_temp_free_i64(val);
+        } else {
+            abort();
+        }
+    } else {
+        if (size < 3) {
+            TCGv_i32 val = tcg_temp_new_i32();
 
-    /* We seem to still have the exclusive monitor, so do the store */
-    tcg_gen_qemu_st_i64(cpu_reg(s, rt), addr, get_mem_index(s), MO_TE + size);
-    if (is_pair) {
-        TCGv_i64 addrhi = tcg_temp_new_i64();
+            tcg_gen_extrl_i64_i32(val, cpu_reg(s, rt));
 
-        tcg_gen_addi_i64(addrhi, addr, 1 << size);
-        tcg_gen_qemu_st_i64(cpu_reg(s, rt2), addrhi,
-                            get_mem_index(s), MO_TE + size);
-        tcg_temp_free_i64(addrhi);
+            switch (size) {
+            case 0:
+                gen_helper_stcond_i8(cpu_reg(s, rd), cpu_env, addr, val,
+                                     mem_idx);
+                break;
+            case 1:
+                gen_helper_stcond_i16(cpu_reg(s, rd), cpu_env, addr, val,
+                                      mem_idx);
+                break;
+            case 2:
+                gen_helper_stcond_i32(cpu_reg(s, rd), cpu_env, addr, val,
+                                      mem_idx);
+                break;
+            default:
+                abort();
+            }
+            tcg_temp_free_i32(val);
+        } else {
+            gen_helper_stcond_i64(cpu_reg(s, rd), cpu_env, addr, cpu_reg(s, rt),
+                                  mem_idx);
+        }
     }
 
-    tcg_temp_free_i64(addr);
-
-    tcg_gen_movi_i64(cpu_reg(s, rd), 0);
-    tcg_gen_br(done_label);
-    gen_set_label(fail_label);
-    tcg_gen_movi_i64(cpu_reg(s, rd), 1);
-    gen_set_label(done_label);
-    tcg_gen_movi_i64(cpu_exclusive_addr, -1);
-
+    tcg_temp_free_i32(mem_idx);
 }
 #endif
 
diff --git a/target-arm/translate.c b/target-arm/translate.c
index 9c2b197..6f930ef 100644
--- a/target-arm/translate.c
+++ b/target-arm/translate.c
@@ -60,9 +60,6 @@ TCGv_ptr cpu_env;
 static TCGv_i64 cpu_V0, cpu_V1, cpu_M0;
 static TCGv_i32 cpu_R[16];
 TCGv_i32 cpu_CF, cpu_NF, cpu_VF, cpu_ZF;
-/* The following two variables are still used by the aarch64 front-end */
-TCGv_i64 cpu_exclusive_addr;
-TCGv_i64 cpu_exclusive_val;
 #ifdef CONFIG_USER_ONLY
 TCGv_i64 cpu_exclusive_test;
 TCGv_i32 cpu_exclusive_info;
@@ -95,10 +92,6 @@ void arm_translate_init(void)
     cpu_VF = tcg_global_mem_new_i32(TCG_AREG0, offsetof(CPUARMState, VF), "VF");
     cpu_ZF = tcg_global_mem_new_i32(TCG_AREG0, offsetof(CPUARMState, ZF), "ZF");
 
-    cpu_exclusive_addr = tcg_global_mem_new_i64(TCG_AREG0,
-        offsetof(CPUARMState, exclusive_addr), "exclusive_addr");
-    cpu_exclusive_val = tcg_global_mem_new_i64(TCG_AREG0,
-        offsetof(CPUARMState, exclusive_val), "exclusive_val");
 #ifdef CONFIG_USER_ONLY
     cpu_exclusive_test = tcg_global_mem_new_i64(TCG_AREG0,
         offsetof(CPUARMState, exclusive_test), "exclusive_test");
-- 
2.8.0
