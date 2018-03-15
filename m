Received: by 10.28.91.67 with SMTP id p64csp1423639wmb;
        Thu, 15 Mar 2018 06:35:40 -0700 (PDT)
X-Google-Smtp-Source: AG47ELvqbGGFLHjTIbV1gl8efKZEuVWdwiSIKbZ+EIdOwa3pnEthSzlFm/nsIFWEGgN4y/ZnwDA1
X-Received: by 10.55.214.7 with SMTP id t7mr12023563qki.341.1521120940481;
        Thu, 15 Mar 2018 06:35:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521120940; cv=none;
        d=google.com; s=arc-20160816;
        b=q09TzHcXIopuQF+WEKH0CsyrBeszHdwt8cDou1bCu3EYH6is7RoQ73P6Rwl0hErrOO
         CHGM+hiijYR9XYpD9d8z/+42kLb58bYhqwkIYhUOPbOTivas7S1herbSVCKd3nJIiDY8
         TEZf53w/T65wGQWLf7hQY5nBqgsikuzF6FOY7/BsJBJjr0YvIbebgQ0qLJvuySjkibT1
         CH3KNsY2K/qSpLcBvOCkcqx2MbWk0A36dDIcYGGgbdGpLcZwnw9Lf2QW7A8AfFUFr2Q2
         wZigjJcHko1tt0ZmvWJKXEQC2Uyq9AbU9tYB0UHHHu3CsABcZKjDAiw9cSYWOwFVk6yE
         Unsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=jG2eMsuJH4GEGjLxOxgGT/DM6TpDjLW3BP9pGZs6YA0=;
        b=vELmZog+fNGSjyXZc1mVlI75aSu1Ag+iockjaCIkveKPznkUVfWrxiKt7XyRcRGUTY
         NqC4uZMvm6lOpS/Tthr/jy9qo6qL9BN9kcxaJVCsCm7inX4tY9X5I23haYs2XPwywN2u
         E5BxSRj57fu9T0cHyPwsj6DqLAtGA5WD0WIRfeD3RO5WH+Jq+FGP6RF7H2d1vITaGXCk
         Oj2W/K8oHLxdqhFIJFz++1fTTaFuOXltaN/yMvWHWb8n1ZpO2o6mdhjL9an13lbKgTa0
         GTN0hD8r3qqggAMfSDGDTOl959uIW7FgTs6zwShR2YnX5K219pLQsJz6I0IGu7YSDjF+
         tg7w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t90si5076190qtd.126.2018.03.15.06.35.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 15 Mar 2018 06:35:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51611 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ewT2i-0003ZS-1B
	for alex.bennee@linaro.org; Thu, 15 Mar 2018 09:35:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50426)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1ewT1y-0003LF-IS
	for qemu-devel@nongnu.org; Thu, 15 Mar 2018 09:34:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1ewT1x-0002NP-FE
	for qemu-devel@nongnu.org; Thu, 15 Mar 2018 09:34:54 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:47152)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1ewT1u-0002FE-NR; Thu, 15 Mar 2018 09:34:50 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1ewT1m-0005Xh-ND; Thu, 15 Mar 2018 13:34:42 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 15 Mar 2018 13:34:41 +0000
Message-Id: <20180315133441.24149-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.16.2
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-devel] [PATCH for-2.12] hw/intc/arm_gicv3: Fix secure-GIC NS
 ICC_PMR and ICC_RPR accesses
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
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ozaP30JSueYB

If the GIC has the security extension support enabled, then a
non-secure access to ICC_PMR must take account of the non-secure
view of interrupt priorities, where real priorities 0..0x7f
are secure-only and not visible to the non-secure guest, and
priorities 0x80..0xff are shown to the guest as if they were
0x00..0xff. We had the logic here wrong:
 * on reads, the priority is in the secure range if bit 7
   is clear, not if it is set
 * on writes, we want to set bit 7, not mask everything else

Our ICC_RPR read code had the same error as ICC_PMR.

(Compare the GICv3 spec pseudocode functions ICC_RPR_EL1
and ICC_PMR_EL1.)

Fixes: https://bugs.launchpad.net/qemu/+bug/1748434
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_cpuif.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index 5cbafaf497..26f5eeda94 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -836,7 +836,7 @@ static uint64_t icc_pmr_read(CPUARMState *env, const ARMCPRegInfo *ri)
         /* NS access and Group 0 is inaccessible to NS: return the
          * NS view of the current priority
          */
-        if (value & 0x80) {
+        if ((value & 0x80) == 0) {
             /* Secure priorities not visible to NS */
             value = 0;
         } else if (value != 0xff) {
@@ -871,7 +871,7 @@ static void icc_pmr_write(CPUARMState *env, const ARMCPRegInfo *ri,
             /* Current PMR in the secure range, don't allow NS to change it */
             return;
         }
-        value = (value >> 1) & 0x80;
+        value = (value >> 1) | 0x80;
     }
     cs->icc_pmr_el1 = value;
     gicv3_cpuif_update(cs);
@@ -1609,7 +1609,7 @@ static uint64_t icc_rpr_read(CPUARMState *env, const ARMCPRegInfo *ri)
     if (arm_feature(env, ARM_FEATURE_EL3) &&
         !arm_is_secure(env) && (env->cp15.scr_el3 & SCR_FIQ)) {
         /* NS GIC access and Group 0 is inaccessible to NS */
-        if (prio & 0x80) {
+        if ((prio & 0x80) == 0) {
             /* NS mustn't see priorities in the Secure half of the range */
             prio = 0;
         } else if (prio != 0xff) {
-- 
2.16.2

