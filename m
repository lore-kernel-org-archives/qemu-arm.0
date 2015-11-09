Received: by 10.182.105.169 with SMTP id gn9csp900670obb;
        Sun, 8 Nov 2015 17:14:14 -0800 (PST)
X-Received: by 10.55.74.16 with SMTP id x16mr26522218qka.73.1447031654181;
        Sun, 08 Nov 2015 17:14:14 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v197si9329042qka.16.2015.11.08.17.14.14
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Sun, 08 Nov 2015 17:14:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:49348 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1Zvb2D-0002VQ-Rn
	for alex.bennee@linaro.org; Sun, 08 Nov 2015 20:14:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52290)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1Zvb1O-0001Kb-5t
	for qemu-devel@nongnu.org; Sun, 08 Nov 2015 20:13:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1Zvb1K-0007u2-3H
	for qemu-devel@nongnu.org; Sun, 08 Nov 2015 20:13:22 -0500
Received: from mail-qk0-x234.google.com ([2607:f8b0:400d:c09::234]:34279)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>)
	id 1Zvb1K-0007tw-0K; Sun, 08 Nov 2015 20:13:18 -0500
Received: by qkcn129 with SMTP id n129so65854200qkc.1;
	Sun, 08 Nov 2015 17:13:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=aNkLCZRF9XsOY1Z3N3VjE6asgSjCq85fqogexC1p2vw=;
	b=XhZR++ln9eCs/1E2+pg1JDq4STwZkt2eGyvvM9I+sAYb42l8sDTgJ/t5Qj3q48owo6
	YVCNCsKATGBJWRG+ogKfHZKoq67HA4MVwq7RIjEL7gzU5aQzZNtcbxMS3swZgppaCvGr
	bRzu9RDwkamPYaE4HdLSZCzt2W4Gpzx2C7FhRC5D3fg3IzYQ9xeVP+cBcBzCOhPQPysz
	5w0GHg1TQALS4ykqwpVdUQltKZzb2VnMa6wrQT4biYCCgOzN2pTr5feAERlp6krNcikh
	nWf3304NgOl+v6CAnjaJSoUAwvEoyKmf0kSE7CHh7RWXr+hQp1kdb+zpLryU97wwo+8+
	ek+w==
X-Received: by 10.55.74.197 with SMTP id x188mr26344978qka.38.1447031597627;
	Sun, 08 Nov 2015 17:13:17 -0800 (PST)
Received: from localhost.localdomain (ool-182df582.dyn.optonline.net.
	[24.45.245.130])
	by smtp.gmail.com with ESMTPSA id g97sm3915552qge.6.2015.11.08.17.13.17
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 08 Nov 2015 17:13:17 -0800 (PST)
From: Michael Davidsaver <mdavidsaver@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun,  8 Nov 2015 20:11:30 -0500
Message-Id: <1447031505-12477-4-git-send-email-mdavidsaver@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1447031505-12477-1-git-send-email-mdavidsaver@gmail.com>
References: <1447031505-12477-1-git-send-email-mdavidsaver@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c09::234
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm@nongnu.org, Michael Davidsaver <mdavidsaver@gmail.com>
Subject: [Qemu-devel] [PATCH 03/18] armv7m: Complain about incorrect
	exception table entries.
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
X-TUID: noU8jbJNunDA

For -M  These should always be thumb mode.
Log a message if this is seen.

Signed-off-by: Michael Davidsaver <mdavidsaver@gmail.com>
---
 target-arm/helper.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/target-arm/helper.c b/target-arm/helper.c
index 4408100..4178400 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -5396,7 +5396,8 @@ static void do_v7m_exception_exit(CPUARMState *env)
         qemu_log_mask(LOG_GUEST_ERROR,
                       "M profile return from interrupt with misaligned "
                       "PC is UNPREDICTABLE\n");
-        /* Actual hardware seems to ignore the lsbit, and there are several
+        /* The ARM calls for UsageFault when the T bit isn't set, but
+         * actual hardware seems to ignore the lsbit, and there are several
          * RTOSes out there which incorrectly assume the r15 in the stack
          * frame should be a Thumb-style "lsbit indicates ARM/Thumb" value.
          */
@@ -5498,6 +5499,12 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
     addr = ldl_phys(cs->as, env->v7m.vecbase + env->v7m.exception * 4);
     env->regs[15] = addr & 0xfffffffe;
     env->thumb = addr & 1;
+    if (!env->thumb) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "M profile interrupt handler %d with incorrect "
+                      "instruction mode in PC is UNPREDICTABLE\n",
+                      env->v7m.exception);
+    }
 }
 
 /* Function used to synchronize QEMU's AArch64 register set with AArch32
-- 
2.1.4

