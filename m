Received: by 10.223.159.74 with SMTP id f10csp2997859wrg;
        Mon, 18 Dec 2017 10:51:48 -0800 (PST)
X-Google-Smtp-Source: ACJfBovHIn9usTXaq+cTxJ8BZsKkzCFrAFFI+rnXS/uXqqkIy8LkgLlw/1kP/JmwBUBvAG/QpcLY
X-Received: by 10.37.172.76 with SMTP id r12mr644722ybd.282.1513623108333;
        Mon, 18 Dec 2017 10:51:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513623108; cv=none;
        d=google.com; s=arc-20160816;
        b=V2GA+LiHW9QR6r+5Iux7k4BSQnZGu/PTQWC2rYmHDx/WQfKpEcNi2h6eUzdjUvw7KA
         psodpY8K8SNY/vzDa2G+TfH1rsPvOEsLcVy86b4Jb7My774SzKW1hDHTVT5YAPLOSX3i
         gzkTFrMU5heu84H7WPd063V2T9VDPPq/fANqtbSr2fh/UGrbAwrP2A6VJVW86XNJN1iA
         0rVuBevr+Ly+DplGZAdjUem26HJr3/U45+ZSItOrs01EQewfKuh4MtG+JVlhdSd1M/l9
         TTlx5lNdUI51/CRH3bRYqq+ylSUEHIRoFZBZmtMjLCUHAgn5IJAbttd1Z5A1YxZk+ARh
         Gevg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=ZcsLWJR9s9Z/s+Guhqhn6UX16Gk3jGYweos2BoYqHw0=;
        b=1GgeaIvdozPUJEFLvJg357WDFLU3oPM54Qd+0Web9E5rYzMdE3oT2c8EcJwggIF/hG
         plG7+It6uepWUhVkq74Egz5sPTB6Zttk4Ir07xh078IaQtkQmwuSxZjnP6CfoUwp7jsB
         ujp1wtf+vsFsHJVewtHpMpGSQRN80COI9kzuG9DkF3/2RGPmKD1APNgJ3zqLWUbh1wWt
         oYVfnBPFfMjT+zHcTFSJQ9+VjQ7pei2zISaZ4VYJSOMiUBcu0gkxolGsjNyxbxZ67t/B
         cgedEfdJkLzxEpvam2I4VMXAtNzr+omS/IcB9l2//Jgsdn6IGRFIec6g6gqwVl6EuSZw
         MJtw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BVnIZh9u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f5si2589253ywi.149.2017.12.18.10.51.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Dec 2017 10:51:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BVnIZh9u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53735 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eR0Vv-0001IA-Of
	for alex.bennee@linaro.org; Mon, 18 Dec 2017 13:51:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56127)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eQzUm-00004r-MP
	for qemu-arm@nongnu.org; Mon, 18 Dec 2017 12:46:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eQzUl-0002P1-Br
	for qemu-arm@nongnu.org; Mon, 18 Dec 2017 12:46:32 -0500
Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241]:35198)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1eQzUl-0002Nm-4B
	for qemu-arm@nongnu.org; Mon, 18 Dec 2017 12:46:31 -0500
Received: by mail-pg0-x241.google.com with SMTP id q20so9444822pgv.2
	for <qemu-arm@nongnu.org>; Mon, 18 Dec 2017 09:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ZcsLWJR9s9Z/s+Guhqhn6UX16Gk3jGYweos2BoYqHw0=;
	b=BVnIZh9uEK9fHJyR8NJySHlHo4MFGfJlzf7nR+Y78ASS9/Z5WbQOzuR8vL/7fTxs8I
	QfT1pgkaIqWeZOkl5AMjq87p8tDHlOLk7qSIZqYfHJsi31J09OeV8cBEBEEc4VKT10kV
	A5EureNlLIhYJMhQrOer0urk3q8yXu0DPVa6w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ZcsLWJR9s9Z/s+Guhqhn6UX16Gk3jGYweos2BoYqHw0=;
	b=kFwfupkEqlADmGNvuQiaeOpV/HBy+H9F1LRMqnQbw0TsHZL4Sue8sS5EhTqqFi21FJ
	PUM7ybI45GVKojyMZWRbUl7I2DwGPXx84ya+h0+5CICTO2mXhVFrXu1qfVswFznBZuk9
	r1r7ozBa0SFoTD1jPc3+QZLMRXtldhXPcpH2a+EY5eeQ3HlYDwEvUjaRn1ISZPaXsO/J
	Q5KqQkQUA3VF5xiC0ANS2IHO0YwwFcssuWhBxVAENVQERRUNv5VDMNSnF4o3qwmxwITe
	vZAsmZB2dyQTQkT4zg82WwBmseXv/412s2anJe33cIAdlmWssTEnu2rrRPlOEzuOt6ww
	fGSA==
X-Gm-Message-State: AKGB3mJe+XGKTFiI712Q3+XvSnfccto9T9sZoVHi5W+YA3Vylt0trXBy
	vpskNAJj4LTFXpoIdmZWUfD1NA==
X-Received: by 10.98.51.6 with SMTP id z6mr502052pfz.34.1513619190092;
	Mon, 18 Dec 2017 09:46:30 -0800 (PST)
Received: from cloudburst.twiddle.net (174-21-7-63.tukw.qwest.net.
	[174.21.7.63]) by smtp.gmail.com with ESMTPSA id
	t84sm26209657pfe.160.2017.12.18.09.46.28
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 18 Dec 2017 09:46:29 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 18 Dec 2017 09:45:52 -0800
Message-Id: <20171218174552.18871-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20171218174552.18871-1-richard.henderson@linaro.org>
References: <20171218174552.18871-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::241
Subject: [Qemu-arm] [PATCH 23/23] target/arm: Implement SVE Element Count
 Group, register destinations
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
X-TUID: 3P3vh/JzizZI

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 103 +++++++++++++++++++++++++++++++++++++++++++++
 target/arm/sve.def         |  18 ++++++++
 2 files changed, 121 insertions(+)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index a6c31e0e9c..91eb4e797a 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -61,6 +61,11 @@ static int tszimm_shl(int x)
     return x - tszimm_esz(x);
 }
 
+static inline int plus1(int x)
+{
+    return x + 1;
+}
+
 /*
  * Include the generated decoder.
  */
@@ -815,6 +820,104 @@ static unsigned decode_pred_count(unsigned fullsz, int pattern, int esz)
     }
 }
 
+void trans_CNT_r(DisasContext *s, arg_CNT_r *a, uint32_t insn)
+{
+    unsigned fullsz = vec_full_reg_size(s);
+    unsigned numelem = decode_pred_count(fullsz, a->pat, a->esz);
+
+    tcg_gen_movi_i64(cpu_reg(s, a->rd), numelem * a->imm);
+}
+
+void trans_INC_DEC_r(DisasContext *s, arg_incdec_cnt *a, uint32_t insn)
+{
+    unsigned fullsz = vec_full_reg_size(s);
+    unsigned numelem = decode_pred_count(fullsz, a->pat, a->esz);
+    int inc = numelem * a->imm * (a->d ? -1 : 1);
+    TCGv_i64 reg = cpu_reg(s, a->rd);
+
+    tcg_gen_addi_i64(reg, reg, inc);
+}
+
+void trans_sat_INC_DEC_r_32(DisasContext *s, arg_incdec_cnt *a, uint32_t insn)
+{
+    unsigned fullsz = vec_full_reg_size(s);
+    unsigned numelem = decode_pred_count(fullsz, a->pat, a->esz);
+    int inc = numelem * a->imm * (a->d ? -1 : 1);
+    int64_t ibound;
+    TCGv_i64 reg = cpu_reg(s, a->rd);
+    TCGv_i64 bound;
+    TCGCond cond;
+
+    /* Use normal 64-bit arithmetic to detect 32-bit overflow.  */
+    if (a->u) {
+        tcg_gen_ext32u_i64(reg, reg);
+    } else {
+        tcg_gen_ext32s_i64(reg, reg);
+    }
+    tcg_gen_addi_i64(reg, reg, inc);
+    if (a->d) {
+        if (a->u) {
+            ibound = 0;
+            cond = TCG_COND_LTU;
+        } else {
+            ibound = INT32_MIN;
+            cond = TCG_COND_LT;
+        }
+    } else {
+        if (a->u) {
+            ibound = UINT32_MAX;
+            cond = TCG_COND_GTU;
+        } else {
+            ibound = INT32_MAX;
+            cond = TCG_COND_GT;
+        }
+    }
+    bound = tcg_const_i64(ibound);
+    tcg_gen_movcond_i64(cond, reg, reg, bound, bound, reg);
+    tcg_temp_free_i64(bound);
+}
+
+void trans_sat_INC_DEC_r_64(DisasContext *s, arg_incdec_cnt *a, uint32_t insn)
+{
+    unsigned fullsz = vec_full_reg_size(s);
+    unsigned numelem = decode_pred_count(fullsz, a->pat, a->esz);
+    int inc = numelem * a->imm * (a->d ? -1 : 1);
+    TCGv_i64 reg = cpu_reg(s, a->rd);
+    TCGv_i64 t0 = tcg_temp_new_i64();
+    TCGv_i64 t1 = tcg_temp_new_i64();
+    TCGv_i64 zero;
+
+    if (a->u) {
+        tcg_gen_addi_i64(t0, reg, inc);
+
+        /* Bound the result.  */
+        if (a->d) {
+            tcg_gen_movi_i64(t1, 0);
+            tcg_gen_movcond_i64(TCG_COND_LTU, reg, t0, reg, t0, t1);
+        } else {
+            tcg_gen_movi_i64(t1, -1);
+            tcg_gen_movcond_i64(TCG_COND_LTU, reg, reg, t0, t0, t1);
+        }
+    } else {
+        /* Detect signed overflow for addition.  */
+        tcg_gen_xori_i64(t0, reg, inc);
+        tcg_gen_addi_i64(reg, reg, inc);
+        tcg_gen_xori_i64(t0, reg, inc);
+        tcg_gen_andc_i64(t0, t1, t0);
+
+        /* Because we know the increment, we know which way it overflowed.  */
+        tcg_gen_movi_i64(t1, a->d ? INT64_MIN : INT64_MAX);
+
+        /* Bound the result.  */
+        zero = tcg_const_i64(0);
+        tcg_gen_movcond_i64(TCG_COND_LT, reg, t0, zero, t1, reg);
+
+        tcg_temp_free_i64(zero);
+    }
+    tcg_temp_free_i64(t0);
+    tcg_temp_free_i64(t1);
+}
+
 /* For PTRUE, PTRUES, PFALSE, SETFFR.  */
 void trans_pred_set(DisasContext *s, arg_pred_set *a, uint32_t insn)
 {
diff --git a/target/arm/sve.def b/target/arm/sve.def
index df2730eb73..da533ba666 100644
--- a/target/arm/sve.def
+++ b/target/arm/sve.def
@@ -24,6 +24,7 @@
 
 %imm9_16_10		16:s6 10:3
 %imm6_22_5		22:1 5:5
+%imm4_16_p1             16:4 !function=plus1
 
 # A combination of tsz:imm3 -- extract esize.
 %tszimm_esz		22:2 5:5 !function=tszimm_esz
@@ -56,6 +57,7 @@
 &rprrr_esz		rd pg rn rm ra esz
 &rpri_esz		rd pg rn imm esz
 &pred_set		rd pat esz i s
+&incdec_cnt		rd pat esz imm d u
 
 ###########################################################################
 # Named instruction formats.  These are generally used to
@@ -101,6 +103,10 @@
 @pd_rn_i9		........ ........ ...... rn:5 . rd:4		&rri imm=%imm9_16_10
 @rd_rn_i9		........ ........ ...... rn:5 rd:5		&rri imm=%imm9_16_10
 
+# One register, pattern, and uint4+1.
+# User must fill in U and D.
+@incdec_cnt		........ esz:2 .. .... ...... pat:5 rd:5	&incdec_cnt imm=%imm4_16_p1
+
 ###########################################################################
 # Instruction patterns.  Grouped according to the SVE encodingindex.xhtml.
 
@@ -275,6 +281,18 @@ FEXPA			00000100 .. 1 00000 101110 ..... .....		@rd_rn_esz # Note size != 0
 # SVE floating-point trig select coefficient
 FTSSEL			00000100 .. 1 ..... 101100 ..... .....		@rd_rn_rm_esz # Note size != 0
 
+### SVE Element Count Group
+
+# SVE element count
+CNT_r			00000100 .. 10 .... 1110 0   0   ..... .....	@incdec_cnt d=0 u=1
+
+# SVE inc/dec register by element count
+INC_DEC_r		00000100 .. 11 .... 1110 0   d:1 ..... .....	@incdec_cnt u=1
+
+# SVE saturating inc/dec register by element count
+sat_INC_DEC_r_32	00000100 .. 10 .... 1111 d:1 u:1 ..... .....	@incdec_cnt
+sat_INC_DEC_r_64	00000100 .. 11 .... 1111 d:1 u:1 ..... .....	@incdec_cnt
+
 ### SVE Predicate Generation Group
 
 # SVE initialize predicate (PTRUE, PTRUES)
-- 
2.14.3

