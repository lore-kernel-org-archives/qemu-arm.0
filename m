Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp504220lfc;
        Fri, 12 Jun 2020 07:51:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxtho64UlUr5/JJ+4irsioM82FxSoINyDrO1+v9JC5Czl7ASF80/1d6fEYAc2LHdmMb8W1d
X-Received: by 2002:a25:3782:: with SMTP id e124mr23480830yba.403.1591973486156;
        Fri, 12 Jun 2020 07:51:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591973486; cv=none;
        d=google.com; s=arc-20160816;
        b=1Binm1bBDnjjXV6eWkRZ+TLswZjIOMX7IgGhM3hHljOBOyUYRBntkzAUcJZR7jMGZG
         cH4XaGP0Lh1gyBRblhxzg337QpWSymq5INHWeeQ/yWiAUxiXGWHqFrcXGeIFEoDYzxwu
         bGb7mJRehzHs0vjlSj7qICFivfPltzDXO4dFTI/5Yt1PwgsJqFQVdXR4djvXxGMJOyIq
         lXZOSVDnAveIUp7N7DHhmYSwkaATS6EawyEeerDzgYWpJRno/ediNyDTGI5yNP3jsepp
         A1OFBskY9x4IEGaVqRFcCG7JI7I8Z6nIfB0JCp2w86d4SumYuphYP0qOxk24T4iI+GoG
         ahlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=ezVaZ39w/Zt6S04FtdW+skZfwDczX4yGiWwy5FV/qKo=;
        b=yZP/tV4L/XboPD11f/ck5LPoTgqA+d9AWRMKvWgxGCVhaxc6BctNUwvm1aXjT6JEce
         5yP9gJNSWmlcrJCSyrA/moAnMdk+rk7iF4oUoRE4L8YXa7BViJY/P79+pJK0JD4wSH7i
         kITxQ6k6R2S28D6Jec+fhizgS3oO9Gb+VRvpJFnA03MxtkAIkkV5VXoPatyV+/WiuVVX
         yn5JmQ7+X1QGKHnP9rOdXihYAH60bEDdwoMXdpWVECowCxMfAg/JjvIaXXFn0L24Rq7U
         vc6BhVd4KV7GI1LJgxG6MRDVDeziEaF4BH8Yn9T8ALvEouHXzDgJ0jGk2go7V6lH1nP/
         Lu4w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=AkwGP2a1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k186si4895566ybf.383.2020.06.12.07.51.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 Jun 2020 07:51:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=AkwGP2a1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jjl1h-0005EY-8b
	for alex.bennee@linaro.org; Fri, 12 Jun 2020 10:51:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jjl1Y-0005Cn-1v
 for qemu-arm@nongnu.org; Fri, 12 Jun 2020 10:51:16 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:28625
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jjl1W-0001MH-4a
 for qemu-arm@nongnu.org; Fri, 12 Jun 2020 10:51:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591973472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ezVaZ39w/Zt6S04FtdW+skZfwDczX4yGiWwy5FV/qKo=;
 b=AkwGP2a1BKXZ5vI+/2/vCD9N0Ksek3rbmXEGSa1oXXuIP8+J1bSBT3dMJzrJGr5mBYYvnE
 Rq+wX9hx/lWeLLyMWTJEi1S5EXw+Prc5G/gsatuTUygTyCBHHm9U48SOPO9ncBhB7c2gVm
 Lc9WBFn+XRzC1SYYfZp3wZM9KpCIDOs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-66-VeCVPvm2PWyUvJZEeyBPww-1; Fri, 12 Jun 2020 10:51:10 -0400
X-MC-Unique: VeCVPvm2PWyUvJZEeyBPww-1
Received: by mail-wm1-f71.google.com with SMTP id x6so2544991wmj.9
 for <qemu-arm@nongnu.org>; Fri, 12 Jun 2020 07:51:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ezVaZ39w/Zt6S04FtdW+skZfwDczX4yGiWwy5FV/qKo=;
 b=gM1I2/8PBZfGskGexc+/6lDAJhfRZBLlXfImwpl5RqSJY//h2ZOnh7GFMmE1thNOTC
 IGyYMsYcEI8QpK44yH6e+1pJLhX7YeL1egvbpnlKkRCcUVIndHJ7zX3z6KxXAjYuJC8g
 5MIz9HZ/jhasRbWqTjsOk4wwoe0dqj1UAdT+ZmMmZhirEBYI2byv9rCaKW386PmWc2oY
 Hy39xRvmWtjtv0H/IdIMc7eBArjAsiI8sbCVrS2F/ZDep/RS4tJR6CHJn5j+sLwlhhQW
 5yNx0sHL8xfX1KWqHmpvOvSEQ9/G+qXdOCQKTnCRxjTqEWfw0v0SQGAiTEM5sohN5aVR
 GyIA==
X-Gm-Message-State: AOAM5323vox/2Wuhpq89BYJ//ky//I1gy47KT4dbd3fLUsr1VmGdymVz
 95BDaYOAt18Hnf/cByfqqfmoRVcWeuVMx9FPN/6rsyypdkKVoosTBygN9lbd533dkqKzIJv9hFA
 6TncJDOurzm/v
X-Received: by 2002:a1c:2082:: with SMTP id g124mr14255821wmg.21.1591973469590; 
 Fri, 12 Jun 2020 07:51:09 -0700 (PDT)
X-Received: by 2002:a1c:2082:: with SMTP id g124mr14255796wmg.21.1591973469321; 
 Fri, 12 Jun 2020 07:51:09 -0700 (PDT)
Received: from redhat.com (bzq-79-178-18-124.red.bezeqint.net. [79.178.18.124])
 by smtp.gmail.com with ESMTPSA id y5sm10767253wrs.63.2020.06.12.07.51.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2020 07:51:08 -0700 (PDT)
Date: Fri, 12 Jun 2020 10:51:07 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 03/58] hw/acpi/nvdimm: add a helper to augment SRAT
 generation
Message-ID: <20200612141917.9446-4-mst@redhat.com>
References: <20200612141917.9446-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200612141917.9446-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/12 09:30:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
X-TUID: MxXCOj+BU61F

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

