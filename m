Received: by 10.182.158.201 with SMTP id ww9csp124177obb;
        Wed, 25 Nov 2015 10:03:49 -0800 (PST)
X-Received: by 10.55.18.154 with SMTP id 26mr40169244qks.0.1448474629362;
        Wed, 25 Nov 2015 10:03:49 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c130si22002878qkb.35.2015.11.25.10.03.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 25 Nov 2015 10:03:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:46987 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a1eQ1-0001gD-39
	for alex.bennee@linaro.org; Wed, 25 Nov 2015 13:03:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59676)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1a1ePM-00015s-7A
	for qemu-devel@nongnu.org; Wed, 25 Nov 2015 13:03:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1a1ePI-0002mK-VF
	for qemu-devel@nongnu.org; Wed, 25 Nov 2015 13:03:08 -0500
Received: from mail-lf0-x22c.google.com ([2a00:1450:4010:c07::22c]:36160)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>)
	id 1a1ePI-0002lw-K1; Wed, 25 Nov 2015 13:03:04 -0500
Received: by lfs39 with SMTP id 39so67497886lfs.3;
	Wed, 25 Nov 2015 10:03:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=aZlIr2B1LzTMon2b02ONMDkNlWIsiF/TXpv3qCSRNgY=;
	b=jlC/Mk4++7tDHY1ZMUDRR5GjMFGCY3ST4oxIXOfgLCf7ZYB7KUW+98yGYmOxPMWSQD
	WxA22+cpInBoyRkbFUdzvADegO0yKFkWr1ddk2Md1dGLj7aFKmkH/igURe5ytvxRJKrF
	854G6wI5DMOnUDVs6nxBogNu4H/soEiW0gB6bFMW+UcgHTWgx7IaAoA2ki051vAaWnKo
	ZU+arpbRCSS2cJdxpy0TKYPgHDSW/7encw1kN4HkZm+q/50AMsKaRGh+7EbD9SfGuuMl
	AITsZXjyQjCSd7SzzsUsAdA7npBjKT6QK91CyHPHfa/jjYHFs2ziRIsy3VvXE0h2pAN5
	6qhQ==
X-Received: by 10.112.170.167 with SMTP id an7mr15398367lbc.37.1448474583122; 
	Wed, 25 Nov 2015 10:03:03 -0800 (PST)
Received: from sfedorov-laptop.smware.local ([213.243.91.10])
	by smtp.gmail.com with ESMTPSA id
	us1sm3474744lbc.25.2015.11.25.10.03.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 25 Nov 2015 10:03:01 -0800 (PST)
From: Sergey Fedorov <serge.fdrv@gmail.com>
To: qemu-devel@nongnu.org
Date: Wed, 25 Nov 2015 21:02:40 +0300
Message-Id: <1448474560-22475-1-git-send-email-serge.fdrv@gmail.com>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4010:c07::22c
Cc: Sergey Fedorov <serge.fdrv@gmail.com>, qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [Qemu-devel] [PATCH] target-arm: Fix and improve AA32 singlestep
	translation completion code
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: bsA6UgHikU2n

The AArch32 translation completion code for singlestep enabled/active
case was a way more confusing and too repetitive then it needs to be.
Probably that was the cause for a bug to be introduced into it at some
point. The bug was that SWI/HVC/SMC exception would be generated in
condition-failed instruction code path whereas it shouldn't.

This patch rewrites the code in a way similar to the non-singlestep
case.

In the condition-passed/unconditional instruction code path we need to:
 - Write the condexec bits back to the CPU state
 - Advance the singlestep state machine and generate a corresponding
   exception in case of SWI/HVC/SMC
 - Write the PC back to the CPU state if it hasn't already been written
   and generate an appropriate singlestep exception otherwise

In the condition-failed instruction code path we need to:
 - Set a TCG label to jump to it if the condition is failed
 - Write the condexec bits back to the CPU state
 - Write the PC back to the CPU state since it hasn't been written in
   this case
 - Generate an appropriate singlestep exception

Signed-off-by: Sergey Fedorov <serge.fdrv@gmail.com>
---
 target-arm/translate.c | 65 ++++++++++++++++++++++++--------------------------
 1 file changed, 31 insertions(+), 34 deletions(-)

diff --git a/target-arm/translate.c b/target-arm/translate.c
index 5d22879..c9eeb09 100644
--- a/target-arm/translate.c
+++ b/target-arm/translate.c
@@ -11480,48 +11480,45 @@ void gen_intermediate_code(CPUARMState *env, TranslationBlock *tb)
        instruction was a conditional branch or trap, and the PC has
        already been written.  */
     if (unlikely(cs->singlestep_enabled || dc->ss_active)) {
-        /* Make sure the pc is updated, and raise a debug exception.  */
-        if (dc->condjmp) {
-            gen_set_condexec(dc);
-            if (dc->is_jmp == DISAS_SWI) {
-                gen_ss_advance(dc);
-                gen_exception(EXCP_SWI, syn_aa32_svc(dc->svc_imm, dc->thumb),
-                              default_exception_el(dc));
-            } else if (dc->is_jmp == DISAS_HVC) {
-                gen_ss_advance(dc);
-                gen_exception(EXCP_HVC, syn_aa32_hvc(dc->svc_imm), 2);
-            } else if (dc->is_jmp == DISAS_SMC) {
-                gen_ss_advance(dc);
-                gen_exception(EXCP_SMC, syn_aa32_smc(), 3);
-            } else if (dc->ss_active) {
-                gen_step_complete_exception(dc);
-            } else {
-                gen_exception_internal(EXCP_DEBUG);
-            }
-            gen_set_label(dc->condlabel);
-        }
-        if (dc->condjmp || dc->is_jmp == DISAS_NEXT ||
-            dc->is_jmp == DISAS_UPDATE) {
-            gen_set_pc_im(dc, dc->pc);
-            dc->condjmp = 0;
-        }
+        /* Unconditional and "condition passed" instruction codepath. */
         gen_set_condexec(dc);
-        if (dc->is_jmp == DISAS_SWI && !dc->condjmp) {
+        switch (dc->is_jmp) {
+        case DISAS_SWI:
             gen_ss_advance(dc);
             gen_exception(EXCP_SWI, syn_aa32_svc(dc->svc_imm, dc->thumb),
                           default_exception_el(dc));
-        } else if (dc->is_jmp == DISAS_HVC && !dc->condjmp) {
+            break;
+        case DISAS_HVC:
             gen_ss_advance(dc);
             gen_exception(EXCP_HVC, syn_aa32_hvc(dc->svc_imm), 2);
-        } else if (dc->is_jmp == DISAS_SMC && !dc->condjmp) {
+            break;
+        case DISAS_SMC:
             gen_ss_advance(dc);
             gen_exception(EXCP_SMC, syn_aa32_smc(), 3);
-        } else if (dc->ss_active) {
-            gen_step_complete_exception(dc);
-        } else {
-            /* FIXME: Single stepping a WFI insn will not halt
-               the CPU.  */
-            gen_exception_internal(EXCP_DEBUG);
+            break;
+        case DISAS_NEXT:
+        case DISAS_UPDATE:
+            gen_set_pc_im(dc, dc->pc);
+            /* fall through */
+        default:
+            if (dc->ss_active) {
+                gen_step_complete_exception(dc);
+            } else {
+                /* FIXME: Single stepping a WFI insn will not halt
+                   the CPU.  */
+                gen_exception_internal(EXCP_DEBUG);
+            }
+        }
+        if (dc->condjmp) {
+            /* "Condition failed" instruction codepath. */
+            gen_set_label(dc->condlabel);
+            gen_set_condexec(dc);
+            gen_set_pc_im(dc, dc->pc);
+            if (dc->ss_active) {
+                gen_step_complete_exception(dc);
+            } else {
+                gen_exception_internal(EXCP_DEBUG);
+            }
         }
     } else {
         /* While branches must always occur at the end of an IT block,
-- 
1.9.1

