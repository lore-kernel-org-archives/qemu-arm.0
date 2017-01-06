Received: by 10.25.205.13 with SMTP id d13csp10383513lfg;
        Fri, 6 Jan 2017 08:51:30 -0800 (PST)
X-Received: by 10.200.37.7 with SMTP id 7mr80782451qtm.102.1483721490602;
        Fri, 06 Jan 2017 08:51:30 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u58si50527042qtu.155.2017.01.06.08.51.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 06 Jan 2017 08:51:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:53756 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cPXjk-0005XZ-2O
	for alex.bennee@linaro.org; Fri, 06 Jan 2017 11:51:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52326)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kirkseraph@gmail.com>) id 1cPXGs-0002qv-EN
	for qemu-arm@nongnu.org; Fri, 06 Jan 2017 11:21:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kirkseraph@gmail.com>) id 1cPXGr-0001Kp-AS
	for qemu-arm@nongnu.org; Fri, 06 Jan 2017 11:21:38 -0500
Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243]:36049)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <kirkseraph@gmail.com>)
	id 1cPXGm-0001J6-Gs; Fri, 06 Jan 2017 11:21:32 -0500
Received: by mail-wm0-x243.google.com with SMTP id m203so6078506wma.3;
	Fri, 06 Jan 2017 08:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=YXJdGYwJ79ICvURcKeh8lI/ta527hCTRYtErAwdjJ+w=;
	b=lat7/pkB+9VWI/rQdUSCw4xzxPNbmEasD472okjQ+ehFkbGjvaiKrwH+5+qF/ws1zK
	WX2xobOsBDuXFf+uX3rXlVWEHyML79DX1jk4QZqzlul5k8grH+VR8q85QsZMQYhx4w+F
	LIxPyUf4ZAWlXDm4eIQqB4ka0iZKuxK/ZLImts4NH0Rsqi0MzvqH7QUs6DGlckxGo3Ex
	/EsXRPodo0OrAgAY7i0w3e5doP94wZ6LFlh4K7r6YB0iApa5B5aBuyELAPkMjSZ9PVPC
	s78huA87rOgAbqbxMaIvgMLHqz+c4kdxnjq4rCPHMXNu+HH9izp9jhASo7dcR2Cy9Neg
	p2Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=YXJdGYwJ79ICvURcKeh8lI/ta527hCTRYtErAwdjJ+w=;
	b=ZGyR+XX5O/GGvkUw1x0YJbPuFvPrDKQ2a8zKN5RK6zVOPy6xyrBSr8K2ObALBPzhte
	qyFDjX+5BN4gzeLjk64Z2yjhx2EBPj6+uBJIYzkp59S4QYU3Vre9JAzqjSxrkGkhn1Lq
	c3g2aARIQFtCFJM3s7ztU0i0iN+glpYSca8DTIUgoX7lf/DQi6iLkIHTu9IioNvMEo3O
	jDV9ka9MdByhzeRq/OMaha0u9GxGhXcZmjO/wKorH1Ux/4pPZZUcJzmT/cx4Yk5ycnKu
	vPyjWjdsWXxF4Gi1r4ZqLahdNftnXP2vLihE1UNR/qgqoCwQugWMcQjUthSKIXNUrpET
	YAiA==
X-Gm-Message-State: AIkVDXI4qdbShzPSOLOYnCmR5KZa016j2+B7cwNbe+ZVBG1MSvcscsv1AQQMiFbABcYZZA==
X-Received: by 10.223.161.145 with SMTP id u17mr1655025wru.89.1483719691215;
	Fri, 06 Jan 2017 08:21:31 -0800 (PST)
Received: from localhost (cha92-19-78-239-153-115.fbx.proxad.net.
	[78.239.153.115]) by smtp.gmail.com with ESMTPSA id
	f10sm109349832wjl.28.2017.01.06.08.21.29
	(version=TLS1 cipher=AES128-SHA bits=128/128);
	Fri, 06 Jan 2017 08:21:30 -0800 (PST)
Received: by localhost (sSMTP sendmail emulation);
	Fri, 06 Jan 2017 17:21:28 +0100
From: Seraphime Kirkovski <kirkseraph@gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>
Date: Fri,  6 Jan 2017 17:21:16 +0100
Message-Id: <20170106162116.12859-1-kirkseraph@gmail.com>
X-Mailer: git-send-email 2.11.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::243
Subject: [Qemu-arm] [Qemu-devel] [PATCHv2] target-arm/abi32: check for
 segfault in do_kernel_trap
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	Seraphime Kirkovski <kirkseraph@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: V9TGfT8z1ZwT

Currently, the cmpxchg implementation tests whether the destination address
is readable:
  - if it is, we read the value and continue with the comparison
  - if isn't, i.e. access to addr would segfault, we assume that src != dest
    rather than queuing a SIGSEGV.

The same problem exists in the case where src == dest: the code doesn't
check whether put_user_u32 succeeds.

This fixes both problems by sending a SIGSEGV when the destination address
is inaccessible.

Signed-off-by: Seraphime Kirkovski <kirkseraph@gmail.com>
---

This accounts for Peter Maydell's remarks.
The refactoring here extracts the cmpxchg code from do_kernel_trap in its own
function.

 linux-user/main.c | 72 ++++++++++++++++++++++++++++++++++++-------------------
 1 file changed, 47 insertions(+), 25 deletions(-)

diff --git a/linux-user/main.c b/linux-user/main.c
index c1d5eb4d6f..ed38ebe0c1 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -441,7 +441,7 @@ static void arm_kernel_cmpxchg64_helper(CPUARMState *env)
     uint32_t addr, cpsr;
     target_siginfo_t info;
 
-    /* Based on the 32 bit code in do_kernel_trap */
+    /* Based on the 32 bit code in arm_kernel_cmpxchg_helper */
 
     /* XXX: This only works between threads, not between processes.
        It's probably possible to implement this with native host
@@ -496,41 +496,63 @@ segv:
     queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
 }
 
+/*
+ * 32bit cmpxchg kernel user helper.
+ * See the note above arm_kernel_cmpxchg64_helper.
+ */
+static void arm_kernel_cmpxchg_helper(CPUARMState *env)
+{
+    uint32_t addr;
+    uint32_t cpsr;
+    uint32_t val;
+    target_siginfo_t info;
+
+    /* XXX: This only works between threads, not between processes.
+       It's probably possible to implement this with native host
+       operations. However things like ldrex/strex are much harder so
+       there's not much point trying.  */
+    start_exclusive();
+    cpsr = cpsr_read(env);
+    addr = env->regs[2];
+    if (get_user_u32(val, addr))
+        goto segv;
+    if (val == env->regs[0]) {
+        val = env->regs[1];
+        if (put_user_u32(val, addr))
+            goto segv;
+        env->regs[0] = 0;
+        cpsr |= CPSR_C;
+    } else {
+        env->regs[0] = -1;
+        cpsr &= ~CPSR_C;
+    }
+    cpsr_write(env, cpsr, CPSR_C, CPSRWriteByInstr);
+    end_exclusive();
+    return;
+
+segv:
+    end_exclusive();
+    env->exception.vaddress = addr;
+    info.si_signo = TARGET_SIGSEGV;
+    info.si_errno = 0;
+    /* XXX: check env->error_code */
+    info.si_code = TARGET_SEGV_MAPERR;
+    info._sifields._sigfault._addr = env->exception.vaddress;
+    queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+}
+
 /* Handle a jump to the kernel code page.  */
 static int
 do_kernel_trap(CPUARMState *env)
 {
     uint32_t addr;
-    uint32_t cpsr;
-    uint32_t val;
 
     switch (env->regs[15]) {
     case 0xffff0fa0: /* __kernel_memory_barrier */
         /* ??? No-op. Will need to do better for SMP.  */
         break;
     case 0xffff0fc0: /* __kernel_cmpxchg */
-         /* XXX: This only works between threads, not between processes.
-            It's probably possible to implement this with native host
-            operations. However things like ldrex/strex are much harder so
-            there's not much point trying.  */
-        start_exclusive();
-        cpsr = cpsr_read(env);
-        addr = env->regs[2];
-        /* FIXME: This should SEGV if the access fails.  */
-        if (get_user_u32(val, addr))
-            val = ~env->regs[0];
-        if (val == env->regs[0]) {
-            val = env->regs[1];
-            /* FIXME: Check for segfaults.  */
-            put_user_u32(val, addr);
-            env->regs[0] = 0;
-            cpsr |= CPSR_C;
-        } else {
-            env->regs[0] = -1;
-            cpsr &= ~CPSR_C;
-        }
-        cpsr_write(env, cpsr, CPSR_C, CPSRWriteByInstr);
-        end_exclusive();
+        arm_kernel_cmpxchg_helper(env);
         break;
     case 0xffff0fe0: /* __kernel_get_tls */
         env->regs[0] = cpu_get_tls(env);
-- 
2.11.0

