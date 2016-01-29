Received: by 10.25.159.19 with SMTP id i19csp1121009lfe;
        Fri, 29 Jan 2016 11:19:05 -0800 (PST)
X-Received: by 10.55.76.73 with SMTP id z70mr12655256qka.105.1454095145670;
        Fri, 29 Jan 2016 11:19:05 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d63si19078098qga.118.2016.01.29.11.19.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Jan 2016 11:19:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:36258 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aPEZU-0004gX-Tg
	for alex.bennee@linaro.org; Fri, 29 Jan 2016 14:19:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49474)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aPEYh-0003Fk-Iz
	for qemu-arm@nongnu.org; Fri, 29 Jan 2016 14:18:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aPEYg-0005FH-H9
	for qemu-arm@nongnu.org; Fri, 29 Jan 2016 14:18:15 -0500
Received: from mail-lb0-x242.google.com ([2a00:1450:4010:c04::242]:33863)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>)
	id 1aPEYb-0005Aw-0K; Fri, 29 Jan 2016 14:18:09 -0500
Received: by mail-lb0-x242.google.com with SMTP id oe3so3767320lbb.1;
	Fri, 29 Jan 2016 11:18:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ZyhDroCn4qs1hibz4biKvrHU8hEOKlVeHpnRzN3vN9Q=;
	b=jnnFd0cE9nHBEMxn4qsdKL3F9tOT6IkaD6R4mBH/SPpNJ3flp+zoH/2+MaAas6TlT/
	jGshy4BmNgdbLargs2hz273v5zM0nSl10xH2Ad3GUyhYLY5+/Z+z6rGxOdl6lUzIZOPT
	hlHp+TAtpPFksnSNQmyTTFxhDuGY7bV/tF5erUsG0mmcEyLZOcRQg8EaQ+FTHtBOENAx
	FwSpaOzx1tvs3IwGdSNYhvBTYcHNRPblUiArMpgpwv69X9Sc+Q/XiebmBdfLUqDr+QTL
	RuIFD0WNB68rhRnqRJwYrkErQtHI6OrtOlkAMKtqle0+3Wj0T42gqrKfu73LW/+e2+7R
	cXzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ZyhDroCn4qs1hibz4biKvrHU8hEOKlVeHpnRzN3vN9Q=;
	b=IKUFrT6iVSXI9agxsp5/Umvw8aoCId8SJxr32c2uiF7Sjxq7GOXUytbgeylCYiyW4+
	DgIADglQXFZeqDaTIVmzHKoVycvTSjbf6r3f3VrFBdQN9L9PFXTj3RRNuQeSWX3SDKRj
	CAo8Msh0jFCNabFn2FTMwMpw+xWdhNNEDdZObVSkH0leJ2COpaooFzsY35WWP5UxrmIo
	JmOv4jOY5llcAs3twF6AYZfwRxeOgbMui+tLhAgVOV+Zay0QT++m5Pm1LxkbGDi9lZE+
	Jev+bC9s33gYQUfVGqwpAz0KJ94E+PIJQkw3DP9aYFV/DTq62KxJ02qr4tFQq/hkNLNu
	1ccw==
X-Gm-Message-State: AG10YOR56cxRjAqRpLZxLCS4IVwWUtu60WnF9BAnuj3NzfyLcyQlYnvV1w+a5givHR7dgg==
X-Received: by 10.112.144.38 with SMTP id sj6mr3980301lbb.104.1454095088307;
	Fri, 29 Jan 2016 11:18:08 -0800 (PST)
Received: from sfedorov-laptop.smware.local ([213.243.91.10])
	by smtp.gmail.com with ESMTPSA id
	i192sm2270550lfb.14.2016.01.29.11.18.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 Jan 2016 11:18:07 -0800 (PST)
From: Sergey Fedorov <serge.fdrv@gmail.com>
To: qemu-devel@nongnu.org
Date: Fri, 29 Jan 2016 22:17:32 +0300
Message-Id: <1454095052-17149-3-git-send-email-serge.fdrv@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1454095052-17149-1-git-send-email-serge.fdrv@gmail.com>
References: <1454095052-17149-1-git-send-email-serge.fdrv@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c04::242
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Richard Henderson <rth@twiddle.net>
Subject: [Qemu-arm] [PATCH v2 2/2] target-arm: Implement checking of fired
	watchpoint
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: unXhwzg1T3JH

ARM stops before access to a location covered by watchpoint. Also, QEMU
watchpoint fire is not necessarily an architectural watchpoint match.
Unfortunately, that is hardly possible to ignore a fired watchpoint in
debug exception handler. So move watchpoint check from debug exception
handler to the dedicated watchpoint checking callback.

Signed-off-by: Sergey Fedorov <serge.fdrv@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 target-arm/cpu.c       |  1 +
 target-arm/internals.h |  3 +++
 target-arm/op_helper.c | 35 +++++++++++++++++++++--------------
 3 files changed, 25 insertions(+), 14 deletions(-)

diff --git a/target-arm/cpu.c b/target-arm/cpu.c
index 0e582c4..21ec18e 100644
--- a/target-arm/cpu.c
+++ b/target-arm/cpu.c
@@ -1474,6 +1474,7 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_arch_name = arm_gdb_arch_name;
     cc->gdb_stop_before_watchpoint = true;
     cc->debug_excp_handler = arm_debug_excp_handler;
+    cc->debug_check_watchpoint = arm_debug_check_watchpoint;
 
     cc->disas_set_info = arm_disas_set_info;
 
diff --git a/target-arm/internals.h b/target-arm/internals.h
index d226bbe..7e67eaa 100644
--- a/target-arm/internals.h
+++ b/target-arm/internals.h
@@ -409,6 +409,9 @@ void hw_breakpoint_update(ARMCPU *cpu, int n);
  */
 void hw_breakpoint_update_all(ARMCPU *cpu);
 
+/* Callback function for checking if a watchpoint should trigger. */
+bool arm_debug_check_watchpoint(CPUState *cs);
+
 /* Callback function for when a watchpoint or breakpoint triggers. */
 void arm_debug_excp_handler(CPUState *cs);
 
diff --git a/target-arm/op_helper.c b/target-arm/op_helper.c
index a5ee65f..859691a 100644
--- a/target-arm/op_helper.c
+++ b/target-arm/op_helper.c
@@ -975,6 +975,16 @@ void HELPER(check_breakpoints)(CPUARMState *env)
     }
 }
 
+bool arm_debug_check_watchpoint(CPUState *cs)
+{
+    /* Called by core code when a CPU watchpoint fires; need to check if this
+     * is also an architectural watchpoint match.
+     */
+    ARMCPU *cpu = ARM_CPU(cs);
+
+    return check_watchpoints(cpu);
+}
+
 void arm_debug_excp_handler(CPUState *cs)
 {
     /* Called by core code when a watchpoint or breakpoint fires;
@@ -986,23 +996,20 @@ void arm_debug_excp_handler(CPUState *cs)
 
     if (wp_hit) {
         if (wp_hit->flags & BP_CPU) {
+            bool wnr = (wp_hit->flags & BP_WATCHPOINT_HIT_WRITE) != 0;
+            bool same_el = arm_debug_target_el(env) == arm_current_el(env);
+
             cs->watchpoint_hit = NULL;
-            if (check_watchpoints(cpu)) {
-                bool wnr = (wp_hit->flags & BP_WATCHPOINT_HIT_WRITE) != 0;
-                bool same_el = arm_debug_target_el(env) == arm_current_el(env);
-
-                if (extended_addresses_enabled(env)) {
-                    env->exception.fsr = (1 << 9) | 0x22;
-                } else {
-                    env->exception.fsr = 0x2;
-                }
-                env->exception.vaddress = wp_hit->hitaddr;
-                raise_exception(env, EXCP_DATA_ABORT,
-                                syn_watchpoint(same_el, 0, wnr),
-                                arm_debug_target_el(env));
+
+            if (extended_addresses_enabled(env)) {
+                env->exception.fsr = (1 << 9) | 0x22;
             } else {
-                cpu_resume_from_signal(cs, NULL);
+                env->exception.fsr = 0x2;
             }
+            env->exception.vaddress = wp_hit->hitaddr;
+            raise_exception(env, EXCP_DATA_ABORT,
+                    syn_watchpoint(same_el, 0, wnr),
+                    arm_debug_target_el(env));
         }
     } else {
         uint64_t pc = is_a64(env) ? env->pc : env->regs[15];
-- 
1.9.1

