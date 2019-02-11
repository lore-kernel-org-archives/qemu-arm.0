Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp111421wrp;
        Mon, 11 Feb 2019 16:04:21 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZsjpIUU5sBulYlf95Q3VW+hL3Bir79MBZMsQTSbjWZuuGJq8/Fdf6tvn/pqJVBniyMlWGv
X-Received: by 2002:a25:3004:: with SMTP id w4mr641488ybw.461.1549929861762;
        Mon, 11 Feb 2019 16:04:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549929861; cv=none;
        d=google.com; s=arc-20160816;
        b=df9vFwNf3rZoK7qGyUFew3RMSwwmE2WDKKMdqPEIJL5R95pFUYqjSEQxyTcp6TChUB
         NA1moKP0j8Sco+LZLER0NCDpBJ3kfZM0FrUzhiqK03pA5CGJX1JI4YLrBn/SMwUUEvG2
         tPK0AimhxR9YNsT5S61SuT5kgvRXQlWvS+tKJPdZektOI3HWl5RhM1LELJhjmPqwb0HK
         KpfU8IyoGxXd0zVB0jHMz3GXku4PeycBrtHnKaFjPsz9GZh+4ko4NsUgIZ+kbRh5cIN9
         jzm1HJ/l4ISaT0ZYhDJAMI3uhnggQatOB3xPKgYZTth33tkBIrDEYj2LRn/4fqhvRLrA
         4g8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=uWHLuK9tuxKWuI11A7yFd0AHF+W16hGm0E91RHeIwSc=;
        b=G7LIdYNrQJ+55EIfpWd5RZ8isu9JlNYMsC773ju0VD0Zt4hgLEl/wVK+HTOP14UZeD
         PRs9DF0VWQ7GFHvw/m4T2cAQiapPa7zm/OoitjTBg9ibR5EZLpwAXP/L/yb379FZja6g
         7PZoX0WTfhQnlw8uCrkldhAOWXV2QWPde4K5Sf5k4RsruUlc1EFxsq3W9lSwYO8vFOoC
         lrjMlO+iJKHjU5qdlc4fQvDhkPRBoh+xbn1l6zJa271HZnaT2fjFz+xar/EXVncWcaDu
         Nf9AntKuP8wtCWETBQF34kbRcDj0HB6c57N+SYc1FsHmPVadW4pkvQEMYPQnD1LfHGFR
         p6MQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TeDWiBmg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x131si6773135ywc.143.2019.02.11.16.04.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Feb 2019 16:04:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TeDWiBmg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:58295 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gtLYj-0004tz-3R
	for alex.bennee@linaro.org; Mon, 11 Feb 2019 19:04:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38259)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gtLOJ-0005Uc-TF
	for qemu-devel@nongnu.org; Mon, 11 Feb 2019 18:53:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gtLOH-0004g1-3v
	for qemu-devel@nongnu.org; Mon, 11 Feb 2019 18:53:35 -0500
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:41096)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gtLOG-0004Uo-F6
	for qemu-devel@nongnu.org; Mon, 11 Feb 2019 18:53:32 -0500
Received: by mail-pf1-x443.google.com with SMTP id b7so327892pfi.8
	for <qemu-devel@nongnu.org>; Mon, 11 Feb 2019 15:53:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=uWHLuK9tuxKWuI11A7yFd0AHF+W16hGm0E91RHeIwSc=;
	b=TeDWiBmgs42SOwYZkvlhu2ZMKmNt2Mti+48SjvY5neZ9v1Td56lWMUVr3UJ/oe1H+F
	7DiCS0YRF1JqbgqAXxttDJI9Uf5Hk7F2EOj3TWKsfYKEYyFudo16RXxmKTbS1kZM1X3S
	FHBM59frlY5mFlSLWsX6olkM9YrWr1r6x3LJa4gRIxTFaSYmAErWuZB/BcGz/rOALrSB
	jhgU/bZxzXVlNG7szr7IYQ3qA62bwJtHaVvd/oUluCgPgouRUFsWJ54CWIVYl7FBPPNM
	kNMl7QxRjvalHPysvFMmX71v/pWDg4Rv1NPWSOkpln1Q86pGZLoAQBOMFBqHRk1MEMNc
	F83w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=uWHLuK9tuxKWuI11A7yFd0AHF+W16hGm0E91RHeIwSc=;
	b=nM3iEn/crst7tTZB8UM91i5HSlG4hzuITx5sZGHsd/bT7WjgHYqzyOf2+MOKQaw3IF
	9zfoQIsFewYodhcHy7R4i0ELkXkHbaV/W85bfKprlU3o7hNoTNMTKwnFMTxeXJPwq5Q0
	s3i04VTyd6OrGeaokDoklq145WWjCAfeJZNVbJ8X/6K8mt8gkEK0eRf/pONDZh+uix0l
	/f9qnCWxIQczoimEil+BsnTDhlgjU9oSA/CG8DWQqsDrYADGfN0L6cP3VYRtqhAizHm7
	QWJr6NEnU1Ow/jy1uAuwbo5YSZfgo7Dm6SNXi48wQyEsatLRN5K8D6nTVk/CpF8zuiE9
	WURA==
X-Gm-Message-State: AHQUAuZmwjbPF4+SAO3MSLUEiv0+Zy6qVSmo0lsJE03aYgtPLqd2zgx5
	R3Yxh3vkb+DLdBL/lD3STn8gwZMoRwQ=
X-Received: by 2002:a62:b511:: with SMTP id y17mr884206pfe.199.1549929203823; 
	Mon, 11 Feb 2019 15:53:23 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82]) by smtp.gmail.com with ESMTPSA id
	c4sm11861031pgq.85.2019.02.11.15.53.22
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 11 Feb 2019 15:53:23 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 11 Feb 2019 15:52:47 -0800
Message-Id: <20190211235258.542-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190211235258.542-1-richard.henderson@linaro.org>
References: <20190211235258.542-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::443
Subject: [Qemu-devel] [PATCH v3 17/28] target/arm: Implement the LDGM and
 STGM instructions
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
X-TUID: 5gWALC/Z35LH

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v3: Require pre-cleaned addresses.
---
 target/arm/helper-a64.h    |  3 ++
 target/arm/mte_helper.c    | 96 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-a64.c | 42 +++++++++++++----
 3 files changed, 132 insertions(+), 9 deletions(-)

diff --git a/target/arm/helper-a64.h b/target/arm/helper-a64.h
index 91e6a6ea94..5bcdfcf81b 100644
--- a/target/arm/helper-a64.h
+++ b/target/arm/helper-a64.h
@@ -114,3 +114,6 @@ DEF_HELPER_FLAGS_3(stg, TCG_CALL_NO_WG, void, env, i64, i64)
 DEF_HELPER_FLAGS_3(st2g, TCG_CALL_NO_WG, void, env, i64, i64)
 DEF_HELPER_FLAGS_3(stg_parallel, TCG_CALL_NO_WG, void, env, i64, i64)
 DEF_HELPER_FLAGS_3(st2g_parallel, TCG_CALL_NO_WG, void, env, i64, i64)
+DEF_HELPER_FLAGS_2(ldgm, TCG_CALL_NO_WG, i64, env, i64)
+DEF_HELPER_FLAGS_3(stgm, TCG_CALL_NO_WG, void, env, i64, i64)
+DEF_HELPER_FLAGS_3(stzgm, TCG_CALL_NO_WG, void, env, i64, i64)
diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index e8873f1e75..afa4c26535 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -377,3 +377,99 @@ void HELPER(st2g_parallel)(CPUARMState *env, uint64_t ptr, uint64_t xt)
 {
     do_st2g(env, ptr, xt, GETPC(), store_tag1_parallel);
 }
+
+uint64_t HELPER(ldgm)(CPUARMState *env, uint64_t ptr)
+{
+    const int size = 4 << GMID_EL1_BS;
+    int el;
+    uint64_t sctlr;
+    void *mem;
+
+    ptr = QEMU_ALIGN_DOWN(ptr, size);
+
+    /* Trap if accessing an invalid page(s).  */
+    mem = allocation_tag_mem(env, ptr, false, GETPC());
+
+    /*
+     * The tag is squashed to zero if the page does not support tags,
+     * or if the OS is denying access to the tags.
+     */
+    el = arm_current_el(env);
+    sctlr = arm_sctlr(env, el);
+    if (!mem || !allocation_tag_access_enabled(env, el, sctlr)) {
+        return 0;
+    }
+
+#if GMID_EL1_BS != 6
+# error "Fill in the blanks for other sizes"
+#endif
+    /*
+     * We are loading 64-bits worth of tags.  The ordering of elements
+     * within the word corresponds to a 64-bit little-endian operation.
+     */
+    return ldq_le_p(mem);
+}
+
+static uint64_t do_stgm(CPUARMState *env, uint64_t ptr,
+                        uint64_t val, uintptr_t ra)
+{
+    const int size = 4 << GMID_EL1_BS;
+    int el;
+    uint64_t sctlr;
+    void *mem;
+
+    ptr = QEMU_ALIGN_DOWN(ptr, size);
+
+    /* Trap if accessing an invalid page(s).  */
+    mem = allocation_tag_mem(env, ptr, true, ra);
+
+    /*
+     * No action if the page does not support tags,
+     * or if the OS is denying access to the tags.
+     */
+    el = arm_current_el(env);
+    sctlr = arm_sctlr(env, el);
+    if (!mem || !allocation_tag_access_enabled(env, el, sctlr)) {
+        return ptr;
+    }
+
+#if GMID_EL1_BS != 6
+# error "Fill in the blanks for other sizes"
+#endif
+    /*
+     * We are storing 64-bits worth of tags.  The ordering of elements
+     * within the word corresponds to a 64-bit little-endian operation.
+     */
+    stq_le_p(mem, val);
+
+    return ptr;
+}
+
+void HELPER(stgm)(CPUARMState *env, uint64_t ptr, uint64_t val)
+{
+    do_stgm(env, ptr, val, GETPC());
+}
+
+void HELPER(stzgm)(CPUARMState *env, uint64_t ptr, uint64_t val)
+{
+    int i, mmu_idx, size = 4 << GMID_EL1_BS;
+    uintptr_t ra = GETPC();
+    void *mem;
+
+    ptr = do_stgm(env, ptr, val, ra);
+
+    /*
+     * We will have just probed this virtual address in do_stgm.
+     * If the tlb_vaddr_to_host fails, then the memory is not ram,
+     * or is monitored in some other way.  Fall back to stores.
+     */
+    mmu_idx = cpu_mmu_index(env, false);
+    mem = tlb_vaddr_to_host(env, ptr, MMU_DATA_STORE, mmu_idx);
+    if (mem) {
+        memset(mem, 0, size);
+    } else {
+        for (i = 0; i < size; i += 8) {
+            cpu_stq_data_ra(env, ptr + i, 0, ra);
+        }
+    }
+}
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index ef3fc3a397..b97af372f0 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -3643,7 +3643,7 @@ static void disas_ldst_tag(DisasContext *s, uint32_t insn)
     uint64_t offset = sextract64(insn, 12, 9) << LOG2_TAG_GRANULE;
     int op2 = extract32(insn, 10, 3);
     int op1 = extract32(insn, 22, 2);
-    bool is_load = false, is_pair = false, is_zero = false;
+    bool is_load = false, is_pair = false, is_zero = false, is_mult = false;
     int index = 0;
     TCGv_i64 dirty_addr, clean_addr, tcg_rt;
 
@@ -3653,13 +3653,18 @@ static void disas_ldst_tag(DisasContext *s, uint32_t insn)
     }
 
     switch (op1) {
-    case 0: /* STG */
+    case 0:
         if (op2 != 0) {
             /* STG */
             index = op2 - 2;
-            break;
+        } else {
+            /* STZGM */
+            if (s->current_el == 0 || offset != 0) {
+                goto do_unallocated;
+            }
+            is_mult = is_zero = true;
         }
-        goto do_unallocated;
+        break;
     case 1:
         if (op2 != 0) {
             /* STZG */
@@ -3675,17 +3680,27 @@ static void disas_ldst_tag(DisasContext *s, uint32_t insn)
             /* ST2G */
             is_pair = true;
             index = op2 - 2;
-            break;
+        } else {
+            /* STGM */
+            if (s->current_el == 0 || offset != 0) {
+                goto do_unallocated;
+            }
+            is_mult = true;
         }
-        goto do_unallocated;
+        break;
     case 3:
         if (op2 != 0) {
             /* STZ2G */
             is_pair = is_zero = true;
             index = op2 - 2;
-            break;
+        } else {
+            /* LDGM */
+            if (s->current_el == 0 || offset != 0) {
+                goto do_unallocated;
+            }
+            is_mult = is_load = true;
         }
-        goto do_unallocated;
+        break;
 
     default:
     do_unallocated:
@@ -3702,7 +3717,16 @@ static void disas_ldst_tag(DisasContext *s, uint32_t insn)
     clean_addr = clean_data_tbi(s, dirty_addr, false);
     tcg_rt = cpu_reg(s, rt);
 
-    if (is_load) {
+    if (is_mult) {
+        if (is_load) {
+            gen_helper_ldgm(tcg_rt, cpu_env, clean_addr);
+        } else if (is_zero) {
+            gen_helper_stzgm(cpu_env, clean_addr, tcg_rt);
+        } else {
+            gen_helper_stgm(cpu_env, clean_addr, tcg_rt);
+        }
+        return;
+    } else if (is_load) {
         gen_helper_ldg(tcg_rt, cpu_env, clean_addr, tcg_rt);
     } else if (tb_cflags(s->base.tb) & CF_PARALLEL) {
         if (is_pair) {
-- 
2.17.2

