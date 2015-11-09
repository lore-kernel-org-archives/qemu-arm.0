Received: by 10.182.105.169 with SMTP id gn9csp901779obb;
        Sun, 8 Nov 2015 17:17:48 -0800 (PST)
X-Received: by 10.141.28.21 with SMTP id f21mr28066573qhe.13.1447031868160;
        Sun, 08 Nov 2015 17:17:48 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j10si9306212qhc.55.2015.11.08.17.17.48
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Sun, 08 Nov 2015 17:17:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:49407 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1Zvb5f-0000kS-RY
	for alex.bennee@linaro.org; Sun, 08 Nov 2015 20:17:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52395)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1Zvb1R-0001M5-H2
	for qemu-devel@nongnu.org; Sun, 08 Nov 2015 20:13:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1Zvb1P-0007yX-Uc
	for qemu-devel@nongnu.org; Sun, 08 Nov 2015 20:13:25 -0500
Received: from mail-qg0-x235.google.com ([2607:f8b0:400d:c04::235]:34142)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>)
	id 1Zvb1P-0007y3-Oz; Sun, 08 Nov 2015 20:13:23 -0500
Received: by qgeb1 with SMTP id b1so79142552qge.1;
	Sun, 08 Nov 2015 17:13:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=nwxOvHgkmar0cINbwT2pQcy0dazWHcIN/VRNmlMmDZQ=;
	b=uivJcFewJMT4g4TTCnmWtWiou5C9umQmakeep0hdCpc59n39PHFRrmsp809LgpGGEo
	b+8QKrGOZ/PnY97tKRzHF5gkac4aGsC3l1kriGVU8JyxH69OIfy/ifEgnPH8DyGSrOZo
	I2LhEIeH6GIF3LIg4xwbIKMJVjS76WSCZxBiJRuLNVH/cbPZ2xSEaRkKwUoqXg+sBJtA
	lFVu+P/ImkTPFjb1SwuvF5LI7StZFlYms2+VdnGpJiBHf/jCJNM62jNGoJqum0qumDXK
	RhWQL9NHUoJ/NnjWLxtORufGnfiCKGm+cEihXYE7PmLvClUpqkaA1bS1ovxdlYtWgpws
	Gatg==
X-Received: by 10.140.145.150 with SMTP id 144mr27817234qhr.82.1447031603398; 
	Sun, 08 Nov 2015 17:13:23 -0800 (PST)
Received: from localhost.localdomain (ool-182df582.dyn.optonline.net.
	[24.45.245.130])
	by smtp.gmail.com with ESMTPSA id g97sm3915552qge.6.2015.11.08.17.13.22
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 08 Nov 2015 17:13:23 -0800 (PST)
From: Michael Davidsaver <mdavidsaver@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun,  8 Nov 2015 20:11:39 -0500
Message-Id: <1447031505-12477-13-git-send-email-mdavidsaver@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1447031505-12477-1-git-send-email-mdavidsaver@gmail.com>
References: <1447031505-12477-1-git-send-email-mdavidsaver@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c04::235
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm@nongnu.org, Michael Davidsaver <mdavidsaver@gmail.com>
Subject: [Qemu-devel] [PATCH 12/18] armv7m: simpler/faster exception start
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
X-TUID: 4JZWeMwuWYtY

No need to bounce through EXCP_IRQ handling
for non-IRQ exceptions.  just update CPU
state directly.

Signed-off-by: Michael Davidsaver <mdavidsaver@gmail.com>
---
 target-arm/helper.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/target-arm/helper.c b/target-arm/helper.c
index 1d7ac43..2541890 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -5433,23 +5433,21 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
 
     /* For exceptions we just mark as pending on the NVIC, and let that
        handle it.  */
-    /* TODO: Need to escalate if the current priority is higher than the
-       one we're raising.  */
     switch (cs->exception_index) {
     case EXCP_UDEF:
         armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE);
-        return;
+        break;
     case EXCP_SWI:
         /* The PC already points to the next instruction.  */
         armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_SVC);
-        return;
+        break;
     case EXCP_PREFETCH_ABORT:
     case EXCP_DATA_ABORT:
         /* TODO: if we implemented the MPU registers, this is where we
          * should set the MMFAR, etc from exception.fsr and exception.vaddress.
          */
         armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_MEM);
-        return;
+        break;
     case EXCP_BKPT:
         if (semihosting_enabled()) {
             int nr;
@@ -5466,7 +5464,6 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
         armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_DEBUG);
         return;
     case EXCP_IRQ:
-        env->v7m.exception = armv7m_nvic_acknowledge_irq(env->nvic);
         break;
     case EXCP_EXCEPTION_EXIT:
         do_v7m_exception_exit(env);
@@ -5476,6 +5473,10 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
         return; /* Never happens.  Keep compiler happy.  */
     }
 
+    armv7m_nvic_acknowledge_irq(env->nvic);
+
+    qemu_log_mask(CPU_LOG_INT, "... as %d\n", env->v7m.exception);
+
     /* Align stack pointer.  */
     /* ??? Should only do this if Configuration Control Register
        STACKALIGN bit is set.  */
-- 
2.1.4

