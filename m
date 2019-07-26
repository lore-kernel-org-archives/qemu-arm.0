Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp207257wrv;
        Fri, 26 Jul 2019 10:51:13 -0700 (PDT)
X-Received: by 2002:a17:902:a03:: with SMTP id 3mr96217430plo.302.1564163472975;
        Fri, 26 Jul 2019 10:51:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564163472; cv=none;
        d=google.com; s=arc-20160816;
        b=qw4/c3j0FTdWy4Od5Hu3MRdI4RDL2I7DAssZ+uHWAljt4OZkq6vd/irbImQ6tuxpQl
         ojXs/1C4NI0bSu2W0p3LHZu+q8oXTNX/PRTlVXsZnreUxJ20Fy3IcZQgkX45i5w3LHh9
         VzPyqXX7D2bncv6ccCNLm2fVaKBXWQzGSqpE2p46i2xNV1i+L1YvYDGrvTKxN4u4I3+J
         ZqehhAQe6oOdXGYSSTksCmw39oKrp1BpBWwZOVFnKoa8u7jauOMiqSe6RI0Z05mq5onP
         pINc2kMhjFZKF4G/plWkeEHqOtA8nQygE9fa7L+fhp5JdDE5jSNCeAHkhUi8Z+8rSt6x
         Z0eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=9vUZl6rgWeXH1YY9hBMz+TVXEkH2e7x0hrOM8enxV9o=;
        b=uKQ0o8PiCUXIkg8o2wOO88GV9+zXUprq76sNF3pwqX9CvC5n5NfDpsrob8VibCjOfY
         ICNU1PWLDZW66eoozc1VFnCQ6+nr6LRuCjibB2wAHuS6i3CAfhSFe+NtqPWvD7sShBGJ
         0vWHJ4VkCQOex+jCobF5qqZegVeNk/72Q6I4NSOdQvFb5h51DP3mKIVUiQ89/PJ8oWhV
         Sc6utmKsaOsmn+KOiZksF/78MGDIegqGS6hU6djh7rTuySEnG82l5y9JEsdTFBjC/Gat
         MsXBUX2VAKIM3g5ijluybcegTcYtbKywcbjKJTJyL4WdM5lqe5wifZiema02rxmyjQvM
         wWgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uUD8jLH2;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id i20sor34497367pfa.12.2019.07.26.10.51.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 26 Jul 2019 10:51:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uUD8jLH2;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=9vUZl6rgWeXH1YY9hBMz+TVXEkH2e7x0hrOM8enxV9o=;
        b=uUD8jLH2uTXEyAQE2vjg5gcofjHMYcFoOZOQlE3d3QNnTxp9M2lHr6Q9AqEEwEU/WU
         DcUStg+cB+EOQElxrpyqPCzYOPOdKYygIf6012cyxZ/BNe+yyrM8IUo1u0Tt9cp/NGxy
         qN6ffZrS5mGRR1libC/Xfn0JQut6I/CI2bNdZZkaI8W700q5uVjS3g/ehCcHsa5EBGpR
         OCLfR8VKPJWqwTIJwLXdBsMFSwXeB884Z+hLge8OMaQ4nJh6ubrH+43R51mdPVl6SpW0
         CWC7Om8iJi/PoGJRIhJEkadFNM30DEfzSAol/YHGKVACqOS9cSetZXk839MtKMS/rKxt
         R9Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=9vUZl6rgWeXH1YY9hBMz+TVXEkH2e7x0hrOM8enxV9o=;
        b=oNtk4aEG2mMSuJQrk2gkxZavCSm1+kxrcShTp7OxvIIGKu3GsimmE/20bcWM1sdUhn
         GiO1EXmtrzjEV48EiG+NJpVTJX3JHDsGKIl7MBORdjbVYQvmNrdwBrAWaNKJyNQhVFxN
         PVvwXbNzviqOomUNGq+FAMXES0oGkEmP8eoIFRNmr5v0785VcNSC/oYnUC7cM1IuuCnA
         W6CwsrT9BM0/ApgVGqjmSNJbhPdKuwLG0KGr6X5DSghb3G70gpR+nmrn/1YLwzqaVVnR
         zLIZVkUA+UGzc9TxLzIKbipAlGzu4byjew1SYjux8fh+N3e/EuNOuF/DzC34T6+jRLQs
         MGQg==
X-Gm-Message-State: APjAAAXAsfnkznUPO9nAlPQJwOBOhjJFFT8K6R4ujX0OOJoXFoFO0YAP
	HbQvv7OAdRL7pFEjunFzL4twReiD
X-Google-Smtp-Source: APXvYqw1Z6xsXa5FzIq4cNUlrDXl5QQdDXmbMlUG7+/edA0B7VdxbITfD8QJqFKkQ7ZzOxAvEI+TVA==
X-Received: by 2002:aa7:9298:: with SMTP id j24mr22747609pfa.58.1564163472492;
        Fri, 26 Jul 2019 10:51:12 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-117-207.tukw.qwest.net. [97.126.117.207])
        by smtp.gmail.com with ESMTPSA id o24sm104287919pfp.135.2019.07.26.10.51.11
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 26 Jul 2019 10:51:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH 32/67] target/arm: Convert RFE and SRS
Date: Fri, 26 Jul 2019 10:49:57 -0700
Message-Id: <20190726175032.6769-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190726175032.6769-1-richard.henderson@linaro.org>
References: <20190726175032.6769-1-richard.henderson@linaro.org>
X-TUID: VhvdBHVUYPaG

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c       | 150 ++++++++++++++---------------------
 target/arm/a32-uncond.decode |   8 ++
 target/arm/t32.decode        |  12 +++
 3 files changed, 81 insertions(+), 89 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 7ea118a795..b43b344f96 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9991,16 +9991,71 @@ static bool trans_SVC(DisasContext *s, arg_SVC *a)
     return true;
 }
 
+/*
+ * Unconditional system instructions
+ */
+
+static bool trans_RFE(DisasContext *s, arg_RFE *a)
+{
+    int32_t offset;
+    TCGv_i32 addr, t1, t2;
+
+    if (IS_USER(s) || !ENABLE_ARCH_6) {
+        return false;
+    }
+
+    addr = load_reg(s, a->rn);
+
+    switch (a->pu) {
+    case 0: offset = -4; break; /* DA */
+    case 1: offset =  0; break; /* IA */
+    case 2: offset = -8; break; /* DB */
+    case 3: offset =  4; break; /* IB */
+    default:
+        g_assert_not_reached();
+    }
+    tcg_gen_addi_i32(addr, addr, offset);
+
+    /* Load PC into tmp and CPSR into tmp2.  */
+    t1 = tcg_temp_new_i32();
+    gen_aa32_ld32u(s, t1, addr, get_mem_index(s));
+    tcg_gen_addi_i32(addr, addr, 4);
+    t2 = tcg_temp_new_i32();
+    gen_aa32_ld32u(s, t2, addr, get_mem_index(s));
+
+    if (a->w) {
+        /* Base writeback.  */
+        switch (a->pu) {
+        case 0: offset = -8; break;
+        case 1: offset =  4; break;
+        case 2: offset = -4; break;
+        case 3: offset =  0; break;
+        }
+        tcg_gen_addi_i32(addr, addr, offset);
+        store_reg(s, a->rn, addr);
+    } else {
+        tcg_temp_free_i32(addr);
+    }
+    gen_rfe(s, t1, t2);
+    return true;
+}
+
+static bool trans_SRS(DisasContext *s, arg_SRS *a)
+{
+    if (!ENABLE_ARCH_6) {
+        return false;
+    }
+    gen_srs(s, a->mode, a->pu, a->w);
+    return true;
+}
+
 /*
  * Legacy decoder.
  */
 
 static void disas_arm_insn(DisasContext *s, unsigned int insn)
 {
-    unsigned int cond, op1, i, rn;
-    TCGv_i32 tmp;
-    TCGv_i32 tmp2;
-    TCGv_i32 addr;
+    unsigned int cond, op1;
 
     /* M variants do not implement ARM mode; this must raise the INVSTATE
      * UsageFault exception.
@@ -10119,52 +10174,6 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
             default:
                 goto illegal_op;
             }
-        } else if ((insn & 0x0e5fffe0) == 0x084d0500) {
-            /* srs */
-            ARCH(6);
-            gen_srs(s, (insn & 0x1f), (insn >> 23) & 3, insn & (1 << 21));
-            return;
-        } else if ((insn & 0x0e50ffe0) == 0x08100a00) {
-            /* rfe */
-            int32_t offset;
-            if (IS_USER(s))
-                goto illegal_op;
-            ARCH(6);
-            rn = (insn >> 16) & 0xf;
-            addr = load_reg(s, rn);
-            i = (insn >> 23) & 3;
-            switch (i) {
-            case 0: offset = -4; break; /* DA */
-            case 1: offset = 0; break; /* IA */
-            case 2: offset = -8; break; /* DB */
-            case 3: offset = 4; break; /* IB */
-            default: abort();
-            }
-            if (offset)
-                tcg_gen_addi_i32(addr, addr, offset);
-            /* Load PC into tmp and CPSR into tmp2.  */
-            tmp = tcg_temp_new_i32();
-            gen_aa32_ld32u(s, tmp, addr, get_mem_index(s));
-            tcg_gen_addi_i32(addr, addr, 4);
-            tmp2 = tcg_temp_new_i32();
-            gen_aa32_ld32u(s, tmp2, addr, get_mem_index(s));
-            if (insn & (1 << 21)) {
-                /* Base writeback.  */
-                switch (i) {
-                case 0: offset = -8; break;
-                case 1: offset = 4; break;
-                case 2: offset = -4; break;
-                case 3: offset = 0; break;
-                default: abort();
-                }
-                if (offset)
-                    tcg_gen_addi_i32(addr, addr, offset);
-                store_reg(s, rn, addr);
-            } else {
-                tcg_temp_free_i32(addr);
-            }
-            gen_rfe(s, tmp, tmp2);
-            return;
         } else if ((insn & 0x0e000f00) == 0x0c000100) {
             if (arm_dc_feature(s, ARM_FEATURE_IWMMXT)) {
                 /* iWMMXt register transfer.  */
@@ -10324,7 +10333,6 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
     uint32_t imm, offset;
     uint32_t rd, rn, rm, rs;
     TCGv_i32 tmp;
-    TCGv_i32 tmp2;
     TCGv_i32 addr;
     int op;
 
@@ -10473,44 +10481,8 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
                 goto illegal_op;
             }
         } else {
-            /* Load/store multiple, RFE, SRS.  */
-            if (((insn >> 23) & 1) == ((insn >> 24) & 1)) {
-                /* RFE, SRS: not available in user mode or on M profile */
-                if (IS_USER(s) || arm_dc_feature(s, ARM_FEATURE_M)) {
-                    goto illegal_op;
-                }
-                if (insn & (1 << 20)) {
-                    /* rfe */
-                    addr = load_reg(s, rn);
-                    if ((insn & (1 << 24)) == 0)
-                        tcg_gen_addi_i32(addr, addr, -8);
-                    /* Load PC into tmp and CPSR into tmp2.  */
-                    tmp = tcg_temp_new_i32();
-                    gen_aa32_ld32u(s, tmp, addr, get_mem_index(s));
-                    tcg_gen_addi_i32(addr, addr, 4);
-                    tmp2 = tcg_temp_new_i32();
-                    gen_aa32_ld32u(s, tmp2, addr, get_mem_index(s));
-                    if (insn & (1 << 21)) {
-                        /* Base writeback.  */
-                        if (insn & (1 << 24)) {
-                            tcg_gen_addi_i32(addr, addr, 4);
-                        } else {
-                            tcg_gen_addi_i32(addr, addr, -4);
-                        }
-                        store_reg(s, rn, addr);
-                    } else {
-                        tcg_temp_free_i32(addr);
-                    }
-                    gen_rfe(s, tmp, tmp2);
-                } else {
-                    /* srs */
-                    gen_srs(s, (insn & 0x1f), (insn & (1 << 24)) ? 1 : 2,
-                            insn & (1 << 21));
-                }
-            } else {
-                /* Load/store multiple, in decodetree */
-                goto illegal_op;
-            }
+            /* Load/store multiple, RFE, SRS, in decodetree */
+            goto illegal_op;
         }
         break;
     case 5:
diff --git a/target/arm/a32-uncond.decode b/target/arm/a32-uncond.decode
index 573ac2cf8e..3b961233e5 100644
--- a/target/arm/a32-uncond.decode
+++ b/target/arm/a32-uncond.decode
@@ -29,3 +29,11 @@
 %imm24h          0:s24 24:1 !function=times_2
 
 BLX_i            1111 101 . ........................          &i imm=%imm24h
+
+# System Instructions
+
+&rfe             rn w pu
+&srs             mode w pu
+
+RFE              1111 100 pu:2 0 w:1 1 rn:4 0000 1010 0000 0000   &rfe
+SRS              1111 110 pu:2 1 w:1 0 1101 0000 0101 000 mode:5  &srs
diff --git a/target/arm/t32.decode b/target/arm/t32.decode
index ab7d7ba100..26b51c3bb2 100644
--- a/target/arm/t32.decode
+++ b/target/arm/t32.decode
@@ -582,6 +582,18 @@ STM              1110 1001 00.0 .... ................         @ldstm i=0 b=1
 LDM              1110 1000 10.1 .... ................         @ldstm i=1 b=0
 LDM              1110 1001 00.1 .... ................         @ldstm i=0 b=1
 
+&rfe             !extern rn w pu
+@rfe             .... .... .. w:1 . rn:4 ................     &rfe
+
+RFE              1110 1000 00.1 .... 1100000000000000         @rfe pu=2
+RFE              1110 1001 10.1 .... 1100000000000000         @rfe pu=1
+
+&srs             !extern mode w pu
+@srs             .... .... .. w:1 . .... ........... mode:5   &srs
+
+SRS              1110 1000 00.0 1101 1100 0000 000. ....      @srs pu=2
+SRS              1110 1001 10.0 1101 1100 0000 000. ....      @srs pu=1
+
 # Branches
 
 %imm24           26:s1 13:1 11:1 16:10 0:11 !function=t32_branch24
-- 
2.17.1
