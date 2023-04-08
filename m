Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp650240ejb;
        Fri, 7 Apr 2023 19:48:13 -0700 (PDT)
X-Google-Smtp-Source: AKy350azSSXTSlsqCh9d0S2vyAd5GO+vwP/yrWS+XwFwyJdbTJanEWg4GYl5WYKE0EypP/V26jbv
X-Received: by 2002:ac8:5c92:0:b0:3e4:e2af:adcf with SMTP id r18-20020ac85c92000000b003e4e2afadcfmr7020389qta.57.1680922093092;
        Fri, 07 Apr 2023 19:48:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680922093; cv=none;
        d=google.com; s=arc-20160816;
        b=jlShmbTlFLtU5PN5i0bBs02DdMioRKfO3u2z9cDcHzW0Y4sm5mpA7xv4VjIGgJxuun
         10X7WhB6WVs6zzVtKgeLLBqdLdMPwORpyW0R1tCuotH+BDFZLRozX/oHTpVyVM79EEpb
         24Y8y01/WxY1lKqOXLrGpj9Q1k+sVsOTfCphXeZVn4RJ2O0sim/TwY96jWcOEa3SNfVP
         TRaQ8cp7vrUQnuMkrG8SZD3rEQmKmjyu6VTw8AnsAAU+Ra/yD1rblfNa+CARzgPgvMMZ
         m5PHYjdPJkbSZFSjAEucX2rMo+85MlU7g1uzts2wzSHKLT/txnPTLWEcc0WM9t5xQ7eP
         BahA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=U3GgpyquLQob+XRXyWgnv31s/PrsIm2aDbl8H8cAcdI=;
        b=jLeRBj70MW9JhfXyEKxUwwuLWLVnEYBYRmhxN5Cvg0eGPo8KO9ewGKDt1umQ6lHFG2
         DqBcQv5mjuyLTnzr6JyqFoLSHYll9uwT0QJyPUlWzgtGcVH7mbZooFMYb2QYY5/+sO4r
         vWK2QeMWWgs/vxhC3r9l1IXxXs20haFvCXUcWiJbUqR3Z9Yvbzec2Hw96mzmM6anqIa5
         yLlXI302jOW8A57uFo2UKE5M977G9iqK29ObvW3W/9Nq4i8L/TnnobYaRvgZhjYZ5fjY
         Ao82KegQ21IUbTj0aVwVcCg7UKAG0dNZTc89aEKLM1Wr2WAnuiZM+LeSzv1WIAgXRPPM
         o7LA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="l63T0M/V";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a18-20020a05622a02d200b003e4e228cfd2si3636792qtx.761.2023.04.07.19.48.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Apr 2023 19:48:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="l63T0M/V";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pkybS-0003Gm-Bt; Fri, 07 Apr 2023 22:46:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkybP-0002zf-36
 for qemu-arm@nongnu.org; Fri, 07 Apr 2023 22:46:55 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkybM-0007mZ-Vq
 for qemu-arm@nongnu.org; Fri, 07 Apr 2023 22:46:54 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 nh20-20020a17090b365400b0024496d637e1so5607976pjb.5
 for <qemu-arm@nongnu.org>; Fri, 07 Apr 2023 19:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680922011;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U3GgpyquLQob+XRXyWgnv31s/PrsIm2aDbl8H8cAcdI=;
 b=l63T0M/V0iYGfYGWtNcXzE4Gt1VySSif84TJXZrITNNiJd49pcV85U/uX6922iUN4M
 UkFVfZhx9NZrohCaUZERwV3RS7A8ELtiPWt8TuSg1/JxnCIcs3dXzlpg1vQxR1A0cY3O
 MEHvia/+AMIRsE3NCQp2F/6YAXQA92LEVXIIAAA+QvnFa1nOlguuZYagIJF2UEb2ElK/
 BO3uiV0KDg79C8vS+OHABK7G9NjlMVuviqbOV1FcMIOG+OY0kItBs2A1l5Mo3JrCkTyc
 9rvuM/is0LPtqE95FzfUlzpPN2In8XjHpbt4PgznB698mN1hpv8SHLOn+pfZkbJcrtc3
 lYLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680922011;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U3GgpyquLQob+XRXyWgnv31s/PrsIm2aDbl8H8cAcdI=;
 b=7NBk1QCqtrUTLBcWtvhUHe5e/HMptpzFEWSeViD6HtA3zI6q/Z8XrbFadpoC6iSHUa
 h3ZyGKzB0ERJDEY5eW0Wy9BdmE4xzGeAdGO5z0URpnIf5ToNmk2abWDR5vXcRVE5OgbI
 6cklD+Rzuyttx9FDGuCsTJNL6O6T1/GVkBzEft2enmPMsxCLdpGQWZt0KjjgPVqahy4C
 LReGWgxE6KOdc2IVQEKoleZuUw5qHmabfUXckzePjxjjYJsZl8ekzw6kz77anc76U5er
 slLlV9kPwEsxUZ6Am0wdqUWXWoi/j3uPVCEhSwmZiLFsBBOFLSHq2rLVwuLLGKSCIV+8
 LQDQ==
X-Gm-Message-State: AAQBX9fPpBS3jDz+dVm1bJKUlrUBQ2kY+aRRbUu9UDfVqUDA5wr/0ppp
 TH281atTj2BeKAcdkXwKD2JVaA==
X-Received: by 2002:a17:902:e0d4:b0:1a1:d655:1ce4 with SMTP id
 e20-20020a170902e0d400b001a1d6551ce4mr3891401pla.38.1680922011406; 
 Fri, 07 Apr 2023 19:46:51 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 k16-20020a170902761000b0019aa8149cc9sm3551981pll.35.2023.04.07.19.46.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 19:46:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH 39/42] tcg/s390x: Use ALGFR in constructing host address for
 qemu_ld/st
Date: Fri,  7 Apr 2023 19:43:11 -0700
Message-Id: <20230408024314.3357414-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230408024314.3357414-1-richard.henderson@linaro.org>
References: <20230408024314.3357414-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: B5HKBdSQlMvf

Rather than zero-extend the guest address into a register,
use an add instruction which zero-extends the second input.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.c.inc | 38 ++++++++++++++++++++++----------------
 1 file changed, 22 insertions(+), 16 deletions(-)

diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 7d6cb30a06..b53eb70f24 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -149,6 +149,7 @@ typedef enum S390Opcode {
     RRE_ALGR    = 0xb90a,
     RRE_ALCR    = 0xb998,
     RRE_ALCGR   = 0xb988,
+    RRE_ALGFR   = 0xb91a,
     RRE_CGR     = 0xb920,
     RRE_CLGR    = 0xb921,
     RRE_DLGR    = 0xb987,
@@ -1716,8 +1717,10 @@ static void tcg_out_qemu_st_direct(TCGContext *s, MemOp opc, TCGReg data,
 QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) > 0);
 QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) < -(1 << 19));
 
-/* Load and compare a TLB entry, leaving the flags set.  Loads the TLB
-   addend into R2.  Returns a register with the santitized guest address.  */
+/*
+ * Load and compare a TLB entry, leaving the flags set.
+ * Loads the TLB addend and returns the register.
+ */
 static TCGReg tcg_out_tlb_read(TCGContext *s, TCGReg addr_reg, MemOp opc,
                                int mem_index, bool is_ld)
 {
@@ -1761,12 +1764,7 @@ static TCGReg tcg_out_tlb_read(TCGContext *s, TCGReg addr_reg, MemOp opc,
 
     tcg_out_insn(s, RXY, LG, TCG_REG_R2, TCG_REG_R2, TCG_REG_NONE,
                  offsetof(CPUTLBEntry, addend));
-
-    if (TARGET_LONG_BITS == 32) {
-        tcg_out_ext32u(s, TCG_REG_R3, addr_reg);
-        return TCG_REG_R3;
-    }
-    return addr_reg;
+    return TCG_REG_R2;
 }
 
 static void add_qemu_ldst_label(TCGContext *s, bool is_ld, MemOpIdx oi,
@@ -1888,16 +1886,20 @@ static void tcg_out_qemu_ld(TCGContext* s, TCGReg data_reg, TCGReg addr_reg,
 #ifdef CONFIG_SOFTMMU
     unsigned mem_index = get_mmuidx(oi);
     tcg_insn_unit *label_ptr;
-    TCGReg base_reg;
+    TCGReg addend;
 
-    base_reg = tcg_out_tlb_read(s, addr_reg, opc, mem_index, 1);
+    addend = tcg_out_tlb_read(s, addr_reg, opc, mem_index, 1);
 
     tcg_out16(s, RI_BRC | (S390_CC_NE << 4));
     label_ptr = s->code_ptr;
     s->code_ptr += 1;
 
-    tcg_out_qemu_ld_direct(s, opc, data_reg, base_reg, TCG_REG_R2, 0);
-
+    if (TARGET_LONG_BITS == 32) {
+        tcg_out_insn(s, RRE, ALGFR, addend, addr_reg);
+        tcg_out_qemu_ld_direct(s, opc, data_reg, addend, TCG_REG_NONE, 0);
+    } else {
+        tcg_out_qemu_ld_direct(s, opc, data_reg, addend, addr_reg, 0);
+    }
     add_qemu_ldst_label(s, 1, oi, d_type, data_reg, addr_reg,
                         s->code_ptr, label_ptr);
 #else
@@ -1920,16 +1922,20 @@ static void tcg_out_qemu_st(TCGContext* s, TCGReg data_reg, TCGReg addr_reg,
 #ifdef CONFIG_SOFTMMU
     unsigned mem_index = get_mmuidx(oi);
     tcg_insn_unit *label_ptr;
-    TCGReg base_reg;
+    TCGReg addend;
 
-    base_reg = tcg_out_tlb_read(s, addr_reg, opc, mem_index, 0);
+    addend = tcg_out_tlb_read(s, addr_reg, opc, mem_index, 0);
 
     tcg_out16(s, RI_BRC | (S390_CC_NE << 4));
     label_ptr = s->code_ptr;
     s->code_ptr += 1;
 
-    tcg_out_qemu_st_direct(s, opc, data_reg, base_reg, TCG_REG_R2, 0);
-
+    if (TARGET_LONG_BITS == 32) {
+        tcg_out_insn(s, RRE, ALGFR, addend, addr_reg);
+        tcg_out_qemu_st_direct(s, opc, data_reg, addend, TCG_REG_NONE, 0);
+    } else {
+        tcg_out_qemu_st_direct(s, opc, data_reg, addend, addr_reg, 0);
+    }
     add_qemu_ldst_label(s, 0, oi, d_type, data_reg, addr_reg,
                         s->code_ptr, label_ptr);
 #else
-- 
2.34.1

