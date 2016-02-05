Received: by 10.25.159.19 with SMTP id i19csp1084646lfe;
        Fri, 5 Feb 2016 06:39:31 -0800 (PST)
X-Received: by 10.140.38.47 with SMTP id s44mr16569989qgs.22.1454683171255;
        Fri, 05 Feb 2016 06:39:31 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n4si16048219qhc.35.2016.02.05.06.39.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 05 Feb 2016 06:39:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48694 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aRhXm-0004sy-Pt
	for alex.bennee@linaro.org; Fri, 05 Feb 2016 09:39:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40266)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aRhWI-00027p-E5
	for qemu-arm@nongnu.org; Fri, 05 Feb 2016 09:37:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aRhWH-00066B-B2
	for qemu-arm@nongnu.org; Fri, 05 Feb 2016 09:37:58 -0500
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:57194)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aRhWF-00062e-2r; Fri, 05 Feb 2016 09:37:55 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.84)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aRhW7-0004Ag-PN; Fri, 05 Feb 2016 14:37:47 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri,  5 Feb 2016 14:37:45 +0000
Message-Id: <1454683067-16001-2-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1454683067-16001-1-git-send-email-peter.maydell@linaro.org>
References: <1454683067-16001-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::1
Cc: qemu-arm@nongnu.org, patches@linaro.org
Subject: [Qemu-arm] [PATCH 1/3] target-arm: Correct misleading 'is_thumb'
	syn_* parameter names
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
X-TUID: LAsRm2JU2str

In syndrome register values, the IL bit indicates the instruction
length, and is 1 for 4-byte instructions and 0 for 2-byte
instructions. All A64 and A32 instructions are 4-byte, but
Thumb instructions may be either 2 or 4 bytes long. Unfortunately
we named the parameter to the syn_* functions for constructing
syndromes "is_thumb", which falsely implies that it should be
set for all Thumb instructions, rather than only the 16-bit ones.
Fix the functions to name the parameter 'is_16bit' instead.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target-arm/internals.h | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/target-arm/internals.h b/target-arm/internals.h
index d226bbe..a648c1e 100644
--- a/target-arm/internals.h
+++ b/target-arm/internals.h
@@ -270,10 +270,10 @@ static inline uint32_t syn_aa64_smc(uint32_t imm16)
     return (EC_AA64_SMC << ARM_EL_EC_SHIFT) | ARM_EL_IL | (imm16 & 0xffff);
 }
 
-static inline uint32_t syn_aa32_svc(uint32_t imm16, bool is_thumb)
+static inline uint32_t syn_aa32_svc(uint32_t imm16, bool is_16bit)
 {
     return (EC_AA32_SVC << ARM_EL_EC_SHIFT) | (imm16 & 0xffff)
-        | (is_thumb ? 0 : ARM_EL_IL);
+        | (is_16bit ? 0 : ARM_EL_IL);
 }
 
 static inline uint32_t syn_aa32_hvc(uint32_t imm16)
@@ -291,10 +291,10 @@ static inline uint32_t syn_aa64_bkpt(uint32_t imm16)
     return (EC_AA64_BKPT << ARM_EL_EC_SHIFT) | ARM_EL_IL | (imm16 & 0xffff);
 }
 
-static inline uint32_t syn_aa32_bkpt(uint32_t imm16, bool is_thumb)
+static inline uint32_t syn_aa32_bkpt(uint32_t imm16, bool is_16bit)
 {
     return (EC_AA32_BKPT << ARM_EL_EC_SHIFT) | (imm16 & 0xffff)
-        | (is_thumb ? 0 : ARM_EL_IL);
+        | (is_16bit ? 0 : ARM_EL_IL);
 }
 
 static inline uint32_t syn_aa64_sysregtrap(int op0, int op1, int op2,
@@ -308,48 +308,48 @@ static inline uint32_t syn_aa64_sysregtrap(int op0, int op1, int op2,
 
 static inline uint32_t syn_cp14_rt_trap(int cv, int cond, int opc1, int opc2,
                                         int crn, int crm, int rt, int isread,
-                                        bool is_thumb)
+                                        bool is_16bit)
 {
     return (EC_CP14RTTRAP << ARM_EL_EC_SHIFT)
-        | (is_thumb ? 0 : ARM_EL_IL)
+        | (is_16bit ? 0 : ARM_EL_IL)
         | (cv << 24) | (cond << 20) | (opc2 << 17) | (opc1 << 14)
         | (crn << 10) | (rt << 5) | (crm << 1) | isread;
 }
 
 static inline uint32_t syn_cp15_rt_trap(int cv, int cond, int opc1, int opc2,
                                         int crn, int crm, int rt, int isread,
-                                        bool is_thumb)
+                                        bool is_16bit)
 {
     return (EC_CP15RTTRAP << ARM_EL_EC_SHIFT)
-        | (is_thumb ? 0 : ARM_EL_IL)
+        | (is_16bit ? 0 : ARM_EL_IL)
         | (cv << 24) | (cond << 20) | (opc2 << 17) | (opc1 << 14)
         | (crn << 10) | (rt << 5) | (crm << 1) | isread;
 }
 
 static inline uint32_t syn_cp14_rrt_trap(int cv, int cond, int opc1, int crm,
                                          int rt, int rt2, int isread,
-                                         bool is_thumb)
+                                         bool is_16bit)
 {
     return (EC_CP14RRTTRAP << ARM_EL_EC_SHIFT)
-        | (is_thumb ? 0 : ARM_EL_IL)
+        | (is_16bit ? 0 : ARM_EL_IL)
         | (cv << 24) | (cond << 20) | (opc1 << 16)
         | (rt2 << 10) | (rt << 5) | (crm << 1) | isread;
 }
 
 static inline uint32_t syn_cp15_rrt_trap(int cv, int cond, int opc1, int crm,
                                          int rt, int rt2, int isread,
-                                         bool is_thumb)
+                                         bool is_16bit)
 {
     return (EC_CP15RRTTRAP << ARM_EL_EC_SHIFT)
-        | (is_thumb ? 0 : ARM_EL_IL)
+        | (is_16bit ? 0 : ARM_EL_IL)
         | (cv << 24) | (cond << 20) | (opc1 << 16)
         | (rt2 << 10) | (rt << 5) | (crm << 1) | isread;
 }
 
-static inline uint32_t syn_fp_access_trap(int cv, int cond, bool is_thumb)
+static inline uint32_t syn_fp_access_trap(int cv, int cond, bool is_16bit)
 {
     return (EC_ADVSIMDFPACCESSTRAP << ARM_EL_EC_SHIFT)
-        | (is_thumb ? 0 : ARM_EL_IL)
+        | (is_16bit ? 0 : ARM_EL_IL)
         | (cv << 24) | (cond << 20);
 }
 
-- 
1.9.1

