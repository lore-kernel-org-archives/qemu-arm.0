Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp762616wrq;
        Wed, 20 Jun 2018 06:21:20 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJorl9vSgoG8asYuFYEchGFwaDvli1E5y7eYQTEUJfzE20s6pw3QHlWtxmwNOv+CCfK8yGr
X-Received: by 2002:a37:8f45:: with SMTP id r66-v6mr17261363qkd.47.1529500880267;
        Wed, 20 Jun 2018 06:21:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529500880; cv=none;
        d=google.com; s=arc-20160816;
        b=Re/sSWw+IEUjioPDG/TggHY36/cNfRXqZuEuBdNRg3a2NIrCM6tevYAfgUdYjIWWLA
         B7osZSTsuLCPS/pdRokBuo/Tn3Ou6VLrwGYXroK0DYZap5xCJ7vQgyxS3CKcSgQchSNP
         TB9DpY5cl1aVe5Lyat0ZqmLkhnM7/J/tOwHKqlojUYmbbONvaaQgDgq/k/VIgydxFVUF
         dc+6DVcakPjpKr9zBbRf3oBDKHly3ujyKojuWbKvqueOzWlvU1tmc0hiPV5U6ugZ3iKc
         7imBBPRN1mtDSBIVSE0G6Z5/7493EyaOisplByAzxWF5CYiBwzf7X4snPEGNr8To48O/
         PT7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=ws2eHmbcddDFykZSrslDEX6wlfHRJQ/kUai1F4PfpDY=;
        b=B5o5XYqIgxtoHcbQiQrd+s1DCe0LY0k4EES4+OygcwESgGxzP4l2bQJ7rGXvqjrMT3
         23fe/vcOVnYQl4ylW3OuUXbssK7w+TCzOdTJfdEUbzZxqwBydk5VDgF9+0aw18j0zs4/
         usdGeEOjxyf09CRHwT/Pa4ODNJ/lFe5hlaXpz6oS13VNexraa8V/1m3AkJ+yo9Pse0J8
         SuplS0BaJKrdFtjN4x8NCatXpjlCZGmbBeem2LVsWwLhBNsUAe5sxjuhCOC/XMmPsV7A
         Q9hcHQu5+TGOLcyNQfnzkpYe0dWRqiyH0sMiIGao3PVoE0WgCFAggzOisgbRxiZl3xf/
         De0A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c75-v6si1393893qke.173.2018.06.20.06.21.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Jun 2018 06:21:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49626 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fVd31-00082V-KZ
	for alex.bennee@linaro.org; Wed, 20 Jun 2018 09:21:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55061)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fVd2P-000800-7X
	for qemu-devel@nongnu.org; Wed, 20 Jun 2018 09:20:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fVd2N-0002mq-S5
	for qemu-devel@nongnu.org; Wed, 20 Jun 2018 09:20:41 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:42860)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fVd2K-0002jn-Q9; Wed, 20 Jun 2018 09:20:36 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fVcoX-0001Vz-W7; Wed, 20 Jun 2018 14:06:21 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Wed, 20 Jun 2018 14:06:18 +0100
Message-Id: <20180620130619.11362-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180620130619.11362-1-peter.maydell@linaro.org>
References: <20180620130619.11362-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-devel] [PATCH 2/3] target/arm: Set page (region) size in
 get_phys_addr_pmsav7()
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Tkrs9BXjiiGa

We want to handle small MPU region sizes for ARMv7M. To do this,
make get_phys_addr_pmsav7() set the page size to the region
size if it is less that TARGET_PAGE_SIZE, rather than working
only in TARGET_PAGE_SIZE chunks.

Since the core TCG code con't handle execution from small
MPU regions, we strip the exec permission from them so that
any execution attempts will cause an MPU exception, rather
than allowing it to end up with a cpu_abort() in
get_page_addr_code().

(The previous code's intention was to make any small page be
treated as having no permissions, but unfortunately errors
in the implementation meant that it didn't behave that way.
It's possible that some binaries using small regions were
accidentally working with our old behaviour and won't now.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 37 ++++++++++++++++++++++++++-----------
 1 file changed, 26 insertions(+), 11 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 1248d84e6fa..a7edeb66633 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9596,6 +9596,7 @@ static inline bool m_is_system_region(CPUARMState *env, uint32_t address)
 static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
                                  MMUAccessType access_type, ARMMMUIdx mmu_idx,
                                  hwaddr *phys_ptr, int *prot,
+                                 target_ulong *page_size,
                                  ARMMMUFaultInfo *fi)
 {
     ARMCPU *cpu = arm_env_get_cpu(env);
@@ -9603,6 +9604,7 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
     bool is_user = regime_is_user(env, mmu_idx);
 
     *phys_ptr = address;
+    *page_size = TARGET_PAGE_SIZE;
     *prot = 0;
 
     if (regime_translation_disabled(env, mmu_idx) ||
@@ -9675,16 +9677,12 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
                     rsize++;
                 }
             }
-            if (rsize < TARGET_PAGE_BITS) {
-                qemu_log_mask(LOG_UNIMP,
-                              "DRSR[%d]: No support for MPU (sub)region size of"
-                              " %" PRIu32 " bytes. Minimum is %d.\n",
-                              n, (1 << rsize), TARGET_PAGE_SIZE);
-                continue;
-            }
             if (srdis) {
                 continue;
             }
+            if (rsize < TARGET_PAGE_BITS) {
+                *page_size = 1 << rsize;
+            }
             break;
         }
 
@@ -9765,6 +9763,17 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
 
     fi->type = ARMFault_Permission;
     fi->level = 1;
+    /*
+     * Core QEMU code can't handle execution from small pages yet, so
+     * don't try it. This way we'll get an MPU exception, rather than
+     * eventually causing QEMU to exit in get_page_addr_code().
+     */
+    if (*page_size < TARGET_PAGE_SIZE && (*prot & PAGE_EXEC)) {
+        qemu_log_mask(LOG_UNIMP,
+                      "MPU: No support for execution from regions "
+                      "smaller than 1K\n");
+        *prot &= ~PAGE_EXEC;
+    }
     return !(*prot & (1 << access_type));
 }
 
@@ -10334,7 +10343,7 @@ static bool get_phys_addr(CPUARMState *env, target_ulong address,
         } else if (arm_feature(env, ARM_FEATURE_V7)) {
             /* PMSAv7 */
             ret = get_phys_addr_pmsav7(env, address, access_type, mmu_idx,
-                                       phys_ptr, prot, fi);
+                                       phys_ptr, prot, page_size, fi);
         } else {
             /* Pre-v7 MPU */
             ret = get_phys_addr_pmsav5(env, address, access_type, mmu_idx,
@@ -10396,9 +10405,15 @@ bool arm_tlb_fill(CPUState *cs, vaddr address,
                         core_to_arm_mmu_idx(env, mmu_idx), &phys_addr,
                         &attrs, &prot, &page_size, fi, NULL);
     if (!ret) {
-        /* Map a single [sub]page.  */
-        phys_addr &= TARGET_PAGE_MASK;
-        address &= TARGET_PAGE_MASK;
+        /*
+         * Map a single [sub]page. Regions smaller than our declared
+         * target page size are handled specially, so for those we
+         * pass in the exact addresses.
+         */
+        if (page_size >= TARGET_PAGE_SIZE) {
+            phys_addr &= TARGET_PAGE_MASK;
+            address &= TARGET_PAGE_MASK;
+        }
         tlb_set_page_with_attrs(cs, address, phys_addr, attrs,
                                 prot, mmu_idx, page_size);
         return 0;
-- 
2.17.1

