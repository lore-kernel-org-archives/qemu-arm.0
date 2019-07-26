Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp11749319wrv;
        Fri, 26 Jul 2019 03:46:58 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx2tvFWX4JgWRYfvya8EhYp3DVFgq+IRAMviwPLPToQ6db+ZMwe6HVw8G3CW2s+UCWKTuRi
X-Received: by 2002:a37:9185:: with SMTP id t127mr58578295qkd.405.1564138018460;
        Fri, 26 Jul 2019 03:46:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564138018; cv=none;
        d=google.com; s=arc-20160816;
        b=ng71XasAfF8u+YcdSA92e2I2kWMEZxTUOxQmRBFjMdjRmQdaJCxgfq8HragInBeSfW
         KzPJHqCij4d2DPswKmvyd0BEVJuZi27GlS8gb7hrJPb+293HAIZRd1tsdfU3k7aO0/mL
         TdV5SIWxJokkdioGPy9ALlfMx90u0F32Ug6S9stKt/VNmHOdY7giJ8v4Z5SNNem1WO19
         QhuIcjRNwCYsEWjTV0rhgBzcX1qzzxqqlwXullBzZx/aNKYjSroNPJoHrv/HODupJD7t
         ACGJQVvtyqTFoGoKmGR0Pd0Fx78zfFt9j7e79qM7sjSUbHN0O9GaMaSlH4dFZBT9PgmQ
         nHiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from;
        bh=cI6f50WHa+eaTbgxxDqMu50UaQxwXyBaVmb6pRoQU3I=;
        b=FsuTBNl5U44sD0Aes/s7aI3afi+EgW0RmCXO6l2xj5BXkne5IO3Dkx/YIpXZm95NHc
         61WYkQodHuaDkkIZ76RwB3aAkA7ZYALhDEkgt3Aa4SRPEzY2+EGht+I4YBFNJDw9Qso6
         S7qIMbHHRBSHm/+Zqsfo1HfqqIkHq04umuZO0Ux5jNHdHLLyEA+/upBNRLmTF+TSy54I
         iAPn1UvNeCI212et3Xtfj6l47g4HXYnnPOLkVBaeut1WuPuhPpyraelznGWwhtrBq8Mz
         dtjo3v6856IdjSXJa6UuVXgLttKC6cdg2FTWDHSWZLLMfFkRvkHhEwLRnEGzBa0kvL1e
         Sqnw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s7si26402557qkc.12.2019.07.26.03.46.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jul 2019 03:46:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hqxkU-00074U-Me
	for alex.bennee@linaro.org; Fri, 26 Jul 2019 06:46:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43022)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hqxkH-0006n9-Mf
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 06:46:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hqxkF-0006RR-IJ
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 06:46:40 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:51650 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hqxkF-0005uE-6k; Fri, 26 Jul 2019 06:46:39 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 16BE47F54068DBC17FAD;
 Fri, 26 Jul 2019 18:46:31 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.439.0; Fri, 26 Jul 2019 18:46:22 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <imammedo@redhat.com>
Date: Fri, 26 Jul 2019 11:45:15 +0100
Message-ID: <20190726104519.23812-6-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20190726104519.23812-1-shameerali.kolothum.thodi@huawei.com>
References: <20190726104519.23812-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.32
Subject: [Qemu-arm] [PATCH-for-4.2 v8 5/9] hw/arm/virt: Add 4.2 machine type
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, sameo@linux.intel.com, ard.biesheuvel@linaro.org,
 linuxarm@huawei.com, xuwei5@hisilicon.com, shannon.zhaosl@gmail.com,
 sebastien.boeuf@intel.com, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3tc022AmNf+p

This is in preparation to create ACPI GED device as we
need to disable it for <4.2 for migration to work.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/arm/virt.c       | 9 ++++++++-
 hw/core/machine.c   | 3 +++
 include/hw/boards.h | 3 +++
 3 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 907fb64bb9..bbe156dc35 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2095,10 +2095,17 @@ static void machvirt_machine_init(void)
 }
 type_init(machvirt_machine_init);
 
+static void virt_machine_4_2_options(MachineClass *mc)
+{
+}
+DEFINE_VIRT_MACHINE_AS_LATEST(4, 2)
+
 static void virt_machine_4_1_options(MachineClass *mc)
 {
+    virt_machine_4_2_options(mc);
+    compat_props_add(mc->compat_props, hw_compat_4_1, hw_compat_4_1_len);
 }
-DEFINE_VIRT_MACHINE_AS_LATEST(4, 1)
+DEFINE_VIRT_MACHINE(4, 1)
 
 static void virt_machine_4_0_options(MachineClass *mc)
 {
diff --git a/hw/core/machine.c b/hw/core/machine.c
index c58a8e594e..a79d4ad740 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -27,6 +27,9 @@
 #include "hw/pci/pci.h"
 #include "hw/mem/nvdimm.h"
 
+GlobalProperty hw_compat_4_1[] = {};
+const size_t hw_compat_4_1_len = G_N_ELEMENTS(hw_compat_4_1);
+
 GlobalProperty hw_compat_4_0[] = {
     { "VGA",            "edid", "false" },
     { "secondary-vga",  "edid", "false" },
diff --git a/include/hw/boards.h b/include/hw/boards.h
index a71d1a53a5..d9ec37d807 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -317,6 +317,9 @@ struct MachineState {
     } \
     type_init(machine_initfn##_register_types)
 
+extern GlobalProperty hw_compat_4_1[];
+extern const size_t hw_compat_4_1_len;
+
 extern GlobalProperty hw_compat_4_0[];
 extern const size_t hw_compat_4_0_len;
 
-- 
2.17.1


