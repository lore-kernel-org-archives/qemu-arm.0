Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp540838lff;
        Thu, 12 Aug 2021 10:01:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx7lY1ncEEilSlWca3o9NQHwLZSyst2qo6aC1+qvTThUq2cDJ1arofThl3PO86ToSO90i1p
X-Received: by 2002:a05:6402:214d:: with SMTP id bq13mr6570637edb.263.1628787662797;
        Thu, 12 Aug 2021 10:01:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628787662; cv=none;
        d=google.com; s=arc-20160816;
        b=MCAs67iTtVq9jeu+3J6SYEiXiohw8FmpBTaxZ6cyHQVg5wuhceBCFKU7XUOzgJLE1/
         1kQjC78K5bU4Og2TWJulV+WV1EKUlA0OMz3y4rVJCmVi4GNkZ4Riv2Hxi48tgMQmD4ey
         jM0YmYUcnwQEJNXRB1ddbSNbQkDX0euvMdr5sb8Yag9FgJC8ZJeJ12I22Rcv10ctMKnj
         YM7+nyFHSqrHQ3WxR989bDAlsBoJ2/mkWUwBlB+GVBeHU5HQSPQG1GXbPE9a61mSWj/b
         CY6Yvxm/XM1t+OsZrdlYdQa8BVNQ+OUorXrhYNAj1QXHScFJbjXx7dWD4FSN9puIGJHd
         tlHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=vRtkRSWJCX6tGhWs/vBYUaAykj6RF3z+5UwVziTK5vE=;
        b=uO5Jk2pnnzDLBieKs6jzh4K8/yvEtHbLYlMqJsbaDOA58nnMtF6bNQJDsS8o/qAzbM
         WZfLwllr0lLHZNe7uYetWkS9HCYrC9O7y4P6fEUs+I9eI7X8Gl5rnuCgXc+AQcqSkuR1
         oKIsCUayJsTk1xBjHY4NRKOKBVWnp49IcvRs9fuo6EDs7ILy64HGF/xIn4KIU67RTXdC
         GKxE8b0K7SnNBuanIxVnyJsjyBeyZ8mNuHGEH0g2FvbIW24yWv35Cz2EpNjIUNm5JFqY
         k1DB9IuBNSyGv7TEz12g5UNJkZHxjhMaVnv+GtByJx2MNhR51PHCujrv7HCZ4bor4pIx
         ug8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=W8B9Go45;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c24si4208009edx.510.2021.08.12.10.01.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Aug 2021 10:01:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=W8B9Go45;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mEE4j-000344-No
	for alex.bennee@linaro.org; Thu, 12 Aug 2021 13:01:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1mEDxw-0007rM-43
 for qemu-arm@nongnu.org; Thu, 12 Aug 2021 12:54:00 -0400
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835]:39842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1mEDxo-000644-HY
 for qemu-arm@nongnu.org; Thu, 12 Aug 2021 12:53:59 -0400
Received: by mail-qt1-x835.google.com with SMTP id d2so5763039qto.6
 for <qemu-arm@nongnu.org>; Thu, 12 Aug 2021 09:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vRtkRSWJCX6tGhWs/vBYUaAykj6RF3z+5UwVziTK5vE=;
 b=W8B9Go45SNr3Y4Il2IFXLfCrCA8/6jE67+Rmp8c+OEdUScuC3zvbtwAElkEgp6blE2
 TsIyaX1pSFCtxY36+jKVw/9+WJiTfs16Tm+GHOwEPK1drrwL0mr7yqtQ2JF7J8xqzYcn
 g3V3OwNQ4mDDPvxzfK0wWPUvE8StQ0a3DWIK3xlRr2HHm3Lgf2oHOBs0SyPB0p3raeS0
 SK33Zxe7vA6ayYmdbi5g05jXBOiFQij6kA5hSrXeOYdbyl5kUdYCOA9Ko1L+gQqKo6Oq
 mt83xVp+dQxJpe2ccKm29/TS+AqPF+JvMifwY7gYPNfr5LRW9LLfTm/USoFltMMVJGQG
 qaKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vRtkRSWJCX6tGhWs/vBYUaAykj6RF3z+5UwVziTK5vE=;
 b=A+h8qmU18ixY7fSAwZvZWCm/pQ08cRpKz3fDklLRWMV7C59tNa/H8qur2dJCKUv5xB
 vBmWWTtuEr5nBH6GUqBY7H7ngN2fdhM3FCQzLBd3IwIHu32HblQrhXlk6OgpMGv53nea
 Q8csJGF5iuN0bymohidJGtjDvWMnNdRGq7tl6YRjbnocXzZbiDl1u+HF5xjN9QAeihqO
 ogUlcZHjURL3e1erQ2z5IuWHP+OHjEGJqQUg02PSH6mhzKEzZ0PUm67J42dbMqDttRHU
 5Q4f8mtNKQgH7zlBN1/GgK4hWqnQw6TKvGtEDBS0ijud7Hfpbs7pd18GGaCQ5NIp5erb
 LAOg==
X-Gm-Message-State: AOAM530dQFOjAQwkmff3C7KEhk8Tmqrd6dTkGU4WV7fCQmaGSJTUVkvx
 mqRSf5grWxtD6j4Ybxw5BkBhMg==
X-Received: by 2002:a05:622a:1998:: with SMTP id
 u24mr4744800qtc.40.1628787231439; 
 Thu, 12 Aug 2021 09:53:51 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-22-142-114-143-47.dsl.bell.ca. [142.114.143.47])
 by smtp.googlemail.com with ESMTPSA id c69sm1714864qkg.1.2021.08.12.09.53.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 09:53:51 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org, leif@nuviainc.com, rad@semihalf.com,
 mst@redhat.com, imammedo@redhat.com
Subject: [PATCH v8 07/10] hw/arm/sbsa-ref: add ITS support in SBSA GIC
Date: Thu, 12 Aug 2021 12:53:38 -0400
Message-Id: <20210812165341.40784-8-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210812165341.40784-1-shashi.mallela@linaro.org>
References: <20210812165341.40784-1-shashi.mallela@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::835;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qt1-x835.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: eric.auger@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 narmstrong@baylibre.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Z2GM4asjuxXJ

Included creation of ITS as part of SBSA platform GIC
initialization.

Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
---
 hw/arm/sbsa-ref.c | 79 ++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 75 insertions(+), 4 deletions(-)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index c1629df603..feadae2f33 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -34,7 +34,7 @@
 #include "hw/boards.h"
 #include "hw/ide/internal.h"
 #include "hw/ide/ahci_internal.h"
-#include "hw/intc/arm_gicv3_common.h"
+#include "hw/intc/arm_gicv3_its_common.h"
 #include "hw/loader.h"
 #include "hw/pci-host/gpex.h"
 #include "hw/qdev-properties.h"
@@ -58,12 +58,26 @@
 #define ARCH_TIMER_NS_EL1_IRQ  14
 #define ARCH_TIMER_NS_EL2_IRQ  10
 
+/*
+ * Enumeration of the possible values of sbsa-ref version
+ * property. These are arbitrary QEMU-internal values.
+ * values are :-
+ * DEFAULT = without ITS memory map
+ * SBSA_GIC_ITS = with ITS memory map between distributor & redistributor
+ *                regions. This is the current version supported.
+ */
+typedef enum SbsaRefVersion {
+    SBSA_DEFAULT,
+    SBSA_ITS,
+} SbsaRefVersion;
+
 enum {
     SBSA_FLASH,
     SBSA_MEM,
     SBSA_CPUPERIPHS,
     SBSA_GIC_DIST,
     SBSA_GIC_REDIST,
+    SBSA_GIC_ITS,
     SBSA_SECURE_EC,
     SBSA_GWDT,
     SBSA_GWDT_REFRESH,
@@ -91,6 +105,7 @@ struct SBSAMachineState {
     void *fdt;
     int fdt_size;
     int psci_conduit;
+    SbsaRefVersion version;
     DeviceState *gic;
     PFlashCFI01 *flash[2];
 };
@@ -105,8 +120,11 @@ static const MemMapEntry sbsa_ref_memmap[] = {
     [SBSA_SECURE_MEM] =         { 0x20000000, 0x20000000 },
     /* Space reserved for CPU peripheral devices */
     [SBSA_CPUPERIPHS] =         { 0x40000000, 0x00040000 },
+    /* GIC components reserved space Start */
     [SBSA_GIC_DIST] =           { 0x40060000, 0x00010000 },
-    [SBSA_GIC_REDIST] =         { 0x40080000, 0x04000000 },
+    [SBSA_GIC_ITS] =            { 0x40070000, 0x00020000 },
+    [SBSA_GIC_REDIST] =         { 0x400B0000, 0x04000000 },
+    /* GIC components reserved space End */
     [SBSA_SECURE_EC] =          { 0x50000000, 0x00001000 },
     [SBSA_GWDT_REFRESH] =       { 0x50010000, 0x00001000 },
     [SBSA_GWDT_CONTROL] =       { 0x50011000, 0x00001000 },
@@ -377,7 +395,20 @@ static void create_secure_ram(SBSAMachineState *sms,
     memory_region_add_subregion(secure_sysmem, base, secram);
 }
 
-static void create_gic(SBSAMachineState *sms)
+static void create_its(SBSAMachineState *sms)
+{
+    DeviceState *dev;
+
+    dev = qdev_new(TYPE_ARM_GICV3_ITS);
+    SysBusDevice *s = SYS_BUS_DEVICE(dev);
+
+    object_property_set_link(OBJECT(dev), "parent-gicv3", OBJECT(sms->gic),
+                             &error_abort);
+    sysbus_realize_and_unref(s, &error_fatal);
+    sysbus_mmio_map(s, 0, sbsa_ref_memmap[SBSA_GIC_ITS].base);
+}
+
+static void create_gic(SBSAMachineState *sms, MemoryRegion *mem)
 {
     unsigned int smp_cpus = MACHINE(sms)->smp.cpus;
     SysBusDevice *gicbusdev;
@@ -404,6 +435,10 @@ static void create_gic(SBSAMachineState *sms)
     qdev_prop_set_uint32(sms->gic, "len-redist-region-count", 1);
     qdev_prop_set_uint32(sms->gic, "redist-region-count[0]", redist0_count);
 
+    object_property_set_link(OBJECT(sms->gic), "sysmem", OBJECT(mem),
+                                 &error_fatal);
+    qdev_prop_set_bit(sms->gic, "has-lpi", true);
+
     gicbusdev = SYS_BUS_DEVICE(sms->gic);
     sysbus_realize_and_unref(gicbusdev, &error_fatal);
     sysbus_mmio_map(gicbusdev, 0, sbsa_ref_memmap[SBSA_GIC_DIST].base);
@@ -450,6 +485,7 @@ static void create_gic(SBSAMachineState *sms)
         sysbus_connect_irq(gicbusdev, i + 3 * smp_cpus,
                            qdev_get_gpio_in(cpudev, ARM_CPU_VFIQ));
     }
+    create_its(sms);
 }
 
 static void create_uart(const SBSAMachineState *sms, int uart,
@@ -755,7 +791,7 @@ static void sbsa_ref_init(MachineState *machine)
 
     create_secure_ram(sms, secure_sysmem);
 
-    create_gic(sms);
+    create_gic(sms, sysmem);
 
     create_uart(sms, SBSA_UART, sysmem, serial_hd(0));
     create_uart(sms, SBSA_SECURE_UART, secure_sysmem, serial_hd(1));
@@ -825,10 +861,39 @@ sbsa_ref_get_default_cpu_node_id(const MachineState *ms, int idx)
     return idx % ms->numa_state->num_nodes;
 }
 
+static char *sbsa_get_version(Object *obj, Error **errp)
+{
+    SBSAMachineState *sms = SBSA_MACHINE(obj);
+
+    switch (sms->version) {
+    case SBSA_DEFAULT:
+        return g_strdup("default");
+    case SBSA_ITS:
+        return g_strdup("sbsaits");
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void sbsa_set_version(Object *obj, const char *value, Error **errp)
+{
+    SBSAMachineState *sms = SBSA_MACHINE(obj);
+
+    if (!strcmp(value, "sbsaits")) {
+        sms->version = SBSA_ITS;
+    } else if (!strcmp(value, "default")) {
+        sms->version = SBSA_DEFAULT;
+    } else {
+        error_setg(errp, "Invalid version value");
+        error_append_hint(errp, "Valid values are default, sbsaits.\n");
+    }
+}
+
 static void sbsa_ref_instance_init(Object *obj)
 {
     SBSAMachineState *sms = SBSA_MACHINE(obj);
 
+    sms->version = SBSA_ITS;
     sbsa_flash_create(sms);
 }
 
@@ -850,6 +915,12 @@ static void sbsa_ref_class_init(ObjectClass *oc, void *data)
     mc->possible_cpu_arch_ids = sbsa_ref_possible_cpu_arch_ids;
     mc->cpu_index_to_instance_props = sbsa_ref_cpu_index_to_props;
     mc->get_default_cpu_node_id = sbsa_ref_get_default_cpu_node_id;
+
+    object_class_property_add_str(oc, "version", sbsa_get_version,
+                                  sbsa_set_version);
+    object_class_property_set_description(oc, "version",
+                                          "Set the Version type. "
+                                          "Valid values are default & sbsaits");
 }
 
 static const TypeInfo sbsa_ref_info = {
-- 
2.27.0

