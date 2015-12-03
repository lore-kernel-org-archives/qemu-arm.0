Received: by 10.182.158.201 with SMTP id ww9csp3415363obb;
        Wed, 2 Dec 2015 16:27:27 -0800 (PST)
X-Received: by 10.55.80.138 with SMTP id e132mr7318746qkb.74.1449102447362;
        Wed, 02 Dec 2015 16:27:27 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z132si1563767qhc.32.2015.12.02.16.27.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 Dec 2015 16:27:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:32769 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a4Hk6-0002X6-Ud
	for alex.bennee@linaro.org; Wed, 02 Dec 2015 19:27:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36405)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1a4HcA-0004R6-6n
	for qemu-devel@nongnu.org; Wed, 02 Dec 2015 19:19:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1a4Hc8-00022x-SX
	for qemu-devel@nongnu.org; Wed, 02 Dec 2015 19:19:14 -0500
Received: from mail-qg0-x232.google.com ([2607:f8b0:400d:c04::232]:36265)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>)
	id 1a4Hc8-00022r-Ny; Wed, 02 Dec 2015 19:19:12 -0500
Received: by qgcc31 with SMTP id c31so48115726qgc.3;
	Wed, 02 Dec 2015 16:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7xaqoSzalAq0Mt3bc4NQv1BNQEWyAvqEf9FgKDv7yiU=;
	b=M/pWxhXep6ch4wG3uTA1h54G940YZsy+1ptA4FlU1O0GbGGncAAND7JObGV384f33T
	0vsFucGava5MF+JdJsm4KcoGDHV0ZUcGKCYLmq+BcVAZg9TfvOKkyqE+LyVMuqjdHy/1
	nvU/eCnEIpEcOXaTYD4UlJH862zMG7CKKg8HjTO01N7BQHVZAEjEV2MmgkyqH6M+WRmU
	4d8PBTXQZyLq3dtdEmQXnLmyb88Ubzpenz5uPkCuZZAL/ktwxKen85mrQEw5PLRFzYw6
	kq6MZAT1ofHn5tit+2A8TT3xPmLxGovziJJH84DYKYdKUmAql04g9/Wtlq//6POEYimt
	UHzA==
X-Received: by 10.140.28.97 with SMTP id 88mr7727667qgy.74.1449101952418;
	Wed, 02 Dec 2015 16:19:12 -0800 (PST)
Received: from desktop.local (ool-182df582.dyn.optonline.net. [24.45.245.130])
	by smtp.gmail.com with ESMTPSA id
	e31sm2276326qge.11.2015.12.02.16.19.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 02 Dec 2015 16:19:12 -0800 (PST)
From: Michael Davidsaver <mdavidsaver@gmail.com>
To: qemu-devel@nongnu.org
Date: Wed,  2 Dec 2015 19:18:46 -0500
Message-Id: <1449101933-24928-20-git-send-email-mdavidsaver@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1449101933-24928-1-git-send-email-mdavidsaver@gmail.com>
References: <1449101933-24928-1-git-send-email-mdavidsaver@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c04::232
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm@nongnu.org, Michael Davidsaver <mdavidsaver@gmail.com>
Subject: [Qemu-devel] [PATCH v2 19/26] armv7m: mpu not allowed to map
	exception return codes
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
X-TUID: SdzfSjqgHoPm

Always pass these through to be caught be by the
unassigned handler.
---
 target-arm/helper.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/target-arm/helper.c b/target-arm/helper.c
index e42f6d0..a5adf2d 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -7106,6 +7106,15 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
     *phys_ptr = address;
     *prot = 0;
 
+    /* Magic exception codes returns always pass through the MPU
+     * to be trapped later in arm_v7m_unassigned_access()
+     */
+    if (IS_M(env) && env->v7m.exception != 0 && address >= 0xfffffff0) {
+        *prot = PAGE_EXEC;
+        *fsr = 0;
+        return false;
+    }
+
     if (regime_translation_disabled(env, mmu_idx)) { /* MPU disabled */
         get_phys_addr_pmsav7_default(env, mmu_idx, address, prot);
     } else { /* MPU enabled */
-- 
2.1.4

