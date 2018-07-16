Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1512320wru;
        Mon, 16 Jul 2018 06:33:23 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpc3zGsJKM7AfwzNIzWxuEiJHtRGL8CHoDJqUPqO2c2cfHr6YCDY843PRsLcihuXnwcvyFRe
X-Received: by 2002:a37:a58c:: with SMTP id o134-v6mr13750962qke.305.1531748003225;
        Mon, 16 Jul 2018 06:33:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531748003; cv=none;
        d=google.com; s=arc-20160816;
        b=kRUliiiAjFL1u9XPDXPDhvnbZYU6UmYKUFi1+Adx7oMXf9HivfZCQrVeJRHvm94KP5
         OhyWZjG2if4xKxzMgVWREt1CHa9F6ac53N97BI7Y3c2ecfbiUAn6rptX+kpTBB1/XliT
         61wBFiMfiqqwwaTnsMveNKBZ7twiF5QPpm3EEALqQxWKSyLX1eLsKUdh2rzT+pVRH9XZ
         Nqs4So5KixjteIGoln51sJ+s2phXtjRrQbOCt11oEDojirqF9XV4jn3rl9m2ypzaFTxi
         s6VoUxUbYboUdjQZyWDaxbecpaas+htDucsViL/okZpao7xnl2dOlstpgf8Bru/+SA73
         jBuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=K2vdgO+dcmzil51RCwaP4ZMYOG5p403h6QM9wnWKsa4=;
        b=f4MIIHxxLFxjNY7vvPbOqAJXAdherYeSfy/i/8LOAoAxQb1uDA85UTjLxbgNl91wyg
         Ag105NnFXc9Z/IrETwmtayFTXJzUbYmt4gSPFYVCvw+su1hQEcAD3E1XWGxxdFE+ssGa
         9MOC3yM0wTY2gtpg1c/AtwbiRPWs8lz3/4xzI13dYdyxttgE8/JbGGhSpTvFRYsr/+cX
         1VeL13M20kGTY8LCHjg2CI6LZwryF5lgg5unIFpnmcucemdIRaiDAg7jpu1iqkYarVvQ
         K6E8mn+NZUgnq6yVngFkJYGcYin4JqBAlgVhivpgofOKaK6DgLDqyg/RK+5R0xtCQ7Ov
         4kzw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h7-v6si4038362qkm.150.2018.07.16.06.33.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 Jul 2018 06:33:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51786 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ff3cw-0006LU-MB
	for alex.bennee@linaro.org; Mon, 16 Jul 2018 09:33:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54758)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1ff3cq-0006LP-4x
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 09:33:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1ff3cp-00020t-1P
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 09:33:16 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:43580)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1ff3co-0001zM-Pa; Mon, 16 Jul 2018 09:33:14 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1ff3cd-0000qX-Ql; Mon, 16 Jul 2018 14:33:03 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 16 Jul 2018 14:33:02 +0100
Message-Id: <20180716133302.25989-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH for-3.0] target/arm: Correctly handle overlapping
 small MPU regions
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
Cc: Adithya Baglody <adithya.nagaraj.baglody@intel.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: y8YWSsb2ceDA

To correctly handle small (less than TARGET_PAGE_SIZE) MPU regions,
we must correctly handle the case where the address being looked
up hits in an MPU region that is not small but the address is
in the same page as a small region. For instance if MPU region
1 covers an entire page from 0x2000 to 0x2400 and MPU region
2 is small and covers only 0x2200 to 0x2280, then for an access
to 0x2000 we must not return a result covering the full page
even though we hit the page-sized region 1. Otherwise we will
then cache that result in the TLB and accesses that should
hit region 2 will incorrectly find the region 1 information.

Check for the case where we miss an MPU region but it is still
within the same page, and in that case narrow the size we will
pass to tlb_set_page_with_attrs() for whatever the final
outcome is of the MPU lookup.

Reported-by: Adithya Baglody <adithya.nagaraj.baglody@intel.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
This should go into 3.0 as it fixes a corner case in the newly added
small-MPU-region handling.

 target/arm/helper.c | 46 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 0604a0efbe2..22d812240af 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -17,6 +17,7 @@
 #include "exec/semihost.h"
 #include "sysemu/kvm.h"
 #include "fpu/softfloat.h"
+#include "qemu/range.h"
 
 #define ARM_CPU_FREQ 1000000000 /* FIXME: 1 GHz, should be configurable */
 
@@ -9669,6 +9670,20 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
             }
 
             if (address < base || address > base + rmask) {
+                /*
+                 * Address not in this region. We must check whether the
+                 * region covers addresses in the same page as our address.
+                 * In that case we must not report a size that covers the
+                 * whole page for a subsequent hit against a different MPU
+                 * region or the background region, because it would result in
+                 * incorrect TLB hits for subsequent accesses to addresses that
+                 * are in this MPU region.
+                 */
+                if (ranges_overlap(base, rmask,
+                                   address & TARGET_PAGE_MASK,
+                                   TARGET_PAGE_SIZE)) {
+                    *page_size = 1;
+                }
                 continue;
             }
 
@@ -9888,6 +9903,22 @@ static void v8m_security_lookup(CPUARMState *env, uint32_t address,
                         sattrs->srvalid = true;
                         sattrs->sregion = r;
                     }
+                } else {
+                    /*
+                     * Address not in this region. We must check whether the
+                     * region covers addresses in the same page as our address.
+                     * In that case we must not report a size that covers the
+                     * whole page for a subsequent hit against a different MPU
+                     * region or the background region, because it would result
+                     * in incorrect TLB hits for subsequent accesses to
+                     * addresses that are in this MPU region.
+                     */
+                    if (limit >= base &&
+                        ranges_overlap(base, limit - base + 1,
+                                       addr_page_base,
+                                       TARGET_PAGE_SIZE)) {
+                        sattrs->subpage = true;
+                    }
                 }
             }
         }
@@ -9963,6 +9994,21 @@ static bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
             }
 
             if (address < base || address > limit) {
+                /*
+                 * Address not in this region. We must check whether the
+                 * region covers addresses in the same page as our address.
+                 * In that case we must not report a size that covers the
+                 * whole page for a subsequent hit against a different MPU
+                 * region or the background region, because it would result in
+                 * incorrect TLB hits for subsequent accesses to addresses that
+                 * are in this MPU region.
+                 */
+                if (limit >= base &&
+                    ranges_overlap(base, limit - base + 1,
+                                   addr_page_base,
+                                   TARGET_PAGE_SIZE)) {
+                    *is_subpage = true;
+                }
                 continue;
             }
 
-- 
2.17.1

