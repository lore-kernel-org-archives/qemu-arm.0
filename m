Received: by 2002:a17:90a:ad88:0:0:0:0 with SMTP id s8csp6807932pjq;
        Mon, 27 May 2019 07:42:40 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzY1Y9ShBQKHuxEiv4ZhaRl7/34wzeHzp9AeEZVCRJFH/jXoiwQ4k78zp1iF5nJCjGtAWb4
X-Received: by 2002:ab0:60d0:: with SMTP id g16mr41592573uam.85.1558968160150;
        Mon, 27 May 2019 07:42:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558968160; cv=none;
        d=google.com; s=arc-20160816;
        b=l3YgGwdmO/ow8yqisyRmH0iSB86bHRFuqWedgbE7N6m9uE0QGSeftbA4vWSiayRNng
         w0B39yY7fE4VDhn464hyCPYZXWrNELLVkveBfiFe9TPrVimSdJPEZ7VfFYU5+ZvRoCnw
         lOa+A9Hsk9xsMi42MdAfDHqV93dzbjmYT2leeRT4vGuEcZQhizRCfAlDQuT6VR7jHMaB
         wEHKSywpBadpJsWyI0XV+S8WcmJPSMb3U+6UYCnyaKN2h5A4TdAwZ/msC7cmEtYEgY4q
         xRH4Zv/wKr4Ma3bWs/llTHTdlHk5ui+NCbx6Lu44Z5hUzskI8resBPQyCiOn0NY8f83b
         k+sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=IRdKdA0ihoTw5HXlsjxMeer6HU7IxMuNzipstJAFcxo=;
        b=hB/XmCAL/0+t49t+BolvNNdAGnV+K5UAUHTtLtl7vUfoDeML8i5IlabnqY3UoljIdt
         w5PORsTbjCUa50UH4pDK8vd3lE8X4MluLVtAtMUcZKkWHoTSRsVa68CWOejuH15QRJ9Y
         wgKzhZnHlfF2ODaXDc3CWEmpynX0QXS4vhpw+YSRb8XtXn13FZvG+XGYNrotdU7YbKYN
         jN/spNENPalDtHDjNAL8kFJpzWbU/xPKA5e5OM8mtmHttBMhQnZIaY3Fdcn1AsELGTfY
         ITm4q3o5t/X9c6x28q7RFikD1ZmRskxm6ra4gQsFDqnRfu/XM4q3pfprvDDc5Mg5g08F
         svSg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m20si4245395uab.31.2019.05.27.07.42.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 27 May 2019 07:42:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:46789 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hVGpj-0007T0-MH
	for alex.bennee@linaro.org; Mon, 27 May 2019 10:42:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48137)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1hVGpQ-0007Ri-DW
	for qemu-arm@nongnu.org; Mon, 27 May 2019 10:42:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1hVGpO-0000ac-Oy
	for qemu-arm@nongnu.org; Mon, 27 May 2019 10:42:20 -0400
Received: from mail-vk1-f194.google.com ([209.85.221.194]:44665)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <mst@redhat.com>) id 1hVGpO-0000PJ-Ld
	for qemu-arm@nongnu.org; Mon, 27 May 2019 10:42:18 -0400
Received: by mail-vk1-f194.google.com with SMTP id j4so3869499vke.11
	for <qemu-arm@nongnu.org>; Mon, 27 May 2019 07:42:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=IRdKdA0ihoTw5HXlsjxMeer6HU7IxMuNzipstJAFcxo=;
	b=Y01tQnfq2ihAwsSBOR1iWa2+a5CIV7wG9V1dT8q00L7heWwHG9R6inob2KQygWcgZS
	urMsyK5Yf4PIEkViV9uqLSNrBKzsf4hFn7IpZjBT1gssl3B/6KopkKAhQzQmrux8UzgE
	cRC/fRfAd0Pj6gjrdsgaJ0Pt2LEJDRbBHYcrta3OSfVoUTeu2Ug+lJQezLkPkbDPpvhM
	qqYR+mW9SedyMJJreeE5HNaE2jlWMXNB4SQWgCJz1z+IKnUjkxV43h5mqxFUzdWY9+zt
	imd20jLZTepiHbG2+qTkodghYsTFnBNqv1s6uRfg6KNd/I6SOWbEzla30CVgDrf5zsMh
	MigQ==
X-Gm-Message-State: APjAAAW67IeMMuNMTXG/uu9aPJoD6rAw17P7wv1eNQoO5U+3NMnSbsmS
	qMuifSbJ9PAWonSzt0/ORMTZsw==
X-Received: by 2002:ac5:cb04:: with SMTP id r4mr19778974vkl.6.1558968121792;
	Mon, 27 May 2019 07:42:01 -0700 (PDT)
Received: from redhat.com (pool-100-0-197-103.bstnma.fios.verizon.net.
	[100.0.197.103]) by smtp.gmail.com with ESMTPSA id
	n132sm11389617vke.18.2019.05.27.07.41.58
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 27 May 2019 07:42:00 -0700 (PDT)
Date: Mon, 27 May 2019 10:41:57 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Message-ID: <20190527104131-mutt-send-email-mst@kernel.org>
References: <20190326024320.27895-1-richardw.yang@linux.intel.com>
	<20190527023423.GA9136@richard>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190527023423.GA9136@richard>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.194
Subject: Re: [Qemu-arm] [PATCH v6] hw/acpi: extract acpi_add_rom_blob()
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
Cc: yang.zhong@intel.com, peter.maydell@linaro.org, qemu-devel@nongnu.org,
	shannon.zhaosl@gmail.com, qemu-arm@nongnu.org, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ufegxAnFNfDz

On Mon, May 27, 2019 at 10:34:23AM +0800, Wei Yang wrote:
> On Tue, Mar 26, 2019 at 10:43:20AM +0800, Wei Yang wrote:
> >arm and i386 has almost the same function acpi_add_rom_blob(), except
> >giving different FWCfgCallback function.
> >
> >This patch moves acpi_add_rom_blob() to utils.c by passing
> >FWCfgCallback to it.
> >
> >Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
> >Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> >
> 
> Hello~ would this one be picked up?


Yes in the next pull. It's a holiday here in states -
hopefully tomorrow.

> >---
> >v6:
> >  * change author from Igor to Michael
> >v5:
> >  * remove unnecessary header glib/gprintf.h
> >  * rearrange include header to make it more suitable
> >v4:
> >  * extract -> moves
> >  * adjust comment in source to make checkpatch happy
> >v3:
> >  * put acpi_add_rom_blob() to hw/acpi/utils.c
> >v2:
> >  * remove unused header in original source file
> >
> >author
> >---
> > hw/acpi/Makefile.objs    |  2 +-
> > hw/acpi/utils.c          | 36 ++++++++++++++++++++++++++++++++++++
> > hw/arm/virt-acpi-build.c | 26 ++++++++++----------------
> > hw/i386/acpi-build.c     | 26 ++++++++++----------------
> > include/hw/acpi/utils.h  |  9 +++++++++
> > 5 files changed, 66 insertions(+), 33 deletions(-)
> > create mode 100644 hw/acpi/utils.c
> > create mode 100644 include/hw/acpi/utils.h
> >
> >diff --git a/hw/acpi/Makefile.objs b/hw/acpi/Makefile.objs
> >index 2d46e3789a..ba93c5b64a 100644
> >--- a/hw/acpi/Makefile.objs
> >+++ b/hw/acpi/Makefile.objs
> >@@ -10,7 +10,7 @@ common-obj-$(call lnot,$(CONFIG_ACPI_X86)) += acpi-stub.o
> > 
> > common-obj-y += acpi_interface.o
> > common-obj-y += bios-linker-loader.o
> >-common-obj-y += aml-build.o
> >+common-obj-y += aml-build.o utils.o
> > common-obj-$(CONFIG_TPM) += tpm.o
> > 
> > common-obj-$(CONFIG_IPMI) += ipmi.o
> >diff --git a/hw/acpi/utils.c b/hw/acpi/utils.c
> >new file mode 100644
> >index 0000000000..77b9e8148f
> >--- /dev/null
> >+++ b/hw/acpi/utils.c
> >@@ -0,0 +1,36 @@
> >+/*
> >+ * Utilities for generating ACPI tables and passing them to Guests
> >+ *
> >+ * Copyright (C) 2019 Intel Corporation
> >+ * Copyright (C) 2019 Red Hat Inc
> >+ *
> >+ * Author: Wei Yang <richardw.yang@linux.intel.com>
> >+ * Author: Michael S. Tsirkin <mst@redhat.com>
> >+ *
> >+ * This program is free software; you can redistribute it and/or modify
> >+ * it under the terms of the GNU General Public License as published by
> >+ * the Free Software Foundation; either version 2 of the License, or
> >+ * (at your option) any later version.
> >+
> >+ * This program is distributed in the hope that it will be useful,
> >+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
> >+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> >+ * GNU General Public License for more details.
> >+
> >+ * You should have received a copy of the GNU General Public License along
> >+ * with this program; if not, see <http://www.gnu.org/licenses/>.
> >+ */
> >+
> >+#include "qemu/osdep.h"
> >+#include "hw/acpi/aml-build.h"
> >+#include "hw/acpi/utils.h"
> >+#include "hw/loader.h"
> >+
> >+MemoryRegion *acpi_add_rom_blob(FWCfgCallback update, void *opaque,
> >+                                GArray *blob, const char *name,
> >+                                uint64_t max_size)
> >+{
> >+    return rom_add_blob(name, blob->data, acpi_data_len(blob), max_size, -1,
> >+                        name, update, opaque, NULL, true);
> >+}
> >+
> >diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> >index 57679a89bf..a846f74a14 100644
> >--- a/hw/arm/virt-acpi-build.c
> >+++ b/hw/arm/virt-acpi-build.c
> >@@ -37,9 +37,9 @@
> > #include "hw/acpi/acpi.h"
> > #include "hw/nvram/fw_cfg.h"
> > #include "hw/acpi/bios-linker-loader.h"
> >-#include "hw/loader.h"
> > #include "hw/hw.h"
> > #include "hw/acpi/aml-build.h"
> >+#include "hw/acpi/utils.h"
> > #include "hw/pci/pcie_host.h"
> > #include "hw/pci/pci.h"
> > #include "hw/arm/virt.h"
> >@@ -881,14 +881,6 @@ static void virt_acpi_build_reset(void *build_opaque)
> >     build_state->patched = false;
> > }
> > 
> >-static MemoryRegion *acpi_add_rom_blob(AcpiBuildState *build_state,
> >-                                       GArray *blob, const char *name,
> >-                                       uint64_t max_size)
> >-{
> >-    return rom_add_blob(name, blob->data, acpi_data_len(blob), max_size, -1,
> >-                        name, virt_acpi_build_update, build_state, NULL, true);
> >-}
> >-
> > static const VMStateDescription vmstate_virt_acpi_build = {
> >     .name = "virt_acpi_build",
> >     .version_id = 1,
> >@@ -920,20 +912,22 @@ void virt_acpi_setup(VirtMachineState *vms)
> >     virt_acpi_build(vms, &tables);
> > 
> >     /* Now expose it all to Guest */
> >-    build_state->table_mr = acpi_add_rom_blob(build_state, tables.table_data,
> >-                                               ACPI_BUILD_TABLE_FILE,
> >-                                               ACPI_BUILD_TABLE_MAX_SIZE);
> >+    build_state->table_mr = acpi_add_rom_blob(virt_acpi_build_update,
> >+                                              build_state, tables.table_data,
> >+                                              ACPI_BUILD_TABLE_FILE,
> >+                                              ACPI_BUILD_TABLE_MAX_SIZE);
> >     assert(build_state->table_mr != NULL);
> > 
> >     build_state->linker_mr =
> >-        acpi_add_rom_blob(build_state, tables.linker->cmd_blob,
> >-                          "etc/table-loader", 0);
> >+        acpi_add_rom_blob(virt_acpi_build_update, build_state,
> >+                          tables.linker->cmd_blob, "etc/table-loader", 0);
> > 
> >     fw_cfg_add_file(vms->fw_cfg, ACPI_BUILD_TPMLOG_FILE, tables.tcpalog->data,
> >                     acpi_data_len(tables.tcpalog));
> > 
> >-    build_state->rsdp_mr = acpi_add_rom_blob(build_state, tables.rsdp,
> >-                                              ACPI_BUILD_RSDP_FILE, 0);
> >+    build_state->rsdp_mr = acpi_add_rom_blob(virt_acpi_build_update,
> >+                                             build_state, tables.rsdp,
> >+                                             ACPI_BUILD_RSDP_FILE, 0);
> > 
> >     qemu_register_reset(virt_acpi_build_reset, build_state);
> >     virt_acpi_build_reset(build_state);
> >diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> >index 416da318ae..b17d4a711d 100644
> >--- a/hw/i386/acpi-build.c
> >+++ b/hw/i386/acpi-build.c
> >@@ -37,7 +37,6 @@
> > #include "hw/acpi/cpu.h"
> > #include "hw/nvram/fw_cfg.h"
> > #include "hw/acpi/bios-linker-loader.h"
> >-#include "hw/loader.h"
> > #include "hw/isa/isa.h"
> > #include "hw/block/fdc.h"
> > #include "hw/acpi/memory_hotplug.h"
> >@@ -58,6 +57,7 @@
> > #include "hw/i386/x86-iommu.h"
> > 
> > #include "hw/acpi/aml-build.h"
> >+#include "hw/acpi/utils.h"
> > 
> > #include "qom/qom-qobject.h"
> > #include "hw/i386/amd_iommu.h"
> >@@ -2842,14 +2842,6 @@ static void acpi_build_reset(void *build_opaque)
> >     build_state->patched = 0;
> > }
> > 
> >-static MemoryRegion *acpi_add_rom_blob(AcpiBuildState *build_state,
> >-                                       GArray *blob, const char *name,
> >-                                       uint64_t max_size)
> >-{
> >-    return rom_add_blob(name, blob->data, acpi_data_len(blob), max_size, -1,
> >-                        name, acpi_build_update, build_state, NULL, true);
> >-}
> >-
> > static const VMStateDescription vmstate_acpi_build = {
> >     .name = "acpi_build",
> >     .version_id = 1,
> >@@ -2891,14 +2883,15 @@ void acpi_setup(void)
> >     acpi_build(&tables, MACHINE(pcms));
> > 
> >     /* Now expose it all to Guest */
> >-    build_state->table_mr = acpi_add_rom_blob(build_state, tables.table_data,
> >-                                               ACPI_BUILD_TABLE_FILE,
> >-                                               ACPI_BUILD_TABLE_MAX_SIZE);
> >+    build_state->table_mr = acpi_add_rom_blob(acpi_build_update,
> >+                                              build_state, tables.table_data,
> >+                                              ACPI_BUILD_TABLE_FILE,
> >+                                              ACPI_BUILD_TABLE_MAX_SIZE);
> >     assert(build_state->table_mr != NULL);
> > 
> >     build_state->linker_mr =
> >-        acpi_add_rom_blob(build_state, tables.linker->cmd_blob,
> >-                          "etc/table-loader", 0);
> >+        acpi_add_rom_blob(acpi_build_update, build_state,
> >+                          tables.linker->cmd_blob, "etc/table-loader", 0);
> > 
> >     fw_cfg_add_file(pcms->fw_cfg, ACPI_BUILD_TPMLOG_FILE,
> >                     tables.tcpalog->data, acpi_data_len(tables.tcpalog));
> >@@ -2935,8 +2928,9 @@ void acpi_setup(void)
> >         build_state->rsdp_mr = NULL;
> >     } else {
> >         build_state->rsdp = NULL;
> >-        build_state->rsdp_mr = acpi_add_rom_blob(build_state, tables.rsdp,
> >-                                                  ACPI_BUILD_RSDP_FILE, 0);
> >+        build_state->rsdp_mr = acpi_add_rom_blob(acpi_build_update,
> >+                                                 build_state, tables.rsdp,
> >+                                                 ACPI_BUILD_RSDP_FILE, 0);
> >     }
> > 
> >     qemu_register_reset(acpi_build_reset, build_state);
> >diff --git a/include/hw/acpi/utils.h b/include/hw/acpi/utils.h
> >new file mode 100644
> >index 0000000000..140b4de603
> >--- /dev/null
> >+++ b/include/hw/acpi/utils.h
> >@@ -0,0 +1,9 @@
> >+#ifndef HW_ACPI_UTILS_H
> >+#define HW_ACPI_UTILS_H
> >+
> >+#include "hw/nvram/fw_cfg.h"
> >+
> >+MemoryRegion *acpi_add_rom_blob(FWCfgCallback update, void *opaque,
> >+                                GArray *blob, const char *name,
> >+                                uint64_t max_size);
> >+#endif
> >-- 
> >2.19.1
> 
> -- 
> Wei Yang
> Help you, Help me
