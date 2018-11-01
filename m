Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp623969wro;
        Thu, 1 Nov 2018 03:28:24 -0700 (PDT)
X-Google-Smtp-Source: AJdET5eU0AVq/iv3CBFZR3SQBjpHd6jHOy+H/CoblwP8RPuiLsHnFEmqbWymCT9OrEWjtqQStm3t
X-Received: by 2002:a0c:8ae3:: with SMTP id 32mr6062128qvw.27.1541068103959;
        Thu, 01 Nov 2018 03:28:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1541068103; cv=none;
        d=google.com; s=arc-20160816;
        b=ZWXvOoq/IvMePR/dWAP7q6HMxnwxEJQBMhvJn5msbnkELdUflohIMVPj1Us9aHPeV/
         WiATWB8pCjZA1hfvtuZMSfyp77tHySc4d1KuzBSi/jH+LgYuj7eY0/TN+Lj5HpaxCbmZ
         UvZv7LWplviGYJgTV+4G0KKgB4OqfZkGf+gkd+RfCIKiYGK016ZF+YQrZzRZVrpx9mQt
         MNQCK3RV+emkV7CPlp2wV0BypKMPVBA+lwLxnHzefo8JUWBQc7u02R9h4XW8oz92WImR
         rNmDOXdn0gM11hs0MfNEM+das65vb+vHkX3shm8QvWDA2UZy70lO87ehrbf4N8WLHr7S
         gSPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=o2w7LINbBJ9qGaBJyefIaS/XN7iPFXD1MGwKSDcR1mc=;
        b=kiZUtBZP6EyDhB2jmv9fAyJWdhV01kU5gw6kUCsUfyeWMUGXzSKyKSd5fEenbbMiBT
         lthRgw29ZablSWnIUFtZYSgydnzVET/V1BXPQKj1vOUkJjierM5p3FgKKy8+/C0lx35u
         pUJ+eRgncv9SEXsn8CV16CeeAm46kc5n1FhAgV4ZAAK0lNDm8QMzA0vt1xgC6NbdbfWK
         KnGzlP2eNx3bIkSbvOBLg1l96QyXqf03nXUXCAGi5yq5oD482hXU5djpwS2mqPMjH78W
         1Ml+/mEww523Wkjkx3qRK550wh6f2GtvinbhKsvFodwe6ZzOA+ruT4qeANLyr/7fbeqH
         1nHw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n88-v6si3587466qte.3.2018.11.01.03.28.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 01 Nov 2018 03:28:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:41084 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gIAD9-0007a4-E1
	for alex.bennee@linaro.org; Thu, 01 Nov 2018 06:28:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59215)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gIA98-0004F8-6n
	for qemu-devel@nongnu.org; Thu, 01 Nov 2018 06:24:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gIA95-0002ya-6X
	for qemu-devel@nongnu.org; Thu, 01 Nov 2018 06:24:14 -0400
Received: from mga17.intel.com ([192.55.52.151]:61500)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gIA94-0002qQ-Td; Thu, 01 Nov 2018 06:24:11 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Nov 2018 03:24:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,451,1534834800"; d="scan'208";a="87785942"
Received: from jmath3-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
	([10.252.9.87])
	by orsmga006.jf.intel.com with ESMTP; 01 Nov 2018 03:24:07 -0700
From: Samuel Ortiz <sameo@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Thu,  1 Nov 2018 11:22:45 +0100
Message-Id: <20181101102303.16439-6-sameo@linux.intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181101102303.16439-1-sameo@linux.intel.com>
References: <20181101102303.16439-1-sameo@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.151
Subject: [Qemu-devel] [PATCH v4 05/23] hw: arm: Switch to the AML build RSDP
 building routine
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Igor Mammedov <imammedo@redhat.com>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	"open list:ARM ACPI Subsystem" <qemu-arm@nongnu.org>,
	"Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FwUdHVMQLiyH

We make the ARM virt ACPI code use the now shared build_rsdp() API from
aml-build.c. By doing so we fix a bug where the ARM implementation was
missing adding both the legacy and extended checksums, which was
building an invalid RSDP table.

Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
---
 hw/arm/virt-acpi-build.c | 31 +------------------------------
 1 file changed, 1 insertion(+), 30 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 0ed132b79b..0a6a88380a 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -35,6 +35,7 @@
 #include "target/arm/cpu.h"
 #include "hw/acpi/acpi-defs.h"
 #include "hw/acpi/acpi.h"
+#include "hw/acpi/aml-build.h"
 #include "hw/nvram/fw_cfg.h"
 #include "hw/acpi/bios-linker-loader.h"
 #include "hw/loader.h"
@@ -366,36 +367,6 @@ static void acpi_dsdt_add_power_button(Aml *scope)
     aml_append(scope, dev);
 }
 
-/* RSDP */
-static void
-build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned xsdt_tbl_offset)
-{
-    AcpiRsdpDescriptor *rsdp = acpi_data_push(rsdp_table, sizeof *rsdp);
-    unsigned xsdt_pa_size = sizeof(rsdp->xsdt_physical_address);
-    unsigned xsdt_pa_offset =
-        (char *)&rsdp->xsdt_physical_address - rsdp_table->data;
-
-    bios_linker_loader_alloc(linker, ACPI_BUILD_RSDP_FILE, rsdp_table, 16,
-                             true /* fseg memory */);
-
-    memcpy(&rsdp->signature, "RSD PTR ", sizeof(rsdp->signature));
-    memcpy(rsdp->oem_id, ACPI_BUILD_APPNAME6, sizeof(rsdp->oem_id));
-    rsdp->length = cpu_to_le32(sizeof(*rsdp));
-    rsdp->revision = 0x02;
-
-    /* Address to be filled by Guest linker */
-    bios_linker_loader_add_pointer(linker,
-        ACPI_BUILD_RSDP_FILE, xsdt_pa_offset, xsdt_pa_size,
-        ACPI_BUILD_TABLE_FILE, xsdt_tbl_offset);
-
-    /* Checksum to be filled by Guest linker */
-    bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE,
-        (char *)rsdp - rsdp_table->data, sizeof *rsdp,
-        (char *)&rsdp->checksum - rsdp_table->data);
-
-    return rsdp_table;
-}
-
 static void
 build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 {
-- 
2.19.1

