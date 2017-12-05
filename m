Received: by 10.223.159.74 with SMTP id f10csp3221281wrg;
        Tue, 5 Dec 2017 11:50:00 -0800 (PST)
X-Google-Smtp-Source: AGs4zMZUamI26FDGhWm4LjPy5YtRh6ERs94lDreRu6FxvKw5i0MI7SpFKJbPaWykmkHJk4crCg4K
X-Received: by 10.129.76.193 with SMTP id z184mr14276614ywa.333.1512503400548;
        Tue, 05 Dec 2017 11:50:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1512503400; cv=none;
        d=google.com; s=arc-20160816;
        b=n90qBK7yxvA0uB9/Eo6FgD76tWaQXeIBrQ6UI1IbISM3EFbQjoyMRkHLiObL/XKNNR
         gS5d83JArCe70QtHqDQxrXzSfHlPCvEGkViTsW4JFL4mBJ3qhHvtIh9NuvAKLLp4obTp
         gZrJA0NfW6K+FUt7aGiAmaLxKlYHI0PkcBLpqOghFi/UOaNySX9loLK4DCIj187sfI29
         pb59sN5FRESkdBWqeE/ugy+KeSOsO9sSD7/8DdQvW1Cprje1N3lGYHMr5QTAmZ8+O6kr
         sWJI2TWCInp1dJEZ1yGTOe+PB+NR17yrJ91W4GywkpnjbiAPIxVg1HZdT8g870pClN+z
         GK8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=XL8N80p1ka0KUdeN/YgCJ+DBBr+n3rgMsA145Bsez2s=;
        b=rB4M2kvKxUp//77QRcbHRXN7nwtTOLUW8YVgPoVI3vKnAdio1xZjW7T6D+LUO7xVv3
         Gkgc4mDH4j2APfzSRhNGTzk/+uJC3Y1nZi9co12oTDbPydZHtHNCT9Y2BzNv9CQ5/vH/
         Ml3X5e82ZWeoAYxPKE6jX+GzCTXj9k4CEZhx6WCcWOXdxqrQ00woSRebEt37BK3rVLg3
         tXVxMYLGZDj0zjRMHydULf6JdUE+jjLy5EwqG1qHovqFwb8H0KAqgkoruFzTdaXr5sxK
         xP7gmwPTXJQY0uZ0jT0V7Nw/qeeqZ1MVO7oNzT028BoaivUMDMspOHgH6HPJvAJGo9pn
         wu3w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m188si233865ywf.518.2017.12.05.11.50.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Dec 2017 11:50:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51775 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eMJE7-0004Rf-T2
	for alex.bennee@linaro.org; Tue, 05 Dec 2017 14:49:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56623)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eMJB2-00011E-V3
	for qemu-arm@nongnu.org; Tue, 05 Dec 2017 14:46:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eMJB2-0002Ky-5w
	for qemu-arm@nongnu.org; Tue, 05 Dec 2017 14:46:49 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:38776)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1eMJB1-0002CW-VR; Tue, 05 Dec 2017 14:46:48 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1eMJAs-0005BS-Ez; Tue, 05 Dec 2017 19:46:38 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue,  5 Dec 2017 19:46:27 +0000
Message-Id: <1512503192-2239-8-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1512503192-2239-1-git-send-email-peter.maydell@linaro.org>
References: <1512503192-2239-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 07/12] target/arm: Convert get_phys_addr_pmsav7()
 to not return FSC values
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Stefano Stabellini <sstabellini@kernel.org>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fLaUNDMwx4uq

Make get_phys_addr_pmsav7() return a fault type in the ARMMMUFaultInfo
structure, which we convert to the FSC at the callsite.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 57286a7..0f5b161 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9126,7 +9126,8 @@ static inline bool m_is_system_region(CPUARMState *env, uint32_t address)
 
 static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
                                  MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                                 hwaddr *phys_ptr, int *prot, uint32_t *fsr)
+                                 hwaddr *phys_ptr, int *prot,
+                                 ARMMMUFaultInfo *fi)
 {
     ARMCPU *cpu = arm_env_get_cpu(env);
     int n;
@@ -9221,7 +9222,7 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
         if (n == -1) { /* no hits */
             if (!pmsav7_use_background_region(cpu, mmu_idx, is_user)) {
                 /* background fault */
-                *fsr = 0;
+                fi->type = ARMFault_Background;
                 return true;
             }
             get_phys_addr_pmsav7_default(env, mmu_idx, address, prot);
@@ -9279,7 +9280,8 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
         }
     }
 
-    *fsr = 0x00d; /* Permission fault */
+    fi->type = ARMFault_Permission;
+    fi->level = 1;
     return !(*prot & (1 << access_type));
 }
 
@@ -9824,7 +9826,8 @@ static bool get_phys_addr(CPUARMState *env, target_ulong address,
         } else if (arm_feature(env, ARM_FEATURE_V7)) {
             /* PMSAv7 */
             ret = get_phys_addr_pmsav7(env, address, access_type, mmu_idx,
-                                       phys_ptr, prot, fsr);
+                                       phys_ptr, prot, fi);
+            *fsr = arm_fi_to_sfsc(fi);
         } else {
             /* Pre-v7 MPU */
             ret = get_phys_addr_pmsav5(env, address, access_type, mmu_idx,
-- 
2.7.4

