Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp174775lfc;
        Tue, 9 Jun 2020 21:56:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxMPgIvsey0HrH1nQHIhQOv5vXiqAbgE1dqwveK2C1N2i6FIdLwnVOEJNnxWkXHpYnCdfIK
X-Received: by 2002:a25:23c4:: with SMTP id j187mr2473648ybj.219.1591764986157;
        Tue, 09 Jun 2020 21:56:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591764986; cv=none;
        d=google.com; s=arc-20160816;
        b=KtU40SJLQ6rf7JuXi2rPH3RHHpEjKhQ1tGaMfRcPO7hzzqcyUaos3701I0MIb0P37R
         lPmvAv/Q0DS6kSMJIweBBDOATJSEmP/wN7vD3kDK6dNDVFu03erwYzhUYoPiQjD9g94m
         epjvt8GPud2e/8MnbPoNbWvl33TkZELRkCwVf25MdZWyzg9WIYEW42mesW0056vi0swi
         b+YoBNFmX6rm5ENoMZbqXUsfFYYtS8GUSRhNfUsJ/8UfcVHTRkGISLjce3Ibc770dpuq
         gPfUFY9+WX83bD5iMZuDKtRJcCpr1aKqspb94E01igBV789G+kOAnG4NHlQaa/7k480G
         xmtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=ezVaZ39w/Zt6S04FtdW+skZfwDczX4yGiWwy5FV/qKo=;
        b=erHlfW6g12kv11DhntM2vJ3YqtJVl2ab/F8ADEwGs5l89u/b2hwPETYRnLbjzeWHyj
         AIUJtPxToNFVzXmWLMGICacZiPwClwAHEHDOw1nZDaf+MtrX0KkFW6rw4YGzCC04QsjU
         kjvqhYcys57w0Xm3sR2rdMgQrOf1QqMGxDZKAGpnGVbdE99XLLZ6+liumY0Cy5gk2dJs
         XMBJrD0F3HwVLB2os0T1K2301vGRPx4JRppb+8P9CFWWS9gzQEzFC6vysU4Tilk/7ZCd
         igzqt44AuWYEOjs1+9UvZE2H3/Cww0h5/hRyIRGIYqvk+hpCITfzr5gpY/6jVFEDakFz
         FoMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=aqm8uv1B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n205si4526643ybf.246.2020.06.09.21.56.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jun 2020 21:56:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=aqm8uv1B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jismn-0000DQ-Cs
	for alex.bennee@linaro.org; Wed, 10 Jun 2020 00:56:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jisNf-000433-2L
 for qemu-arm@nongnu.org; Wed, 10 Jun 2020 00:30:27 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:22954
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jisNc-00005o-3i
 for qemu-arm@nongnu.org; Wed, 10 Jun 2020 00:30:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591763404;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ezVaZ39w/Zt6S04FtdW+skZfwDczX4yGiWwy5FV/qKo=;
 b=aqm8uv1BklEWBH5WZqxVsyZM/lwrkkdq+yQkUx2TOYiZ45kTPeX1sdAOYFckMAab65b/46
 +H6V3HD7ekmCP+w+DL7zf14CD6mF6LmoWVNAsPDkYW9n9K/sgpSWfqlyHrsffh6dkcf1IN
 qypgPdiUgEu8E9HSCCU1xJtb6sOOwYU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-504-HgIoIfQfNkWwRCezt57MUQ-1; Wed, 10 Jun 2020 00:26:42 -0400
X-MC-Unique: HgIoIfQfNkWwRCezt57MUQ-1
Received: by mail-wr1-f72.google.com with SMTP id l18so519155wrm.0
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2020 21:26:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ezVaZ39w/Zt6S04FtdW+skZfwDczX4yGiWwy5FV/qKo=;
 b=K88T1tLptrE+nKrYMP0zZFUPes2Vnyy3ro6uejZurpAHwMUHDAB+jqs7X/xIxfsgOo
 1fqDnFFOeQV9d4ZiCoLLUD3dC/+t13nJ+p9V0WIdah50QUpZdwFQz29BkRkON19sQsvf
 4EcxK4adEM/M4jZT81UMk1iQqeQt6ePkxXlUHI2UQjnEiI4SpgIA7Er0WL7kmgE6wB58
 tMSUy2diQh2AdbAhYahAzwk0OodCygpHZSlIoydKUAZm3PwPkzan+66ozR1dQbNSyGR4
 7V7hzGmm4OXjVCJlhEs05SB50ClNwe7p6+WRkr+NlnH/CUQwc0Qkr0beXDw/9ap+odlL
 KfQw==
X-Gm-Message-State: AOAM5333rZBcUD5XM+sPxySXDuR02OAhOpO/wcA+OfAr5w0lAMHTT766
 uH7mvlSupBmlouMFieJz00cjdKVEoCvqnRX0xuKmVdZUItmBUFe7Ow35fhnLvCc5e7sSEP53LbF
 jyNB4shnx44+3
X-Received: by 2002:a05:600c:4146:: with SMTP id
 h6mr1215479wmm.170.1591763200934; 
 Tue, 09 Jun 2020 21:26:40 -0700 (PDT)
X-Received: by 2002:a05:600c:4146:: with SMTP id
 h6mr1215461wmm.170.1591763200675; 
 Tue, 09 Jun 2020 21:26:40 -0700 (PDT)
Received: from redhat.com (bzq-79-181-55-232.red.bezeqint.net. [79.181.55.232])
 by smtp.gmail.com with ESMTPSA id d18sm6151824wrn.34.2020.06.09.21.26.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2020 21:26:40 -0700 (PDT)
Date: Wed, 10 Jun 2020 00:26:38 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/56] hw/acpi/nvdimm: add a helper to augment SRAT generation
Message-ID: <20200610042613.1459309-4-mst@redhat.com>
References: <20200610042613.1459309-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200610042613.1459309-1-mst@redhat.com>
X-Mailer: git-send-email 2.24.1.751.gd10ce2899c
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/09 23:22:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Jingqi Liu <jingqi.liu@intel.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Igor Mammedov <imammedo@redhat.com>,
 qemu-arm@nongnu.org, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: P9BTDmqM10UH

From: Vishal Verma <vishal.l.verma@intel.com>

NVDIMMs can belong to their own proximity domains, as described by the
NFIT. In such cases, the SRAT needs to have Memory Affinity structures
in the SRAT for these NVDIMMs, otherwise Linux doesn't populate node
data structures properly during NUMA initialization. See the following
for an example failure case.

https://lore.kernel.org/linux-nvdimm/20200416225438.15208-1-vishal.l.verma@intel.com/

Introduce a new helper, nvdimm_build_srat(), and call it for both the
i386 and arm versions of 'build_srat()' to augment the SRAT with
memory affinity information for NVDIMMs.

The relevant command line options to exercise this are below. Nodes 0-1
contain CPUs and regular memory, and nodes 2-3 are the NVDIMM address
space.

    -object memory-backend-ram,id=mem0,size=2048M
    -numa node,nodeid=0,memdev=mem0,
    -numa cpu,node-id=0,socket-id=0
    -object memory-backend-ram,id=mem1,size=2048M
    -numa node,nodeid=1,memdev=mem1,
    -numa cpu,node-id=1,socket-id=1
    -numa node,nodeid=2,
    -object memory-backend-file,id=nvmem0,share,mem-path=nvdimm-0,size=16384M,align=1G
    -device nvdimm,memdev=nvmem0,id=nv0,label-size=2M,node=2
    -numa node,nodeid=3,
    -object memory-backend-file,id=nvmem1,share,mem-path=nvdimm-1,size=16384M,align=1G
    -device nvdimm,memdev=nvmem1,id=nv1,label-size=2M,node=3

Cc: Jingqi Liu <jingqi.liu@intel.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Jingqi Liu <jingqi.liu@intel.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Vishal Verma <vishal.l.verma@intel.com>
Message-Id: <20200606000911.9896-3-vishal.l.verma@intel.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/mem/nvdimm.h  |  1 +
 hw/acpi/nvdimm.c         | 23 +++++++++++++++++++++++
 hw/arm/virt-acpi-build.c |  4 ++++
 hw/i386/acpi-build.c     |  5 +++++
 4 files changed, 33 insertions(+)

diff --git a/include/hw/mem/nvdimm.h b/include/hw/mem/nvdimm.h
index a3c08955e8..b67a1aedf6 100644
--- a/include/hw/mem/nvdimm.h
+++ b/include/hw/mem/nvdimm.h
@@ -155,6 +155,7 @@ typedef struct NVDIMMState NVDIMMState;
 void nvdimm_init_acpi_state(NVDIMMState *state, MemoryRegion *io,
                             struct AcpiGenericAddress dsm_io,
                             FWCfgState *fw_cfg, Object *owner);
+void nvdimm_build_srat(GArray *table_data);
 void nvdimm_build_acpi(GArray *table_offsets, GArray *table_data,
                        BIOSLinker *linker, NVDIMMState *state,
                        uint32_t ram_slots);
diff --git a/hw/acpi/nvdimm.c b/hw/acpi/nvdimm.c
index 9316d12b70..8f7cc16add 100644
--- a/hw/acpi/nvdimm.c
+++ b/hw/acpi/nvdimm.c
@@ -28,6 +28,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/uuid.h"
+#include "qapi/error.h"
 #include "hw/acpi/acpi.h"
 #include "hw/acpi/aml-build.h"
 #include "hw/acpi/bios-linker-loader.h"
@@ -1334,6 +1335,28 @@ static void nvdimm_build_ssdt(GArray *table_offsets, GArray *table_data,
     free_aml_allocator();
 }
 
+void nvdimm_build_srat(GArray *table_data)
+{
+    GSList *device_list = nvdimm_get_device_list();
+
+    for (; device_list; device_list = device_list->next) {
+        AcpiSratMemoryAffinity *numamem = NULL;
+        DeviceState *dev = device_list->data;
+        Object *obj = OBJECT(dev);
+        uint64_t addr, size;
+        int node;
+
+        node = object_property_get_int(obj, PC_DIMM_NODE_PROP, &error_abort);
+        addr = object_property_get_uint(obj, PC_DIMM_ADDR_PROP, &error_abort);
+        size = object_property_get_uint(obj, PC_DIMM_SIZE_PROP, &error_abort);
+
+        numamem = acpi_data_push(table_data, sizeof *numamem);
+        build_srat_memory(numamem, addr, size, node,
+                          MEM_AFFINITY_ENABLED | MEM_AFFINITY_NON_VOLATILE);
+    }
+    g_slist_free(device_list);
+}
+
 void nvdimm_build_acpi(GArray *table_offsets, GArray *table_data,
                        BIOSLinker *linker, NVDIMMState *state,
                        uint32_t ram_slots)
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 1b0a584c7b..2cbccd5fe2 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -539,6 +539,10 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         }
     }
 
+    if (ms->nvdimms_state->is_enabled) {
+        nvdimm_build_srat(table_data);
+    }
+
     if (ms->device_memory) {
         numamem = acpi_data_push(table_data, sizeof *numamem);
         build_srat_memory(numamem, ms->device_memory->base,
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 2e15f6848e..d996525e2c 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2428,6 +2428,11 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
                               MEM_AFFINITY_ENABLED);
         }
     }
+
+    if (machine->nvdimms_state->is_enabled) {
+        nvdimm_build_srat(table_data);
+    }
+
     slots = (table_data->len - numa_start) / sizeof *numamem;
     for (; slots < pcms->numa_nodes + 2; slots++) {
         numamem = acpi_data_push(table_data, sizeof *numamem);
-- 
MST

