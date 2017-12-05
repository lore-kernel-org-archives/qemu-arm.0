Received: by 10.223.159.74 with SMTP id f10csp3219327wrg;
        Tue, 5 Dec 2017 11:47:36 -0800 (PST)
X-Google-Smtp-Source: AGs4zMYM5Jajw6bgNkkbs+mb6KEsK5+qX5n5lgADlX3En78SC9EfuRmxKn+NB7SWcayVPnM5MceM
X-Received: by 10.37.11.18 with SMTP id 18mr2283ybl.226.1512503256677;
        Tue, 05 Dec 2017 11:47:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1512503256; cv=none;
        d=google.com; s=arc-20160816;
        b=Qqznq24BByPojY/Vs82rK7TtoEsalG6cUzu4MrwKG98x4PlMtMDnieCrYoqsUuLFrp
         f+Aogu2MzE3cpjQzNLQl5PnaIgZJubP5UVJyAKtsIAiJkZQxPxZBxqHYNtlligWjn2xF
         jlvzj9pJXHunciVcF2aACJaOib91hfoHqMutQ/jxjPOEBApg8042u0yNhGAHau8wuYAJ
         U1YmtTEBrTb3htVrq3qbo0UMCe+ycguvrymwGskI0aOwAiu8o3JfMBDtoH56KfWpFzkJ
         /cjwmMC8gjI0wwqpmZLeAglj2ykY8Kp0qVLOLDajxgabNIgVbRfQvh5kuOiv/JW4JUNd
         9inQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=NmrjrdkPZ/DZlu3dbyTWJaSvflCpEaGCi1hAlSTE4T4=;
        b=e4I9Aa83rQGfhcoHbctRr0+X1IBhsITf3khphOLqdUbBUWqqs+clFeNrfPbFV0hJM5
         lNMApN/YL0EI17dA6THgdNDxKCXG/8Z0OcMhv5Z3967uT3SgvJsbmgXXqDaPABkzVX6a
         BMCmMoBDmdYBuNYTUTCZQYdLxnzrOaA3wxPv/2teLykwI7y8Hr6s7YNEqWWAppy0NJDp
         6TS9TQDlK9vtYFwS6t0h7e2d9ZefAoxPyDwUhJPMMkEb/gtLutVJUJ94znbY9t51iumR
         QU4l5WJb9/PnJviMNNRFztX22TiFwAqdOv2hP9fgFYmePLtSXqPS37FcqJwNYgth+GYp
         LsjA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s14si229234ybg.206.2017.12.05.11.47.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Dec 2017 11:47:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51764 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eMJBo-0002T0-3q
	for alex.bennee@linaro.org; Tue, 05 Dec 2017 14:47:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56645)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eMJB3-00012Q-SB
	for qemu-arm@nongnu.org; Tue, 05 Dec 2017 14:46:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eMJB3-0002LX-4J
	for qemu-arm@nongnu.org; Tue, 05 Dec 2017 14:46:49 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:38776)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1eMJB2-0002CW-Tc; Tue, 05 Dec 2017 14:46:49 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1eMJAr-0005Al-I6; Tue, 05 Dec 2017 19:46:37 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue,  5 Dec 2017 19:46:26 +0000
Message-Id: <1512503192-2239-7-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1512503192-2239-1-git-send-email-peter.maydell@linaro.org>
References: <1512503192-2239-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 06/12] target/arm: Convert get_phys_addr_pmsav5()
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
X-TUID: EkgCiYT2yz7G

Make get_phys_addr_pmsav5() return a fault type in the ARMMMUFaultInfo
structure, which we convert to the FSC at the callsite.

Note that PMSAv5 does not define any guest-visible fault status
register, so the different "fsr" values we were previously
returning are entirely arbitrary. So we can just switch to using
the most appropriae fi->type values without worrying that we
need to special-case FaultInfo->FSC conversion for PMSAv5.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index a2a0784..57286a7 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9547,7 +9547,8 @@ static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
 
 static bool get_phys_addr_pmsav5(CPUARMState *env, uint32_t address,
                                  MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                                 hwaddr *phys_ptr, int *prot, uint32_t *fsr)
+                                 hwaddr *phys_ptr, int *prot,
+                                 ARMMMUFaultInfo *fi)
 {
     int n;
     uint32_t mask;
@@ -9576,7 +9577,7 @@ static bool get_phys_addr_pmsav5(CPUARMState *env, uint32_t address,
         }
     }
     if (n < 0) {
-        *fsr = 2;
+        fi->type = ARMFault_Background;
         return true;
     }
 
@@ -9588,11 +9589,13 @@ static bool get_phys_addr_pmsav5(CPUARMState *env, uint32_t address,
     mask = (mask >> (n * 4)) & 0xf;
     switch (mask) {
     case 0:
-        *fsr = 1;
+        fi->type = ARMFault_Permission;
+        fi->level = 1;
         return true;
     case 1:
         if (is_user) {
-            *fsr = 1;
+            fi->type = ARMFault_Permission;
+            fi->level = 1;
             return true;
         }
         *prot = PAGE_READ | PAGE_WRITE;
@@ -9608,7 +9611,8 @@ static bool get_phys_addr_pmsav5(CPUARMState *env, uint32_t address,
         break;
     case 5:
         if (is_user) {
-            *fsr = 1;
+            fi->type = ARMFault_Permission;
+            fi->level = 1;
             return true;
         }
         *prot = PAGE_READ;
@@ -9618,7 +9622,8 @@ static bool get_phys_addr_pmsav5(CPUARMState *env, uint32_t address,
         break;
     default:
         /* Bad permission.  */
-        *fsr = 1;
+        fi->type = ARMFault_Permission;
+        fi->level = 1;
         return true;
     }
     *prot |= PAGE_EXEC;
@@ -9823,7 +9828,8 @@ static bool get_phys_addr(CPUARMState *env, target_ulong address,
         } else {
             /* Pre-v7 MPU */
             ret = get_phys_addr_pmsav5(env, address, access_type, mmu_idx,
-                                       phys_ptr, prot, fsr);
+                                       phys_ptr, prot, fi);
+            *fsr = arm_fi_to_sfsc(fi);
         }
         qemu_log_mask(CPU_LOG_MMU, "PMSA MPU lookup for %s at 0x%08" PRIx32
                       " mmu_idx %u -> %s (prot %c%c%c)\n",
-- 
2.7.4

