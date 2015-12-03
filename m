Received: by 10.182.158.201 with SMTP id ww9csp3413369obb;
        Wed, 2 Dec 2015 16:21:51 -0800 (PST)
X-Received: by 10.140.249.131 with SMTP id u125mr8138769qhc.53.1449102111766;
        Wed, 02 Dec 2015 16:21:51 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w200si6145792qhb.78.2015.12.02.16.21.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 Dec 2015 16:21:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60932 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a4Heh-0000VX-B6
	for alex.bennee@linaro.org; Wed, 02 Dec 2015 19:21:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36106)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1a4Hc0-00049E-CG
	for qemu-devel@nongnu.org; Wed, 02 Dec 2015 19:19:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1a4Hby-0001wU-1t
	for qemu-devel@nongnu.org; Wed, 02 Dec 2015 19:19:04 -0500
Received: from mail-qg0-x22f.google.com ([2607:f8b0:400d:c04::22f]:33464)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>)
	id 1a4Hbx-0001wO-UB; Wed, 02 Dec 2015 19:19:01 -0500
Received: by qgea14 with SMTP id a14so48161935qge.0;
	Wed, 02 Dec 2015 16:19:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=BoktFYFhJr7ZMhDkSMvVGnYF4d/Ehyqu+PvvDgJqGpE=;
	b=M29dR90b47KVNmfmkjTk6rDsA2fFfEyC7a/kUPUb7wajafYbKA5e+1huKKDgKyyBCg
	UEoi8BlUD9aNZQ50KFVAk7GGy3A/WfNiWR+j6HJB/Uk37SldXX5TZspP5QvCqE3Fu96G
	Qn9BLkAHXk1EAsex7KqVcTwkbj89YVfR/DS0bIMpQ8LTGBCsJdPYA2VloH+TBLHquDkC
	iXRmUsu8jZjWrcN7lrsqfCe3kahXN8MXovMlYfvJ9k239AviwQ0Fd1o41jOlnly1Vcsg
	shpGCzsqC5RSy786zc0Op12yuw558yhED/wDCCPxQWV+U7HEmPSRjGfyzTWa7Az3avGz
	eE0Q==
X-Received: by 10.140.92.176 with SMTP id b45mr7571314qge.104.1449101941537;
	Wed, 02 Dec 2015 16:19:01 -0800 (PST)
Received: from desktop.local (ool-182df582.dyn.optonline.net. [24.45.245.130])
	by smtp.gmail.com with ESMTPSA id
	e31sm2276326qge.11.2015.12.02.16.19.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 02 Dec 2015 16:19:01 -0800 (PST)
From: Michael Davidsaver <mdavidsaver@gmail.com>
To: qemu-devel@nongnu.org
Date: Wed,  2 Dec 2015 19:18:30 -0500
Message-Id: <1449101933-24928-4-git-send-email-mdavidsaver@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1449101933-24928-1-git-send-email-mdavidsaver@gmail.com>
References: <1449101933-24928-1-git-send-email-mdavidsaver@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c04::22f
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm@nongnu.org, Michael Davidsaver <mdavidsaver@gmail.com>
Subject: [Qemu-devel] [PATCH v2 03/26] armv7m: Explicit error for bad vector
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
X-TUID: b3KoiJbbqZet

Give an explicit error and abort when a load
from VECBASE fails.  Otherwise would likely
jump to 0, which for v7-m holds the reset stack
pointer address.
---
 target-arm/helper.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/target-arm/helper.c b/target-arm/helper.c
index 2c631e3..7b76f32 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -5414,6 +5414,25 @@ static void do_v7m_exception_exit(CPUARMState *env)
        pointer.  */
 }
 
+static
+uint32_t arm_v7m_load_vector(ARMCPU *cpu)
+
+{
+    CPUState *cs = &cpu->parent_obj;
+    CPUARMState *env = &cpu->env;
+    MemTxResult result;
+    hwaddr vec = env->v7m.vecbase + env->v7m.exception * 4;
+    uint32_t addr;
+
+    addr = address_space_ldl(cs->as, vec,
+                             MEMTXATTRS_UNSPECIFIED, &result);
+    if (result != MEMTX_OK) {
+        cpu_abort(cs, "Failed to read from exception vector table "
+                  "entry %08x\n", (unsigned)vec);
+    }
+    return addr;
+}
+
 void arm_v7m_cpu_do_interrupt(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
@@ -5495,7 +5514,7 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
     /* Clear IT bits */
     env->condexec_bits = 0;
     env->regs[14] = lr;
-    addr = ldl_phys(cs->as, env->v7m.vecbase + env->v7m.exception * 4);
+    addr = arm_v7m_load_vector(cpu);
     env->regs[15] = addr & 0xfffffffe;
     env->thumb = addr & 1;
 }
-- 
2.1.4

