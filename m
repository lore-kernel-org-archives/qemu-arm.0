Received: by 10.28.71.27 with SMTP id u27csp2101065wma;
        Sat, 17 Feb 2018 11:08:16 -0800 (PST)
X-Google-Smtp-Source: AH8x226nsGeLr7QJCx2I/ottB7GBNzF7YdEpK/niESDV/I9ef4F53lZeYl5dSTfFxvIeB/+MFSNu
X-Received: by 10.13.204.135 with SMTP id o129mr659660ywd.101.1518894496354;
        Sat, 17 Feb 2018 11:08:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518894496; cv=none;
        d=google.com; s=arc-20160816;
        b=CnHhsn1LN/xp9zgp8Tox94sSx3NCtErv3eJCY/uAjWCLGj/nCMylzySZp4kr3jLgc0
         aMDYj/E9JTA8RLu+PEGLE+Hz2+vYqC65UzsQeXqh2cpwbHNJP4AoZUs83fJcKO+aOTIk
         j+oqWX0P2lx6QRBnbQB9+ApfRp7wm3qkftWcuV3lrg7pPBLwLSrVGVsdOS+zg3k05h/w
         /3LzVz/PdetZ+/o+upidYAuUs/I6DPnQj+3Iyl/dbq1lqJuArl3cLanbIsmEzu6jySPA
         H0CTTxdidswXBKt9KHYf3DgW+ySkT+xuQrYThK3oEWopKjBldaju650qgfKOjz0rlCrz
         L4+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=5Y5i1Z/QDoiE237plg9CGLy21f/g2av1w+1fO98BbyU=;
        b=iqwwOIaHrmUseFg/zXWCzX2zT9t94IDD396E0Y0pwQnHBt+1eXCPJl6sNeXQ/XBixZ
         wJ0gkc2+9juAU2I9z+B+h3tTaaq/qsjRHjvgNMsrMIi/xhykfRvcPuTYE1krAPHNNC7e
         Xwo189g4CIrq4wLJB/UMZy9S7DFmcNpvMxXFcy96Q1tpAmoZuPp6bv55g89l001oBLh7
         msU393CSdti/VAUAgdGfV59Sm2i0sr703eVuhhkggnynErkcQSqmuHgbnl3VT9Ka9zTj
         svjajnf1T2yCKUtj0pvb1kMhD+mM0/JCJeeaNDz92sqNGcfmaIFHyjjRHLW1TNXXEgFi
         c6KA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=D6Xv3L8w;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u188si866290ywd.25.2018.02.17.11.08.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 17 Feb 2018 11:08:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=D6Xv3L8w;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48439 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1en7qJ-00048X-K2
	for alex.bennee@linaro.org; Sat, 17 Feb 2018 14:08:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40505)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en7A2-0001DX-7o
	for qemu-devel@nongnu.org; Sat, 17 Feb 2018 13:24:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en79z-0001yw-Ad
	for qemu-devel@nongnu.org; Sat, 17 Feb 2018 13:24:34 -0500
Received: from mail-pl0-x243.google.com ([2607:f8b0:400e:c01::243]:34791)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1en79z-0001yY-32
	for qemu-devel@nongnu.org; Sat, 17 Feb 2018 13:24:31 -0500
Received: by mail-pl0-x243.google.com with SMTP id bd10so3450055plb.1
	for <qemu-devel@nongnu.org>; Sat, 17 Feb 2018 10:24:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=5Y5i1Z/QDoiE237plg9CGLy21f/g2av1w+1fO98BbyU=;
	b=D6Xv3L8wcdUuu17M6/nAzjHQfUC82mYwKRU2s1p89C9WCeDQG2erUwT8LxN4sa+Scd
	zeOmL49xGuJ3El7P0RJ7lK+erpektPOX0NLF9bFnkqk0I1iKkbPVa2DAHdO5pA/AXs50
	FrmCvhnQuBwWNXk7GY6/hG2zVlo0rUgFRuHrM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=5Y5i1Z/QDoiE237plg9CGLy21f/g2av1w+1fO98BbyU=;
	b=IowTsfAX4U2IlcqD9+1Ct4vHTOOZCTaPhXJ+xITskFtBpzsb14u+LIf6JDX4X/Iw1B
	blDcH5H7+fdaUU+VVzJ19p3zi/OwtDCiKN5EeZ2PXSosEuNqvuesD26VjCzLxbHHZ5uZ
	bpRbL6GGKW4r1izq3dqY5FJ2QI6IgJxtgVl4M6cn+J7u3vbGeeyoT6ZXVCaM9EY3QYII
	T2YS7IwOIZNMEbdSrPGUKssTp957UH9E8AiNga+y4DNufWBnYsVRW5/JXjGIKiP+5PW1
	4YrFZHh9uurx7C7WVmOmLRTbbfDMx8DOoW4IxZqhtaYpsDuO/aV/ATB4hu2xIWLzelwY
	hMXQ==
X-Gm-Message-State: APf1xPBn5M1qKn2Pm/VBLbvRajNhFLLZeNhgOs0txYuz4ckzGk87miIM
	H5a1AWJvhP7gJ72pMKZ9v7fpC+5DUv4=
X-Received: by 2002:a17:902:6bcb:: with SMTP id
	m11-v6mr2326167plt.326.1518891869820; 
	Sat, 17 Feb 2018 10:24:29 -0800 (PST)
Received: from cloudburst.twiddle.net ([50.0.192.64])
	by smtp.gmail.com with ESMTPSA id
	h15sm13466712pfi.56.2018.02.17.10.24.28
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 17 Feb 2018 10:24:29 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat, 17 Feb 2018 10:22:56 -0800
Message-Id: <20180217182323.25885-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180217182323.25885-1-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::243
Subject: [Qemu-devel] [PATCH v2 40/67] target/arm: Implement SVE Integer
 Compare - Scalars Group
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
X-TUID: VkilrNzGgyND

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    |  2 +
 target/arm/sve_helper.c    | 31 ++++++++++++++++
 target/arm/translate-sve.c | 92 ++++++++++++++++++++++++++++++++++++++++++++++
 target/arm/sve.decode      |  8 ++++
 4 files changed, 133 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index dd4f8f754d..1863106d0f 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -678,3 +678,5 @@ DEF_HELPER_FLAGS_4(sve_brkn, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve_brkns, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_3(sve_cntp, TCG_CALL_NO_RWG, i64, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_3(sve_while, TCG_CALL_NO_RWG, i32, ptr, i32, i32)
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index dd884bdd1c..80b78da834 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -2716,3 +2716,34 @@ uint64_t HELPER(sve_cntp)(void *vn, void *vg, uint32_t pred_desc)
     }
     return sum;
 }
+
+uint32_t HELPER(sve_while)(void *vd, uint32_t count, uint32_t pred_desc)
+{
+    uintptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
+    intptr_t esz = extract32(pred_desc, SIMD_DATA_SHIFT, 2);
+    uint64_t esz_mask = pred_esz_masks[esz];
+    ARMPredicateReg *d = vd;
+    uint32_t flags;
+    intptr_t i;
+
+    /* Begin with a zero predicate register.  */
+    flags = do_zero(d, oprsz);
+    if (count == 0) {
+        return flags;
+    }
+
+    /* Scale from predicate element count to bits.  */
+    count <<= esz;
+    /* Bound to the bits in the predicate.  */
+    count = MIN(count, oprsz * 8);
+
+    /* Set all of the requested bits.  */
+    for (i = 0; i < count / 64; ++i) {
+        d->p[i] = esz_mask;
+    }
+    if (count & 63) {
+        d->p[i] = ~(-1ull << (count & 63)) & esz_mask;
+    }
+
+    return predtest_ones(d, oprsz, esz_mask);
+}
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 038800cc86..4b92a55c21 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2847,6 +2847,98 @@ static void trans_SINCDECP_z(DisasContext *s, arg_incdec2_pred *a,
     do_sat_addsub_vec(s, a->esz, a->rd, a->rn, val, a->u, a->d);
 }
 
+/*
+ *** SVE Integer Compare Scalars Group
+ */
+
+static void trans_CTERM(DisasContext *s, arg_CTERM *a, uint32_t insn)
+{
+    TCGCond cond = (a->ne ? TCG_COND_NE : TCG_COND_EQ);
+    TCGv_i64 rn = read_cpu_reg(s, a->rn, a->sf);
+    TCGv_i64 rm = read_cpu_reg(s, a->rm, a->sf);
+    TCGv_i64 cmp = tcg_temp_new_i64();
+
+    tcg_gen_setcond_i64(cond, cmp, rn, rm);
+    tcg_gen_extrl_i64_i32(cpu_NF, cmp);
+    tcg_temp_free_i64(cmp);
+
+    /* VF = !NF & !CF.  */
+    tcg_gen_xori_i32(cpu_VF, cpu_NF, 1);
+    tcg_gen_andc_i32(cpu_VF, cpu_VF, cpu_CF);
+
+    /* Both NF and VF actually look at bit 31.  */
+    tcg_gen_neg_i32(cpu_NF, cpu_NF);
+    tcg_gen_neg_i32(cpu_VF, cpu_VF);
+}
+
+static void trans_WHILE(DisasContext *s, arg_WHILE *a, uint32_t insn)
+{
+    TCGv_i64 op0 = read_cpu_reg(s, a->rn, 1);
+    TCGv_i64 op1 = read_cpu_reg(s, a->rm, 1);
+    TCGv_i64 t0 = tcg_temp_new_i64();
+    TCGv_i64 t1 = tcg_temp_new_i64();
+    TCGv_i32 t2, t3;
+    TCGv_ptr ptr;
+    unsigned desc, vsz = vec_full_reg_size(s);
+    TCGCond cond;
+
+    if (!a->sf) {
+        if (a->u) {
+            tcg_gen_ext32u_i64(op0, op0);
+            tcg_gen_ext32u_i64(op1, op1);
+        } else {
+            tcg_gen_ext32s_i64(op0, op0);
+            tcg_gen_ext32s_i64(op1, op1);
+        }
+    }
+
+    /* For the helper, compress the different conditions into a computation
+     * of how many iterations for which the condition is true.
+     *
+     * This is slightly complicated by 0 <= UINT64_MAX, which is nominally
+     * 2**64 iterations, overflowing to 0.  Of course, predicate registers
+     * aren't that large, so any value >= predicate size is sufficient.
+     */
+    tcg_gen_sub_i64(t0, op1, op0);
+
+    /* t0 = MIN(op1 - op0, vsz).  */
+    if (a->eq) {
+        /* Equality means one more iteration.  */
+        tcg_gen_movi_i64(t1, vsz - 1);
+        tcg_gen_movcond_i64(TCG_COND_LTU, t0, t0, t1, t0, t1);
+        tcg_gen_addi_i64(t0, t0, 1);
+    } else {
+        tcg_gen_movi_i64(t1, vsz);
+        tcg_gen_movcond_i64(TCG_COND_LTU, t0, t0, t1, t0, t1);
+    }
+
+    /* t0 = (condition true ? t0 : 0).  */
+    cond = (a->u
+            ? (a->eq ? TCG_COND_LEU : TCG_COND_LTU)
+            : (a->eq ? TCG_COND_LE : TCG_COND_LT));
+    tcg_gen_movi_i64(t1, 0);
+    tcg_gen_movcond_i64(cond, t0, op0, op1, t0, t1);
+
+    t2 = tcg_temp_new_i32();
+    tcg_gen_extrl_i64_i32(t2, t0);
+    tcg_temp_free_i64(t0);
+    tcg_temp_free_i64(t1);
+
+    desc = (vsz / 8) - 2;
+    desc = deposit32(desc, SIMD_DATA_SHIFT, 2, a->esz);
+    t3 = tcg_const_i32(desc);
+
+    ptr = tcg_temp_new_ptr();
+    tcg_gen_addi_ptr(ptr, cpu_env, pred_full_reg_offset(s, a->rd));
+
+    gen_helper_sve_while(t2, ptr, t2, t3);
+    do_pred_flags(t2);
+
+    tcg_temp_free_ptr(ptr);
+    tcg_temp_free_i32(t2);
+    tcg_temp_free_i32(t3);
+}
+
 /*
  *** SVE Memory - 32-bit Gather and Unsized Contiguous Group
  */
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 76c084d43e..b5bc7e9546 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -614,6 +614,14 @@ SINCDECP_r_64	00100101 .. 1010 d:1 u:1 10001 10 .... .....	@incdec_pred
 # SVE saturating inc/dec vector by predicate count
 SINCDECP_z	00100101 .. 1010 d:1 u:1 10000 00 .... .....	@incdec2_pred
 
+### SVE Integer Compare - Scalars Group
+
+# SVE conditionally terminate scalars
+CTERM		00100101 1 sf:1 1 rm:5 001000 rn:5 ne:1 0000
+
+# SVE integer compare scalar count and limit
+WHILE		00100101 esz:2 1 rm:5 000 sf:1 u:1 1 rn:5 eq:1 rd:4
+
 ### SVE Memory - 32-bit Gather and Unsized Contiguous Group
 
 # SVE load predicate register
-- 
2.14.3

