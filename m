Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp2042536wro;
        Sun, 4 Nov 2018 18:01:51 -0800 (PST)
X-Google-Smtp-Source: AJdET5cFfmJlQF+FmnXU5rQZI7uvmHFzW17sKdOXkYVKNSY55TXDBf25cLKDwWeTgCXhHF/zeNt7
X-Received: by 2002:a37:a5d1:: with SMTP id o200mr18637283qke.328.1541383311824;
        Sun, 04 Nov 2018 18:01:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541383311; cv=none;
        d=google.com; s=arc-20160816;
        b=ShbHMZ8dybA5CWOcgKzeRjsg/1ID0XFLR2PP7MCw4DC6aENJZQ31QeqCqJ2GN73AEd
         ZxqPWny9vTbRB53Z18eAFRPBy9Q9n+IcUzvKSoGjSSdYv/2keK1ZkpM5UL6Mjaa63FwL
         +TAHJB9nE3LDtCogAIe/P9UZ1+Ss9NQmntdZcvVg5NBVlcxMMEWHTXGtTIMbRcQO8BpA
         zNlDrC0rmLwaew1Et8ckgcbABc9VZV/RWfwQNqHuLgH8yOUXAF72z810wEto7SzrVzBi
         snDfUo1iQrAY+6ieMTBctHFyV4UtBBi01Dks07OixeGOemzTDeoWW9CTPw2YaPBjHv6w
         b5dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=QJpzsUhAjCT2Xdixjj4EcYyniAYm53pDkRmNQjfvW3A=;
        b=HIVhRqPs28oRsKm4mitUgSeZe3fHBOVTDWyz/02n1ipL1pHMON78QeiRtlbH62X4zb
         r0r1/Rp/kQEultwEg8tfYRihVDhHdYmRFfvunuPHpakeM03FW2OYT5gs4Swq997R46PM
         Bp+fm8rKTFRLTeLnnTpk6r5hUkKTNZLXUiu/qSN3YFVP5oOv+OBxRAJsv7JkgGcvVQj+
         +AvxJI2UIb9UgJ7suMuZxaDdbYPDhv6PTkUBX/xxq9dxDCwIP4po7vGYF0io5Gq8kF4H
         DrTj/sFMl6tmhKyD/dszQ1yv57YuaWvmH2s7nksLAGBXPE7VCy9BDHw8TKrLv2NDh1Pa
         8s8A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t2si6167925qva.162.2018.11.04.18.01.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 04 Nov 2018 18:01:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:60970 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gJUD9-0002MQ-7a
	for alex.bennee@linaro.org; Sun, 04 Nov 2018 21:01:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47620)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gJTvp-000147-Iy
	for qemu-devel@nongnu.org; Sun, 04 Nov 2018 20:44:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gJTvj-000415-Dr
	for qemu-devel@nongnu.org; Sun, 04 Nov 2018 20:43:55 -0500
Received: from mga06.intel.com ([134.134.136.31]:29817)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gJTve-0003lB-Pp; Sun, 04 Nov 2018 20:43:47 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Nov 2018 17:43:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,466,1534834800"; d="scan'208";a="277074557"
Received: from emurphy1-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
	([10.252.26.250])
	by fmsmga005.fm.intel.com with ESMTP; 04 Nov 2018 17:43:41 -0800
From: Samuel Ortiz <sameo@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Mon,  5 Nov 2018 02:40:47 +0100
Message-Id: <20181105014047.26447-25-sameo@linux.intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181105014047.26447-1-sameo@linux.intel.com>
References: <20181105014047.26447-1-sameo@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.31
Subject: [Qemu-devel] [PATCH v5 24/24] hw: i386: Refactor PCI host getter
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
Cc: Yang Zhong <yang.zhong@intel.com>, Peter Maydell <peter.maydell@linaro.org>,
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
X-TUID: 0cD3lZJqRqLB

From: Yang Zhong <yang.zhong@intel.com>

Now that the ACPI builder methods are added, we can reach the ACPI
configuration pointer from the MachineState pointer. From there we can
get to the PCI host pointer and return it.

This makes the PCI host getter an ACPI, architecture agnostic function.

Signed-off-by: Yang Zhong <yang.zhong@intel.com>
---
 hw/acpi/aml-build.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index 6112cc2149..b532817fb5 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -22,6 +22,8 @@
 #include "qemu/osdep.h"
 #include <glib/gprintf.h>
 #include "hw/acpi/aml-build.h"
+#include "hw/acpi/builder.h"
+#include "hw/mem/memory-device.h"
 #include "qemu/bswap.h"
 #include "qemu/bitops.h"
 #include "sysemu/numa.h"
@@ -1617,23 +1619,15 @@ void acpi_build_tables_cleanup(AcpiBuildTables *tables, bool mfre)
     g_array_free(tables->vmgenid, mfre);
 }
 
-/*
- * Because of the PXB hosts we cannot simply query TYPE_PCI_HOST_BRIDGE.
- */
 Object *acpi_get_pci_host(void)
 {
-    PCIHostState *host;
+    MachineState *ms = MACHINE(qdev_get_machine());
+    AcpiBuilder *ab = ACPI_BUILDER(ms);
+    AcpiConfiguration *acpi_conf;
 
-    host = OBJECT_CHECK(PCIHostState,
-                        object_resolve_path("/machine/i440fx", NULL),
-                        TYPE_PCI_HOST_BRIDGE);
-    if (!host) {
-        host = OBJECT_CHECK(PCIHostState,
-                            object_resolve_path("/machine/q35", NULL),
-                            TYPE_PCI_HOST_BRIDGE);
-    }
+    acpi_conf = acpi_builder_configuration(ab);
 
-    return OBJECT(host);
+    return OBJECT(acpi_conf->pci_host);
 }
 
 
-- 
2.19.1

