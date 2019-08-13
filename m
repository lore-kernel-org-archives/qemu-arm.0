Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp34949wrs;
        Tue, 13 Aug 2019 14:12:29 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz7TN47wA08J+ZqV6oU7OhRf5N+O6eJEG4kLPIsV6Hn9wqUMbQsafhST66coXnf1HPoteNp
X-Received: by 2002:ac8:7b56:: with SMTP id m22mr21317503qtu.390.1565730749835;
        Tue, 13 Aug 2019 14:12:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565730749; cv=none;
        d=google.com; s=arc-20160816;
        b=xYsr66I2cDZxt5hhT3jamK4RaFTBPKhBk1rDdLo+EEA9Idl8hoeOdNdisBePsC8ehT
         bMDRaf5l/ackzMyLdfiKy17eDqJUBgAx6pK4hWm7I5lMrTH3Ut+QcAq+Ib/OLFAyVOYb
         fNMaDPoHdiCnZ017kJkRej7eAMLOk1xnqkSnSyzIUTSHI5FJW0Ak6F4xJfTycKoeADwA
         XYBbiz/IN4PFwAKr1hCezgRpeFvs9/pq3r/eFSBStBryQ/hMZhK+nrC33WpcQPnPe6qE
         e47jNC6O8gNycR3X7BaRn1pvsEqMoMM4AWitUqPl3ccC3urMKAkfsEyZuBfDoP0xNJce
         7Hwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from;
        bh=902FfrCE18fMMDnbH1AbjewyJewJhlr780PGsmnk3K4=;
        b=RI1imfyxqexL0rU1QlrGXa3xDJpps7OMVjWRsWfi8Rz8WUamlruiu+RfsiV2o+zH41
         1C799J1v2ovWNPpH7o5h2aiJmPQrYJ6egklapmvFqfOVhXVwfn0O/TvljGeU48OgeYww
         OuJfyI2gQLT7rygDMs16ND4i8XXh7i8WJ/eVUtT3da1rQ986svyiylOs2x+7gT4zrjGf
         2zt772+McSMqtbI8Fx21mBNX2I9m9m1G9OvX+1tBWs5vws7rYh6sg6GGygXQ+Vu+kSbb
         3mhIDqoWGn8AUu1GfvgcK1/tIkFzwW974VaFyIPl6i6jqGaX7Sz6jC3HXj0dGC+F3iyQ
         moeA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 10si5442423qvq.134.2019.08.13.14.12.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Aug 2019 14:12:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hxe5l-0003cO-BO
	for alex.bennee@linaro.org; Tue, 13 Aug 2019 17:12:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41695)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hxe11-0004td-J7
 for qemu-arm@nongnu.org; Tue, 13 Aug 2019 17:07:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hxe10-0001Dx-5z
 for qemu-arm@nongnu.org; Tue, 13 Aug 2019 17:07:35 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:33576 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hxe0z-0001CJ-Lm; Tue, 13 Aug 2019 17:07:34 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id B3D2A16FBA25251D182D;
 Wed, 14 Aug 2019 05:07:31 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.47.94.0) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.439.0; Wed, 14 Aug 2019 05:07:21 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <imammedo@redhat.com>
Date: Tue, 13 Aug 2019 22:05:32 +0100
Message-ID: <20190813210539.31164-6-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20190813210539.31164-1-shameerali.kolothum.thodi@huawei.com>
References: <20190813210539.31164-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.47.94.0]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.32
Subject: [Qemu-arm] [PATCH-for-4.2 v9 05/12] hw/arm/virt: Add 4.2 machine
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
X-TUID: 0bygrxvRjCyd

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
index 72cde9deba..ef65e721d2 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2097,10 +2097,17 @@ static void machvirt_machine_init(void)
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
index 32d1ca9abc..83cd1bfeec 100644
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


