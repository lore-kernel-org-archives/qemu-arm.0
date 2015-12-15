Received: by 10.182.158.201 with SMTP id ww9csp2759592obb;
        Tue, 15 Dec 2015 14:54:51 -0800 (PST)
X-Received: by 10.140.132.72 with SMTP id 69mr47996221qhe.17.1450220091380;
        Tue, 15 Dec 2015 14:54:51 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u32si3349073qgu.71.2015.12.15.14.54.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 15 Dec 2015 14:54:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39454 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a8yUd-0001Yk-3w
	for alex.bennee@linaro.org; Tue, 15 Dec 2015 17:54:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57937)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1a8yRp-0004rT-Tu
	for qemu-arm@nongnu.org; Tue, 15 Dec 2015 17:51:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1a8yRp-0001cu-3L
	for qemu-arm@nongnu.org; Tue, 15 Dec 2015 17:51:57 -0500
Received: from mx1.redhat.com ([209.132.183.28]:53183)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1a8yRo-0001cn-Ug; Tue, 15 Dec 2015 17:51:57 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 805908E221;
	Tue, 15 Dec 2015 22:51:56 +0000 (UTC)
Received: from hawk.localdomain.com (ovpn-204-26.brq.redhat.com [10.40.204.26])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tBFMpNh6024186; Tue, 15 Dec 2015 17:51:51 -0500
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 15 Dec 2015 16:51:14 -0600
Message-Id: <1450219878-5293-6-git-send-email-drjones@redhat.com>
In-Reply-To: <1450219878-5293-1-git-send-email-drjones@redhat.com>
References: <1450219878-5293-1-git-send-email-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, agraf@suse.de, armbru@redhat.com,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org, eblake@redhat.com,
	afaerber@suse.de, rth@twiddle.net
Subject: [Qemu-arm] [PATCH v3 5/9] target-arm: introduce aarch64_compat_sp
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
X-TUID: L50So9KC8Zr2

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 target-arm/cpu.h | 45 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/target-arm/cpu.h b/target-arm/cpu.h
index 815fef8a30663..9231a9ff3b9c2 100644
--- a/target-arm/cpu.h
+++ b/target-arm/cpu.h
@@ -863,6 +863,51 @@ enum arm_cpu_mode {
 #define ARM_IWMMXT_wCGR2	10
 #define ARM_IWMMXT_wCGR3	11
 
+/* AArch64 to AArch32 register mappings */
+#define compat_fp_usr   xregs[11]
+#define compat_sp_usr   xregs[13]
+#define compat_lr_usr   xregs[14]
+#define compat_sp_hyp   xregs[15]
+#define compat_lr_irq   xregs[16]
+#define compat_sp_irq   xregs[17]
+#define compat_lr_svc   xregs[18]
+#define compat_sp_svc   xregs[19]
+#define compat_lr_abt   xregs[20]
+#define compat_sp_abt   xregs[21]
+#define compat_lr_und   xregs[22]
+#define compat_sp_und   xregs[23]
+#define compat_r8_fiq   xregs[24]
+#define compat_r9_fiq   xregs[25]
+#define compat_r10_fiq  xregs[26]
+#define compat_r11_fiq  xregs[27]
+#define compat_r12_fiq  xregs[28]
+#define compat_sp_fiq   xregs[29]
+#define compat_lr_fiq   xregs[30]
+
+static inline uint64_t aarch64_compat_sp(CPUARMState *env)
+{
+    uint32_t mode = env->uncached_cpsr & CPSR_M;
+
+    switch (mode) {
+    case ARM_CPU_MODE_USR:
+    case ARM_CPU_MODE_SYS:
+        return env->compat_sp_usr;
+    case ARM_CPU_MODE_FIQ:
+        return env->compat_sp_fiq;
+    case ARM_CPU_MODE_IRQ:
+        return env->compat_sp_irq;
+    case ARM_CPU_MODE_SVC:
+        return env->compat_sp_svc;
+    case ARM_CPU_MODE_ABT:
+        return env->compat_sp_abt;
+    case ARM_CPU_MODE_HYP:
+        return env->compat_sp_hyp;
+    case ARM_CPU_MODE_UND:
+        return env->compat_sp_und;
+    }
+    g_assert_not_reached();
+}
+
 /* If adding a feature bit which corresponds to a Linux ELF
  * HWCAP bit, remember to update the feature-bit-to-hwcap
  * mapping in linux-user/elfload.c:get_elf_hwcap().
-- 
2.4.3

