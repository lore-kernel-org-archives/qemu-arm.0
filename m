Received: by 10.25.208.137 with SMTP id h131csp1683328lfg;
        Mon, 9 May 2016 10:30:47 -0700 (PDT)
X-Received: by 10.140.19.6 with SMTP id 6mr36234551qgg.75.1462815036761;
        Mon, 09 May 2016 10:30:36 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m186si19349733qhb.19.2016.05.09.10.30.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 May 2016 10:30:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42482 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1azp0u-0004WJ-5d
	for alex.bennee@linaro.org; Mon, 09 May 2016 13:30:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38141)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1azp0n-0004HU-Kg
	for qemu-arm@nongnu.org; Mon, 09 May 2016 13:30:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1azp0l-0000M4-88
	for qemu-arm@nongnu.org; Mon, 09 May 2016 13:30:28 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:56751)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1azp0l-00005k-0T; Mon, 09 May 2016 13:30:27 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1azp0C-0001RA-2Z; Mon, 09 May 2016 18:29:52 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon,  9 May 2016 18:29:29 +0100
Message-Id: <1462814989-24360-4-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1462814989-24360-1-git-send-email-peter.maydell@linaro.org>
References: <1462814989-24360-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 03/23] target-arm: Define new arm_is_el3_or_mon()
 function
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
Cc: patches@linaro.org, Shlomo Pongratz <shlomo.pongratz@huawei.com>,
	Shlomo Pongratz <shlomopongratz@gmail.com>,
	Pavel Fedin <p.fedin@samsung.com>, Shannon Zhao <shannon.zhao@linaro.org>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wqUkmTgGzH5T

The GICv3 system registers need to know if the CPU is AArch64
in EL3 or AArch32 in Monitor mode. This happens to be the first
part of the check for arm_is_secure(), so factor it out into a
new arm_is_el3_or_mon() function that the GIC can also use.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target-arm/cpu.h | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/target-arm/cpu.h b/target-arm/cpu.h
index 066ff67..6ffc13b 100644
--- a/target-arm/cpu.h
+++ b/target-arm/cpu.h
@@ -960,8 +960,8 @@ static inline bool arm_is_secure_below_el3(CPUARMState *env)
     }
 }
 
-/* Return true if the processor is in secure state */
-static inline bool arm_is_secure(CPUARMState *env)
+/* Return true if the CPU is AArch64 EL3 or AArch32 Mon */
+static bool arm_is_el3_or_mon(CPUARMState *env)
 {
     if (arm_feature(env, ARM_FEATURE_EL3)) {
         if (is_a64(env) && extract32(env->pstate, 2, 2) == 3) {
@@ -973,6 +973,15 @@ static inline bool arm_is_secure(CPUARMState *env)
             return true;
         }
     }
+    return false;
+}
+
+/* Return true if the processor is in secure state */
+static inline bool arm_is_secure(CPUARMState *env)
+{
+    if (arm_is_el3_or_mon(env)) {
+        return true;
+    }
     return arm_is_secure_below_el3(env);
 }
 
-- 
1.9.1

