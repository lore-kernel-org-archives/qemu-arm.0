Received: by 2002:a5d:610e:0:0:0:0:0 with SMTP id v14csp395413wrt;
        Mon, 11 Mar 2019 01:33:57 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxv1IlAE8kbbADg9iaeJKKSTtwlbOUo/HxiR+bEs2x6OBCz9Pj08dqNr/4vnnYO0vjnSSFg
X-Received: by 2002:a81:70c5:: with SMTP id l188mr3681797ywc.198.1552293237413;
        Mon, 11 Mar 2019 01:33:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552293237; cv=none;
        d=google.com; s=arc-20160816;
        b=fgRC6z+1/ZqY5UeMUb5Xta01Sao9tgSrp/JKm9IEvJ0owiv9eQN94aZCrwGt9uY2Iz
         cx+YjnNKcuCycQYIL6vXk+7q7KdXdE4CAZhbprk0q+e11D1wp5W5QD7R9Ph6j5VahDao
         2Z68aZ7H9S546tHutZSUhexSphknIylcv4Jb81y6Nlfkf3GEffAt2UuoTVh3H+9qDugK
         F/mCDR/48EFS3dguGv+56EnwgTu4rBf/+PYEvyGt6pBvtGgia28vrFJnaAs4I3YVbqml
         6h3h3cDOUeyBcSUFP9zISLfeH57ub4LwZ1MUw9ecJWl2Fyc6Qy+4yqBm1u2n5yXLi9v1
         0YVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:message-id
         :date:to:from;
        bh=Sq7W+EQK5spllx6ZWUNzpKEBNszjhxudWn4pTgcCoYU=;
        b=PdQkLT50v6ZIG0uvt4rDV0RbZE1Fg8cUep5RppKmXgZTVR4DCvpOmZd1sn8A+JmDay
         Ih71HwgxGCLVuHGMHiMHI836Eie3OEtvaQAjRYHfQYKbmtVPgnyjqK32F5voO9kzhTgT
         3pSvsNZtZJn5AsplaungMIM4CUElQKub1OfeTSm+Lo0q4hV61Xnd2i3U4PzIKWyqHa2y
         09R2/meT7HNn/P0GNIJMp1wgkYd+xVLEJXsu5sEjl41gdag0LHoKvrfbzM+Z7ivG3Dxv
         z7b42JrLe+NBEuK1m7UoXjZH5u0xlMNUnF3PzlPYfqP3YU6TOoUO4vB1pT8rXcwS2e5S
         xaAg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b20si2712291ywa.190.2019.03.11.01.33.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Mar 2019 01:33:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:57221 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h3GNg-00022D-Q6
	for alex.bennee@linaro.org; Mon, 11 Mar 2019 04:33:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59768)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1h3GNO-0001p9-8K
	for qemu-arm@nongnu.org; Mon, 11 Mar 2019 04:33:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1h3GJW-0004Jy-En
	for qemu-arm@nongnu.org; Mon, 11 Mar 2019 04:29:39 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:49134 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <gengdongjiu@huawei.com>)
	id 1h3GJV-0004IV-So; Mon, 11 Mar 2019 04:29:38 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id CAAABF2C559258FE117A;
	Mon, 11 Mar 2019 16:29:34 +0800 (CST)
Received: from localhost.localdomain (10.143.28.91) by
	DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server
	id 14.3.408.0; Mon, 11 Mar 2019 16:29:24 +0800
From: gengdongjiu <gengdongjiu@huawei.com>
To: <peter.maydell@linaro.org>, <qemu-arm@nongnu.org>,
	<qemu-devel@nongnu.org>, <gengdongjiu@huawei.com>
Date: Mon, 11 Mar 2019 16:29:23 +0800
Message-ID: <1552292963-19430-1-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.143.28.91]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.35
Subject: [Qemu-arm] [RESEND PATCH] target/arm: change arch timer registers
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
X-TUID: s0M++ZCzR3Gm

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
When kernel or Hypervisor configures the timer registers to RW in EL0
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
index 2607d39..3db94c6 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -2665,7 +2665,7 @@ static const ARMCPRegInfo generic_timer_cp_reginfo[] = {
     /* per-timer control */
     { .name = "CNTP_CTL", .cp = 15, .crn = 14, .crm = 2, .opc1 = 0, .opc2 = 1,
       .secure = ARM_CP_SECSTATE_NS,
-      .type = ARM_CP_IO | ARM_CP_ALIAS, .access = PL1_RW | PL0_R,
+      .type = ARM_CP_IO | ARM_CP_ALIAS, .access = PL1_RW | PL0_RW,
       .accessfn = gt_ptimer_access,
       .fieldoffset = offsetoflow32(CPUARMState,
                                    cp15.c14_timer[GTIMER_PHYS].ctl),
@@ -2674,7 +2674,7 @@ static const ARMCPRegInfo generic_timer_cp_reginfo[] = {
     { .name = "CNTP_CTL_S",
       .cp = 15, .crn = 14, .crm = 2, .opc1 = 0, .opc2 = 1,
       .secure = ARM_CP_SECSTATE_S,
-      .type = ARM_CP_IO | ARM_CP_ALIAS, .access = PL1_RW | PL0_R,
+      .type = ARM_CP_IO | ARM_CP_ALIAS, .access = PL1_RW | PL0_RW,
       .accessfn = gt_ptimer_access,
       .fieldoffset = offsetoflow32(CPUARMState,
                                    cp15.c14_timer[GTIMER_SEC].ctl),
@@ -2682,14 +2682,14 @@ static const ARMCPRegInfo generic_timer_cp_reginfo[] = {
     },
     { .name = "CNTP_CTL_EL0", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 3, .crn = 14, .crm = 2, .opc2 = 1,
-      .type = ARM_CP_IO, .access = PL1_RW | PL0_R,
+      .type = ARM_CP_IO, .access = PL1_RW | PL0_RW,
       .accessfn = gt_ptimer_access,
       .fieldoffset = offsetof(CPUARMState, cp15.c14_timer[GTIMER_PHYS].ctl),
       .resetvalue = 0,
       .writefn = gt_phys_ctl_write, .raw_writefn = raw_write,
     },
     { .name = "CNTV_CTL", .cp = 15, .crn = 14, .crm = 3, .opc1 = 0, .opc2 = 1,
-      .type = ARM_CP_IO | ARM_CP_ALIAS, .access = PL1_RW | PL0_R,
+      .type = ARM_CP_IO | ARM_CP_ALIAS, .access = PL1_RW | PL0_RW,
       .accessfn = gt_vtimer_access,
       .fieldoffset = offsetoflow32(CPUARMState,
                                    cp15.c14_timer[GTIMER_VIRT].ctl),
@@ -2697,7 +2697,7 @@ static const ARMCPRegInfo generic_timer_cp_reginfo[] = {
     },
     { .name = "CNTV_CTL_EL0", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 3, .crn = 14, .crm = 3, .opc2 = 1,
-      .type = ARM_CP_IO, .access = PL1_RW | PL0_R,
+      .type = ARM_CP_IO, .access = PL1_RW | PL0_RW,
       .accessfn = gt_vtimer_access,
       .fieldoffset = offsetof(CPUARMState, cp15.c14_timer[GTIMER_VIRT].ctl),
       .resetvalue = 0,
@@ -2706,31 +2706,31 @@ static const ARMCPRegInfo generic_timer_cp_reginfo[] = {
     /* TimerValue views: a 32 bit downcounting view of the underlying state */
     { .name = "CNTP_TVAL", .cp = 15, .crn = 14, .crm = 2, .opc1 = 0, .opc2 = 0,
       .secure = ARM_CP_SECSTATE_NS,
-      .type = ARM_CP_NO_RAW | ARM_CP_IO, .access = PL1_RW | PL0_R,
+      .type = ARM_CP_NO_RAW | ARM_CP_IO, .access = PL1_RW | PL0_RW,
       .accessfn = gt_ptimer_access,
       .readfn = gt_phys_tval_read, .writefn = gt_phys_tval_write,
     },
     { .name = "CNTP_TVAL_S",
       .cp = 15, .crn = 14, .crm = 2, .opc1 = 0, .opc2 = 0,
       .secure = ARM_CP_SECSTATE_S,
-      .type = ARM_CP_NO_RAW | ARM_CP_IO, .access = PL1_RW | PL0_R,
+      .type = ARM_CP_NO_RAW | ARM_CP_IO, .access = PL1_RW | PL0_RW,
       .accessfn = gt_ptimer_access,
       .readfn = gt_sec_tval_read, .writefn = gt_sec_tval_write,
     },
     { .name = "CNTP_TVAL_EL0", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 3, .crn = 14, .crm = 2, .opc2 = 0,
-      .type = ARM_CP_NO_RAW | ARM_CP_IO, .access = PL1_RW | PL0_R,
+      .type = ARM_CP_NO_RAW | ARM_CP_IO, .access = PL1_RW | PL0_RW,
       .accessfn = gt_ptimer_access, .resetfn = gt_phys_timer_reset,
       .readfn = gt_phys_tval_read, .writefn = gt_phys_tval_write,
     },
     { .name = "CNTV_TVAL", .cp = 15, .crn = 14, .crm = 3, .opc1 = 0, .opc2 = 0,
-      .type = ARM_CP_NO_RAW | ARM_CP_IO, .access = PL1_RW | PL0_R,
+      .type = ARM_CP_NO_RAW | ARM_CP_IO, .access = PL1_RW | PL0_RW,
       .accessfn = gt_vtimer_access,
       .readfn = gt_virt_tval_read, .writefn = gt_virt_tval_write,
     },
     { .name = "CNTV_TVAL_EL0", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 3, .crn = 14, .crm = 3, .opc2 = 0,
-      .type = ARM_CP_NO_RAW | ARM_CP_IO, .access = PL1_RW | PL0_R,
+      .type = ARM_CP_NO_RAW | ARM_CP_IO, .access = PL1_RW | PL0_RW,
       .accessfn = gt_vtimer_access, .resetfn = gt_virt_timer_reset,
       .readfn = gt_virt_tval_read, .writefn = gt_virt_tval_write,
     },
@@ -2758,7 +2758,7 @@ static const ARMCPRegInfo generic_timer_cp_reginfo[] = {
     /* Comparison value, indicating when the timer goes off */
     { .name = "CNTP_CVAL", .cp = 15, .crm = 14, .opc1 = 2,
       .secure = ARM_CP_SECSTATE_NS,
-      .access = PL1_RW | PL0_R,
+      .access = PL1_RW | PL0_RW,
       .type = ARM_CP_64BIT | ARM_CP_IO | ARM_CP_ALIAS,
       .fieldoffset = offsetof(CPUARMState, cp15.c14_timer[GTIMER_PHYS].cval),
       .accessfn = gt_ptimer_access,
@@ -2766,7 +2766,7 @@ static const ARMCPRegInfo generic_timer_cp_reginfo[] = {
     },
     { .name = "CNTP_CVAL_S", .cp = 15, .crm = 14, .opc1 = 2,
       .secure = ARM_CP_SECSTATE_S,
-      .access = PL1_RW | PL0_R,
+      .access = PL1_RW | PL0_RW,
       .type = ARM_CP_64BIT | ARM_CP_IO | ARM_CP_ALIAS,
       .fieldoffset = offsetof(CPUARMState, cp15.c14_timer[GTIMER_SEC].cval),
       .accessfn = gt_ptimer_access,
@@ -2774,14 +2774,14 @@ static const ARMCPRegInfo generic_timer_cp_reginfo[] = {
     },
     { .name = "CNTP_CVAL_EL0", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 3, .crn = 14, .crm = 2, .opc2 = 2,
-      .access = PL1_RW | PL0_R,
+      .access = PL1_RW | PL0_RW,
       .type = ARM_CP_IO,
       .fieldoffset = offsetof(CPUARMState, cp15.c14_timer[GTIMER_PHYS].cval),
       .resetvalue = 0, .accessfn = gt_ptimer_access,
       .writefn = gt_phys_cval_write, .raw_writefn = raw_write,
     },
     { .name = "CNTV_CVAL", .cp = 15, .crm = 14, .opc1 = 3,
-      .access = PL1_RW | PL0_R,
+      .access = PL1_RW | PL0_RW,
       .type = ARM_CP_64BIT | ARM_CP_IO | ARM_CP_ALIAS,
       .fieldoffset = offsetof(CPUARMState, cp15.c14_timer[GTIMER_VIRT].cval),
       .accessfn = gt_vtimer_access,
@@ -2789,7 +2789,7 @@ static const ARMCPRegInfo generic_timer_cp_reginfo[] = {
     },
     { .name = "CNTV_CVAL_EL0", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 3, .crn = 14, .crm = 3, .opc2 = 2,
-      .access = PL1_RW | PL0_R,
+      .access = PL1_RW | PL0_RW,
       .type = ARM_CP_IO,
       .fieldoffset = offsetof(CPUARMState, cp15.c14_timer[GTIMER_VIRT].cval),
       .resetvalue = 0, .accessfn = gt_vtimer_access,
-- 
2.7.4

