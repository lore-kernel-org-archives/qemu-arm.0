Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp5864532ejb;
        Wed, 22 Mar 2023 16:28:58 -0700 (PDT)
X-Google-Smtp-Source: AK7set+gjuHhtlsiAhxgodDu1n2fDN3cQn1kJ9iJOwVaTnxOEvKUXspsGt9kS/yZ3uOx6a0agaG/
X-Received: by 2002:a05:6214:ca8:b0:5ac:58cc:69d1 with SMTP id s8-20020a0562140ca800b005ac58cc69d1mr9516463qvs.31.1679527737857;
        Wed, 22 Mar 2023 16:28:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1679527737; cv=none;
        d=google.com; s=arc-20160816;
        b=DBv5ccoOS+ZK3JfeuoeAtxMkOK0Nb1+Dw9MK1bSJwqkBbichUDnjG/M+YH8HDEFJtm
         KQ4v2BbEor1E/vJxpFuUZn9xu3mqPbCVebvAbrlt/SUxtaS9xaX8M0tLp9gxrpg3OU8F
         AVHhPsq9bCdwOInPv6/g2wmiRedILRPaIIgW2heKrxiuAAkBQ5MP51+jvzHaoSIWbT65
         2MRcvYhM7KxHnDUzFczWonFMPkDQuDjuZuBog/B90KFZYHnulqTYxJAwNf8C1/tHntVi
         TLJylyPzZFYTQAMtLDB5PuQN3//5d4HojeVMShZtgPW/QQvgB4xrtfmER8J1cj+FSTxl
         0SKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :mime-version:date:dkim-signature;
        bh=U9RzfAwdC/gxJMPtb+q36TGdZaPRjhMiBoZVwsjHAvw=;
        b=hY7cCGM9Xw9ZKeiBbTRF4CJ6QtzWU9LKSO7S0ecNdTklSqDdzYUDSjNZy4K1Z9dmFQ
         fHq9dPFKQ1BzEoq8wfVrpOX36/f772t+Fm0O9ndN0/awTYnk9+vTARvgalQvnYKVRJBc
         FbGKbIcfbk1o8rvSd+ptIiiFJmr+22AlGCWT3G4/MOL00WAC1y9OBsJMoC3cU30XGKKA
         n7+eM8a5eXdeZRu/dHSaaGFe8l3ngzqPH/YVGIfJ+3Xway0mEgsK4tfXg3uV7lho3dxk
         1/QNEWowlVlEOATQp1lEC50CljAT4HSnBBnimTDI1nn7+HzYxFyw35cqFwz81AxnpdN1
         k+1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b="X/WNvaxM";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id er7-20020a056214190700b0056c23bb1597si11490547qvb.88.2023.03.22.16.28.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Mar 2023 16:28:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b="X/WNvaxM";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pf7rT-00058z-KS; Wed, 22 Mar 2023 19:27:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <30o4bZAcKCIU4nw230npxxpun.lxvznv3-j0vwxwpw3.x0p@flex--venture.bounces.google.com>)
 id 1pf7rR-000560-FK
 for qemu-arm@nongnu.org; Wed, 22 Mar 2023 19:27:17 -0400
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <30o4bZAcKCIU4nw230npxxpun.lxvznv3-j0vwxwpw3.x0p@flex--venture.bounces.google.com>)
 id 1pf7rP-0003zd-Of
 for qemu-arm@nongnu.org; Wed, 22 Mar 2023 19:27:17 -0400
Received: by mail-yb1-xb49.google.com with SMTP id
 d7-20020a25adc7000000b00953ffdfbe1aso21280756ybe.23
 for <qemu-arm@nongnu.org>; Wed, 22 Mar 2023 16:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1679527634;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=U9RzfAwdC/gxJMPtb+q36TGdZaPRjhMiBoZVwsjHAvw=;
 b=X/WNvaxMo5d91OD/TYp61ULmwErbPmWkUfNd5f1BkmsI2T1hqwZrhTbT2Y+LNlNYZv
 sZbJ9RNnZTBm4TbP/iozQJXovqo8/He2QbNkLQKM6zKhuoPOnju4UGmYTZHOTlaxO91J
 0vrbyQ81adeRjD0P9Dr7+LoocrZV+MvlXY9gmy1dV0bQ0MquQRMWcJUQYh5Jo4pVKLXF
 O2UHktbikHdIye/t9M+5XbLAEvb6mPpA6HrnErIv4zKjxobGhvzktk8BQz8R8quGeL/u
 tqkHXSIzF3QhyzWUAy17rmlFHOvWdO90EnDiCQRQK5GmDSMyxQ4EyEzF+I8xY70iLKEI
 SUzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679527634;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=U9RzfAwdC/gxJMPtb+q36TGdZaPRjhMiBoZVwsjHAvw=;
 b=P+g7m55tprTXspzhQOpaG2vq7wTUna+QSIyIevYBQREhBt9NFrshY3m61dcQS3Al0S
 BELpmUEoCCPUzmdZU7EOjY9iFjMXnBqy+fikBVqvIU2xzDqY4rgN0GD3UxS636CiOSld
 6YV2WavsqwGTrVdGFvWBFD3owZ64utk/vLxLuTgiMEZFhwblwyeOQ4Cl9C2IR9YwUwiP
 Gt75TEWq0CjyAiYBUGkQva2KKyVZtZe30DJeRAmQhZM25H41A//xwN8rNmc7jt+uJx8v
 dE8khXtqOBfXhaTeT0+ELyJrdbmsGC3qvjzfBeued++PQ0np3Nqk+T9YA75AGO6Q30hb
 iHCA==
X-Gm-Message-State: AAQBX9czzaG/qw52I8fKnlhm2c4OwfaGS3uyWMiNblgQh70vJgFsU6Gy
 hgy6CQ60tFVWog+z4sOGNhxU4gvFQ7Ow
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:201:5585:15f1:5eaf:5462])
 (user=venture job=sendgmr) by 2002:a05:6902:1005:b0:a6b:bc64:a0af with SMTP
 id w5-20020a056902100500b00a6bbc64a0afmr1038599ybt.4.1679527634097; Wed, 22
 Mar 2023 16:27:14 -0700 (PDT)
Date: Wed, 22 Mar 2023 16:27:04 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
Message-ID: <20230322232704.206683-1-venture@google.com>
Subject: [PATCH] hw/arm/virt: support both pl011 and 16550 uart
From: Patrick Venture <venture@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Shu-Chun Weng <scw@google.com>,
 Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=30o4bZAcKCIU4nw230npxxpun.lxvznv3-j0vwxwpw3.x0p@flex--venture.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: BJkBnxfaI9aZ

From: Shu-Chun Weng <scw@google.com>

Select uart for virt machine from pl011 and ns16550a with
-M virt,uart={pl011|ns16550a}.

Signed-off-by: Shu-Chun Weng <scw@google.com>
Signed-off-by: Patrick Venture <venture@google.com>
---
 hw/arm/virt.c         | 85 ++++++++++++++++++++++++++++++++++++++++++-
 include/hw/arm/virt.h |  6 +++
 2 files changed, 89 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index ac626b3bef..84b335a5d7 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -80,6 +80,7 @@
 #include "hw/virtio/virtio-iommu.h"
 #include "hw/char/pl011.h"
 #include "qemu/guest-random.h"
+#include "hw/char/serial.h"
 
 #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
     static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
@@ -847,8 +848,37 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
     }
 }
 
-static void create_uart(const VirtMachineState *vms, int uart,
-                        MemoryRegion *mem, Chardev *chr)
+static void create_uart_ns16550a(const VirtMachineState *vms, int uart,
+                                 MemoryRegion *mem, Chardev *chr)
+{
+    char *nodename;
+    hwaddr base = vms->memmap[uart].base;
+    hwaddr size = vms->memmap[uart].size;
+    int irq = vms->irqmap[uart];
+    const char compat[] = "ns16550a";
+
+    serial_mm_init(get_system_memory(), base, 0,
+                   qdev_get_gpio_in(vms->gic, irq), 19200, serial_hd(0),
+                   DEVICE_LITTLE_ENDIAN);
+
+    nodename = g_strdup_printf("/serial@%" PRIx64, base);
+
+    MachineState *ms = MACHINE(vms);
+
+    qemu_fdt_add_subnode(ms->fdt, nodename);
+    qemu_fdt_setprop(ms->fdt, nodename, "compatible", compat, sizeof(compat));
+    qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "reg", 2, base, 2, size);
+    qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "clock-frequency",
+                                 1, 0x825f0);
+    qemu_fdt_setprop_cells(ms->fdt, nodename, "interrupts",
+                           GIC_FDT_IRQ_TYPE_SPI, irq,
+                           GIC_FDT_IRQ_FLAGS_LEVEL_HI);
+
+    g_free(nodename);
+}
+
+static void create_uart_pl011(const VirtMachineState *vms, int uart,
+                              MemoryRegion *mem, Chardev *chr)
 {
     char *nodename;
     hwaddr base = vms->memmap[uart].base;
@@ -895,6 +925,16 @@ static void create_uart(const VirtMachineState *vms, int uart,
     g_free(nodename);
 }
 
+static void create_uart(const VirtMachineState *vms, int uart,
+                        MemoryRegion *mem, Chardev *chr)
+{
+    if (vms->uart == UART_NS16550A) {
+        create_uart_ns16550a(vms, uart, mem, chr);
+    } else {
+        create_uart_pl011(vms, uart, mem, chr);
+    }
+}
+
 static void create_rtc(const VirtMachineState *vms)
 {
     char *nodename;
@@ -2601,6 +2641,39 @@ static void virt_set_gic_version(Object *obj, const char *value, Error **errp)
     }
 }
 
+static char *virt_get_uart_type(Object *obj, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+    const char *val = NULL;
+
+    switch (vms->uart) {
+    case UART_PL011:
+        val = "pl011";
+        break;
+    case UART_NS16550A:
+        val = "ns16550a";
+        break;
+    default:
+        error_setg(errp, "Invalid uart value");
+    }
+
+    return g_strdup(val);
+}
+
+static void virt_set_uart_type(Object *obj, const char *value, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    if (!strcmp(value, "pl011")) {
+        vms->uart = UART_PL011;
+    } else if (!strcmp(value, "ns16550a")) {
+        vms->uart = UART_NS16550A;
+    } else {
+        error_setg(errp, "Invalid uart type");
+        error_append_hint(errp, "Valid values are pl011, and ns16550a.\n");
+    }
+}
+
 static char *virt_get_iommu(Object *obj, Error **errp)
 {
     VirtMachineState *vms = VIRT_MACHINE(obj);
@@ -3172,6 +3245,14 @@ static void virt_instance_init(Object *obj)
     vms->highmem_compact = !vmc->no_highmem_compact;
     vms->gic_version = VIRT_GIC_VERSION_NOSEL;
 
+    /* Default uart type is pl011 */
+    vms->uart = UART_PL011;
+    object_property_add_str(obj, "uart", virt_get_uart_type,
+                            virt_set_uart_type);
+    object_property_set_description(obj, "uart",
+                                    "Set uart type. "
+                                    "Valid values are pl011 and ns16550a");
+
     vms->highmem_ecam = !vmc->no_highmem_ecam;
     vms->highmem_mmio = true;
     vms->highmem_redists = true;
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index e1ddbea96b..04539f347d 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -122,6 +122,11 @@ typedef enum VirtGICType {
 #define VIRT_GIC_VERSION_3_MASK BIT(VIRT_GIC_VERSION_3)
 #define VIRT_GIC_VERSION_4_MASK BIT(VIRT_GIC_VERSION_4)
 
+typedef enum UartType {
+    UART_PL011,
+    UART_NS16550A,
+} UartType;
+
 struct VirtMachineClass {
     MachineClass parent;
     bool disallow_affinity_adjustment;
@@ -183,6 +188,7 @@ struct VirtMachineState {
     PCIBus *bus;
     char *oem_id;
     char *oem_table_id;
+    UartType uart;
 };
 
 #define VIRT_ECAM_ID(high) (high ? VIRT_HIGH_PCIE_ECAM : VIRT_PCIE_ECAM)
-- 
2.40.0.rc1.284.g88254d51c5-goog

