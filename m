Received: by 10.25.205.13 with SMTP id d13csp8386526lfg;
        Mon, 2 Jan 2017 04:45:12 -0800 (PST)
X-Received: by 10.55.108.131 with SMTP id h125mr63452668qkc.140.1483361112741;
        Mon, 02 Jan 2017 04:45:12 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d9si22814365qte.212.2017.01.02.04.45.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 02 Jan 2017 04:45:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:56618 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cO1zC-0003h1-3K
	for alex.bennee@linaro.org; Mon, 02 Jan 2017 07:45:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39912)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kirkseraph@gmail.com>) id 1cO1yf-0003gh-TZ
	for qemu-devel@nongnu.org; Mon, 02 Jan 2017 07:44:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kirkseraph@gmail.com>) id 1cO1yc-0000LM-Rl
	for qemu-devel@nongnu.org; Mon, 02 Jan 2017 07:44:37 -0500
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244]:36419)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <kirkseraph@gmail.com>)
	id 1cO1yc-0000L0-KZ; Mon, 02 Jan 2017 07:44:34 -0500
Received: by mail-wm0-x244.google.com with SMTP id m203so81880124wma.3;
	Mon, 02 Jan 2017 04:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=rEgSKeUi8Fataf52eyIApBOTWQgXHgQKn8Rp0ns6msE=;
	b=D78XU8tz3AQ9lw3F+LmRkHkuS3i2XHlM5AcC82bNO3WzYCKeIjGqCm6o0JJj1vtNQ2
	CFNopOL9ucESmVh9nM9C92WODKFexfyhlbUepv6pt4yQAlptDctcnGPxApNWRLr7teoa
	1GhoSk5W+xHZVVMgK9lb+W2fhDC+TB7X7UNGAJsJY0ZjBlHh62bRnTxitVUpXfCXbS2k
	LQYPz3xOu4ehCgxcUGJvaOgXvyl2CSikEfgr27JhluB9As3krCr66FfMtvma0vkVsc61
	MkBMttPo9ByBFWKgUnisWTxcCk3WEsjB+eMHr/wfyZqEGrkbwAMQiuJ5IMTQjWhAaWim
	7YUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=rEgSKeUi8Fataf52eyIApBOTWQgXHgQKn8Rp0ns6msE=;
	b=F6f6xwbj/JW1tBjqrBK2k6pIOIKSugXBqk3CKvrStbm+g7Na4MKBV9taV7G1oRvF7p
	Vn4vPLLzwd7O50Wt7PSXJpGeS6HgRcHCBJbHZHArn+p8/tP1IsFqIobDJeiZ4pUdQSMY
	Xf9RazOjEnC30VhKujtFsgb6vdnmV7VPa7FJKIXUDWn0K7ukPUc8NTmr06XwYJmVN23M
	k+w2mw3y3/9qzQ51WDx2uGovVcvUyaIz0xMQzXS7YjIaJjdH7gLmjO9ogt0UgbODc1dK
	HTv+OjiksEeMzPtZTj/fYJqRde/1wO8TqV34a/MIruzdFq8aoqc9F3FPYLLL+SyjnLit
	ztzw==
X-Gm-Message-State: AIkVDXJzZzKFCzULp1vffQANCRdr4fJ16lP2RRjFacwiVS7UL/UJJ79Iuhxb1SSR3SZ2Zw==
X-Received: by 10.28.141.18 with SMTP id p18mr48805970wmd.31.1483361071875;
	Mon, 02 Jan 2017 04:44:31 -0800 (PST)
Received: from localhost (cha92-19-78-239-153-115.fbx.proxad.net.
	[78.239.153.115]) by smtp.gmail.com with ESMTPSA id
	k2sm87979550wjv.11.2017.01.02.04.44.29
	(version=TLS1 cipher=AES128-SHA bits=128/128);
	Mon, 02 Jan 2017 04:44:31 -0800 (PST)
Received: by localhost (sSMTP sendmail emulation);
	Mon, 02 Jan 2017 13:44:29 +0100
From: Seraphime Kirkovski <kirkseraph@gmail.com>
To: qemu-devel@nongnu.org
Date: Mon,  2 Jan 2017 13:44:24 +0100
Message-Id: <20170102124424.1031-1-kirkseraph@gmail.com>
X-Mailer: git-send-email 2.10.2
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::244
Subject: [Qemu-devel] [RESEND PATCH] target-arm/abi32: check for segfault in
 do_kernel_trap
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: riku.voipio@iki.fi, qemu-arm@nongnu.org,
	Seraphime Kirkovski <kirkseraph@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: go1sRxhHmso4

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
 linux-user/main.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/linux-user/main.c b/linux-user/main.c
index 75b199f..376b0c3 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -503,6 +503,7 @@ do_kernel_trap(CPUARMState *env)
     uint32_t addr;
     uint32_t cpsr;
     uint32_t val;
+    target_siginfo_t info;
 
     switch (env->regs[15]) {
     case 0xffff0fa0: /* __kernel_memory_barrier */
@@ -516,13 +517,16 @@ do_kernel_trap(CPUARMState *env)
         start_exclusive();
         cpsr = cpsr_read(env);
         addr = env->regs[2];
-        /* FIXME: This should SEGV if the access fails.  */
-        if (get_user_u32(val, addr))
-            val = ~env->regs[0];
+        if (get_user_u32(val, addr)) {
+            env->exception.vaddress = addr;
+            goto segv;
+        }
         if (val == env->regs[0]) {
             val = env->regs[1];
-            /* FIXME: Check for segfaults.  */
-            put_user_u32(val, addr);
+            if (put_user_u32(val, addr)) {
+                env->exception.vaddress = addr;
+                goto segv;
+            }
             env->regs[0] = 0;
             cpsr |= CPSR_C;
         } else {
@@ -551,6 +555,16 @@ do_kernel_trap(CPUARMState *env)
     env->regs[15] = addr;
 
     return 0;
+
+segv:
+    end_exclusive();
+    info.si_signo = TARGET_SIGSEGV;
+    info.si_errno = 0;
+    /* XXX: check env->error_code */
+    info.si_code = TARGET_SEGV_MAPERR;
+    info._sifields._sigfault._addr = env->exception.vaddress;
+    queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+    return 0;
 }
 
 void cpu_loop(CPUARMState *env)
-- 
2.10.2

