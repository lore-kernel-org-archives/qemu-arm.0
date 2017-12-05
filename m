Received: by 10.223.159.74 with SMTP id f10csp3218791wrg;
        Tue, 5 Dec 2017 11:47:01 -0800 (PST)
X-Google-Smtp-Source: AGs4zMYuuO9WhKqVIKsWfXb/ODRgroAJUliYACyq76mo68MeWE5XbV/KqVZKoHqosv+y3Wm9b9m7
X-Received: by 10.37.99.194 with SMTP id x185mr13522602ybb.411.1512503221376;
        Tue, 05 Dec 2017 11:47:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1512503221; cv=none;
        d=google.com; s=arc-20160816;
        b=XLOxvrfBftPTv9R+TNTCjCZWhVN9L5ZIRdYP9ZIHFzjdO7mCStjVPEHL7nxqO6+bxL
         rtxdSu8UlWlAiAt3MimQ6vhAg/lqHCYB4B6WaEXgwjYh6weSVn9U+6c+JCWBUItrVv2E
         9lrkln9ry5eY1JKwluauZoEGfnIiM4/7iUcD8pIN9e4aCM/vihjLWllGiwaO7bsvNIMn
         45X0FuwKfuT7C8XUiAPBerKQKIWLSQpFFPOIKFeUuinJfhw1UO+8uyzdYJJbBfnVOeIS
         cu9oax4KSMWsbePhoA6OZ++R3MNFJaHm+gEKtQCfeplOIZ0CRmjclEaa/Y7TWjZcl/Jn
         /tig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=h5zU5BVqrbXXkcTg3Mp0HXNYbr7Qw8MERmmxxgyYsQI=;
        b=1FumeX1kudoLJ83G4Yxwu0lrARsFk4AUzInXkBHBum1LaTlZ5AS4PymlyRMEK07/8v
         TS+YIQuj5IBMSU2uRMpxtYBngx7KoFt8XSrqZNxOayKxtcVv45C/3+PHlQdtCwS7S3Ti
         x/vM3HvSNkNqhcGagx+7uEr1hMoYJyYhN8rD5kiHquInBVRSlGkbpVcruHtoflvCKnSW
         a4GB++9cyY3DzaxLrvIfAdFeZ2Sr8C8dXmV5MsODj7Nv3HTVfO2iAFKDxqPTwe5I1F7t
         ETWsPcdU0DFubNjB4rGtYSiz0O8eEMT6GnTQC5v+Y/c3WcM5bDAbPIEAXuOAJI5UP482
         zefA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r9si238223ybd.426.2017.12.05.11.47.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Dec 2017 11:47:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51757 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eMJBE-00010K-Nc
	for alex.bennee@linaro.org; Tue, 05 Dec 2017 14:47:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56524)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eMJAz-0000yl-4c
	for qemu-arm@nongnu.org; Tue, 05 Dec 2017 14:46:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eMJAy-0002IU-6c
	for qemu-arm@nongnu.org; Tue, 05 Dec 2017 14:46:45 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:38776)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1eMJAx-0002CW-VX; Tue, 05 Dec 2017 14:46:44 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1eMJAv-0005Dm-NG; Tue, 05 Dec 2017 19:46:41 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue,  5 Dec 2017 19:46:32 +0000
Message-Id: <1512503192-2239-13-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1512503192-2239-1-git-send-email-peter.maydell@linaro.org>
References: <1512503192-2239-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 12/12] target/arm: Extend PAR format determination
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
X-TUID: 66kqDskXBY/0

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Now that do_ats_write() is entirely in control of whether to
generate a 32-bit PAR or a 64-bit PAR, we can make it use the
correct (complicated) condition for doing so.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
[PMM: Rebased Edgar's patch on top of get_phys_addr() refactoring;
 use arm_s1_regime_using_lpae_format() rather than
 regime_using_lpae_format() because the latter will assert
 if passed ARMMMUIdx_S12NSE0 or ARMMMUIdx_S12NSE1;
 updated commit message appropriately]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 33 +++++++++++++++++++++++++++++----
 1 file changed, 29 insertions(+), 4 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index c23e424..d526db4 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -2162,16 +2162,41 @@ static uint64_t do_ats_write(CPUARMState *env, uint64_t value,
     int prot;
     bool ret;
     uint64_t par64;
+    bool format64 = false;
     MemTxAttrs attrs = {};
     ARMMMUFaultInfo fi = {};
     ARMCacheAttrs cacheattrs = {};
 
     ret = get_phys_addr(env, value, access_type, mmu_idx, &phys_addr, &attrs,
                         &prot, &page_size, &fi, &cacheattrs);
-    /* TODO: this is not the correct condition to use to decide whether
-     * to report a PAR in 64-bit or 32-bit format.
-     */
-    if (arm_s1_regime_using_lpae_format(env, mmu_idx)) {
+
+    if (is_a64(env)) {
+        format64 = true;
+    } else if (arm_feature(env, ARM_FEATURE_LPAE)) {
+        /*
+         * ATS1Cxx:
+         * * TTBCR.EAE determines whether the result is returned using the
+         *   32-bit or the 64-bit PAR format
+         * * Instructions executed in Hyp mode always use the 64bit format
+         *
+         * ATS1S2NSOxx uses the 64bit format if any of the following is true:
+         * * The Non-secure TTBCR.EAE bit is set to 1
+         * * The implementation includes EL2, and the value of HCR.VM is 1
+         *
+         * ATS1Hx always uses the 64bit format (not supported yet).
+         */
+        format64 = arm_s1_regime_using_lpae_format(env, mmu_idx);
+
+        if (arm_feature(env, ARM_FEATURE_EL2)) {
+            if (mmu_idx == ARMMMUIdx_S12NSE0 || mmu_idx == ARMMMUIdx_S12NSE1) {
+                format64 |= env->cp15.hcr_el2 & HCR_VM;
+            } else {
+                format64 |= arm_current_el(env) == 2;
+            }
+        }
+    }
+
+    if (format64) {
         /* Create a 64-bit PAR */
         par64 = (1 << 11); /* LPAE bit always set */
         if (!ret) {
-- 
2.7.4

