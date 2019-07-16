Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp1139233wrv;
        Tue, 16 Jul 2019 08:41:22 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz6d6IzimtBDy2FbPOMZapgBzaXRr/aiI+AOb5eGX8LSK8lz0R6jO65JMPTNugV/d1FEbUB
X-Received: by 2002:a17:906:959:: with SMTP id j25mr25809715ejd.94.1563291681980;
        Tue, 16 Jul 2019 08:41:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563291681; cv=none;
        d=google.com; s=arc-20160816;
        b=TjrHvIHXAiiylcvSw+OeTe6TzRYcguuC+s1l82BH1jrDSQ/9eMzYLoDpqLOQQozcT/
         LrThl6cZlvcSHpcPqhZX+f6YaKbyO5RyETvLMJtKM2bebU4RWPRxeHjeKStwOD9BG1XU
         viCeYNEFpMeJTI08EX81GGPvKY3piIYVytv3slZIjVj0KVtWOVCV6BFF6gS7W3XIXWvW
         fDG0WrwdOfzsahdK/PmND/jER1bB46zaS5QRwW5eThVmitRfTjf0xwroH9Uv0uIOTXoz
         ZUgyYTsroPRyCZwoBs01hpa3uq711QBGkYpDB46zJipGsaPrF+jVDOvmf6me1e978ZYL
         RYvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from;
        bh=t9dCXvwMMkBBuXiX26ujEDoTqn4InjH0Siiz759sWWU=;
        b=zAt3Qu8rffohkJ3x1/AZSz634DbjwWWATZA7bfVU5awHWsxzdYdruPj57gIGnwUyYG
         wO86n2ggMqvBqD3ozAsfabIUbKAxsVIgBjAAx86+TYl0xsmz2oY9Q+bSM5cBw1Rj6JYU
         5PvOmPOuFtBCv43j4bYO0XJmLFzf9Vdlwh3yHWQz2W3vmmb7ATFK0H9gexsyHYh6D0dy
         jBbhlVEhPjAb0W1zsJCwd7otQNdk4qlkfI77WOW92CROn+st+KGPeI6zpw/AC8H8cm4A
         PRE7o1cYgraKrXEDEnnSy10uTX9R5BXAg6iYUA+vnBZdcKi8FnLzhOg72WVNka2hauQ2
         POZw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z20si11687501ejk.274.2019.07.16.08.41.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jul 2019 08:41:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hnPZw-0007gO-MW
	for alex.bennee@linaro.org; Tue, 16 Jul 2019 11:41:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36554)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hnPZo-0007S4-C7
 for qemu-arm@nongnu.org; Tue, 16 Jul 2019 11:41:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hnPZn-0004N9-8Y
 for qemu-arm@nongnu.org; Tue, 16 Jul 2019 11:41:12 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2237 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hnPZm-0004IE-Kg; Tue, 16 Jul 2019 11:41:11 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 4479D35118994EE01CED;
 Tue, 16 Jul 2019 23:41:04 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.439.0; Tue, 16 Jul 2019 23:40:54 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <imammedo@redhat.com>
Date: Tue, 16 Jul 2019 16:38:11 +0100
Message-ID: <20190716153816.17676-6-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20190716153816.17676-1-shameerali.kolothum.thodi@huawei.com>
References: <20190716153816.17676-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.191
Subject: [Qemu-arm] [PATCH-for-4.2 v7 05/10] hw/arm/virt: Add 4.2 machine
 type
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
X-TUID: EGPoVq7CwMmW

This is in preparation to create ACPI GED device as we
need to disable it for <4.2 for migration to work.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
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


