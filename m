Received: by 10.25.208.137 with SMTP id h131csp1765732lfg;
        Tue, 17 May 2016 05:24:24 -0700 (PDT)
X-Received: by 10.55.33.102 with SMTP id h99mr1025617qkh.130.1463487864402;
        Tue, 17 May 2016 05:24:24 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s123si1956389qkd.247.2016.05.17.05.24.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 May 2016 05:24:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50008 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b2e2x-0003NI-TA
	for alex.bennee@linaro.org; Tue, 17 May 2016 08:24:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49461)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1b2e2u-0003GY-2n
	for qemu-arm@nongnu.org; Tue, 17 May 2016 08:24:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1b2e2r-0005dY-Sy
	for qemu-arm@nongnu.org; Tue, 17 May 2016 08:24:18 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:57116)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1b2e2r-0005cG-M7; Tue, 17 May 2016 08:24:17 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1b2dtD-0007T2-Ku; Tue, 17 May 2016 13:14:19 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 17 May 2016 13:14:17 +0100
Message-Id: <1463487258-27468-2-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1463487258-27468-1-git-send-email-peter.maydell@linaro.org>
References: <1463487258-27468-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 1/2] target-arm: Set IL bit in syndromes for insn
 abort, watchpoint, swstep
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>,
	Laurent Desnogues <laurent.desnogues@gmail.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Eb4XoJMLa2tu

For some exception syndrome types, the IL bit should always be set.
This includes the instruction abort, watchpoint and software step
syndrome types; add the missing ARM_EL_IL bit to the syndrome
values returned by syn_insn_abort(), syn_swstep() and syn_watchpoint().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target-arm/internals.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target-arm/internals.h b/target-arm/internals.h
index 54a0fb1..7768a24 100644
--- a/target-arm/internals.h
+++ b/target-arm/internals.h
@@ -382,7 +382,7 @@ static inline uint32_t syn_fp_access_trap(int cv, int cond, bool is_16bit)
 static inline uint32_t syn_insn_abort(int same_el, int ea, int s1ptw, int fsc)
 {
     return (EC_INSNABORT << ARM_EL_EC_SHIFT) | (same_el << ARM_EL_EC_SHIFT)
-        | (ea << 9) | (s1ptw << 7) | fsc;
+        | ARM_EL_IL | (ea << 9) | (s1ptw << 7) | fsc;
 }
 
 static inline uint32_t syn_data_abort_no_iss(int same_el,
@@ -411,13 +411,13 @@ static inline uint32_t syn_data_abort_with_iss(int same_el,
 static inline uint32_t syn_swstep(int same_el, int isv, int ex)
 {
     return (EC_SOFTWARESTEP << ARM_EL_EC_SHIFT) | (same_el << ARM_EL_EC_SHIFT)
-        | (isv << 24) | (ex << 6) | 0x22;
+        | ARM_EL_IL | (isv << 24) | (ex << 6) | 0x22;
 }
 
 static inline uint32_t syn_watchpoint(int same_el, int cm, int wnr)
 {
     return (EC_WATCHPOINT << ARM_EL_EC_SHIFT) | (same_el << ARM_EL_EC_SHIFT)
-        | (cm << 8) | (wnr << 6) | 0x22;
+        | ARM_EL_IL | (cm << 8) | (wnr << 6) | 0x22;
 }
 
 static inline uint32_t syn_breakpoint(int same_el)
-- 
1.9.1

