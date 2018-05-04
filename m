Received: by 10.28.4.212 with SMTP id 203csp341916wme;
        Fri, 4 May 2018 11:40:37 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZpXTNS3rg2pG10G1TCI5Nx6JxRKs5W0kl4yg+QzWcypBTS3A7NMeES8jlYE0dkBvTGotw3u
X-Received: by 2002:a0c:8995:: with SMTP id 21-v6mr8645005qvr.223.1525459237836;
        Fri, 04 May 2018 11:40:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525459237; cv=none;
        d=google.com; s=arc-20160816;
        b=pv0pEY5lsokeu1suINGzORDKrOHFOqDY2RzKl5t9FnlucMGHk/JriEEv5u8vTNyOEM
         f+iNpEhk5rsdV2I1bcEJLvN5Mk6lo2e9WVGMu5urSTz8+QtMuiV6yTHgqecjnCJzxC1Y
         Su10qkrflrWZXCdNGVxOKdcwtWTyggIbaNykDXFLXVSUWTGBRic5oHznNo4L7fQK4Krc
         FG4kzPCX0NZd14D8Z//sTQ3jn23s63iVAfER804AnWPmjK2Gpq/7JfTlPy0sl+V+5hmm
         05J31pEHb4iy2BY9XITz+gS5TQcqbV7UlwSvrzLINDOvEkCxD2VlEX2NFVy8y52U2toF
         gHIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=CvitQzZ0KyAseNwhvu7lo9iCrZnSsdMX4Co5PcrM5L8=;
        b=iKMwAkPM0UERTQsvRnP7Sj1u52K6D2g39EcEQ3/aYNVrjFPzxVm+Wx0OFansdOSO0V
         DYQyvf2GjjXCV1myjlN0C5Um8K9EsynYfX9UqE+id3MDY4++gA/xHdONHftBAkEMqfGS
         I0gdEPPwwNZ31+mz9kPGE0AP3VIDksRuBvV6B9Uy74VcCLAGiXjkSQOs/N5uaIgp2Bh3
         dVMuElZ8r4RB0iV6LhvR7OhjrsgQJ5AGYa6q9yNB3meFhbRYILIvEyPSCzqb+6xvpkuN
         g9tPMFxLb/mTAo7bNOS3I0nXsjKE6qL88l6iMV1d2l1iDbHqyGeK6kY71R5P0Oohco/v
         l7tA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eSLjOtq4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j23-v6si1327883qtl.173.2018.05.04.11.40.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 May 2018 11:40:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eSLjOtq4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36031 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fEfdF-0007t7-B8
	for alex.bennee@linaro.org; Fri, 04 May 2018 14:40:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45681)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fEfTb-0007cC-97
	for qemu-devel@nongnu.org; Fri, 04 May 2018 14:30:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fEfTZ-0001Fh-NO
	for qemu-devel@nongnu.org; Fri, 04 May 2018 14:30:39 -0400
Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243]:43288)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fEfTZ-0001EJ-Gf
	for qemu-devel@nongnu.org; Fri, 04 May 2018 14:30:37 -0400
Received: by mail-pf0-x243.google.com with SMTP id j20so3756695pff.10
	for <qemu-devel@nongnu.org>; Fri, 04 May 2018 11:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=CvitQzZ0KyAseNwhvu7lo9iCrZnSsdMX4Co5PcrM5L8=;
	b=eSLjOtq4tEm78a6CriSrEDngd2kg39lzMtIaM+vvUE/LFL9GfmMfQYN3+jTVWdmY0c
	QdMnSQRb5PHTRwPSzO9E43gmsysPJrggBJbjfpTR2Nhpj1XupFzOHGNkjTGPpWeTSOub
	jsKAg6GMAicNBCClaMwM2WofQRBNJR4H93roU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=CvitQzZ0KyAseNwhvu7lo9iCrZnSsdMX4Co5PcrM5L8=;
	b=ndRitjK5zwciBxsK43oCaYDJ/SOGNMPz2ufyVFHa61e8qw8+N2fcTdBuEMxYH/8Spg
	1ZUTBWAdg4pH8s/aHS9cGh4q4y+aEekE0LsRrguK+ZWdaRnqEMjyXpO5q7eJWFdJx8x4
	fMFo1Fo8hiP8L+qdChAGSXM91esS1IoTBCsoQ6mKprtXSuuAc7HHYFLx3R5MmrXSMD8A
	Mn5+DjLR7h7J3gAzuFOQBaPwQC/W9q5tcesgnHfQ4np0xL+TxCMNcNbbRRgArPdEhJ+W
	eU7+StfVQDLvp7pRGaDKVobserUzghcb+Upe5+8dQTmIXXhDFUnXSoC7Afndfjw8KeHi
	45OQ==
X-Gm-Message-State: ALQs6tCc3f7Jr0LyasLLFsZpj5RXwxmRddEqwhxCaF6QBtQocSYqEINt
	0ZeCpMD/PBeC3gvK0gYJ5awSLK6hsS4=
X-Received: by 2002:a17:902:887:: with SMTP id
	7-v6mr29551720pll.319.1525458635998; 
	Fri, 04 May 2018 11:30:35 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net.
	[97.113.2.170]) by smtp.gmail.com with ESMTPSA id
	r8-v6sm16987413pgn.2.2018.05.04.11.30.34
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 04 May 2018 11:30:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri,  4 May 2018 11:30:20 -0700
Message-Id: <20180504183021.19318-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180504183021.19318-1-richard.henderson@linaro.org>
References: <20180504183021.19318-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::243
Subject: [Qemu-devel] [PATCH v2 09/10] target/arm: Implement CAS and CASP
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LokQOjF+0IQu

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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
index 5af6028089..08debc7a93 100644
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

