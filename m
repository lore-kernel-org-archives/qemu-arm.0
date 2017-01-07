Received: by 10.25.205.13 with SMTP id d13csp10722121lfg;
        Sat, 7 Jan 2017 04:35:59 -0800 (PST)
X-Received: by 10.200.56.4 with SMTP id q4mr5322557qtb.73.1483792559248;
        Sat, 07 Jan 2017 04:35:59 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w77si42677605qkb.124.2017.01.07.04.35.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 07 Jan 2017 04:35:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:57408 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cPqE0-0007im-ME
	for alex.bennee@linaro.org; Sat, 07 Jan 2017 07:35:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36937)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kirkseraph@gmail.com>) id 1cPqDs-0007gk-TO
	for qemu-arm@nongnu.org; Sat, 07 Jan 2017 07:35:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kirkseraph@gmail.com>) id 1cPqDr-00057q-RV
	for qemu-arm@nongnu.org; Sat, 07 Jan 2017 07:35:48 -0500
Received: from mail-wj0-x241.google.com ([2a00:1450:400c:c01::241]:35655)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <kirkseraph@gmail.com>)
	id 1cPqDm-00056U-Bj; Sat, 07 Jan 2017 07:35:42 -0500
Received: by mail-wj0-x241.google.com with SMTP id ey1so2371132wjd.2;
	Sat, 07 Jan 2017 04:35:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=N+tKLpCEFmyKwgZAIciXeH477JkVD8y2p8eTHoY5ZRI=;
	b=l5EL1xea15DE/gm8tVHrUviwV0aW4fu+fd7M9/JedBZu3cUGos/w0+pd3uh1ZYLuXX
	fVPtIRqnAvURQ23s/QozxQVR634XEJP7bnUnXVSkggiBjtaaQenJjK2ipeGnlP5JUrYK
	z6GBmksHlHviD/oWClYooIwPj8B/ny2YeyYha9Fq9uRVmV4LUM8Ug/DUBhoA7eOVH2Aq
	te3dfvzJK3XcO2npZBNITEdUl57q0RLw/kdeiij2rJ7GyYRtRM2FRdV0kAfRs/Uvka2y
	Edf3PUScX4Ukd00nIR9Etpn/p8FwZqWGwHTvttwrypFOeCxya0arCWXVGe44CPRRSF0y
	HXUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=N+tKLpCEFmyKwgZAIciXeH477JkVD8y2p8eTHoY5ZRI=;
	b=htaP4FzG5jgg4iU0SP3Vd6qvoWmQhJPC9IIupn9FkfMEi2zcNpJEaRj+70j6O6eqys
	AaHsED1PeVCoNPxyspKXedTnOIdsbCcZIgfSvjAtWtnc3zFKRA9alALrtPEE/+KiUPuw
	bG6sLlcWHu5F3BXhq/jmUBFvnTxCBqjtSzzYMf7+ANh5OFPIZhi8qrd3qEacK4TAj1Se
	tXddsL/LneOgGrBB1y/fRORbhwCkbz4lm4/xLVhF8dQFVIkgDYTQ8DEg5joRrgV5VveS
	0jgOzqwTD7S1MVHPVH9BvpQiisvNc+2Qp7yjQI8+evjnGxUFfqJwvLWIpkX7nHtJMMQs
	8VPw==
X-Gm-Message-State: AIkVDXKkOo7a6ctLO0z9aTvdafBu6X43nUJi1LL7GTMFlfL5mNhX+qb+0iIZ8MYW9YQM0Q==
X-Received: by 10.194.67.67 with SMTP id l3mr69095471wjt.151.1483792541156;
	Sat, 07 Jan 2017 04:35:41 -0800 (PST)
Received: from localhost (cha92-19-78-239-153-115.fbx.proxad.net.
	[78.239.153.115])
	by smtp.gmail.com with ESMTPSA id u18sm8266226wmd.1.2017.01.07.04.35.39
	(version=TLS1 cipher=AES128-SHA bits=128/128);
	Sat, 07 Jan 2017 04:35:40 -0800 (PST)
Received: by localhost (sSMTP sendmail emulation);
	Sat, 07 Jan 2017 13:35:38 +0100
From: Seraphime Kirkovski <kirkseraph@gmail.com>
To: qemu-devel@nongnu.org
Date: Sat,  7 Jan 2017 13:35:31 +0100
Message-Id: <20170107123531.5994-1-kirkseraph@gmail.com>
X-Mailer: git-send-email 2.11.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c01::241
Subject: [Qemu-arm] [PATCH] target-arm/abi32: check for segfault in
 do_kernel_trap
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
Cc: peter.maydell@linaro.org, riku.voipio@iki.fi, qemu-arm@nongnu.org,
	Seraphime Kirkovski <kirkseraph@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sJve2TcdJKs5

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

> As the patchew robot notes, our coding style wants braces on all
> if() statements, even one-line ones. Other than that,
>
>  Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

This fixes the missing brackets.

 linux-user/main.c | 74 ++++++++++++++++++++++++++++++++++++-------------------
 1 file changed, 49 insertions(+), 25 deletions(-)

diff --git a/linux-user/main.c b/linux-user/main.c
index c1d5eb4d6f..1a32f2da7d 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -441,7 +441,7 @@ static void arm_kernel_cmpxchg64_helper(CPUARMState *env)
     uint32_t addr, cpsr;
     target_siginfo_t info;
 
-    /* Based on the 32 bit code in do_kernel_trap */
+    /* Based on the 32 bit code in arm_kernel_cmpxchg_helper */
 
     /* XXX: This only works between threads, not between processes.
        It's probably possible to implement this with native host
@@ -496,41 +496,65 @@ segv:
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
+    if (get_user_u32(val, addr)) {
+        goto segv;
+    }
+    if (val == env->regs[0]) {
+        val = env->regs[1];
+        if (put_user_u32(val, addr)) {
+            goto segv;
+        }
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

