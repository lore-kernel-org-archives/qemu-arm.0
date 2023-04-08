Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp649146ejb;
        Fri, 7 Apr 2023 19:44:48 -0700 (PDT)
X-Google-Smtp-Source: AKy350b33/PqdpNVuNI/cG3qHcLg1LJPjnrO/+hWwPrJVH/cPP9qxrNEJYLA3GnpT/UTa647pVo8
X-Received: by 2002:a05:6214:2461:b0:5e0:5ea6:69cc with SMTP id im1-20020a056214246100b005e05ea669ccmr9170259qvb.0.1680921888005;
        Fri, 07 Apr 2023 19:44:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680921887; cv=none;
        d=google.com; s=arc-20160816;
        b=ApGxvMYIRWSlZ83bn5eYHEtUiyUGQ1sfoQQyGXdnANxIgBr1uyKW8cS2K6ArP+EuZM
         18iry7bAJACtB+wgFVUKN+sxBni5OpdfyddYdybJXxC3yJzkCVQRRVotW9XEPy3/HrZD
         9zAsSvspV3rXPcTFvUjr5MvD1NbHpXeFTNHyDWqVM2hsVqtwfxWLn8Mc2DAN3zpF/33O
         Ume9Yh2ALhslR9YNNXfpE9Twx1ZImkEsXgqx/PjrNGzpWtXjHr2PGFRw+KEOmFqnZ/61
         fCLQPjQxfF5uoVPHFWhDG5yHVf6mzzFhBur9Z9THEmpPdHyYnT6cq38cSWfGp//jdiH2
         U/Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=LGjnlvYQSu/kSuYcDZLUvskA3987iSuGFI1KchA2Z08=;
        b=zyJw3CNVkdd8AdH76Pksfuhtjf196/8q9uNZkmkbpNXy04Sf5w4EmMRaO9lxV/onp2
         jwZXZr+5C1HO+LDkJdEOVEKZ3oTyTBPztjAto26ftzXgcGsE4ZWSWz83WbyrqIJrreRT
         5tAdr6lRgVohVTKESWg6DyglSEAie19nvvg7mXrHnakt+5jTDA+ysTZG4bSYp6vKXN1j
         PSnBq54kI/t90XONjgSRsd3QB1fW1iGf2/3wWiJTjY6q0/g0E5YhtUyu30/PRMrpGdLy
         XKrduWRyZXTqx5DPP1/zl6LXphgkkbVyUdK5iBxF60fFVevtSq4muo7qHj6SgIwCVPw7
         7hOw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Z8GtQY3S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a7-20020ad45c47000000b005e0fb768dc8si3948082qva.178.2023.04.07.19.44.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Apr 2023 19:44:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Z8GtQY3S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pkyYX-0007eT-U3; Fri, 07 Apr 2023 22:43:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyYV-0007a7-Ni
 for qemu-arm@nongnu.org; Fri, 07 Apr 2023 22:43:55 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyY9-0005gp-DW
 for qemu-arm@nongnu.org; Fri, 07 Apr 2023 22:43:55 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 l9-20020a17090a3f0900b0023d32684e7fso9062778pjc.1
 for <qemu-arm@nongnu.org>; Fri, 07 Apr 2023 19:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680921812;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LGjnlvYQSu/kSuYcDZLUvskA3987iSuGFI1KchA2Z08=;
 b=Z8GtQY3SO574Z9GG/nhpRNIqhg8qs0YkjhWRnjCG9s/W6IctPyDr/W37uouC5fPkue
 8LQUv7cQkSg7GLfZm47+X3QAlRoD2v/OJqAH+90c8t2CB9KWBROESSM1ffOFtCkUH2Pl
 xk77lh8Iy77TpeExT6r7jyUmVDDRUJMTad7MaA9tkDu4e9wzB6sh0vp5pwdXu84w9cIz
 CbZiLOjyW3HMNIVbMLp/O4dDLnsGS5MmcJrj7UOyNWq+bD9z+c5JqU0lXI/vbk55FOl5
 zRWBUehMwVBsNOX+gEBILrlcsji7hJEkwpS6SUKbtvuBajTvA0NdEyl6YPqtng1HklPh
 6M0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680921812;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LGjnlvYQSu/kSuYcDZLUvskA3987iSuGFI1KchA2Z08=;
 b=lmLBdj+LdY0AaHo5HhNmbYt98SzaawYXzcnL1ry1Kt76yZnkS1ToAwyRd4JGj9Nibo
 EizaTFQS54U4rccUondy3Vqx4QKhoHlVIXg0gCTHvU/w5jta1waMQbmhzEAAuEx/2VhN
 ndruG54X+9EW5rhgRP4TrpE359hMGPh+tUbPdmZpcvJJ/YZbO4AiC619Ul1+cJUINNVr
 NEEtrRiNxk3AKrRdXyMfUJmRLxJpGWQI+RlnA+rfJ16d97iwh6Y+guzGO4a5xoCWLqW6
 n1+W72oZ6qM/rEmDlHbzxDqmjSCkfRuYxhLjqYbdB/0RpwyHBXTwDV60Y4xNo0WrTX1M
 4wrQ==
X-Gm-Message-State: AAQBX9eNlEeiBvs1QqHPvqyaaE4aaptdEETkLb1W7JacPkCVqqFWNxDO
 5UxYygHvLzbpUeNRjY2MPo1ccQ==
X-Received: by 2002:a17:903:110f:b0:19e:8088:b852 with SMTP id
 n15-20020a170903110f00b0019e8088b852mr5432193plh.10.1680921811941; 
 Fri, 07 Apr 2023 19:43:31 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a170902c18900b0019d397b0f18sm3530780pld.214.2023.04.07.19.43.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 19:43:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH 17/42] tcg: Introduce tcg_out_xchg
Date: Fri,  7 Apr 2023 19:42:49 -0700
Message-Id: <20230408024314.3357414-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230408024314.3357414-1-richard.henderson@linaro.org>
References: <20230408024314.3357414-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
X-TUID: w7B72gkc8orR

We will want a backend interface for register swapping.
This is only properly defined for x86; all others get a
stub version that always indicates failure.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c                        | 2 ++
 tcg/aarch64/tcg-target.c.inc     | 5 +++++
 tcg/arm/tcg-target.c.inc         | 5 +++++
 tcg/i386/tcg-target.c.inc        | 8 ++++++++
 tcg/loongarch64/tcg-target.c.inc | 5 +++++
 tcg/mips/tcg-target.c.inc        | 5 +++++
 tcg/ppc/tcg-target.c.inc         | 5 +++++
 tcg/riscv/tcg-target.c.inc       | 5 +++++
 tcg/s390x/tcg-target.c.inc       | 5 +++++
 tcg/sparc64/tcg-target.c.inc     | 5 +++++
 tcg/tci/tcg-target.c.inc         | 5 +++++
 11 files changed, 55 insertions(+)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 6fe7dd6564..d82d99e1b0 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -115,6 +115,8 @@ static void tcg_out_exts_i32_i64(TCGContext *s, TCGReg ret, TCGReg arg);
 static void tcg_out_extu_i32_i64(TCGContext *s, TCGReg ret, TCGReg arg);
 static void tcg_out_extrl_i64_i32(TCGContext *s, TCGReg ret, TCGReg arg);
 static void tcg_out_addi_ptr(TCGContext *s, TCGReg, TCGReg, tcg_target_long);
+static bool tcg_out_xchg(TCGContext *s, TCGType type, TCGReg r1, TCGReg r2)
+    __attribute__((unused));
 static void tcg_out_exit_tb(TCGContext *s, uintptr_t arg);
 static void tcg_out_goto_tb(TCGContext *s, int which);
 static void tcg_out_op(TCGContext *s, TCGOpcode opc,
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 29bc97ed1c..4ec3cf3172 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1106,6 +1106,11 @@ static void tcg_out_movi(TCGContext *s, TCGType type, TCGReg rd,
     tcg_out_insn(s, 3305, LDR, 0, rd);
 }
 
+static bool tcg_out_xchg(TCGContext *s, TCGType type, TCGReg r1, TCGReg r2)
+{
+    return false;
+}
+
 static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
                              tcg_target_long imm)
 {
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index f865294861..4a5d57a41c 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -2607,6 +2607,11 @@ static void tcg_out_movi(TCGContext *s, TCGType type,
     tcg_out_movi32(s, COND_AL, ret, arg);
 }
 
+static bool tcg_out_xchg(TCGContext *s, TCGType type, TCGReg r1, TCGReg r2)
+{
+    return false;
+}
+
 static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
                              tcg_target_long imm)
 {
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 2d7c173a03..7d6bf30747 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -460,6 +460,7 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
 #define OPC_VPTERNLOGQ  (0x25 | P_EXT3A | P_DATA16 | P_VEXW | P_EVEX)
 #define OPC_VZEROUPPER  (0x77 | P_EXT)
 #define OPC_XCHG_ax_r32	(0x90)
+#define OPC_XCHG_EvGv   (0x87)
 
 #define OPC_GRP3_Eb     (0xf6)
 #define OPC_GRP3_Ev     (0xf7)
@@ -1078,6 +1079,13 @@ static void tcg_out_movi(TCGContext *s, TCGType type,
     }
 }
 
+static bool tcg_out_xchg(TCGContext *s, TCGType type, TCGReg r1, TCGReg r2)
+{
+    int rexw = type == TCG_TYPE_I32 ? 0 : P_REXW;
+    tcg_out_modrm(s, OPC_XCHG_EvGv + rexw, r1, r2);
+    return true;
+}
+
 static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
                              tcg_target_long imm)
 {
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index fc98b9b31b..0940788c6f 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -419,6 +419,11 @@ static void tcg_out_addi(TCGContext *s, TCGType type, TCGReg rd,
     }
 }
 
+static bool tcg_out_xchg(TCGContext *s, TCGType type, TCGReg r1, TCGReg r2)
+{
+    return false;
+}
+
 static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
                              tcg_target_long imm)
 {
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index f103cdb4e6..a83ebe8729 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -597,6 +597,11 @@ static void tcg_out_extrl_i64_i32(TCGContext *s, TCGReg rd, TCGReg rs)
     tcg_out_ext32s(s, rd, rs);
 }
 
+static bool tcg_out_xchg(TCGContext *s, TCGType type, TCGReg r1, TCGReg r2)
+{
+    return false;
+}
+
 static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
                              tcg_target_long imm)
 {
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 612ad15bda..d3e547998f 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -1153,6 +1153,11 @@ static void tcg_out_movi(TCGContext *s, TCGType type, TCGReg ret,
     }
 }
 
+static bool tcg_out_xchg(TCGContext *s, TCGType type, TCGReg r1, TCGReg r2)
+{
+    return false;
+}
+
 static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
                              tcg_target_long imm)
 {
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 081782d8c6..266fe1433d 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -561,6 +561,11 @@ static void tcg_out_movi(TCGContext *s, TCGType type, TCGReg rd,
     tcg_out_opc_imm(s, OPC_LD, rd, rd, 0);
 }
 
+static bool tcg_out_xchg(TCGContext *s, TCGType type, TCGReg r1, TCGReg r2)
+{
+    return false;
+}
+
 static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
                              tcg_target_long imm)
 {
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 0578fce4d7..b399798664 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -1076,6 +1076,11 @@ static inline bool tcg_out_sti(TCGContext *s, TCGType type, TCGArg val,
     return false;
 }
 
+static bool tcg_out_xchg(TCGContext *s, TCGType type, TCGReg r1, TCGReg r2)
+{
+    return false;
+}
+
 static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
                              tcg_target_long imm)
 {
diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index 99ba0fdc2b..086981f097 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -542,6 +542,11 @@ static void tcg_out_extrl_i64_i32(TCGContext *s, TCGReg rd, TCGReg rs)
     tcg_out_mov(s, TCG_TYPE_I32, rd, rs);
 }
 
+static bool tcg_out_xchg(TCGContext *s, TCGType type, TCGReg r1, TCGReg r2)
+{
+    return false;
+}
+
 static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
                              tcg_target_long imm)
 {
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 68531e35ec..4cf03a579c 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -645,6 +645,11 @@ static void tcg_out_extrl_i64_i32(TCGContext *s, TCGReg rd, TCGReg rs)
     tcg_out_mov(s, TCG_TYPE_I32, rd, rs);
 }
 
+static bool tcg_out_xchg(TCGContext *s, TCGType type, TCGReg r1, TCGReg r2)
+{
+    return false;
+}
+
 static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
                              tcg_target_long imm)
 {
-- 
2.34.1

