Received: by 10.25.159.19 with SMTP id i19csp1754026lfe;
        Sun, 17 Jan 2016 23:13:49 -0800 (PST)
X-Received: by 10.55.77.206 with SMTP id a197mr28855374qkb.43.1453101229767;
        Sun, 17 Jan 2016 23:13:49 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w206si29511281qhc.124.2016.01.17.23.13.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 17 Jan 2016 23:13:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:57974 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aL40b-00049g-4o
	for alex.bennee@linaro.org; Mon, 18 Jan 2016 02:13:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42344)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aL3zi-0002wt-My
	for qemu-devel@nongnu.org; Mon, 18 Jan 2016 02:12:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aL3zg-00071L-Mc
	for qemu-devel@nongnu.org; Mon, 18 Jan 2016 02:12:54 -0500
Received: from mail-pa0-x234.google.com ([2607:f8b0:400e:c03::234]:33549)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aL3zg-00071E-CR; Mon, 18 Jan 2016 02:12:52 -0500
Received: by mail-pa0-x234.google.com with SMTP id cy9so429589810pac.0;
	Sun, 17 Jan 2016 23:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=a+xAaBz6HQoUNLKVcJLsYR4pRypqOsFfehj2lTppVwg=;
	b=Z8o+gYGameEuxfVqaN7v3NbbKwak3E4plXrfps0nlVdm/8KDt3DEFaYDJ+qPhfjhT6
	FnpzS6Iqp9eKBDYVHULv9fVctqL/pdIbAWooGiFEw02cyy0siyoVDfBC2xWKJFiG5O35
	SIYpVwwrArDbhcfviea2B3N9ZDSyHvniEqK6/qrPPItW65t1R9MDns0RldgcpAC3q1ap
	ZvJXPD4ka/YfIkj6vLQSWbJVFkFYUhArZx5HUk462YqHrkCaP70ThjLHWj3WN6uMDvHa
	u+aUc9Ud73KuYRN3qdmqjq9jPz03JX5CTbAPq5eUeLAhBeKU0EFHdV7P6cUQIsWrPqRS
	nxUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=a+xAaBz6HQoUNLKVcJLsYR4pRypqOsFfehj2lTppVwg=;
	b=mASfFm8G09TBbklocba1CtwcKtzzzX5OONDti0WEYIRtMLeFKilwAQdki2tQ6z1aF/
	TIMD5nWMu/6lCY/OITmRK0/V2pcn6dhQx3fLDNy5eNXBJvQgB7Ziy/5+njndL06eWyhN
	XKms78hcIasB8zivkGpLrOXsGEg2s5vJb7OwSnc22S9N63VGHvN6szjfWoyxV8++ibJV
	/ClVwqK0uFCulSnML1eSTx/Hnsnc15a7pZbd+/05J9VpJa6GrbzjMf+/Hv6+TMPXqDOC
	FnPkoL2LiiETObQAgI8v9ZQYxQdboX6XUHEElzbGDkdZUXcP9bldiRhKCSltP39EhXx4
	eRlA==
X-Gm-Message-State: ALoCoQlRifjQXQ/APGkdaPXRcocWaYR8nDvxD9HrMyz6rG/PsM5Djnd9743XTBQNFzSYBaaY/oJpJ0+EGpibNQgsFBXr8pPI/g==
X-Received: by 10.66.190.66 with SMTP id go2mr34959896pac.114.1453101171748;
	Sun, 17 Jan 2016 23:12:51 -0800 (PST)
Received: from localhost.localdomain (c-73-70-184-119.hsd1.ca.comcast.net.
	[73.70.184.119]) by smtp.gmail.com with ESMTPSA id
	xv2sm31471880pab.10.2016.01.17.23.12.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Jan 2016 23:12:50 -0800 (PST)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun, 17 Jan 2016 23:12:28 -0800
Message-Id: <5eff48cc0abd1845fee252474b07274ea9ebd112.1453100525.git.crosthwaite.peter@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1453100525.git.crosthwaite.peter@gmail.com>
References: <cover.1453100525.git.crosthwaite.peter@gmail.com>
In-Reply-To: <cover.1453100525.git.crosthwaite.peter@gmail.com>
References: <cover.1453100525.git.crosthwaite.peter@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c03::234
Cc: peter.maydell@linaro.org, Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	alistair.francis@xilinx.com, sridhar_kulk@yahoo.com,
	qemu-arm@nongnu.org, pbonzini@redhat.com, piotr.krol@3mdeb.com
Subject: [Qemu-devel] [PATCH v1 01/17] linux-user: arm: fix coding style for
	some linux-user signal functions
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
X-TUID: JhkmjD0/JgIp

From: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
---

 linux-user/signal.c | 110 ++++++++++++++++++++++++++--------------------------
 1 file changed, 56 insertions(+), 54 deletions(-)

diff --git a/linux-user/signal.c b/linux-user/signal.c
index 919aa83..2cc6d73 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -1541,82 +1541,84 @@ static void
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
-	cpsr_write(env, cpsr, 0xffffffff);
+    env->regs[0] = usig;
+    env->regs[13] = frame_addr;
+    env->regs[14] = retcode;
+    env->regs[15] = handler & (thumb ? ~1 : ~3);
+    cpsr_write(env, cpsr, 0xffffffff);
 }
 
 static abi_ulong *setup_sigframe_v2_vfp(abi_ulong *regspace, CPUARMState *env)
-- 
1.9.1

