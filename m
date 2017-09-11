Received: by 10.223.172.38 with SMTP id v35csp5559760wrc;
        Mon, 11 Sep 2017 06:52:05 -0700 (PDT)
X-Google-Smtp-Source: ADKCNb4ohEH2Guyeb/HJ8fGv0vnlEiJJbKaMZy1uchYkuUOIse0MCoGdkdS6NHGCfzxrLJXuWG/E
X-Received: by 10.55.78.144 with SMTP id c138mr5291383qkb.67.1505137925655;
        Mon, 11 Sep 2017 06:52:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505137925; cv=none;
        d=google.com; s=arc-20160816;
        b=N3BxXR5UMnTJOM4IAvxseZ3JfoXIYv+0erenADzRZjlHslwpsUN+Od64ZpPVdcoryV
         BDgSaMnxYqZu74OW8PXJPdYMDu3MvYAFDptg+wy3XQWXEBB3jXbOlYLT8FYCckozlRuo
         fzR7md2a2jKWTnEHU9OMZ7bgqWOz7NXcfqLWV3sArEOMlZPUzyQcamCyxm42TwLc6lCq
         2nXTjSH6dj1DeMUwvzT19bf/nKy5648B21fY2KkxiSEiegPr51WymGTKqCooMfQ0lw64
         D2WqBj+z8LqxSglDtu2aYPkpwOLvqeghy7DmAUFfNe+g082EvXWWGgUBdW5zRzLg7TCP
         Of+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=6k5j7bPh2UtJioHBiuqMq6WxLOlMKo58G366QlD0APk=;
        b=hCfVSbSzz1CYY59jF/InQH4N8gzsC+CC08m6JBIakPtymDG0pLgtlcr5+SSaC3d2Wl
         Xzj/Jl1DL5jzz91LLNylHgH8t45rJAwr8b2QP7D5SLAarBXJ4tRsowFqZESK8AMOz+/K
         XtvAb9Tm8LvuHQSinD8P0Hm1H5Ltmbb59t+6Qq/fUOqUaTj+sVw8YMzaOHA+af677xeA
         STbH6C1Ti79smyHcm2iLeaWOW8s1BgloK/N9Fj3ZF1jcUsSISDjDAEStCmwpeGTFNVLH
         yhMe9tfCsQZ777o3hp25fgEZQwiFWMIZ/1x747EANKfYdhzTHghaMSv2rS3f09H5imKR
         YLLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u11si9031626qka.403.2017.09.11.06.52.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Sep 2017 06:52:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57899 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1drP87-0001e8-7n
	for alex.bennee@linaro.org; Mon, 11 Sep 2017 09:52:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41613)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1drP82-0001ch-5N
	for qemu-arm@nongnu.org; Mon, 11 Sep 2017 09:51:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1drP81-00029y-8R
	for qemu-arm@nongnu.org; Mon, 11 Sep 2017 09:51:58 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37238)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1drP81-00023m-0r; Mon, 11 Sep 2017 09:51:57 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1drP7t-0007nI-Lz; Mon, 11 Sep 2017 14:51:49 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 11 Sep 2017 14:52:10 +0100
Message-Id: <1505137930-13255-8-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1505137930-13255-1-git-send-email-peter.maydell@linaro.org>
References: <1505137930-13255-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 7/7] target/arm: Rename 'type' to 'excret' in
 do_v7m_exception_exit()
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
X-TUID: t7wtOlYauk8U

In the v7M and v8M ARM ARM, the magic exception return values are
referred to as EXC_RETURN values, and in QEMU we use V7M_EXCRET_*
constants to define bits within them. Rename the 'type' variable
which holds the exception return value in do_v7m_exception_exit()
to excret, making it clearer that it does hold an EXC_RETURN value.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index a502e4e..4f41841 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6212,7 +6212,7 @@ static void v7m_push_stack(ARMCPU *cpu)
 static void do_v7m_exception_exit(ARMCPU *cpu)
 {
     CPUARMState *env = &cpu->env;
-    uint32_t type;
+    uint32_t excret;
     uint32_t xpsr;
     bool ufault = false;
     bool return_to_sp_process = false;
@@ -6233,18 +6233,19 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
      * the target value up between env->regs[15] and env->thumb in
      * gen_bx(). Reconstitute it.
      */
-    type = env->regs[15];
+    excret = env->regs[15];
     if (env->thumb) {
-        type |= 1;
+        excret |= 1;
     }
 
     qemu_log_mask(CPU_LOG_INT, "Exception return: magic PC %" PRIx32
                   " previous exception %d\n",
-                  type, env->v7m.exception);
+                  excret, env->v7m.exception);
 
-    if ((type & R_V7M_EXCRET_RES1_MASK) != R_V7M_EXCRET_RES1_MASK) {
+    if ((excret & R_V7M_EXCRET_RES1_MASK) != R_V7M_EXCRET_RES1_MASK) {
         qemu_log_mask(LOG_GUEST_ERROR, "M profile: zero high bits in exception "
-                      "exit PC value 0x%" PRIx32 " are UNPREDICTABLE\n", type);
+                      "exit PC value 0x%" PRIx32 " are UNPREDICTABLE\n",
+                      excret);
     }
 
     if (env->v7m.exception != ARMV7M_EXCP_NMI) {
@@ -6255,7 +6256,7 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
          * which security state's faultmask to clear. (v8M ARM ARM R_KBNF.)
          */
         if (arm_feature(env, ARM_FEATURE_M_SECURITY)) {
-            int es = type & R_V7M_EXCRET_ES_MASK;
+            int es = excret & R_V7M_EXCRET_ES_MASK;
             if (armv7m_nvic_raw_execution_priority(env->nvic) >= 0) {
                 env->v7m.faultmask[es] = 0;
             }
@@ -6283,7 +6284,7 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
         g_assert_not_reached();
     }
 
-    switch (type & 0xf) {
+    switch (excret & 0xf) {
     case 1: /* Return to Handler */
         return_to_handler = true;
         break;
@@ -6306,7 +6307,7 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
          */
         env->v7m.cfsr[env->v7m.secure] |= R_V7M_CFSR_INVPC_MASK;
         armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE);
-        v7m_exception_taken(cpu, type);
+        v7m_exception_taken(cpu, excret);
         qemu_log_mask(CPU_LOG_INT, "...taking UsageFault on existing "
                       "stackframe: failed exception return integrity check\n");
         return;
@@ -6341,14 +6342,14 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
 
     /* The restored xPSR exception field will be zero if we're
      * resuming in Thread mode. If that doesn't match what the
-     * exception return type specified then this is a UsageFault.
+     * exception return excret specified then this is a UsageFault.
      */
     if (return_to_handler != arm_v7m_is_handler_mode(env)) {
         /* Take an INVPC UsageFault by pushing the stack again. */
         armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE);
         env->v7m.cfsr[env->v7m.secure] |= R_V7M_CFSR_INVPC_MASK;
         v7m_push_stack(cpu);
-        v7m_exception_taken(cpu, type);
+        v7m_exception_taken(cpu, excret);
         qemu_log_mask(CPU_LOG_INT, "...taking UsageFault on new stackframe: "
                       "failed exception return integrity check\n");
         return;
-- 
2.7.4

