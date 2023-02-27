Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4301174ejc;
        Sun, 26 Feb 2023 21:50:44 -0800 (PST)
X-Google-Smtp-Source: AK7set97c5siNJdYGdHN0krYXosHwVaJtOkzLQb8oSLKQgTLLDWvOwqz008oGLUQqNf3bX2CkfHb
X-Received: by 2002:a05:622a:1054:b0:3b8:1be5:3bff with SMTP id f20-20020a05622a105400b003b81be53bffmr29789451qte.26.1677477044432;
        Sun, 26 Feb 2023 21:50:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677477044; cv=none;
        d=google.com; s=arc-20160816;
        b=OhInUuT1eK+vc9QnJFHiERaTW/P7X5TTb36/FefFxdekAnhoBduyOKTsqAEDi4WHWv
         8PPm7/osPcGAs0JcLWYdfjJawdOOdJWJ2AW523oNBUOdlDVsDYryC1G2DB70K3nHHW6H
         /79itoXtQDFyT/GjiB+/c4hW+El10bpBlNwfCkAjWT/CbgTcIfGncsrGmd6/uJQ3pS1C
         FARW+pc5SSU+4dUk8lDPMlNpiNsOPLBc1H33h6DC2W9lFZ3XwPlhCDX0PSOdEw74uaiY
         H1xD0OaOKRsVihI0Olx5V0vLS+zvrkSvUbdmPNHUCpmxo8knPiORmR1qi4F6J6K/J5dE
         lXZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=dS1IiMxvN3PN6cOLh1bTyXU8CtedsGRsJAlzWKhUz38=;
        b=kk78bw9r7wcT6RX+XAgWn7T42zDgmInDtLDP2cX97eqCBAW3Ww4T8cWQgzytpTeqzd
         V5Cp19pP6Y3xDp4Suq4bk5h5QQykI3oonv+oPq91uZpCaUpibF8tZOgqtwoRSH1hZ31F
         D+gs7sYWPBzv3H+/S0hH4mU5E57onL49T/lGH+nTFKzkij3Jonz8WgUeFATf4KaCJdCz
         glTic+ViWTXPKlosAD1wlITfIx71GW72s0XIveAfkU/WPXCNVVcID6l5E8hgH4pbWYEC
         wFyHMKvtPhkrbcHws4wbvLSMWelPJo1UY9U57lJF0Cy3dOKW04ZsylsP/A6vpBbasfd+
         1R/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PxM5EFzy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ay19-20020a05620a179300b00742703b0200si5485700qkb.349.2023.02.26.21.50.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Feb 2023 21:50:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PxM5EFzy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWWHs-0002Ji-Tq; Mon, 27 Feb 2023 00:43:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWHq-00025V-Ii
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:42:58 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWHo-0004oU-FZ
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:42:58 -0500
Received: by mail-pf1-x429.google.com with SMTP id n2so2772587pfo.12
 for <qemu-arm@nongnu.org>; Sun, 26 Feb 2023 21:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dS1IiMxvN3PN6cOLh1bTyXU8CtedsGRsJAlzWKhUz38=;
 b=PxM5EFzydZoVsO47nVeNlB6okP5U3NE3ZqJDgRf4iUKYTc39XcEuxWN86DTGAn2Pg5
 bcaaBzcSjYrT5tSjocGZXV2KYFFpOehbMGKO9zNO0mCGIYBEke92s+ablInOles2KqRf
 LPqZYQAxgdfJBWTUpyJUf1/7NL3R2Bm2pVW5CX8CGwTV94vJkYUGIFWzBzCJf/UMKBm4
 JoJN7DMvGh79lmWx1lpC39P86YTr5QoPVyKACHNJEQFl/MAuaz3RfrnUFGlQ0/eix0AX
 Ak3W4gIcRck+4EFdtPIoZmPxUvbExaIcsJ3A72g6e0x+N9PAqNfG74Vk6on5O0mQvGRB
 uI8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dS1IiMxvN3PN6cOLh1bTyXU8CtedsGRsJAlzWKhUz38=;
 b=a/feLliHYmmskb92V22HSuAGtGyGNNSRpseYQZrffGuQZXa3sTvcK4MA653iMC+cdZ
 t6rWalfTtcc4lQIO480WXO5+/flbfefD3WMLhJDR29CKyjNSWCyVXEE6+ZfYsQxoqL5z
 w0vM6LJw7Pekg1f3mZdXoUzxLeoNK79Paztq2hd0tBDxCe/B/0CcuKiULk1XOMCP1KE6
 JrnhpdXB/jdZ8iRR3JrD3IPTXDrTkvnXN1A/WcpdJ0MR+8BTUzNfL/HJl78M6OBWwQXq
 iIrXc0BqSP02Ywmi+f7mRf2KQ/6YJUKg2NUR84TOJWhgDUgAiAJoiQRCFPIN3mUT+sMe
 t3LA==
X-Gm-Message-State: AO0yUKVISsIo7yN9L3x7KS0B9tIKrr2V1DnFeFIrUKP1azPdzf9AQvXF
 4LdHl2BrYbZYih7Yn3/SV9nFhg==
X-Received: by 2002:a05:6a00:47:b0:5cd:d766:8a2b with SMTP id
 i7-20020a056a00004700b005cdd7668a2bmr18698810pfk.6.1677476574927; 
 Sun, 26 Feb 2023 21:42:54 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 d10-20020aa7868a000000b005cdc64a287dsm3317137pfo.115.2023.02.26.21.42.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:42:54 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 04/70] target/arm: Consistently use ARMFPRounding during
 translation
Date: Sun, 26 Feb 2023 19:41:27 -1000
Message-Id: <20230227054233.390271-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: NWKCC8RRWwIm

In preparation for extracting new helpers, ensure that
the rounding mode is represented as ARMFPRounding and
not FloatRoundMode.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 16 ++++++++--------
 target/arm/translate-sve.c | 18 +++++++++---------
 target/arm/translate-vfp.c |  6 +++---
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 1c575de3e0..3c0462a9c1 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -6202,7 +6202,7 @@ static void handle_fp_1src_single(DisasContext *s, int opcode, int rd, int rn)
     case 0xa: /* FRINTM */
     case 0xb: /* FRINTZ */
     case 0xc: /* FRINTA */
-        rmode = arm_rmode_to_sf(opcode & 7);
+        rmode = opcode & 7;
         gen_fpst = gen_helper_rints;
         break;
     case 0xe: /* FRINTX */
@@ -6212,14 +6212,14 @@ static void handle_fp_1src_single(DisasContext *s, int opcode, int rd, int rn)
         gen_fpst = gen_helper_rints;
         break;
     case 0x10: /* FRINT32Z */
-        rmode = float_round_to_zero;
+        rmode = FPROUNDING_ZERO;
         gen_fpst = gen_helper_frint32_s;
         break;
     case 0x11: /* FRINT32X */
         gen_fpst = gen_helper_frint32_s;
         break;
     case 0x12: /* FRINT64Z */
-        rmode = float_round_to_zero;
+        rmode = FPROUNDING_ZERO;
         gen_fpst = gen_helper_frint64_s;
         break;
     case 0x13: /* FRINT64X */
@@ -6231,7 +6231,7 @@ static void handle_fp_1src_single(DisasContext *s, int opcode, int rd, int rn)
 
     fpst = fpstatus_ptr(FPST_FPCR);
     if (rmode >= 0) {
-        TCGv_i32 tcg_rmode = tcg_const_i32(rmode);
+        TCGv_i32 tcg_rmode = tcg_const_i32(arm_rmode_to_sf(rmode));
         gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
         gen_fpst(tcg_res, tcg_op, fpst);
         gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
@@ -6275,7 +6275,7 @@ static void handle_fp_1src_double(DisasContext *s, int opcode, int rd, int rn)
     case 0xa: /* FRINTM */
     case 0xb: /* FRINTZ */
     case 0xc: /* FRINTA */
-        rmode = arm_rmode_to_sf(opcode & 7);
+        rmode = opcode & 7;
         gen_fpst = gen_helper_rintd;
         break;
     case 0xe: /* FRINTX */
@@ -6285,14 +6285,14 @@ static void handle_fp_1src_double(DisasContext *s, int opcode, int rd, int rn)
         gen_fpst = gen_helper_rintd;
         break;
     case 0x10: /* FRINT32Z */
-        rmode = float_round_to_zero;
+        rmode = FPROUNDING_ZERO;
         gen_fpst = gen_helper_frint32_d;
         break;
     case 0x11: /* FRINT32X */
         gen_fpst = gen_helper_frint32_d;
         break;
     case 0x12: /* FRINT64Z */
-        rmode = float_round_to_zero;
+        rmode = FPROUNDING_ZERO;
         gen_fpst = gen_helper_frint64_d;
         break;
     case 0x13: /* FRINT64X */
@@ -6304,7 +6304,7 @@ static void handle_fp_1src_double(DisasContext *s, int opcode, int rd, int rn)
 
     fpst = fpstatus_ptr(FPST_FPCR);
     if (rmode >= 0) {
-        TCGv_i32 tcg_rmode = tcg_const_i32(rmode);
+        TCGv_i32 tcg_rmode = tcg_const_i32(arm_rmode_to_sf(rmode));
         gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
         gen_fpst(tcg_res, tcg_op, fpst);
         gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 5bf80b22d7..3c65dd1ff2 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -4082,7 +4082,7 @@ TRANS_FEAT(FRINTX, aa64_sve, gen_gvec_fpst_arg_zpz, frintx_fns[a->esz],
            a, 0, a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR);
 
 static bool do_frint_mode(DisasContext *s, arg_rpr_esz *a,
-                          int mode, gen_helper_gvec_3_ptr *fn)
+                          ARMFPRounding mode, gen_helper_gvec_3_ptr *fn)
 {
     unsigned vsz;
     TCGv_i32 tmode;
@@ -4096,7 +4096,7 @@ static bool do_frint_mode(DisasContext *s, arg_rpr_esz *a,
     }
 
     vsz = vec_full_reg_size(s);
-    tmode = tcg_const_i32(mode);
+    tmode = tcg_const_i32(arm_rmode_to_sf(mode));
     status = fpstatus_ptr(a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR);
 
     gen_helper_set_rmode(tmode, tmode, status);
@@ -4111,15 +4111,15 @@ static bool do_frint_mode(DisasContext *s, arg_rpr_esz *a,
 }
 
 TRANS_FEAT(FRINTN, aa64_sve, do_frint_mode, a,
-           float_round_nearest_even, frint_fns[a->esz])
+           FPROUNDING_TIEEVEN, frint_fns[a->esz])
 TRANS_FEAT(FRINTP, aa64_sve, do_frint_mode, a,
-           float_round_up, frint_fns[a->esz])
+           FPROUNDING_POSINF, frint_fns[a->esz])
 TRANS_FEAT(FRINTM, aa64_sve, do_frint_mode, a,
-           float_round_down, frint_fns[a->esz])
+           FPROUNDING_NEGINF, frint_fns[a->esz])
 TRANS_FEAT(FRINTZ, aa64_sve, do_frint_mode, a,
-           float_round_to_zero, frint_fns[a->esz])
+           FPROUNDING_ZERO, frint_fns[a->esz])
 TRANS_FEAT(FRINTA, aa64_sve, do_frint_mode, a,
-           float_round_ties_away, frint_fns[a->esz])
+           FPROUNDING_TIEAWAY, frint_fns[a->esz])
 
 static gen_helper_gvec_3_ptr * const frecpx_fns[] = {
     NULL,                    gen_helper_sve_frecpx_h,
@@ -7145,9 +7145,9 @@ TRANS_FEAT(FCVTLT_sd, aa64_sve2, gen_gvec_fpst_arg_zpz,
            gen_helper_sve2_fcvtlt_sd, a, 0, FPST_FPCR)
 
 TRANS_FEAT(FCVTX_ds, aa64_sve2, do_frint_mode, a,
-           float_round_to_odd, gen_helper_sve_fcvt_ds)
+           FPROUNDING_ODD, gen_helper_sve_fcvt_ds)
 TRANS_FEAT(FCVTXNT_ds, aa64_sve2, do_frint_mode, a,
-           float_round_to_odd, gen_helper_sve2_fcvtnt_ds)
+           FPROUNDING_ODD, gen_helper_sve2_fcvtnt_ds)
 
 static gen_helper_gvec_3_ptr * const flogb_fns[] = {
     NULL,               gen_helper_flogb_h,
diff --git a/target/arm/translate-vfp.c b/target/arm/translate-vfp.c
index 757a2bf7d9..e7acfb3338 100644
--- a/target/arm/translate-vfp.c
+++ b/target/arm/translate-vfp.c
@@ -2783,7 +2783,7 @@ static bool trans_VRINTZ_hp(DisasContext *s, arg_VRINTZ_sp *a)
     tmp = tcg_temp_new_i32();
     vfp_load_reg32(tmp, a->vm);
     fpst = fpstatus_ptr(FPST_FPCR_F16);
-    tcg_rmode = tcg_const_i32(float_round_to_zero);
+    tcg_rmode = tcg_const_i32(arm_rmode_to_sf(FPROUNDING_ZERO));
     gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
     gen_helper_rinth(tmp, tmp, fpst);
     gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
@@ -2808,7 +2808,7 @@ static bool trans_VRINTZ_sp(DisasContext *s, arg_VRINTZ_sp *a)
     tmp = tcg_temp_new_i32();
     vfp_load_reg32(tmp, a->vm);
     fpst = fpstatus_ptr(FPST_FPCR);
-    tcg_rmode = tcg_const_i32(float_round_to_zero);
+    tcg_rmode = tcg_const_i32(arm_rmode_to_sf(FPROUNDING_ZERO));
     gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
     gen_helper_rints(tmp, tmp, fpst);
     gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
@@ -2842,7 +2842,7 @@ static bool trans_VRINTZ_dp(DisasContext *s, arg_VRINTZ_dp *a)
     tmp = tcg_temp_new_i64();
     vfp_load_reg64(tmp, a->vm);
     fpst = fpstatus_ptr(FPST_FPCR);
-    tcg_rmode = tcg_const_i32(float_round_to_zero);
+    tcg_rmode = tcg_const_i32(arm_rmode_to_sf(FPROUNDING_ZERO));
     gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
     gen_helper_rintd(tmp, tmp, fpst);
     gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
-- 
2.34.1

