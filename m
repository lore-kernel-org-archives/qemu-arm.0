Received: by 10.182.158.201 with SMTP id ww9csp515837obb;
        Fri, 20 Nov 2015 06:33:24 -0800 (PST)
X-Received: by 10.129.133.69 with SMTP id v66mr13645691ywf.68.1448030004009;
        Fri, 20 Nov 2015 06:33:24 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c184si10785793ywa.56.2015.11.20.06.33.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 20 Nov 2015 06:33:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47695 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1Zzmkd-0004Oo-K1
	for alex.bennee@linaro.org; Fri, 20 Nov 2015 09:33:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55538)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1ZzmkH-0003zF-3g
	for qemu-devel@nongnu.org; Fri, 20 Nov 2015 09:33:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1ZzmkG-0002Aq-8N
	for qemu-devel@nongnu.org; Fri, 20 Nov 2015 09:33:00 -0500
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:35522)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1ZzmkG-0002AU-1V; Fri, 20 Nov 2015 09:33:00 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1Zzmk7-0002Zk-VI; Fri, 20 Nov 2015 14:32:51 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri, 20 Nov 2015 14:32:51 +0000
Message-Id: <1448029971-9875-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2001:8b0:1d0::1
Cc: Laurent Desnogues <laurent.desnogues@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	qemu-arm@nongnu.org, patches@linaro.org
Subject: [Qemu-devel] [PATCH for-2.5] target-arm: Don't mask out bits
	[47:40] in LPAE descriptors for v8
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
X-TUID: /oqqERH9h+zg

In an LPAE format descriptor in ARMv8 the address field extends
up to bit 47, not just bit 39. Correct the masking so we don't
give incorrect results if the output address size is greater
than 40 bits, as it can be for AArch64.

(Note that we don't yet support the new-in-v8 Address Size fault which
should be generated if any translation table entry or TTBR contains
an address with non-zero bits above the most significant bit of the
maximum output address size.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
This is worth fixing for 2.5 I think. As the commit message notes,
we don't support the Addres Size faults we ought to take in some
cases, but that seems more 2.6-ish.
---
 target-arm/helper.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/target-arm/helper.c b/target-arm/helper.c
index 4ecae61..afc4163 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -6642,6 +6642,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
     int ap, ns, xn, pxn;
     uint32_t el = regime_el(env, mmu_idx);
     bool ttbr1_valid = true;
+    uint64_t descaddrmask;
 
     /* TODO:
      * This code does not handle the different format TCR for VTCR_EL2.
@@ -6831,6 +6832,15 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
     descaddr = extract64(ttbr, 0, 48);
     descaddr &= ~((1ULL << (inputsize - (stride * (4 - level)))) - 1);
 
+    /* The address field in the descriptor goes up to bit 39 for ARMv7
+     * but up to bit 47 for ARMv8.
+     */
+    if (arm_feature(env, ARM_FEATURE_V8)) {
+        descaddrmask = 0xfffffffff000ULL;
+    } else {
+        descaddrmask = 0xfffffff000ULL;
+    }
+
     /* Secure accesses start with the page table in secure memory and
      * can be downgraded to non-secure at any step. Non-secure accesses
      * remain non-secure. We implement this by just ORing in the NSTable/NS
@@ -6854,7 +6864,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
             /* Invalid, or the Reserved level 3 encoding */
             goto do_fault;
         }
-        descaddr = descriptor & 0xfffffff000ULL;
+        descaddr = descriptor & descaddrmask;
 
         if ((descriptor & 2) && (level < 3)) {
             /* Table entry. The top five bits are attributes which  may
-- 
1.9.1

