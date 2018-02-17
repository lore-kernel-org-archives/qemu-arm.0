Received: by 10.28.71.27 with SMTP id u27csp2085786wma;
        Sat, 17 Feb 2018 10:46:17 -0800 (PST)
X-Google-Smtp-Source: AH8x226QGUotesyZ+RzJIexemm8ggY5r2LCw1rbh8IQtA7iHZFl4P8ZcXIOgw8bECVdlu8Xh/phN
X-Received: by 10.37.123.133 with SMTP id w127mr7217492ybc.274.1518893176962;
        Sat, 17 Feb 2018 10:46:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518893176; cv=none;
        d=google.com; s=arc-20160816;
        b=yEZD0F9BUN7xTmGyO8Pp3IEaoPwpGaAelTxj/f30YVIy+VZUC2IKIW49QD/pqCk13Z
         6j6PnblaGvdMLY7hI44RU6Nn1mugeVBdxNIE0JpWKrHAkQ8pk1oTFzSViu/DUZpRsm5F
         YsC7wIPmRw+6eVUKM4XAP5flGJSim/n5/u0nH94UZZyFZ6wBVeW8lo7t1RnnZ8dBYI+d
         hVQknywGLSlb0DczQvSzs9PzEmFO64Sxo9JKslJal3uEV9BaDuOSqkAKYGZp7QRx8SZv
         SA471ZGbO8RZ0UCXwvdJ14h4kC9a0Pcu/+Gajh2nqA4w16FZ6TX7DyRl0aDcPOoU2Qxj
         KBYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=FVmGqUj6eUA4cUBaHP2RMtNc+5HxMAEYAfQlDELLJ08=;
        b=N7SoUmL8z89V8TIk5qrPtf17PEXcpkFucxDXSQ82t4fuvFCNM+/1YO/Bi8QYutC51u
         vnxcyuDrExMT63xVAheVTlvfJkA2obaYuCzxtac7cvzdLN4HSJqAjQh/V+Gw+DtSfs3Y
         rOV57OrhWvXGWdhviQ+lDsdAee51jEvSiHqG7grZ2sXwKYtDVcuCgQ3PGhJm2SraxJJo
         i1vS9faKzVObk1kqOuVyTH5Yy2grZQUfRvLrag6A+0Lkiz8qrdhsuybKeHvHy06KveJ1
         KcLDI0wWzSmMOEOvDn3NuCD329hoEEvRZBII5mwPoy0Pqb/9TT9+swma5D5OF7nlKX/C
         wB5g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=czs9ma53;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v20si596211ybd.396.2018.02.17.10.46.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 17 Feb 2018 10:46:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=czs9ma53;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48233 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1en7V1-0001pX-8c
	for alex.bennee@linaro.org; Sat, 17 Feb 2018 13:46:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40455)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en79z-00019v-Ok
	for qemu-devel@nongnu.org; Sat, 17 Feb 2018 13:24:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en79y-0001y1-1K
	for qemu-devel@nongnu.org; Sat, 17 Feb 2018 13:24:31 -0500
Received: from mail-pl0-x241.google.com ([2607:f8b0:400e:c01::241]:40420)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1en79x-0001xk-Pk
	for qemu-devel@nongnu.org; Sat, 17 Feb 2018 13:24:29 -0500
Received: by mail-pl0-x241.google.com with SMTP id g18so3435581plo.7
	for <qemu-devel@nongnu.org>; Sat, 17 Feb 2018 10:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=FVmGqUj6eUA4cUBaHP2RMtNc+5HxMAEYAfQlDELLJ08=;
	b=czs9ma53fn5O+exBK5ohzl/uOcsR6hdYQQvCHS/EOaDx5gCUA2NiCExeOuFOH5PWUE
	7tdazZtdEFl5fvSvwIvfNNlRmv0Xw3uQ77l2BtN/B+wSVCny6pYUfxY2OcEpZVcV6cd5
	2dHFgt0Q/AZslo9DVnP5gQvt53qdHubNiLfio=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=FVmGqUj6eUA4cUBaHP2RMtNc+5HxMAEYAfQlDELLJ08=;
	b=VXwJSg79LaAiOLhilnvCjCol2CDpbM09LimRYQrEnd2WY8zSjwZHj96wEOLcJoGmB2
	lzU7bxF+aKXqNRakB/X9WYSBtbRtX3psILQ7zsytRox2UyXLapwLLNaKRhaxYUQr+wh7
	QIyzogMBHX15Pame29l4jK3iHdZypa+CJuqWSUSgOc3yt+sZY+isr56D8i6miFReNvAO
	7x7BXm/Lad+Ux1/xCNlYK0aGDYoYaA+WduzueHXyitlfUr0rS36QRsSe0vMB9/uoEv5H
	AFK1INOJJYyAN8sfJGpNUUxbiBf4vSpPYsB6ZV6tOVTElhlXt3al/uaFmuMsvZgnC1Z8
	Z4zw==
X-Gm-Message-State: APf1xPAzE9YkYQ+kfvghTA9kpmDeEshbRiR6jK28v7Nf7Bo6qdE4BGlQ
	nTJzM+3A1fF9bSHz370mzj5GHJxvoYU=
X-Received: by 2002:a17:902:6e8c:: with SMTP id
	v12-v6mr9361431plk.424.1518891868501; 
	Sat, 17 Feb 2018 10:24:28 -0800 (PST)
Received: from cloudburst.twiddle.net ([50.0.192.64])
	by smtp.gmail.com with ESMTPSA id
	h15sm13466712pfi.56.2018.02.17.10.24.27
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 17 Feb 2018 10:24:27 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat, 17 Feb 2018 10:22:55 -0800
Message-Id: <20180217182323.25885-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180217182323.25885-1-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::241
Subject: [Qemu-devel] [PATCH v2 39/67] target/arm: Implement SVE Predicate
 Count Group
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
X-TUID: Ivc/BVQc80Cw

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    |   2 +
 target/arm/sve_helper.c    |  14 ++++++
 target/arm/translate-sve.c | 116 +++++++++++++++++++++++++++++++++++++++++++++
 target/arm/sve.decode      |  27 +++++++++++
 4 files changed, 159 insertions(+)

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
index d6d2220f8b..dd884bdd1c 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -2702,3 +2702,17 @@ uint32_t HELPER(sve_brkns)(void *vd, void *vn, void *vg, uint32_t pred_desc)
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
index dc95d68867..038800cc86 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -36,6 +36,8 @@
 typedef void GVecGen2Fn(unsigned, uint32_t, uint32_t, uint32_t, uint32_t);
 typedef void GVecGen2iFn(unsigned, uint32_t, uint32_t,
                          int64_t, uint32_t, uint32_t);
+typedef void GVecGen2sFn(unsigned, uint32_t, uint32_t,
+                         TCGv_i64, uint32_t, uint32_t);
 typedef void GVecGen3Fn(unsigned, uint32_t, uint32_t,
                         uint32_t, uint32_t, uint32_t);
 
@@ -2731,6 +2733,120 @@ void trans_BRKN(DisasContext *s, arg_rpr_s *a, uint32_t insn)
     do_brk2(s, a, gen_helper_sve_brkn, gen_helper_sve_brkns);
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
+static void trans_CNTP(DisasContext *s, arg_CNTP *a, uint32_t insn)
+{
+    do_cntp(s, cpu_reg(s, a->rd), a->esz, a->rn, a->pg);
+}
+
+static void trans_INCDECP_r(DisasContext *s, arg_incdec_pred *a,
+                            uint32_t insn)
+{
+    TCGv_i64 reg = cpu_reg(s, a->rd);
+    TCGv_i64 val = tcg_temp_new_i64();
+
+    do_cntp(s, val, a->esz, a->pg, a->pg);
+    if (a->d) {
+        tcg_gen_sub_i64(reg, reg, val);
+    } else {
+        tcg_gen_add_i64(reg, reg, val);
+    }
+    tcg_temp_free_i64(val);
+}
+
+static void trans_INCDECP_z(DisasContext *s, arg_incdec2_pred *a,
+                            uint32_t insn)
+{
+    unsigned vsz = vec_full_reg_size(s);
+    TCGv_i64 val = tcg_temp_new_i64();
+    GVecGen2sFn *gvec_fn = a->d ? tcg_gen_gvec_subs : tcg_gen_gvec_adds;
+
+    if (a->esz == 0) {
+        unallocated_encoding(s);
+        return;
+    }
+    do_cntp(s, val, a->esz, a->pg, a->pg);
+    gvec_fn(a->esz, vec_full_reg_offset(s, a->rd),
+            vec_full_reg_offset(s, a->rn), val, vsz, vsz);
+}
+
+static void trans_SINCDECP_r_32(DisasContext *s, arg_incdec_pred *a,
+                                uint32_t insn)
+{
+    TCGv_i64 reg = cpu_reg(s, a->rd);
+    TCGv_i64 val = tcg_temp_new_i64();
+
+    do_cntp(s, val, a->esz, a->pg, a->pg);
+    do_sat_addsub_32(reg, val, a->u, a->d);
+}
+
+static void trans_SINCDECP_r_64(DisasContext *s, arg_incdec_pred *a,
+                                uint32_t insn)
+{
+    TCGv_i64 reg = cpu_reg(s, a->rd);
+    TCGv_i64 val = tcg_temp_new_i64();
+
+    do_cntp(s, val, a->esz, a->pg, a->pg);
+    do_sat_addsub_64(reg, val, a->u, a->d);
+}
+
+static void trans_SINCDECP_z(DisasContext *s, arg_incdec2_pred *a,
+                             uint32_t insn)
+{
+    TCGv_i64 val = tcg_temp_new_i64();
+
+    if (a->esz == 0) {
+        unallocated_encoding(s);
+        return;
+    }
+    do_cntp(s, val, a->esz, a->pg, a->pg);
+    do_sat_addsub_vec(s, a->esz, a->rd, a->rn, val, a->u, a->d);
+}
+
 /*
  *** SVE Memory - 32-bit Gather and Unsized Contiguous Group
  */
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 1c19129e55..76c084d43e 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -68,6 +68,8 @@
 &ptrue		rd esz pat s
 &incdec_cnt	rd pat esz imm d u
 &incdec2_cnt	rd rn pat esz imm d u
+&incdec_pred	rd pg esz d u
+&incdec2_pred	rd rn pg esz d u
 
 ###########################################################################
 # Named instruction formats.  These are generally used to
@@ -114,6 +116,7 @@
 
 # One register operand, with governing predicate, vector element size
 @rd_pg_rn	........ esz:2 ... ... ... pg:3 rn:5 rd:5	&rpr_esz
+@rd_pg4_pn	........ esz:2 ... ... .. pg:4 . rn:4 rd:5	&rpr_esz
 
 # Two register operands with a 6-bit signed immediate.
 @rd_rn_i6	........ ... rn:5 ..... imm:s6 rd:5		&rri
@@ -154,6 +157,12 @@
 @incdec2_cnt	........ esz:2 .. .... ...... pat:5 rd:5 \
 		&incdec2_cnt imm=%imm4_16_p1 rn=%reg_movprfx
 
+# One register, predicate.
+# User must fill in U and D.
+@incdec_pred	........ esz:2 .... .. ..... .. pg:4 rd:5	&incdec_pred
+@incdec2_pred	........ esz:2 .... .. ..... .. pg:4 rd:5 \
+		&incdec2_pred rn=%reg_movprfx
+
 ###########################################################################
 # Instruction patterns.  Grouped according to the SVE encodingindex.xhtml.
 
@@ -587,6 +596,24 @@ BRKB_m		00100101 1. 01000001 .... 0 .... 1 ....		@pd_pg_pn_s
 # SVE propagate break to next partition
 BRKN		00100101 0. 01100001 .... 0 .... 0 ....		@pd_pg_pn_s
 
+### SVE Predicate Count Group
+
+# SVE predicate count
+CNTP		00100101 .. 100 000 10 .... 0 .... .....	@rd_pg4_pn
+
+# SVE inc/dec register by predicate count
+INCDECP_r	00100101 .. 10110 d:1 10001 00 .... .....     @incdec_pred u=1
+
+# SVE inc/dec vector by predicate count
+INCDECP_z	00100101 .. 10110 d:1 10000 00 .... .....    @incdec2_pred u=1
+
+# SVE saturating inc/dec register by predicate count
+SINCDECP_r_32	00100101 .. 1010 d:1 u:1 10001 00 .... .....	@incdec_pred
+SINCDECP_r_64	00100101 .. 1010 d:1 u:1 10001 10 .... .....	@incdec_pred
+
+# SVE saturating inc/dec vector by predicate count
+SINCDECP_z	00100101 .. 1010 d:1 u:1 10000 00 .... .....	@incdec2_pred
+
 ### SVE Memory - 32-bit Gather and Unsized Contiguous Group
 
 # SVE load predicate register
-- 
2.14.3

