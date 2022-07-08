Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp385219lft;
        Fri, 8 Jul 2022 09:39:59 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tHPA5TAX0koWBKdLnYT62k1nAQMO5H7zZZBgMMhO1cZ+SFQCPpyOAO9stTRxtKGZ9cJwOT
X-Received: by 2002:ac8:5891:0:b0:31b:f627:7346 with SMTP id t17-20020ac85891000000b0031bf6277346mr3780396qta.610.1657298399042;
        Fri, 08 Jul 2022 09:39:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657298399; cv=none;
        d=google.com; s=arc-20160816;
        b=Y3LZukQicLC/WYM0VWI4AFLjG6xFJoInJQL/ySP1uZDGB6qFjiFJTxk64skr77K0++
         JMO6TLADmQq0USC5MiH/pnP6oPtidZKS337mdVr7BOVuVy3hfrNqjlUaAvDPTfJ54nOv
         CBBGEaEGFbOfLlueQe17U6cZ9f75x64NL3c8Iy3SRlWEFWR/pPd8Th92kTv06g1NKmfu
         3dmK1WgxmWHX94UiQdKn0w/QEGuVoq0b68vErSAaC+dVYkT+K+SO95YNHSLUdSBPGvWW
         hXcbWOc+aXYOCr+CxTUA07R061jsuRzMEonly5wll23lGKy6pUTH/Uu4CUgtcWUtmVt6
         +6FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=OYX/d+01tGy3cBxW/0xpcYjEwZc6/OMjB3i/YA7k0a4=;
        b=BNxNGaL14V4MzxHbd7N29GRh6TK3SZgZlX53XhnY7894R2exmRa/xn/jBH5sr+bgFl
         j4lVNlOxK9tP7s/qV37g/aV5KROA754BNdLLgP6kay3Om+PIBhUgNkelZlU0T1XjkcnB
         n2LBOecCeLeF6sWuDKjmePHFBQoOeDc5vTqn4/2bhgwD5QhKaA18NQrQCZATdsmCaFSg
         wVqXffB6wdBCTzVrzMLsvSBGPTfdWY+hZgf/Ycef2LH42gZ362H1Gqcy5d5ZzRK2mH34
         a6XHN9p2CcQ55srMA4/NERn+iQfPtlqVLpA5BQlFBZDi23cyuR9ocrJq7/5QIiFqz9fC
         jnPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SQ593bbc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v4-20020a05620a0f0400b006a6d365e9a9si5951263qkl.715.2022.07.08.09.39.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Jul 2022 09:39:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SQ593bbc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o9r1K-0005V8-He
	for alex.bennee@linaro.org; Fri, 08 Jul 2022 12:39:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9qDM-00065c-NA
 for qemu-arm@nongnu.org; Fri, 08 Jul 2022 11:48:20 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:36643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9qDJ-0002X2-R4
 for qemu-arm@nongnu.org; Fri, 08 Jul 2022 11:48:20 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 z12-20020a17090a7b8c00b001ef84000b8bso2314469pjc.1
 for <qemu-arm@nongnu.org>; Fri, 08 Jul 2022 08:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OYX/d+01tGy3cBxW/0xpcYjEwZc6/OMjB3i/YA7k0a4=;
 b=SQ593bbcqoAQar/qHavBiBV3rQAYb1ufwNzL/zbCJDVwDWa7Pg8sFk6tlrYxJWNemW
 UTYvPPYRzU1DwFFDy5Mfdvh0iFc19pl9yoY9pOQ/gabJH1IiU8/jH0QSTge4WjK7YU+j
 efasqkOi/QirKx/y4ab3YLpcwURnG5i1Dw3cAe/LxDOinwS0TVPkpYRt6yJPfYZ3ktx/
 NO5mY/r6j160lMcpUiMb2N+D6kO/FkBx2blJiwEj8ncNcJSdPeujE6sBQlIFbPolda7A
 +hY3jvYVCrEjin/8ZrkdCQOkNZMdwUlo22GJSTJKA8Okr2U7dfozT/OLm4vQx/UM+lkh
 7y5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OYX/d+01tGy3cBxW/0xpcYjEwZc6/OMjB3i/YA7k0a4=;
 b=0mb6T4Mv+7iPTXcredWg35sJZ4ic6M45QS3yHfIr7aoZPzDh4yxu9KtMfQfcbzk3AE
 6SgCuxvSDAV21IGa982xkZcUwg1txi5AT7vEKN3t6DLkr7xfQhhdXzE3smBjwpP+8rrC
 hvee9lYjS0crHeRR+nlDLZzTNGSdNPe66w/r+h6xSXLbzrDllPOMQkKMfquBqkr58E4t
 oG8ulj2QfJ0o8y/oFyE9Q2D9LtzQol3V2vJGcVPBpTy8cXE6Nsegz5MOV01zHQ/mGnPj
 r1LpcuF3sWxiiAA7f+X+0KaUzRkQmuSgSU9a5PT2efgXzVSnAW2VZzlmZNoywJve4z0Q
 eK8Q==
X-Gm-Message-State: AJIora+igedsQXuQNZyMHArGKkoQEiLOGT8UubBg5vYERubwSxYQko4N
 z+gpJwZpIL9RudLCu3T/FLY/dwlgzKUfjSHZ
X-Received: by 2002:a17:90a:9d8a:b0:1ef:7a8d:1808 with SMTP id
 k10-20020a17090a9d8a00b001ef7a8d1808mr496746pjp.135.1657295296928; 
 Fri, 08 Jul 2022 08:48:16 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 y3-20020a17090a390300b001ef81bac701sm1782089pjb.42.2022.07.08.08.48.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:48:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [RISU PATCH v4 23/29] Standardize reginfo_dump_mismatch printing
Date: Fri,  8 Jul 2022 21:16:54 +0530
Message-Id: <20220708154700.18682-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708154700.18682-1-richard.henderson@linaro.org>
References: <20220708154700.18682-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: We4NApBMIsdh

Hoist the "master vs apprentice" label to apprentice(), since
we will want different labels for dumping.  Remove all of the
"mismatch" text from reginfo_dump_mismatch -- just print "vs".

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 risu.h                 |  4 ++--
 risu.c                 |  1 +
 risu_reginfo_aarch64.c | 12 +++++-------
 risu_reginfo_arm.c     | 18 ++++++++---------
 risu_reginfo_i386.c    |  6 +-----
 risu_reginfo_m68k.c    | 23 +++++++---------------
 risu_reginfo_ppc64.c   | 44 ++++++++++++++++++------------------------
 7 files changed, 44 insertions(+), 64 deletions(-)

diff --git a/risu.h b/risu.h
index bdb70c1..99f0d8e 100644
--- a/risu.h
+++ b/risu.h
@@ -123,8 +123,8 @@ int reginfo_is_eq(struct reginfo *r1, struct reginfo *r2);
 /* print reginfo state to a stream, returns 1 on success, 0 on failure */
 int reginfo_dump(struct reginfo *ri, FILE * f);
 
-/* reginfo_dump_mismatch: print mismatch details to a stream, ret nonzero=ok */
-int reginfo_dump_mismatch(struct reginfo *m, struct reginfo *a, FILE *f);
+/* reginfo_dump_mismatch: print mismatch details to a stream */
+void reginfo_dump_mismatch(struct reginfo *m, struct reginfo *a, FILE *f);
 
 /* return size of reginfo */
 int reginfo_size(struct reginfo *ri);
diff --git a/risu.c b/risu.c
index 1c096a8..f613fa9 100644
--- a/risu.c
+++ b/risu.c
@@ -449,6 +449,7 @@ static int apprentice(void)
         reginfo_dump(&ri[MASTER], stderr);
         fprintf(stderr, "apprentice reginfo:\n");
         reginfo_dump(&ri[APPRENTICE], stderr);
+        fprintf(stderr, "mismatch detail (master : apprentice):\n");
         reginfo_dump_mismatch(&ri[MASTER], &ri[APPRENTICE], stderr);
         return EXIT_FAILURE;
 
diff --git a/risu_reginfo_aarch64.c b/risu_reginfo_aarch64.c
index be47980..e0f80c0 100644
--- a/risu_reginfo_aarch64.c
+++ b/risu_reginfo_aarch64.c
@@ -275,15 +275,15 @@ int reginfo_dump(struct reginfo *ri, FILE * f)
     return !ferror(f);
 }
 
-/* reginfo_dump_mismatch: print mismatch details to a stream, ret nonzero=ok */
-int reginfo_dump_mismatch(struct reginfo *m, struct reginfo *a, FILE * f)
+void reginfo_dump_mismatch(struct reginfo *m, struct reginfo *a, FILE * f)
 {
     int i;
-    fprintf(f, "mismatch detail (master : apprentice):\n");
+
     if (m->faulting_insn != a->faulting_insn) {
-        fprintf(f, "  faulting insn mismatch %08x vs %08x\n",
+        fprintf(f, "  faulting insn: %08x vs %08x\n",
                 m->faulting_insn, a->faulting_insn);
     }
+
     for (i = 0; i < 31; i++) {
         if (m->regs[i] != a->regs[i]) {
             fprintf(f, "  X%-2d    : %016" PRIx64 " vs %016" PRIx64 "\n",
@@ -342,7 +342,7 @@ int reginfo_dump_mismatch(struct reginfo *m, struct reginfo *a, FILE * f)
                 sve_dump_preg_diff(f, vq, pm, pa);
             }
         }
-        return !ferror(f);
+        return;
     }
 
     for (i = 0; i < 32; i++) {
@@ -356,6 +356,4 @@ int reginfo_dump_mismatch(struct reginfo *m, struct reginfo *a, FILE * f)
                     i, mv[1], mv[0], av[1], av[0]);
         }
     }
-
-    return !ferror(f);
 }
diff --git a/risu_reginfo_arm.c b/risu_reginfo_arm.c
index 202120b..ba1035e 100644
--- a/risu_reginfo_arm.c
+++ b/risu_reginfo_arm.c
@@ -183,32 +183,33 @@ int reginfo_dump(struct reginfo *ri, FILE *f)
     return !ferror(f);
 }
 
-int reginfo_dump_mismatch(struct reginfo *m, struct reginfo *a, FILE *f)
+void reginfo_dump_mismatch(struct reginfo *m, struct reginfo *a, FILE *f)
 {
     int i;
-    fprintf(f, "mismatch detail (master : apprentice):\n");
 
     if (m->faulting_insn_size != a->faulting_insn_size) {
-        fprintf(f, "  faulting insn size mismatch %d vs %d\n",
+        fprintf(f, "  faulting insn size: %d vs %d\n",
                 m->faulting_insn_size, a->faulting_insn_size);
     } else if (m->faulting_insn != a->faulting_insn) {
         if (m->faulting_insn_size == 2) {
-            fprintf(f, "  faulting insn mismatch %04x vs %04x\n",
+            fprintf(f, "  faulting insn: %04x vs %04x\n",
                     m->faulting_insn, a->faulting_insn);
         } else {
-            fprintf(f, "  faulting insn mismatch %08x vs %08x\n",
+            fprintf(f, "  faulting insn: %08x vs %08x\n",
                     m->faulting_insn, a->faulting_insn);
         }
     }
+
     for (i = 0; i < 16; i++) {
         if (m->gpreg[i] != a->gpreg[i]) {
-            fprintf(f, "  r%d: %08x vs %08x\n", i, m->gpreg[i],
-                    a->gpreg[i]);
+            fprintf(f, "  r%d: %08x vs %08x\n", i, m->gpreg[i], a->gpreg[i]);
         }
     }
+
     if (m->cpsr != a->cpsr) {
         fprintf(f, "  cpsr: %08x vs %08x\n", m->cpsr, a->cpsr);
     }
+
     for (i = 0; i < 32; i++) {
         if (m->fpregs[i] != a->fpregs[i]) {
             fprintf(f, "  d%d: %016llx vs %016llx\n", i,
@@ -216,9 +217,8 @@ int reginfo_dump_mismatch(struct reginfo *m, struct reginfo *a, FILE *f)
                     (unsigned long long) a->fpregs[i]);
         }
     }
+
     if (m->fpscr != a->fpscr) {
         fprintf(f, "  fpscr: %08x vs %08x\n", m->fpscr, a->fpscr);
     }
-
-    return !ferror(f);
 }
diff --git a/risu_reginfo_i386.c b/risu_reginfo_i386.c
index e9730be..57e4c00 100644
--- a/risu_reginfo_i386.c
+++ b/risu_reginfo_i386.c
@@ -349,14 +349,12 @@ int reginfo_dump(struct reginfo *ri, FILE *f)
     return !ferror(f);
 }
 
-int reginfo_dump_mismatch(struct reginfo *m, struct reginfo *a, FILE *f)
+void reginfo_dump_mismatch(struct reginfo *m, struct reginfo *a, FILE *f)
 {
     int i, j, n, w;
     uint64_t features;
     char r;
 
-    fprintf(f, "Mismatch (master v apprentice):\n");
-
     for (i = 0; i < NGREG; i++) {
         if (m->gregs[i] != a->gregs[i]) {
             assert(regname[i]);
@@ -399,6 +397,4 @@ int reginfo_dump_mismatch(struct reginfo *m, struct reginfo *a, FILE *f)
                     i, m->kregs[i], a->kregs[i]);
         }
     }
-
-    return !ferror(f);
 }
diff --git a/risu_reginfo_m68k.c b/risu_reginfo_m68k.c
index 4c25e77..29edce9 100644
--- a/risu_reginfo_m68k.c
+++ b/risu_reginfo_m68k.c
@@ -118,13 +118,12 @@ int reginfo_dump(struct reginfo *ri, FILE *f)
     return !ferror(f);
 }
 
-int reginfo_dump_mismatch(struct reginfo *m, struct reginfo *a, FILE * f)
+void reginfo_dump_mismatch(struct reginfo *m, struct reginfo *a, FILE *f)
 {
     int i;
 
     if (m->gregs[R_PS] != a->gregs[R_PS]) {
-        fprintf(f, "Mismatch: Register PS\n");
-        fprintf(f, "master: [%x] - apprentice: [%x]\n",
+        fprintf(f, "    PS: %08x vs %08x\n",
                 m->gregs[R_PS], a->gregs[R_PS]);
     }
 
@@ -133,22 +132,18 @@ int reginfo_dump_mismatch(struct reginfo *m, struct reginfo *a, FILE * f)
             continue;
         }
         if (m->gregs[i] != a->gregs[i]) {
-            fprintf(f, "Mismatch: Register %c%d\n", i < 8 ? 'D' : 'A',
-                    i % 8);
-            fprintf(f, "master: [%x] - apprentice: [%x]\n", m->gregs[i],
-                    a->gregs[i]);
+            fprintf(f, "    %c%d: %08x vs %08x\n",
+                    i < 8 ? 'D' : 'A', i % 8, m->gregs[i], a->gregs[i]);
         }
     }
 
     if (m->fpregs.f_pcr != a->fpregs.f_pcr) {
-        fprintf(f, "Mismatch: Register FPCR\n");
-        fprintf(f, "m: [%04x] != a: [%04x]\n",
+        fprintf(f, "  FPCR: %04x vs %04x\n",
                 m->fpregs.f_pcr, a->fpregs.f_pcr);
     }
 
     if (m->fpregs.f_psr != a->fpregs.f_psr) {
-        fprintf(f, "Mismatch: Register FPSR\n");
-        fprintf(f, "m: [%08x] != a: [%08x]\n",
+        fprintf(f, "  FPSR: %04x vs %04x\n",
                 m->fpregs.f_psr, a->fpregs.f_psr);
     }
 
@@ -156,14 +151,10 @@ int reginfo_dump_mismatch(struct reginfo *m, struct reginfo *a, FILE * f)
         if (m->fpregs.f_fpregs[i][0] != a->fpregs.f_fpregs[i][0] ||
             m->fpregs.f_fpregs[i][1] != a->fpregs.f_fpregs[i][1] ||
             m->fpregs.f_fpregs[i][2] != a->fpregs.f_fpregs[i][2]) {
-            fprintf(f, "Mismatch: Register FP%d\n", i);
-            fprintf(f, "m: [%08x %08x %08x] != a: [%08x %08x %08x]\n",
+            fprintf(f, "   FP%d: %08x%08x%08x vs %08x%08x%08x\n", i,
                     m->fpregs.f_fpregs[i][0], m->fpregs.f_fpregs[i][1],
                     m->fpregs.f_fpregs[i][2], a->fpregs.f_fpregs[i][0],
                     a->fpregs.f_fpregs[i][1], a->fpregs.f_fpregs[i][2]);
         }
     }
-
-
-    return !ferror(f);
 }
diff --git a/risu_reginfo_ppc64.c b/risu_reginfo_ppc64.c
index 9899b36..e96dc48 100644
--- a/risu_reginfo_ppc64.c
+++ b/risu_reginfo_ppc64.c
@@ -27,6 +27,15 @@
 const struct option * const arch_long_opts;
 const char * const arch_extra_help;
 
+static const char * const greg_names[NGREG] = {
+    "r0",  "r1",  "r2",  "r3",  "r4",  "r5",  "r6",  "r7",
+    "r8",  "r9", "r10", "r11", "r12", "r13", "r14", "r15",
+   "r16", "r17", "r18", "r19", "r20", "r21", "r22", "r23",
+   "r24", "r25", "r26", "r27", "r28", "r29", "r30", "r31",
+   [XER] = "xer",
+   [CCR] = "ccr",
+};
+
 void process_arch_opt(int opt, const char *arg)
 {
     abort();
@@ -147,35 +156,21 @@ int reginfo_dump(struct reginfo *ri, FILE * f)
     return !ferror(f);
 }
 
-int reginfo_dump_mismatch(struct reginfo *m, struct reginfo *a, FILE *f)
+void reginfo_dump_mismatch(struct reginfo *m, struct reginfo *a, FILE *f)
 {
     int i;
-    for (i = 0; i < 32; i++) {
-        if (i == 1 || i == 13) {
-            continue;
+
+    for (i = 0; i < NGREG; i++) {
+        if (greg_names[i] != NULL && m->gregs[i] != a->gregs[i]) {
+            fprintf(f, "%6s: %016lx vs %016lx\n",
+                    greg_names[i], m->gregs[i], a->gregs[i]);
         }
-
-        if (m->gregs[i] != a->gregs[i]) {
-            fprintf(f, "Mismatch: Register r%d\n", i);
-            fprintf(f, "master: [%lx] - apprentice: [%lx]\n",
-                    m->gregs[i], a->gregs[i]);
-        }
-    }
-
-    if (m->gregs[XER] != a->gregs[XER]) {
-        fprintf(f, "Mismatch: XER\n");
-        fprintf(f, "m: [%lx] != a: [%lx]\n", m->gregs[XER], a->gregs[XER]);
-    }
-
-    if (m->gregs[CCR] != a->gregs[CCR]) {
-        fprintf(f, "Mismatch: Cond. Register\n");
-        fprintf(f, "m: [%lx] != a: [%lx]\n", m->gregs[CCR], a->gregs[CCR]);
     }
 
     for (i = 0; i < 32; i++) {
         if (m->fpregs[i] != a->fpregs[i]) {
-            fprintf(f, "Mismatch: Register f%d\n", i);
-            fprintf(f, "m: [%016lx] != a: [%016lx]\n",
+            fprintf(f, "%*s%d: %016lx vs %016lx\n",
+                    6 - (i < 10 ? 1 : 2), "f", i,
                     m->fpregs[i], a->fpregs[i]);
         }
     }
@@ -186,13 +181,12 @@ int reginfo_dump_mismatch(struct reginfo *m, struct reginfo *a, FILE *f)
             m->vrregs.vrregs[i][2] != a->vrregs.vrregs[i][2] ||
             m->vrregs.vrregs[i][3] != a->vrregs.vrregs[i][3]) {
 
-            fprintf(f, "Mismatch: Register vr%d\n", i);
-            fprintf(f, "m: [%x, %x, %x, %x] != a: [%x, %x, %x, %x]\n",
+            fprintf(f, "%*s%d: %08x%08x%08x%08x vs %08x%08x%08x%08x\n",
+                    6 - (i < 10 ? 1 : 2), "vr", i,
                     m->vrregs.vrregs[i][0], m->vrregs.vrregs[i][1],
                     m->vrregs.vrregs[i][2], m->vrregs.vrregs[i][3],
                     a->vrregs.vrregs[i][0], a->vrregs.vrregs[i][1],
                     a->vrregs.vrregs[i][2], a->vrregs.vrregs[i][3]);
         }
     }
-    return !ferror(f);
 }
-- 
2.34.1

