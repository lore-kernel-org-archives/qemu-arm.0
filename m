Received: by 10.25.208.211 with SMTP id h202csp849047lfg;
        Mon, 15 Feb 2016 09:23:16 -0800 (PST)
X-Received: by 10.140.152.78 with SMTP id 75mr22122622qhy.22.1455556996416;
        Mon, 15 Feb 2016 09:23:16 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d10si35236397qgf.109.2016.02.15.09.23.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Feb 2016 09:23:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34520 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aVMrj-0000j5-RF
	for alex.bennee@linaro.org; Mon, 15 Feb 2016 12:23:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57327)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aVMrg-0000e8-B6
	for qemu-arm@nongnu.org; Mon, 15 Feb 2016 12:23:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aVMrf-0007rq-7g
	for qemu-arm@nongnu.org; Mon, 15 Feb 2016 12:23:12 -0500
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:57358)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aVMrd-0007mW-6E; Mon, 15 Feb 2016 12:23:09 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.84)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aVMrS-0000xd-0v; Mon, 15 Feb 2016 17:22:58 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 15 Feb 2016 17:22:51 +0000
Message-Id: <1455556977-3644-6-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1455556977-3644-1-git-send-email-peter.maydell@linaro.org>
References: <1455556977-3644-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::1
Cc: qemu-arm@nongnu.org, patches@linaro.org
Subject: [Qemu-arm] [PATCH 05/11] target-arm: In cpsr_write() ignore mode
	switches from User mode
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
X-TUID: W2Rv+W4gjk8i

The only case where we can attempt a cpsr_write() mode switch from
User is from the gdbstub; all other cases are handled in the
calling code (notably translate.c). Architecturally attempts to
alter the mode bits from user mode are simply ignored (and not
treated as a bad mode switch, which in v8 sets CPSR.IL). Make
mode switches from User ignored in cpsr_write() as well, for
consistency.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target-arm/helper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target-arm/helper.c b/target-arm/helper.c
index d1919bb..9998a25 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -5282,6 +5282,7 @@ void cpsr_write(CPUARMState *env, uint32_t val, uint32_t mask,
     env->daif |= val & CPSR_AIF & mask;
 
     if (write_type != CPSRWriteRaw &&
+        (env->uncached_cpsr & CPSR_M) != CPSR_USER &&
         ((env->uncached_cpsr ^ val) & mask & CPSR_M)) {
         if (bad_mode_switch(env, val & CPSR_M)) {
             /* Attempt to switch to an invalid mode: this is UNPREDICTABLE.
-- 
1.9.1

