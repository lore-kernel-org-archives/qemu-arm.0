Received: by 2002:adf:fd4f:0:0:0:0:0 with SMTP id h15csp454766wrs;
        Tue, 12 Mar 2019 05:53:40 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz1bwWkE70OMMZaJFjdDxr5LSCeDdqbtuIV5hHbReLi/avsg1O56hBSn3tMAdeEMTwthmIW
X-Received: by 2002:a25:8106:: with SMTP id o6mr30126014ybk.53.1552395219913;
        Tue, 12 Mar 2019 05:53:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552395219; cv=none;
        d=google.com; s=arc-20160816;
        b=grw2Nv3nW5hGtEOF4d7PyFBYCyBu0DipTD11/bL0LcxEztSdsE9pzaisJLb5ncqEaK
         WXLYtoxk800OXO/YN5pbVmHjJOn4IcjLZaZe/qVB5mmm9LaANiN5nafGoMsDkma6006g
         oIoQE2cExN2J5pfYRV7VuXFkGT5mbmZNqvif+qoxc9ZzqDIgJjzXg8ZXXcCe3SoBh/mJ
         mv7VSXs4BMRVcCflZiXF1YRHcmyRo/PSQAg9rFfEoq9srcKTdMlQeLcrhRv4zo8h3WW5
         PIAwYLYhk4b+EMjTOWxNZTxzWdebrP1A7dDeWKMWGIlSJLXIQAbiuCqoJ9vNZnezLsqJ
         cxEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:message-id
         :date:to:from;
        bh=HmDZgkbqFhqnM3UmuYY4KS+7+xLr9KXeT/XRbq40cdg=;
        b=bbRtjBz9csEWGbbYRjewbdvMwR2RKzdS7autFfefzVAFgPC9oA5wooXe5jreAoJZvE
         MA4LQxROWR0liSETAzzjLVteE/Ce4z0JWMfX7jzmfGacMGWoWsYRUWf8IXRIJ2gCiS4/
         uUNZ97mC5XCcd4YHWAI+Sz3UrspfpMaXCLdmd6tJg5XPx6n7y0LiwceOIquhnEXjciZR
         rPEVnmJHFbfIsbiNi2YSVbnZpS7ZDwUG0r49Hccord/Pyr8FkTfEFXg+bJoPG7L6TwPn
         ++gqkEZVumNep5xqUyMTWJKaBSwxD+4n/YeBJiqh17av5XiQywuckYiQo/CTyuLP4B36
         VT6A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 5si4688665ybv.98.2019.03.12.05.53.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Mar 2019 05:53:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:51819 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h3guZ-00076P-Dv
	for alex.bennee@linaro.org; Tue, 12 Mar 2019 08:53:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47077)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1h3guI-000743-0B
	for qemu-arm@nongnu.org; Tue, 12 Mar 2019 08:53:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1h3guG-0002zV-61
	for qemu-arm@nongnu.org; Tue, 12 Mar 2019 08:53:21 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2191 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <gengdongjiu@huawei.com>)
	id 1h3guF-0002nL-FC; Tue, 12 Mar 2019 08:53:20 -0400
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id D425ACF5711A91F593F1;
	Tue, 12 Mar 2019 20:53:06 +0800 (CST)
Received: from localhost.localdomain (10.143.28.91) by
	DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server
	id 14.3.408.0; Tue, 12 Mar 2019 20:52:57 +0800
From: Dongjiu Geng <gengdongjiu@huawei.com>
To: <peter.maydell@linaro.org>, <qemu-arm@nongnu.org>,
	<qemu-devel@nongnu.org>, <gengdongjiu@huawei.com>
Date: Tue, 12 Mar 2019 20:52:57 +0800
Message-ID: <1552395177-12608-1-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.143.28.91]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.190
Subject: [Qemu-arm] [PATCH V3] target/arm: change arch timer registers
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
Cc: wangnan0@huawei.com, chenguoping@huawei.com, wuyuming3@huawei.com,
	larkin.zhanglixin@huawei.com, linqiangmin@huawei.com, liuyutao2@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: H5k+bW44j9c1

Some generic arch timer registers are Config-RW in the EL0,
which means the EL0 exception level can have write permission
if it is appropriately configured.

When VM access registers, QEMU firstly checks whether they have RW
permission, then check whether it is appropriately configured.
If they are defined to read only in EL0, even though they have been
appropriately configured, they still do not have write permission.
So need to add the write permission according to ARMV8 spec when
define it.

Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
---
Change since V2:
1. Change 'Ready only' to 'read only' in the comments

Change since V1:
1. Change 'PL1_RW | RL0_RW' to PL0_RW because PL0_RW implied that the higher PLx all have RW permission

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

