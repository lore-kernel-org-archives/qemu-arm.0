Received: by 10.223.172.38 with SMTP id v35csp3209529wrc;
        Fri, 22 Sep 2017 07:59:59 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QCjMdLHB+5khr675Lcw7NGZBuR+Zea5bSFHWhsDnnWgSD4qwKovjYcOGmfA5Oqsap7MTWyT
X-Received: by 10.200.39.174 with SMTP id w43mr9230311qtw.154.1506092399453;
        Fri, 22 Sep 2017 07:59:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506092399; cv=none;
        d=google.com; s=arc-20160816;
        b=M0c4txsTFkU6fEGhnBDckoXOqtnGiDTXqIxsz/+LzAQWQE/osbit4oN8oSYtKjUuWv
         TZymQmykAoaL9mgr0Fy8kXuhuY1lnaty9WHqlF9dEouOS9iFcEIp5tGRBpXSj68oNFgg
         rZ7ExkO5YvlFy2hy74KY7aoqfHjMd30j1oUuURX6uFrtDdc0JfklSFymDuoEtXub7ioJ
         uUU7MBmuPoWkr2816EMXXtekOoTszXkwn5QALcp6N0k3YTqxzmTf8e5onmlpgRGgh7Xj
         1OQfbdpw+JR0IjTgZpF770JHKxFHagoEZ91rCbJq8VttIsLggXGxRzv6skBvNnAnlT1n
         cR1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=5rjsnNt1/no6ImERMX7mheTxJaPJRmMoitVrFKz2qfc=;
        b=OLDduTxjboedcd0GFndDYiWc6Z5R7dENQXu0gEGVI6dJ+glTv8G0Q9QwFxb0aEixHp
         HOoREhkf4X5ZyWdi7mE4Pp51pNlyyH7MCd6RgnxMIil/GKEwKbkHCkDf/CTy3b4Jk9iW
         Vjf7MeqiDgZbJOIkQMit4dM64Q9eyWTxMqTpAYUP0lh31TtzIS8BNKkHI9MAF3pbytZH
         PPQ6X7sS4I5k3FtlneqQXpo1tVqWADm1BDjqH5wW2c0PV2vFiBz5nzoCvuMua93ipamA
         o1d7S91jxFrklRKu8EpK6eBZvoVEU4Qbre7dPSpHzGF4lv6OkQcaa8nJSD/Rnv3K7xZw
         3tlQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q24si837qtg.56.2017.09.22.07.59.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Sep 2017 07:59:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59303 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dvPQr-0007zC-4L
	for alex.bennee@linaro.org; Fri, 22 Sep 2017 10:59:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46886)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dvPQW-0007u2-Kg
	for qemu-arm@nongnu.org; Fri, 22 Sep 2017 10:59:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dvPQV-00042d-BU
	for qemu-arm@nongnu.org; Fri, 22 Sep 2017 10:59:36 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37534)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dvPQV-0003yz-4n; Fri, 22 Sep 2017 10:59:35 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dvPQT-00079V-6D; Fri, 22 Sep 2017 15:59:33 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 22 Sep 2017 15:59:52 +0100
Message-Id: <1506092407-26985-6-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1506092407-26985-1-git-send-email-peter.maydell@linaro.org>
References: <1506092407-26985-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 05/20] target/arm: Restore SPSEL to correct
 CONTROL register on exception return
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jZKh+L4dZbdi

On exception return for v8M, the SPSEL bit in the EXC_RETURN magic
value should be restored to the SPSEL bit in the CONTROL register
banked specified by the EXC_RETURN.ES bit.

Add write_v7m_control_spsel_for_secstate() which behaves like
write_v7m_control_spsel() but allows the caller to specify which
CONTROL bank to use, reimplement write_v7m_control_spsel() in
terms of it, and use it in exception return.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 40 +++++++++++++++++++++++++++-------------
 1 file changed, 27 insertions(+), 13 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index a3c63c3..4444d04 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6052,28 +6052,42 @@ static bool v7m_using_psp(CPUARMState *env)
         env->v7m.control[env->v7m.secure] & R_V7M_CONTROL_SPSEL_MASK;
 }
 
-/* Write to v7M CONTROL.SPSEL bit. This may change the current
- * stack pointer between Main and Process stack pointers.
+/* Write to v7M CONTROL.SPSEL bit for the specified security bank.
+ * This may change the current stack pointer between Main and Process
+ * stack pointers if it is done for the CONTROL register for the current
+ * security state.
  */
-static void write_v7m_control_spsel(CPUARMState *env, bool new_spsel)
+static void write_v7m_control_spsel_for_secstate(CPUARMState *env,
+                                                 bool new_spsel,
+                                                 bool secstate)
 {
-    uint32_t tmp;
-    bool new_is_psp, old_is_psp = v7m_using_psp(env);
+    bool old_is_psp = v7m_using_psp(env);
 
-    env->v7m.control[env->v7m.secure] =
-        deposit32(env->v7m.control[env->v7m.secure],
+    env->v7m.control[secstate] =
+        deposit32(env->v7m.control[secstate],
                   R_V7M_CONTROL_SPSEL_SHIFT,
                   R_V7M_CONTROL_SPSEL_LENGTH, new_spsel);
 
-    new_is_psp = v7m_using_psp(env);
+    if (secstate == env->v7m.secure) {
+        bool new_is_psp = v7m_using_psp(env);
+        uint32_t tmp;
 
-    if (old_is_psp != new_is_psp) {
-        tmp = env->v7m.other_sp;
-        env->v7m.other_sp = env->regs[13];
-        env->regs[13] = tmp;
+        if (old_is_psp != new_is_psp) {
+            tmp = env->v7m.other_sp;
+            env->v7m.other_sp = env->regs[13];
+            env->regs[13] = tmp;
+        }
     }
 }
 
+/* Write to v7M CONTROL.SPSEL bit. This may change the current
+ * stack pointer between Main and Process stack pointers.
+ */
+static void write_v7m_control_spsel(CPUARMState *env, bool new_spsel)
+{
+    write_v7m_control_spsel_for_secstate(env, new_spsel, env->v7m.secure);
+}
+
 void write_v7m_exception(CPUARMState *env, uint32_t new_exc)
 {
     /* Write a new value to v7m.exception, thus transitioning into or out
@@ -6369,7 +6383,7 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
      * Handler mode (and will be until we write the new XPSR.Interrupt
      * field) this does not switch around the current stack pointer.
      */
-    write_v7m_control_spsel(env, return_to_sp_process);
+    write_v7m_control_spsel_for_secstate(env, return_to_sp_process, exc_secure);
 
     switch_v7m_security_state(env, return_to_secure);
 
-- 
2.7.4

