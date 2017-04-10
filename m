Received: by 10.25.0.144 with SMTP id 138csp800706lfa;
        Mon, 10 Apr 2017 03:45:16 -0700 (PDT)
X-Received: by 10.200.51.79 with SMTP id u15mr12929922qta.171.1491821116214;
        Mon, 10 Apr 2017 03:45:16 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e30si13114980qtd.265.2017.04.10.03.45.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 10 Apr 2017 03:45:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33633 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cxWor-0001VQ-FD
	for alex.bennee@linaro.org; Mon, 10 Apr 2017 06:45:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54010)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cxWof-0001T3-Sx
	for qemu-arm@nongnu.org; Mon, 10 Apr 2017 06:45:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cxWof-00082p-3S
	for qemu-arm@nongnu.org; Mon, 10 Apr 2017 06:45:01 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:49107)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1cxWoe-000826-T4; Mon, 10 Apr 2017 06:45:01 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1cxWjk-0005RL-GP; Mon, 10 Apr 2017 11:39:56 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 10 Apr 2017 11:39:51 +0100
Message-Id: <1491820793-5348-6-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1491820793-5348-1-git-send-email-peter.maydell@linaro.org>
References: <1491820793-5348-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 5/7] arm: Move condition-failed codepath
 generation out of if()
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
X-TUID: lfCUwlMX++yV

Move the code to generate the "condition failed" instruction
codepath out of the if (singlestepping) {} else {}. This
will allow adding support for handling a new is_jmp type
which can't be neatly split into "singlestepping case"
versus "not singlestepping case".

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index a1a0e73..87fd702 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -11988,9 +11988,9 @@ void gen_intermediate_code(CPUARMState *env, TranslationBlock *tb)
     /* At this stage dc->condjmp will only be set when the skipped
        instruction was a conditional branch or trap, and the PC has
        already been written.  */
+    gen_set_condexec(dc);
     if (unlikely(cs->singlestep_enabled || dc->ss_active)) {
         /* Unconditional and "condition passed" instruction codepath. */
-        gen_set_condexec(dc);
         switch (dc->is_jmp) {
         case DISAS_SWI:
             gen_ss_advance(dc);
@@ -12013,13 +12013,6 @@ void gen_intermediate_code(CPUARMState *env, TranslationBlock *tb)
             /* FIXME: Single stepping a WFI insn will not halt the CPU. */
             gen_singlestep_exception(dc);
         }
-        if (dc->condjmp) {
-            /* "Condition failed" instruction codepath. */
-            gen_set_label(dc->condlabel);
-            gen_set_condexec(dc);
-            gen_set_pc_im(dc, dc->pc);
-            gen_singlestep_exception(dc);
-        }
     } else {
         /* While branches must always occur at the end of an IT block,
            there are a few other things that can cause us to terminate
@@ -12029,7 +12022,6 @@ void gen_intermediate_code(CPUARMState *env, TranslationBlock *tb)
             - Hardware watchpoints.
            Hardware breakpoints have already been handled and skip this code.
          */
-        gen_set_condexec(dc);
         switch(dc->is_jmp) {
         case DISAS_NEXT:
             gen_goto_tb(dc, 1, dc->pc);
@@ -12069,11 +12061,17 @@ void gen_intermediate_code(CPUARMState *env, TranslationBlock *tb)
             gen_exception(EXCP_SMC, syn_aa32_smc(), 3);
             break;
         }
-        if (dc->condjmp) {
-            gen_set_label(dc->condlabel);
-            gen_set_condexec(dc);
+    }
+
+    if (dc->condjmp) {
+        /* "Condition failed" instruction codepath for the branch/trap insn */
+        gen_set_label(dc->condlabel);
+        gen_set_condexec(dc);
+        if (unlikely(cs->singlestep_enabled || dc->ss_active)) {
+            gen_set_pc_im(dc, dc->pc);
+            gen_singlestep_exception(dc);
+        } else {
             gen_goto_tb(dc, 1, dc->pc);
-            dc->condjmp = 0;
         }
     }
 
-- 
2.7.4

