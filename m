Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp4477044wro;
        Mon, 29 Oct 2018 10:07:23 -0700 (PDT)
X-Google-Smtp-Source: AJdET5e4/0XpeShJDFo6ChphNiMrVqMIFp48gxdDL9GpIxI4qIeOHnnpyB12MJopLNJlAoNUG20J
X-Received: by 2002:ac8:4804:: with SMTP id g4-v6mr13484952qtq.66.1540832843050;
        Mon, 29 Oct 2018 10:07:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540832843; cv=none;
        d=google.com; s=arc-20160816;
        b=yMyGxSdHH+lzkqqPwzFKvIHwNlw9Yl+QdqHQxzQXIr7iY4LKzqBKEPre6a4kHR8gPH
         rACkIYKpN7t70nfZtHG6xUwSxsa3ijQ9a1mFW5d0pG45esiqSrLrScHGoFumLw7Q5L05
         ongjgo9se7zcV3IjVslqp5qCM6Dl7XvReEgqeYbe5eRqN3dpsWD3sEKMu3Pj1sxINoGO
         A7nzrtOeJLBC/UgTWUBaAArbrlNCjHnCZHcL13cNo3b/kf3mEx8LbpUXzGDFswBHVrAl
         YK7Xy77+HPLJFA/b5EQLb8iC683CM7A0VAufRPEmZ5c1MC470bEsoTjUAW+bFxww4IjO
         540w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=iYF3ohCSNBJ+PATkGUDQfLkJnx9Fay7fJ8BzovlGFOk=;
        b=AbgZRCtj+X37WI18/qIzasWDvvjSw9i35iMj1vyBF/Ccvgs19nstuVcm6QtxN0puyI
         g/qFbGJ1uiiUQpCvoVuHM8nnz5QYHGeRs4LZdgveHdug5zIrBpo3QFVQrQjAgOoD/U9V
         Mey//bQFIu5iDvqTlYD/NIFsTuI+TsvZ18jiELwyKuPtiZGjQzZIuDxLf6ekS1PBL7dK
         42Z9beGSPA7kYqxapmGL4Y07TUt6nVCDO6Wy9/8a3MYHRCBj406XBTS1R/fw2sxQwIZ5
         BUznnK2VX/1Z8/3hA4uNXRpGArMluXr6B45WVXnBgEDE9kfipUVA9aWEvE+bv0FZArPq
         xQSA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g1si4508111qvi.36.2018.10.29.10.07.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 29 Oct 2018 10:07:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:47187 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gHB0c-00048P-Dx
	for alex.bennee@linaro.org; Mon, 29 Oct 2018 13:07:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47058)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gHAwY-0001i1-2p
	for qemu-devel@nongnu.org; Mon, 29 Oct 2018 13:03:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gHAwS-0004HZ-Pg
	for qemu-devel@nongnu.org; Mon, 29 Oct 2018 13:03:09 -0400
Received: from mga02.intel.com ([134.134.136.20]:15755)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gHAwS-0003rZ-8R; Mon, 29 Oct 2018 13:03:04 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Oct 2018 10:03:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,441,1534834800"; d="scan'208";a="276598894"
Received: from mjadwisz-mobl.ger.corp.intel.com (HELO localhost.localdomain)
	([10.252.7.64])
	by fmsmga006.fm.intel.com with ESMTP; 29 Oct 2018 10:03:01 -0700
From: Samuel Ortiz <sameo@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Mon, 29 Oct 2018 18:01:45 +0100
Message-Id: <20181029170159.3801-6-sameo@linux.intel.com>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181029170159.3801-1-sameo@linux.intel.com>
References: <20181029170159.3801-1-sameo@linux.intel.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.20
Subject: [Qemu-devel] [PATCH v3 05/19] hw: arm: Switch to the AML build RSDP
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
X-TUID: gobZVJ+jt53n

We make the ARM virt ACPI code use the now shared build_rsdp() API from
aml-build.c. By doing so we fix a bug where the ARM implementation was
missing adding both the legacy and extended checksums, which was
building an invalid RSDP table.

Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
---
 hw/arm/virt-acpi-build.c | 31 +------------------------------
 1 file changed, 1 insertion(+), 30 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index f28a2faa53..0a6a88380a 100644
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
-static GArray *
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
2.17.2

