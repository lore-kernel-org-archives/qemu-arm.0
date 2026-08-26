Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5032C61DBD
	for <qemu-arm@archiver.kernel.org>; Wed, 26 Aug 2026 17:43:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wzHdy-00007C-1h; Wed, 26 Aug 2026 13:42:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wzHdv-000053-7J
 for qemu-arm@nongnu.org; Wed, 26 Aug 2026 13:42:31 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wzHds-0004nP-UD
 for qemu-arm@nongnu.org; Wed, 26 Aug 2026 13:42:30 -0400
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-84e04df8c46so1565683b3a.2
 for <qemu-arm@nongnu.org>; Wed, 26 Aug 2026 10:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787766147; x=1788370947; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=DWCIzduTnIm/W3WV2rk4cBKBAcF8NJBxjO9vrqzDujQ=;
 b=PlVDiviRVv6hn/17DgUF2GmVSgagdLRCF/X7i+h6Z0yQCOsDKd9LD/rAC2Z9t+8sHk
 nC14Jvf7cmRN87dewxuXsb95/ZFX+I6CeQVsSn3mDhNx20qErnObSx0yqpcO1/uEvaaZ
 kUzHCU0pHtu7VsX+u9zhwOpr2vyXzzszWkQMOgCxCmQUMiCMoQawOWHLTQwDXptHYwho
 nr7V/8neS7QCCAOJz+7/xrG4gmi3WZE2jsZnr2u0n5/z8CtJg7qxzxQ1iWY6s3Nsml/a
 d6n3jeuSGftJbs9ppiaQGqxNI2DrHvcPXL6rzE8iqBXbgR4e00weO0qbCWoyUyP7EOiN
 oHPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787766147; x=1788370947;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=DWCIzduTnIm/W3WV2rk4cBKBAcF8NJBxjO9vrqzDujQ=;
 b=VOM3unW9pgH0iHGZ+q5CR2s0Vto4ACTSRhcHT1kwWMp7phXX3HPEWJY8dzswTWzV7l
 kMQgbOyAXVjsv0YsLxqk5bXsAhFCAD52Pdok5rCOn7taGSTFUdNUNrX0NT7MWJii4an0
 +ZyxH0BX5bSD8tykW0vQWRh7WGOzRZJxo22LJUJWIvZir2C1j/bSOzqQjBXBqlmZNFZ/
 oM1E/YnxGkfm2P3ox+UQA6WXPHNxnQAoc7Z6y/OTgVdpmfEQXGi6LmwGiW/lFF5KhgX4
 1CrgEyaup+2i5W81UIvlcwxT+GeecVARYJVDLZAiUhNIESLvuju3QOGVJS9vFQUK8PfE
 DA1g==
X-Gm-Message-State: AFuF++niSnxx6068Z1CiVOaeVg2ELNXcOgdCeHHssVJEoR+zBeEODIDa
 TT4c7s6HZxKbq+Rw4Rxi6aFPFwGix31Vq0w8qmjLs9a1gqgoy4r2RC0OpfBhn6gkmDCnE8L7+pX
 ZRjlBEV8=
X-Gm-Gg: AR+sD13hWcghtMuL6DUW38FI4FHYd9UOKchY9Vg7rWLFwy4519BS9gyEoUSsAZE6xuB
 3/VfJCfWRWvWKWGvMmziG9pXVokJIbXFPndGVVcPGWD/MgaWHW+Q3ptqzjZImM4F0uo/hy87ql6
 KXPXBqWz6HFDsUnMXSM9ehcZWhitAVsU4bPGjQkMSi9f8/LQYAtxSHrDARAJoKkYVoP/T2EEiD2
 NaMRZsK/L2wRm7IRUpn3Y5+S2NDbxzDbMGksxZ2e0YPojVpsxf2MFhaX9d6l1Us9+jaB6g4NPyj
 y9tPhBLaZuUf9yacI0GPCFvmbwWPUWAVU9geqsVEoLg9I7MCXsAPxuGd4x4Hx/cceujaojiktP2
 hozdM6JVrcJlHZ4IvQ9oGJ3NECts9Udo2imPhumwiHN1D2ionCO8MmPMUog74GyOpnZ1hgOuT3m
 7QN//K129XbiwkQCnVgLomZscVnfv5UE80SQuEltQPOVAYwXriEqcOIAfVJRuhPpcol69IV2cjm
 AeEYJ6miylHZIlB6A==
X-Received: by 2002:a05:6a00:4149:b0:852:5f99:1866 with SMTP id
 d2e1a72fcca58-8536e922f5fmr17206220b3a.0.1787766147163; 
 Wed, 26 Aug 2026 10:42:27 -0700 (PDT)
Received: from stoup (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cc1bec66020sm1260072a12.21.2026.08.26.10.42.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2026 10:42:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 10/25] target/arm: Split decode of BFloat SVE FADD, FSUB,
 FMUL, FMIN*, FMAX*
Date: Wed, 26 Aug 2026 10:41:57 -0700
Message-ID: <20260826174213.614571-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260826174213.614571-1-richard.henderson@linaro.org>
References: <20260826174213.614571-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Split decode so that feature detection can be handled
external to gen_gvec_fpst_arg_zpzz

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-sve.c | 32 ++++++++++++++++++----------
 target/arm/tcg/sve.decode      | 38 +++++++++++++++++++++++++++-------
 2 files changed, 52 insertions(+), 18 deletions(-)

diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index f65c2b0af53..0ad0aff0504 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -412,10 +412,6 @@ static bool gen_gvec_fpst_zzzp(DisasContext *s, gen_helper_gvec_4_ptr *fn,
 static bool gen_gvec_fpst_arg_zpzz(DisasContext *s, gen_helper_gvec_4_ptr *fn,
                                    arg_rprr_esz *a)
 {
-    /* These insns use MO_8 to encode BFloat16. */
-    if (a->esz == MO_8 && !dc_isar_feature(aa64_sve_b16b16, s)) {
-        return false;
-    }
     return gen_gvec_fpst_zzzp(s, fn, a->rd, a->rn, a->rm, a->pg, 0,
                               a->esz == MO_16 ? FPST_A64_F16 : FPST_A64);
 }
@@ -4426,65 +4422,79 @@ TRANS_FEAT_NONSTREAMING(FTSMUL, aa64_sve, gen_gvec_fpst_arg_zzz,
  */
 
 static gen_helper_gvec_4_ptr * const sve_fadd_zpzz_fns[4] = {
-    gen_helper_sve_fadd_b16,
+    NULL,
     gen_helper_sve_fadd_h,
     gen_helper_sve_fadd_s,
     gen_helper_sve_fadd_d
 };
+TRANS_FEAT(BFADD_zpzz, aa64_sve_b16b16, gen_gvec_fpst_arg_zpzz,
+           gen_helper_sve_fadd_b16, a)
 TRANS_FEAT(FADD_zpzz, aa64_sme_or_sve, gen_gvec_fpst_arg_zpzz,
            sve_fadd_zpzz_fns[a->esz], a)
 
 static gen_helper_gvec_4_ptr * const sve_fsub_zpzz_fns[4] = {
-    gen_helper_sve_fsub_b16,
+    NULL,
     gen_helper_sve_fsub_h,
     gen_helper_sve_fsub_s,
     gen_helper_sve_fsub_d
 };
+TRANS_FEAT(BFSUB_zpzz, aa64_sve_b16b16, gen_gvec_fpst_arg_zpzz,
+           gen_helper_sve_fsub_b16, a)
 TRANS_FEAT(FSUB_zpzz, aa64_sme_or_sve, gen_gvec_fpst_arg_zpzz,
            sve_fsub_zpzz_fns[a->esz], a)
 
 static gen_helper_gvec_4_ptr * const sve_fmul_zpzz_fns[4] = {
-    gen_helper_sve_fmul_b16,
+    NULL,
     gen_helper_sve_fmul_h,
     gen_helper_sve_fmul_s,
     gen_helper_sve_fmul_d
 };
+TRANS_FEAT(BFMUL_zpzz, aa64_sve_b16b16, gen_gvec_fpst_arg_zpzz,
+           gen_helper_sve_fmul_b16, a)
 TRANS_FEAT(FMUL_zpzz, aa64_sme_or_sve, gen_gvec_fpst_arg_zpzz,
            sve_fmul_zpzz_fns[a->esz], a)
 
 static gen_helper_gvec_4_ptr * const sve_fmin_fns[4][2] = {
-    { gen_helper_sve_fmin_b16, gen_helper_sve_ah_fmin_b16 },
+    { NULL, NULL },
     { gen_helper_sve_fmin_h, gen_helper_sve_ah_fmin_h },
     { gen_helper_sve_fmin_s, gen_helper_sve_ah_fmin_s },
     { gen_helper_sve_fmin_d, gen_helper_sve_ah_fmin_d },
 };
+TRANS_FEAT(BFMIN_zpzz, aa64_sve_b16b16, gen_gvec_fpst_arg_zpzz,
+           s->fpcr_ah ? gen_helper_sve_ah_fmin_b16 : gen_helper_sve_fmin_b16, a)
 TRANS_FEAT(FMIN_zpzz, aa64_sme_or_sve, gen_gvec_fpst_arg_zpzz,
            sve_fmin_fns[a->esz][s->fpcr_ah], a)
 
 static gen_helper_gvec_4_ptr * const sve_fmax_fns[4][2] = {
-    { gen_helper_sve_fmax_b16, gen_helper_sve_ah_fmax_b16 },
+    { NULL, NULL },
     { gen_helper_sve_fmax_h, gen_helper_sve_ah_fmax_h },
     { gen_helper_sve_fmax_s, gen_helper_sve_ah_fmax_s },
     { gen_helper_sve_fmax_d, gen_helper_sve_ah_fmax_d },
 };
+TRANS_FEAT(BFMAX_zpzz, aa64_sve_b16b16, gen_gvec_fpst_arg_zpzz,
+           s->fpcr_ah ? gen_helper_sve_ah_fmax_b16 : gen_helper_sve_fmax_b16, a)
 TRANS_FEAT(FMAX_zpzz, aa64_sme_or_sve, gen_gvec_fpst_arg_zpzz,
            sve_fmax_fns[a->esz][s->fpcr_ah], a)
 
 static gen_helper_gvec_4_ptr * const sve_fmaxnum_fns[4] = {
-    gen_helper_sve_fmaxnum_b16,
+    NULL,
     gen_helper_sve_fmaxnum_h,
     gen_helper_sve_fmaxnum_s,
     gen_helper_sve_fmaxnum_d
 };
+TRANS_FEAT(BFMAXNM_zpzz, aa64_sve_b16b16, gen_gvec_fpst_arg_zpzz,
+           gen_helper_sve_fmaxnum_b16, a)
 TRANS_FEAT(FMAXNM_zpzz, aa64_sme_or_sve, gen_gvec_fpst_arg_zpzz,
            sve_fmaxnum_fns[a->esz], a)
 
 static gen_helper_gvec_4_ptr * const sve_fminnum_fns[4] = {
-    gen_helper_sve_fminnum_b16,
+    NULL,
     gen_helper_sve_fminnum_h,
     gen_helper_sve_fminnum_s,
     gen_helper_sve_fminnum_d
 };
+TRANS_FEAT(BFMINNM_zpzz, aa64_sve_b16b16, gen_gvec_fpst_arg_zpzz,
+           gen_helper_sve_fminnum_b16, a)
 TRANS_FEAT(FMINNM_zpzz, aa64_sme_or_sve, gen_gvec_fpst_arg_zpzz,
            sve_fminnum_fns[a->esz], a)
 
diff --git a/target/arm/tcg/sve.decode b/target/arm/tcg/sve.decode
index bdc2b7f0c04..07dac681acf 100644
--- a/target/arm/tcg/sve.decode
+++ b/target/arm/tcg/sve.decode
@@ -159,6 +159,9 @@
 @rd_pg4_rn_rm   ........ esz:2 . rm:5  .. pg:4  rn:5 rd:5       &rprr_esz
 @pd_pg_rn_rm    ........ esz:2 . rm:5 ... pg:3 rn:5 . rd:4      &rprr_esz
 
+@rdn_pg_rm_e0   ........ .. ... ... ... pg:3 rm:5 rd:5 \
+                &rprr_esz esz=0 rn=%reg_movprfx
+
 # Three register operand, with governing predicate, vector element size
 @rda_pg_rn_rm   ........ esz:2 . rm:5  ... pg:3 rn:5 rd:5 \
                 &rprrr_esz ra=%reg_movprfx
@@ -1163,14 +1166,35 @@ FRSQRTS         01100101 .. 0 ..... 000 111 ..... .....         @rd_rn_rm
 ### SVE FP Arithmetic Predicated Group
 
 # SVE floating-point arithmetic (predicated)
-FADD_zpzz       01100101 .. 00 0000 100 ... ..... .....    @rdn_pg_rm
-FSUB_zpzz       01100101 .. 00 0001 100 ... ..... .....    @rdn_pg_rm
-FMUL_zpzz       01100101 .. 00 0010 100 ... ..... .....    @rdn_pg_rm
+{
+  BFADD_zpzz    01100101 00 00 0000 100 ... ..... .....    @rdn_pg_rm_e0
+  FADD_zpzz     01100101 .. 00 0000 100 ... ..... .....    @rdn_pg_rm
+}
+{
+  BFSUB_zpzz    01100101 00 00 0001 100 ... ..... .....    @rdn_pg_rm_e0
+  FSUB_zpzz     01100101 .. 00 0001 100 ... ..... .....    @rdn_pg_rm
+}
+{
+  BFMUL_zpzz    01100101 00 00 0010 100 ... ..... .....    @rdn_pg_rm_e0
+  FMUL_zpzz     01100101 .. 00 0010 100 ... ..... .....    @rdn_pg_rm
+}
 FSUB_zpzz       01100101 .. 00 0011 100 ... ..... .....    @rdm_pg_rn # FSUBR
-FMAXNM_zpzz     01100101 .. 00 0100 100 ... ..... .....    @rdn_pg_rm
-FMINNM_zpzz     01100101 .. 00 0101 100 ... ..... .....    @rdn_pg_rm
-FMAX_zpzz       01100101 .. 00 0110 100 ... ..... .....    @rdn_pg_rm
-FMIN_zpzz       01100101 .. 00 0111 100 ... ..... .....    @rdn_pg_rm
+{
+  BFMAXNM_zpzz  01100101 00 00 0100 100 ... ..... .....    @rdn_pg_rm_e0
+  FMAXNM_zpzz   01100101 .. 00 0100 100 ... ..... .....    @rdn_pg_rm
+}
+{
+  BFMINNM_zpzz  01100101 00 00 0101 100 ... ..... .....    @rdn_pg_rm_e0
+  FMINNM_zpzz   01100101 .. 00 0101 100 ... ..... .....    @rdn_pg_rm
+}
+{
+  BFMAX_zpzz    01100101 00 00 0110 100 ... ..... .....    @rdn_pg_rm_e0
+  FMAX_zpzz     01100101 .. 00 0110 100 ... ..... .....    @rdn_pg_rm
+}
+{
+  BFMIN_zpzz    01100101 00 00 0111 100 ... ..... .....    @rdn_pg_rm_e0
+  FMIN_zpzz     01100101 .. 00 0111 100 ... ..... .....    @rdn_pg_rm
+}
 FABD            01100101 .. 00 1000 100 ... ..... .....    @rdn_pg_rm
 FSCALE          01100101 .. 00 1001 100 ... ..... .....    @rdn_pg_rm
 FMULX           01100101 .. 00 1010 100 ... ..... .....    @rdn_pg_rm
-- 
2.53.0


