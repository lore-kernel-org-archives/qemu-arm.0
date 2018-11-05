Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp2039887wro;
        Sun, 4 Nov 2018 17:58:15 -0800 (PST)
X-Google-Smtp-Source: AJdET5fjrcQeES3gK5+jZoghJvCzHTu2PIph+rklTyctM57cJpkHIOijryrROrO1C2bC0zgBrllL
X-Received: by 2002:aed:2a1a:: with SMTP id c26mr7510045qtd.147.1541383095267;
        Sun, 04 Nov 2018 17:58:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541383095; cv=none;
        d=google.com; s=arc-20160816;
        b=DuWt2N43NpAdkH/iqnast7lPxvBlhl2/Xhdxx+DTghhB9qWhr4TtCrHqdrqK0a+qqA
         bLcyrjTh8BQQuobJ7/QHe0d55AQ8p5jS80j7Y9PeTcPfD68YNb80XM7EG/7KTLOkFGn3
         eikgF5u6cIytHBWFH0tn9/ycH20iSiACxJjbPxWXlxTMMCEOcACD2rpbjxoHVh/UFlGD
         Nn1Sgcu/98mIPu1X091R60wL5UE+V0fdTP40MpoTdsZCRTicVP6ZhP4Oy7VOqpOPLEqM
         +iGBcOfoEX8j88yTb/ELfZ0FqUtQ47pKGbhLYRRgaOC4bhyPfvZxkYcQwT8GCltpAwTk
         k/YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=x7XPSFYzsJYlSNWxTmpTJpOs9T5ggglwfb7cfhOQWY8=;
        b=fd+wyBRz2ODR+0stqM5UP5kFAOZODT4+c2pgUBjPJDYUN37TOImNorLkN/Ou0/4QTV
         0gasTtwN8UV6nbc4R2lnxBrlX4hbIMLbfdBLMSf7bDNGej4FvSaSRqGJ2KKiSeRSvxkt
         /6A3tR2RUkjDqJZ4T7oy8HCdNG+U7YqNmDgSgHyYaZKDdQM0hQDTLMZE4IMMpZu5SGHP
         qxDNDoSrurwWIbFXd4LlYPBENFkU8wUEWGjaQY55OL+ToPKZZDtNSaOX9+RYgEV6vNe8
         oITdswQKTD3Nzo8lZFYusGKoY7knpnJio7pn64AlA0JsFXtFBMbYbC7L9HrSbS7Ec03+
         bcxg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u2si145577qtd.231.2018.11.04.17.58.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 04 Nov 2018 17:58:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:60938 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gJU9e-0006D4-M4
	for alex.bennee@linaro.org; Sun, 04 Nov 2018 20:58:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47533)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gJTvi-0000xe-FS
	for qemu-devel@nongnu.org; Sun, 04 Nov 2018 20:43:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gJTvd-0003os-5F
	for qemu-devel@nongnu.org; Sun, 04 Nov 2018 20:43:50 -0500
Received: from mga01.intel.com ([192.55.52.88]:6359)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gJTvc-0003eP-R0; Sun, 04 Nov 2018 20:43:45 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Nov 2018 17:43:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,466,1534834800"; d="scan'208";a="277074531"
Received: from emurphy1-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
	([10.252.26.250])
	by fmsmga005.fm.intel.com with ESMTP; 04 Nov 2018 17:43:30 -0800
From: Samuel Ortiz <sameo@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Mon,  5 Nov 2018 02:40:45 +0100
Message-Id: <20181105014047.26447-23-sameo@linux.intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181105014047.26447-1-sameo@linux.intel.com>
References: <20181105014047.26447-1-sameo@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.88
Subject: [Qemu-devel] [PATCH v5 22/24] hw: pci-host: piix: Return PCI host
 pointer instead of PCI bus
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
X-TUID: KNhCCHKP+0jf

For building the MCFG table, we need to track a given machine
type PCI host pointer, and we can't get it from the bus pointer alone.
As piix returns a PCI bus pointer, we simply modify its builder to
return a PCI host pointer instead.

Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
---
 include/hw/i386/pc.h | 21 +++++++++++----------
 hw/i386/pc_piix.c    | 18 +++++++++++-------
 hw/pci-host/piix.c   | 24 ++++++++++++------------
 3 files changed, 34 insertions(+), 29 deletions(-)

diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 8e5f1464eb..b6b79e146d 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -244,16 +244,17 @@ typedef struct PCII440FXState PCII440FXState;
  */
 #define RCR_IOPORT 0xcf9
 
-PCIBus *i440fx_init(const char *host_type, const char *pci_type,
-                    PCII440FXState **pi440fx_state, int *piix_devfn,
-                    ISABus **isa_bus, qemu_irq *pic,
-                    MemoryRegion *address_space_mem,
-                    MemoryRegion *address_space_io,
-                    ram_addr_t ram_size,
-                    ram_addr_t below_4g_mem_size,
-                    ram_addr_t above_4g_mem_size,
-                    MemoryRegion *pci_memory,
-                    MemoryRegion *ram_memory);
+struct PCIHostState *i440fx_init(const char *host_type, const char *pci_type,
+                                 PCII440FXState **pi440fx_state,
+                                 int *piix_devfn,
+                                 ISABus **isa_bus, qemu_irq *pic,
+                                 MemoryRegion *address_space_mem,
+                                 MemoryRegion *address_space_io,
+                                 ram_addr_t ram_size,
+                                 ram_addr_t below_4g_mem_size,
+                                 ram_addr_t above_4g_mem_size,
+                                 MemoryRegion *pci_memory,
+                                 MemoryRegion *ram_memory);
 
 /* piix4.c */
 extern PCIDevice *piix4_dev;
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 0620d10715..f5b139a3eb 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -32,6 +32,7 @@
 #include "hw/display/ramfb.h"
 #include "hw/smbios/smbios.h"
 #include "hw/pci/pci.h"
+#include "hw/pci/pci_host.h"
 #include "hw/pci/pci_ids.h"
 #include "hw/usb.h"
 #include "net/net.h"
@@ -75,6 +76,7 @@ static void pc_init1(MachineState *machine,
     MemoryRegion *system_memory = get_system_memory();
     MemoryRegion *system_io = get_system_io();
     int i;
+    struct PCIHostState *pci_host;
     PCIBus *pci_bus;
     ISABus *isa_bus;
     PCII440FXState *i440fx_state;
@@ -196,15 +198,17 @@ static void pc_init1(MachineState *machine,
     }
 
     if (pcmc->pci_enabled) {
-        pci_bus = i440fx_init(host_type,
-                              pci_type,
-                              &i440fx_state, &piix3_devfn, &isa_bus, pcms->gsi,
-                              system_memory, system_io, machine->ram_size,
-                              acpi_conf->below_4g_mem_size,
-                              acpi_conf->above_4g_mem_size,
-                              pci_memory, ram_memory);
+        pci_host = i440fx_init(host_type,
+                               pci_type,
+                               &i440fx_state, &piix3_devfn, &isa_bus, pcms->gsi,
+                               system_memory, system_io, machine->ram_size,
+                               acpi_conf->below_4g_mem_size,
+                               acpi_conf->above_4g_mem_size,
+                               pci_memory, ram_memory);
+        pci_bus = pci_host->bus;
         pcms->bus = pci_bus;
     } else {
+        pci_host = NULL;
         pci_bus = NULL;
         i440fx_state = NULL;
         isa_bus = isa_bus_new(NULL, get_system_memory(), system_io,
diff --git a/hw/pci-host/piix.c b/hw/pci-host/piix.c
index 658460264b..4a412db44c 100644
--- a/hw/pci-host/piix.c
+++ b/hw/pci-host/piix.c
@@ -342,17 +342,17 @@ static void i440fx_realize(PCIDevice *dev, Error **errp)
     }
 }
 
-PCIBus *i440fx_init(const char *host_type, const char *pci_type,
-                    PCII440FXState **pi440fx_state,
-                    int *piix3_devfn,
-                    ISABus **isa_bus, qemu_irq *pic,
-                    MemoryRegion *address_space_mem,
-                    MemoryRegion *address_space_io,
-                    ram_addr_t ram_size,
-                    ram_addr_t below_4g_mem_size,
-                    ram_addr_t above_4g_mem_size,
-                    MemoryRegion *pci_address_space,
-                    MemoryRegion *ram_memory)
+struct PCIHostState *i440fx_init(const char *host_type, const char *pci_type,
+                                 PCII440FXState **pi440fx_state,
+                                 int *piix3_devfn,
+                                 ISABus **isa_bus, qemu_irq *pic,
+                                 MemoryRegion *address_space_mem,
+                                 MemoryRegion *address_space_io,
+                                 ram_addr_t ram_size,
+                                 ram_addr_t below_4g_mem_size,
+                                 ram_addr_t above_4g_mem_size,
+                                 MemoryRegion *pci_address_space,
+                                 MemoryRegion *ram_memory)
 {
     DeviceState *dev;
     PCIBus *b;
@@ -442,7 +442,7 @@ PCIBus *i440fx_init(const char *host_type, const char *pci_type,
 
     i440fx_update_memory_mappings(f);
 
-    return b;
+    return s;
 }
 
 /* PIIX3 PCI to ISA bridge */
-- 
2.19.1

