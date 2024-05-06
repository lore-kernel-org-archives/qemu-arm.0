Received: by 2002:a17:907:a09:b0:a52:4db9:938b with SMTP id bb9csp1269737ejc;
        Sun, 5 May 2024 18:05:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW4aHLNnvd0aNDruk3qqfWyEJDV4of1jV6/uzJNtRlnWS+G3rt2FZ49zCK7p6nDBpLczydIINcU0SRpKw2+hO6CMB4j2fhZ
X-Google-Smtp-Source: AGHT+IH8PSHniJo6/Tj6lG38xL4Ng8aMhgQE2ksswZRU3nWwewG59ZqqKjZiFQaUTE3PFn2KzOUm
X-Received: by 2002:a05:620a:254d:b0:790:9a14:2d28 with SMTP id s13-20020a05620a254d00b007909a142d28mr10251448qko.31.1714957529867;
        Sun, 05 May 2024 18:05:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714957529; cv=none;
        d=google.com; s=arc-20160816;
        b=ZfvIU4RV9GRpqkknuTXgxgAmWB7Xf2InwFrb8LO6ffEGaOY4OSBvw/5IAgrb/J5I+M
         zMWpXk/VJ6T1cPzvxhvZrMv4g8EUFZBFbWjTpcbTcEHgp+aKLDXXZTHQqej46N8HuZ+5
         VdPjGkIT9G/oofOtNGNU90peom66bfTPrSiEgML7cMhdD/1E4u1au6rmDMSfOv10+000
         a9Rb4RfyeZelpgZBpu3Eg/nKuCMtNAGhuLnFzB4+/AwgrelR/WbboNUs/B1hLcBgqAnq
         qt3m1EfrPvOILTkwnJAwTJhE90umwbwHNgKWFk+Tlp0MEOhi6jYUd7q3B0PmyOxivugc
         BWMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=qO0nFxa4czEmneEqCAevEOX1DOoYqksE5lIIBMNqdCI=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=v27sgeqbZs7qoCGIfxPI0aJKUxAC/2AECpN2zagz7kTA2pLqsHxff/JR2q82qSeOyr
         9p67JtVnm74axc2pgXw6n1dSOauA4EuHk509W0qkfLSNuAT3U7NZn0uPT1DrVyel8tlJ
         apSBSPM8/D+jRjp3Iv9RMRhRqR7wX2iyEbRHk3zbyli5slBHI8JLZ08RQZkn5RmtSJHb
         NFtc0JU8PpbNY/5ZKn5pv1790PbA9LDi/2KxYG8rzaXOQMwyjfeH6Y+I8/ryDgikTaIf
         SF+OekM4jZ8e/O2YwCQPUqm5E+N2YJq32Fd7s9qXzQH2GqXREAH2VgF0MlLjM4O9ccmE
         N1Zg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YVpaa8UA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ye13-20020a05620a3b8d00b007929d65eaccsi293524qkn.530.2024.05.05.18.05.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 05 May 2024 18:05:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YVpaa8UA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s3mmW-0007pj-Su; Sun, 05 May 2024 21:04:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1s3mmS-0007my-OP
 for qemu-arm@nongnu.org; Sun, 05 May 2024 21:04:38 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1s3mmC-0002Sd-M3
 for qemu-arm@nongnu.org; Sun, 05 May 2024 21:04:36 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-6f45f1179c3so619489b3a.3
 for <qemu-arm@nongnu.org>; Sun, 05 May 2024 18:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714957456; x=1715562256; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qO0nFxa4czEmneEqCAevEOX1DOoYqksE5lIIBMNqdCI=;
 b=YVpaa8UAe3hQbGEmSO0i+0zR3K4lWRTPuLjXfb3+idn3IGZUEfFvx5dJxHpICLx+9Y
 KKgXdYTU+k6NeqV2Q+bLv4SAwnJqQ/tBNxAk/BF0+gPpwHCfRUws8R/MWN7Otrr7PpEp
 AjUd55XSmep+7f0djo1QmSkpOiiM0OKc+a5F64zwik0NUccsSF3nmxfIo3OJ2TWD0iNQ
 zdVlze+LxGo2uzPlzLW/jqwKNg4k/ZYj/2XQ+cJFAqapPoX8giO/2pRhVI2cegW1Vo6+
 oFbnhpOpIw/AW6FgDhjIxR1X/RYN3fQbllNEhlyTT1KEn+Suo9hxXdaILK4PaUhV/KMX
 WCgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714957456; x=1715562256;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qO0nFxa4czEmneEqCAevEOX1DOoYqksE5lIIBMNqdCI=;
 b=iy+91UFxc7hczQllV6mm/+eyLRXoPMawMECZM1bdjaHkSbOO7EjS8I+n+J9SLvIuPb
 rgToItbw73TN08lF4/3sSs7rtqeTXi1m+7hYYnqPk6kRwjPMwvwOhA7VU1vaSpKGKTgo
 MPSDjUG0RSoHIKqvck9kC+ebHs+Iqs8wmAkYWAOJgTTRndJac2KIGdxaeSXQz4WMLOC3
 SM1QOAQUB0bs9VBcd6iy0O++xe3xiiyZwqowKh4vlaxGr0d5BIVtC9KhEu4tg/7JYOyX
 3B2l8W62blSXKdjAraX6yYPqSyfStVQX71iXohTyvH3Kfqav6D5l1WBILbCNFjTXkRsd
 f/sg==
X-Gm-Message-State: AOJu0YwvMGIYKfPX4uWLICBQ4kz8nfnCUmMWIgG6lODwlbjv3GCgHjt1
 3J9irNp4yq2fmC7gILhRu0fITJlbp1xQFwT+ArLkqVPVVb51B1nlWwHMoCV4H6UWeJDW5RFLl9i
 a
X-Received: by 2002:a05:6a21:1f15:b0:1af:a6bb:45c5 with SMTP id
 ry21-20020a056a211f1500b001afa6bb45c5mr2402963pzb.30.1714957455994; 
 Sun, 05 May 2024 18:04:15 -0700 (PDT)
Received: from stoup.. (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 pv7-20020a17090b3c8700b002a5f44353d2sm8958232pjb.7.2024.05.05.18.04.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 May 2024 18:04:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 12/57] target/arm: Convert FMULX to decodetree
Date: Sun,  5 May 2024 18:03:18 -0700
Message-Id: <20240506010403.6204-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240506010403.6204-1-richard.henderson@linaro.org>
References: <20240506010403.6204-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 8UZnRYqzbGKh

Convert all forms (scalar, vector, scalar indexed, vector indexed),
which allows us to remove switch table entries elsewhere.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/helper-a64.h    |   8 ++
 target/arm/tcg/a64.decode      |  45 +++++++
 target/arm/tcg/translate-a64.c | 221 +++++++++++++++++++++++++++------
 target/arm/tcg/vec_helper.c    |  39 +++---
 4 files changed, 259 insertions(+), 54 deletions(-)

diff --git a/target/arm/tcg/helper-a64.h b/target/arm/tcg/helper-a64.h
index 0518165399..b79751a717 100644
--- a/target/arm/tcg/helper-a64.h
+++ b/target/arm/tcg/helper-a64.h
@@ -132,3 +132,11 @@ DEF_HELPER_4(cpye, void, env, i32, i32, i32)
 DEF_HELPER_4(cpyfp, void, env, i32, i32, i32)
 DEF_HELPER_4(cpyfm, void, env, i32, i32, i32)
 DEF_HELPER_4(cpyfe, void, env, i32, i32, i32)
+
+DEF_HELPER_FLAGS_5(gvec_fmulx_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_fmulx_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_fmulx_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(gvec_fmulx_idx_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_fmulx_idx_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_fmulx_idx_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index d5bfeae7a8..e28f58bd9a 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -20,21 +20,44 @@
 #
 
 %rd             0:5
+%esz_sd         22:1 !function=plus_2
+%hl             11:1 21:1
+%hlm            11:1 20:2
 
 &r              rn
 &ri             rd imm
 &rri_sf         rd rn imm sf
 &i              imm
+&rrr_e          rd rn rm esz
+&rrx_e          rd rn rm idx esz
 &qrr_e          q rd rn esz
 &qrrr_e         q rd rn rm esz
+&qrrx_e         q rd rn rm idx esz
 &qrrrr_e        q rd rn rm ra esz
 
+@rrr_h          ........ ... rm:5 ...... rn:5 rd:5      &rrr_e esz=1
+@rrr_sd         ........ ... rm:5 ...... rn:5 rd:5      &rrr_e esz=%esz_sd
+
+@rrx_h          ........ .. .. rm:4 .... . . rn:5 rd:5  &rrx_e esz=1 idx=%hlm
+@rrx_s          ........ .. . rm:5  .... . . rn:5 rd:5  &rrx_e esz=2 idx=%hl
+@rrx_d          ........ .. . rm:5  .... idx:1 . rn:5 rd:5  &rrx_e esz=3
+
 @rr_q1e0        ........ ........ ...... rn:5 rd:5      &qrr_e q=1 esz=0
 @r2r_q1e0       ........ ........ ...... rm:5 rd:5      &qrrr_e rn=%rd q=1 esz=0
 @rrr_q1e0       ........ ... rm:5 ...... rn:5 rd:5      &qrrr_e q=1 esz=0
 @rrr_q1e3       ........ ... rm:5 ...... rn:5 rd:5      &qrrr_e q=1 esz=3
 @rrrr_q1e3      ........ ... rm:5 . ra:5 rn:5 rd:5      &qrrrr_e q=1 esz=3
 
+@qrrr_h         . q:1 ...... ... rm:5 ...... rn:5 rd:5  &qrrr_e esz=1
+@qrrr_sd        . q:1 ...... ... rm:5 ...... rn:5 rd:5  &qrrr_e esz=%esz_sd
+
+@qrrx_h         . q:1 .. .... .. .. rm:4 .... . . rn:5 rd:5 \
+                &qrrx_e esz=1 idx=%hlm
+@qrrx_s         . q:1 .. .... .. . rm:5  .... . . rn:5 rd:5 \
+                &qrrx_e esz=2 idx=%hl
+@qrrx_d         . q:1 .. .... .. . rm:5  .... idx:1 . rn:5 rd:5 \
+                &qrrx_e esz=3
+
 ### Data Processing - Immediate
 
 # PC-rel addressing
@@ -671,3 +694,25 @@ INS_general     0 1   00 1110 000 imm:5 0 0011 1 rn:5 rd:5
 SMOV            0 q:1 00 1110 000 imm:5 0 0101 1 rn:5 rd:5
 UMOV            0 q:1 00 1110 000 imm:5 0 0111 1 rn:5 rd:5
 INS_element     0 1   10 1110 000 di:5  0 si:4 1 rn:5 rd:5
+
+### Advanced SIMD scalar three same
+
+FMULX_s         0101 1110 010 ..... 00011 1 ..... ..... @rrr_h
+FMULX_s         0101 1110 0.1 ..... 11011 1 ..... ..... @rrr_sd
+
+### Advanced SIMD three same
+
+FMULX_v         0.00 0111 010 ..... 00011 1 ..... ..... @qrrr_h
+FMULX_v         0.00 1110 0.1 ..... 11011 1 ..... ..... @qrrr_sd
+
+### Advanced SIMD scalar x indexed element
+
+FMULX_si        0111 1111 00 .. .... 1001 . 0 ..... .....   @rrx_h
+FMULX_si        0111 1111 10 . ..... 1001 . 0 ..... .....   @rrx_s
+FMULX_si        0111 1111 11 0 ..... 1001 . 0 ..... .....   @rrx_d
+
+### Advanced SIMD vector x indexed element
+
+FMULX_vi        0.10 1111 00 .. .... 1001 . 0 ..... .....   @qrrx_h
+FMULX_vi        0.10 1111 10 . ..... 1001 . 0 ..... .....   @qrrx_s
+FMULX_vi        0.10 1111 11 0 ..... 1001 . 0 ..... .....   @qrrx_d
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 4860b59d18..33da0c5f0f 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -4842,6 +4842,178 @@ static bool trans_INS_element(DisasContext *s, arg_INS_element *a)
     return true;
 }
 
+/*
+ * Advanced SIMD three same
+ */
+
+typedef struct FPScalar {
+    void (*gen_h)(TCGv_i32, TCGv_i32, TCGv_i32, TCGv_ptr);
+    void (*gen_s)(TCGv_i32, TCGv_i32, TCGv_i32, TCGv_ptr);
+    void (*gen_d)(TCGv_i64, TCGv_i64, TCGv_i64, TCGv_ptr);
+} FPScalar;
+
+static bool do_fp3_scalar(DisasContext *s, arg_rrr_e *a, const FPScalar *f)
+{
+    switch (a->esz) {
+    case MO_64:
+        if (fp_access_check(s)) {
+            TCGv_i64 t0 = read_fp_dreg(s, a->rn);
+            TCGv_i64 t1 = read_fp_dreg(s, a->rm);
+            f->gen_d(t0, t0, t1, fpstatus_ptr(FPST_FPCR));
+            write_fp_dreg(s, a->rd, t0);
+        }
+        break;
+    case MO_32:
+        if (fp_access_check(s)) {
+            TCGv_i32 t0 = read_fp_sreg(s, a->rn);
+            TCGv_i32 t1 = read_fp_sreg(s, a->rm);
+            f->gen_s(t0, t0, t1, fpstatus_ptr(FPST_FPCR));
+            write_fp_sreg(s, a->rd, t0);
+        }
+        break;
+    case MO_16:
+        if (!dc_isar_feature(aa64_fp16, s)) {
+            return false;
+        }
+        if (fp_access_check(s)) {
+            TCGv_i32 t0 = read_fp_hreg(s, a->rn);
+            TCGv_i32 t1 = read_fp_hreg(s, a->rm);
+            f->gen_h(t0, t0, t1, fpstatus_ptr(FPST_FPCR_F16));
+            write_fp_sreg(s, a->rd, t0);
+        }
+        break;
+    default:
+        return false;
+    }
+    return true;
+}
+
+static const FPScalar f_scalar_fmulx = {
+    gen_helper_advsimd_mulxh,
+    gen_helper_vfp_mulxs,
+    gen_helper_vfp_mulxd,
+};
+TRANS(FMULX_s, do_fp3_scalar, a, &f_scalar_fmulx)
+
+static bool do_fp3_vector(DisasContext *s, arg_qrrr_e *a,
+                          gen_helper_gvec_3_ptr * const fns[3])
+{
+    MemOp esz = a->esz;
+
+    switch (esz) {
+    case MO_64:
+        if (!a->q) {
+            return false;
+        }
+        break;
+    case MO_32:
+        break;
+    case MO_16:
+        if (!dc_isar_feature(aa64_fp16, s)) {
+            return false;
+        }
+        break;
+    default:
+        return false;
+    }
+    if (fp_access_check(s)) {
+        gen_gvec_op3_fpst(s, a->q, a->rd, a->rn, a->rm,
+                          esz == MO_16, 0, fns[esz - 1]);
+    }
+    return true;
+}
+
+static gen_helper_gvec_3_ptr * const f_vector_fmulx[3] = {
+    gen_helper_gvec_fmulx_h,
+    gen_helper_gvec_fmulx_s,
+    gen_helper_gvec_fmulx_d,
+};
+TRANS(FMULX_v, do_fp3_vector, a, f_vector_fmulx)
+
+/*
+ * Advanced SIMD scalar/vector x indexed element
+ */
+
+static bool do_fp3_scalar_idx(DisasContext *s, arg_rrx_e *a, const FPScalar *f)
+{
+    switch (a->esz) {
+    case MO_64:
+        if (fp_access_check(s)) {
+            TCGv_i64 t0 = read_fp_dreg(s, a->rn);
+            TCGv_i64 t1 = tcg_temp_new_i64();
+
+            read_vec_element(s, t1, a->rm, a->idx, MO_64);
+            f->gen_d(t0, t0, t1, fpstatus_ptr(FPST_FPCR));
+            write_fp_dreg(s, a->rd, t0);
+        }
+        break;
+    case MO_32:
+        if (fp_access_check(s)) {
+            TCGv_i32 t0 = read_fp_sreg(s, a->rn);
+            TCGv_i32 t1 = tcg_temp_new_i32();
+
+            read_vec_element_i32(s, t1, a->rm, a->idx, MO_32);
+            f->gen_s(t0, t0, t1, fpstatus_ptr(FPST_FPCR));
+            write_fp_sreg(s, a->rd, t0);
+        }
+        break;
+    case MO_16:
+        if (!dc_isar_feature(aa64_fp16, s)) {
+            return false;
+        }
+        if (fp_access_check(s)) {
+            TCGv_i32 t0 = read_fp_hreg(s, a->rn);
+            TCGv_i32 t1 = tcg_temp_new_i32();
+
+            read_vec_element_i32(s, t1, a->rm, a->idx, MO_16);
+            f->gen_h(t0, t0, t1, fpstatus_ptr(FPST_FPCR_F16));
+            write_fp_sreg(s, a->rd, t0);
+        }
+        break;
+    default:
+        g_assert_not_reached();
+    }
+    return true;
+}
+
+TRANS(FMULX_si, do_fp3_scalar_idx, a, &f_scalar_fmulx)
+
+static bool do_fp3_vector_idx(DisasContext *s, arg_qrrx_e *a,
+                              gen_helper_gvec_3_ptr * const fns[3])
+{
+    MemOp esz = a->esz;
+
+    switch (esz) {
+    case MO_64:
+        if (!a->q) {
+            return false;
+        }
+        break;
+    case MO_32:
+        break;
+    case MO_16:
+        if (!dc_isar_feature(aa64_fp16, s)) {
+            return false;
+        }
+        break;
+    default:
+        g_assert_not_reached();
+    }
+    if (fp_access_check(s)) {
+        gen_gvec_op3_fpst(s, a->q, a->rd, a->rn, a->rm,
+                          esz == MO_16, a->idx, fns[esz - 1]);
+    }
+    return true;
+}
+
+static gen_helper_gvec_3_ptr * const f_vector_idx_fmulx[3] = {
+    gen_helper_gvec_fmulx_idx_h,
+    gen_helper_gvec_fmulx_idx_s,
+    gen_helper_gvec_fmulx_idx_d,
+};
+TRANS(FMULX_vi, do_fp3_vector_idx, a, f_vector_idx_fmulx)
+
+
 /* Shift a TCGv src by TCGv shift_amount, put result in dst.
  * Note that it is the caller's responsibility to ensure that the
  * shift amount is in range (ie 0..31 or 0..63) and provide the ARM
@@ -9005,9 +9177,6 @@ static void handle_3same_float(DisasContext *s, int size, int elements,
             case 0x1a: /* FADD */
                 gen_helper_vfp_addd(tcg_res, tcg_op1, tcg_op2, fpst);
                 break;
-            case 0x1b: /* FMULX */
-                gen_helper_vfp_mulxd(tcg_res, tcg_op1, tcg_op2, fpst);
-                break;
             case 0x1c: /* FCMEQ */
                 gen_helper_neon_ceq_f64(tcg_res, tcg_op1, tcg_op2, fpst);
                 break;
@@ -9052,6 +9221,7 @@ static void handle_3same_float(DisasContext *s, int size, int elements,
                 gen_helper_neon_acgt_f64(tcg_res, tcg_op1, tcg_op2, fpst);
                 break;
             default:
+            case 0x1b: /* FMULX */
                 g_assert_not_reached();
             }
 
@@ -9078,9 +9248,6 @@ static void handle_3same_float(DisasContext *s, int size, int elements,
             case 0x1a: /* FADD */
                 gen_helper_vfp_adds(tcg_res, tcg_op1, tcg_op2, fpst);
                 break;
-            case 0x1b: /* FMULX */
-                gen_helper_vfp_mulxs(tcg_res, tcg_op1, tcg_op2, fpst);
-                break;
             case 0x1c: /* FCMEQ */
                 gen_helper_neon_ceq_f32(tcg_res, tcg_op1, tcg_op2, fpst);
                 break;
@@ -9128,6 +9295,7 @@ static void handle_3same_float(DisasContext *s, int size, int elements,
                 gen_helper_neon_acgt_f32(tcg_res, tcg_op1, tcg_op2, fpst);
                 break;
             default:
+            case 0x1b: /* FMULX */
                 g_assert_not_reached();
             }
 
@@ -9166,7 +9334,6 @@ static void disas_simd_scalar_three_reg_same(DisasContext *s, uint32_t insn)
         /* Floating point: U, size[1] and opcode indicate operation */
         int fpopcode = opcode | (extract32(size, 1, 1) << 5) | (u << 6);
         switch (fpopcode) {
-        case 0x1b: /* FMULX */
         case 0x1f: /* FRECPS */
         case 0x3f: /* FRSQRTS */
         case 0x5d: /* FACGE */
@@ -9177,6 +9344,7 @@ static void disas_simd_scalar_three_reg_same(DisasContext *s, uint32_t insn)
         case 0x7a: /* FABD */
             break;
         default:
+        case 0x1b: /* FMULX */
             unallocated_encoding(s);
             return;
         }
@@ -9329,7 +9497,6 @@ static void disas_simd_scalar_three_reg_same_fp16(DisasContext *s,
     TCGv_i32 tcg_res;
 
     switch (fpopcode) {
-    case 0x03: /* FMULX */
     case 0x04: /* FCMEQ (reg) */
     case 0x07: /* FRECPS */
     case 0x0f: /* FRSQRTS */
@@ -9340,6 +9507,7 @@ static void disas_simd_scalar_three_reg_same_fp16(DisasContext *s,
     case 0x1d: /* FACGT */
         break;
     default:
+    case 0x03: /* FMULX */
         unallocated_encoding(s);
         return;
     }
@@ -9359,9 +9527,6 @@ static void disas_simd_scalar_three_reg_same_fp16(DisasContext *s,
     tcg_res = tcg_temp_new_i32();
 
     switch (fpopcode) {
-    case 0x03: /* FMULX */
-        gen_helper_advsimd_mulxh(tcg_res, tcg_op1, tcg_op2, fpst);
-        break;
     case 0x04: /* FCMEQ (reg) */
         gen_helper_advsimd_ceq_f16(tcg_res, tcg_op1, tcg_op2, fpst);
         break;
@@ -9388,6 +9553,7 @@ static void disas_simd_scalar_three_reg_same_fp16(DisasContext *s,
         gen_helper_advsimd_acgt_f16(tcg_res, tcg_op1, tcg_op2, fpst);
         break;
     default:
+    case 0x03: /* FMULX */
         g_assert_not_reached();
     }
 
@@ -11045,7 +11211,6 @@ static void disas_simd_3same_float(DisasContext *s, uint32_t insn)
         handle_simd_3same_pair(s, is_q, 0, fpopcode, size ? MO_64 : MO_32,
                                rn, rm, rd);
         return;
-    case 0x1b: /* FMULX */
     case 0x1f: /* FRECPS */
     case 0x3f: /* FRSQRTS */
     case 0x5d: /* FACGE */
@@ -11091,6 +11256,7 @@ static void disas_simd_3same_float(DisasContext *s, uint32_t insn)
         return;
 
     default:
+    case 0x1b: /* FMULX */
         unallocated_encoding(s);
         return;
     }
@@ -11435,7 +11601,6 @@ static void disas_simd_three_reg_same_fp16(DisasContext *s, uint32_t insn)
     case 0x0: /* FMAXNM */
     case 0x1: /* FMLA */
     case 0x2: /* FADD */
-    case 0x3: /* FMULX */
     case 0x4: /* FCMEQ */
     case 0x6: /* FMAX */
     case 0x7: /* FRECPS */
@@ -11461,6 +11626,7 @@ static void disas_simd_three_reg_same_fp16(DisasContext *s, uint32_t insn)
         pairwise = true;
         break;
     default:
+    case 0x3: /* FMULX */
         unallocated_encoding(s);
         return;
     }
@@ -11537,9 +11703,6 @@ static void disas_simd_three_reg_same_fp16(DisasContext *s, uint32_t insn)
             case 0x2: /* FADD */
                 gen_helper_advsimd_addh(tcg_res, tcg_op1, tcg_op2, fpst);
                 break;
-            case 0x3: /* FMULX */
-                gen_helper_advsimd_mulxh(tcg_res, tcg_op1, tcg_op2, fpst);
-                break;
             case 0x4: /* FCMEQ */
                 gen_helper_advsimd_ceq_f16(tcg_res, tcg_op1, tcg_op2, fpst);
                 break;
@@ -11591,6 +11754,7 @@ static void disas_simd_three_reg_same_fp16(DisasContext *s, uint32_t insn)
                 gen_helper_advsimd_acgt_f16(tcg_res, tcg_op1, tcg_op2, fpst);
                 break;
             default:
+            case 0x3: /* FMULX */
                 g_assert_not_reached();
             }
 
@@ -12810,7 +12974,6 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
     case 0x01: /* FMLA */
     case 0x05: /* FMLS */
     case 0x09: /* FMUL */
-    case 0x19: /* FMULX */
         is_fp = 1;
         break;
     case 0x1d: /* SQRDMLAH */
@@ -12879,6 +13042,7 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
         /* is_fp, but we pass tcg_env not fp_status.  */
         break;
     default:
+    case 0x19: /* FMULX */
         unallocated_encoding(s);
         return;
     }
@@ -13102,10 +13266,8 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
             case 0x09: /* FMUL */
                 gen_helper_vfp_muld(tcg_res, tcg_op, tcg_idx, fpst);
                 break;
-            case 0x19: /* FMULX */
-                gen_helper_vfp_mulxd(tcg_res, tcg_op, tcg_idx, fpst);
-                break;
             default:
+            case 0x19: /* FMULX */
                 g_assert_not_reached();
             }
 
@@ -13218,24 +13380,6 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
                     g_assert_not_reached();
                 }
                 break;
-            case 0x19: /* FMULX */
-                switch (size) {
-                case 1:
-                    if (is_scalar) {
-                        gen_helper_advsimd_mulxh(tcg_res, tcg_op,
-                                                 tcg_idx, fpst);
-                    } else {
-                        gen_helper_advsimd_mulx2h(tcg_res, tcg_op,
-                                                  tcg_idx, fpst);
-                    }
-                    break;
-                case 2:
-                    gen_helper_vfp_mulxs(tcg_res, tcg_op, tcg_idx, fpst);
-                    break;
-                default:
-                    g_assert_not_reached();
-                }
-                break;
             case 0x0c: /* SQDMULH */
                 if (size == 1) {
                     gen_helper_neon_qdmulh_s16(tcg_res, tcg_env,
@@ -13277,6 +13421,7 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
                 }
                 break;
             default:
+            case 0x19: /* FMULX */
                 g_assert_not_reached();
             }
 
diff --git a/target/arm/tcg/vec_helper.c b/target/arm/tcg/vec_helper.c
index 1f93510b85..8684581923 100644
--- a/target/arm/tcg/vec_helper.c
+++ b/target/arm/tcg/vec_helper.c
@@ -1248,6 +1248,9 @@ DO_3OP(gvec_rsqrts_nf_h, float16_rsqrts_nf, float16)
 DO_3OP(gvec_rsqrts_nf_s, float32_rsqrts_nf, float32)
 
 #ifdef TARGET_AARCH64
+DO_3OP(gvec_fmulx_h, helper_advsimd_mulxh, float16)
+DO_3OP(gvec_fmulx_s, helper_vfp_mulxs, float32)
+DO_3OP(gvec_fmulx_d, helper_vfp_mulxd, float64)
 
 DO_3OP(gvec_recps_h, helper_recpsf_f16, float16)
 DO_3OP(gvec_recps_s, helper_recpsf_f32, float32)
@@ -1385,7 +1388,7 @@ DO_MLA_IDX(gvec_mls_idx_d, uint64_t, -, H8)
 
 #undef DO_MLA_IDX
 
-#define DO_FMUL_IDX(NAME, ADD, TYPE, H)                                    \
+#define DO_FMUL_IDX(NAME, ADD, MUL, TYPE, H)                               \
 void HELPER(NAME)(void *vd, void *vn, void *vm, void *stat, uint32_t desc) \
 {                                                                          \
     intptr_t i, j, oprsz = simd_oprsz(desc);                               \
@@ -1395,33 +1398,37 @@ void HELPER(NAME)(void *vd, void *vn, void *vm, void *stat, uint32_t desc) \
     for (i = 0; i < oprsz / sizeof(TYPE); i += segment) {                  \
         TYPE mm = m[H(i + idx)];                                           \
         for (j = 0; j < segment; j++) {                                    \
-            d[i + j] = TYPE##_##ADD(d[i + j],                              \
-                                    TYPE##_mul(n[i + j], mm, stat), stat); \
+            d[i + j] = ADD(d[i + j], MUL(n[i + j], mm, stat), stat);       \
         }                                                                  \
     }                                                                      \
     clear_tail(d, oprsz, simd_maxsz(desc));                                \
 }
 
-#define float16_nop(N, M, S) (M)
-#define float32_nop(N, M, S) (M)
-#define float64_nop(N, M, S) (M)
+#define nop(N, M, S) (M)
 
-DO_FMUL_IDX(gvec_fmul_idx_h, nop, float16, H2)
-DO_FMUL_IDX(gvec_fmul_idx_s, nop, float32, H4)
-DO_FMUL_IDX(gvec_fmul_idx_d, nop, float64, H8)
+DO_FMUL_IDX(gvec_fmul_idx_h, nop, float16_mul, float16, H2)
+DO_FMUL_IDX(gvec_fmul_idx_s, nop, float32_mul, float32, H4)
+DO_FMUL_IDX(gvec_fmul_idx_d, nop, float64_mul, float64, H8)
+
+#ifdef TARGET_AARCH64
+
+DO_FMUL_IDX(gvec_fmulx_idx_h, nop, helper_advsimd_mulxh, float16, H2)
+DO_FMUL_IDX(gvec_fmulx_idx_s, nop, helper_vfp_mulxs, float32, H4)
+DO_FMUL_IDX(gvec_fmulx_idx_d, nop, helper_vfp_mulxd, float64, H8)
+
+#endif
+
+#undef nop
 
 /*
  * Non-fused multiply-accumulate operations, for Neon. NB that unlike
  * the fused ops below they assume accumulate both from and into Vd.
  */
-DO_FMUL_IDX(gvec_fmla_nf_idx_h, add, float16, H2)
-DO_FMUL_IDX(gvec_fmla_nf_idx_s, add, float32, H4)
-DO_FMUL_IDX(gvec_fmls_nf_idx_h, sub, float16, H2)
-DO_FMUL_IDX(gvec_fmls_nf_idx_s, sub, float32, H4)
+DO_FMUL_IDX(gvec_fmla_nf_idx_h, float16_add, float16_mul, float16, H2)
+DO_FMUL_IDX(gvec_fmla_nf_idx_s, float32_add, float32_mul, float32, H4)
+DO_FMUL_IDX(gvec_fmls_nf_idx_h, float16_sub, float16_mul, float16, H2)
+DO_FMUL_IDX(gvec_fmls_nf_idx_s, float32_sub, float32_mul, float32, H4)
 
-#undef float16_nop
-#undef float32_nop
-#undef float64_nop
 #undef DO_FMUL_IDX
 
 #define DO_FMLA_IDX(NAME, TYPE, H)                                         \
-- 
2.34.1

