Received: by 10.25.208.211 with SMTP id h202csp2008838lfg;
        Tue, 1 Mar 2016 22:58:45 -0800 (PST)
X-Received: by 10.140.175.136 with SMTP id v130mr33346410qhv.74.1456901925397;
        Tue, 01 Mar 2016 22:58:45 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v106si4386177qgd.97.2016.03.01.22.58.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 01 Mar 2016 22:58:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54441 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ab0k8-0001Bx-UX
	for alex.bennee@linaro.org; Wed, 02 Mar 2016 01:58:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56073)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1ab0iS-0006D6-NZ
	for qemu-arm@nongnu.org; Wed, 02 Mar 2016 01:57:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1ab0iR-0003Te-Uc
	for qemu-arm@nongnu.org; Wed, 02 Mar 2016 01:57:00 -0500
Received: from mail-pf0-x230.google.com ([2607:f8b0:400e:c00::230]:34368)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1ab0iP-0003SK-V9; Wed, 02 Mar 2016 01:56:58 -0500
Received: by mail-pf0-x230.google.com with SMTP id 4so50021721pfd.1;
	Tue, 01 Mar 2016 22:56:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=o4cQp29JsGyKnIX2IT5JfO0Hf3cFtRQ0cydyhwFpJOs=;
	b=c4kOYSkrUESWTM4g8FRGgueJc0ETARQDISRlPQPCOU+24MUgsucHseZOPgZ3tRkkUv
	E8j65wk/UbPx37GveXuCrLPjjMltFq3s5KI4P7iZjDoQ31sv6fe/M3awLjgxs4C4ErRW
	sE+mec0wguJ89uBNAGB98Z4AaKM1jL+noAJT2C5NewJfMnWOzmIrGtNvLdDNL6cl17ar
	aB0Xz0iYK2hyh0QhjP9pSudQ6Bi86+2BDmKZ+Yd08b/SKqUQTfaNKy0lCKgSrFjjMZk1
	KUWRt9OMAxSTlF1g+U7i1/OtJmcyhF4hxeQAFX3grG48ODBbUMpgHbwSgDyLzw6BNNOK
	2YSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=o4cQp29JsGyKnIX2IT5JfO0Hf3cFtRQ0cydyhwFpJOs=;
	b=DwuHbvX8mAQJOz3lB29V1EB79EWm7gR2Szl5FQg7Mzp23UsszXzW/oYAyLA5Ys4b2C
	eDwvVqGP91/Av7bbJFU/QnjWMaC1AR8uoFYGa/IZifx513nx29R8gZt7+/Z5tMntSf28
	LX5sEqBnpaYOl/qP5ulDq0exjKwBAeW+95u6JLjSn/QqDJBcX/xnUYas7RxUZ3GhS1Qj
	4WbrunzEQX9DUrPifdAQSBjpAcDUi57oFcCm/oo8ZBG9EX+274u2It9cAXXgq3kZIPlM
	Fqxaes4PJs6kPFHB/oD1hmhkFlIilQx6Hcq5Uas/Sp4T2/V+Np/mekfs07tV+gdStGiD
	uUGA==
X-Gm-Message-State: AD7BkJJiJ4CX05fPfyE4KLVvfBFA7bep+bZ7n6jP0VpB/8j5yNhO5c1waCyCGgUsxx7bvw==
X-Received: by 10.98.65.82 with SMTP id o79mr36008254pfa.115.1456901817168;
	Tue, 01 Mar 2016 22:56:57 -0800 (PST)
Received: from localhost.localdomain (mobile-166-137-179-103.mycingular.net.
	[166.137.179.103]) by smtp.gmail.com with ESMTPSA id
	19sm50069248pfb.64.2016.03.01.22.56.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 01 Mar 2016 22:56:56 -0800 (PST)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
To: qemu-devel@nongnu.org
Date: Tue,  1 Mar 2016 22:56:09 -0800
Message-Id: <f918b004ac728decd189b8dffb3503a0983d8c2f.1456901522.git.crosthwaite.peter@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1456901522.git.crosthwaite.peter@gmail.com>
References: <cover.1456901522.git.crosthwaite.peter@gmail.com>
In-Reply-To: <cover.1456901522.git.crosthwaite.peter@gmail.com>
References: <cover.1456901522.git.crosthwaite.peter@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::230
Cc: peter.maydell@linaro.org, sw@weilnetz.de, Andrew.Baumann@microsoft.com,
	alistair.francis@xilinx.com, sridhar_kulk@yahoo.com,
	qemu-arm@nongnu.org, pbonzini@redhat.com, piotr.krol@3mdeb.com
Subject: [Qemu-arm] [PATCH v2 05/18] arm: cpu: handle BE32 user-mode as BE
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
X-TUID: TE3o8WOV6jhg

From a system emulation point of view, BE32 is best modelled as little
endian with address manipulations on subword accesses (to give the
illusion of BE). But user-mode cannot tell the difference and is
already implemented as straight BE. So handle the difference in the
endianess query, where USER mode is BE and system is not.

Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
---
Changed since v1:
Rewrote commit subject and message formerly:
    arm: linux-user: don't set CPSR.E in BE32 mode

 target-arm/cpu.h | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/target-arm/cpu.h b/target-arm/cpu.h
index 75e5ea0..ab0ea92 100644
--- a/target-arm/cpu.h
+++ b/target-arm/cpu.h
@@ -1915,7 +1915,22 @@ static inline bool arm_cpu_data_is_big_endian(CPUARMState *env)
 
     /* In 32bit endianness is determined by looking at CPSR's E bit */
     if (!is_a64(env)) {
-        return (env->uncached_cpsr & CPSR_E) ? 1 : 0;
+        return
+#ifdef CONFIG_USER_ONLY
+            /* In system mode, BE32 is modelled in line with the
+             * architecture (as word-invariant big-endianness), where loads
+             * and stores are done little endian but from addresses which
+             * are adjusted by XORing with the appropriate constant. So the
+             * endianness to use for the raw data access is not affected by
+             * SCTLR.B.
+             * In user mode, however, we model BE32 as byte-invariant
+             * big-endianness (because user-only code cannot tell the
+             * difference), and so we need to use a data access endianness
+             * that depends on SCTLR.B.
+             */
+            arm_sctlr_b(env) ||
+#endif
+                ((env->uncached_cpsr & CPSR_E) ? 1 : 0);
     }
 
     cur_el = arm_current_el(env);
-- 
1.9.1

