Received: by 2002:a17:90a:3d4c:0:0:0:0 with SMTP id o12-v6csp2102800pjf;
        Sun, 4 Nov 2018 18:07:06 -0800 (PST)
X-Google-Smtp-Source: AJdET5c98Yga+bex8yMjWj6H3NBs6kv5gyD+y6DQ+TUOlTLJSiL/BjXGojQduTK8i50S49b4RzxU
X-Received: by 2002:aed:34a3:: with SMTP id x32mr9352109qtd.385.1541383625990;
        Sun, 04 Nov 2018 18:07:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541383625; cv=none;
        d=google.com; s=arc-20160816;
        b=bMPXhXQGMWvxZl91diRGxrjNkHOjXRzUzcf4rxMonXnmiNQ/Wi06KN53miUN+kGEkZ
         u3SiTv52IPhM93+oCUjRTFHLxz1vYoPgH0tJU4t+hAUTSkc9oNgZRQWX+l0HKw0DfAXF
         HQj7vcoUJLi5IQjtxFGaAwz1LvJxAGt3JOpFwWVBpxiPC3a2joBOk+oalJY/xGu5WMqR
         gsccQ+5bjYNwwDBdck3npwmVqx9bNFongJEppPW7P6zj2QQk15DT34dGBPOazlI4dpnV
         V3ciYVaB6WtiS0JtgyyonhoMBeYfDcjoP8CXzULwcC35Yd7KnDgaPUNjK6H61/g+WfrX
         vIKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=6pq/yIkqLlBRjOh5wGKadSzZODrcyxkivA/64SYiuYA=;
        b=TJUeZgZDgZ+TcAvuP8lO9r2myTni0fTf+MlU+HL3+fgEkjOzARoPZbLOCnIlGZkmB2
         WIgLDL5ND4lWfHOfyJPy6djY8qvSHrRJ6HmyciOSciPqYHTGCSn7xrX3KZLYtoiNo/v1
         YdQLidKDAZ8JcdldkZM91K4rCxLbUfDD4s0Pr6k8Het6wWbD3z5/u1BrqyiWeAd0l67D
         hauiG4G0z7cpzdAQVcLe28B6+xnicfG7mLCidY5CU6orBmDb1szyN+i7lZdMTwwU4gu+
         0lhLkT5V5p1swZM055odiLRC25ZmisuRKbazZzPYZGrGODIe4mtBbVZ1BhRawZ79lx/Z
         uUzA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s35si3170854qtd.154.2018.11.04.18.07.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 04 Nov 2018 18:07:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:32788 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gJUID-0008HR-Ec
	for alex.bennee@linaro.org; Sun, 04 Nov 2018 21:07:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47352)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gJTvS-0000jM-2d
	for qemu-arm@nongnu.org; Sun, 04 Nov 2018 20:43:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gJTvO-0003Xc-BA
	for qemu-arm@nongnu.org; Sun, 04 Nov 2018 20:43:31 -0500
Received: from mga05.intel.com ([192.55.52.43]:26671)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gJTvG-0003Ia-GP; Sun, 04 Nov 2018 20:43:24 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Nov 2018 17:43:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,466,1534834800"; d="scan'208";a="277074507"
Received: from emurphy1-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
	([10.252.26.250])
	by fmsmga005.fm.intel.com with ESMTP; 04 Nov 2018 17:43:14 -0800
From: Samuel Ortiz <sameo@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Mon,  5 Nov 2018 02:40:42 +0100
Message-Id: <20181105014047.26447-20-sameo@linux.intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181105014047.26447-1-sameo@linux.intel.com>
References: <20181105014047.26447-1-sameo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.43
Subject: [Qemu-arm] [PATCH v5 19/24] hw: acpi: Retrieve the PCI bus from
 AcpiPciHpState
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jing Liu <jing2.liu@linux.intel.com>,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
	Sebastien Boeuf <sebastien.boeuf@intel.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5mSZVpkSSLes

From: Sebastien Boeuf <sebastien.boeuf@intel.com>

Instead of using the machine type specific method find_i440fx() to
retrieve the PCI bus, this commit aims to rely on the fact that the
PCI bus is known by the structure AcpiPciHpState.

When the structure is initialized through acpi_pcihp_init() call,
it saves the PCI bus, which means there is no need to invoke a
special function later on.

Based on the fact that find_i440fx() was only used there, this
patch also removes the function find_i440fx() itself from the
entire codebase.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Sebastien Boeuf <sebastien.boeuf@intel.com>
Signed-off-by: Jing Liu <jing2.liu@linux.intel.com>
---
 include/hw/i386/pc.h  |  1 -
 hw/acpi/pcihp.c       | 10 ++++------
 hw/pci-host/piix.c    |  8 --------
 stubs/pci-host-piix.c |  6 ------
 stubs/Makefile.objs   |  1 -
 5 files changed, 4 insertions(+), 22 deletions(-)
 delete mode 100644 stubs/pci-host-piix.c

diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 44cb6bf3f3..8e5f1464eb 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -255,7 +255,6 @@ PCIBus *i440fx_init(const char *host_type, const char *pci_type,
                     MemoryRegion *pci_memory,
                     MemoryRegion *ram_memory);
 
-PCIBus *find_i440fx(void);
 /* piix4.c */
 extern PCIDevice *piix4_dev;
 int piix4_init(PCIBus *bus, ISABus **isa_bus, int devfn);
diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
index 80d42e12ff..254b2e50ab 100644
--- a/hw/acpi/pcihp.c
+++ b/hw/acpi/pcihp.c
@@ -93,10 +93,9 @@ static void *acpi_set_bsel(PCIBus *bus, void *opaque)
     return bsel_alloc;
 }
 
-static void acpi_set_pci_info(void)
+static void acpi_set_pci_info(AcpiPciHpState *s)
 {
     static bool bsel_is_set;
-    PCIBus *bus;
     unsigned bsel_alloc = ACPI_PCIHP_BSEL_DEFAULT;
 
     if (bsel_is_set) {
@@ -104,10 +103,9 @@ static void acpi_set_pci_info(void)
     }
     bsel_is_set = true;
 
-    bus = find_i440fx(); /* TODO: Q35 support */
-    if (bus) {
+    if (s->root) {
         /* Scan all PCI buses. Set property to enable acpi based hotplug. */
-        pci_for_each_bus_depth_first(bus, acpi_set_bsel, NULL, &bsel_alloc);
+        pci_for_each_bus_depth_first(s->root, acpi_set_bsel, NULL, &bsel_alloc);
     }
 }
 
@@ -213,7 +211,7 @@ static void acpi_pcihp_update(AcpiPciHpState *s)
 
 void acpi_pcihp_reset(AcpiPciHpState *s)
 {
-    acpi_set_pci_info();
+    acpi_set_pci_info(s);
     acpi_pcihp_update(s);
 }
 
diff --git a/hw/pci-host/piix.c b/hw/pci-host/piix.c
index 47293a3915..658460264b 100644
--- a/hw/pci-host/piix.c
+++ b/hw/pci-host/piix.c
@@ -445,14 +445,6 @@ PCIBus *i440fx_init(const char *host_type, const char *pci_type,
     return b;
 }
 
-PCIBus *find_i440fx(void)
-{
-    PCIHostState *s = OBJECT_CHECK(PCIHostState,
-                                   object_resolve_path("/machine/i440fx", NULL),
-                                   TYPE_PCI_HOST_BRIDGE);
-    return s ? s->bus : NULL;
-}
-
 /* PIIX3 PCI to ISA bridge */
 static void piix3_set_irq_pic(PIIX3State *piix3, int pic_irq)
 {
diff --git a/stubs/pci-host-piix.c b/stubs/pci-host-piix.c
deleted file mode 100644
index 6ed81b1f21..0000000000
--- a/stubs/pci-host-piix.c
+++ /dev/null
@@ -1,6 +0,0 @@
-#include "qemu/osdep.h"
-#include "hw/i386/pc.h"
-PCIBus *find_i440fx(void)
-{
-    return NULL;
-}
diff --git a/stubs/Makefile.objs b/stubs/Makefile.objs
index 5dd0aeeec6..725f78bedc 100644
--- a/stubs/Makefile.objs
+++ b/stubs/Makefile.objs
@@ -41,6 +41,5 @@ stub-obj-y += pc_madt_cpu_entry.o
 stub-obj-y += vmgenid.o
 stub-obj-y += xen-common.o
 stub-obj-y += xen-hvm.o
-stub-obj-y += pci-host-piix.o
 stub-obj-y += ram-block.o
 stub-obj-y += ramfb.o
-- 
2.19.1

