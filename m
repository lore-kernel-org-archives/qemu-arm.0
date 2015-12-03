Received: by 10.182.158.201 with SMTP id ww9csp3412669obb;
        Wed, 2 Dec 2015 16:19:56 -0800 (PST)
X-Received: by 10.140.105.36 with SMTP id b33mr7755702qgf.94.1449101996343;
        Wed, 02 Dec 2015 16:19:56 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 25si6166124qky.58.2015.12.02.16.19.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 Dec 2015 16:19:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60907 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a4Hcq-0005Ls-0q
	for alex.bennee@linaro.org; Wed, 02 Dec 2015 19:19:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36096)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1a4Hc0-000499-9i
	for qemu-devel@nongnu.org; Wed, 02 Dec 2015 19:19:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1a4Hby-0001wf-IK
	for qemu-devel@nongnu.org; Wed, 02 Dec 2015 19:19:04 -0500
Received: from mail-qg0-x232.google.com ([2607:f8b0:400d:c04::232]:33465)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>)
	id 1a4Hby-0001wa-EI; Wed, 02 Dec 2015 19:19:02 -0500
Received: by qgea14 with SMTP id a14so48162094qge.0;
	Wed, 02 Dec 2015 16:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=i8IPcnYxYxOwokv+A8heH4TcnWDPVKbGSBm4zJRvKxM=;
	b=ZJDgGr1EcGf3Wjev7PfFsQ23sBgKOarhkRvFetFZMZyXYtgFxxWMeK1lKT2wb7kZHb
	icZXCYxex2uDp/iZWj5VbZAPo1UHj1hm+32/oqJ9iabuloHediyoRukfFE/DZqWKTgJc
	T83O4N5aqDzMRe6lR/cX5mzKLSAhwYOCYheXqkyrPOQ7PqzvPQjNIFSDUfLR+EsrMiWO
	ZIWVvXsWrRVEcT8Mc7s/h1ld0Je3YgMkrzfLT28nY3jruW9O4weoSA+uSP/fkelAISst
	xpJntfu7TBTmLSdjm9yLXDuuejvCxy5OlGFo884W46LAaMlh7lAa2BFKiiiuoT8ojvkv
	JOWg==
X-Received: by 10.140.88.212 with SMTP id t78mr7622305qgd.82.1449101942113;
	Wed, 02 Dec 2015 16:19:02 -0800 (PST)
Received: from desktop.local (ool-182df582.dyn.optonline.net. [24.45.245.130])
	by smtp.gmail.com with ESMTPSA id
	e31sm2276326qge.11.2015.12.02.16.19.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 02 Dec 2015 16:19:01 -0800 (PST)
From: Michael Davidsaver <mdavidsaver@gmail.com>
To: qemu-devel@nongnu.org
Date: Wed,  2 Dec 2015 19:18:31 -0500
Message-Id: <1449101933-24928-5-git-send-email-mdavidsaver@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1449101933-24928-1-git-send-email-mdavidsaver@gmail.com>
References: <1449101933-24928-1-git-send-email-mdavidsaver@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c04::232
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm@nongnu.org, Michael Davidsaver <mdavidsaver@gmail.com>
Subject: [Qemu-devel] [PATCH v2 04/26] armv7m: additional cpu state for
	exception handling
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
X-TUID: rYzDHnvZIjJm

Track priorities and highest active and pending
exception.  Also the highest pending exception
for faster exception handler entry.

The pending exception information will be re-calculated
on load, so no additional vmstate tracking is needed.
---
 target-arm/cpu.c | 2 ++
 target-arm/cpu.h | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/target-arm/cpu.c b/target-arm/cpu.c
index 728854f..5348028 100644
--- a/target-arm/cpu.c
+++ b/target-arm/cpu.c
@@ -173,6 +173,8 @@ static void arm_cpu_reset(CPUState *s)
         uint32_t initial_pc; /* Loaded from 0x4 */
         uint8_t *rom;
 
+        env->v7m.exception_prio = env->v7m.pending_prio = 0x100;
+
         env->daif &= ~PSTATE_I;
         rom = rom_ptr(0);
         if (rom) {
diff --git a/target-arm/cpu.h b/target-arm/cpu.h
index 815fef8..c193fbb 100644
--- a/target-arm/cpu.h
+++ b/target-arm/cpu.h
@@ -398,6 +398,9 @@ typedef struct CPUARMState {
         uint32_t control;
         int current_sp;
         int exception;
+        int exception_prio;
+        unsigned pending;
+        int pending_prio;
     } v7m;
 
     /* Information associated with an exception about to be taken:
-- 
2.1.4

