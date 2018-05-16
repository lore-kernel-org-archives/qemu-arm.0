Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp206831wme;
        Wed, 16 May 2018 15:38:54 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZruDQssHKXWb/kKx2W5je/6J/WKnQDY93+LG4iqfKfQCv1DdDtw/CXzK7kyRxQ4oKn+fizc
X-Received: by 2002:a0c:e8cc:: with SMTP id m12-v6mr2933698qvo.52.1526510334489;
        Wed, 16 May 2018 15:38:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526510334; cv=none;
        d=google.com; s=arc-20160816;
        b=M/LRT+pq/RE1wps7C+Nd9sFU1QPQtGBZVcNbOK8A7ezS1Jh+nEM5J83NWFsBccjGqk
         9dP97fhPdMfJ7biYVbmDqxfeIpgC5cSmKNVuLeNMBW2XbXKwbOK+0w2AfI0CJ24a+ZIF
         rTQvaoiLx3wcr/2Uc4coxi1Xesyq/4dhTcEdGeWDoRnEmuZoZ+1v4z5d0u5F4Jv7PX6y
         hS44xDEYR9MlblHjmm4N0nvmF+MUCs/7nQ4NCZuRPHtc1uPOO8YbsFY8eUTyfnj8XbX/
         SMeNL97yNmzmL/iFn4z5c/VGcTf4MUGfrL8v7BYCbrV1+xroCV+YQsddI9eutOGI0f1/
         Gaig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=uOjj/7uF2ODA0nDNk1uedyW754Dt3SijjcaKFE2CybU=;
        b=Mrj59nKmFk+QzJoE3P0ikAZH/sTLzkcRjTCDdUy56LhXR37MV4uLFy8f+PBcB8PNlv
         FksY/g38DJuVYTRu/ZXStf+rDeMUNQTAsFoEhkBK0OyPXuGEUWUbb3gWhv/4Fn+nTEyP
         qV+BoIUAHMrZVf+dWhY4E8g8CpDr1u/rcghA7ruVQhbX+QiRxGjNV1MyutHq1hHF/OEJ
         uFDR9It8XxHwylMuW5+b0SjjaE0gAZfoMsDbUFL6+LX0WwhEMoWq53LAxgty9e8DfB44
         QuvTS4Ce0gitUg/Ttdg7HWy3i0P7Y1Zw5i792gv6g4tzY0ZB9MLEsLY5W3PXuUof6Glx
         yR+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=J6OqBAtc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r11-v6si3628064qkk.248.2018.05.16.15.38.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 16 May 2018 15:38:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=J6OqBAtc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44817 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fJ54P-0005GE-U3
	for alex.bennee@linaro.org; Wed, 16 May 2018 18:38:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41322)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fJ4wQ-0007pm-NH
	for qemu-devel@nongnu.org; Wed, 16 May 2018 18:30:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fJ4wP-0007b7-4l
	for qemu-devel@nongnu.org; Wed, 16 May 2018 18:30:38 -0400
Received: from mail-pl0-x22d.google.com ([2607:f8b0:400e:c01::22d]:43856)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fJ4wO-0007Zy-Jm
	for qemu-devel@nongnu.org; Wed, 16 May 2018 18:30:36 -0400
Received: by mail-pl0-x22d.google.com with SMTP id c41-v6so1240279plj.10
	for <qemu-devel@nongnu.org>; Wed, 16 May 2018 15:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=uOjj/7uF2ODA0nDNk1uedyW754Dt3SijjcaKFE2CybU=;
	b=J6OqBAtcDgIFodUlfP5Dau6bHYlM0OjpUKaWg2QVEkR/zh35Yy+zKesIVu/WCouxiI
	qlb66hu4Na997AjMfzfBuAL0H9vzwKSaq7PJvy2cPBIwp0F7m1GOpHmneLh8QM0PE1b/
	Atd1EfQmWntfiawHME4tc00epse3ZO6eJtolk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=uOjj/7uF2ODA0nDNk1uedyW754Dt3SijjcaKFE2CybU=;
	b=WLoeghAxWvNY2fgWpP/42rhTcMiFQuUeb4qSp70p3CLqEIqM3Jts4UNx+pN01XrsXA
	WnQcKbseBqSMWK6jE6SlhieljsKNZqJvJ10rU0Z/LDeBAKRZAUHRkYZi5t+fKpgbrS2O
	uwBiBgNiMSbv5ZojukSGUlJMysNJa4Coar+QMoyzqSXeGLBinUdsmcQODdkc0sK4shRS
	IrpyGaIh8CsyZQt8KBrRT9LRPVXWVE6fDrj17pilS5ocTZc9lcTSUzCetyF1SOUSmD9o
	tBM/jTfhoXI24jeknkojXDXvu65ThQO3DxKg2T3jZ/Y6dujMX7HIE520ENSIk/UnP0fb
	IzDw==
X-Gm-Message-State: ALKqPwe+vj1CYXRJQcuRIyQiqYStzs5ZFiuZYFEw/miwNLs7URYgfWeH
	55jTcAGIsddt3RMXtf7hHZMcWzBKoqc=
X-Received: by 2002:a17:902:4203:: with SMTP id
	g3-v6mr2760210pld.315.1526509835286; 
	Wed, 16 May 2018 15:30:35 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net.
	[97.113.2.170]) by smtp.gmail.com with ESMTPSA id
	j1-v6sm6640418pfc.159.2018.05.16.15.30.34
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 16 May 2018 15:30:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 16 May 2018 15:29:58 -0700
Message-Id: <20180516223007.10256-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180516223007.10256-1-richard.henderson@linaro.org>
References: <20180516223007.10256-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::22d
Subject: [Qemu-devel] [PATCH v3-a 18/27] target/arm: Implement SVE Bitwise
 Shift - Unpredicated Group
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
X-TUID: lfB5Bw+7c2bR

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    | 12 ++++++
 target/arm/sve_helper.c    | 30 ++++++++++++++
 target/arm/translate-sve.c | 85 ++++++++++++++++++++++++++++++++++++++
 target/arm/sve.decode      | 26 ++++++++++++
 4 files changed, 153 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 2a2dbe98dd..00e3cd48bb 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -368,6 +368,18 @@ DEF_HELPER_FLAGS_4(sve_index_h, TCG_CALL_NO_RWG, void, ptr, i32, i32, i32)
 DEF_HELPER_FLAGS_4(sve_index_s, TCG_CALL_NO_RWG, void, ptr, i32, i32, i32)
 DEF_HELPER_FLAGS_4(sve_index_d, TCG_CALL_NO_RWG, void, ptr, i64, i64, i32)
 
+DEF_HELPER_FLAGS_4(sve_asr_zzw_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_asr_zzw_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_asr_zzw_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve_lsr_zzw_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_lsr_zzw_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_lsr_zzw_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve_lsl_zzw_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_lsl_zzw_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_lsl_zzw_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_5(sve_and_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_bic_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_eor_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 385bb8b314..f43640c1eb 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -615,6 +615,36 @@ DO_ZPZ(sve_neg_h, uint16_t, H1_2, DO_NEG)
 DO_ZPZ(sve_neg_s, uint32_t, H1_4, DO_NEG)
 DO_ZPZ_D(sve_neg_d, uint64_t, DO_NEG)
 
+/* Three-operand expander, unpredicated, in which the third operand is "wide".
+ */
+#define DO_ZZW(NAME, TYPE, TYPEW, H, OP)                       \
+void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc) \
+{                                                              \
+    intptr_t i, opr_sz = simd_oprsz(desc);                     \
+    for (i = 0; i < opr_sz; ) {                                \
+        TYPEW mm = *(TYPEW *)(vm + i);                         \
+        do {                                                   \
+            TYPE nn = *(TYPE *)(vn + H(i));                    \
+            *(TYPE *)(vd + H(i)) = OP(nn, mm);                 \
+            i += sizeof(TYPE);                                 \
+        } while (i & 7);                                       \
+    }                                                          \
+}
+
+DO_ZZW(sve_asr_zzw_b, int8_t, uint64_t, H1, DO_ASR)
+DO_ZZW(sve_lsr_zzw_b, uint8_t, uint64_t, H1, DO_LSR)
+DO_ZZW(sve_lsl_zzw_b, uint8_t, uint64_t, H1, DO_LSL)
+
+DO_ZZW(sve_asr_zzw_h, int16_t, uint64_t, H1_2, DO_ASR)
+DO_ZZW(sve_lsr_zzw_h, uint16_t, uint64_t, H1_2, DO_LSR)
+DO_ZZW(sve_lsl_zzw_h, uint16_t, uint64_t, H1_2, DO_LSL)
+
+DO_ZZW(sve_asr_zzw_s, int32_t, uint64_t, H1_4, DO_ASR)
+DO_ZZW(sve_lsr_zzw_s, uint32_t, uint64_t, H1_4, DO_LSR)
+DO_ZZW(sve_lsl_zzw_s, uint32_t, uint64_t, H1_4, DO_LSL)
+
+#undef DO_ZZW
+
 #undef DO_CLS_B
 #undef DO_CLS_H
 #undef DO_CLZ_B
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index f95efa3c72..2c2218bc31 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -134,6 +134,13 @@ static bool do_mov_z(DisasContext *s, int rd, int rn)
     return do_vector2_z(s, tcg_gen_gvec_mov, 0, rd, rn);
 }
 
+/* Initialize a Zreg with replications of a 64-bit immediate.  */
+static void do_dupi_z(DisasContext *s, int rd, uint64_t word)
+{
+    unsigned vsz = vec_full_reg_size(s);
+    tcg_gen_gvec_dup64i(vec_full_reg_offset(s, rd), vsz, vsz, word);
+}
+
 /* Invoke a vector expander on two Pregs.  */
 static bool do_vector2_p(DisasContext *s, GVecGen2Fn *gvec_fn,
                          int esz, int rd, int rn)
@@ -668,6 +675,84 @@ DO_ZPZW(LSL, lsl)
 
 #undef DO_ZPZW
 
+/*
+ *** SVE Bitwise Shift - Unpredicated Group
+ */
+
+static bool do_shift_imm(DisasContext *s, arg_rri_esz *a, bool asr,
+                         void (*gvec_fn)(unsigned, uint32_t, uint32_t,
+                                         int64_t, uint32_t, uint32_t))
+{
+    if (a->esz < 0) {
+        /* Invalid tsz encoding -- see tszimm_esz. */
+        return false;
+    }
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        /* Shift by element size is architecturally valid.  For
+           arithmetic right-shift, it's the same as by one less.
+           Otherwise it is a zeroing operation.  */
+        if (a->imm >= 8 << a->esz) {
+            if (asr) {
+                a->imm = (8 << a->esz) - 1;
+            } else {
+                do_dupi_z(s, a->rd, 0);
+                return true;
+            }
+        }
+        gvec_fn(a->esz, vec_full_reg_offset(s, a->rd),
+                vec_full_reg_offset(s, a->rn), a->imm, vsz, vsz);
+    }
+    return true;
+}
+
+static bool trans_ASR_zzi(DisasContext *s, arg_rri_esz *a, uint32_t insn)
+{
+    return do_shift_imm(s, a, true, tcg_gen_gvec_sari);
+}
+
+static bool trans_LSR_zzi(DisasContext *s, arg_rri_esz *a, uint32_t insn)
+{
+    return do_shift_imm(s, a, false, tcg_gen_gvec_shri);
+}
+
+static bool trans_LSL_zzi(DisasContext *s, arg_rri_esz *a, uint32_t insn)
+{
+    return do_shift_imm(s, a, false, tcg_gen_gvec_shli);
+}
+
+static bool do_zzw_ool(DisasContext *s, arg_rrr_esz *a, gen_helper_gvec_3 *fn)
+{
+    if (fn == NULL) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        tcg_gen_gvec_3_ool(vec_full_reg_offset(s, a->rd),
+                           vec_full_reg_offset(s, a->rn),
+                           vec_full_reg_offset(s, a->rm),
+                           vsz, vsz, 0, fn);
+    }
+    return true;
+}
+
+#define DO_ZZW(NAME, name) \
+static bool trans_##NAME##_zzw(DisasContext *s, arg_rrr_esz *a,           \
+                               uint32_t insn)                             \
+{                                                                         \
+    static gen_helper_gvec_3 * const fns[4] = {                           \
+        gen_helper_sve_##name##_zzw_b, gen_helper_sve_##name##_zzw_h,     \
+        gen_helper_sve_##name##_zzw_s, NULL                               \
+    };                                                                    \
+    return do_zzw_ool(s, a, fns[a->esz]);                                 \
+}
+
+DO_ZZW(ASR, asr)
+DO_ZZW(LSR, lsr)
+DO_ZZW(LSL, lsl)
+
+#undef DO_ZZW
+
 /*
  *** SVE Integer Multiply-Add Group
  */
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 9d5c061165..b24f6b2f1b 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -32,6 +32,11 @@
 # A combination of tsz:imm3 -- extract (tsz:imm3) - esize
 %tszimm_shl     22:2 5:5 !function=tszimm_shl
 
+# Similarly for the tszh/tszl pair at 22/16 for zzi
+%tszimm16_esz   22:2 16:5 !function=tszimm_esz
+%tszimm16_shr   22:2 16:5 !function=tszimm_shr
+%tszimm16_shl   22:2 16:5 !function=tszimm_shl
+
 # Either a copy of rd (at bit 0), or a different source
 # as propagated via the MOVPRFX instruction.
 %reg_movprfx    0:5
@@ -43,6 +48,7 @@
 
 &rr_esz         rd rn esz
 &rri            rd rn imm
+&rri_esz        rd rn imm esz
 &rrr_esz        rd rn rm esz
 &rpr_esz        rd pg rn esz
 &rprr_s         rd pg rn rm s
@@ -92,6 +98,10 @@
 @rdn_pg_tszimm  ........ .. ... ... ... pg:3 ..... rd:5 \
                 &rpri_esz rn=%reg_movprfx esz=%tszimm_esz
 
+# Similarly without predicate.
+@rd_rn_tszimm   ........ .. ... ... ...... rn:5 rd:5 \
+                &rri_esz esz=%tszimm16_esz
+
 # Basic Load/Store with 9-bit immediate offset
 @pd_rn_i9       ........ ........ ...... rn:5 . rd:4    \
                 &rri imm=%imm9_16_10
@@ -250,6 +260,22 @@ ADDPL           00000100 011 ..... 01010 ...... .....           @rd_rn_i6
 # SVE stack frame size
 RDVL            00000100 101 11111 01010 imm:s6 rd:5
 
+### SVE Bitwise Shift - Unpredicated Group
+
+# SVE bitwise shift by immediate (unpredicated)
+ASR_zzi         00000100 .. 1 ..... 1001 00 ..... ..... \
+                @rd_rn_tszimm imm=%tszimm16_shr
+LSR_zzi         00000100 .. 1 ..... 1001 01 ..... ..... \
+                @rd_rn_tszimm imm=%tszimm16_shr
+LSL_zzi         00000100 .. 1 ..... 1001 11 ..... ..... \
+                @rd_rn_tszimm imm=%tszimm16_shl
+
+# SVE bitwise shift by wide elements (unpredicated)
+# Note esz != 3
+ASR_zzw         00000100 .. 1 ..... 1000 00 ..... .....         @rd_rn_rm
+LSR_zzw         00000100 .. 1 ..... 1000 01 ..... .....         @rd_rn_rm
+LSL_zzw         00000100 .. 1 ..... 1000 11 ..... .....         @rd_rn_rm
+
 ### SVE Predicate Logical Operations Group
 
 # SVE predicate logical operations
-- 
2.17.0

