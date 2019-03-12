Received: by 2002:adf:fd4f:0:0:0:0:0 with SMTP id h15csp348069wrs;
        Tue, 12 Mar 2019 04:06:46 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx9t9nscQaaMzNcR/43pJntBOyNFNrK68bX8kMzdFw1eQxJ5p+HtgKhQ6jqJiQ++CVeOK9+
X-Received: by 2002:a81:3989:: with SMTP id g131mr28765821ywa.475.1552388806102;
        Tue, 12 Mar 2019 04:06:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552388806; cv=none;
        d=google.com; s=arc-20160816;
        b=dw50ZO3tSyuGFxv2Dl2q1WyAg/HJM6SiQ/XTUOFLRuqgWENJ9PiCaJaAUwT0RQGACE
         Ie18M3syqplydTyFHX/zUzSBcKW5X7XshoCyyspWeCQSMdVIeRQtTuROCs5LEZ9xrCZR
         yHtGCGPBclVlRUIOcF7w6UfDk1Pv/R2ArnNy4BtcMrwZ6gOxpT0HbX+sgUz0YIz34x/m
         HpEVQHXwGGizfmyOuA5vAzSMn/w42BCx1PCLxvQIz4kPPfvT7MU3lVpwqo7tKpuQUF7L
         Wx8qbOBo0Cde8cH2F+HXKcqjNq0aXLEr5XOtAPJCjLhnF6BhgaUxYDpLFQAioPIQlLCp
         YroA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:message-id
         :date:to:from;
        bh=79SbhfXIdAJR0zfQwvtRUzG41Pazrqq1mzzx7O2/SN4=;
        b=IFtJ+xEbD6tJ1xIciou/V2GY+X5qXM0shT05fg0WKHXlaO0HMDu2HeYumlwKBJvp3N
         EQedhxlZRkX3i04742m9CHF2vnx9XSjmEM26OPJrGgPyLxyqtND1YCwyB80YOYHn4pio
         6P3yizA4Y9nLQJbVPQeVV7328UYFjOSa1eqSGW3dJtoMRVRTThMSVtrr2RH9H1QM1kaE
         NCEjD/I2nIjU5Enw+Dkf5RvltCCQsBTQMwFhGxBOc2vYtrYL8nxMDH2vwdOy41cUV4DF
         IK1sre+uBLAvkC9E5L64lAbLFAeL8Ab+PFaI5DCML3sOZwm0lCXSYTO0iKE/RNhbc51c
         oKaA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 133si4503430ybw.250.2019.03.12.04.06.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Mar 2019 04:06:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:49887 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h3fF7-0002ZX-DO
	for alex.bennee@linaro.org; Tue, 12 Mar 2019 07:06:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44663)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1h3egJ-0007nh-4M
	for qemu-arm@nongnu.org; Tue, 12 Mar 2019 06:30:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1h3egH-0008H3-Lk
	for qemu-arm@nongnu.org; Tue, 12 Mar 2019 06:30:47 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2249 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <gengdongjiu@huawei.com>)
	id 1h3egH-0008E4-0a; Tue, 12 Mar 2019 06:30:45 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id DAF3730EDDBBAD0A7F5C;
	Tue, 12 Mar 2019 18:30:34 +0800 (CST)
Received: from localhost.localdomain (10.143.28.91) by
	DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server
	id 14.3.408.0; Tue, 12 Mar 2019 18:30:24 +0800
From: gengdongjiu <gengdongjiu@huawei.com>
To: <peter.maydell@linaro.org>, <qemu-arm@nongnu.org>,
	<qemu-devel@nongnu.org>, <gengdongjiu@huawei.com>
Date: Tue, 12 Mar 2019 18:30:24 +0800
Message-ID: <1552386624-10484-1-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.143.28.91]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.191
Subject: [Qemu-arm] [PATCH V2] target/arm: change arch timer registers
 access permission
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: a2mzp20bk1sU

From: Dongjiu Geng <gengdongjiu@huawei.com>

Some generic arch timer registers are Config-RW in the EL0,
which means the EL0 exception level can have write permission
if it is appropriately configured.

When VM access registers, it firstly checks whether they have RW
permission, then check whether it is appropriately configured.
If they are defined to Ready only in EL0, even though they have been
appropriately configured, they still do not have write permission.
So need to add the write permission according to ARMV8 spec when
define it.

Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
---
When VM kernel or Hypervisor configures the timer registers to RW in EL0
user space, it will still have below panic when EL0 user space access
the timer registers.

[INFO ]@(el0_sync:60): UNIMPLEMENTED, esr=2000000
[INFO ]@(unimpl_exception:88): KERNEL UNIMPLEMENTED EXCEPTION
[INFO ]@(unimpl_exception:98): FAR=0000000000000000, ESR=02000000 (EC=0x0, IL=0x1, ISS=0x0)
[INFO ]@(dump_registers:64): KERNEL REGISTERS
[INFO ]@(dump_registers:68): X0=00000000f52b7d50 X1=00000000040d5040
[INFO ]@(dump_registers:68): X2=0000004000033e10 X3=0000000000000000
[INFO ]@(dump_registers:68): X4=000000007fffffff X5=0000000000000020
[INFO ]@(dump_registers:68): X6=0000000000000020 X7=000000000c00b030
---
 target/arm/helper.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 2607d39..c8d3c21 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -2665,7 +2665,7 @@ static const ARMCPRegInfo generic_timer_cp_reginfo[] = {
     /* per-timer control */
     { .name = "CNTP_CTL", .cp = 15, .crn = 14, .crm = 2, .opc1 = 0, .opc2 = 1,
       .secure = ARM_CP_SECSTATE_NS,
-      .type = ARM_CP_IO | ARM_CP_ALIAS, .access = PL1_RW | PL0_R,
+      .type = ARM_CP_IO | ARM_CP_ALIAS, .access = PL0_RW,
       .accessfn = gt_ptimer_access,
       .fieldoffset = offsetoflow32(CPUARMState,
                                    cp15.c14_timer[GTIMER_PHYS].ctl),
@@ -2674,7 +2674,7 @@ static const ARMCPRegInfo generic_timer_cp_reginfo[] = {
     { .name = "CNTP_CTL_S",
       .cp = 15, .crn = 14, .crm = 2, .opc1 = 0, .opc2 = 1,
       .secure = ARM_CP_SECSTATE_S,
-      .type = ARM_CP_IO | ARM_CP_ALIAS, .access = PL1_RW | PL0_R,
+      .type = ARM_CP_IO | ARM_CP_ALIAS, .access = PL0_RW,
       .accessfn = gt_ptimer_access,
       .fieldoffset = offsetoflow32(CPUARMState,
                                    cp15.c14_timer[GTIMER_SEC].ctl),
@@ -2682,14 +2682,14 @@ static const ARMCPRegInfo generic_timer_cp_reginfo[] = {
     },
     { .name = "CNTP_CTL_EL0", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 3, .crn = 14, .crm = 2, .opc2 = 1,
-      .type = ARM_CP_IO, .access = PL1_RW | PL0_R,
+      .type = ARM_CP_IO, .access = PL0_RW,
       .accessfn = gt_ptimer_access,
       .fieldoffset = offsetof(CPUARMState, cp15.c14_timer[GTIMER_PHYS].ctl),
       .resetvalue = 0,
       .writefn = gt_phys_ctl_write, .raw_writefn = raw_write,
     },
     { .name = "CNTV_CTL", .cp = 15, .crn = 14, .crm = 3, .opc1 = 0, .opc2 = 1,
-      .type = ARM_CP_IO | ARM_CP_ALIAS, .access = PL1_RW | PL0_R,
+      .type = ARM_CP_IO | ARM_CP_ALIAS, .access = PL0_RW,
       .accessfn = gt_vtimer_access,
       .fieldoffset = offsetoflow32(CPUARMState,
                                    cp15.c14_timer[GTIMER_VIRT].ctl),
@@ -2697,7 +2697,7 @@ static const ARMCPRegInfo generic_timer_cp_reginfo[] = {
     },
     { .name = "CNTV_CTL_EL0", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 3, .crn = 14, .crm = 3, .opc2 = 1,
-      .type = ARM_CP_IO, .access = PL1_RW | PL0_R,
+      .type = ARM_CP_IO, .access = PL0_RW,
       .accessfn = gt_vtimer_access,
       .fieldoffset = offsetof(CPUARMState, cp15.c14_timer[GTIMER_VIRT].ctl),
       .resetvalue = 0,
@@ -2706,31 +2706,31 @@ static const ARMCPRegInfo generic_timer_cp_reginfo[] = {
     /* TimerValue views: a 32 bit downcounting view of the underlying state */
     { .name = "CNTP_TVAL", .cp = 15, .crn = 14, .crm = 2, .opc1 = 0, .opc2 = 0,
       .secure = ARM_CP_SECSTATE_NS,
-      .type = ARM_CP_NO_RAW | ARM_CP_IO, .access = PL1_RW | PL0_R,
+      .type = ARM_CP_NO_RAW | ARM_CP_IO, .access = PL0_RW,
       .accessfn = gt_ptimer_access,
       .readfn = gt_phys_tval_read, .writefn = gt_phys_tval_write,
     },
     { .name = "CNTP_TVAL_S",
       .cp = 15, .crn = 14, .crm = 2, .opc1 = 0, .opc2 = 0,
       .secure = ARM_CP_SECSTATE_S,
-      .type = ARM_CP_NO_RAW | ARM_CP_IO, .access = PL1_RW | PL0_R,
+      .type = ARM_CP_NO_RAW | ARM_CP_IO, .access = PL0_RW,
       .accessfn = gt_ptimer_access,
       .readfn = gt_sec_tval_read, .writefn = gt_sec_tval_write,
     },
     { .name = "CNTP_TVAL_EL0", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 3, .crn = 14, .crm = 2, .opc2 = 0,
-      .type = ARM_CP_NO_RAW | ARM_CP_IO, .access = PL1_RW | PL0_R,
+      .type = ARM_CP_NO_RAW | ARM_CP_IO, .access = PL0_RW,
       .accessfn = gt_ptimer_access, .resetfn = gt_phys_timer_reset,
       .readfn = gt_phys_tval_read, .writefn = gt_phys_tval_write,
     },
     { .name = "CNTV_TVAL", .cp = 15, .crn = 14, .crm = 3, .opc1 = 0, .opc2 = 0,
-      .type = ARM_CP_NO_RAW | ARM_CP_IO, .access = PL1_RW | PL0_R,
+      .type = ARM_CP_NO_RAW | ARM_CP_IO, .access = PL0_RW,
       .accessfn = gt_vtimer_access,
       .readfn = gt_virt_tval_read, .writefn = gt_virt_tval_write,
     },
     { .name = "CNTV_TVAL_EL0", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 3, .crn = 14, .crm = 3, .opc2 = 0,
-      .type = ARM_CP_NO_RAW | ARM_CP_IO, .access = PL1_RW | PL0_R,
+      .type = ARM_CP_NO_RAW | ARM_CP_IO, .access = PL0_RW,
       .accessfn = gt_vtimer_access, .resetfn = gt_virt_timer_reset,
       .readfn = gt_virt_tval_read, .writefn = gt_virt_tval_write,
     },
@@ -2758,7 +2758,7 @@ static const ARMCPRegInfo generic_timer_cp_reginfo[] = {
     /* Comparison value, indicating when the timer goes off */
     { .name = "CNTP_CVAL", .cp = 15, .crm = 14, .opc1 = 2,
       .secure = ARM_CP_SECSTATE_NS,
-      .access = PL1_RW | PL0_R,
+      .access = PL0_RW,
       .type = ARM_CP_64BIT | ARM_CP_IO | ARM_CP_ALIAS,
       .fieldoffset = offsetof(CPUARMState, cp15.c14_timer[GTIMER_PHYS].cval),
       .accessfn = gt_ptimer_access,
@@ -2766,7 +2766,7 @@ static const ARMCPRegInfo generic_timer_cp_reginfo[] = {
     },
     { .name = "CNTP_CVAL_S", .cp = 15, .crm = 14, .opc1 = 2,
       .secure = ARM_CP_SECSTATE_S,
-      .access = PL1_RW | PL0_R,
+      .access = PL0_RW,
       .type = ARM_CP_64BIT | ARM_CP_IO | ARM_CP_ALIAS,
       .fieldoffset = offsetof(CPUARMState, cp15.c14_timer[GTIMER_SEC].cval),
       .accessfn = gt_ptimer_access,
@@ -2774,14 +2774,14 @@ static const ARMCPRegInfo generic_timer_cp_reginfo[] = {
     },
     { .name = "CNTP_CVAL_EL0", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 3, .crn = 14, .crm = 2, .opc2 = 2,
-      .access = PL1_RW | PL0_R,
+      .access = PL0_RW,
       .type = ARM_CP_IO,
       .fieldoffset = offsetof(CPUARMState, cp15.c14_timer[GTIMER_PHYS].cval),
       .resetvalue = 0, .accessfn = gt_ptimer_access,
       .writefn = gt_phys_cval_write, .raw_writefn = raw_write,
     },
     { .name = "CNTV_CVAL", .cp = 15, .crm = 14, .opc1 = 3,
-      .access = PL1_RW | PL0_R,
+      .access = PL0_RW,
       .type = ARM_CP_64BIT | ARM_CP_IO | ARM_CP_ALIAS,
       .fieldoffset = offsetof(CPUARMState, cp15.c14_timer[GTIMER_VIRT].cval),
       .accessfn = gt_vtimer_access,
@@ -2789,7 +2789,7 @@ static const ARMCPRegInfo generic_timer_cp_reginfo[] = {
     },
     { .name = "CNTV_CVAL_EL0", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 3, .crn = 14, .crm = 3, .opc2 = 2,
-      .access = PL1_RW | PL0_R,
+      .access = PL0_RW,
       .type = ARM_CP_IO,
       .fieldoffset = offsetof(CPUARMState, cp15.c14_timer[GTIMER_VIRT].cval),
       .resetvalue = 0, .accessfn = gt_vtimer_access,
-- 
2.7.4

