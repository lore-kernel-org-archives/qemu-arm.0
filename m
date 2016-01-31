Received: by 10.25.159.19 with SMTP id i19csp1938057lfe;
        Sun, 31 Jan 2016 08:16:12 -0800 (PST)
X-Received: by 10.140.100.229 with SMTP id s92mr22726632qge.19.1454256971969;
        Sun, 31 Jan 2016 08:16:11 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e4si24082273qkj.9.2016.01.31.08.16.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 31 Jan 2016 08:16:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:42257 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aPufb-0004Qa-2H
	for alex.bennee@linaro.org; Sun, 31 Jan 2016 11:16:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59184)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aPufX-0004J3-7R
	for qemu-arm@nongnu.org; Sun, 31 Jan 2016 11:16:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aPufW-0000tI-5D
	for qemu-arm@nongnu.org; Sun, 31 Jan 2016 11:16:07 -0500
Received: from mail-lb0-x241.google.com ([2a00:1450:4010:c04::241]:35922)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>)
	id 1aPufT-0000sQ-Fo; Sun, 31 Jan 2016 11:16:03 -0500
Received: by mail-lb0-x241.google.com with SMTP id zr1so2157192lbb.3;
	Sun, 31 Jan 2016 08:16:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=5xhHKURr+yGDDqw/GKV/MU9MPK1sVT0K07okLp0vjoU=;
	b=Q6Wuw83hmHckgxw3h9+e3SpybheqcXdoRjs59NxAuIHPNjIZ58ZlEKw3t36sr0JwIe
	2KMmumCpm0qipqhA1W+kr/1cg2dWeX8ULfw+CnHyryDBPNnjueeCvrEkfYZujP1Pu5OA
	uZy0QDkQ9eCNDnsrKGoghhRiQ0t4fvIy9IofZ7NLdSTHh0E1Di2J53Py8Fi5jaZMPb8K
	pQfp0XT9/GXMtI35ddej9UQ8yajvmzjY5f9GikrJRAC6X5SufJeAZelI/1jpB0e9QWPL
	AC81sW9JeWuTEy8Net9/gDLUYIbWxmjH3/VehoBoox33VUJ0RVxgiJJM7yah6miTFN5a
	D9ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=5xhHKURr+yGDDqw/GKV/MU9MPK1sVT0K07okLp0vjoU=;
	b=L3wBpnQNH2huH3a+fuEqh/XsQxFXHUkjZYLXAFARR+vvQr0HotcIHY7mzbEO+BmJqx
	P1uAByvF0NUamuKlkh+jQffsgqqBtJpSGSE73pnpBGGANsAboelupyl/NUcp6YTdD6ZD
	2PUannMPZM9W6GvqkD86u/lHCQtYGTqhDmmupD25oKpFfA2K/H8qi+qWfCmqtjNVaCf+
	BE2Fyab2SEocVIAjL7fn/fDTEYioI3TZl97SYLu6faIvL23perv0tfL58iZaupe8eQfb
	0ZTZogMBQB4PAIly+q/ArPQep5hjyFwfJblyIOwMBEgH7yTSiSvXfgFKpcwMz0aBZu0B
	8ndQ==
X-Gm-Message-State: AG10YOQuvmUf6am1DYxZrFsFY1E5pVRjhaHVYpkj54sc316eGFX5f6pO+CchGNaKp6PmFA==
X-Received: by 10.112.158.9 with SMTP id wq9mr6790095lbb.93.1454256962792;
	Sun, 31 Jan 2016 08:16:02 -0800 (PST)
Received: from sfedorov-laptop.Dlink (broadband-46-188-121-154.2com.net.
	[46.188.121.154]) by smtp.gmail.com with ESMTPSA id
	zu7sm3418454lbb.36.2016.01.31.08.16.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 31 Jan 2016 08:16:01 -0800 (PST)
From: Sergey Fedorov <serge.fdrv@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Sun, 31 Jan 2016 19:15:48 +0300
Message-Id: <1454256948-10485-3-git-send-email-serge.fdrv@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1454256948-10485-1-git-send-email-serge.fdrv@gmail.com>
References: <1454256948-10485-1-git-send-email-serge.fdrv@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c04::241
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Richard Henderson <rth@twiddle.net>
Subject: [Qemu-arm] [PATCH v3 2/2] target-arm: Implement checking of fired
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
X-TUID: Slz4nQ0a2LWi

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
index d226bbe..16d9487 100644
--- a/target-arm/internals.h
+++ b/target-arm/internals.h
@@ -409,6 +409,9 @@ void hw_breakpoint_update(ARMCPU *cpu, int n);
  */
 void hw_breakpoint_update_all(ARMCPU *cpu);
 
+/* Callback function for checking if a watchpoint should trigger. */
+bool arm_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp);
+
 /* Callback function for when a watchpoint or breakpoint triggers. */
 void arm_debug_excp_handler(CPUState *cs);
 
diff --git a/target-arm/op_helper.c b/target-arm/op_helper.c
index a5ee65f..4adf9cc 100644
--- a/target-arm/op_helper.c
+++ b/target-arm/op_helper.c
@@ -975,6 +975,16 @@ void HELPER(check_breakpoints)(CPUARMState *env)
     }
 }
 
+bool arm_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp)
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

