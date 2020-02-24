Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp846713lfg;
        Mon, 24 Feb 2020 14:27:18 -0800 (PST)
X-Google-Smtp-Source: APXvYqxjNlMJtPLx5WsbJZufZDL/IPnq662vnMTSgKYKNpy1fL/2cVLOy4+nqbqonlkEOCaHPGLf
X-Received: by 2002:ad4:4f8f:: with SMTP id em15mr45073571qvb.169.1582583238470;
        Mon, 24 Feb 2020 14:27:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582583238; cv=none;
        d=google.com; s=arc-20160816;
        b=kF1F4IsvQdBSeoahKuN1dfI4xVGWxEIg5n70F5eYbptyq/9nqnriZW8IxvpHKLDTSZ
         Z3hEysg40es8pucHyGoqqZtmANKhv4SpNu4zdizTgXHAqp6+ya6ryU/SSoxJbpGllECd
         m5IeP7ECu6JCUUwedw06QCK8ksWlTys6Mo/URyAY1RAS6yKcrE3MEQeEs5+kGi4NEPJh
         JhQurdCK0dXwNlkMyftYkeQ2dUmuJrGDORFIZ4CF79XhhQxgyxL+SgijqpGFpqKQq6e9
         KLn03mYP4pkOgMT1xzAKEvpOtiGlD0EQ1Kh48FT/EiTCu3fQK80PWJS/dj8dS+3vEzo1
         5fRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Jm8KlY79fmi10gEwUaheKwxsBU3LYmbPeN5QBjFnnb0=;
        b=Bxp0Wegti0yCHHiOKxwHE9vf2Ylg/vHqRiWqsNk/dPdQvLuqv86s7bQae99we55owa
         WwVKizibUHeuwj18lHJPWXnQYDW9b/PGlJ5FUczKkFY201rnsNcMda6BfOIm4VYI0713
         j6k8xyjGmUIdn6NvMLE37d5feXHJFem2V1WAqRH4p5ZkgS58DDZEtNYitIRL+HUD1Dk6
         h1ynNfY5uewRVQ+6B44bekBgaHGSjWPnzb2lZazaJ10SO4E4ipBFVOGFmA5q6PGpaB6j
         rgtSfcclSoI14GAXkee5mN8N/RdrQ7CTl82X5xTOp+gEvw5/Hlqq8ujag69AbofmIvTZ
         SjJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tF5EoHy5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c10si408708qtn.192.2020.02.24.14.27.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2020 14:27:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tF5EoHy5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6MC5-0004Ap-SX
	for alex.bennee@linaro.org; Mon, 24 Feb 2020 17:27:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37949)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j6M7o-0004Wi-AH
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 17:22:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j6M7m-0005uW-Tz
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 17:22:52 -0500
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:41224)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j6M7m-0005uB-Nn
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 17:22:50 -0500
Received: by mail-pf1-x444.google.com with SMTP id j9so6067041pfa.8
 for <qemu-arm@nongnu.org>; Mon, 24 Feb 2020 14:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Jm8KlY79fmi10gEwUaheKwxsBU3LYmbPeN5QBjFnnb0=;
 b=tF5EoHy5mkqDGJ11etcAOiB0Np57GLPUdwsPK1yz19pH0koGH/STl2Yc73VDAWUgAh
 NdMaFiBTz/m0AgPc41k0z+WeYCY7EoYDLsq+ttMBFy95yDu0iyl8EBY+nQ1AiBYyuWPB
 owt6cWmAv/x+1NU12HAuE+eaMv6RydEtWKiTi95pALW1Q3zEBPY9kkL/hJVBZHNE6Jd5
 5FlAuAYCr+VouSgI+8lUb6FZCo8DP4zjcZ7w59QZBng0cUjQun7RUdcCEMOPMbLx1A9v
 YtnMTi3yiQTJXWJT/T2VF0kWoPmUKxPlqwL3bm4YM5b2ewvHkTf/a2N++NnCmt721GlC
 TVUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Jm8KlY79fmi10gEwUaheKwxsBU3LYmbPeN5QBjFnnb0=;
 b=FkM0o7fQgz9SwUtelFCKE91nifqO2deFFbbmZ5UW/MgnKLZ4MYTCg5bxx30eY5UR3W
 qZHF+NOzhMyPbj24Q3KAMukCSCgSCoFcoofAjfRnY6W36OPOVXdJV7PUpts0v6U2AAot
 MQfjsEdfJDZz4AreUFWOdaMwiWg6T5w6mdBW8zpPUuckWKAPJfIJfwdVtVEpf9Sj1rkd
 z7OFijGSPIc14EKQkXYMFvqEnxK2ufWNbzGhLAhidLNAvqwOlmZ+0um0z8RgFq3hdgKf
 GF/LN5WMipGjA9B2VFPG1eV+sf3CvXvFxzoQCWktOc4FZQighDIxyqjgjG+ro4IBZlpu
 uGTQ==
X-Gm-Message-State: APjAAAX6fLGNQjdD+57buuI72DtTdbmywCbhj5uwxLxGEG0Mo2z+RJBe
 pwD82lPwwBCdT52WlWyEY/06vL4qNOk=
X-Received: by 2002:a62:ab06:: with SMTP id p6mr29829193pff.52.1582582969821; 
 Mon, 24 Feb 2020 14:22:49 -0800 (PST)
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net.
 [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id o6sm13897097pgg.37.2020.02.24.14.22.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2020 14:22:49 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 12/17] target/arm: Move the vfp decodetree calls next to
 the base isa
Date: Mon, 24 Feb 2020 14:22:27 -0800
Message-Id: <20200224222232.13807-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200224222232.13807-1-richard.henderson@linaro.org>
References: <20200224222232.13807-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RHO0zS1rrIJ8

Have the calls adjacent as an intermediate step toward
actually merging the decodes.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Fix fallthrough in disas_arm_insn vs vfp insns.
---
 target/arm/translate.c | 83 +++++++++++++++---------------------------
 1 file changed, 29 insertions(+), 54 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 5b7cad1ea2..6259064ea7 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -2646,31 +2646,6 @@ static void gen_neon_dup_high16(TCGv_i32 var)
     tcg_temp_free_i32(tmp);
 }
 
-/*
- * Disassemble a VFP instruction.  Returns nonzero if an error occurred
- * (ie. an undefined instruction).
- */
-static int disas_vfp_insn(DisasContext *s, uint32_t insn)
-{
-    /*
-     * If the decodetree decoder handles this insn it will always
-     * emit code to either execute the insn or generate an appropriate
-     * exception; so we don't need to ever return non-zero to tell
-     * the calling code to emit an UNDEF exception.
-     */
-    if (extract32(insn, 28, 4) == 0xf) {
-        if (disas_vfp_uncond(s, insn)) {
-            return 0;
-        }
-    } else {
-        if (disas_vfp(s, insn)) {
-            return 0;
-        }
-    }
-    /* If the decodetree decoder didn't handle this insn, it must be UNDEF */
-    return 1;
-}
-
 static inline bool use_goto_tb(DisasContext *s, target_ulong dest)
 {
 #ifndef CONFIG_USER_ONLY
@@ -10778,7 +10753,9 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
         ARCH(5);
 
         /* Unconditional instructions.  */
-        if (disas_a32_uncond(s, insn)) {
+        /* TODO: Perhaps merge these into one decodetree output file.  */
+        if (disas_a32_uncond(s, insn) ||
+            disas_vfp_uncond(s, insn)) {
             return;
         }
         /* fall back to legacy decoder */
@@ -10805,13 +10782,6 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
             }
             return;
         }
-        if ((insn & 0x0f000e10) == 0x0e000a00) {
-            /* VFP.  */
-            if (disas_vfp_insn(s, insn)) {
-                goto illegal_op;
-            }
-            return;
-        }
         if ((insn & 0x0e000f00) == 0x0c000100) {
             if (arm_dc_feature(s, ARM_FEATURE_IWMMXT)) {
                 /* iWMMXt register transfer.  */
@@ -10842,7 +10812,9 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
         arm_skip_unless(s, cond);
     }
 
-    if (disas_a32(s, insn)) {
+    /* TODO: Perhaps merge these into one decodetree output file.  */
+    if (disas_a32(s, insn) ||
+        disas_vfp(s, insn)) {
         return;
     }
     /* fall back to legacy decoder */
@@ -10852,11 +10824,10 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
     case 0xd:
     case 0xe:
         if (((insn >> 8) & 0xe) == 10) {
-            /* VFP.  */
-            if (disas_vfp_insn(s, insn)) {
-                goto illegal_op;
-            }
-        } else if (disas_coproc_insn(s, insn)) {
+            /* VFP, but failed disas_vfp.  */
+            goto illegal_op;
+        }
+        if (disas_coproc_insn(s, insn)) {
             /* Coprocessor.  */
             goto illegal_op;
         }
@@ -10945,7 +10916,14 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
         ARCH(6T2);
     }
 
-    if (disas_t32(s, insn)) {
+    /*
+     * TODO: Perhaps merge these into one decodetree output file.
+     * Note disas_vfp is written for a32 with cond field in the
+     * top nibble.  The t32 encoding requires 0xe in the top nibble.
+     */
+    if (disas_t32(s, insn) ||
+        disas_vfp_uncond(s, insn) ||
+        ((insn >> 28) == 0xe && disas_vfp(s, insn))) {
         return;
     }
     /* fall back to legacy decoder */
@@ -10962,17 +10940,15 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
                 goto illegal_op; /* op0 = 0b11 : unallocated */
             }
 
-            if (disas_vfp_insn(s, insn)) {
-                if (((insn >> 8) & 0xe) == 10 &&
-                    dc_isar_feature(aa32_fpsp_v2, s)) {
-                    /* FP, and the CPU supports it */
-                    goto illegal_op;
-                } else {
-                    /* All other insns: NOCP */
-                    gen_exception_insn(s, s->pc_curr, EXCP_NOCP,
-                                       syn_uncategorized(),
-                                       default_exception_el(s));
-                }
+            if (((insn >> 8) & 0xe) == 10 &&
+                dc_isar_feature(aa32_fpsp_v2, s)) {
+                /* FP, and the CPU supports it */
+                goto illegal_op;
+            } else {
+                /* All other insns: NOCP */
+                gen_exception_insn(s, s->pc_curr, EXCP_NOCP,
+                                   syn_uncategorized(),
+                                   default_exception_el(s));
             }
             break;
         }
@@ -10995,9 +10971,8 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
                 goto illegal_op;
             }
         } else if (((insn >> 8) & 0xe) == 10) {
-            if (disas_vfp_insn(s, insn)) {
-                goto illegal_op;
-            }
+            /* VFP, but failed disas_vfp.  */
+            goto illegal_op;
         } else {
             if (insn & (1 << 28))
                 goto illegal_op;
-- 
2.20.1

