Received: by 10.25.208.211 with SMTP id h202csp2008217lfg;
        Tue, 1 Mar 2016 22:56:54 -0800 (PST)
X-Received: by 10.55.74.9 with SMTP id x9mr31711253qka.81.1456901814805;
        Tue, 01 Mar 2016 22:56:54 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x198si5697257qka.46.2016.03.01.22.56.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 01 Mar 2016 22:56:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54421 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ab0iL-0005xS-QH
	for alex.bennee@linaro.org; Wed, 02 Mar 2016 01:56:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55959)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1ab0iI-0005pu-27
	for qemu-arm@nongnu.org; Wed, 02 Mar 2016 01:56:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1ab0iG-0003OS-UO
	for qemu-arm@nongnu.org; Wed, 02 Mar 2016 01:56:50 -0500
Received: from mail-pf0-x22f.google.com ([2607:f8b0:400e:c00::22f]:35960)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1ab0iE-0003MF-0I; Wed, 02 Mar 2016 01:56:46 -0500
Received: by mail-pf0-x22f.google.com with SMTP id l6so30957789pfl.3;
	Tue, 01 Mar 2016 22:56:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=YyCb94aZegngs1te3SBHRNSSlzt2NtDnWp77jL5uZtU=;
	b=arR6pf6vkRPixEoIBuF8mQO3G3v741jGTNdM5ng6rZp9yojeFw0MEN1el2lmzV7nm1
	/x/rHbba8E/y7GHMkWRArAz4KjQPdEmgh5AjGe71JrlZMG0LONXv6aAo5GEvfuWTorJB
	HH+md7BpBh41Ot+dgPcaAVlEPysqh37GNs/uaTsWJ5POrYUKiCsUf+eDRdxeHL4L9d0V
	dEvfYBV6IyU/OincNc4/88RxmZCf3jrdYBRWClNZecpcjYeNZGduZQVx1LXhFruWx0Lx
	SDFn7WHGRndUo96NlG0OQ30bLuE9Ec6sKsMWWaQMC/2nWsORA+2PEyMYBse+dU7sXpdQ
	f4UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=YyCb94aZegngs1te3SBHRNSSlzt2NtDnWp77jL5uZtU=;
	b=Rll7jSyxbLhbFoNpd0xoXdJWGALeJQoDt0e/5snVdrGTwyjt3uyfcn+IM4iFvOhGUL
	JRWtWgDqwT5DCWghP3f+4+F/5gPGxic7KW53dlL+IgM5fVnGuv+72mW1FbJrcDUz0SXt
	aZNPMKY/fNTaxunXcW128v0/bEn+B6AT0VU44BVZRjqbMGf3kQQsd6xjlLLAiawiYWQX
	d7UfRgHRP1SSGlZXiMhmUsw/mnD7Ton9zbxumjy6t5k+zhUo6w4jaLJRJ+vRVTQsq5Al
	gGVpO0N0S/5DF+f60xOOPMpm98QpbwFh9wDlPYAQO36iDfJqrv5NKmg9fN+ap6jZ5jG9
	ceCw==
X-Gm-Message-State: AD7BkJJQoRZ+PCc8XJnetoBtmDEfYgL4qCyovnZEMT3TZmQPV6lY8LGbYWQFSoNUCskInA==
X-Received: by 10.98.14.149 with SMTP id 21mr36288895pfo.79.1456901805237;
	Tue, 01 Mar 2016 22:56:45 -0800 (PST)
Received: from localhost.localdomain (mobile-166-137-179-103.mycingular.net.
	[166.137.179.103]) by smtp.gmail.com with ESMTPSA id
	19sm50069248pfb.64.2016.03.01.22.56.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 01 Mar 2016 22:56:44 -0800 (PST)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
To: qemu-devel@nongnu.org
Date: Tue,  1 Mar 2016 22:56:05 -0800
Message-Id: <27181ed7f7bbc03289dd5f82ef5865651fd454e1.1456901522.git.crosthwaite.peter@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1456901522.git.crosthwaite.peter@gmail.com>
References: <cover.1456901522.git.crosthwaite.peter@gmail.com>
In-Reply-To: <cover.1456901522.git.crosthwaite.peter@gmail.com>
References: <cover.1456901522.git.crosthwaite.peter@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::22f
Cc: peter.maydell@linaro.org, sw@weilnetz.de, Andrew.Baumann@microsoft.com,
	alistair.francis@xilinx.com, sridhar_kulk@yahoo.com,
	qemu-arm@nongnu.org, pbonzini@redhat.com, piotr.krol@3mdeb.com
Subject: [Qemu-arm] [PATCH v2 01/18] linux-user: arm: fix coding style for
	some linux-user signal functions
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: YlhHU3mnHJVu

From: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
---
TEST result: 0 (log@ logs/qemu-armeb-BE32-)
TEST result: 0 (log@ logs/qemu-armeb-BE8-)
TEST result: 0 (log@ logs/qemu-arm-LE-)
TEST result: 0 (log@ logs/qemu-system-arm-LE-)

 linux-user/signal.c | 110 ++++++++++++++++++++++++++--------------------------
 1 file changed, 56 insertions(+), 54 deletions(-)

diff --git a/linux-user/signal.c b/linux-user/signal.c
index 962111c..96e86c0 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -1536,82 +1536,84 @@ static void
 setup_sigcontext(struct target_sigcontext *sc, /*struct _fpstate *fpstate,*/
                  CPUARMState *env, abi_ulong mask)
 {
-	__put_user(env->regs[0], &sc->arm_r0);
-	__put_user(env->regs[1], &sc->arm_r1);
-	__put_user(env->regs[2], &sc->arm_r2);
-	__put_user(env->regs[3], &sc->arm_r3);
-	__put_user(env->regs[4], &sc->arm_r4);
-	__put_user(env->regs[5], &sc->arm_r5);
-	__put_user(env->regs[6], &sc->arm_r6);
-	__put_user(env->regs[7], &sc->arm_r7);
-	__put_user(env->regs[8], &sc->arm_r8);
-	__put_user(env->regs[9], &sc->arm_r9);
-	__put_user(env->regs[10], &sc->arm_r10);
-	__put_user(env->regs[11], &sc->arm_fp);
-	__put_user(env->regs[12], &sc->arm_ip);
-	__put_user(env->regs[13], &sc->arm_sp);
-	__put_user(env->regs[14], &sc->arm_lr);
-	__put_user(env->regs[15], &sc->arm_pc);
+    __put_user(env->regs[0], &sc->arm_r0);
+    __put_user(env->regs[1], &sc->arm_r1);
+    __put_user(env->regs[2], &sc->arm_r2);
+    __put_user(env->regs[3], &sc->arm_r3);
+    __put_user(env->regs[4], &sc->arm_r4);
+    __put_user(env->regs[5], &sc->arm_r5);
+    __put_user(env->regs[6], &sc->arm_r6);
+    __put_user(env->regs[7], &sc->arm_r7);
+    __put_user(env->regs[8], &sc->arm_r8);
+    __put_user(env->regs[9], &sc->arm_r9);
+    __put_user(env->regs[10], &sc->arm_r10);
+    __put_user(env->regs[11], &sc->arm_fp);
+    __put_user(env->regs[12], &sc->arm_ip);
+    __put_user(env->regs[13], &sc->arm_sp);
+    __put_user(env->regs[14], &sc->arm_lr);
+    __put_user(env->regs[15], &sc->arm_pc);
 #ifdef TARGET_CONFIG_CPU_32
-	__put_user(cpsr_read(env), &sc->arm_cpsr);
+    __put_user(cpsr_read(env), &sc->arm_cpsr);
 #endif
 
-	__put_user(/* current->thread.trap_no */ 0, &sc->trap_no);
-	__put_user(/* current->thread.error_code */ 0, &sc->error_code);
-	__put_user(/* current->thread.address */ 0, &sc->fault_address);
-	__put_user(mask, &sc->oldmask);
+    __put_user(/* current->thread.trap_no */ 0, &sc->trap_no);
+    __put_user(/* current->thread.error_code */ 0, &sc->error_code);
+    __put_user(/* current->thread.address */ 0, &sc->fault_address);
+    __put_user(mask, &sc->oldmask);
 }
 
 static inline abi_ulong
 get_sigframe(struct target_sigaction *ka, CPUARMState *regs, int framesize)
 {
-	unsigned long sp = regs->regs[13];
+    unsigned long sp = regs->regs[13];
 
-	/*
-	 * This is the X/Open sanctioned signal stack switching.
-	 */
-	if ((ka->sa_flags & TARGET_SA_ONSTACK) && !sas_ss_flags(sp))
-            sp = target_sigaltstack_used.ss_sp + target_sigaltstack_used.ss_size;
-	/*
-	 * ATPCS B01 mandates 8-byte alignment
-	 */
-	return (sp - framesize) & ~7;
+    /*
+     * This is the X/Open sanctioned signal stack switching.
+     */
+    if ((ka->sa_flags & TARGET_SA_ONSTACK) && !sas_ss_flags(sp)) {
+        sp = target_sigaltstack_used.ss_sp + target_sigaltstack_used.ss_size;
+    }
+    /*
+     * ATPCS B01 mandates 8-byte alignment
+     */
+    return (sp - framesize) & ~7;
 }
 
 static void
 setup_return(CPUARMState *env, struct target_sigaction *ka,
 	     abi_ulong *rc, abi_ulong frame_addr, int usig, abi_ulong rc_addr)
 {
-	abi_ulong handler = ka->_sa_handler;
-	abi_ulong retcode;
-	int thumb = handler & 1;
-	uint32_t cpsr = cpsr_read(env);
+    abi_ulong handler = ka->_sa_handler;
+    abi_ulong retcode;
+    int thumb = handler & 1;
+    uint32_t cpsr = cpsr_read(env);
 
-	cpsr &= ~CPSR_IT;
-	if (thumb) {
-		cpsr |= CPSR_T;
-	} else {
-		cpsr &= ~CPSR_T;
-	}
+    cpsr &= ~CPSR_IT;
+    if (thumb) {
+        cpsr |= CPSR_T;
+    } else {
+        cpsr &= ~CPSR_T;
+    }
 
-	if (ka->sa_flags & TARGET_SA_RESTORER) {
-		retcode = ka->sa_restorer;
-	} else {
-		unsigned int idx = thumb;
+    if (ka->sa_flags & TARGET_SA_RESTORER) {
+        retcode = ka->sa_restorer;
+    } else {
+        unsigned int idx = thumb;
 
-		if (ka->sa_flags & TARGET_SA_SIGINFO)
-			idx += 2;
+        if (ka->sa_flags & TARGET_SA_SIGINFO) {
+            idx += 2;
+        }
 
         __put_user(retcodes[idx], rc);
 
-		retcode = rc_addr + thumb;
-	}
+        retcode = rc_addr + thumb;
+    }
 
-	env->regs[0] = usig;
-	env->regs[13] = frame_addr;
-	env->regs[14] = retcode;
-	env->regs[15] = handler & (thumb ? ~1 : ~3);
-        cpsr_write(env, cpsr, CPSR_IT | CPSR_T, CPSRWriteByInstr);
+    env->regs[0] = usig;
+    env->regs[13] = frame_addr;
+    env->regs[14] = retcode;
+    env->regs[15] = handler & (thumb ? ~1 : ~3);
+    cpsr_write(env, cpsr, CPSR_IT | CPSR_T, CPSRWriteByInstr);
 }
 
 static abi_ulong *setup_sigframe_v2_vfp(abi_ulong *regspace, CPUARMState *env)
-- 
1.9.1

