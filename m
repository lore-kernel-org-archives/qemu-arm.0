Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp522185lfa;
        Wed, 2 Jun 2021 11:07:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyiq7fTUj3kvnQKNKv4UnS/giOi6xmNETHXv3gdCqUgHjb8HFPt2eLX2UN8GItL4O5JYG0H
X-Received: by 2002:aca:bed4:: with SMTP id o203mr4495754oif.102.1622657264792;
        Wed, 02 Jun 2021 11:07:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622657264; cv=none;
        d=google.com; s=arc-20160816;
        b=yspEkcOtP5XsKcgcnBHiG244O7lkO7o5u+ppLKYo2i/9xS9+zp5uBTnN77HjzBs1De
         JGdeKLvgMTGSbZiDoYZ8BXBKf2awUw+5m83/9hdXRYwvjE/iSXWHfXhWnNe3vjqqMNZc
         dra/X44P/Yh3Sjd/h9xd0gsqZFoHWZy8zDU5RUa5Z5Jsj7UJ9O1/MXJ8YVZekLxC2Php
         /drNTPPQrz3F7s92oYbrZsD0ZRyaMCilGVhip+037hbDAtpqe6x+PiV6ZvKjys9QQR+7
         PZ9MaXzfDtz6agiNecEvqsqVteaMx5KS4rOdgI2MPomhaHkdcVoyUNFG4IH/fhViHqnG
         75/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=U0or+meyzS1O1E+bq0AooMFJPTAGgN/3BFQxbM2exMk=;
        b=XT0nMz60+8yiJl4M7bxWMpsvPcw0lBc16HnigbXW6TD/hZInw+9KboGigHjpVDfGMK
         /3lKIg8PTlih8kljbJlfKmzmW+1eNc3IN5KE9HFcejr0ntySXq9otMyr9wgVp089nwN6
         9DrG+l5VFYDH6oNxB2tRxTTEkgz3T7MRJ71N6VBME1QQohXwXgJHa8aI+e9kkjechukm
         ElIQgukucEjYoaz2op/A3ktawqmaGZs6bYPCstrN7+0DETuj3NLgk6IW4Qww0hy/sJeP
         yzc7jhULyjMBYJSCJ9/FjZ/EPFBTQO4QwEDgM40Ed6Jeav33wfqTN2g3fYV5/VwME8xz
         4+Ew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=twgJr7n4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e27si862507oiy.23.2021.06.02.11.07.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Jun 2021 11:07:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=twgJr7n4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1loVHM-0005zI-5j
	for alex.bennee@linaro.org; Wed, 02 Jun 2021 14:07:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1loVAo-0008PN-QE
 for qemu-arm@nongnu.org; Wed, 02 Jun 2021 14:00:58 -0400
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829]:43791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1loVAh-0006dC-MF
 for qemu-arm@nongnu.org; Wed, 02 Jun 2021 14:00:58 -0400
Received: by mail-qt1-x829.google.com with SMTP id c10so2447562qtx.10
 for <qemu-arm@nongnu.org>; Wed, 02 Jun 2021 11:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U0or+meyzS1O1E+bq0AooMFJPTAGgN/3BFQxbM2exMk=;
 b=twgJr7n4SxsBbnj3r//3N+ZpRABN7Td7f1+zRbGLuMCvFzqrcbaI3RLXSmllzLNVzZ
 3XjtzzhjkwY+Swh/W0DLGueV+mbjVRHc5tcI8E/0+VfhZNhFlZjUMnJH2t2Y7T+m23Q1
 GUDolFHsOl+aUFJw/RPrxgqV7FMWxiHER5dUV8SVJ3b2nRgh1qI55VqLqOikGB8nVPNe
 pLDf5c4lFNhMBVxNoMKPZMH2Y4A3pO1AA8c12CdGr46myx4ijEau7AgWeFwcHnulNO3q
 zGy+FgH/97vExr+D2fPM7quatmJHA29ULvMYh42/HPJhK5SO+/3xy1RkBopHF5I45OeB
 q4sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U0or+meyzS1O1E+bq0AooMFJPTAGgN/3BFQxbM2exMk=;
 b=hERGwoCQ8X7bieynyKOA4JXYZeFdV3Yh/2ZjkBbLiejHPuk57Os0JgQ1qhfcfo9m9l
 I8iTWjxLl+Javb9YgX9Dyx2gonX7pyrRBN9PHAjVrl5JBRsZl9ajwGuMaG2arNEhX3Pq
 sA+HzRD0b+TGJUE+pibxvuOG+wNj/xRFYulFG+0NNd4ETIMpB6UE0d+5Gyxwzj6PGtf+
 6W5YZgEFDVRGiEFkJUbv/1AhrCiXPqWOxdr51arnoBIBB0z1ImbjlpuBVuRHj5GbU20z
 F5KIUtUVPQ9pJudopOSW2xuN6R2QrXwGXGkx7ZASGIMzcv0HiOha/gZ5KcWkcwaPiJgC
 2ZFg==
X-Gm-Message-State: AOAM530NEwHtdb/zmjXL0rOG8Ec/78l7/0h6RGJS0G4St8mWGM8vhHyb
 gU/uVH8zIlU4VhInXPdyWnvv1Q==
X-Received: by 2002:ac8:7d14:: with SMTP id g20mr25447809qtb.298.1622656850739; 
 Wed, 02 Jun 2021 11:00:50 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-21-142-114-142-78.dsl.bell.ca. [142.114.142.78])
 by smtp.googlemail.com with ESMTPSA id 97sm273044qte.20.2021.06.02.11.00.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 11:00:49 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org,
	leif@nuviainc.com,
	rad@semihalf.com
Subject: [PATCH v4 7/8] hw/arm/sbsa-ref: add ITS support in SBSA GIC
Date: Wed,  2 Jun 2021 14:00:41 -0400
Message-Id: <20210602180042.111347-8-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210602180042.111347-1-shashi.mallela@linaro.org>
References: <20210602180042.111347-1-shashi.mallela@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::829;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qt1-x829.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: awXogKcpH2m0

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

