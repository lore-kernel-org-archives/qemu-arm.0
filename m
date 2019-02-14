Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp506286wrp;
        Wed, 13 Feb 2019 19:58:04 -0800 (PST)
X-Google-Smtp-Source: AHgI3Ia0iCj+CaPH4dXAuOetZhZsmftFGXQaCbY7gYZkwTDK3upyCiejQ+i+iUARU0jz1T5K4Rxk
X-Received: by 2002:a0d:c182:: with SMTP id c124mr1341675ywd.190.1550116684515;
        Wed, 13 Feb 2019 19:58:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550116684; cv=none;
        d=google.com; s=arc-20160816;
        b=h9IJ5Grh83Pvs9q4oENLarYdnB/OtApxoxAGoOzPBr7D7KFeASVVyud0nEflLlr3uU
         zjJmxDAGV5LxNceTtlTs2ljpOvN6kRZDhK+alSQnG89azbNaxeSo46/8h6lRjYRxrg/8
         NGYkiItheuoO2/AEdyZ0HZBcw/ehePomo0DLTNUwnlasFoqQwwMWZHsjzJzIMWhslZrE
         wzrgYKG9X11Oi07JPz3KRb+AtfbXt0pQ01rzZ+rfngpP1mEt6f5qJtk4lLCSQEQnzQ13
         cw3YcZvrgJzQNq6NHAQXHUwyBeLwQQoM11ZFs9oaLwYDh48AsiZxmUmTNQ+RraWWTMRP
         eUng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=+3uqZJoPHf7H0MV6qZLBPTy2QZidE62Ds6I3+3j8avw=;
        b=QfpPfxrLkbbnqrpVaiZFgRlK1hNoBI5Da3D+j0oK+Bl5YjO7VoJNVA+A7u92Ti9V4z
         cRzd24nYyhwdB7fVSAb9yG9GdXdISA9BYjD3hgQ8xSUrOGHi8we6ZYEgqX5dijk9p45W
         08ysl70M9jMdAv9YRhfE0Fze0uzacmnvrWE0nv3Fbi7t2T3nmUTMlu9xSUakOwR7Once
         sKojNalVcujQJuE5EK0KTB320F7udqrpTWY6JnrqIKGPMAkk/LJPIVtgV2ruF/p3zYF4
         B/SqCME0FW8U3tAw8V2cbE8+TpB6frIl+FZpHWksDIpbdmG0HbZRkZrLHxdzpIVg/gB0
         XyNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ApmbJmSv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c124si764043ywf.270.2019.02.13.19.58.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Feb 2019 19:58:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ApmbJmSv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:39411 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gu8A0-00077Z-05
	for alex.bennee@linaro.org; Wed, 13 Feb 2019 22:58:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60197)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gu89c-0006hU-36
	for qemu-arm@nongnu.org; Wed, 13 Feb 2019 22:57:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gu7wL-00077R-KW
	for qemu-arm@nongnu.org; Wed, 13 Feb 2019 22:44:00 -0500
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:42003)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gu7wL-00071N-9c
	for qemu-arm@nongnu.org; Wed, 13 Feb 2019 22:43:57 -0500
Received: by mail-pf1-x443.google.com with SMTP id n74so2333302pfi.9
	for <qemu-arm@nongnu.org>; Wed, 13 Feb 2019 19:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=+3uqZJoPHf7H0MV6qZLBPTy2QZidE62Ds6I3+3j8avw=;
	b=ApmbJmSvB8VSJDL5eDTlE8zZT7BoNNLMEsDwRhJFjr3eKePGIbrymDIGAXR+wDsYQp
	Kcx4zakuvQxGuhx6U5dwOkvnshH5f5vRdvTHmP0+RjUakhDgZGTc21MwjyrubISlZkkL
	eowkEfdF8TfVCU1BvXRgXWpZplhbzltfiI+ZnoXQ4vJokPrKj/gtk8wjiuDkUUe2OcRX
	/S/ZnIo+5J8zabDuKh/5obnB3j2yozEl0/99An5MKBkm76ZSyd6Ex8SQ/okHbtXCM1y8
	8oXorhE6nIv45jWFumfDZviADbf6t3WZXaEPd9/roYkZvd54VYAp0FcSjCi5VEGMtfjX
	2G3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=+3uqZJoPHf7H0MV6qZLBPTy2QZidE62Ds6I3+3j8avw=;
	b=odDJ2QJo6uyUHlAzOnfHOXbPIBwl1p6pyVueB6r2upvpGsnbCk1LZ/rP8mFU501yXW
	6eG0ZL15AWQKoxbSVT1xcBmGjkkVaq+OyXen/j+SA/MBDhyyfba8axRbnoUdt19XOhJz
	5hltBVRL5lKzmrbcpS+rlszHHpKs/bF3XBrZqmtWNk3MNHABkEiAT5piLNKyaJhPVBIV
	53Pgf0s3bkyFUt4m7kox3DKTjLOu/xnlWYa0fu5Z8YYvaHzdjLTLTEW/MhmvheRn4BuI
	vGoh5aTekTm/vuy2oz9QZIn8kKVpLdVBGVRVkvRZdx8jUy6p61h7sTyAVrZVJkmG3C43
	edBg==
X-Gm-Message-State: AHQUAuYtEcy0cuH/TB2slEV9nyLc/Wp9Zy8FcMUUkPQn6QFhtdjHDK1Y
	6ZbLfPXiOxi4a1WTvdD0RYO4/g==
X-Received: by 2002:a63:5761:: with SMTP id h33mr1672927pgm.283.1550115831660; 
	Wed, 13 Feb 2019 19:43:51 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82])
	by smtp.gmail.com with ESMTPSA id o2sm972713pgq.90.2019.02.13.19.43.50
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 13 Feb 2019 19:43:50 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 13 Feb 2019 19:43:44 -0800
Message-Id: <20190214034345.24722-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190214034345.24722-1-richard.henderson@linaro.org>
References: <20190214034345.24722-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::443
Subject: [Qemu-arm] [PATCH 3/4] target/arm: Implement VFMAL and VFMSL for
 aarch32
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
X-TUID: pAMsxM2W4282

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h       |   5 ++
 target/arm/translate.c | 104 +++++++++++++++++++++++++++++------------
 2 files changed, 80 insertions(+), 29 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 15085a94ff..84d24044fe 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3232,6 +3232,11 @@ static inline bool isar_feature_aa32_dp(const ARMISARegisters *id)
     return FIELD_EX32(id->id_isar6, ID_ISAR6, DP) != 0;
 }
 
+static inline bool isar_feature_aa32_fhm(const ARMISARegisters *id)
+{
+    return FIELD_EX32(id->id_isar6, ID_ISAR6, FHM) != 0;
+}
+
 static inline bool isar_feature_aa32_fp16_arith(const ARMISARegisters *id)
 {
     /*
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 66cf28c8cb..0ed4768080 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8236,15 +8236,8 @@ static int disas_neon_insn_3same_ext(DisasContext *s, uint32_t insn)
     gen_helper_gvec_3_ptr *fn_gvec_ptr = NULL;
     int rd, rn, rm, opr_sz;
     int data = 0;
-    bool q;
-
-    q = extract32(insn, 6, 1);
-    VFP_DREG_D(rd, insn);
-    VFP_DREG_N(rn, insn);
-    VFP_DREG_M(rm, insn);
-    if ((rd | rn | rm) & q) {
-        return 1;
-    }
+    int off_rn, off_rm;
+    bool is_long = false, q = extract32(insn, 6, 1);
 
     if ((insn & 0xfe200f10) == 0xfc200800) {
         /* VCMLA -- 1111 110R R.1S .... .... 1000 ...0 .... */
@@ -8271,10 +8264,38 @@ static int disas_neon_insn_3same_ext(DisasContext *s, uint32_t insn)
             return 1;
         }
         fn_gvec = u ? gen_helper_gvec_udot_b : gen_helper_gvec_sdot_b;
+    } else if ((insn & 0xff300f10) == 0xfc200810) {
+        /* VFM[AS]L -- 1111 1100 S.10 .... .... 1000 .Q.1 .... */
+        int sub = extract32(insn, 23, 1);
+        if (!dc_isar_feature(aa32_fhm, s)) {
+            return 1;
+        }
+        is_long = true;
+        fn_gvec_ptr = sub ? gen_helper_gvec_fmlsl_h : gen_helper_gvec_fmlal_h;
+        data = 0; /* is_2 == 0 */
     } else {
         return 1;
     }
 
+    VFP_DREG_D(rd, insn);
+    if (rd & q) {
+        return 1;
+    }
+    if (q || !is_long) {
+        VFP_DREG_N(rn, insn);
+        VFP_DREG_M(rm, insn);
+        if ((rn | rm) & q & !is_long) {
+            return 1;
+        }
+        off_rn = vfp_reg_offset(1, rn);
+        off_rm = vfp_reg_offset(1, rm);
+    } else {
+        rn = VFP_SREG_N(insn);
+        rm = VFP_SREG_M(insn);
+        off_rn = vfp_reg_offset(0, rn);
+        off_rm = vfp_reg_offset(0, rm);
+    }
+
     if (s->fp_excp_el) {
         gen_exception_insn(s, 4, EXCP_UDEF,
                            syn_simd_access_trap(1, 0xe, false), s->fp_excp_el);
@@ -8287,15 +8308,11 @@ static int disas_neon_insn_3same_ext(DisasContext *s, uint32_t insn)
     opr_sz = (1 + q) * 8;
     if (fn_gvec_ptr) {
         TCGv_ptr fpst = get_fpstatus_ptr(1);
-        tcg_gen_gvec_3_ptr(vfp_reg_offset(1, rd),
-                           vfp_reg_offset(1, rn),
-                           vfp_reg_offset(1, rm), fpst,
+        tcg_gen_gvec_3_ptr(vfp_reg_offset(1, rd), off_rn, off_rm, fpst,
                            opr_sz, opr_sz, data, fn_gvec_ptr);
         tcg_temp_free_ptr(fpst);
     } else {
-        tcg_gen_gvec_3_ool(vfp_reg_offset(1, rd),
-                           vfp_reg_offset(1, rn),
-                           vfp_reg_offset(1, rm),
+        tcg_gen_gvec_3_ool(vfp_reg_offset(1, rd), off_rn, off_rm,
                            opr_sz, opr_sz, data, fn_gvec);
     }
     return 0;
@@ -8314,14 +8331,8 @@ static int disas_neon_insn_2reg_scalar_ext(DisasContext *s, uint32_t insn)
     gen_helper_gvec_3 *fn_gvec = NULL;
     gen_helper_gvec_3_ptr *fn_gvec_ptr = NULL;
     int rd, rn, rm, opr_sz, data;
-    bool q;
-
-    q = extract32(insn, 6, 1);
-    VFP_DREG_D(rd, insn);
-    VFP_DREG_N(rn, insn);
-    if ((rd | rn) & q) {
-        return 1;
-    }
+    int off_rn, off_rm;
+    bool is_long = false, q = extract32(insn, 6, 1);
 
     if ((insn & 0xff000f10) == 0xfe000800) {
         /* VCMLA (indexed) -- 1111 1110 S.RR .... .... 1000 ...0 .... */
@@ -8350,6 +8361,7 @@ static int disas_neon_insn_2reg_scalar_ext(DisasContext *s, uint32_t insn)
     } else if ((insn & 0xffb00f00) == 0xfe200d00) {
         /* V[US]DOT -- 1111 1110 0.10 .... .... 1101 .Q.U .... */
         int u = extract32(insn, 4, 1);
+
         if (!dc_isar_feature(aa32_dp, s)) {
             return 1;
         }
@@ -8357,10 +8369,48 @@ static int disas_neon_insn_2reg_scalar_ext(DisasContext *s, uint32_t insn)
         /* rm is just Vm, and index is M.  */
         data = extract32(insn, 5, 1); /* index */
         rm = extract32(insn, 0, 4);
+    } else if ((insn & 0xffa00f10) == 0xfe000810) {
+        /* VFM[AS]L -- 1111 1110 0.0S .... .... 1000 .Q.1 .... */
+        int sub = extract32(insn, 20, 1);
+        int vm20 = extract32(insn, 0, 3);
+        int vm3 = extract32(insn, 3, 1);
+        int m = extract32(insn, 5, 1);
+        int index;
+
+        if (!dc_isar_feature(aa32_fhm, s)) {
+            return 1;
+        }
+        if (q) {
+            rm = vm20;
+            index = m * 2 + vm3;
+        } else {
+            rm = vm20 * 2 + m;
+            index = vm3;
+        }
+        is_long = true;
+        data = index << 1; /* is_2 == 0 */
+        fn_gvec_ptr = (sub ? gen_helper_gvec_fmlsl_idx_h
+                       : gen_helper_gvec_fmlal_idx_h);
     } else {
         return 1;
     }
 
+    VFP_DREG_D(rd, insn);
+    if (rd & q) {
+        return 1;
+    }
+    if (q || !is_long) {
+        VFP_DREG_N(rn, insn);
+        if (rn & q & !is_long) {
+            return 1;
+        }
+        off_rn = vfp_reg_offset(1, rn);
+        off_rm = vfp_reg_offset(1, rm);
+    } else {
+        rn = VFP_SREG_N(insn);
+        off_rn = vfp_reg_offset(0, rn);
+        off_rm = vfp_reg_offset(0, rm);
+    }
     if (s->fp_excp_el) {
         gen_exception_insn(s, 4, EXCP_UDEF,
                            syn_simd_access_trap(1, 0xe, false), s->fp_excp_el);
@@ -8373,15 +8423,11 @@ static int disas_neon_insn_2reg_scalar_ext(DisasContext *s, uint32_t insn)
     opr_sz = (1 + q) * 8;
     if (fn_gvec_ptr) {
         TCGv_ptr fpst = get_fpstatus_ptr(1);
-        tcg_gen_gvec_3_ptr(vfp_reg_offset(1, rd),
-                           vfp_reg_offset(1, rn),
-                           vfp_reg_offset(1, rm), fpst,
+        tcg_gen_gvec_3_ptr(vfp_reg_offset(1, rd), off_rn, off_rm, fpst,
                            opr_sz, opr_sz, data, fn_gvec_ptr);
         tcg_temp_free_ptr(fpst);
     } else {
-        tcg_gen_gvec_3_ool(vfp_reg_offset(1, rd),
-                           vfp_reg_offset(1, rn),
-                           vfp_reg_offset(1, rm),
+        tcg_gen_gvec_3_ool(vfp_reg_offset(1, rd), off_rn, off_rm,
                            opr_sz, opr_sz, data, fn_gvec);
     }
     return 0;
-- 
2.17.2

