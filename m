Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp5030996wre;
        Wed, 30 May 2018 11:13:54 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIh7kT4P2Mtd9rlBZkaljOgr6EI7z8iMGbb0d8Qd38OAEmbYpflwjoitty+z7u5959T67gX
X-Received: by 2002:a37:38cf:: with SMTP id f198-v6mr3474644qka.156.1527704034538;
        Wed, 30 May 2018 11:13:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527704034; cv=none;
        d=google.com; s=arc-20160816;
        b=lq58MBbsZQL0C2A7Z8f9pzZXKyZhVEY/RXXKiwboQWedSXPGWJ33s9ziw1RVuTcRfF
         qzmuIqEObHGxE63HkgQ6s+neHdy1gh7WEu1tQ1KC04K/kbA4ic7DzZ6OxwSM93nvgMPh
         pVUvP+tIS1cQNqb0KugDiflvivi5HaoUCXdW+ql+Q/hTSGjVPM7z4FoPasxSdsgjQgSq
         4yC1+CBpQ6b0FJQq3jAFljVcz4LFunFZ/aBGda4PmIXRC/EwiYObF1x7ylQxWkreD2Mn
         +Pr9QXJZsjeGSvKgZSep2Rft9pVom1IEpdD+2EFMsZ6HPx9m54GT5Rt7sb5DAlXTKq++
         Nqvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=Ld2xrQU82H6bGici9pXYUtbus0NOEmAaNaAWCDL2/k4=;
        b=cqFomY0ShZXnTp0Op8usuWxGPomfga4YvlgrPIBLQGRo/cKorG3/L1S0dzJiTyME2u
         CmLYgFZGCF3pg+jXF245+NLUl/G0QlKX6xO2IbP/EPbjw2QVB8iHktaU3VfxQ8a6DOMi
         GKzpSZfCHdOT0IqM09zqn2ti6EPvj+qS/1jj8sO+i1yXRsq/mYJ7ML2AStqcT0mqdxf5
         NDq5k++VOjHX3FOSN4ZePlLlkEmHRXDJri+xOjRFH9HJKj3fqJTcAorIOUx+QOMZ88H/
         EslBQvSGDDOcxB6aI9oqFRqUF0LpA2Uj6HxfKng3DbYuoRm7tHK0jxfDPjV9fX3yffgI
         hUEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UwC3TtjR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g4-v6si3814042qki.239.2018.05.30.11.13.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 May 2018 11:13:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UwC3TtjR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40118 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fO5bd-00039x-UR
	for alex.bennee@linaro.org; Wed, 30 May 2018 14:13:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33729)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fO5Q0-000298-1n
	for qemu-arm@nongnu.org; Wed, 30 May 2018 14:01:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fO5Pv-0004ld-0M
	for qemu-arm@nongnu.org; Wed, 30 May 2018 14:01:52 -0400
Received: from mail-pg0-x243.google.com ([2607:f8b0:400e:c05::243]:44518)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fO5Pu-0004kf-Dj
	for qemu-arm@nongnu.org; Wed, 30 May 2018 14:01:46 -0400
Received: by mail-pg0-x243.google.com with SMTP id p21-v6so8481961pgd.11
	for <qemu-arm@nongnu.org>; Wed, 30 May 2018 11:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Ld2xrQU82H6bGici9pXYUtbus0NOEmAaNaAWCDL2/k4=;
	b=UwC3TtjRNT8CSMvhw0uP/p/Zu772c6Jv5L5Y82fNkoNrhexKLA+exq4rGep2lpIQjB
	ddASwHK6V+PeEfSPnHPMtE3kfyBARG+vvUzmdiJt+dlfmeCh2uar6lhQzTJOPCgO85l4
	Y1dHkWbfl+bKck43VhVjiSaf7zml2JmBayH6s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Ld2xrQU82H6bGici9pXYUtbus0NOEmAaNaAWCDL2/k4=;
	b=BjEiFLwo3h5gvkAz2ug4aUM6NZCwRKWwPmV91tKwqNDGXTNqOQ0h4RgTYtoj7GIvzC
	8fdEDSVeCGXkD6O9H80oDc5hv2uzprseeFIme4rkMPIEh9Icr0tNYufdQwLhcOFiDLmE
	ycO7IuwmaEy6riUY9coSPeydFAJF1qliEx0DOqEy7REs0aKF8LbhW3R7KqKq39l4LaJy
	YgYXBh76AK/L5OiAki9muZ0IGxsxNzspdBvmU4LY3IG9Nk3c5tnYBfq19Y2h6MlBLU1w
	UWKpAom/FwTmeN2GIGnriNI0/roM4/UltYPA0FW/Vw00lvXL4rHl5dNXhs1vsbNJvX3D
	Dudw==
X-Gm-Message-State: ALKqPwccgA3SBE0oKVeXLL8Ap5tYe5d7xLvVoPPYB7nQOBpmo03i6KI6
	S7YdoNe98p7E/hBCzGzaYjam3A==
X-Received: by 2002:a62:1656:: with SMTP id 83-v6mr3686176pfw.61.1527703305005;
	Wed, 30 May 2018 11:01:45 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.gmail.com with ESMTPSA id
	b84-v6sm28179157pfm.123.2018.05.30.11.01.43
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 30 May 2018 11:01:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 30 May 2018 11:01:16 -0700
Message-Id: <20180530180120.13355-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180530180120.13355-1-richard.henderson@linaro.org>
References: <20180530180120.13355-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::243
Subject: [Qemu-arm] [PATCH v3b 14/18] target/arm: Implement SVE Predicate
 Count Group
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: G1kWZmJmqX/y

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    |   2 +
 target/arm/sve_helper.c    |  14 ++++
 target/arm/translate-sve.c | 132 +++++++++++++++++++++++++++++++++++++
 target/arm/sve.decode      |  27 ++++++++
 4 files changed, 175 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index f0a3ed3414..dd4f8f754d 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -676,3 +676,5 @@ DEF_HELPER_FLAGS_4(sve_brkbs_m, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_4(sve_brkn, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve_brkns, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_3(sve_cntp, TCG_CALL_NO_RWG, i64, ptr, ptr, i32)
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 409ec0963f..8d1631ea3c 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -2722,3 +2722,17 @@ uint32_t HELPER(sve_brkns)(void *vd, void *vn, void *vg, uint32_t pred_desc)
         return do_zero(vd, oprsz);
     }
 }
+
+uint64_t HELPER(sve_cntp)(void *vn, void *vg, uint32_t pred_desc)
+{
+    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
+    intptr_t esz = extract32(pred_desc, SIMD_DATA_SHIFT, 2);
+    uint64_t *n = vn, *g = vg, sum = 0, mask = pred_esz_masks[esz];
+    intptr_t i;
+
+    for (i = 0; i < DIV_ROUND_UP(oprsz, 8); ++i) {
+        uint64_t t = n[i] & g[i] & mask;
+        sum += ctpop64(t);
+    }
+    return sum;
+}
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index d5f33cbfe9..e4815e4912 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -34,6 +34,9 @@
 #include "translate-a64.h"
 
 
+typedef void GVecGen2sFn(unsigned, uint32_t, uint32_t,
+                         TCGv_i64, uint32_t, uint32_t);
+
 typedef void gen_helper_gvec_flags_3(TCGv_i32, TCGv_ptr, TCGv_ptr,
                                      TCGv_ptr, TCGv_i32);
 typedef void gen_helper_gvec_flags_4(TCGv_i32, TCGv_ptr, TCGv_ptr,
@@ -2949,6 +2952,135 @@ static bool trans_BRKN(DisasContext *s, arg_rpr_s *a, uint32_t insn)
     return do_brk2(s, a, gen_helper_sve_brkn, gen_helper_sve_brkns);
 }
 
+/*
+ *** SVE Predicate Count Group
+ */
+
+static void do_cntp(DisasContext *s, TCGv_i64 val, int esz, int pn, int pg)
+{
+    unsigned psz = pred_full_reg_size(s);
+
+    if (psz <= 8) {
+        uint64_t psz_mask;
+
+        tcg_gen_ld_i64(val, cpu_env, pred_full_reg_offset(s, pn));
+        if (pn != pg) {
+            TCGv_i64 g = tcg_temp_new_i64();
+            tcg_gen_ld_i64(g, cpu_env, pred_full_reg_offset(s, pg));
+            tcg_gen_and_i64(val, val, g);
+            tcg_temp_free_i64(g);
+        }
+
+        /* Reduce the pred_esz_masks value simply to reduce the
+           size of the code generated here.  */
+        psz_mask = deposit64(0, 0, psz * 8, -1);
+        tcg_gen_andi_i64(val, val, pred_esz_masks[esz] & psz_mask);
+
+        tcg_gen_ctpop_i64(val, val);
+    } else {
+        TCGv_ptr t_pn = tcg_temp_new_ptr();
+        TCGv_ptr t_pg = tcg_temp_new_ptr();
+        unsigned desc;
+        TCGv_i32 t_desc;
+
+        desc = psz - 2;
+        desc = deposit32(desc, SIMD_DATA_SHIFT, 2, esz);
+
+        tcg_gen_addi_ptr(t_pn, cpu_env, pred_full_reg_offset(s, pn));
+        tcg_gen_addi_ptr(t_pg, cpu_env, pred_full_reg_offset(s, pg));
+        t_desc = tcg_const_i32(desc);
+
+        gen_helper_sve_cntp(val, t_pn, t_pg, t_desc);
+        tcg_temp_free_ptr(t_pn);
+        tcg_temp_free_ptr(t_pg);
+        tcg_temp_free_i32(t_desc);
+    }
+}
+
+static bool trans_CNTP(DisasContext *s, arg_CNTP *a, uint32_t insn)
+{
+    if (sve_access_check(s)) {
+        do_cntp(s, cpu_reg(s, a->rd), a->esz, a->rn, a->pg);
+    }
+    return true;
+}
+
+static bool trans_INCDECP_r(DisasContext *s, arg_incdec_pred *a,
+                            uint32_t insn)
+{
+    if (sve_access_check(s)) {
+        TCGv_i64 reg = cpu_reg(s, a->rd);
+        TCGv_i64 val = tcg_temp_new_i64();
+
+        do_cntp(s, val, a->esz, a->pg, a->pg);
+        if (a->d) {
+            tcg_gen_sub_i64(reg, reg, val);
+        } else {
+            tcg_gen_add_i64(reg, reg, val);
+        }
+        tcg_temp_free_i64(val);
+    }
+    return true;
+}
+
+static bool trans_INCDECP_z(DisasContext *s, arg_incdec2_pred *a,
+                            uint32_t insn)
+{
+    if (a->esz == 0) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        TCGv_i64 val = tcg_temp_new_i64();
+        GVecGen2sFn *gvec_fn = a->d ? tcg_gen_gvec_subs : tcg_gen_gvec_adds;
+
+        do_cntp(s, val, a->esz, a->pg, a->pg);
+        gvec_fn(a->esz, vec_full_reg_offset(s, a->rd),
+                vec_full_reg_offset(s, a->rn), val, vsz, vsz);
+    }
+    return true;
+}
+
+static bool trans_SINCDECP_r_32(DisasContext *s, arg_incdec_pred *a,
+                                uint32_t insn)
+{
+    if (sve_access_check(s)) {
+        TCGv_i64 reg = cpu_reg(s, a->rd);
+        TCGv_i64 val = tcg_temp_new_i64();
+
+        do_cntp(s, val, a->esz, a->pg, a->pg);
+        do_sat_addsub_32(reg, val, a->u, a->d);
+    }
+    return true;
+}
+
+static bool trans_SINCDECP_r_64(DisasContext *s, arg_incdec_pred *a,
+                                uint32_t insn)
+{
+    if (sve_access_check(s)) {
+        TCGv_i64 reg = cpu_reg(s, a->rd);
+        TCGv_i64 val = tcg_temp_new_i64();
+
+        do_cntp(s, val, a->esz, a->pg, a->pg);
+        do_sat_addsub_64(reg, val, a->u, a->d);
+    }
+    return true;
+}
+
+static bool trans_SINCDECP_z(DisasContext *s, arg_incdec2_pred *a,
+                             uint32_t insn)
+{
+    if (a->esz == 0) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        TCGv_i64 val = tcg_temp_new_i64();
+        do_cntp(s, val, a->esz, a->pg, a->pg);
+        do_sat_addsub_vec(s, a->esz, a->rd, a->rn, val, a->u, a->d);
+    }
+    return true;
+}
+
 /*
  *** SVE Memory - 32-bit Gather and Unsized Contiguous Group
  */
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 66e1ee6b5c..62d51c252b 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -67,6 +67,8 @@
 &ptrue          rd esz pat s
 &incdec_cnt     rd pat esz imm d u
 &incdec2_cnt    rd rn pat esz imm d u
+&incdec_pred    rd pg esz d u
+&incdec2_pred   rd rn pg esz d u
 
 ###########################################################################
 # Named instruction formats.  These are generally used to
@@ -113,6 +115,7 @@
 
 # One register operand, with governing predicate, vector element size
 @rd_pg_rn       ........ esz:2 ... ... ... pg:3 rn:5 rd:5       &rpr_esz
+@rd_pg4_pn      ........ esz:2 ... ... .. pg:4 . rn:4 rd:5      &rpr_esz
 
 # Two register operands with a 6-bit signed immediate.
 @rd_rn_i6       ........ ... rn:5 ..... imm:s6 rd:5             &rri
@@ -153,6 +156,12 @@
 @incdec2_cnt    ........ esz:2 .. .... ...... pat:5 rd:5 \
                 &incdec2_cnt imm=%imm4_16_p1 rn=%reg_movprfx
 
+# One register, predicate.
+# User must fill in U and D.
+@incdec_pred    ........ esz:2 .... .. ..... .. pg:4 rd:5       &incdec_pred
+@incdec2_pred   ........ esz:2 .... .. ..... .. pg:4 rd:5 \
+                &incdec2_pred rn=%reg_movprfx
+
 ###########################################################################
 # Instruction patterns.  Grouped according to the SVE encodingindex.xhtml.
 
@@ -579,6 +588,24 @@ BRKB_m          00100101 1. 01000001 .... 0 .... 1 ....         @pd_pg_pn_s
 # SVE propagate break to next partition
 BRKN            00100101 0. 01100001 .... 0 .... 0 ....         @pd_pg_pn_s
 
+### SVE Predicate Count Group
+
+# SVE predicate count
+CNTP            00100101 .. 100 000 10 .... 0 .... .....        @rd_pg4_pn
+
+# SVE inc/dec register by predicate count
+INCDECP_r       00100101 .. 10110 d:1 10001 00 .... .....     @incdec_pred u=1
+
+# SVE inc/dec vector by predicate count
+INCDECP_z       00100101 .. 10110 d:1 10000 00 .... .....    @incdec2_pred u=1
+
+# SVE saturating inc/dec register by predicate count
+SINCDECP_r_32   00100101 .. 1010 d:1 u:1 10001 00 .... .....    @incdec_pred
+SINCDECP_r_64   00100101 .. 1010 d:1 u:1 10001 10 .... .....    @incdec_pred
+
+# SVE saturating inc/dec vector by predicate count
+SINCDECP_z      00100101 .. 1010 d:1 u:1 10000 00 .... .....    @incdec2_pred
+
 ### SVE Memory - 32-bit Gather and Unsized Contiguous Group
 
 # SVE load predicate register
-- 
2.17.0

