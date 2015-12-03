Received: by 10.182.158.201 with SMTP id ww9csp3414731obb;
        Wed, 2 Dec 2015 16:25:41 -0800 (PST)
X-Received: by 10.140.81.112 with SMTP id e103mr7449845qgd.99.1449102341934;
        Wed, 02 Dec 2015 16:25:41 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a76si6156236qhc.94.2015.12.02.16.25.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 Dec 2015 16:25:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60983 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a4HiP-0007ek-GU
	for alex.bennee@linaro.org; Wed, 02 Dec 2015 19:25:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36409)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1a4HcA-0004RH-8O
	for qemu-devel@nongnu.org; Wed, 02 Dec 2015 19:19:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1a4Hc8-00022g-AV
	for qemu-devel@nongnu.org; Wed, 02 Dec 2015 19:19:14 -0500
Received: from mail-qk0-x22a.google.com ([2607:f8b0:400d:c09::22a]:36370)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>)
	id 1a4Hc8-00022X-6d; Wed, 02 Dec 2015 19:19:12 -0500
Received: by qkda6 with SMTP id a6so23876148qkd.3;
	Wed, 02 Dec 2015 16:19:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=qREsWZTwCbF6qTQQvxY4yGew9xKljk/wYYhagpHad5o=;
	b=EANoqganpVFNeOGRiNSuGXEOIidSXRAewyBeBoDqmVTYnzdr32Gy8TvBrp7b/yY+3O
	KWfFm6mDhsKB7j5q40GouwQ+xyp/rzK9VxJhwsXYkN65prL0TOK+ig7b+JqYfE+TzDb5
	S/OfotmRThzRCrQNr4UPhdTfDpzAUAPDcu9iuRaHGtUJa0mrI6Hjkg06OQ62gTelXpZ+
	2S8VwmEh7fFugDZc4TvmfYiick/sFFm74P8yGgTycaZTgouW8p1g9/Gtm7hpCHrzlzD9
	uYPGJQjyM1PA/xF2dSfNPQEibHxV9m8SfV5y2jrISCeDJ0gI5LDmFldwpZoNakhhZ+KL
	PeXw==
X-Received: by 10.55.31.214 with SMTP id n83mr7564311qkh.50.1449101951822;
	Wed, 02 Dec 2015 16:19:11 -0800 (PST)
Received: from desktop.local (ool-182df582.dyn.optonline.net. [24.45.245.130])
	by smtp.gmail.com with ESMTPSA id
	e31sm2276326qge.11.2015.12.02.16.19.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 02 Dec 2015 16:19:11 -0800 (PST)
From: Michael Davidsaver <mdavidsaver@gmail.com>
To: qemu-devel@nongnu.org
Date: Wed,  2 Dec 2015 19:18:45 -0500
Message-Id: <1449101933-24928-19-git-send-email-mdavidsaver@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1449101933-24928-1-git-send-email-mdavidsaver@gmail.com>
References: <1449101933-24928-1-git-send-email-mdavidsaver@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c09::22a
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm@nongnu.org, Michael Davidsaver <mdavidsaver@gmail.com>
Subject: [Qemu-devel] [PATCH v2 18/26] armv7m: update base region policy
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
X-TUID: 0ocSCvszGEjq

Update MPU background policy as per ARM.
Main changes are preventing writes to ROM
and no-exec for device regions.
---
 target-arm/helper.c | 35 +++++++++++++++++++++++++++--------
 1 file changed, 27 insertions(+), 8 deletions(-)

diff --git a/target-arm/helper.c b/target-arm/helper.c
index e73f7a6..e42f6d0 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -7062,16 +7062,35 @@ static inline void get_phys_addr_pmsav7_default(CPUARMState *env,
                                                 ARMMMUIdx mmu_idx,
                                                 int32_t address, int *prot)
 {
-    *prot = PAGE_READ | PAGE_WRITE;
-    switch (address) {
-    case 0xF0000000 ... 0xFFFFFFFF:
-        if (regime_sctlr(env, mmu_idx) & SCTLR_V) { /* hivecs execing is ok */
+    if (!IS_M(env)) {
+        *prot = PAGE_READ | PAGE_WRITE;
+        switch (address) {
+        case 0xF0000000 ... 0xFFFFFFFF:
+            if (regime_sctlr(env, mmu_idx) & SCTLR_V) {
+                /* hivecs execing is ok */
+                *prot |= PAGE_EXEC;
+            }
+            break;
+        case 0x00000000 ... 0x7FFFFFFF:
             *prot |= PAGE_EXEC;
+            break;
+        }
+    } else {
+        /* ARM specfies XN (PAGE_EXEC) but leaves R/W to implementation.
+         * Mark ROM as read only since writes would otherwise be ignored.
+         */
+        switch (address) {
+        case 0 ... 0x1fffffff: /* ROM */
+            *prot = PAGE_READ | PAGE_EXEC;
+            break;
+        case 0x20000000 ... 0x3fffffff:  /* SRAM */
+        case 0x60000000 ... 0x7fffffff: /* RAM */
+        case 0x80000000 ... 0x9fffffff: /* RAM */
+            *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
+            break;
+        default: /* Peripheral, 2x Device, and System */
+            *prot = PAGE_READ | PAGE_WRITE;
         }
-        break;
-    case 0x00000000 ... 0x7FFFFFFF:
-        *prot |= PAGE_EXEC;
-        break;
     }
 
 }
-- 
2.1.4

