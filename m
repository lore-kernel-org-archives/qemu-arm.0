Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1025546lfc;
        Wed, 11 Mar 2020 10:23:44 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtUT6ZGVOdEvBloeqlRS53WFvkUTcsZYU0URhPpza4D5OOcf0DXk8s0QNfERaHKqg7/+ls6
X-Received: by 2002:ad4:448d:: with SMTP id m13mr3723488qvt.114.1583947424650;
        Wed, 11 Mar 2020 10:23:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583947424; cv=none;
        d=google.com; s=arc-20160816;
        b=IQaKjmiLNhw9M7Q7pAJ571jVhAZ+npwUP0Wll0J+p6b22hMTnk57+mZ87NTfwreNGF
         yPiJHbu4NTd1N6W1/T52lwxeM1Isp1SMWd7PTf+tN+4dNhu2IhJFSqd4JLk60xb2L9Fk
         ETr0a+LGrg4ipxt7WQ6+1/B8jWzct3LovgEiaNwuVFwPS4FoeS/KCAPZSL0oZg4jHW2Q
         /c9tk9oOYFRf4nvB3X2NYFfJGm2qAZsXp232IOcjOAF53c+yF69ba65Kl8HyVTSMMJDN
         0q8CPlj4dRAVoeD5tekR9NjP1B9+9kW57Y1jM952yW1VfgwKICktXU9fF+n7FcfuIzIz
         pZqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=IMCjR605yqFyvgHLHbbD4LOI2AFvTmkbxPJnXOMXKek=;
        b=wRye162twQV+W+ydbB0Wq77rGrF+H0qgF5gWMuYaedzfsmTMh1Aa2+slSJMqTZHR6J
         an1CMIK4a54WAXq3K/YovCGLgQCA3ym2gybiowFNwgPI5zzFmv56KTg2k4F7cxB6ixBO
         FDr9nMay80soJy9Cltv+dFWMZMEtIOX/M1nl7XEbCwcrBfx+YgZewRYZO7Xo+aaQQNpk
         /CkdBUWWVpDEip1268hEyj8dOpouKUOTKCanHGQZbnwbVii9LvrE2xsrdqY+qvujaPwA
         N6eMnYfLFXVsowNJbYg4zZFLq7gyg59NYa7SDxwY/IHsFQJTwmieDN0E2jKPcq0fnMxN
         kKgA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k23si1260079qtj.342.2020.03.11.10.23.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Mar 2020 10:23:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jC555-0001os-WC
	for alex.bennee@linaro.org; Wed, 11 Mar 2020 13:23:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57940)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1jC54x-0001ob-O4
 for qemu-arm@nongnu.org; Wed, 11 Mar 2020 13:23:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1jC54w-0003YL-BV
 for qemu-arm@nongnu.org; Wed, 11 Mar 2020 13:23:35 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:3197 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1jC54v-0003Tj-U4; Wed, 11 Mar 2020 13:23:34 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 907E0EED1A18A9D8ED9C;
 Thu, 12 Mar 2020 01:23:29 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.487.0; Thu, 12 Mar 2020 01:23:21 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <imammedo@redhat.com>
Subject: [PATCH v3 02/10] fw_cfg: Migrate ACPI table mr sizes separately
Date: Wed, 11 Mar 2020 17:20:06 +0000
Message-ID: <20200311172014.33052-3-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20200311172014.33052-1-shameerali.kolothum.thodi@huawei.com>
References: <20200311172014.33052-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.190
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
Cc: peter.maydell@linaro.org, xiaoguangrong.eric@gmail.com, david@redhat.com,
 mst@redhat.com, linuxarm@huawei.com, xuwei5@hisilicon.com,
 shannon.zhaosl@gmail.com, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: P9bYPVCGV0ZK

Any sub-page size update to ACPI table MRs will be lost during
migration, as we use aligned size in ram_load_precopy() ->
qemu_ram_resize() path. This will result in inconsistency in sizes
between source and destination. In order to avoid this, save and
restore them separately during migration.

Suggested-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
Please find the discussion here,
https://patchwork.kernel.org/patch/11339591/
---
 hw/core/machine.c         |  1 +
 hw/nvram/fw_cfg.c         | 86 ++++++++++++++++++++++++++++++++++++++-
 include/hw/nvram/fw_cfg.h |  6 +++
 3 files changed, 92 insertions(+), 1 deletion(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 9e8c06036f..6d960bd47f 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -39,6 +39,7 @@ GlobalProperty hw_compat_4_2[] = {
     { "usb-redir", "suppress-remote-wake", "off" },
     { "qxl", "revision", "4" },
     { "qxl-vga", "revision", "4" },
+    { "fw_cfg", "acpi-mr-restore", "false" },
 };
 const size_t hw_compat_4_2_len = G_N_ELEMENTS(hw_compat_4_2);
 
diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
index 179b302f01..36d1e32f83 100644
--- a/hw/nvram/fw_cfg.c
+++ b/hw/nvram/fw_cfg.c
@@ -39,6 +39,7 @@
 #include "qemu/config-file.h"
 #include "qemu/cutils.h"
 #include "qapi/error.h"
+#include "hw/acpi/aml-build.h"
 
 #define FW_CFG_FILE_SLOTS_DFLT 0x20
 
@@ -610,6 +611,50 @@ bool fw_cfg_dma_enabled(void *opaque)
     return s->dma_enabled;
 }
 
+static bool fw_cfg_acpi_mr_restore(void *opaque)
+{
+    FWCfgState *s = opaque;
+    return s->acpi_mr_restore;
+}
+
+static void fw_cfg_update_mr(FWCfgState *s, uint16_t key, size_t size)
+{
+    MemoryRegion *mr;
+    ram_addr_t offset;
+    int arch = !!(key & FW_CFG_ARCH_LOCAL);
+    void *ptr;
+
+    key &= FW_CFG_ENTRY_MASK;
+    assert(key < fw_cfg_max_entry(s));
+
+    ptr = s->entries[arch][key].data;
+    mr = memory_region_from_host(ptr, &offset);
+
+    memory_region_ram_resize(mr, size, &error_abort);
+}
+
+static int fw_cfg_acpi_mr_restore_post_load(void *opaque, int version_id)
+{
+    FWCfgState *s = opaque;
+    int i, index;
+
+    assert(s->files);
+
+    index = be32_to_cpu(s->files->count);
+
+    for (i = 0; i < index; i++) {
+        if (!strcmp(s->files->f[i].name, ACPI_BUILD_TABLE_FILE)) {
+            fw_cfg_update_mr(s, FW_CFG_FILE_FIRST + i, s->table_mr_size);
+        } else if (!strcmp(s->files->f[i].name, ACPI_BUILD_LOADER_FILE)) {
+            fw_cfg_update_mr(s, FW_CFG_FILE_FIRST + i, s->linker_mr_size);
+        } else if (!strcmp(s->files->f[i].name, ACPI_BUILD_RSDP_FILE)) {
+            fw_cfg_update_mr(s, FW_CFG_FILE_FIRST + i, s->rsdp_mr_size);
+        }
+    }
+
+    return 0;
+}
+
 static const VMStateDescription vmstate_fw_cfg_dma = {
     .name = "fw_cfg/dma",
     .needed = fw_cfg_dma_enabled,
@@ -619,6 +664,20 @@ static const VMStateDescription vmstate_fw_cfg_dma = {
     },
 };
 
+static const VMStateDescription vmstate_fw_cfg_acpi_mr = {
+    .name = "fw_cfg/acpi_mr",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = fw_cfg_acpi_mr_restore,
+    .post_load = fw_cfg_acpi_mr_restore_post_load,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT64(table_mr_size, FWCfgState),
+        VMSTATE_UINT64(linker_mr_size, FWCfgState),
+        VMSTATE_UINT64(rsdp_mr_size, FWCfgState),
+        VMSTATE_END_OF_LIST()
+    },
+};
+
 static const VMStateDescription vmstate_fw_cfg = {
     .name = "fw_cfg",
     .version_id = 2,
@@ -631,6 +690,7 @@ static const VMStateDescription vmstate_fw_cfg = {
     },
     .subsections = (const VMStateDescription*[]) {
         &vmstate_fw_cfg_dma,
+        &vmstate_fw_cfg_acpi_mr,
         NULL,
     }
 };
@@ -815,6 +875,23 @@ static struct {
 #define FW_CFG_ORDER_OVERRIDE_LAST 200
 };
 
+/*
+ * Any sub-page size update to these table MRs will be lost during migration,
+ * as we use aligned size in ram_load_precopy() -> qemu_ram_resize() path.
+ * In order to avoid the inconsistency in sizes save them seperately and
+ * migrate over in vmstate post_load().
+ */
+static void fw_cfg_acpi_mr_save(FWCfgState *s, const char *filename, size_t len)
+{
+    if (!strcmp(filename, ACPI_BUILD_TABLE_FILE)) {
+        s->table_mr_size = len;
+    } else if (!strcmp(filename, ACPI_BUILD_LOADER_FILE)) {
+        s->linker_mr_size = len;
+    } else if (!strcmp(filename, ACPI_BUILD_RSDP_FILE)) {
+        s->rsdp_mr_size = len;
+    }
+}
+
 static int get_fw_cfg_order(FWCfgState *s, const char *name)
 {
     int i;
@@ -914,6 +991,7 @@ void fw_cfg_add_file_callback(FWCfgState *s,  const char *filename,
     trace_fw_cfg_add_file(s, index, s->files->f[index].name, len);
 
     s->files->count = cpu_to_be32(count+1);
+    fw_cfg_acpi_mr_save(s, filename, len);
 }
 
 void fw_cfg_add_file(FWCfgState *s,  const char *filename,
@@ -937,6 +1015,7 @@ void *fw_cfg_modify_file(FWCfgState *s, const char *filename,
             ptr = fw_cfg_modify_bytes_read(s, FW_CFG_FILE_FIRST + i,
                                            data, len);
             s->files->f[i].size   = cpu_to_be32(len);
+            fw_cfg_acpi_mr_save(s, filename, len);
             return ptr;
         }
     }
@@ -973,7 +1052,10 @@ static void fw_cfg_machine_ready(struct Notifier *n, void *data)
     qemu_register_reset(fw_cfg_machine_reset, s);
 }
 
-
+static Property fw_cfg_properties[] = {
+    DEFINE_PROP_BOOL("acpi-mr-restore", FWCfgState, acpi_mr_restore, true),
+    DEFINE_PROP_END_OF_LIST(),
+};
 
 static void fw_cfg_common_realize(DeviceState *dev, Error **errp)
 {
@@ -1097,6 +1179,8 @@ static void fw_cfg_class_init(ObjectClass *klass, void *data)
 
     dc->reset = fw_cfg_reset;
     dc->vmsd = &vmstate_fw_cfg;
+
+    device_class_set_props(dc, fw_cfg_properties);
 }
 
 static const TypeInfo fw_cfg_info = {
diff --git a/include/hw/nvram/fw_cfg.h b/include/hw/nvram/fw_cfg.h
index b5291eefad..457fee7425 100644
--- a/include/hw/nvram/fw_cfg.h
+++ b/include/hw/nvram/fw_cfg.h
@@ -53,6 +53,12 @@ struct FWCfgState {
     dma_addr_t dma_addr;
     AddressSpace *dma_as;
     MemoryRegion dma_iomem;
+
+    /* restore during migration */
+    bool acpi_mr_restore;
+    size_t table_mr_size;
+    size_t linker_mr_size;
+    size_t rsdp_mr_size;
 };
 
 struct FWCfgIoState {
-- 
2.17.1


