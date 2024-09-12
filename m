Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp368471nji;
        Wed, 11 Sep 2024 19:44:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWn0I940Nw934Zqzw3soOVvri7tv66PGedHxR+cV6BWRfj1kZvH7g9mG/1vJQPlIxltJXfOmDBqWA5AaA==@linaro.org
X-Google-Smtp-Source: AGHT+IElOzbitIJ60LK4ASxZmWjf6ZOQsh05gpWSgUpWtqGp3VBa8nTd66Q6s4aWFs1Yu6550M8/
X-Received: by 2002:a05:620a:4711:b0:7a9:b1e8:46ab with SMTP id af79cd13be357-7a9e60bc220mr24327085a.19.1726109043617;
        Wed, 11 Sep 2024 19:44:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726109043; cv=none;
        d=google.com; s=arc-20240605;
        b=IQ/B13u4JtX6bStDUXdbKY/Y+FueKvFPAo75CC2kGGudjc1Z9Pt0oE5WqGneeYiPL2
         ATICySj9jBbrowAJW4iV9Gst6PDRzuhncXsmLEKTvao7+nHT3nyWgONv36V1pGpl4E2z
         O1NWB6cNpmlqpOB2RrDCI5CGVyeF51RCO06Mbo/9vKr6AA9dQyZgBUI6QoaxVb5FKNeE
         peCz0Gp0e7oSymV3/kir2JZcQTXgbwRiM5gfDsdZDEC9iDwjN1wQFBbZha+2bCVTMuAH
         OBwqmQD0fF3Bl+jrT9HH8+zLE1VAwN0XGHNuYU+TeW9BoOJnrS7ffYO2NJdDNMAvJyac
         alJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ZDwJHepg4McP05wTOzwhVlxgJAPc2iRMzc0zOXGQnHk=;
        fh=ZhBia3nL9o1nuf7SbgdYn/0pDmAeja6gisyWXi2cqYE=;
        b=OchyJU7v0vYOBqBWorqGEeoE7F3YU5JPmWgF8u4UJNmkij+aLXFAP7EDUPDtCLzpcZ
         lXUeCzpjd1N0s8DJlnZY/F/HP43uXnviZSU5TcU+6/JIWddIHNmWJ7HpR6LSLM9fGFuv
         rMrQ0Jdugr3b7322Y6tGkq1ajJbwr24vyRKqCl4EgO7+uAe52xqP/B8TFunALaMWAIvJ
         Q6FBMs675BdWsw9TzjgVlIVPoEmTgL1WXyDAbGsApAFPXeE7yFvVIHdHR1Adp5WzVY3F
         KUTWjKlJm74QYCicGPkBo2PEl9XfE4IbHB9LAatzUGLZNoPHBVT6dtp7UY/7gvTsG0k0
         diJA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IX7Q+ylT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45822fb4a07si116462891cf.574.2024.09.11.19.44.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Sep 2024 19:44:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IX7Q+ylT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1soZmL-0004Nz-W5; Wed, 11 Sep 2024 22:41:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1soZmD-0003yp-2r
 for qemu-devel@nongnu.org; Wed, 11 Sep 2024 22:41:45 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1soZmA-0004Gk-L0
 for qemu-devel@nongnu.org; Wed, 11 Sep 2024 22:41:44 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-2057c6c57b5so2197645ad.1
 for <qemu-devel@nongnu.org>; Wed, 11 Sep 2024 19:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726108901; x=1726713701; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZDwJHepg4McP05wTOzwhVlxgJAPc2iRMzc0zOXGQnHk=;
 b=IX7Q+ylTqoBfocqethqZnZLajZx06EFsezzaNok/iWqEyvb6mbLx9tbZ7v7PfKYgkw
 F1nzoHrjTdztIKVVIl/X5fsksLUTeFBv5/0CDunk0hkw6KexquhmxtRRDozXv3xI2HVQ
 PKEHlSs5Ll+31e/9yy1fLqswEVGnsAHJfYz3bv7CUGkUCeSePTqcmzzcIxfhgtHDKOEC
 DFSyUfoga4kFC7dXRVblDmbpq0jJ6hKjNfOoXzsPef1Jxubb6K9ROSSqE1ukGtLtMYf1
 AD1Eqc14cOX7y+PDLVmRucv5UcRyP9KChPyOHak/h1K5O9Fuuyh5a7MxNPLmXzQbOiBq
 f1aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726108901; x=1726713701;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZDwJHepg4McP05wTOzwhVlxgJAPc2iRMzc0zOXGQnHk=;
 b=XaHFr/C2wwTHdyi26kAW2VkmzCMG1NjE0KZQA8AsgzqhUu2XwmhW9cFrve/SksU9dO
 nReW1U3ZR7vDgShzddlDVZzAdJUO0LsDbznUcizWNfTn8Dn1swuZQCjObtRXamKE7LKb
 kfaYjAlHEtTYvnityNiaf4ArGTQtOC1gYtLP2wCYDhwrgBS5KP7IQZXncv6A8cXB2lw0
 aiSWqL3vD+1l1ay9oZMCy97HMAFJ/vbkNX5WC0NSTXceVuJIoKvsZukZB0Pr+qO9CEMF
 KBvNO0t52l05iIGTkZW7cchRE16afuALufw5QWpsmrA6fpewr4yCnt3LiChPqMyW3Ibj
 0QQg==
X-Gm-Message-State: AOJu0YxFqhSnwhVZp8QnTXbj9tn8VvRCT7MTu0HKGzn6/LSFMQoPDFVS
 N6kVTugp2KrMDBNHHJDK06GYhRVavelt384tDSuM3RD9J9OgqnNDp8XoThIsCCmPsrBZ5EoMX5r
 t
X-Received: by 2002:a17:903:183:b0:205:7998:3deb with SMTP id
 d9443c01a7336-2074c6dcc54mr91676195ad.19.1726108901307; 
 Wed, 11 Sep 2024 19:41:41 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2076afe9c61sm5635915ad.231.2024.09.11.19.41.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2024 19:41:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 28/29] target/arm: Convert vector [US]QSHRN, [US]QRSHRN,
 SQSHRUN to decodetree
Date: Wed, 11 Sep 2024 19:41:13 -0700
Message-ID: <20240912024114.1097832-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240912024114.1097832-1-richard.henderson@linaro.org>
References: <20240912024114.1097832-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: WShEzWXMG+r+

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 176 ++++++++++++++++++++++++++++++---
 target/arm/tcg/a64.decode      |  24 +++++
 2 files changed, 186 insertions(+), 14 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 77324e0145..e6290e1145 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -7163,6 +7163,122 @@ static bool do_vec_shift_imm_narrow(DisasContext *s, arg_qrri_e *a,
     return true;
 }
 
+static void gen_sqshrn_b(TCGv_i64 d, TCGv_i64 s, int64_t i)
+{
+    tcg_gen_sari_i64(d, s, i);
+    tcg_gen_ext16u_i64(d, d);
+    gen_helper_neon_narrow_sat_s8(d, tcg_env, d);
+}
+
+static void gen_sqshrn_h(TCGv_i64 d, TCGv_i64 s, int64_t i)
+{
+    tcg_gen_sari_i64(d, s, i);
+    tcg_gen_ext32u_i64(d, d);
+    gen_helper_neon_narrow_sat_s16(d, tcg_env, d);
+}
+
+static void gen_sqshrn_s(TCGv_i64 d, TCGv_i64 s, int64_t i)
+{
+    gen_sshr_d(d, s, i);
+    gen_helper_neon_narrow_sat_s32(d, tcg_env, d);
+}
+
+static void gen_uqshrn_b(TCGv_i64 d, TCGv_i64 s, int64_t i)
+{
+    tcg_gen_shri_i64(d, s, i);
+    gen_helper_neon_narrow_sat_u8(d, tcg_env, d);
+}
+
+static void gen_uqshrn_h(TCGv_i64 d, TCGv_i64 s, int64_t i)
+{
+    tcg_gen_shri_i64(d, s, i);
+    gen_helper_neon_narrow_sat_u16(d, tcg_env, d);
+}
+
+static void gen_uqshrn_s(TCGv_i64 d, TCGv_i64 s, int64_t i)
+{
+    gen_ushr_d(d, s, i);
+    gen_helper_neon_narrow_sat_u32(d, tcg_env, d);
+}
+
+static void gen_sqshrun_b(TCGv_i64 d, TCGv_i64 s, int64_t i)
+{
+    tcg_gen_sari_i64(d, s, i);
+    tcg_gen_ext16u_i64(d, d);
+    gen_helper_neon_unarrow_sat8(d, tcg_env, d);
+}
+
+static void gen_sqshrun_h(TCGv_i64 d, TCGv_i64 s, int64_t i)
+{
+    tcg_gen_sari_i64(d, s, i);
+    tcg_gen_ext32u_i64(d, d);
+    gen_helper_neon_unarrow_sat16(d, tcg_env, d);
+}
+
+static void gen_sqshrun_s(TCGv_i64 d, TCGv_i64 s, int64_t i)
+{
+    gen_sshr_d(d, s, i);
+    gen_helper_neon_unarrow_sat32(d, tcg_env, d);
+}
+
+static void gen_sqrshrn_b(TCGv_i64 d, TCGv_i64 s, int64_t i)
+{
+    gen_srshr_bhs(d, s, i);
+    tcg_gen_ext16u_i64(d, d);
+    gen_helper_neon_narrow_sat_s8(d, tcg_env, d);
+}
+
+static void gen_sqrshrn_h(TCGv_i64 d, TCGv_i64 s, int64_t i)
+{
+    gen_srshr_bhs(d, s, i);
+    tcg_gen_ext32u_i64(d, d);
+    gen_helper_neon_narrow_sat_s16(d, tcg_env, d);
+}
+
+static void gen_sqrshrn_s(TCGv_i64 d, TCGv_i64 s, int64_t i)
+{
+    gen_srshr_d(d, s, i);
+    gen_helper_neon_narrow_sat_s32(d, tcg_env, d);
+}
+
+static void gen_uqrshrn_b(TCGv_i64 d, TCGv_i64 s, int64_t i)
+{
+    gen_urshr_bhs(d, s, i);
+    gen_helper_neon_narrow_sat_u8(d, tcg_env, d);
+}
+
+static void gen_uqrshrn_h(TCGv_i64 d, TCGv_i64 s, int64_t i)
+{
+    gen_urshr_bhs(d, s, i);
+    gen_helper_neon_narrow_sat_u16(d, tcg_env, d);
+}
+
+static void gen_uqrshrn_s(TCGv_i64 d, TCGv_i64 s, int64_t i)
+{
+    gen_urshr_d(d, s, i);
+    gen_helper_neon_narrow_sat_u32(d, tcg_env, d);
+}
+
+static void gen_sqrshrun_b(TCGv_i64 d, TCGv_i64 s, int64_t i)
+{
+    gen_srshr_bhs(d, s, i);
+    tcg_gen_ext16u_i64(d, d);
+    gen_helper_neon_unarrow_sat8(d, tcg_env, d);
+}
+
+static void gen_sqrshrun_h(TCGv_i64 d, TCGv_i64 s, int64_t i)
+{
+    gen_srshr_bhs(d, s, i);
+    tcg_gen_ext32u_i64(d, d);
+    gen_helper_neon_unarrow_sat16(d, tcg_env, d);
+}
+
+static void gen_sqrshrun_s(TCGv_i64 d, TCGv_i64 s, int64_t i)
+{
+    gen_srshr_d(d, s, i);
+    gen_helper_neon_unarrow_sat32(d, tcg_env, d);
+}
+
 static WideShiftImmFn * const shrn_fns[] = {
     tcg_gen_shri_i64,
     tcg_gen_shri_i64,
@@ -7177,6 +7293,48 @@ static WideShiftImmFn * const rshrn_fns[] = {
 };
 TRANS(RSHRN_v, do_vec_shift_imm_narrow, a, rshrn_fns, 0)
 
+static WideShiftImmFn * const sqshrn_fns[] = {
+    gen_sqshrn_b,
+    gen_sqshrn_h,
+    gen_sqshrn_s,
+};
+TRANS(SQSHRN_v, do_vec_shift_imm_narrow, a, sqshrn_fns, MO_SIGN)
+
+static WideShiftImmFn * const uqshrn_fns[] = {
+    gen_uqshrn_b,
+    gen_uqshrn_h,
+    gen_uqshrn_s,
+};
+TRANS(UQSHRN_v, do_vec_shift_imm_narrow, a, uqshrn_fns, 0)
+
+static WideShiftImmFn * const sqshrun_fns[] = {
+    gen_sqshrun_b,
+    gen_sqshrun_h,
+    gen_sqshrun_s,
+};
+TRANS(SQSHRUN_v, do_vec_shift_imm_narrow, a, sqshrun_fns, MO_SIGN)
+
+static WideShiftImmFn * const sqrshrn_fns[] = {
+    gen_sqrshrn_b,
+    gen_sqrshrn_h,
+    gen_sqrshrn_s,
+};
+TRANS(SQRSHRN_v, do_vec_shift_imm_narrow, a, sqrshrn_fns, MO_SIGN)
+
+static WideShiftImmFn * const uqrshrn_fns[] = {
+    gen_uqrshrn_b,
+    gen_uqrshrn_h,
+    gen_uqrshrn_s,
+};
+TRANS(UQRSHRN_v, do_vec_shift_imm_narrow, a, uqrshrn_fns, 0)
+
+static WideShiftImmFn * const sqrshrun_fns[] = {
+    gen_sqrshrun_b,
+    gen_sqrshrun_h,
+    gen_sqrshrun_s,
+};
+TRANS(SQRSHRUN_v, do_vec_shift_imm_narrow, a, sqrshrun_fns, MO_SIGN)
+
 /*
  * Advanced SIMD Scalar Shift by Immediate
  */
@@ -10514,20 +10672,6 @@ static void disas_simd_shift_imm(DisasContext *s, uint32_t insn)
     }
 
     switch (opcode) {
-    case 0x10: /* SHRN / SQSHRUN */
-    case 0x11: /* RSHRN / SQRSHRUN */
-        if (is_u) {
-            handle_vec_simd_sqshrn(s, false, is_q, false, true, immh, immb,
-                                   opcode, rn, rd);
-        } else {
-            unallocated_encoding(s);
-        }
-        break;
-    case 0x12: /* SQSHRN / UQSHRN */
-    case 0x13: /* SQRSHRN / UQRSHRN */
-        handle_vec_simd_sqshrn(s, false, is_q, is_u, is_u, immh, immb,
-                               opcode, rn, rd);
-        break;
     case 0x1c: /* SCVTF / UCVTF */
         handle_simd_shift_intfp_conv(s, false, is_q, is_u, immh, immb,
                                      opcode, rn, rd);
@@ -10544,6 +10688,10 @@ static void disas_simd_shift_imm(DisasContext *s, uint32_t insn)
     case 0x0a: /* SHL / SLI */
     case 0x0c: /* SQSHLU */
     case 0x0e: /* SQSHL, UQSHL */
+    case 0x10: /* SHRN / SQSHRUN */
+    case 0x11: /* RSHRN / SQRSHRUN */
+    case 0x12: /* SQSHRN / UQSHRN */
+    case 0x13: /* SQRSHRN / UQRSHRN */
     case 0x14: /* SSHLL / USHLL */
         unallocated_encoding(s);
         return;
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 63e04ddfcd..042dc79d88 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -1302,6 +1302,30 @@ SQSHLU_vi       0.10 11110 .... ... 01100 1 ..... .....     @q_shli_h
 SQSHLU_vi       0.10 11110 .... ... 01100 1 ..... .....     @q_shli_s
 SQSHLU_vi       0.10 11110 .... ... 01100 1 ..... .....     @q_shli_d
 
+SQSHRN_v        0.00 11110 .... ... 10010 1 ..... .....     @q_shri_b
+SQSHRN_v        0.00 11110 .... ... 10010 1 ..... .....     @q_shri_h
+SQSHRN_v        0.00 11110 .... ... 10010 1 ..... .....     @q_shri_s
+
+UQSHRN_v        0.10 11110 .... ... 10010 1 ..... .....     @q_shri_b
+UQSHRN_v        0.10 11110 .... ... 10010 1 ..... .....     @q_shri_h
+UQSHRN_v        0.10 11110 .... ... 10010 1 ..... .....     @q_shri_s
+
+SQSHRUN_v       0.10 11110 .... ... 10000 1 ..... .....     @q_shri_b
+SQSHRUN_v       0.10 11110 .... ... 10000 1 ..... .....     @q_shri_h
+SQSHRUN_v       0.10 11110 .... ... 10000 1 ..... .....     @q_shri_s
+
+SQRSHRN_v       0.00 11110 .... ... 10011 1 ..... .....     @q_shri_b
+SQRSHRN_v       0.00 11110 .... ... 10011 1 ..... .....     @q_shri_h
+SQRSHRN_v       0.00 11110 .... ... 10011 1 ..... .....     @q_shri_s
+
+UQRSHRN_v       0.10 11110 .... ... 10011 1 ..... .....     @q_shri_b
+UQRSHRN_v       0.10 11110 .... ... 10011 1 ..... .....     @q_shri_h
+UQRSHRN_v       0.10 11110 .... ... 10011 1 ..... .....     @q_shri_s
+
+SQRSHRUN_v      0.10 11110 .... ... 10001 1 ..... .....     @q_shri_b
+SQRSHRUN_v      0.10 11110 .... ... 10001 1 ..... .....     @q_shri_h
+SQRSHRUN_v      0.10 11110 .... ... 10001 1 ..... .....     @q_shri_s
+
 # Advanced SIMD scalar shift by immediate
 
 @shri_d         .... ..... 1 ...... ..... . rn:5 rd:5   \
-- 
2.43.0

