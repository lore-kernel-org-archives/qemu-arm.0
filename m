Received: by 10.223.150.237 with SMTP id u100csp130097wrb;
        Tue, 7 Nov 2017 07:01:21 -0800 (PST)
X-Google-Smtp-Source: ABhQp+RDZpcpqNvwFMyduZ1T2DCRVRXc9P6kinFAN+X9Mxn+w26Sn3yimr9kgOMSAE+e9hek7DQy
X-Received: by 10.37.175.6 with SMTP id a6mr7566201ybh.334.1510066881769;
        Tue, 07 Nov 2017 07:01:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510066881; cv=none;
        d=google.com; s=arc-20160816;
        b=W3bpq58w7VAMlzeSbWPvVJuWdpFLpGOTqkJO+tVGvS97b5fKUcyu0Y1zw9kobJ/6eb
         t9OiAW2b5IH32lthC0F4zqRpJq3GRlc7DP8mziXqEbXnE5S8XsC4b7aZ1afnl8S48zzd
         rANo33MLFpSCtnaYP5NcFDIkQNbexz/DG6juVXQxxXYK6UGaCnVLSy0PRm2TBhw3Oe6Z
         2+rexPyQP1U8Ods5QsqCOwOi8ifLKDh1ZRXrn0/2JA1kWIZaav8BFgkFxEC5j+Dny8f1
         LKEKSVDwJjRaPNlt0UH8U3EXD+EKzj4PmmVEwSNQTG5WJE9CVfWP8KEwYwPjdXmCqmeV
         apwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=HGquXareDZFji+QC1Q4/ffzK3e5pbgCXbUZroBJiAXw=;
        b=Herabfyi6/WrKalr+OhtSBQc0HHeRzJyf7G6Pyqx0bPuEBluY/Ufv7ncXgeMONZsDF
         ViSArNmL6AtN+o4QTbAYy/NQwOiX7juRac5obZ3BExvRQXrT96+TCTATwZya8wsq/mqL
         c8wCHBhmUdeXndxH9StFMycCchAhHTm+PM3+Aek6b//oOjR+/QENbOyyZU81FhlIg7no
         ofPzF1VWrM88zBcyA+3/3dTxxD3aJlKkcDGj3UVuJzV/7rwbcNa6K9K8ZU6JvQbnVkUy
         Gsa/BNpubJuNcV15e9J4t7hAkZsborBoG8O1TgQzI8nRw+EB2SZ/pdXtC+9jJAnVtwJ0
         +WvA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f12si306623ybh.717.2017.11.07.07.01.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Nov 2017 07:01:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53824 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eC5NR-0004Ny-5F
	for alex.bennee@linaro.org; Tue, 07 Nov 2017 10:01:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33307)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eC5NI-0004Nq-51
	for qemu-arm@nongnu.org; Tue, 07 Nov 2017 10:01:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eC5NC-0005DP-Ed
	for qemu-arm@nongnu.org; Tue, 07 Nov 2017 10:01:12 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:38244)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1eC5NC-0005C5-6J; Tue, 07 Nov 2017 10:01:06 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1eC5N9-0004fo-ME; Tue, 07 Nov 2017 15:01:03 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue,  7 Nov 2017 15:01:38 +0000
Message-Id: <1510066898-3725-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH for-2.11] target/arm: Report GICv3 sysregs
 present in ID registers if needed
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: m4XDQ3AuD3gm

The CPU ID registers ID_AA64PFR0_EL1, ID_PFR1_EL1 and ID_PFR1
have a field for reporting presence of GICv3 system registers.
We need to report this field correctly in order for Xen to
work as a guest inside QEMU emulation. We mustn't incorrectly
claim the sysregs exist when they don't, though, or Linux will
crash.

Unfortunately the way we've designed the GICv3 emulation in QEMU
puts the system registers as part of the GICv3 device, which
may be created after the CPU proper has been realized. This
means that we don't know at the point when we define the ID
registers what the correct value is. Handle this by switching
them to calling a function at runtime to read the value, where
we can fill in the GIC field appropriately.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
In retrospect I think having the sysregs emulation in the
GIC device was a bit of a design error -- we should have
split it like the hardware does, with a defined protocol
between the GIC and the CPU interface. (In real hardware the
CPU can have the GIC system registers even though it's not
connected to an actual GICv3, and we don't/can't emulate
that with our current design.)
---
 target/arm/helper.c | 44 ++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 40 insertions(+), 4 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index f61fb3e..35c5bd6 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4549,6 +4549,33 @@ static void define_debug_regs(ARMCPU *cpu)
     }
 }
 
+/* We don't know until after realize whether there's a GICv3
+ * attached, and that is what registers the gicv3 sysregs.
+ * So we have to fill in the GIC fields in ID_PFR/ID_PFR1_EL1/ID_AA64PFR0_EL1
+ * at runtime.
+ */
+static uint64_t id_pfr1_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    ARMCPU *cpu = arm_env_get_cpu(env);
+    uint64_t pfr1 = cpu->id_pfr1;
+
+    if (env->gicv3state) {
+        pfr1 |= 1 << 28;
+    }
+    return pfr1;
+}
+
+static uint64_t id_aa64pfr0_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    ARMCPU *cpu = arm_env_get_cpu(env);
+    uint64_t pfr0 = cpu->id_aa64pfr0;
+
+    if (env->gicv3state) {
+        pfr0 |= 1 << 24;
+    }
+    return pfr0;
+}
+
 void register_cp_regs_for_features(ARMCPU *cpu)
 {
     /* Register all the coprocessor registers based on feature bits */
@@ -4573,10 +4600,14 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 1, .opc2 = 0,
               .access = PL1_R, .type = ARM_CP_CONST,
               .resetvalue = cpu->id_pfr0 },
+            /* ID_PFR1 is not a plain ARM_CP_CONST because we don't know
+             * the value of the GIC field until after we define these regs.
+             */
             { .name = "ID_PFR1", .state = ARM_CP_STATE_BOTH,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 1, .opc2 = 1,
-              .access = PL1_R, .type = ARM_CP_CONST,
-              .resetvalue = cpu->id_pfr1 },
+              .access = PL1_R, .type = ARM_CP_NO_RAW,
+              .readfn = id_pfr1_read,
+              .writefn = arm_cp_write_ignore },
             { .name = "ID_DFR0", .state = ARM_CP_STATE_BOTH,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 1, .opc2 = 2,
               .access = PL1_R, .type = ARM_CP_CONST,
@@ -4692,10 +4723,15 @@ void register_cp_regs_for_features(ARMCPU *cpu)
          * define new registers here.
          */
         ARMCPRegInfo v8_idregs[] = {
+            /* ID_AA64PFR0_EL1 is not a plain ARM_CP_CONST because we don't
+             * know the right value for the GIC field until after we
+             * define these regs.
+             */
             { .name = "ID_AA64PFR0_EL1", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 4, .opc2 = 0,
-              .access = PL1_R, .type = ARM_CP_CONST,
-              .resetvalue = cpu->id_aa64pfr0 },
+              .access = PL1_R, .type = ARM_CP_NO_RAW,
+              .readfn = id_aa64pfr0_read,
+              .writefn = arm_cp_write_ignore },
             { .name = "ID_AA64PFR1_EL1", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 4, .opc2 = 1,
               .access = PL1_R, .type = ARM_CP_CONST,
-- 
2.7.4

