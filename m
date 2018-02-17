Received: by 10.28.71.27 with SMTP id u27csp2105542wma;
        Sat, 17 Feb 2018 11:14:29 -0800 (PST)
X-Google-Smtp-Source: AH8x226EegMqoJHBsr5146Xe60OjYZQy95olHZn0AScIixNjw1/LdSvkYV/q316aeFfPzJz6CAch
X-Received: by 10.13.201.197 with SMTP id l188mr7652312ywd.132.1518894868944;
        Sat, 17 Feb 2018 11:14:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518894868; cv=none;
        d=google.com; s=arc-20160816;
        b=Sx+yFvoXYkfbx5XvwYH0S0VPv6g6pLj1y+Lydk5FF9Lh/wi9yWixX6hhtD3Ety6k7M
         bnVcaHDdUQLhtOh4mx0od8ysuqNd9MMBmj4P8NuXx8xSpbmiI2yRZ8cs4XYQOVMGPLjM
         b4ETR/kAblkKvy2tiqvYRv4+z90WhgrEHtYQTtratWFqsYUnb4voNUnvq/IJ2g6oqrRB
         gegcVJQyDLPAx8UqaiHYj39dHKQp72yAfWtlTmMJl11w5TGF0rte/QTHt+HC7MQq7Rb+
         5lPQipag6Hn42SJBpKQwA9M7jlizn88Ia3KirEk0eouFw5XXNvZ82/HO3i0Oikksn60m
         CL/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=zzawyRmfL2KGIFwz+BVgdCeNmKyizy+NZ2+wOIU6zVw=;
        b=rjuRpWTUNm/g57qVQGR0KTPsp87wc/xmJm2cmTeOpbUfPDrnBu11QreBPLIGKdPpFx
         07rQadV2pXeTNMym9VLKaWZaJMfURaqtZG6hwK2KxB+S+Hhbjub/7xLjN7w6syPBbuwx
         XWEf45TjU5C4rXPVwzi18Qa1g7LDmDf6jfiGwYAirJDmvx51gtcEKiGla6xZqlwquE8K
         C+mB3FtV3YI93R3bIdxKrvMGGRUKxthn9GgUcc/gVvAs/2FTEhdmm7qori4WjTjRJLbk
         g9EjKvXDJhFGQjTpYijBqw97vgkYqsol0qYBvDEMZA9l5HsYH3+qFDK1daLsmzqLfg69
         OnmA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ioy7bBnl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x83si3642562ybb.549.2018.02.17.11.14.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 17 Feb 2018 11:14:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ioy7bBnl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48554 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1en7wK-0001YO-9p
	for alex.bennee@linaro.org; Sat, 17 Feb 2018 14:14:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40761)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en7AI-0001VY-7u
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:24:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en7AG-00028p-P0
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:24:50 -0500
Received: from mail-pl0-x244.google.com ([2607:f8b0:400e:c01::244]:44556)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1en7AG-00028M-Fw
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:24:48 -0500
Received: by mail-pl0-x244.google.com with SMTP id w21so3427205plp.11
	for <qemu-arm@nongnu.org>; Sat, 17 Feb 2018 10:24:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=zzawyRmfL2KGIFwz+BVgdCeNmKyizy+NZ2+wOIU6zVw=;
	b=ioy7bBnl43iUet/aePnOz6XoxwlBK5M3a+tlgeYlQo7rbaCYNDvx3xKURxe/+Fzbk5
	Dl93j2rfX6xPDPlRUQ7egH+/PbhnoeRinFIxKEUDPej1r/Xn+NPm2WTK43knEqPsghO+
	wA3DNZFHnqNRy96mCycDXpx8SpoZ0Iq+FkG1A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=zzawyRmfL2KGIFwz+BVgdCeNmKyizy+NZ2+wOIU6zVw=;
	b=H14BFXvpkLgk1Ao6Qtoz56d2hiL7lsDchrEVr86nd+Q5nhOb4PYI7cayk3Ff9x5rlU
	RYSue1gBuVZBPAt3KGW1JFnBr2q1LiIVI0+CuqW4AQLd0D1MtfVSmjvp+ceif7UBvrNb
	hgbtDTWd9j5MMM3sa3+kCxZYQAJZoDNsuAIOigdB3xHjh/Wj5eHwXZ8pPrrFEEI6Jbcz
	02UzJpvfAptWpYreXu42SXegXFd69J7SJoKow5czNT47sGUrn3IULZX+q6EGoDzSlTS5
	LocPkoUxbawxPb76cjlc3bGYWcs3J3OrFK/J5mZoqVf9b/t6Um1uWaMfOWc/ShOMoHtL
	SO2g==
X-Gm-Message-State: APf1xPBEcNrLNxuYvxuaNlV0UCJcoyHQ+MXnwaJX+I5GN+p6D8F2SIrK
	knSblwEUyGy+htS8u7BkrL6Taw==
X-Received: by 2002:a17:902:8509:: with SMTP id
	bj9-v6mr9563834plb.386.1518891887554; 
	Sat, 17 Feb 2018 10:24:47 -0800 (PST)
Received: from cloudburst.twiddle.net ([50.0.192.64])
	by smtp.gmail.com with ESMTPSA id
	h15sm13466712pfi.56.2018.02.17.10.24.46
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 17 Feb 2018 10:24:46 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat, 17 Feb 2018 10:23:07 -0800
Message-Id: <20180217182323.25885-52-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180217182323.25885-1-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::244
Subject: [Qemu-arm] [PATCH v2 51/67] target/arm: Implement SVE load and
 broadcast element
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LeM6UVHQyMov

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    |  5 +++++
 target/arm/sve_helper.c    | 43 ++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 55 +++++++++++++++++++++++++++++++++++++++++++++-
 target/arm/sve.decode      |  5 +++++
 4 files changed, 107 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index c4502256d5..6c640a92ff 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -274,6 +274,11 @@ DEF_HELPER_FLAGS_3(sve_clr_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve_clr_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve_clr_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_3(sve_clri_b, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve_clri_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve_clri_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve_clri_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_4(sve_asr_zpzi_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve_asr_zpzi_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve_asr_zpzi_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 0e2b3091b0..a7dc6f6164 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -994,6 +994,49 @@ void HELPER(sve_clr_d)(void *vd, void *vg, uint32_t desc)
     }
 }
 
+/* Store zero into every inactive element of Zd.  */
+void HELPER(sve_clri_b)(void *vd, void *vg, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc) / 8;
+    uint64_t *d = vd;
+    uint8_t *pg = vg;
+    for (i = 0; i < opr_sz; i += 1) {
+        d[i] &= expand_pred_b(pg[H1(i)]);
+    }
+}
+
+void HELPER(sve_clri_h)(void *vd, void *vg, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc) / 8;
+    uint64_t *d = vd;
+    uint8_t *pg = vg;
+    for (i = 0; i < opr_sz; i += 1) {
+        d[i] &= expand_pred_h(pg[H1(i)]);
+    }
+}
+
+void HELPER(sve_clri_s)(void *vd, void *vg, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc) / 8;
+    uint64_t *d = vd;
+    uint8_t *pg = vg;
+    for (i = 0; i < opr_sz; i += 1) {
+        d[i] &= expand_pred_s(pg[H1(i)]);
+    }
+}
+
+void HELPER(sve_clri_d)(void *vd, void *vg, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc) / 8;
+    uint64_t *d = vd;
+    uint8_t *pg = vg;
+    for (i = 0; i < opr_sz; i += 1) {
+        if (!(pg[H1(i)] & 1)) {
+            d[i] = 0;
+        }
+    }
+}
+
 /* Three-operand expander, immediate operand, controlled by a predicate.
  */
 #define DO_ZPZI(NAME, TYPE, H, OP)                              \
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 32f0340738..b000a2482e 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -584,6 +584,19 @@ static void do_clr_zp(DisasContext *s, int rd, int pg, int esz)
                        vsz, vsz, 0, fns[esz]);
 }
 
+/* Store zero into every inactive element of Zd.  */
+static void do_clr_inactive_zp(DisasContext *s, int rd, int pg, int esz)
+{
+    static gen_helper_gvec_2 * const fns[4] = {
+        gen_helper_sve_clri_b, gen_helper_sve_clri_h,
+        gen_helper_sve_clri_s, gen_helper_sve_clri_d,
+    };
+    unsigned vsz = vec_full_reg_size(s);
+    tcg_gen_gvec_2_ool(vec_full_reg_offset(s, rd),
+                       pred_full_reg_offset(s, pg),
+                       vsz, vsz, 0, fns[esz]);
+}
+
 static void do_zpzi_ool(DisasContext *s, arg_rpri_esz *a,
                         gen_helper_gvec_3 *fn)
 {
@@ -3506,7 +3519,7 @@ static void trans_LDR_pri(DisasContext *s, arg_rri *a, uint32_t insn)
  *** SVE Memory - Contiguous Load Group
  */
 
-/* The memory element size of dtype.  */
+/* The memory mode of the dtype.  */
 static const TCGMemOp dtype_mop[16] = {
     MO_UB, MO_UB, MO_UB, MO_UB,
     MO_SL, MO_UW, MO_UW, MO_UW,
@@ -3671,6 +3684,46 @@ static void trans_LD1RQ_zpri(DisasContext *s, arg_rpri_load *a, uint32_t insn)
     do_ldrq(s, a->rd, a->pg, addr, dtype_msz(a->dtype));
 }
 
+/* Load and broadcast element.  */
+static void trans_LD1R_zpri(DisasContext *s, arg_rpri_load *a, uint32_t insn)
+{
+    unsigned vsz = vec_full_reg_size(s);
+    unsigned psz = pred_full_reg_size(s);
+    unsigned esz = dtype_esz[a->dtype];
+    TCGLabel *over = gen_new_label();
+    TCGv_i64 temp;
+
+    /* If the guarding predicate has no bits set, no load occurs.  */
+    if (psz <= 8) {
+        temp = tcg_temp_new_i64();
+        tcg_gen_ld_i64(temp, cpu_env, pred_full_reg_offset(s, a->pg));
+        tcg_gen_andi_i64(temp, temp,
+                         deposit64(0, 0, psz * 8, pred_esz_masks[esz]));
+        tcg_gen_brcondi_i64(TCG_COND_EQ, temp, 0, over);
+        tcg_temp_free_i64(temp);
+    } else {
+        TCGv_i32 t32 = tcg_temp_new_i32();
+        find_last_active(s, t32, esz, a->pg);
+        tcg_gen_brcondi_i32(TCG_COND_LT, t32, 0, over);
+        tcg_temp_free_i32(t32);
+    }
+
+    /* Load the data.  */
+    temp = tcg_temp_new_i64();
+    tcg_gen_addi_i64(temp, cpu_reg_sp(s, a->rn), a->imm);
+    tcg_gen_qemu_ld_i64(temp, temp, get_mem_index(s),
+                        s->be_data | dtype_mop[a->dtype]);
+
+    /* Broadcast to *all* elements.  */
+    tcg_gen_gvec_dup_i64(esz, vec_full_reg_offset(s, a->rd),
+                         vsz, vsz, temp);
+    tcg_temp_free_i64(temp);
+
+    /* Zero the inactive elements.  */
+    gen_set_label(over);
+    do_clr_inactive_zp(s, a->rd, a->pg, esz);
+}
+
 static void do_st_zpa(DisasContext *s, int zt, int pg, TCGv_i64 addr,
                       int msz, int esz, int nreg)
 {
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 95a290aed0..3e30985a09 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -29,6 +29,7 @@
 %imm9_16_10	16:s6 10:3
 %preg4_5	5:4
 %size_23	23:2
+%dtype_23_13	23:2 13:2
 
 # A combination of tsz:imm3 -- extract esize.
 %tszimm_esz	22:2 5:5 !function=tszimm_esz
@@ -758,6 +759,10 @@ LDR_pri		10000101 10 ...... 000 ... ..... 0 ....		@pd_rn_i9
 # SVE load vector register
 LDR_zri		10000101 10 ...... 010 ... ..... .....		@rd_rn_i9
 
+# SVE load and broadcast element
+LD1R_zpri	1000010 .. 1 imm:6 1.. pg:3 rn:5 rd:5 \
+		&rpri_load dtype=%dtype_23_13 nreg=0
+
 ### SVE Memory Contiguous Load Group
 
 # SVE contiguous load (scalar plus scalar)
-- 
2.14.3

