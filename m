Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp2036349wro;
        Sun, 4 Nov 2018 17:52:25 -0800 (PST)
X-Google-Smtp-Source: AJdET5c/qxMkMyw0g80+E3O/dCVrOozuSF/8D72LAzGGxXD7ZuIaFeMdK63GnJZUmvomy47bN4Ab
X-Received: by 2002:a37:65c5:: with SMTP id z188mr18240660qkb.306.1541382745714;
        Sun, 04 Nov 2018 17:52:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541382745; cv=none;
        d=google.com; s=arc-20160816;
        b=1Cjqhr6ekC4uCBiDhXqh3/DPEmvhafDkleLVSU2K9ZAxf1E0eMi1ZSn3y4adfh7oKe
         pN7Si8Iq3r7781ahDdGSGkkoyUiYMuMXb0zVy3ET0/yHB/Pzb9wkNsDE+7Xammm2sV3c
         0TO8EkthioS7YWiAKyUgmMjfSLIqYAtGANG5uwHaMKVHRd5MfMBbOuqAgKaSEpU2Yhgs
         s/WP9W3gYa8b0KuTggF2yH9VjhHmVI78DrxQpYnlcBF7IR1ECh45Tw041S2b0gsdexj9
         yZjwwZ4ncS48tRYIxY8SAiwD3bTR9cPYM7LDGr5JCh3YeN1t6SERpfjkLA8kTw4ttuqw
         Nj1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=ImQHWqQJodej0c9XFuFsPgJo354/0ZdZHDF6xrGHa88=;
        b=tjim1m2q234qNWA4bL5wKtxmRm1M7uibL1N05wVshF1V8uuO6X1ZkDreepaq6PMF0n
         KkSxm1PS5Arf2JEA/6KpVFcipx72muJF2wjWzVcat7z+noPNDOBUCDPkO3hdgKp+1n3Q
         RJTVrYh00ovgMkr7m7IctZEhILoaE9H1WhMscoR/GNAxaw9RbSwnloHIX27c0AyLzQK7
         LM+OYccPv3rFxBMjdjnG7dGe/g+5qQp7XpU16H7ErOUBAvIFbED5omlyA5MEwW4oXNYy
         cgEKiDJl1hbRChw0JSpRscP9qMgeb9m7EgmxsgxNG+2O18/gM1d58hKxtVd4gMsH0A4M
         w9sw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z59si2644807qtd.264.2018.11.04.17.52.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 04 Nov 2018 17:52:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:60903 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gJU41-00085w-5t
	for alex.bennee@linaro.org; Sun, 04 Nov 2018 20:52:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47416)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gJTvc-0000rX-GE
	for qemu-devel@nongnu.org; Sun, 04 Nov 2018 20:43:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gJTvW-0003ia-N8
	for qemu-devel@nongnu.org; Sun, 04 Nov 2018 20:43:44 -0500
Received: from mga18.intel.com ([134.134.136.126]:8015)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gJTvT-0003UX-5N; Sun, 04 Nov 2018 20:43:36 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Nov 2018 17:43:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,466,1534834800"; d="scan'208";a="277074510"
Received: from emurphy1-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
	([10.252.26.250])
	by fmsmga005.fm.intel.com with ESMTP; 04 Nov 2018 17:43:20 -0800
From: Samuel Ortiz <sameo@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Mon,  5 Nov 2018 02:40:43 +0100
Message-Id: <20181105014047.26447-21-sameo@linux.intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181105014047.26447-1-sameo@linux.intel.com>
References: <20181105014047.26447-1-sameo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.126
Subject: [Qemu-devel] [PATCH v5 20/24] hw: acpi: Define ACPI tables builder
 interface
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
X-TUID: j3MYt3uEtWn/

In order to decouple ACPI APIs from specific machine types, we are
creating an ACPI builder interface that each ACPI platform can choose to
implement.
This way, a new machine type can re-use the high level ACPI APIs and
define some custom table build methods, without having to duplicate most
of the existing implementation only to add small variations to it.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
---
 include/hw/acpi/builder.h | 100 ++++++++++++++++++++++++++++++++++++++
 hw/acpi/builder.c         |  97 ++++++++++++++++++++++++++++++++++++
 hw/acpi/Makefile.objs     |   1 +
 3 files changed, 198 insertions(+)
 create mode 100644 include/hw/acpi/builder.h
 create mode 100644 hw/acpi/builder.c

diff --git a/include/hw/acpi/builder.h b/include/hw/acpi/builder.h
new file mode 100644
index 0000000000..a63b88ffe9
--- /dev/null
+++ b/include/hw/acpi/builder.h
@@ -0,0 +1,100 @@
+/*
+ *
+ * Copyright (c) 2018 Intel Corporation
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef ACPI_BUILDER_H
+#define ACPI_BUILDER_H
+
+#include "qemu/osdep.h"
+#include "hw/acpi/bios-linker-loader.h"
+#include "qom/object.h"
+
+#define TYPE_ACPI_BUILDER "acpi-builder"
+
+#define ACPI_BUILDER_METHODS(klass) \
+     OBJECT_CLASS_CHECK(AcpiBuilderMethods, (klass), TYPE_ACPI_BUILDER)
+#define ACPI_BUILDER_GET_METHODS(obj) \
+     OBJECT_GET_CLASS(AcpiBuilderMethods, (obj), TYPE_ACPI_BUILDER)
+#define ACPI_BUILDER(obj)                                       \
+     INTERFACE_CHECK(AcpiBuilder, (obj), TYPE_ACPI_BUILDER)
+
+typedef struct AcpiConfiguration AcpiConfiguration;
+typedef struct AcpiBuildState AcpiBuildState;
+typedef struct AcpiMcfgInfo AcpiMcfgInfo;
+
+typedef struct AcpiBuilder {
+    /* <private> */
+    Object Parent;
+} AcpiBuilder;
+
+/**
+ * AcpiBuildMethods:
+ *
+ * Interface to be implemented by a machine type that needs to provide
+ * custom ACPI tables build method.
+ *
+ * @parent: Opaque parent interface.
+ * @rsdp: ACPI RSDP (Root System Description Pointer) table build callback.
+ * @madt: ACPI MADT (Multiple APIC Description Table) table build callback.
+ * @mcfg: ACPI MCFG table build callback.
+ * @srat: ACPI SRAT (System/Static Resource Affinity Table)
+ *        table build callback.
+ * @slit: ACPI SLIT (System Locality System Information Table)
+ *        table build callback.
+ * @configuration: ACPI configuration getter.
+ *                 This is used to query the machine instance for its
+ *                 AcpiConfiguration pointer.
+ */
+typedef struct AcpiBuilderMethods {
+    /* <private> */
+    InterfaceClass parent;
+
+    /* <public> */
+    void (*rsdp)(GArray *table_data, BIOSLinker *linker,
+                 unsigned rsdt_tbl_offset);
+    void (*madt)(GArray *table_data, BIOSLinker *linker,
+                 MachineState *ms, AcpiConfiguration *conf);
+    void (*mcfg)(GArray *table_data, BIOSLinker *linker,
+                 AcpiMcfgInfo *info);
+    void (*srat)(GArray *table_data, BIOSLinker *linker,
+                 MachineState *machine, AcpiConfiguration *conf);
+    void (*slit)(GArray *table_data, BIOSLinker *linker);
+
+    AcpiConfiguration *(*configuration)(AcpiBuilder *builder);
+} AcpiBuilderMethods;
+
+void acpi_builder_rsdp(AcpiBuilder *builder,
+                       GArray *table_data, BIOSLinker *linker,
+                       unsigned rsdt_tbl_offset);
+
+void acpi_builder_madt(AcpiBuilder *builder,
+                       GArray *table_data, BIOSLinker *linker,
+                       MachineState *ms, AcpiConfiguration *conf);
+
+void acpi_builder_mcfg(AcpiBuilder *builder,
+                       GArray *table_data, BIOSLinker *linker,
+                       AcpiMcfgInfo *info);
+
+void acpi_builder_srat(AcpiBuilder *builder,
+                       GArray *table_data, BIOSLinker *linker,
+                       MachineState *machine, AcpiConfiguration *conf);
+
+void acpi_builder_slit(AcpiBuilder *builder,
+                       GArray *table_data, BIOSLinker *linker);
+
+AcpiConfiguration *acpi_builder_configuration(AcpiBuilder *builder);
+
+#endif
diff --git a/hw/acpi/builder.c b/hw/acpi/builder.c
new file mode 100644
index 0000000000..c29a614793
--- /dev/null
+++ b/hw/acpi/builder.c
@@ -0,0 +1,97 @@
+/*
+ *
+ * Copyright (c) 2018 Intel Corporation
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/module.h"
+#include "qom/object.h"
+#include "hw/acpi/builder.h"
+
+void acpi_builder_rsdp(AcpiBuilder *builder,
+                       GArray *table_data, BIOSLinker *linker,
+                       unsigned rsdt_tbl_offset)
+{
+    AcpiBuilderMethods *abm = ACPI_BUILDER_GET_METHODS(builder);
+
+    if (abm && abm->rsdp) {
+        abm->rsdp(table_data, linker, rsdt_tbl_offset);
+    }
+}
+
+void acpi_builder_madt(AcpiBuilder *builder,
+                       GArray *table_data, BIOSLinker *linker,
+                       MachineState *ms, AcpiConfiguration *conf)
+{
+    AcpiBuilderMethods *abm = ACPI_BUILDER_GET_METHODS(builder);
+
+    if (abm && abm->madt) {
+        abm->madt(table_data, linker, ms, conf);
+    }
+}
+
+void acpi_builder_mcfg(AcpiBuilder *builder,
+                       GArray *table_data, BIOSLinker *linker,
+                       AcpiMcfgInfo *info)
+{
+    AcpiBuilderMethods *abm = ACPI_BUILDER_GET_METHODS(builder);
+
+    if (abm && abm->mcfg) {
+        abm->mcfg(table_data, linker, info);
+    }
+}
+
+void acpi_builder_srat(AcpiBuilder *builder,
+                       GArray *table_data, BIOSLinker *linker,
+                       MachineState *machine, AcpiConfiguration *conf)
+{
+    AcpiBuilderMethods *abm = ACPI_BUILDER_GET_METHODS(builder);
+
+    if (abm && abm->srat) {
+        abm->srat(table_data, linker, machine, conf);
+    }
+}
+
+void acpi_builder_slit(AcpiBuilder *builder,
+                       GArray *table_data, BIOSLinker *linker)
+{
+    AcpiBuilderMethods *abm = ACPI_BUILDER_GET_METHODS(builder);
+
+    if (abm && abm->slit) {
+        abm->slit(table_data, linker);
+    }
+}
+
+AcpiConfiguration *acpi_builder_configuration(AcpiBuilder *builder)
+{
+    AcpiBuilderMethods *abm = ACPI_BUILDER_GET_METHODS(builder);
+    if (abm && abm->configuration) {
+        return abm->configuration(builder);
+    }
+    return NULL;
+}
+
+static const TypeInfo acpi_builder_info = {
+    .name          = TYPE_ACPI_BUILDER,
+    .parent        = TYPE_INTERFACE,
+    .class_size    = sizeof(AcpiBuilderMethods),
+};
+
+static void acpi_builder_register_type(void)
+{
+    type_register_static(&acpi_builder_info);
+}
+
+type_init(acpi_builder_register_type)
diff --git a/hw/acpi/Makefile.objs b/hw/acpi/Makefile.objs
index 11c35bcb44..2f383adc6f 100644
--- a/hw/acpi/Makefile.objs
+++ b/hw/acpi/Makefile.objs
@@ -11,6 +11,7 @@ common-obj-$(call lnot,$(CONFIG_ACPI_X86)) += acpi-stub.o
 common-obj-y += acpi_interface.o
 common-obj-y += bios-linker-loader.o
 common-obj-y += aml-build.o
+common-obj-y += builder.o
 
 common-obj-$(CONFIG_IPMI) += ipmi.o
 common-obj-$(call lnot,$(CONFIG_IPMI)) += ipmi-stub.o
-- 
2.19.1

