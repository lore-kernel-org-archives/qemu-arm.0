Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp487527lfg;
        Fri, 30 Apr 2021 13:57:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyUw9bKVq03xtjmgS3VxGlUxg4m/bTk5HrLRugpUqVp3asSTgHvFkiRjv68V7tEPdcwBpD3
X-Received: by 2002:a05:6638:3494:: with SMTP id t20mr6820126jal.114.1619816249080;
        Fri, 30 Apr 2021 13:57:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619816249; cv=none;
        d=google.com; s=arc-20160816;
        b=QvxBj/3g/0xjXwYJLNaurErptSlphGEzUlpiYXN0fT6mf1ykcMVDQSSKXuyxRIfav+
         Do81oAmsQGiDADqOP4+bE4CjarK0ht6Vli7uGPgzfpEl24W0ueqvnpa0XK4t+nCf6K0c
         QZf4Qu1llw+7ziSU71JQCpwT7+ewzhILPgG8mGj8dyLkYnRJvdS5sI3yAJKWwEVkY3I/
         Y8d9/ms8RYlr6g2HbtcM+A9y+J75bmOpPwgFpSwpbqDg1E9pQJ4xHgRNZyRlphq+a+Ft
         nTzvqLb7azu+muAxoXaPZc6BCMrudTaWid0jxbCCSsszovmZNZ7QcpcutJPDMiides8b
         PIag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=bCBGp2GdHMYoIw7eJTRwaDF9qwXNx38EngT3N/EUqtQ=;
        b=FViNH3MgcmCrWLTZPBRGigKpiOluXad5hkP9clvIyryNOjOXXjcNRFWv8yImUTlfQ5
         +kSJTqaagngxixKVA12kNC7K48/sp06CB7DOYxavOTo0AYltRF9CNqMxr+SlpzY4CPFs
         rylU7CkWYjw6YlFTM6em8l3RqHdeldXXSjxm7TCTeV4JnJ8atFV2AlzCjpmso/t3pAT7
         iGjQY6TzVy4NWtVQmUuNjosxt0/jmj88mmdc2+2Qy/obvv9w2yo/i9zFs/SnLfLcQC3A
         6iadn8Ky3KcYzd9l57eW/bvM7AdG8XoeU7TOcjIARaiKjbv4zQ2/vh0aeoEC02BJ7tW3
         jIZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SLqF3fGJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u4si3180878jad.126.2021.04.30.13.57.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Apr 2021 13:57:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SLqF3fGJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lcaCW-0005At-88
	for alex.bennee@linaro.org; Fri, 30 Apr 2021 16:57:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZmE-0004Ht-9L
 for qemu-arm@nongnu.org; Fri, 30 Apr 2021 16:30:18 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:42749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZlm-0007hv-2z
 for qemu-arm@nongnu.org; Fri, 30 Apr 2021 16:30:17 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 j6-20020a17090adc86b02900cbfe6f2c96so2382701pjv.1
 for <qemu-arm@nongnu.org>; Fri, 30 Apr 2021 13:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bCBGp2GdHMYoIw7eJTRwaDF9qwXNx38EngT3N/EUqtQ=;
 b=SLqF3fGJre/N/BUKO90ay3R92mbdIUxHm2zlnTc9h+ssNMZbGkWmRGH7uOy71vY1C4
 vgkZst77SQgBixiIX+eM+PVQ6/y8kv2FlaV4sn/PW1CDcHtK3dlXiwMbBCe+oX+IblH+
 jDoD+TWkOGyazPTncI+vZdY/sgStJmVQPEAHA0zjFcSvDHnJNpVRjclzb3F8uOafJmih
 2twM57F0r0qjNtzwT3O2II7w57dND2mB/YLhps8xVrJlzl705GveslKfc+jpyAoLgW8x
 hiNVwa5/p7rWKs1g0qJF9apnVVpgXnEhomKuO4InHkPBix9n2/FkKolCHIH0h7gt17TA
 5CSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bCBGp2GdHMYoIw7eJTRwaDF9qwXNx38EngT3N/EUqtQ=;
 b=b/b20bJ6S2Qt4qBuIgUlowU69ktI9b+jtpjifxuoOqtt9FiMbL3O3fW2Wukw2R3d0Y
 93rwAWCUIWUrtFNRiGQ6VUsS/HIOjGc2d0so6qM7uQsB+j4YK38eHj4mlZ8CkqG3pHPj
 yrHrTh7izHM+g3/YiZD4UGDgKptkmuHPZzr6r7U9pOWK6hYhK+p0+pSm1hpuPIVjug9I
 oJ+uKviKgseFBeLMf7R5OMY6SPto8W+GTgTRaoexRIlbvM/l/D7bEqS+2ArZknAlT4IU
 pUArlTYnyk42krm2aKSZqvKP51da1qXNPsOcqTZu2oF4tgt+eZNa56atS77EcjdZfwrb
 v9mA==
X-Gm-Message-State: AOAM5332picJkHhAUiLyVXUSpj88MDBbsfk55rdwDEc7E+AajmWlo6iN
 KsiQDm/lmCGcKYt8JORMRV8aHg==
X-Received: by 2002:a17:90a:af95:: with SMTP id
 w21mr16717053pjq.178.1619814581298; 
 Fri, 30 Apr 2021 13:29:41 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id q23sm3788781pgt.42.2021.04.30.13.29.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 13:29:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 48/82] target/arm: Pass separate addend to {U, S}DOT helpers
Date: Fri, 30 Apr 2021 13:25:36 -0700
Message-Id: <20210430202610.1136687-49-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430202610.1136687-1-richard.henderson@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AXUWGHJhGpS5

For SVE, we potentially have a 4th argument coming from the
movprfx instruction.  Currently we do not optimize movprfx,
so the problem is not visible.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v4: Fix double addition (zhiwei).
---
 target/arm/helper.h         |  20 +++---
 target/arm/sve.decode       |   7 ++-
 target/arm/translate-a64.c  |  15 ++++-
 target/arm/translate-neon.c |  10 +--
 target/arm/translate-sve.c  |  13 ++--
 target/arm/vec_helper.c     | 120 ++++++++++++++++++++----------------
 6 files changed, 109 insertions(+), 76 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 23a7ec5638..f4b092ee1c 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -608,15 +608,19 @@ DEF_HELPER_FLAGS_5(sve2_sqrdmlah_d, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_5(sve2_sqrdmlsh_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 
-DEF_HELPER_FLAGS_4(gvec_sdot_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
-DEF_HELPER_FLAGS_4(gvec_udot_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
-DEF_HELPER_FLAGS_4(gvec_sdot_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
-DEF_HELPER_FLAGS_4(gvec_udot_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_sdot_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_udot_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_sdot_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_udot_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 
-DEF_HELPER_FLAGS_4(gvec_sdot_idx_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
-DEF_HELPER_FLAGS_4(gvec_udot_idx_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
-DEF_HELPER_FLAGS_4(gvec_sdot_idx_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
-DEF_HELPER_FLAGS_4(gvec_udot_idx_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_sdot_idx_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_udot_idx_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_sdot_idx_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_udot_idx_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_5(gvec_fcaddh, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 67b6466a1e..04ef38f148 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -756,12 +756,13 @@ UMIN_zzi        00100101 .. 101 011 110 ........ .....          @rdn_i8u
 MUL_zzi         00100101 .. 110 000 110 ........ .....          @rdn_i8s
 
 # SVE integer dot product (unpredicated)
-DOT_zzz         01000100 1 sz:1 0 rm:5 00000 u:1 rn:5 rd:5      ra=%reg_movprfx
+DOT_zzzz        01000100 1 sz:1 0 rm:5 00000 u:1 rn:5 rd:5 \
+                ra=%reg_movprfx
 
 # SVE integer dot product (indexed)
-DOT_zzx         01000100 101 index:2 rm:3 00000 u:1 rn:5 rd:5 \
+DOT_zzxw        01000100 101 index:2 rm:3 00000 u:1 rn:5 rd:5 \
                 sz=0 ra=%reg_movprfx
-DOT_zzx         01000100 111 index:1 rm:4 00000 u:1 rn:5 rd:5 \
+DOT_zzxw        01000100 111 index:1 rm:4 00000 u:1 rn:5 rd:5 \
                 sz=1 ra=%reg_movprfx
 
 # SVE floating-point complex add (predicated)
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index bdd47208b1..61c5fa9656 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -683,6 +683,17 @@ static void gen_gvec_op3_qc(DisasContext *s, bool is_q, int rd, int rn,
     tcg_temp_free_ptr(qc_ptr);
 }
 
+/* Expand a 4-operand operation using an out-of-line helper.  */
+static void gen_gvec_op4_ool(DisasContext *s, bool is_q, int rd, int rn,
+                             int rm, int ra, int data, gen_helper_gvec_4 *fn)
+{
+    tcg_gen_gvec_4_ool(vec_full_reg_offset(s, rd),
+                       vec_full_reg_offset(s, rn),
+                       vec_full_reg_offset(s, rm),
+                       vec_full_reg_offset(s, ra),
+                       is_q ? 16 : 8, vec_full_reg_size(s), data, fn);
+}
+
 /* Set ZF and NF based on a 64 bit result. This is alas fiddlier
  * than the 32 bit equivalent.
  */
@@ -12183,7 +12194,7 @@ static void disas_simd_three_reg_same_extra(DisasContext *s, uint32_t insn)
         return;
 
     case 0x2: /* SDOT / UDOT */
-        gen_gvec_op3_ool(s, is_q, rd, rn, rm, 0,
+        gen_gvec_op4_ool(s, is_q, rd, rn, rm, rd, 0,
                          u ? gen_helper_gvec_udot_b : gen_helper_gvec_sdot_b);
         return;
 
@@ -13442,7 +13453,7 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
     switch (16 * u + opcode) {
     case 0x0e: /* SDOT */
     case 0x1e: /* UDOT */
-        gen_gvec_op3_ool(s, is_q, rd, rn, rm, index,
+        gen_gvec_op4_ool(s, is_q, rd, rn, rm, rd, index,
                          u ? gen_helper_gvec_udot_idx_b
                          : gen_helper_gvec_sdot_idx_b);
         return;
diff --git a/target/arm/translate-neon.c b/target/arm/translate-neon.c
index 658bd275da..fa67605fdc 100644
--- a/target/arm/translate-neon.c
+++ b/target/arm/translate-neon.c
@@ -230,7 +230,7 @@ static bool trans_VCADD(DisasContext *s, arg_VCADD *a)
 static bool trans_VDOT(DisasContext *s, arg_VDOT *a)
 {
     int opr_sz;
-    gen_helper_gvec_3 *fn_gvec;
+    gen_helper_gvec_4 *fn_gvec;
 
     if (!dc_isar_feature(aa32_dp, s)) {
         return false;
@@ -252,9 +252,10 @@ static bool trans_VDOT(DisasContext *s, arg_VDOT *a)
 
     opr_sz = (1 + a->q) * 8;
     fn_gvec = a->u ? gen_helper_gvec_udot_b : gen_helper_gvec_sdot_b;
-    tcg_gen_gvec_3_ool(vfp_reg_offset(1, a->vd),
+    tcg_gen_gvec_4_ool(vfp_reg_offset(1, a->vd),
                        vfp_reg_offset(1, a->vn),
                        vfp_reg_offset(1, a->vm),
+                       vfp_reg_offset(1, a->vd),
                        opr_sz, opr_sz, 0, fn_gvec);
     return true;
 }
@@ -332,7 +333,7 @@ static bool trans_VCMLA_scalar(DisasContext *s, arg_VCMLA_scalar *a)
 
 static bool trans_VDOT_scalar(DisasContext *s, arg_VDOT_scalar *a)
 {
-    gen_helper_gvec_3 *fn_gvec;
+    gen_helper_gvec_4 *fn_gvec;
     int opr_sz;
     TCGv_ptr fpst;
 
@@ -357,9 +358,10 @@ static bool trans_VDOT_scalar(DisasContext *s, arg_VDOT_scalar *a)
     fn_gvec = a->u ? gen_helper_gvec_udot_idx_b : gen_helper_gvec_sdot_idx_b;
     opr_sz = (1 + a->q) * 8;
     fpst = fpstatus_ptr(FPST_STD);
-    tcg_gen_gvec_3_ool(vfp_reg_offset(1, a->vd),
+    tcg_gen_gvec_4_ool(vfp_reg_offset(1, a->vd),
                        vfp_reg_offset(1, a->vn),
                        vfp_reg_offset(1, a->rm),
+                       vfp_reg_offset(1, a->vd),
                        opr_sz, opr_sz, a->index, fn_gvec);
     tcg_temp_free_ptr(fpst);
     return true;
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 3de14e3af9..fab5d1c077 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3800,28 +3800,29 @@ DO_ZZI(UMIN, umin)
 
 #undef DO_ZZI
 
-static bool trans_DOT_zzz(DisasContext *s, arg_DOT_zzz *a)
+static bool trans_DOT_zzzz(DisasContext *s, arg_DOT_zzzz *a)
 {
-    static gen_helper_gvec_3 * const fns[2][2] = {
+    static gen_helper_gvec_4 * const fns[2][2] = {
         { gen_helper_gvec_sdot_b, gen_helper_gvec_sdot_h },
         { gen_helper_gvec_udot_b, gen_helper_gvec_udot_h }
     };
 
     if (sve_access_check(s)) {
-        gen_gvec_ool_zzz(s, fns[a->u][a->sz], a->rd, a->rn, a->rm, 0);
+        gen_gvec_ool_zzzz(s, fns[a->u][a->sz], a->rd, a->rn, a->rm, a->ra, 0);
     }
     return true;
 }
 
-static bool trans_DOT_zzx(DisasContext *s, arg_DOT_zzx *a)
+static bool trans_DOT_zzxw(DisasContext *s, arg_DOT_zzxw *a)
 {
-    static gen_helper_gvec_3 * const fns[2][2] = {
+    static gen_helper_gvec_4 * const fns[2][2] = {
         { gen_helper_gvec_sdot_idx_b, gen_helper_gvec_sdot_idx_h },
         { gen_helper_gvec_udot_idx_b, gen_helper_gvec_udot_idx_h }
     };
 
     if (sve_access_check(s)) {
-        gen_gvec_ool_zzz(s, fns[a->u][a->sz], a->rd, a->rn, a->rm, a->index);
+        gen_gvec_ool_zzzz(s, fns[a->u][a->sz], a->rd, a->rn, a->rm,
+                          a->ra, a->index);
     }
     return true;
 }
diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index a3d80ecad0..f88e572132 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -375,71 +375,76 @@ void HELPER(sve2_sqrdmlsh_d)(void *vd, void *vn, void *vm,
  * All elements are treated equally, no matter where they are.
  */
 
-void HELPER(gvec_sdot_b)(void *vd, void *vn, void *vm, uint32_t desc)
+void HELPER(gvec_sdot_b)(void *vd, void *vn, void *vm, void *va, uint32_t desc)
 {
     intptr_t i, opr_sz = simd_oprsz(desc);
-    uint32_t *d = vd;
+    int32_t *d = vd, *a = va;
     int8_t *n = vn, *m = vm;
 
     for (i = 0; i < opr_sz / 4; ++i) {
-        d[i] += n[i * 4 + 0] * m[i * 4 + 0]
-              + n[i * 4 + 1] * m[i * 4 + 1]
-              + n[i * 4 + 2] * m[i * 4 + 2]
-              + n[i * 4 + 3] * m[i * 4 + 3];
+        d[i] = (a[i] +
+                n[i * 4 + 0] * m[i * 4 + 0] +
+                n[i * 4 + 1] * m[i * 4 + 1] +
+                n[i * 4 + 2] * m[i * 4 + 2] +
+                n[i * 4 + 3] * m[i * 4 + 3]);
     }
     clear_tail(d, opr_sz, simd_maxsz(desc));
 }
 
-void HELPER(gvec_udot_b)(void *vd, void *vn, void *vm, uint32_t desc)
+void HELPER(gvec_udot_b)(void *vd, void *vn, void *vm, void *va, uint32_t desc)
 {
     intptr_t i, opr_sz = simd_oprsz(desc);
-    uint32_t *d = vd;
+    uint32_t *d = vd, *a = va;
     uint8_t *n = vn, *m = vm;
 
     for (i = 0; i < opr_sz / 4; ++i) {
-        d[i] += n[i * 4 + 0] * m[i * 4 + 0]
-              + n[i * 4 + 1] * m[i * 4 + 1]
-              + n[i * 4 + 2] * m[i * 4 + 2]
-              + n[i * 4 + 3] * m[i * 4 + 3];
+        d[i] = (a[i] +
+                n[i * 4 + 0] * m[i * 4 + 0] +
+                n[i * 4 + 1] * m[i * 4 + 1] +
+                n[i * 4 + 2] * m[i * 4 + 2] +
+                n[i * 4 + 3] * m[i * 4 + 3]);
     }
     clear_tail(d, opr_sz, simd_maxsz(desc));
 }
 
-void HELPER(gvec_sdot_h)(void *vd, void *vn, void *vm, uint32_t desc)
+void HELPER(gvec_sdot_h)(void *vd, void *vn, void *vm, void *va, uint32_t desc)
 {
     intptr_t i, opr_sz = simd_oprsz(desc);
-    uint64_t *d = vd;
+    int64_t *d = vd, *a = va;
     int16_t *n = vn, *m = vm;
 
     for (i = 0; i < opr_sz / 8; ++i) {
-        d[i] += (int64_t)n[i * 4 + 0] * m[i * 4 + 0]
-              + (int64_t)n[i * 4 + 1] * m[i * 4 + 1]
-              + (int64_t)n[i * 4 + 2] * m[i * 4 + 2]
-              + (int64_t)n[i * 4 + 3] * m[i * 4 + 3];
+        d[i] = (a[i] +
+                (int64_t)n[i * 4 + 0] * m[i * 4 + 0] +
+                (int64_t)n[i * 4 + 1] * m[i * 4 + 1] +
+                (int64_t)n[i * 4 + 2] * m[i * 4 + 2] +
+                (int64_t)n[i * 4 + 3] * m[i * 4 + 3]);
     }
     clear_tail(d, opr_sz, simd_maxsz(desc));
 }
 
-void HELPER(gvec_udot_h)(void *vd, void *vn, void *vm, uint32_t desc)
+void HELPER(gvec_udot_h)(void *vd, void *vn, void *vm, void *va, uint32_t desc)
 {
     intptr_t i, opr_sz = simd_oprsz(desc);
-    uint64_t *d = vd;
+    uint64_t *d = vd, *a = va;
     uint16_t *n = vn, *m = vm;
 
     for (i = 0; i < opr_sz / 8; ++i) {
-        d[i] += (uint64_t)n[i * 4 + 0] * m[i * 4 + 0]
-              + (uint64_t)n[i * 4 + 1] * m[i * 4 + 1]
-              + (uint64_t)n[i * 4 + 2] * m[i * 4 + 2]
-              + (uint64_t)n[i * 4 + 3] * m[i * 4 + 3];
+        d[i] = (a[i] +
+                (uint64_t)n[i * 4 + 0] * m[i * 4 + 0] +
+                (uint64_t)n[i * 4 + 1] * m[i * 4 + 1] +
+                (uint64_t)n[i * 4 + 2] * m[i * 4 + 2] +
+                (uint64_t)n[i * 4 + 3] * m[i * 4 + 3]);
     }
     clear_tail(d, opr_sz, simd_maxsz(desc));
 }
 
-void HELPER(gvec_sdot_idx_b)(void *vd, void *vn, void *vm, uint32_t desc)
+void HELPER(gvec_sdot_idx_b)(void *vd, void *vn, void *vm,
+                             void *va, uint32_t desc)
 {
     intptr_t i, segend, opr_sz = simd_oprsz(desc), opr_sz_4 = opr_sz / 4;
     intptr_t index = simd_data(desc);
-    uint32_t *d = vd;
+    int32_t *d = vd, *a = va;
     int8_t *n = vn;
     int8_t *m_indexed = (int8_t *)vm + H4(index) * 4;
 
@@ -455,10 +460,11 @@ void HELPER(gvec_sdot_idx_b)(void *vd, void *vn, void *vm, uint32_t desc)
         int8_t m3 = m_indexed[i * 4 + 3];
 
         do {
-            d[i] += n[i * 4 + 0] * m0
-                  + n[i * 4 + 1] * m1
-                  + n[i * 4 + 2] * m2
-                  + n[i * 4 + 3] * m3;
+            d[i] = (a[i] +
+                    n[i * 4 + 0] * m0 +
+                    n[i * 4 + 1] * m1 +
+                    n[i * 4 + 2] * m2 +
+                    n[i * 4 + 3] * m3);
         } while (++i < segend);
         segend = i + 4;
     } while (i < opr_sz_4);
@@ -466,11 +472,12 @@ void HELPER(gvec_sdot_idx_b)(void *vd, void *vn, void *vm, uint32_t desc)
     clear_tail(d, opr_sz, simd_maxsz(desc));
 }
 
-void HELPER(gvec_udot_idx_b)(void *vd, void *vn, void *vm, uint32_t desc)
+void HELPER(gvec_udot_idx_b)(void *vd, void *vn, void *vm,
+                             void *va, uint32_t desc)
 {
     intptr_t i, segend, opr_sz = simd_oprsz(desc), opr_sz_4 = opr_sz / 4;
     intptr_t index = simd_data(desc);
-    uint32_t *d = vd;
+    uint32_t *d = vd, *a = va;
     uint8_t *n = vn;
     uint8_t *m_indexed = (uint8_t *)vm + H4(index) * 4;
 
@@ -486,10 +493,11 @@ void HELPER(gvec_udot_idx_b)(void *vd, void *vn, void *vm, uint32_t desc)
         uint8_t m3 = m_indexed[i * 4 + 3];
 
         do {
-            d[i] += n[i * 4 + 0] * m0
-                  + n[i * 4 + 1] * m1
-                  + n[i * 4 + 2] * m2
-                  + n[i * 4 + 3] * m3;
+            d[i] = (a[i] +
+                    n[i * 4 + 0] * m0 +
+                    n[i * 4 + 1] * m1 +
+                    n[i * 4 + 2] * m2 +
+                    n[i * 4 + 3] * m3);
         } while (++i < segend);
         segend = i + 4;
     } while (i < opr_sz_4);
@@ -497,11 +505,12 @@ void HELPER(gvec_udot_idx_b)(void *vd, void *vn, void *vm, uint32_t desc)
     clear_tail(d, opr_sz, simd_maxsz(desc));
 }
 
-void HELPER(gvec_sdot_idx_h)(void *vd, void *vn, void *vm, uint32_t desc)
+void HELPER(gvec_sdot_idx_h)(void *vd, void *vn, void *vm,
+                             void *va, uint32_t desc)
 {
     intptr_t i, opr_sz = simd_oprsz(desc), opr_sz_8 = opr_sz / 8;
     intptr_t index = simd_data(desc);
-    uint64_t *d = vd;
+    int64_t *d = vd, *a = va;
     int16_t *n = vn;
     int16_t *m_indexed = (int16_t *)vm + index * 4;
 
@@ -509,30 +518,33 @@ void HELPER(gvec_sdot_idx_h)(void *vd, void *vn, void *vm, uint32_t desc)
      * Process the entire segment all at once, writing back the results
      * only after we've consumed all of the inputs.
      */
-    for (i = 0; i < opr_sz_8 ; i += 2) {
-        uint64_t d0, d1;
+    for (i = 0; i < opr_sz_8; i += 2) {
+        int64_t d0, d1;
 
-        d0  = n[i * 4 + 0] * (int64_t)m_indexed[i * 4 + 0];
+        d0  = a[i + 0];
+        d0 += n[i * 4 + 0] * (int64_t)m_indexed[i * 4 + 0];
         d0 += n[i * 4 + 1] * (int64_t)m_indexed[i * 4 + 1];
         d0 += n[i * 4 + 2] * (int64_t)m_indexed[i * 4 + 2];
         d0 += n[i * 4 + 3] * (int64_t)m_indexed[i * 4 + 3];
-        d1  = n[i * 4 + 4] * (int64_t)m_indexed[i * 4 + 0];
+
+        d1  = a[i + 1];
+        d1 += n[i * 4 + 4] * (int64_t)m_indexed[i * 4 + 0];
         d1 += n[i * 4 + 5] * (int64_t)m_indexed[i * 4 + 1];
         d1 += n[i * 4 + 6] * (int64_t)m_indexed[i * 4 + 2];
         d1 += n[i * 4 + 7] * (int64_t)m_indexed[i * 4 + 3];
 
-        d[i + 0] += d0;
-        d[i + 1] += d1;
+        d[i + 0] = d0;
+        d[i + 1] = d1;
     }
-
     clear_tail(d, opr_sz, simd_maxsz(desc));
 }
 
-void HELPER(gvec_udot_idx_h)(void *vd, void *vn, void *vm, uint32_t desc)
+void HELPER(gvec_udot_idx_h)(void *vd, void *vn, void *vm,
+                             void *va, uint32_t desc)
 {
     intptr_t i, opr_sz = simd_oprsz(desc), opr_sz_8 = opr_sz / 8;
     intptr_t index = simd_data(desc);
-    uint64_t *d = vd;
+    uint64_t *d = vd, *a = va;
     uint16_t *n = vn;
     uint16_t *m_indexed = (uint16_t *)vm + index * 4;
 
@@ -540,22 +552,24 @@ void HELPER(gvec_udot_idx_h)(void *vd, void *vn, void *vm, uint32_t desc)
      * Process the entire segment all at once, writing back the results
      * only after we've consumed all of the inputs.
      */
-    for (i = 0; i < opr_sz_8 ; i += 2) {
+    for (i = 0; i < opr_sz_8; i += 2) {
         uint64_t d0, d1;
 
-        d0  = n[i * 4 + 0] * (uint64_t)m_indexed[i * 4 + 0];
+        d0  = a[i + 0];
+        d0 += n[i * 4 + 0] * (uint64_t)m_indexed[i * 4 + 0];
         d0 += n[i * 4 + 1] * (uint64_t)m_indexed[i * 4 + 1];
         d0 += n[i * 4 + 2] * (uint64_t)m_indexed[i * 4 + 2];
         d0 += n[i * 4 + 3] * (uint64_t)m_indexed[i * 4 + 3];
-        d1  = n[i * 4 + 4] * (uint64_t)m_indexed[i * 4 + 0];
+
+        d1  = a[i + 1];
+        d1 += n[i * 4 + 4] * (uint64_t)m_indexed[i * 4 + 0];
         d1 += n[i * 4 + 5] * (uint64_t)m_indexed[i * 4 + 1];
         d1 += n[i * 4 + 6] * (uint64_t)m_indexed[i * 4 + 2];
         d1 += n[i * 4 + 7] * (uint64_t)m_indexed[i * 4 + 3];
 
-        d[i + 0] += d0;
-        d[i + 1] += d1;
+        d[i + 0] = d0;
+        d[i + 1] = d1;
     }
-
     clear_tail(d, opr_sz, simd_maxsz(desc));
 }
 
-- 
2.25.1

