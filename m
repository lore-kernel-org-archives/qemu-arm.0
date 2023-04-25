Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp3719203ejm;
        Tue, 25 Apr 2023 12:39:46 -0700 (PDT)
X-Google-Smtp-Source: AKy350bX9NGWTh1q+tzHxIOSn1TKPe6dv/oCzwYizZWjsL03OqcO+Hz8WGiQjpJUuVcmKMOle2ms
X-Received: by 2002:ad4:5b8f:0:b0:5ea:2575:dccb with SMTP id 15-20020ad45b8f000000b005ea2575dccbmr29117467qvp.46.1682451586643;
        Tue, 25 Apr 2023 12:39:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682451586; cv=none;
        d=google.com; s=arc-20160816;
        b=jCHurt/E6g+NpUp/yGbMyz2wkzoQmFjHujH+xePw0/m6hh8IXCjd5rhScvp+WHpkG1
         F79h3BRxNi/8oaKc20PosNx3WC0oJTBmqNDCvJzxAE8iCgJEqUYCoAwPWVZaW/tXz94S
         sqNWLt1J7YZfs7AWiKARUg7grzNUK5bsjePjf3DbgNZi1EAB6abbeXRhlZgdhvqehfqa
         076Lunk9dG2nvBpnAHnmq6KpCAjPOtU9eboe9iolO4VnfWxIkhr1Bl39Fyv39zxH7FE0
         V38kGzocOWpHuBL8KmIMvecLT/2IW+aQSM7PBAT5nIdkAqEd+jNzZD9/eYu0Hp65oqWa
         yxeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=szr01PFwF0Du6v147zPw0I7dg80IAC207oSuL39I73s=;
        b=qgL7Qg0wiqs+hI0F8cHvzXW12+aPPDfLvrdhJM4OXIyyTq0OTCSV6Vhsmv6kzdu7t6
         0EESyMIW/5GpdKnbI7y2Ab6NQeS91zlW3xDQa7shkAFcTGfGMJN5DsWwN/OKz3WBhfBp
         cU/bszBhUURY+v/tMNCCTZ15s4muBALLuJJg37HuslT+p4jJcFRqV6/3EencXYteI6Oi
         0Tv3nk1AJJlI+gTlHHwznViH8JHPDLBJROsWdvbXj47RjstOnPyz3eC6nbPZ0gKpE4RQ
         yncJGUrFHK/zp0hV/0KmX3sKGQZdWizkkbmDqWdGSXYRsvpGjmUveeW8YI+cLU2yU4q9
         SXwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="VrveoN/r";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a192-20020ae9e8c9000000b007468416c099si8754820qkg.582.2023.04.25.12.39.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Apr 2023 12:39:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="VrveoN/r";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1prOS1-0005qr-Du; Tue, 25 Apr 2023 15:35:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prORD-0004Ns-Hm
 for qemu-arm@nongnu.org; Tue, 25 Apr 2023 15:34:58 -0400
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOR7-000554-Sc
 for qemu-arm@nongnu.org; Tue, 25 Apr 2023 15:34:55 -0400
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2a8c28158e2so59848191fa.0
 for <qemu-arm@nongnu.org>; Tue, 25 Apr 2023 12:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682451288; x=1685043288;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=szr01PFwF0Du6v147zPw0I7dg80IAC207oSuL39I73s=;
 b=VrveoN/r5Dd+JVtZDqk6fcDBrrHz2MEgYqjQeBrvr0TMPgHJQ3xbxUn9nK325NtnEL
 sMi5fIEmxHPFxU8Y6vnUSfBSbp6T00jw40hm7PkkpYrMjI/Z2/SdrmjTYhUpBHiRpyGq
 iyPSazOiwVayn74u11iA/oT5Mi53XXYlKPlm7br5MTaTU/Jmg3yifpw1xclaCU2S9hOy
 8Ac70MqaRQhTzrsqmg8JjE5K0d2dARJvJSACJw8TdUo2Kd9MaFVLimhuOjirQrAMGQfZ
 K5jl8037TdBF4+ehhy6m5rx34qgLTrPxi1lgMdMOw1G6s+13nvcOEp/sQdvdnr6cwLgm
 fEdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682451288; x=1685043288;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=szr01PFwF0Du6v147zPw0I7dg80IAC207oSuL39I73s=;
 b=AnjJaTnH9elKDpv+IZfM/fqFDSA+UX4VBW+sdtrM3Af8b6ukZAALVK5TvEiFMIiOV9
 hn1hC2VTaRkbCzoGYuSYsgxzikQCqlZ+6EDxFHHRYJSBhX5WbxC/dCQv0P3Bc4XsB8lO
 RI1K3bie37FnfpzgtTgktjJnhNUxtudMIRxMC6AiD6Wkv5A/aFWXgCCY8dhxA4wRvhpT
 aXWPk3rDL6dmTGX5A5j7rr4jJ5iu8z7F2rJCjR+HjxLwPHU82GzBDQ1ROe21BGQujkfg
 KoirwaL+3ViehZIffLEZ93FtS9WEQZ2HHF+PRFRV12SbVsycBrEjcWsV5C3VaHnBdys+
 Uc4A==
X-Gm-Message-State: AAQBX9feg31G0SokD0IePJcQdsoHMAqJ6WFE4srisOQIYHqBDX/6mr/A
 1y9olVCixgExnZ61r/FFUJr+cg==
X-Received: by 2002:a2e:90d5:0:b0:2a8:b168:981f with SMTP id
 o21-20020a2e90d5000000b002a8b168981fmr3545705ljg.46.1682451288322; 
 Tue, 25 Apr 2023 12:34:48 -0700 (PDT)
Received: from stoup.. ([91.209.212.61]) by smtp.gmail.com with ESMTPSA id
 z23-20020a2e8857000000b002a8c271de33sm2160484ljj.67.2023.04.25.12.34.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 12:34:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 philmd@linaro.org
Subject: [PATCH v3 31/57] tcg/sparc64: Rename tcg_out_movi_imm13 to
 tcg_out_movi_s13
Date: Tue, 25 Apr 2023 20:31:20 +0100
Message-Id: <20230425193146.2106111-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425193146.2106111-1-richard.henderson@linaro.org>
References: <20230425193146.2106111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::229;
 envelope-from=richard.henderson@linaro.org; helo=mail-lj1-x229.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: oi15Ve0BFrZm

Emphasize that the constant is signed.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/sparc64/tcg-target.c.inc | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index 64464ab363..2e6127d506 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -399,7 +399,7 @@ static void tcg_out_sethi(TCGContext *s, TCGReg ret, uint32_t arg)
     tcg_out32(s, SETHI | INSN_RD(ret) | ((arg & 0xfffffc00) >> 10));
 }
 
-static void tcg_out_movi_imm13(TCGContext *s, TCGReg ret, int32_t arg)
+static void tcg_out_movi_s13(TCGContext *s, TCGReg ret, int32_t arg)
 {
     tcg_out_arithi(s, ret, TCG_REG_G0, arg, ARITH_OR);
 }
@@ -408,7 +408,7 @@ static void tcg_out_movi_imm32(TCGContext *s, TCGReg ret, int32_t arg)
 {
     if (check_fit_i32(arg, 13)) {
         /* A 13-bit constant sign-extended to 64-bits.  */
-        tcg_out_movi_imm13(s, ret, arg);
+        tcg_out_movi_s13(s, ret, arg);
     } else {
         /* A 32-bit constant zero-extended to 64 bits.  */
         tcg_out_sethi(s, ret, arg);
@@ -425,15 +425,15 @@ static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
     tcg_target_long hi, lo = (int32_t)arg;
     tcg_target_long test, lsb;
 
-    /* A 32-bit constant, or 32-bit zero-extended to 64-bits.  */
-    if (type == TCG_TYPE_I32 || arg == (uint32_t)arg) {
-        tcg_out_movi_imm32(s, ret, arg);
+    /* A 13-bit constant sign-extended to 64-bits.  */
+    if (check_fit_tl(arg, 13)) {
+        tcg_out_movi_s13(s, ret, arg);
         return;
     }
 
-    /* A 13-bit constant sign-extended to 64-bits.  */
-    if (check_fit_tl(arg, 13)) {
-        tcg_out_movi_imm13(s, ret, arg);
+    /* A 32-bit constant, or 32-bit zero-extended to 64-bits.  */
+    if (type == TCG_TYPE_I32 || arg == (uint32_t)arg) {
+        tcg_out_movi_imm32(s, ret, arg);
         return;
     }
 
@@ -767,7 +767,7 @@ static void tcg_out_setcond_i32(TCGContext *s, TCGCond cond, TCGReg ret,
 
     default:
         tcg_out_cmp(s, c1, c2, c2const);
-        tcg_out_movi_imm13(s, ret, 0);
+        tcg_out_movi_s13(s, ret, 0);
         tcg_out_movcc(s, cond, MOVCC_ICC, ret, 1, 1);
         return;
     }
@@ -803,11 +803,11 @@ static void tcg_out_setcond_i64(TCGContext *s, TCGCond cond, TCGReg ret,
     /* For 64-bit signed comparisons vs zero, we can avoid the compare
        if the input does not overlap the output.  */
     if (c2 == 0 && !is_unsigned_cond(cond) && c1 != ret) {
-        tcg_out_movi_imm13(s, ret, 0);
+        tcg_out_movi_s13(s, ret, 0);
         tcg_out_movr(s, cond, ret, c1, 1, 1);
     } else {
         tcg_out_cmp(s, c1, c2, c2const);
-        tcg_out_movi_imm13(s, ret, 0);
+        tcg_out_movi_s13(s, ret, 0);
         tcg_out_movcc(s, cond, MOVCC_XCC, ret, 1, 1);
     }
 }
@@ -844,7 +844,7 @@ static void tcg_out_addsub2_i64(TCGContext *s, TCGReg rl, TCGReg rh,
     if (use_vis3_instructions && !is_sub) {
         /* Note that ADDXC doesn't accept immediates.  */
         if (bhconst && bh != 0) {
-           tcg_out_movi_imm13(s, TCG_REG_T2, bh);
+           tcg_out_movi_s13(s, TCG_REG_T2, bh);
            bh = TCG_REG_T2;
         }
         tcg_out_arith(s, rh, ah, bh, ARITH_ADDXC);
@@ -866,7 +866,7 @@ static void tcg_out_addsub2_i64(TCGContext *s, TCGReg rl, TCGReg rh,
          * so the adjustment fits 12 bits.
          */
         if (bhconst) {
-            tcg_out_movi_imm13(s, TCG_REG_T2, bh + (is_sub ? -1 : 1));
+            tcg_out_movi_s13(s, TCG_REG_T2, bh + (is_sub ? -1 : 1));
         } else {
             tcg_out_arithi(s, TCG_REG_T2, bh, 1,
                            is_sub ? ARITH_SUB : ARITH_ADD);
@@ -1036,7 +1036,7 @@ static void tcg_target_qemu_prologue(TCGContext *s)
     tcg_code_gen_epilogue = tcg_splitwx_to_rx(s->code_ptr);
     tcg_out_arithi(s, TCG_REG_G0, TCG_REG_I7, 8, RETURN);
     /* delay slot */
-    tcg_out_movi_imm13(s, TCG_REG_O0, 0);
+    tcg_out_movi_s13(s, TCG_REG_O0, 0);
 
     build_trampolines(s);
 }
@@ -1430,7 +1430,7 @@ static void tcg_out_exit_tb(TCGContext *s, uintptr_t a0)
 {
     if (check_fit_ptr(a0, 13)) {
         tcg_out_arithi(s, TCG_REG_G0, TCG_REG_I7, 8, RETURN);
-        tcg_out_movi_imm13(s, TCG_REG_O0, a0);
+        tcg_out_movi_s13(s, TCG_REG_O0, a0);
         return;
     } else {
         intptr_t tb_diff = tcg_tbrel_diff(s, (void *)a0);
-- 
2.34.1

