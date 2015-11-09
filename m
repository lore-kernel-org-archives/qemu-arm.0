Received: by 10.182.105.169 with SMTP id gn9csp900684obb;
        Sun, 8 Nov 2015 17:14:17 -0800 (PST)
X-Received: by 10.140.91.109 with SMTP id y100mr22834731qgd.20.1447031655617;
        Sun, 08 Nov 2015 17:14:15 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 38si9324862qgm.44.2015.11.08.17.14.15
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Sun, 08 Nov 2015 17:14:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:49350 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1Zvb2F-0002XK-Aq
	for alex.bennee@linaro.org; Sun, 08 Nov 2015 20:14:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52283)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1Zvb1O-0001KY-4F
	for qemu-devel@nongnu.org; Sun, 08 Nov 2015 20:13:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1Zvb1K-0007uC-NK
	for qemu-devel@nongnu.org; Sun, 08 Nov 2015 20:13:22 -0500
Received: from mail-qk0-x22d.google.com ([2607:f8b0:400d:c09::22d]:33215)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>)
	id 1Zvb1K-0007u7-JB; Sun, 08 Nov 2015 20:13:18 -0500
Received: by qkas77 with SMTP id s77so61962345qka.0;
	Sun, 08 Nov 2015 17:13:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=o9d2HY1ekIVFaVGdmhNsYzEXvAz3FMsq3Hs0L4dXGfY=;
	b=cSky7kTWYwh9fwDGbsYAs/1bTGNSmWMfsTViXE94wVQHAawp22uXV53XcsQzGCdwdD
	YQ3LUHKcnkaC9UvgzxQZRLTVzhzcQkOLHdH0IzeQRbU2GpgWu88dXaVb7+wgAja+VxjI
	iB4gFcrIW922qoBt9rtI8zhIrACNdy89bFivQMKFlaJqD6iYknZUc03Pzbu2Ym9xXT3a
	16JEIaqzJSfHMgS3N6PrTy7YZX3VcKLsomiCfyzDdzwG5L3QWCoKyIn7IfVYF4qOdBoW
	bU114Fm6poGeJ6wEs6A9K0ynW3fQoEEbVpwTSfzx3+m3gf7IuManqy2M6GZ9geKpO7VK
	n8SQ==
X-Received: by 10.55.73.18 with SMTP id w18mr26848045qka.95.1447031598196;
	Sun, 08 Nov 2015 17:13:18 -0800 (PST)
Received: from localhost.localdomain (ool-182df582.dyn.optonline.net.
	[24.45.245.130])
	by smtp.gmail.com with ESMTPSA id g97sm3915552qge.6.2015.11.08.17.13.17
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 08 Nov 2015 17:13:17 -0800 (PST)
From: Michael Davidsaver <mdavidsaver@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun,  8 Nov 2015 20:11:31 -0500
Message-Id: <1447031505-12477-5-git-send-email-mdavidsaver@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1447031505-12477-1-git-send-email-mdavidsaver@gmail.com>
References: <1447031505-12477-1-git-send-email-mdavidsaver@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c09::22d
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm@nongnu.org, Michael Davidsaver <mdavidsaver@gmail.com>
Subject: [Qemu-devel] [PATCH 04/18] armv7m: Explicit error for bad vector
	table
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
X-TUID: dfoXq9LzXRZo

Give an explicit error and abort when a load
from VECBASE fails.  Otherwise would likely
jump to 0, which for v7-m holds the reset stack
pointer address.

Signed-off-by: Michael Davidsaver <mdavidsaver@gmail.com>
---
 target-arm/helper.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/target-arm/helper.c b/target-arm/helper.c
index 4178400..1d7ac43 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -5496,7 +5496,17 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
     /* Clear IT bits */
     env->condexec_bits = 0;
     env->regs[14] = lr;
-    addr = ldl_phys(cs->as, env->v7m.vecbase + env->v7m.exception * 4);
+    {
+        MemTxResult result;
+        addr = address_space_ldl(cs->as,
+                                 env->v7m.vecbase + env->v7m.exception * 4,
+                                 MEMTXATTRS_UNSPECIFIED, &result);
+        if (result != MEMTX_OK) {
+            cpu_abort(cs, "Failed to read from exception vector table "
+                      "entry %08x\n",
+                      env->v7m.vecbase + env->v7m.exception * 4);
+        }
+    }
     env->regs[15] = addr & 0xfffffffe;
     env->thumb = addr & 1;
     if (!env->thumb) {
-- 
2.1.4

