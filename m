Received: by 10.28.4.212 with SMTP id 203csp170307wme;
        Thu, 26 Apr 2018 17:32:27 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZpbwcIIEAsEzsmFYzKCEvoVFn+PdYMk/yshsEaFcD9JC/jO4Cpsa3s7iEWWsAjDjZRFZ3To
X-Received: by 2002:ac8:2624:: with SMTP id u33-v6mr210945qtu.186.1524789147800;
        Thu, 26 Apr 2018 17:32:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524789147; cv=none;
        d=google.com; s=arc-20160816;
        b=GzvIEme0QLfmIF5gFKyPK/zpmGPGv2PM5tdixuz7Gk0WcYSmH7Z64xRdMBzWeKvF6w
         Unl/BtDv2GWjqvva2pB4t5fPRdSwT+nJDyzt20EhIacwNfrPOfrj6okPMnvKORkRCKAa
         NEAjT1QSf4Gq64DIQ1Yju5E8oTLvl0MM6sVK6tLMAF+J45tBxOoHGlzCimM5kxk75ND3
         5+mkuqeJmTFjg3+bFPu1tr3ufLaWX55OtHSR23yXvwrtWHmP8w53RNkAyDIkwH428Jb8
         H7VmsvjBlJp8k355NcujecSFD05P90KxeiaWiHMFe3Yl+4rXUeVT1HBPDknZOT/+tNJF
         S3Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=DiEfPBXa1tZdSoYd4oqClGzv1br1rQBTzDefUMnyBbs=;
        b=S1okKZAl6PQ7fxv7JH12tM7a1CD4HoNiP8QeK7g8vF/ZwW1i6sb6qMVRnnRGSfahW2
         sEzCseY75EwnWckVMAGO/1Ushx61IUwACTRMcyuuJksF44FFirPSsSIEUA0HjYRzFiZJ
         3xkQR07IrEGu2lPfkyF8T9fH9GCFr1NepJlAEzLkd54yQ7xOOnWwZsU4WX4zkqfjCkov
         LK3IULpj+FtsSNkyGXwx00Ym9RMdVEuYzJ3NhVFqHvQRYgXXSLhTgClkUBnkz5oyh3my
         yTKU+BMHq4C+K1LG/mDwJ/0DZ6eZIHMXgoCKlyRSvNz0wWoSuaCrRvDoxKXfTtTd523t
         Scxg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=e6QBorTE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y18-v6si109272qva.223.2018.04.26.17.32.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 26 Apr 2018 17:32:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=e6QBorTE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45131 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fBrJL-0006Fn-4B
	for alex.bennee@linaro.org; Thu, 26 Apr 2018 20:32:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51830)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fBrEL-0002CU-Ia
	for qemu-devel@nongnu.org; Thu, 26 Apr 2018 20:27:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fBrEK-0004ew-33
	for qemu-devel@nongnu.org; Thu, 26 Apr 2018 20:27:17 -0400
Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242]:34308)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fBrEJ-0004dw-SK
	for qemu-devel@nongnu.org; Thu, 26 Apr 2018 20:27:16 -0400
Received: by mail-pg0-x242.google.com with SMTP id p10-v6so156815pgn.1
	for <qemu-devel@nongnu.org>; Thu, 26 Apr 2018 17:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=DiEfPBXa1tZdSoYd4oqClGzv1br1rQBTzDefUMnyBbs=;
	b=e6QBorTEydxmykXbGVCMc7jWbB4t9xdUna/vFUmLUT0rC3esPLskjeIvrYw3LuuCq7
	vN+o+8jeQ8t1LJH4+0eEA8kxNB17y0Uwcd1fLNpPhpWunqRzoNL6K+Mcxtf62Z62/Hoo
	It4VHBZItY5wILe7QpQTRjna4lJKIoe1dIzCI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=DiEfPBXa1tZdSoYd4oqClGzv1br1rQBTzDefUMnyBbs=;
	b=rqIqToAPqPx4z1Qk8Wqdvs5oeoL1uUICD1iVji5HXJ+HSz4DBt/5IgPGJ3MZSA21Gn
	xDuX77Rpq6dCRpdjKKW1df3f0GiIJQpQhPM7uAry3j9wueWpBCAv+BkNMAnLbg5Pkqyl
	K6NJRs3FeVd0dF41wxkiZeioNGxZg33kKUu1SnU3DKeTMYo+UodtDRlXSO7Y/KSWZlO/
	HfE+ttQkP+zEwD3EcHOgHrxUW4Zk/EcWf0I2DWRKS/Pg4wptmUCnWAgBSIR0fXJvWU9I
	lFD68zJDkOdJIdTYfXv+9yMaE7k2mXkVZTb1uKYmOxmjY+J9scGHTBOFP1jzGB+Vmn7+
	+eMQ==
X-Gm-Message-State: ALQs6tBN46gmeb7obDHxufDPlrl2oOd9pQAORyKM7QjxTayEct+27F3e
	Tcch1q0ZKi/t29+VwxVeTq+2VLSvcIU=
X-Received: by 2002:a63:a503:: with SMTP id n3-v6mr163953pgf.19.1524788834603; 
	Thu, 26 Apr 2018 17:27:14 -0700 (PDT)
Received: from cloudburst.twiddle.net.com
	([2605:e000:112b:41da:c94c:5ee7:de92:7d78])
	by smtp.gmail.com with ESMTPSA id g76sm86338pfj.102.2018.04.26.17.27.12
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 26 Apr 2018 17:27:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu, 26 Apr 2018 14:26:50 -1000
Message-Id: <20180427002651.28356-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180427002651.28356-1-richard.henderson@linaro.org>
References: <20180427002651.28356-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::242
Subject: [Qemu-devel] [PATCH 8/9] target/arm: Implement CAS and CASP
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +gFv5Z7V3QhQ

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-a64.h    |   2 +
 target/arm/helper-a64.c    |  43 ++++++++++++++++
 target/arm/translate-a64.c | 119 +++++++++++++++++++++++++++++++++++++++++++--
 3 files changed, 161 insertions(+), 3 deletions(-)

diff --git a/target/arm/helper-a64.h b/target/arm/helper-a64.h
index ef4ddfe9d8..b8028ac98c 100644
--- a/target/arm/helper-a64.h
+++ b/target/arm/helper-a64.h
@@ -51,6 +51,8 @@ DEF_HELPER_FLAGS_4(paired_cmpxchg64_le_parallel, TCG_CALL_NO_WG,
 DEF_HELPER_FLAGS_4(paired_cmpxchg64_be, TCG_CALL_NO_WG, i64, env, i64, i64, i64)
 DEF_HELPER_FLAGS_4(paired_cmpxchg64_be_parallel, TCG_CALL_NO_WG,
                    i64, env, i64, i64, i64)
+DEF_HELPER_5(casp_le_parallel, void, env, i32, i64, i64, i64)
+DEF_HELPER_5(casp_be_parallel, void, env, i32, i64, i64, i64)
 DEF_HELPER_FLAGS_3(advsimd_maxh, TCG_CALL_NO_RWG, f16, f16, f16, ptr)
 DEF_HELPER_FLAGS_3(advsimd_minh, TCG_CALL_NO_RWG, f16, f16, f16, ptr)
 DEF_HELPER_FLAGS_3(advsimd_maxnumh, TCG_CALL_NO_RWG, f16, f16, f16, ptr)
diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
index afb25ad20c..549ed3513e 100644
--- a/target/arm/helper-a64.c
+++ b/target/arm/helper-a64.c
@@ -636,6 +636,49 @@ uint64_t HELPER(paired_cmpxchg64_be_parallel)(CPUARMState *env, uint64_t addr,
     return do_paired_cmpxchg64_be(env, addr, new_lo, new_hi, true, GETPC());
 }
 
+/* Writes back the old data into Rs.  */
+void HELPER(casp_le_parallel)(CPUARMState *env, uint32_t rs, uint64_t addr,
+                              uint64_t new_lo, uint64_t new_hi)
+{
+    uintptr_t ra = GETPC();
+#ifndef CONFIG_ATOMIC128
+    cpu_loop_exit_atomic(ENV_GET_CPU(env), ra);
+#else
+    Int128 oldv, cmpv, newv;
+
+    cmpv = int128_make128(env->xregs[rs], env->xregs[rs + 1]);
+    newv = int128_make128(new_lo, new_hi);
+
+    int mem_idx = cpu_mmu_index(env, false);
+    TCGMemOpIdx oi = make_memop_idx(MO_LEQ | MO_ALIGN_16, mem_idx);
+    oldv = helper_atomic_cmpxchgo_le_mmu(env, addr, cmpv, newv, oi, ra);
+
+    env->xregs[rs] = int128_getlo(oldv);
+    env->xregs[rs + 1] = int128_gethi(oldv);
+#endif
+}
+
+void HELPER(casp_be_parallel)(CPUARMState *env, uint32_t rs, uint64_t addr,
+                              uint64_t new_hi, uint64_t new_lo)
+{
+    uintptr_t ra = GETPC();
+#ifndef CONFIG_ATOMIC128
+    cpu_loop_exit_atomic(ENV_GET_CPU(env), ra);
+#else
+    Int128 oldv, cmpv, newv;
+
+    cmpv = int128_make128(env->xregs[rs + 1], env->xregs[rs]);
+    newv = int128_make128(new_lo, new_hi);
+
+    int mem_idx = cpu_mmu_index(env, false);
+    TCGMemOpIdx oi = make_memop_idx(MO_LEQ | MO_ALIGN_16, mem_idx);
+    oldv = helper_atomic_cmpxchgo_be_mmu(env, addr, cmpv, newv, oi, ra);
+
+    env->xregs[rs + 1] = int128_getlo(oldv);
+    env->xregs[rs] = int128_gethi(oldv);
+#endif
+}
+
 /*
  * AdvSIMD half-precision
  */
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 6ed7627d79..dce86a5488 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -2114,6 +2114,103 @@ static void gen_store_exclusive(DisasContext *s, int rd, int rt, int rt2,
     tcg_gen_movi_i64(cpu_exclusive_addr, -1);
 }
 
+static void gen_compare_and_swap(DisasContext *s, int rs, int rt,
+                                 int rn, int size)
+{
+    TCGv_i64 tcg_rs = cpu_reg(s, rs);
+    TCGv_i64 tcg_rt = cpu_reg(s, rt);
+    int memidx = get_mem_index(s);
+    TCGv_i64 addr = cpu_reg_sp(s, rn);
+
+    if (rn == 31) {
+        gen_check_sp_alignment(s);
+    }
+    tcg_gen_atomic_cmpxchg_i64(tcg_rs, addr, tcg_rs, tcg_rt, memidx,
+                               size | MO_ALIGN | s->be_data);
+}
+
+static void gen_compare_and_swap_pair(DisasContext *s, int rs, int rt,
+                                      int rn, int size)
+{
+    TCGv_i64 s1 = cpu_reg(s, rs);
+    TCGv_i64 s2 = cpu_reg(s, rs + 1);
+    TCGv_i64 t1 = cpu_reg(s, rt);
+    TCGv_i64 t2 = cpu_reg(s, rt + 1);
+    TCGv_i64 addr = cpu_reg_sp(s, rn);
+    int memidx = get_mem_index(s);
+
+    if (rn == 31) {
+        gen_check_sp_alignment(s);
+    }
+
+    if (size == 2) {
+        TCGv_i64 cmp = tcg_temp_new_i64();
+        TCGv_i64 val = tcg_temp_new_i64();
+
+        if (s->be_data == MO_LE) {
+            tcg_gen_concat32_i64(val, t1, t2);
+            tcg_gen_concat32_i64(cmp, s1, s2);
+        } else {
+            tcg_gen_concat32_i64(val, t2, t1);
+            tcg_gen_concat32_i64(cmp, s2, s1);
+        }
+
+        tcg_gen_atomic_cmpxchg_i64(cmp, addr, cmp, val, memidx,
+                                   MO_64 | MO_ALIGN | s->be_data);
+        tcg_temp_free_i64(val);
+
+        if (s->be_data == MO_LE) {
+            tcg_gen_extr32_i64(s1, s2, cmp);
+        } else {
+            tcg_gen_extr32_i64(s2, s1, cmp);
+        }
+        tcg_temp_free_i64(cmp);
+    } else if (tb_cflags(s->base.tb) & CF_PARALLEL) {
+        TCGv_i32 tcg_rs = tcg_const_i32(rs);
+
+        if (s->be_data == MO_LE) {
+            gen_helper_casp_le_parallel(cpu_env, tcg_rs, addr, t1, t2);
+        } else {
+            gen_helper_casp_be_parallel(cpu_env, tcg_rs, addr, t1, t2);
+        }
+        tcg_temp_free_i32(tcg_rs);
+    } else {
+        TCGv_i64 d1 = tcg_temp_new_i64();
+        TCGv_i64 d2 = tcg_temp_new_i64();
+        TCGv_i64 a2 = tcg_temp_new_i64();
+        TCGv_i64 c1 = tcg_temp_new_i64();
+        TCGv_i64 c2 = tcg_temp_new_i64();
+        TCGv_i64 zero = tcg_const_i64(0);
+
+        /* Load the two words, in memory order.  */
+        tcg_gen_qemu_ld_i64(d1, addr, memidx,
+                            MO_64 | MO_ALIGN_16 | s->be_data);
+        tcg_gen_addi_i64(a2, addr, 8);
+        tcg_gen_qemu_ld_i64(d2, addr, memidx, MO_64 | s->be_data);
+
+        /* Compare the two words, also in memory order.  */
+        tcg_gen_setcond_i64(TCG_COND_EQ, c1, d1, s1);
+        tcg_gen_setcond_i64(TCG_COND_EQ, c2, d2, s2);
+        tcg_gen_and_i64(c2, c2, c1);
+
+        /* If compare equal, write back new data, else write back old data.  */
+        tcg_gen_movcond_i64(TCG_COND_NE, c1, c2, zero, t1, d1);
+        tcg_gen_movcond_i64(TCG_COND_NE, c2, c2, zero, t2, d2);
+        tcg_gen_qemu_st_i64(c1, addr, memidx, MO_64 | s->be_data);
+        tcg_gen_qemu_st_i64(c2, a2, memidx, MO_64 | s->be_data);
+        tcg_temp_free_i64(a2);
+        tcg_temp_free_i64(c1);
+        tcg_temp_free_i64(c2);
+        tcg_temp_free_i64(zero);
+
+        /* Write back the data from memory to Rs.  */
+        tcg_gen_mov_i64(s1, d1);
+        tcg_gen_mov_i64(s2, d2);
+        tcg_temp_free_i64(d1);
+        tcg_temp_free_i64(d2);
+    }
+}
+
 /* Update the Sixty-Four bit (SF) registersize. This logic is derived
  * from the ARMv8 specs for LDR (Shared decode for all encodings).
  */
@@ -2214,10 +2311,16 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
             gen_store_exclusive(s, rs, rt, rt2, tcg_addr, size, true);
             return;
         }
-        /* CASP / CASPL */
+        if (rt2 == 31
+            && ((rt | rs) & 1) == 0
+            && arm_dc_feature(s, ARM_FEATURE_V8_ATOMICS)) {
+            /* CASP / CASPL */
+            gen_compare_and_swap_pair(s, rs, rt, rn, size | 2);
+            return;
+        }
         break;
 
-    case 0x6: case 0x7: /* CASP / LDXP */
+    case 0x6: case 0x7: /* CASPA / LDXP */
         if (size & 2) { /* LDXP / LDAXP */
             if (rn == 31) {
                 gen_check_sp_alignment(s);
@@ -2230,13 +2333,23 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
             }
             return;
         }
-        /* CASPA / CASPAL */
+        if (rt2 == 31
+            && ((rt | rs) & 1) == 0
+            && arm_dc_feature(s, ARM_FEATURE_V8_ATOMICS)) {
+            /* CASPA / CASPAL */
+            gen_compare_and_swap_pair(s, rs, rt, rn, size | 2);
+            return;
+        }
         break;
 
     case 0xa: /* CAS */
     case 0xb: /* CASL */
     case 0xe: /* CASA */
     case 0xf: /* CASAL */
+        if (rt2 == 31 && arm_dc_feature(s, ARM_FEATURE_V8_ATOMICS)) {
+            gen_compare_and_swap(s, rs, rt, rn, size);
+            return;
+        }
         break;
     }
     unallocated_encoding(s);
-- 
2.14.3

