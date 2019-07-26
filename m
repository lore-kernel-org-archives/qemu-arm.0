Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp207212wrv;
        Fri, 26 Jul 2019 10:51:10 -0700 (PDT)
X-Received: by 2002:a17:90a:3548:: with SMTP id q66mr100199460pjb.17.1564163470720;
        Fri, 26 Jul 2019 10:51:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564163470; cv=none;
        d=google.com; s=arc-20160816;
        b=ZhL8DFPlCM8mAQnzJhS0+X3oCTb6zktSJT3b4Y34V3AESEYvHOwSnM7NZUAVhlLVk+
         6X3pGjXBdxgmNHhaBrOwxlC0Rwcj8uv1zcCMIWy3bBIUtI9zc65TY2pS4OsctASs7yG8
         04BqApSnpo8wvZg5puU5YrwWltxk7ODhbbuQuCEbdAevjWg6bMe8rItdnWfunnuO0XoJ
         WnQ6BFSAn6BGXJQ5gc1rREPO54naCCUJi4Q9nR+TSc03YMX6cLUYCqzmmwIzwolwlL7y
         VyDdD9qvLglBmLTpcGU01DGjnv24IDvU5OviMOEHhFROvKQUyS6ILbpfukoNzPXQkpTA
         kaTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=7sC4AygPV0WiIiwW7lCQ39zt4aUcLjG0l/PxVVeDVwI=;
        b=h5icImU585cOMFClGPH+LFhZ2oMrj9jTEmuisCZ4fspiy20Bh9QphE5zZUz4Qu8Mjo
         VyO5eQVSZ2WuzRf41scvs3F9zE7NbjhYkwnYF6Y/vo+EhygDuAebLbnC0ud7zGKNxno/
         /NMF+kbOFTSFwXM3ReKQrXznc9WeIn6tWC754ADN6sAYfibo7f1YJV9fcbOJvV5ZTy4S
         uDSh1PinylXSegi56ZGQI9j2qbS8aP3zMeX0S4GSbYiGGvr3wJd3QFm+LjYFnzk38HfQ
         FYZSLiL4fuRTJFCRbiBcptT+UOSUdvEbrJ0k3zjOD9sty7d8NZmVIcL3f0DDt41w932L
         bhUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="stx/yXoy";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 73sor64599403plf.60.2019.07.26.10.51.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 26 Jul 2019 10:51:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="stx/yXoy";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=7sC4AygPV0WiIiwW7lCQ39zt4aUcLjG0l/PxVVeDVwI=;
        b=stx/yXoyHZ3qDZvCGIPUin9oj3MOK/oGTPWca+rQBpB0cNtFHgXl68TGZR7fjyDJFB
         S5CJkeG8u+Pklt1yK4igGZeOU67cohmKyAvb5SUS9SBLj5Du23soFupaLJlGcvw2r7v5
         X9ZXxUexHTvaMv8MNyf8GCwLmHASuKHmDam2WbJimRoaMIOgxq8rjcDqRgoA8Xmk/kOH
         4Wk1HV0ZGbRQENsL3i1pze0Je4Nq95jswr4eryZMzkTj8ZRbCnJvvsKhcbGj9hVnz49i
         U7330NdIHkPkrlbRp4VJfswIlA9MRtoNV5YZc6U4RT8RQ1zyHzwtTN767H5fEmz3p/9Q
         pgOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=7sC4AygPV0WiIiwW7lCQ39zt4aUcLjG0l/PxVVeDVwI=;
        b=VpDwoLEKo5k2+ZTNPxNVsrEzjEYi9PM6GJiXU8SZTOq7j3I0nqEoiavmvwQVIoIFcr
         xsdGhO0Xz22P127eQ42PmaqqFcI+FR0kyT5KpnKsCBvUHw3vLMtICZsz+Iu6V3/i8AdS
         0msLU0LhzoCqhLPgePbM4lVSjXsF6+Xz4+g+bba88IFBUPKV/iVemL7b70SnuaLuTBDd
         1xBerMQt14PCM5E7IjacL5fgmU9dsnqpkFDF0eGLIsL1z+OepqJ0L+dQNde6gBCYtK4X
         Qvz80dUgIgRVD4Dq1TA18fi1F0NhN8tVSpekarB83lSg52yh2Yw9fISoRV4mjn4uX611
         1Esw==
X-Gm-Message-State: APjAAAVfP8Cj16tp8J7X7u4Rm9vLPN9M/CLwV/6oL/tBrRKjS3RL6SLg
	Ph3oIJLeJ7xzgmmAl/M/QdRD89no
X-Google-Smtp-Source: APXvYqyhGj4eyLgXH2TzyHDk/UyomJyvZFxLiE5YflrL+69O55yVMz/5zPFPIU+6s7TSmqcNLFXWBA==
X-Received: by 2002:a17:902:100a:: with SMTP id b10mr56845250pla.338.1564163470135;
        Fri, 26 Jul 2019 10:51:10 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-117-207.tukw.qwest.net. [97.126.117.207])
        by smtp.gmail.com with ESMTPSA id o24sm104287919pfp.135.2019.07.26.10.51.08
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 26 Jul 2019 10:51:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH 30/67] target/arm: Convert B, BL, BLX (immediate)
Date: Fri, 26 Jul 2019 10:49:55 -0700
Message-Id: <20190726175032.6769-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190726175032.6769-1-richard.henderson@linaro.org>
References: <20190726175032.6769-1-richard.henderson@linaro.org>
X-TUID: KxAJqz0yRCbV

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c       | 134 +++++++++++++++--------------------
 target/arm/a32-uncond.decode |   8 +++
 target/arm/a32.decode        |   8 +++
 target/arm/t32.decode        |  79 +++++++++++++--------
 4 files changed, 122 insertions(+), 107 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 33daf70d5d..3f14e5c7f3 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -7582,6 +7582,14 @@ static int t32_expandimm_imm(DisasContext *s, int x)
     return imm;
 }
 
+static int t32_branch24(DisasContext *s, int x)
+{
+    /* Convert J1:J2 at x[22:21] to I2:I1, which involves I=J^~S.  */
+    x ^= !(x < 0) * (3 << 21);
+    /* Append the final zero.  */
+    return x << 1;
+}
+
 /*
  * Include the generated decoders.
  * Note that the T32 decoder reuses some of the trans_* functions
@@ -9928,13 +9936,56 @@ static bool trans_LDM(DisasContext *s, arg_ldst_block *a)
     return true;
 }
 
+/*
+ * Branch, branch with link
+ */
+
+static bool trans_B(DisasContext *s, arg_i *a)
+{
+    gen_jmp(s, s->pc_read + a->imm);
+    return true;
+}
+
+static bool trans_B_cond_thumb(DisasContext *s, arg_ci *a)
+{
+    /* This has cond from encoding, required to be outside IT block.  */
+    if (a->cond >= 0xe) {
+        return false;
+    }
+    if (s->condexec_mask) {
+        gen_illegal_op(s);
+        return true;
+    }
+    arm_skip_unless(s, a->cond);
+    gen_jmp(s, s->pc_read + a->imm);
+    return true;
+}
+
+static bool trans_BL(DisasContext *s, arg_i *a)
+{
+    tcg_gen_movi_i32(cpu_R[14], s->pc | s->thumb);
+    gen_jmp(s, s->pc_read + a->imm);
+    return true;
+}
+
+static bool trans_BLX_i(DisasContext *s, arg_BLX_i *a)
+{
+    /* For A32, ARCH(5) is checked near the start of the uncond block. */
+    if (s->thumb && (a->imm & 2)) {
+        return false;
+    }
+    tcg_gen_movi_i32(cpu_R[14], s->pc | s->thumb);
+    gen_bx_im(s, (s->pc_read & ~3) + a->imm + !s->thumb);
+    return true;
+}
+
 /*
  * Legacy decoder.
  */
 
 static void disas_arm_insn(DisasContext *s, unsigned int insn)
 {
-    unsigned int cond, val, op1, i, rn;
+    unsigned int cond, op1, i, rn;
     TCGv_i32 tmp;
     TCGv_i32 tmp2;
     TCGv_i32 addr;
@@ -10102,21 +10153,6 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
             }
             gen_rfe(s, tmp, tmp2);
             return;
-        } else if ((insn & 0x0e000000) == 0x0a000000) {
-            /* branch link and change to thumb (blx <offset>) */
-            int32_t offset;
-
-            tmp = tcg_temp_new_i32();
-            tcg_gen_movi_i32(tmp, s->pc);
-            store_reg(s, 14, tmp);
-            /* Sign-extend the 24-bit offset */
-            offset = (((int32_t)insn) << 8) >> 8;
-            val = s->pc_read;
-            /* offset * 4 + bit24 * 2 + (thumb bit) */
-            val += (offset << 2) | ((insn >> 23) & 2) | 1;
-            /* protected by ARCH(5); above, near the start of uncond block */
-            gen_bx_im(s, val);
-            return;
         } else if ((insn & 0x0e000f00) == 0x0c000100) {
             if (arm_dc_feature(s, ARM_FEATURE_IWMMXT)) {
                 /* iWMMXt register transfer.  */
@@ -10205,24 +10241,10 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
         case 0x7:
         case 0x08:
         case 0x09:
-            /* All done in decodetree.  Reach here for illegal ops.  */
-            goto illegal_op;
         case 0xa:
         case 0xb:
-            {
-                int32_t offset;
-
-                /* branch (and link) */
-                if (insn & (1 << 24)) {
-                    tmp = tcg_temp_new_i32();
-                    tcg_gen_movi_i32(tmp, s->pc);
-                    store_reg(s, 14, tmp);
-                }
-                offset = sextract32(insn << 2, 0, 26);
-                val = s->pc_read + offset;
-                gen_jmp(s, val);
-            }
-            break;
+            /* All done in decodetree.  Reach here for illegal ops.  */
+            goto illegal_op;
         case 0xc:
         case 0xd:
         case 0xe:
@@ -10594,32 +10616,8 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
         if (insn & (1 << 15)) {
             /* Branches, misc control.  */
             if (insn & 0x5000) {
-                /* Unconditional branch.  */
-                /* signextend(hw1[10:0]) -> offset[:12].  */
-                offset = ((int32_t)insn << 5) >> 9 & ~(int32_t)0xfff;
-                /* hw1[10:0] -> offset[11:1].  */
-                offset |= (insn & 0x7ff) << 1;
-                /* (~hw2[13, 11] ^ offset[24]) -> offset[23,22]
-                   offset[24:22] already have the same value because of the
-                   sign extension above.  */
-                offset ^= ((~insn) & (1 << 13)) << 10;
-                offset ^= ((~insn) & (1 << 11)) << 11;
-
-                if (insn & (1 << 14)) {
-                    /* Branch and link.  */
-                    tcg_gen_movi_i32(cpu_R[14], s->pc | 1);
-                }
-
-                offset += s->pc_read;
-                if (insn & (1 << 12)) {
-                    /* b/bl */
-                    gen_jmp(s, offset);
-                } else {
-                    /* blx */
-                    offset &= ~(uint32_t)2;
-                    /* thumb2 bx, no need to check */
-                    gen_bx_im(s, offset);
-                }
+                /* Unconditional branch, in decodetree */
+                goto illegal_op;
             } else if (((insn >> 23) & 7) == 7) {
                 /* Misc control */
                 if (insn & (1 << 13))
@@ -10704,24 +10702,8 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
                     }
                 }
             } else {
-                /* Conditional branch.  */
-                op = (insn >> 22) & 0xf;
-                /* Generate a conditional jump to next instruction.  */
-                arm_skip_unless(s, op);
-
-                /* offset[11:1] = insn[10:0] */
-                offset = (insn & 0x7ff) << 1;
-                /* offset[17:12] = insn[21:16].  */
-                offset |= (insn & 0x003f0000) >> 4;
-                /* offset[31:20] = insn[26].  */
-                offset |= ((int32_t)((insn << 5) & 0x80000000)) >> 11;
-                /* offset[18] = insn[13].  */
-                offset |= (insn & (1 << 13)) << 5;
-                /* offset[19] = insn[11].  */
-                offset |= (insn & (1 << 11)) << 8;
-
-                /* jump to the offset */
-                gen_jmp(s, s->pc_read + offset);
+                /* Conditional branch, in decodetree */
+                goto illegal_op;
             }
         } else {
             /*
diff --git a/target/arm/a32-uncond.decode b/target/arm/a32-uncond.decode
index 8dee26d3b6..573ac2cf8e 100644
--- a/target/arm/a32-uncond.decode
+++ b/target/arm/a32-uncond.decode
@@ -21,3 +21,11 @@
 # All insns that have 0xf in insn[31:28] are decoded here.
 # All of those that have a COND field in insn[31:28] are in a32.decode
 #
+
+&i               !extern imm
+
+# Branch with Link and Exchange
+
+%imm24h          0:s24 24:1 !function=times_2
+
+BLX_i            1111 101 . ........................          &i imm=%imm24h
diff --git a/target/arm/a32.decode b/target/arm/a32.decode
index 96c47aaf2a..f0f0f50c4e 100644
--- a/target/arm/a32.decode
+++ b/target/arm/a32.decode
@@ -520,3 +520,11 @@ SMMLSR           .... 0111 0101 .... .... .... 1111 ....      @rdamn
 
 STM              ---- 100 b:1 i:1 u:1 w:1 0 rn:4 list:16   &ldst_block
 LDM              ---- 100 b:1 i:1 u:1 w:1 1 rn:4 list:16   &ldst_block
+
+# Branch, branch with link
+
+%imm26           0:s24  !function=times_4
+@branch          ---- .... ........................           &i imm=%imm26
+
+B                .... 1010 ........................           @branch
+BL               .... 1011 ........................           @branch
diff --git a/target/arm/t32.decode b/target/arm/t32.decode
index 3ab82c0962..ab7d7ba100 100644
--- a/target/arm/t32.decode
+++ b/target/arm/t32.decode
@@ -285,46 +285,54 @@ CLZ              1111 1010 1011 ---- 1111 .... 1000 ....      @rdm
 %msr_sysm        4:1 8:4
 %mrs_sysm        4:1 16:4
 %imm16_16_0      16:4 0:12
+%imm21           26:s1 11:1 13:1 16:6 0:11 !function=times_2
+&ci              cond imm
 
 {
+  # Group insn[25:23] = 111, which is cond=111x for the branch below,
+  # or unconditional, which would be illegal for the branch.
   {
-    YIELD        1111 0011 1010 1111 1000 0000 0000 0001
-    WFE          1111 0011 1010 1111 1000 0000 0000 0010
-    WFI          1111 0011 1010 1111 1000 0000 0000 0011
+    # Hints
+    {
+      YIELD      1111 0011 1010 1111 1000 0000 0000 0001
+      WFE        1111 0011 1010 1111 1000 0000 0000 0010
+      WFI        1111 0011 1010 1111 1000 0000 0000 0011
 
-    # TODO: Implement SEV, SEVL; may help SMP performance.
-    # SEV        1111 0011 1010 1111 1000 0000 0000 0100
-    # SEVL       1111 0011 1010 1111 1000 0000 0000 0101
+      # TODO: Implement SEV, SEVL; may help SMP performance.
+      # SEV      1111 0011 1010 1111 1000 0000 0000 0100
+      # SEVL     1111 0011 1010 1111 1000 0000 0000 0101
 
-    # The canonical nop ends in 0000 0000, but the whole rest
-    # of the space is "reserved hint, behaves as nop".
-    NOP          1111 0011 1010 1111 1000 0000 ---- ----
-  }
-  # Note that the v7m insn overlaps both the normal and banked insn.
-  {
-    MRS_bank     1111 0011 111 r:1 .... 1000 rd:4   001. 0000  \
+      # The canonical nop ends in 0000 0000, but the whole rest
+      # of the space is "reserved hint, behaves as nop".
+      NOP        1111 0011 1010 1111 1000 0000 ---- ----
+    }
+    # Note that the v7m insn overlaps both the normal and banked insn.
+    {
+      MRS_bank   1111 0011 111 r:1 .... 1000 rd:4   001. 0000  \
                  &mrs_bank sysm=%mrs_sysm
-    MRS_reg      1111 0011 111 r:1 1111 1000 rd:4   0000 0000  &mrs_reg
-    MRS_v7m      1111 0011 111 0   1111 1000 rd:4   sysm:8
-  }
-  {
-    MSR_bank     1111 0011 100 r:1 rn:4 1000 ....   001. 0000  \
+      MRS_reg    1111 0011 111 r:1 1111 1000 rd:4   0000 0000  &mrs_reg
+      MRS_v7m    1111 0011 111 0   1111 1000 rd:4   sysm:8
+    }
+    {
+      MSR_bank   1111 0011 100 r:1 rn:4 1000 ....   001. 0000  \
                  &msr_bank sysm=%msr_sysm
-    MSR_reg      1111 0011 100 r:1 rn:4 1000 mask:4 0000 0000  &msr_reg
-    MSR_v7m      1111 0011 100 0   rn:4 1000 mask:2 00 sysm:8
-  }
-  BXJ            1111 0011 1100 rm:4 1000 1111 0000 0000      &r
-  {
-    # At v6T2, this is the T5 encoding of SUBS PC, LR, #IMM, and works as for
-    # every other encoding of SUBS.  With v7VE, IMM=0 is redefined as ERET.
-    ERET         1111 0011 1101 1110 1000 1111 0000 0000
-    SUB_rri      1111 0011 1101 1110 1000 1111 imm:8          \
+      MSR_reg    1111 0011 100 r:1 rn:4 1000 mask:4 0000 0000  &msr_reg
+      MSR_v7m    1111 0011 100 0   rn:4 1000 mask:2 00 sysm:8
+    }
+    BXJ          1111 0011 1100 rm:4 1000 1111 0000 0000      &r
+    {
+      # At v6T2, this is the T5 encoding of SUBS PC, LR, #IMM, and works as for
+      # every other encoding of SUBS.  With v7VE, IMM=0 is redefined as ERET.
+      ERET       1111 0011 1101 1110 1000 1111 0000 0000
+      SUB_rri    1111 0011 1101 1110 1000 1111 imm:8          \
                  &s_rri_rot rot=0 s=1 rd=15 rn=14
-  }
-  SMC            1111 0111 1111 imm:4 1000 0000 0000 0000     &i
-  HVC            1111 0111 1110 .... 1000 .... .... ....      \
+    }
+    SMC          1111 0111 1111 imm:4 1000 0000 0000 0000     &i
+    HVC          1111 0111 1110 .... 1000 .... .... ....      \
                  &i imm=%imm16_16_0
-  UDF            1111 0111 1111 ---- 1010 ---- ---- ----
+    UDF          1111 0111 1111 ----  1010 ---- ---- ----
+  }
+  B_cond_thumb   1111 0. cond:4 ...... 10.0 ............      &ci imm=%imm21
 }
 
 # Load/store (register, immediate, literal)
@@ -573,3 +581,12 @@ STM              1110 1000 10.0 .... ................         @ldstm i=1 b=0
 STM              1110 1001 00.0 .... ................         @ldstm i=0 b=1
 LDM              1110 1000 10.1 .... ................         @ldstm i=1 b=0
 LDM              1110 1001 00.1 .... ................         @ldstm i=0 b=1
+
+# Branches
+
+%imm24           26:s1 13:1 11:1 16:10 0:11 !function=t32_branch24
+@branch24        ................................             &i imm=%imm24
+
+B                1111 0. .......... 10.1 ............         @branch24
+BL               1111 0. .......... 11.1 ............         @branch24
+BLX_i            1111 0. .......... 11.0 ............         @branch24
-- 
2.17.1
