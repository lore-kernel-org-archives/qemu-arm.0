Received: by 2002:ac2:5485:0:0:0:0:0 with SMTP id t5csp2693163lfk;
        Tue, 6 Jul 2021 19:20:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwQkuNigPNTjqnCgboSY5+u+0vePyd49AQTtNhO4PjTCZwDiIvPC3lmNSdeeVhcgXF1DZu8
X-Received: by 2002:a05:6102:9c9:: with SMTP id g9mr18361588vsi.53.1625624427997;
        Tue, 06 Jul 2021 19:20:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625624427; cv=none;
        d=google.com; s=arc-20160816;
        b=g4ZtRwHvyAgTf+WYOQqcBdlLcgktJ51oU2DSMKyJQuONh7cRN3cz+WRDf4PlgSJqHZ
         raFcbL7CUxrkCzf+T2O8kqBV7nLqKMZaIR8iN1cCrtVvKMdJ//L/8qX5LKwN2X4rrRAf
         dPMgU3WTiQqac0oQqjxB7wCXuTgLyEadMWSeD55x94v2lxwoGZjx0JP6iPIwUahvykKf
         5+DHrXBkzvwEO9/yhy21KFebHYxESq6IxEGqZH1CxmGu4n2QHEd8nVo+4HDRwv3tSite
         ypHnHSFBToiwok3o25TZzJZHiOxeEabHL2EuMVfYLTgqAHx4G0e8L5YRkS4/M/uHX1/n
         BKiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=U0or+meyzS1O1E+bq0AooMFJPTAGgN/3BFQxbM2exMk=;
        b=ES7geKvbG2MhKYUgK4O6UCZMXwrY/cojbO9PGzZqrHDTOUY68OoMSbT35x4gBA64v/
         Am+XJuohj2EthwmcMy6UQNRJ8v+YglHYb0OQMG3dVb+/FkSdovNiDl8dAYsItdLIa/aS
         w/gDzVB8tQe+c/ksy7LUG54NbCi9mCKXgEuKl4I4fTNfpV4RTjnVbmaCXA9GY4E+FnKn
         LkJewT7egOQvdtQPjHWMtWERy55fYu+uLxYKuub1wrLywDRdrR6YnCCD1QTRVxhtj4+y
         gdX+WKS5DOujOYQ1E4QXX5uKvrxRlD5GIS8KrpxjQmCg7+Hdzj0TXPATzIPe7kCf2Z0K
         kCZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=L8bfsK2W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n25si5278323uab.71.2021.07.06.19.20.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Jul 2021 19:20:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=L8bfsK2W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m0xAp-0002n7-9R
	for alex.bennee@linaro.org; Tue, 06 Jul 2021 22:20:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1m0x9G-0000aV-6S
 for qemu-arm@nongnu.org; Tue, 06 Jul 2021 22:18:50 -0400
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f]:35608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1m0x8s-0001Ou-0n
 for qemu-arm@nongnu.org; Tue, 06 Jul 2021 22:18:49 -0400
Received: by mail-qt1-x82f.google.com with SMTP id g12so994518qtb.2
 for <qemu-arm@nongnu.org>; Tue, 06 Jul 2021 19:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U0or+meyzS1O1E+bq0AooMFJPTAGgN/3BFQxbM2exMk=;
 b=L8bfsK2W1lCtNYxLqIjZSGzoq0Amq/8Smet3QKQMedPzChA9qX1WGJmemJEehePdF7
 uITI48UYD7A8a7EqQ+K6g5n+GDJnROMeMgABW6FhqO84eGJakJ83xqmlTt8F+0z7RLIy
 bZ9DuEpWrlu/ahkWDAWkEF4YU9NGxFhbMnztSfm6LR00UoYtSWUGP3RtSyPPb0KWKojw
 MtValWpb06A2uIOgZYBziov798FBMoMG/k7g5eI+MKvwjWwPzPKUNBYZTWBteD6WTZkO
 0DzIm/SG/bG9qz5JLRHRmI2jtr7+Mkf2ib7T48TcpaYe1oKJH3v2qJLz3XyDk6jaQ3ZM
 UP5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U0or+meyzS1O1E+bq0AooMFJPTAGgN/3BFQxbM2exMk=;
 b=JEo9SAgWcp71oamHpf7QXk1dnCV15JBJKb2IkPUtq10VLDIGVscgGAUZL6+OGrNC3L
 jigIolvV/4pbc/OBJacbFbu/X31Elx+abc0HPjSzSgBETTVwsBBHNmHaCPs48ruhBcUY
 OlIUW965COHlFwRtIUxxl6bk7x4SGNIjbdCeMQg4QZ5nCU7TSoHcAcxrfUU98F3Z/k1O
 b8ctyIlhGhxce6WAAAgVEdYpe24eoVfYjFIVdlTBqSQVge7FuvVI+5WxCRe6JJzB0mKO
 +dHcuUbaQaHcdLM2wYs1HK5whaiPp1FqQF/sSS8s1Le2bdkwDH8lkIGVQzOR1YPPWViU
 kmow==
X-Gm-Message-State: AOAM533UbGJt2css6Sp5UlrQs+0N2JdeCb3MgJGKeBRN+fRXdjFCIAaY
 XAFNE7Ih0T4zmZLY0qEjuKgQsw==
X-Received: by 2002:a05:622a:138d:: with SMTP id
 o13mr20310372qtk.245.1625624302084; 
 Tue, 06 Jul 2021 19:18:22 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-22-142-114-143-47.dsl.bell.ca. [142.114.143.47])
 by smtp.googlemail.com with ESMTPSA id z6sm7768613qke.24.2021.07.06.19.18.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 19:18:21 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org, leif@nuviainc.com, rad@semihalf.com,
 mst@redhat.com, imammedo@redhat.com
Subject: [PATCH v6 07/10] hw/arm/sbsa-ref: add ITS support in SBSA GIC
Date: Tue,  6 Jul 2021 22:18:12 -0400
Message-Id: <20210707021815.45938-8-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210707021815.45938-1-shashi.mallela@linaro.org>
References: <20210707021815.45938-1-shashi.mallela@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82f;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qt1-x82f.google.com
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
Cc: eric.auger@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HdXKeu4ctgRD

Included creation of ITS as part of SBSA platform GIC
initialization.

Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
---
 hw/arm/sbsa-ref.c | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 43c19b4923..3d9c073636 100644
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
@@ -64,6 +64,7 @@ enum {
     SBSA_CPUPERIPHS,
     SBSA_GIC_DIST,
     SBSA_GIC_REDIST,
+    SBSA_GIC_ITS,
     SBSA_SECURE_EC,
     SBSA_GWDT,
     SBSA_GWDT_REFRESH,
@@ -107,6 +108,7 @@ static const MemMapEntry sbsa_ref_memmap[] = {
     [SBSA_CPUPERIPHS] =         { 0x40000000, 0x00040000 },
     [SBSA_GIC_DIST] =           { 0x40060000, 0x00010000 },
     [SBSA_GIC_REDIST] =         { 0x40080000, 0x04000000 },
+    [SBSA_GIC_ITS] =            { 0x44090000, 0x00020000 },
     [SBSA_SECURE_EC] =          { 0x50000000, 0x00001000 },
     [SBSA_GWDT_REFRESH] =       { 0x50010000, 0x00001000 },
     [SBSA_GWDT_CONTROL] =       { 0x50011000, 0x00001000 },
@@ -377,7 +379,20 @@ static void create_secure_ram(SBSAMachineState *sms,
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
@@ -404,6 +419,10 @@ static void create_gic(SBSAMachineState *sms)
     qdev_prop_set_uint32(sms->gic, "len-redist-region-count", 1);
     qdev_prop_set_uint32(sms->gic, "redist-region-count[0]", redist0_count);
 
+    object_property_set_link(OBJECT(sms->gic), "sysmem", OBJECT(mem),
+                                 &error_fatal);
+    qdev_prop_set_bit(sms->gic, "has-lpi", true);
+
     gicbusdev = SYS_BUS_DEVICE(sms->gic);
     sysbus_realize_and_unref(gicbusdev, &error_fatal);
     sysbus_mmio_map(gicbusdev, 0, sbsa_ref_memmap[SBSA_GIC_DIST].base);
@@ -450,6 +469,7 @@ static void create_gic(SBSAMachineState *sms)
         sysbus_connect_irq(gicbusdev, i + 3 * smp_cpus,
                            qdev_get_gpio_in(cpudev, ARM_CPU_VFIQ));
     }
+    create_its(sms);
 }
 
 static void create_uart(const SBSAMachineState *sms, int uart,
@@ -762,7 +782,7 @@ static void sbsa_ref_init(MachineState *machine)
 
     create_secure_ram(sms, secure_sysmem);
 
-    create_gic(sms);
+    create_gic(sms, sysmem);
 
     create_uart(sms, SBSA_UART, sysmem, serial_hd(0));
     create_uart(sms, SBSA_SECURE_UART, secure_sysmem, serial_hd(1));
-- 
2.27.0

