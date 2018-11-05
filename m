Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp2038015wro;
        Sun, 4 Nov 2018 17:55:08 -0800 (PST)
X-Google-Smtp-Source: AJdET5epMYjw4mBt7s6FzTf1KXORdsYmxg6BEfEPbk1Bnt0xyvtmlOMYk7dFsfTQCboMjV44aPbZ
X-Received: by 2002:a37:e20b:: with SMTP id g11mr18312867qki.21.1541382908124;
        Sun, 04 Nov 2018 17:55:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541382908; cv=none;
        d=google.com; s=arc-20160816;
        b=rNMP68AhQ1T8RaQLj7XsFa+LkUOuPiOS2OmpijbLp3CsQjh3vNZlYGPBC88xld8fh/
         fguaKJnknVoK8kE/aC7YBBLjBHp5K9c/d8oWjyyqHxBdSBnp6lHYebLtpThsVSv0/ltb
         M7YUmNiB1BlbnekayykgzbDmyqb0y53+xVmlVJY4NreVHWAaJesyCZOCGkWzOMMuoEK3
         lSsf99/e6NP4/Bip7eUSNCoBCxsRaQ+5YiXBBxJ90JbytgIIROu34Jd9NAbRY4ug+ikL
         LqiXdsZXcTm52MmGH9bWduLGphDccZ/gP7p++hfGKG2nHgsHI0ua/NfDsfJlOKUlwgQ+
         lSUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=ADoYJVfnPk6dNtCofUfZcK2YKB/b3Ww+kb2b/TnkLxs=;
        b=Aem+07Z9tjD1g2i+5dIJf+qKzGRnzcOd1YJMobHaSAZN2L0MXV1eOHIP/GRgMAl3Cj
         d1QoSA012HgI7z394HorbIFgbkh5j84osi8VVlUjF8O5c7SufsmVyhGK+Or8q9SowHMj
         7/MC4p56CObseHFYNq2bkbKN1Jhber/eYCRZTg36CiR5DyBhP0lkJeU6g+ZExGeja8u2
         YYmMOruCiXo1lD5WG7FtJThEY1bXUpQ79xScHX/1n+BdMXR3zTbAxq9WBU0ZjKFf1hOZ
         LQLbeu/9xJuR51Y2T5i9u39Sbi7D+5tgBL6XngIkBAm9MmbZS8iQ1TCigfoFacBCHjqf
         ZcQg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n3si1437305qte.138.2018.11.04.17.55.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 04 Nov 2018 17:55:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:60918 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gJU6d-0003oZ-Jt
	for alex.bennee@linaro.org; Sun, 04 Nov 2018 20:55:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47154)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gJTux-00082q-7N
	for qemu-devel@nongnu.org; Sun, 04 Nov 2018 20:43:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gJTur-00039L-4R
	for qemu-devel@nongnu.org; Sun, 04 Nov 2018 20:43:03 -0500
Received: from mga11.intel.com ([192.55.52.93]:9365)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gJTup-00034R-5y; Sun, 04 Nov 2018 20:42:57 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Nov 2018 17:42:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,466,1534834800"; d="scan'208";a="277074393"
Received: from emurphy1-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
	([10.252.26.250])
	by fmsmga005.fm.intel.com with ESMTP; 04 Nov 2018 17:42:47 -0800
From: Samuel Ortiz <sameo@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Mon,  5 Nov 2018 02:40:37 +0100
Message-Id: <20181105014047.26447-15-sameo@linux.intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181105014047.26447-1-sameo@linux.intel.com>
References: <20181105014047.26447-1-sameo@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.93
Subject: [Qemu-devel] [PATCH v5 14/24] hw: i386: Make the hotpluggable
 memory size property more generic
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
	Stefano Stabellini <sstabellini@kernel.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IsiIxXnJP+mA

This property is currently defined under i386/pc while it only describes
a region size that's eventually fetched from the AML ACPI code.

We can make it more generic and shareable across machine types by moving
it to memory-device.h instead.

Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
---
 include/hw/i386/pc.h           | 1 -
 include/hw/mem/memory-device.h | 2 ++
 hw/i386/acpi-build.c           | 2 +-
 hw/i386/pc.c                   | 3 ++-
 4 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index bbbdb33ea3..44cb6bf3f3 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -62,7 +62,6 @@ struct PCMachineState {
 };
 
 #define PC_MACHINE_ACPI_DEVICE_PROP "acpi-device"
-#define PC_MACHINE_DEVMEM_REGION_SIZE "device-memory-region-size"
 #define PC_MACHINE_MAX_RAM_BELOW_4G "max-ram-below-4g"
 #define PC_MACHINE_VMPORT           "vmport"
 #define PC_MACHINE_SMM              "smm"
diff --git a/include/hw/mem/memory-device.h b/include/hw/mem/memory-device.h
index e904e194d5..d9a4fc7c3e 100644
--- a/include/hw/mem/memory-device.h
+++ b/include/hw/mem/memory-device.h
@@ -97,6 +97,8 @@ typedef struct MemoryDeviceClass {
                              MemoryDeviceInfo *info);
 } MemoryDeviceClass;
 
+#define MEMORY_DEVICE_REGION_SIZE "memory-device-region-size"
+
 MemoryDeviceInfoList *qmp_memory_device_list(void);
 uint64_t get_plugged_memory_size(void);
 void memory_device_pre_plug(MemoryDeviceState *md, MachineState *ms,
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index d8bba16776..1ef1a38441 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1628,7 +1628,7 @@ build_srat(GArray *table_data, BIOSLinker *linker,
     MachineClass *mc = MACHINE_GET_CLASS(machine);
     const CPUArchIdList *apic_ids = mc->possible_cpu_arch_ids(machine);
     ram_addr_t hotplugabble_address_space_size =
-        object_property_get_int(OBJECT(machine), PC_MACHINE_DEVMEM_REGION_SIZE,
+        object_property_get_int(OBJECT(machine), MEMORY_DEVICE_REGION_SIZE,
                                 NULL);
 
     srat_start = table_data->len;
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 090f969933..c9ffc8cff6 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -67,6 +67,7 @@
 #include "hw/boards.h"
 #include "acpi-build.h"
 #include "hw/mem/pc-dimm.h"
+#include "hw/mem/memory-device.h"
 #include "qapi/error.h"
 #include "qapi/qapi-visit-common.h"
 #include "qapi/visitor.h"
@@ -2443,7 +2444,7 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
     nc->nmi_monitor_handler = x86_nmi;
     mc->default_cpu_type = TARGET_DEFAULT_CPU_TYPE;
 
-    object_class_property_add(oc, PC_MACHINE_DEVMEM_REGION_SIZE, "int",
+    object_class_property_add(oc, MEMORY_DEVICE_REGION_SIZE, "int",
         pc_machine_get_device_memory_region_size, NULL,
         NULL, NULL, &error_abort);
 
-- 
2.19.1

