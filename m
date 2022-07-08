Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp363604lft;
        Fri, 8 Jul 2022 09:09:40 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tNCOE4U943odaylq4CALyDf9rVT7Pfg7iPsG6dn08ay64rPDYbyZ9E7PijyxVzHmydsGMe
X-Received: by 2002:a05:620a:12b0:b0:6b5:63b8:a571 with SMTP id x16-20020a05620a12b000b006b563b8a571mr2453666qki.323.1657296579892;
        Fri, 08 Jul 2022 09:09:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657296579; cv=none;
        d=google.com; s=arc-20160816;
        b=Sd1GZDAYmv3rEXyNK1xrmy+TEwQQ+V+r+GnWTJqA3fnFQHYGHOWNBPgXsTr24JugPn
         qQ6jDYFuNVgx1nw/sQh8yLb6qQHbpxjU4QKmLthrkQuzVnqdMhYyldyEzU2pq5whGKJz
         klSbzhvAUKZuO5V+tZa9ltB+mPYqmqQIGSpGBJyLY0UVnmvuDUwcSHUm/sB7Vq6pYxlw
         /lgbieqQhWbEu2P86q4lWnMG3+oUiHPsV/jK6QSMUQyZLMkUTltRLKOGzPXlgPzfovsD
         ++G/xxQPMsjmG+isGqWWGHc3Wv3EZseGHrXHkZGZJsmV5mz8o/Um5gqGuopKkpNDYvCw
         bTug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Gkz60hItXrZkNCsstqfCphoprTGAep7xB2MfvanXt1s=;
        b=kPWpwDGFKXqgdwGtcAoeuoUjud9t5Bm4aDnfEf9KfJy7UUF+WwtCKPXgrU0KjVdOkc
         esxkJzfTqS8vTTub3qESUqoOqB+AETcErHVRnqNwloj1Eqhv2uNmPDWsDFDYfgDl+Bs+
         BfwAWuGByAfNS+jud8JbfaVQPaYXcMK7lxKUi2xouMjWrvEnpTLaLpEhzWuz5GUbXBvS
         AYyOno1WXQYRy2OhHsMdD+gFvjKMijxhVMxyiSpOwuo/AX/gw//4z8scdL1+GxIuzDmb
         v1YAqlhQ9CHcIfMlWPZKOC03vz9slkvNi6hMUTyus1sn6ldfxsj6y/P3PVpZJtD9laPl
         /tlQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vQ0vn6lM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x14-20020a05620a448e00b006b47631b63dsi10224924qkp.115.2022.07.08.09.09.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Jul 2022 09:09:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vQ0vn6lM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o9qXz-0008FA-B3
	for alex.bennee@linaro.org; Fri, 08 Jul 2022 12:09:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9qDT-0006X3-6s
 for qemu-arm@nongnu.org; Fri, 08 Jul 2022 11:48:27 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:34774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9qDR-0002Wr-87
 for qemu-arm@nongnu.org; Fri, 08 Jul 2022 11:48:26 -0400
Received: by mail-pl1-x633.google.com with SMTP id z1so10879414plb.1
 for <qemu-arm@nongnu.org>; Fri, 08 Jul 2022 08:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Gkz60hItXrZkNCsstqfCphoprTGAep7xB2MfvanXt1s=;
 b=vQ0vn6lMzOSY8bE1bJ27YtqaxETWdngV19L7OhPVSGe8mwa8cEZXeI7o39TIrWQ1J4
 HpSSn725Vlq5IBcFVmKp8B5mnBc+abHk2erfFzkhfZsIU3I9vOQkD3ADiddLRYVPEF94
 RIde31578iVTd4gjlaoz6pmBZMVfM0ImVDf4U6X6SSMAwU8Wg4dx9pgAvWSJpFitOIhU
 bPWkRoKFpP/Fz502BvqNEZKjKz8r4gAufzTpSYIRqdKztEdtNbvBhv07msFHkfSul2H5
 xDhvQykmfLJKHq49x7Kcn0upa4aXhchFXEYsfVP5r2u0HoJVGBJoLhPQd3sR6uqUGnMw
 yWcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Gkz60hItXrZkNCsstqfCphoprTGAep7xB2MfvanXt1s=;
 b=k6F7HcqmFd7i5ET9vJXl76fpaWBfmhipWC0u4gKzSbwVah2KzxI1tWYNg5KV5zOvr1
 4AKqVHX5Qyna1SE+qaekoZ5cwsxo6Ihojp9ffXCcL0xxL7BoObmkUvcqX2VSuDDhTSD1
 2ymZQVcEuydxqrZM0IQVL+V0pBJYlhV//Pq70L2FqzAeAq0Wog/vsAPbubk6V8riHwdc
 lu8IxChRodQBkQi8oWuTJ7TjyeEJXsT2YVvaU06XB9ZVtnHNpBSOVY+eP0wt1HyRJAmS
 Us2BcarkD7sbeTUtN6xWAfIi2Z2bxxLLfurT0b9taJxNzlCLjLY3RHfDv39srHgaJlzL
 algw==
X-Gm-Message-State: AJIora/z+Rxz5l60/WdM3jiDK+/Y5g1+xLFDSVjpiMwOZWffHbme2KMv
 Tmu2n9j1bIovwEo6IELi17nVItMIMiHjcAHQ
X-Received: by 2002:a17:90a:dc01:b0:1ef:e3bd:a473 with SMTP id
 i1-20020a17090adc0100b001efe3bda473mr489405pjv.129.1657295304517; 
 Fri, 08 Jul 2022 08:48:24 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 y3-20020a17090a390300b001ef81bac701sm1782089pjb.42.2022.07.08.08.48.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:48:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [RISU PATCH v4 26/29] ppc64: Clean up reginfo handling
Date: Fri,  8 Jul 2022 21:16:57 +0530
Message-Id: <20220708154700.18682-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708154700.18682-1-richard.henderson@linaro.org>
References: <20220708154700.18682-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
X-TUID: Ix7GeQs7Sop7

Several of the gp_reg[] elements are not relevant -- e.g. orig r3,
which is related to system calls.  Omit those from the original
reginfo_init(), so that any differences are automatically hidden.

Do not only compare bit 4 of CCR -- this register is 32 bits wide
with 8 cr subfields.  We should compare all of them.

Tidy reginfo_dump() output.  Especially, do not dump the non-
relevant fields.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 risu_reginfo_ppc64.c | 114 +++++++++++++++++--------------------------
 1 file changed, 44 insertions(+), 70 deletions(-)

diff --git a/risu_reginfo_ppc64.c b/risu_reginfo_ppc64.c
index 134a152..eeb0460 100644
--- a/risu_reginfo_ppc64.c
+++ b/risu_reginfo_ppc64.c
@@ -21,19 +21,30 @@
 #include "risu.h"
 #include "risu_reginfo_ppc64.h"
 
-#define XER 37
-#define CCR 38
+/* Names for indexes within gregset_t, ignoring those irrelevant here */
+enum {
+    NIP = 32,
+    MSR = 33,
+    CTR = 35,
+    LNK = 36,
+    XER = 37,
+    CCR = 38,
+};
 
 const struct option * const arch_long_opts;
 const char * const arch_extra_help;
 
 static const char * const greg_names[NGREG] = {
-    "r0",  "r1",  "r2",  "r3",  "r4",  "r5",  "r6",  "r7",
-    "r8",  "r9", "r10", "r11", "r12", "r13", "r14", "r15",
-   "r16", "r17", "r18", "r19", "r20", "r21", "r22", "r23",
-   "r24", "r25", "r26", "r27", "r28", "r29", "r30", "r31",
-   [XER] = "xer",
-   [CCR] = "ccr",
+     "r0",  "r1",  "r2",  "r3",  "r4",  "r5",  "r6",  "r7",
+     "r8",  "r9", "r10", "r11", "r12", "r13", "r14", "r15",
+    "r16", "r17", "r18", "r19", "r20", "r21", "r22", "r23",
+    "r24", "r25", "r26", "r27", "r28", "r29", "r30", "r31",
+    [NIP] = "nip",
+    [MSR] = "msr",
+    [CTR] = "ctr",
+    [LNK] = "lnk",
+    [XER] = "xer",
+    [CCR] = "ccr",
 };
 
 void process_arch_opt(int opt, const char *arg)
@@ -61,8 +72,13 @@ void reginfo_init(struct reginfo *ri, ucontext_t *uc)
     ri->nip = uc->uc_mcontext.regs->nip - image_start_address;
 
     for (i = 0; i < NGREG; i++) {
-        ri->gregs[i] = uc->uc_mcontext.gp_regs[i];
+        /* Do not copy gp_reg entries not relevant to the context. */
+        if (greg_names[i]) {
+            ri->gregs[i] = uc->uc_mcontext.gp_regs[i];
+        }
     }
+    ri->gregs[1] = 0xdeadbeef;   /* sp */
+    ri->gregs[13] = 0xdeadbeef;  /* gp */
 
     memcpy(ri->fpregs, uc->uc_mcontext.fp_regs, 32 * sizeof(double));
     ri->fpscr = uc->uc_mcontext.fp_regs[32];
@@ -76,79 +92,37 @@ void reginfo_init(struct reginfo *ri, ucontext_t *uc)
 /* reginfo_is_eq: compare the reginfo structs, returns nonzero if equal */
 int reginfo_is_eq(struct reginfo *m, struct reginfo *a)
 {
-    int i;
-    for (i = 0; i < 32; i++) {
-        if (i == 1 || i == 13) {
-            continue;
-        }
-
-        if (m->gregs[i] != a->gregs[i]) {
-            return 0;
-        }
-    }
-
-    if (m->gregs[XER] != a->gregs[XER]) {
-        return 0;
-    }
-
-    if ((m->gregs[CCR] & 0x10) != (a->gregs[CCR] & 0x10)) {
-        return 0;
-    }
-
-    for (i = 0; i < 32; i++) {
-        if (m->fpregs[i] != a->fpregs[i]) {
-            return 0;
-        }
-    }
-
-    for (i = 0; i < 32; i++) {
-        if (m->vrregs.vrregs[i][0] != a->vrregs.vrregs[i][0] ||
-            m->vrregs.vrregs[i][1] != a->vrregs.vrregs[i][1] ||
-            m->vrregs.vrregs[i][2] != a->vrregs.vrregs[i][2] ||
-            m->vrregs.vrregs[i][3] != a->vrregs.vrregs[i][3]) {
-            return 0;
-        }
-    }
-    return 1;
+    return memcmp(m, a, sizeof(*m)) == 0;
 }
 
 /* reginfo_dump: print state to a stream */
 void reginfo_dump(struct reginfo *ri, FILE * f)
 {
-    int i;
+    const char *sep;
+    int i, j;
 
-    fprintf(f, "  faulting insn 0x%x\n", ri->faulting_insn);
-    fprintf(f, "  prev insn     0x%x\n", ri->prev_insn);
-    fprintf(f, "  prev addr    0x%" PRIx64 "\n\n", ri->nip);
+    fprintf(f, "%6s: %08x\n", "insn", ri->faulting_insn);
+    fprintf(f, "%6s: %016lx\n", "pc", ri->nip);
 
-    for (i = 0; i < 16; i++) {
-        fprintf(f, "\tr%2d: %16lx\tr%2d: %16lx\n", i, ri->gregs[i],
-                i + 16, ri->gregs[i + 16]);
+    sep = "";
+    for (i = j = 0; i < NGREG; i++) {
+        if (greg_names[i] != NULL) {
+            fprintf(f, "%s%6s: %016lx", sep, greg_names[i], ri->gregs[i]);
+            sep = (++j & 1 ? "  " : "\n");
+        }
     }
 
-    fprintf(f, "\n");
-    fprintf(f, "\tnip    : %16lx\n", ri->gregs[32]);
-    fprintf(f, "\tmsr    : %16lx\n", ri->gregs[33]);
-    fprintf(f, "\torig r3: %16lx\n", ri->gregs[34]);
-    fprintf(f, "\tctr    : %16lx\n", ri->gregs[35]);
-    fprintf(f, "\tlnk    : %16lx\n", ri->gregs[36]);
-    fprintf(f, "\txer    : %16lx\n", ri->gregs[37]);
-    fprintf(f, "\tccr    : %16lx\n", ri->gregs[38]);
-    fprintf(f, "\tmq     : %16lx\n", ri->gregs[39]);
-    fprintf(f, "\ttrap   : %16lx\n", ri->gregs[40]);
-    fprintf(f, "\tdar    : %16lx\n", ri->gregs[41]);
-    fprintf(f, "\tdsisr  : %16lx\n", ri->gregs[42]);
-    fprintf(f, "\tresult : %16lx\n", ri->gregs[43]);
-    fprintf(f, "\tdscr   : %16lx\n\n", ri->gregs[44]);
-
-    for (i = 0; i < 16; i++) {
-        fprintf(f, "\tf%2d: %016lx\tf%2d: %016lx\n", i, ri->fpregs[i],
-                i + 16, ri->fpregs[i + 16]);
+    sep = "\n";
+    for (i = j = 0; i < 32; i++) {
+        fprintf(f, "%s%*s%d: %016lx",
+                sep, 6 - (i < 10 ? 1 : 2), "f", i, ri->fpregs[i]);
+        sep = (++j & 1 ? "  " : "\n");
     }
-    fprintf(f, "\tfpscr: %016lx\n\n", ri->fpscr);
+    fprintf(f, "\n%6s: %016lx\n", "fpscr", ri->fpscr);
 
     for (i = 0; i < 32; i++) {
-        fprintf(f, "vr%02d: %8x, %8x, %8x, %8x\n", i,
+        fprintf(f, "%*s%d: %08x %08x %08x %08x\n",
+                6 - (i < 10 ? 1 : 2), "vr", i,
                 ri->vrregs.vrregs[i][0], ri->vrregs.vrregs[i][1],
                 ri->vrregs.vrregs[i][2], ri->vrregs.vrregs[i][3]);
     }
-- 
2.34.1

