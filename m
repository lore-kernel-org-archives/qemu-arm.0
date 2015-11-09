Received: by 10.182.105.169 with SMTP id gn9csp902615obb;
        Sun, 8 Nov 2015 17:20:32 -0800 (PST)
X-Received: by 10.55.80.2 with SMTP id e2mr26113568qkb.92.1447032032772;
        Sun, 08 Nov 2015 17:20:32 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f23si9306701qhc.77.2015.11.08.17.20.32
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Sun, 08 Nov 2015 17:20:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:49449 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1Zvb8K-0005yX-G2
	for alex.bennee@linaro.org; Sun, 08 Nov 2015 20:20:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52438)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1Zvb1S-0001Og-ER
	for qemu-devel@nongnu.org; Sun, 08 Nov 2015 20:13:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1Zvb1R-0007zo-4Q
	for qemu-devel@nongnu.org; Sun, 08 Nov 2015 20:13:26 -0500
Received: from mail-qg0-x234.google.com ([2607:f8b0:400d:c04::234]:34145)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>)
	id 1Zvb1Q-0007zc-V1; Sun, 08 Nov 2015 20:13:25 -0500
Received: by qgeb1 with SMTP id b1so79142772qge.1;
	Sun, 08 Nov 2015 17:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=+fmeMzDHJ097Kjlos2FBWcIkrFkASj9O6eiIy4Q/JaQ=;
	b=CxuuQaQuYaph/WkARP1Z8xl07coEVO8sZblpLKmSYJAzSP75iun0PJHT4cj8zUKrxG
	lBgEViCmftemT4sb8le+BdqSuF2zDFZIrMd+0JoBFJ7SbgXx32R50Yev6CAmPGJzTGtw
	pYatNSgbengWJ+Ojreh4/rLMZbAaybOxDMnf2rgB2tEQdp7KuzleqQLkAb11DhSNenVN
	yL3DuZKVEcI40hwdZNAM7rcSBmS/sMKwY9Lbcxy04VPhtHqJCVyKjfa78lxdp33T4a8+
	VVN/q/XYsqPrvXs2eCWI4pq6Ip0xenzHFK+77AreeEbc3MpvISq7oAh360kAwgeyafme
	1SNA==
X-Received: by 10.140.100.207 with SMTP id s73mr26773018qge.47.1447031604564; 
	Sun, 08 Nov 2015 17:13:24 -0800 (PST)
Received: from localhost.localdomain (ool-182df582.dyn.optonline.net.
	[24.45.245.130])
	by smtp.gmail.com with ESMTPSA id g97sm3915552qge.6.2015.11.08.17.13.24
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 08 Nov 2015 17:13:24 -0800 (PST)
From: Michael Davidsaver <mdavidsaver@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun,  8 Nov 2015 20:11:41 -0500
Message-Id: <1447031505-12477-15-git-send-email-mdavidsaver@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1447031505-12477-1-git-send-email-mdavidsaver@gmail.com>
References: <1447031505-12477-1-git-send-email-mdavidsaver@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c04::234
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm@nongnu.org, Michael Davidsaver <mdavidsaver@gmail.com>
Subject: [Qemu-devel] [PATCH 14/18] armv7m: auto-clear FAULTMASK
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
X-TUID: KHNNKXTm+gjt

on return from all exceptions other than NMI

Signed-off-by: Michael Davidsaver <mdavidsaver@gmail.com>
---
 target-arm/helper.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/target-arm/helper.c b/target-arm/helper.c
index 5be09b8..83af528 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -5379,8 +5379,13 @@ static void do_v7m_exception_exit(CPUARMState *env)
     uint32_t xpsr;
 
     type = env->regs[15];
-    if (env->v7m.exception != 0)
+    if (env->v7m.exception != ARMV7M_EXCP_NMI) {
+        /* Auto-clear FAULTMASK on return from other than NMI */
+        env->daif &= ~PSTATE_F;
+    }
+    if (env->v7m.exception != 0) {
         armv7m_nvic_complete_irq(env->nvic, env->v7m.exception);
+    }
 
     /* Switch to the target stack.  */
     switch_v7m_sp(env, (type & 4) != 0);
-- 
2.1.4

