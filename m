Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp650125ejb;
        Fri, 7 Apr 2023 19:47:48 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZITSua/gsmgDRa0f63Cax3uBr8xd6m+tJE2SDvn1yjZIAhCnuP/YPbmWwB6wd/QA7v188f
X-Received: by 2002:ac8:5754:0:b0:3e3:87a2:e7f5 with SMTP id 20-20020ac85754000000b003e387a2e7f5mr1449425qtx.11.1680922068648;
        Fri, 07 Apr 2023 19:47:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680922068; cv=none;
        d=google.com; s=arc-20160816;
        b=t5miK+X1R+c94vgOYjd3AgwOx9uBP4dieWlRqCQybfXHx62i7P5XZfhy57qwtmRdxh
         pq7GKo4k3EOCXWUEQ9Bs+nyVYXXl7EQAoPSosXJzhDYiUPc6LQvOpCr+p3m5Nv3KZQz3
         LqHzgm3rnR5Woh/GBw+g64ArRxa0fi+BClHxAOK9Ego98rbpMls5MAXhE7oR/tjKI2zK
         ajVZ+IZn8bcD6svclmrJZjjB7aKr4i670EhScMnl7ShvgGNoEKlVs0OU0Jrc/cgLkrGC
         PWL9cNhGzexjKkxcQnLYAXhuivtSd8UA5t2wmdgb84K5pzwbFoJivuDtPCU9zNOPkluP
         A2lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=+GZA6jV7eBzSRqSRmN5wL/3PVRb3+/abjeojXmp8C2g=;
        b=aVO5gJTDeuPqleSkDLPr3kA83GX/SosnSYH1kduWuOmgX9qUgHiVwzPmUEGFrIuBaP
         LGnPy8m87W39GaKd+X+xDKC+zotCb9qml2BWjKpXlDBE6nfq3nCQRkDN7IQObGL/eeOk
         PpPc3wDBFqfbP5JwACbyaDDtH1uvMGHsxkcvDPHteFVOkbLzi5IYNQk0FIGaacPJtuOf
         IWswwvCkaMyZ9xYIvnsuD3ysnsOWFxf8QwJrOeZfFP+72nmtu1hJUo1hVKVZftvVaV4+
         cwmfjaRlTAOXfeQ8Kye4D//3B0OTCRu3RfEXVMpZHz7mje0UI2ACc/GA7NAwHla5dwPK
         mXTw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oAbeF1Up;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g22-20020a05620a40d600b0074a276cae95si3979769qko.731.2023.04.07.19.47.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Apr 2023 19:47:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oAbeF1Up;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pkyZU-0001lE-RP; Fri, 07 Apr 2023 22:44:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyYz-0008Ld-VJ
 for qemu-arm@nongnu.org; Fri, 07 Apr 2023 22:44:27 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyYM-0005q2-C0
 for qemu-arm@nongnu.org; Fri, 07 Apr 2023 22:44:25 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 bp17-20020a17090b0c1100b0023f187954acso202472pjb.2
 for <qemu-arm@nongnu.org>; Fri, 07 Apr 2023 19:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680921825;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+GZA6jV7eBzSRqSRmN5wL/3PVRb3+/abjeojXmp8C2g=;
 b=oAbeF1UpgJiNW5ejl+5id4wq1CAvZ3hZFkLA5yT1AsbjgFVeaCM2m0/aBGVq5rl92Q
 FxWfF9ksp9oO7NaGMcGJvFfA9alY0i5cD7cFCaZmO2/0hcJR0FJgIyvpAYEU+MCpWS9o
 s8PP3dvrzLx22EHIcFFM5elnSnkl0hrZwtV2IdvGf7fzkigv2i2v6QQ8Ga/s+Liesv1k
 4RdjkNfaMGo/u8RKhD9j76z7wqKyjZwdmTe8KuJmz8wpPsYHNwiuT5F6iBOcfvKsaNIL
 iEoNscgN6bqWMfFTp/lGsSY9yVm52DwMdNLLa+c/GN1supUeE/A4IkLnAtkcOUbNNzoW
 D50A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680921825;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+GZA6jV7eBzSRqSRmN5wL/3PVRb3+/abjeojXmp8C2g=;
 b=yICbRDLJ+bj9kCAFrKHhgH92S0QeTVnsyzazRIMBHUxlxy9eGdHzvzp0mflXZANaEm
 ZBeYZRPCXyNzcyFf5Zmvj7LRBfoNRyp/S0MRf1nLhNMzDLGsZ0oPVgMuVOd0wQUwJ+4Z
 mfGE0hRp7cty5n60EvWUv1qS4hL+PyPZj/pkGO6D5OcQ5FKk5L54EXKMVMB+ctNWThvV
 rCnqx16shaWIz7w3q9xoRxRLkE1gLm1DzSxLn4mXP52TPI/zmp6zgGtnZeMt5z6eJ3ZO
 Jmwm6echJCTYIjz0RhmBx6yRPdKWYAyceaP7c9ArVDfTwMr15SsjGs8hHNNOVcErAtKq
 Nlvg==
X-Gm-Message-State: AAQBX9ccRmDnXWKqdnARxttVJ3WgF1tApXo/D87fn95yLEG+JfQ89BAI
 b09VAXA7GUJwt5zS5cyqWE4JnQ==
X-Received: by 2002:a17:903:784:b0:19f:3b86:4710 with SMTP id
 kn4-20020a170903078400b0019f3b864710mr537347plb.49.1680921825067; 
 Fri, 07 Apr 2023 19:43:45 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a170902c18900b0019d397b0f18sm3530780pld.214.2023.04.07.19.43.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 19:43:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH 32/42] tcg/loongarch64: Simplify constraints on qemu_ld/st
Date: Fri,  7 Apr 2023 19:43:04 -0700
Message-Id: <20230408024314.3357414-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230408024314.3357414-1-richard.henderson@linaro.org>
References: <20230408024314.3357414-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
X-TUID: WuwFLtM7QDxs

The softmmu tlb uses TCG_REG_TMP[0-2], not any of the normally available
registers.  Now that we handle overlap betwen inputs and helper arguments,
we can allow any allocatable reg.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/loongarch64/tcg-target-con-set.h |  2 --
 tcg/loongarch64/tcg-target-con-str.h |  1 -
 tcg/loongarch64/tcg-target.c.inc     | 23 ++++-------------------
 3 files changed, 4 insertions(+), 22 deletions(-)

diff --git a/tcg/loongarch64/tcg-target-con-set.h b/tcg/loongarch64/tcg-target-con-set.h
index 172c107289..c2bde44613 100644
--- a/tcg/loongarch64/tcg-target-con-set.h
+++ b/tcg/loongarch64/tcg-target-con-set.h
@@ -17,9 +17,7 @@
 C_O0_I1(r)
 C_O0_I2(rZ, r)
 C_O0_I2(rZ, rZ)
-C_O0_I2(LZ, L)
 C_O1_I1(r, r)
-C_O1_I1(r, L)
 C_O1_I2(r, r, rC)
 C_O1_I2(r, r, ri)
 C_O1_I2(r, r, rI)
diff --git a/tcg/loongarch64/tcg-target-con-str.h b/tcg/loongarch64/tcg-target-con-str.h
index 541ff47fa9..6e9ccca3ad 100644
--- a/tcg/loongarch64/tcg-target-con-str.h
+++ b/tcg/loongarch64/tcg-target-con-str.h
@@ -14,7 +14,6 @@
  * REGS(letter, register_mask)
  */
 REGS('r', ALL_GENERAL_REGS)
-REGS('L', ALL_GENERAL_REGS & ~SOFTMMU_RESERVE_REGS)
 
 /*
  * Define constraint letters for constants:
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index fb092330d4..d5063b035d 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -133,18 +133,7 @@ static TCGReg tcg_target_call_oarg_reg(TCGCallReturnKind kind, int slot)
 #define TCG_CT_CONST_C12   0x1000
 #define TCG_CT_CONST_WSZ   0x2000
 
-#define ALL_GENERAL_REGS      MAKE_64BIT_MASK(0, 32)
-/*
- * For softmmu, we need to avoid conflicts with the first 5
- * argument registers to call the helper.  Some of these are
- * also used for the tlb lookup.
- */
-#ifdef CONFIG_SOFTMMU
-#define SOFTMMU_RESERVE_REGS  MAKE_64BIT_MASK(TCG_REG_A0, 5)
-#else
-#define SOFTMMU_RESERVE_REGS  0
-#endif
-
+#define ALL_GENERAL_REGS   MAKE_64BIT_MASK(0, 32)
 
 static inline tcg_target_long sextreg(tcg_target_long val, int pos, int len)
 {
@@ -1599,16 +1588,14 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_st32_i64:
     case INDEX_op_st_i32:
     case INDEX_op_st_i64:
+    case INDEX_op_qemu_st_i32:
+    case INDEX_op_qemu_st_i64:
         return C_O0_I2(rZ, r);
 
     case INDEX_op_brcond_i32:
     case INDEX_op_brcond_i64:
         return C_O0_I2(rZ, rZ);
 
-    case INDEX_op_qemu_st_i32:
-    case INDEX_op_qemu_st_i64:
-        return C_O0_I2(LZ, L);
-
     case INDEX_op_ext8s_i32:
     case INDEX_op_ext8s_i64:
     case INDEX_op_ext8u_i32:
@@ -1644,11 +1631,9 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_ld32u_i64:
     case INDEX_op_ld_i32:
     case INDEX_op_ld_i64:
-        return C_O1_I1(r, r);
-
     case INDEX_op_qemu_ld_i32:
     case INDEX_op_qemu_ld_i64:
-        return C_O1_I1(r, L);
+        return C_O1_I1(r, r);
 
     case INDEX_op_andc_i32:
     case INDEX_op_andc_i64:
-- 
2.34.1

