Received: by 10.182.105.169 with SMTP id gn9csp1900973obb;
        Tue, 10 Nov 2015 09:24:30 -0800 (PST)
X-Received: by 10.55.50.149 with SMTP id y143mr5736978qky.86.1447176270721;
        Tue, 10 Nov 2015 09:24:30 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f96si3735418qge.24.2015.11.10.09.24.30
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Tue, 10 Nov 2015 09:24:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:34403 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZwCej-0004kt-T8
	for alex.bennee@linaro.org; Tue, 10 Nov 2015 12:24:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40942)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1ZwCeC-00047g-Hi
	for qemu-devel@nongnu.org; Tue, 10 Nov 2015 12:23:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1ZwCe9-0002tG-6r
	for qemu-devel@nongnu.org; Tue, 10 Nov 2015 12:23:56 -0500
Received: from mail-lf0-x232.google.com ([2a00:1450:4010:c07::232]:36770)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>)
	id 1ZwCe9-0002sm-0b; Tue, 10 Nov 2015 12:23:53 -0500
Received: by lfs39 with SMTP id 39so2091837lfs.3;
	Tue, 10 Nov 2015 09:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=5SYENuA4FA2cdZ2JphwEUEGh4z3D8CbABv+CKZ8Znnw=;
	b=IvGh2DP8syZiPROl/GfOg4CYQU6dkBIY5+qMiCisKlSe2zLTf2b0VwR1kOyB1PeCin
	mr75jE88MwLU0gszYM/kVFEWCAtnw2RgAtWlwZEbbJ5cDziS6lMIxo24wZ2B3h3PYl+L
	P7GcUMIb7dt36yWEpa1AN04o/DNsg1j0sITnIO3FpMNickg1HWb7INVJ60nriA03HNbX
	FctSzmvzNAjDbDokceKxozitK22yauO5n0nXEmlBckoAcIVpI/x73e382Q81uRxnUdeJ
	vGvqCJJJYPJmSML8GOm/usac3XTO84zRs3fxQZssAHO1HzxI9VMC4CV0yuRi2sy/SQcP
	8EGQ==
X-Received: by 10.25.159.193 with SMTP id i184mr2212298lfe.63.1447176232063;
	Tue, 10 Nov 2015 09:23:52 -0800 (PST)
Received: from sfedorov-laptop.smware.local ([213.243.91.10])
	by smtp.gmail.com with ESMTPSA id y79sm695626lfd.45.2015.11.10.09.23.50
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 10 Nov 2015 09:23:51 -0800 (PST)
From: Sergey Fedorov <serge.fdrv@gmail.com>
To: qemu-devel@nongnu.org
Date: Tue, 10 Nov 2015 20:23:42 +0300
Message-Id: <1447176222-16401-1-git-send-email-serge.fdrv@gmail.com>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4010:c07::232
Cc: Sergey Fedorov <serge.fdrv@gmail.com>, qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [Qemu-devel] [PATCH] target-arm: Update PC before calling
	gen_helper_check_breakpoints()
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
X-TUID: pfyJxx3OPIW9

PC should be updated in the CPU state before calling check_breakpoints()
helper. Otherwise, the helper would not see the correct PC in the CPU
state if it is not at the start of a TB.

Signed-off-by: Sergey Fedorov <serge.fdrv@gmail.com>
---
 target-arm/translate-a64.c | 1 +
 target-arm/translate.c     | 1 +
 2 files changed, 2 insertions(+)

diff --git a/target-arm/translate-a64.c b/target-arm/translate-a64.c
index d7e0954..fe485a4 100644
--- a/target-arm/translate-a64.c
+++ b/target-arm/translate-a64.c
@@ -11102,6 +11102,7 @@ void gen_intermediate_code_a64(ARMCPU *cpu, TranslationBlock *tb)
             QTAILQ_FOREACH(bp, &cs->breakpoints, entry) {
                 if (bp->pc == dc->pc) {
                     if (bp->flags & BP_CPU) {
+                        gen_a64_set_pc_im(dc->pc);
                         gen_helper_check_breakpoints(cpu_env);
                         /* End the TB early; it likely won't be executed */
                         dc->is_jmp = DISAS_UPDATE;
diff --git a/target-arm/translate.c b/target-arm/translate.c
index a56f7fe..4351854 100644
--- a/target-arm/translate.c
+++ b/target-arm/translate.c
@@ -11373,6 +11373,7 @@ void gen_intermediate_code(CPUARMState *env, TranslationBlock *tb)
             QTAILQ_FOREACH(bp, &cs->breakpoints, entry) {
                 if (bp->pc == dc->pc) {
                     if (bp->flags & BP_CPU) {
+                        gen_set_pc_im(dc, dc->pc);
                         gen_helper_check_breakpoints(cpu_env);
                         /* End the TB early; it's likely not going to be executed */
                         dc->is_jmp = DISAS_UPDATE;
-- 
1.9.1

