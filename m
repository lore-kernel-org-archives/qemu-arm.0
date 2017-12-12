Received: by 10.223.159.74 with SMTP id f10csp3736115wrg;
        Tue, 12 Dec 2017 04:10:05 -0800 (PST)
X-Google-Smtp-Source: ACJfBovI8FtCuruqovR22WxfbZ7ifMTSa72roj5gzDL7u399Z+rKTK9uXmp5m1q2St51+JW8tECX
X-Received: by 10.129.165.88 with SMTP id c85mr2466923ywh.171.1513080605284;
        Tue, 12 Dec 2017 04:10:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513080605; cv=none;
        d=google.com; s=arc-20160816;
        b=qRUpmGebcvD0rKdofvWOTpVFsOpeEUyno3s7zrjq3DpBTiVbStYxDCrRRsiiE5RyeT
         6fv19OuPlHErJNZy6eQeiRWzAmpKBoKFO5OCUEKuEYXuroTnPYHIof/mYfKQH2ky+tCv
         0+5S6KCa80u6EiaATM+OiDtimlJO4zR7ANe9zpEQF5FQT6ieMInq5cmih48WJoEeqwLS
         ufNwwN09I9PiHdVPgEc5Hz++C8HOUkTkY+wRwXnj7zqH+KAoEMdm9hKW99hXyyTbq4tu
         rTILmMTapLLOnHtMJpyx2yx9/izUXL+iaf1rt2dsOpKvtnE0IXUwvJA5KfXImHwR5kJY
         N63A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=okzLwimcLckycNznp/jDVRXHhHQp/z0RtiVOBry4BzU=;
        b=n1pe76UNpIO+CPq/sIngB47yOMbWVUbWa03xWi2d6kkVlBtaWqPDV9bmiYDHcLXL+j
         OZdWWZDtz3Ue5vWAWMRvTTtAUSLyB1wETk2KU1nu+msQb17noI/K7OpRtBAxZeHF9gF7
         Tr7mkggjqnH2XlL/mHEl3weBgKVGO9O64Lby+tpchvmJy8yN7iTdwDCVMv/wJAAGga1e
         KPiD1v3VQAecE3XEGIprd7NDZU1U0hAtAhGscdVawoq3bVK++7V+8iGNsa2lqe6hrIjn
         fYUz2JilE8LSb7I0jfCcUPOsuzFAg9wh7LDzOK/K8x3aW+O6xrZ8FMbZ5FuFP0CaxApr
         lrhg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s138si1931533ybc.782.2017.12.12.04.10.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Dec 2017 04:10:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57851 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eOjNs-0005j6-Fj
	for alex.bennee@linaro.org; Tue, 12 Dec 2017 07:10:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55220)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eOjMO-0004uA-86
	for qemu-arm@nongnu.org; Tue, 12 Dec 2017 07:08:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eOjMN-00049y-7C
	for qemu-arm@nongnu.org; Tue, 12 Dec 2017 07:08:32 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:39022)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1eOjMM-00048z-Vq; Tue, 12 Dec 2017 07:08:31 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1eOjMK-0005gw-66; Tue, 12 Dec 2017 12:08:28 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 12 Dec 2017 12:08:26 +0000
Message-Id: <1513080506-17703-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH] target/arm: Make disas_thumb2_insn() generate
 its own UNDEF exceptions
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <rth@twiddle.net>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gMYOXIFZCx46

Refactor disas_thumb2_insn() so that it generates the code for raising
an UNDEF exception for invalid insns, rather than returning a flag
which the caller must check to see if it needs to generate the UNDEF
code. This brings the function in to line with the behaviour of
disas_thumb_insn() and disas_arm_insn().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
This fixes the odd asymmetry of API that caused the bug fixed
in commit 7472e2efb...
---
 target/arm/translate.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index f120932..89ee353 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9771,9 +9771,8 @@ gen_thumb2_data_op(DisasContext *s, int op, int conds, uint32_t shifter_out,
     return 0;
 }
 
-/* Translate a 32-bit thumb instruction.  Returns nonzero if the instruction
-   is not legal.  */
-static int disas_thumb2_insn(DisasContext *s, uint32_t insn)
+/* Translate a 32-bit thumb instruction. */
+static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
 {
     uint32_t imm, shift, offset;
     uint32_t rd, rn, rm, rs;
@@ -10985,16 +10984,16 @@ static int disas_thumb2_insn(DisasContext *s, uint32_t insn)
                     /* UNPREDICTABLE, unallocated hint or
                      * PLD/PLDW/PLI (literal)
                      */
-                    return 0;
+                    return;
                 }
                 if (op1 & 1) {
-                    return 0; /* PLD/PLDW/PLI or unallocated hint */
+                    return; /* PLD/PLDW/PLI or unallocated hint */
                 }
                 if ((op2 == 0) || ((op2 & 0x3c) == 0x30)) {
-                    return 0; /* PLD/PLDW/PLI or unallocated hint */
+                    return; /* PLD/PLDW/PLI or unallocated hint */
                 }
                 /* UNDEF space, or an UNPREDICTABLE */
-                return 1;
+                goto illegal_op;
             }
         }
         memidx = get_mem_index(s);
@@ -11120,9 +11119,10 @@ static int disas_thumb2_insn(DisasContext *s, uint32_t insn)
     default:
         goto illegal_op;
     }
-    return 0;
+    return;
 illegal_op:
-    return 1;
+    gen_exception_insn(s, 4, EXCP_UDEF, syn_uncategorized(),
+                       default_exception_el(s));
 }
 
 static void disas_thumb_insn(DisasContext *s, uint32_t insn)
@@ -12245,10 +12245,7 @@ static void thumb_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
     if (is_16bit) {
         disas_thumb_insn(dc, insn);
     } else {
-        if (disas_thumb2_insn(dc, insn)) {
-            gen_exception_insn(dc, 4, EXCP_UDEF, syn_uncategorized(),
-                               default_exception_el(dc));
-        }
+        disas_thumb2_insn(dc, insn);
     }
 
     /* Advance the Thumb condexec condition.  */
-- 
2.7.4

