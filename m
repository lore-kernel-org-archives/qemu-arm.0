Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp541413wrd;
        Sat, 1 Sep 2018 05:51:32 -0700 (PDT)
X-Google-Smtp-Source: ANB0Vda1CIGudpi8Em+4BA+S+7TipXrHJBtzIVU4dp9kOBqbltcir3PQiI0FjAb9PUMulNUEQtvE
X-Received: by 2002:a37:c04f:: with SMTP id o76-v6mr18882027qki.315.1535806292537;
        Sat, 01 Sep 2018 05:51:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535806292; cv=none;
        d=google.com; s=arc-20160816;
        b=KmwDzxCGciYQU37rHWzQLHMzansXAZ6GnzGdWnGbE/dPrC6NUrD+6RTxS0+VdxZ3I5
         GDxHdSN57bHgeS0Bf++VEyIIv+nLovmms+bbYtQkxtX6o/hAqu4R8Q4YLPGCiGi4AXb+
         WHbTZnshFBUwyyRMgDO6ysqJ64fekoFcdG7YfNZKsdOAHi18zbKHniMfwa0/VGIFUnS6
         EfC99F/iYU+R3tARgRh/i94jLzUB2c370zeK5PQuZPWNTj7C6wlYwvnngiD/VnyAidAi
         M+0s6xVCQseL3ucYbKuMxstNpE2RMdiOrYWjSIUuwRnJ+6olClygtQITu/H0byjifCVm
         AINw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature:arc-authentication-results;
        bh=duL5bAeYcf3WEX0uO+Av8KLf+aFxvmWzhDyMlaOMIzc=;
        b=xmehkoGw2jhq0ptqcunGtgVmlvkWfYvMgAOycoSqsfdG238M6tP2PLpmAqsUMwPQf9
         PtVLGkoZrv79NzzFQK+fdY5J1fbPmGDzkbT9xZchmVQGs06OXciFeBy6PbvpL3ZN26/9
         IqCXucoV3MyTclSacyJmxkiKtkF0zhArYz4wdsFR6Vwxeeh+03zJ73vxxT8yYnfPcN4h
         c/vLEL8kot0SL+hEaxj9+7eULmWts0wf4Y7/1ChyPctUHrFTUS1foNgsDWVtvr/f/je2
         afgWqudF/RlUg9Ym6CCLQEX5cJIg6m0iDKb16ifMikArHmq3VQBt46Vy9ovx0v3gkuw1
         aCxw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=6uhL0YVG;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=6uhL0YVG;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=5nTiMUE1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w12-v6si438619qkf.264.2018.09.01.05.51.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 01 Sep 2018 05:51:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=6uhL0YVG;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=6uhL0YVG;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=5nTiMUE1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37058 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fw5NE-0000rp-1c
	for alex.bennee@linaro.org; Sat, 01 Sep 2018 08:51:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35586)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fw5JW-00066q-9w
	for qemu-arm@nongnu.org; Sat, 01 Sep 2018 08:47:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fw5JR-0007vB-H6
	for qemu-arm@nongnu.org; Sat, 01 Sep 2018 08:47:42 -0400
Received: from greensocs.com ([193.104.36.180]:40637)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fw5JR-0007kF-9t; Sat, 01 Sep 2018 08:47:37 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id DCA78521AB0;
	Sat,  1 Sep 2018 14:47:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1535806033;
	bh=5/2DOvtpiZV5P2ENECTDH5wFSujNGyE0gLpN3XvmQ5Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=6uhL0YVGIRSMmkFE6RY8YTIeY5ZMonvc19p/YwOZ9JUIDhOqtW7ZrpHyoWKVOKDuJ
	IeU5agzqHsT2ZHDmqmq2VWXeUcxhHMI3ad94xkNWZUdrP8rcj6YRcOvG3khmyJ+jNz
	Qj4fm7zO7HzJTSbMu93Yjr58f+xzKXM3z27QmeIo=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=6uhL0YVG;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=5nTiMUE1
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id caxCHvjHpHDg; Sat,  1 Sep 2018 14:47:13 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 129FA521AAA; Sat,  1 Sep 2018 14:47:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1535806033;
	bh=5/2DOvtpiZV5P2ENECTDH5wFSujNGyE0gLpN3XvmQ5Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=6uhL0YVGIRSMmkFE6RY8YTIeY5ZMonvc19p/YwOZ9JUIDhOqtW7ZrpHyoWKVOKDuJ
	IeU5agzqHsT2ZHDmqmq2VWXeUcxhHMI3ad94xkNWZUdrP8rcj6YRcOvG3khmyJ+jNz
	Qj4fm7zO7HzJTSbMu93Yjr58f+xzKXM3z27QmeIo=
Received: from michell-laptop.home.lmichel.fr
	(LFbn-LYO-1-488-36.w2-7.abo.wanadoo.fr [2.7.77.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 5E55F521A9F;
	Sat,  1 Sep 2018 14:47:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1535806032;
	bh=5/2DOvtpiZV5P2ENECTDH5wFSujNGyE0gLpN3XvmQ5Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=5nTiMUE11pDB2HFZhB5i0pydVr8AhhRfiF72dghKNkNv8l8cmqhTRZzMAjS+P12Ro
	DRLmEiUFfMmeX0dR01qs4rYsbH2Usl+ddCj7s5m3bCcrYXni23hyfEQewC9wdo9VHa
	LgjsxAX0vL8xQqW3cVR6Un060Z5CwZw4h7MNB66c=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Sat,  1 Sep 2018 14:46:39 +0200
Message-Id: <20180901124639.19735-16-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180901124639.19735-1-luc.michel@greensocs.com>
References: <20180901124639.19735-1-luc.michel@greensocs.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH 15/15] arm/xlnx-zynqmp: put APUs and RPUs in
 separate GDB groups
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
Cc: Peter Maydell <peter.maydell@linaro.org>, alistair@alistair23.me,
	mark.burton@greensocs.com, saipava@xilinx.com, edgari@xilinx.com,
	qemu-arm@nongnu.org, Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dGuunvuwWtKz

Create two separate QOM containers for APUs and RPUs to indicate to the
GDB stub that those CPUs should be put in different processes.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
---
 hw/arm/xlnx-zynqmp.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index c195040350..5e92adbc71 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -22,10 +22,11 @@
 #include "hw/arm/xlnx-zynqmp.h"
 #include "hw/intc/arm_gic_common.h"
 #include "exec/address-spaces.h"
 #include "sysemu/kvm.h"
 #include "kvm_arm.h"
+#include "exec/gdbstub.h"
 
 #define GIC_NUM_SPI_INTR 160
 
 #define ARM_PHYS_TIMER_PPI  30
 #define ARM_VIRT_TIMER_PPI  27
@@ -175,17 +176,18 @@ static void xlnx_zynqmp_create_rpu(XlnxZynqMPState *s, const char *boot_cpu,
                                    Error **errp)
 {
     Error *err = NULL;
     int i;
     int num_rpus = MIN(smp_cpus - XLNX_ZYNQMP_NUM_APU_CPUS, XLNX_ZYNQMP_NUM_RPU_CPUS);
+    Object *rpu_group = gdb_cpu_group_container_get(OBJECT(s));
 
     for (i = 0; i < num_rpus; i++) {
         char *name;
 
         object_initialize(&s->rpu_cpu[i], sizeof(s->rpu_cpu[i]),
                           "cortex-r5f-" TYPE_ARM_CPU);
-        object_property_add_child(OBJECT(s), "rpu-cpu[*]",
+        object_property_add_child(rpu_group, "rpu-cpu[*]",
                                   OBJECT(&s->rpu_cpu[i]), &error_abort);
 
         name = object_get_canonical_path_component(OBJECT(&s->rpu_cpu[i]));
         if (strcmp(name, boot_cpu)) {
             /* Secondary CPUs start in PSCI powered-down state */
@@ -210,13 +212,14 @@ static void xlnx_zynqmp_create_rpu(XlnxZynqMPState *s, const char *boot_cpu,
 static void xlnx_zynqmp_init(Object *obj)
 {
     XlnxZynqMPState *s = XLNX_ZYNQMP(obj);
     int i;
     int num_apus = MIN(smp_cpus, XLNX_ZYNQMP_NUM_APU_CPUS);
+    Object *apu_group = gdb_cpu_group_container_get(obj);
 
     for (i = 0; i < num_apus; i++) {
-        object_initialize_child(obj, "apu-cpu[*]", &s->apu_cpu[i],
+        object_initialize_child(apu_group, "apu-cpu[*]", &s->apu_cpu[i],
                                 sizeof(s->apu_cpu[i]),
                                 "cortex-a53-" TYPE_ARM_CPU, &error_abort, NULL);
     }
 
     sysbus_init_child_obj(obj, "gic", &s->gic, sizeof(s->gic),
-- 
2.18.0

