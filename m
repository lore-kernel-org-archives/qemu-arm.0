Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp2151985lfb;
        Thu, 29 Apr 2021 16:51:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz4XVvk0wOSL1XuAQGGuvkWCEsFra2eaYxP6f98vrgojNH7a23oIOC0irYvZQBDq0xIztvw
X-Received: by 2002:a05:6e02:b29:: with SMTP id e9mr1833242ilu.175.1619740295623;
        Thu, 29 Apr 2021 16:51:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619740295; cv=none;
        d=google.com; s=arc-20160816;
        b=bsMO49nS+X4Z6tgbwoKNYQE0rE63gPqYLMie0LQLvdM2Nt3We5bfoknrg2DgKy2DTZ
         F3sBusy6ZtaSzvog+Mw3wsdlRcDo18ID1ZipjXt4qU+lwuxAfUGvSjmXk6Jo/AZnsLUD
         YXcJyxJR0VSCajtGTJkkxD6I/m8cWAw64PMgJUsISyN1XTKucbcif8P5YeSE5b5/oM2w
         AeCQuZeI4zPsaO3zAC3avm9tzADl/TLoLNcj9LpJo055VowTgAvxoWmbC81SI3E8K8BB
         8tZrOfl3gD5R5I2WmTfA/K6OgiUiRt/Vi9f/xJ0EUNeR/L7Ddxm7epYl+3bckyaOV0u/
         czJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=dDFLsvyLe8lLl4nZKmWov7o0SG/Q1sJrDdZtdR5zH+8=;
        b=OIuzLbBaBuCnoi/jm07tf7zUjyCqHb/0NEUlyg0ExV28QUUsJ5Na6bywHzo/37m67w
         aohamkipD6sFYByZGN9f7NOkMLtzElavKNzOU5EjQDzIeg67FJAUtD/57P2K5STj8IWA
         5uDdeERQYJLQVOybsD0tZ5+XL+zoz6AGeTbFhLS2TAaACBDMqbpeIGVoz8C9mnWPioeM
         ibd/KVrjyMWOj2iRaRCeNMjsRtyle2h/ClBxKt2Y9WJOQ+1isjVsziERn2Zcxo45mhpm
         2sCmIgoBj2aVXSouBvgU5pHjSjOczClclrmo++GnoOWjdAY3GtNY3uTfD2gvP77lnDCC
         hc6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cnaujSaP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b12si166617ilo.127.2021.04.29.16.51.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Apr 2021 16:51:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cnaujSaP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lcGRT-0007hl-01
	for alex.bennee@linaro.org; Thu, 29 Apr 2021 19:51:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lcGIX-0005nd-2D
 for qemu-arm@nongnu.org; Thu, 29 Apr 2021 19:42:21 -0400
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33]:40864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lcGIK-0004Lp-4b
 for qemu-arm@nongnu.org; Thu, 29 Apr 2021 19:42:20 -0400
Received: by mail-qv1-xf33.google.com with SMTP id l2so15634370qvb.7
 for <qemu-arm@nongnu.org>; Thu, 29 Apr 2021 16:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dDFLsvyLe8lLl4nZKmWov7o0SG/Q1sJrDdZtdR5zH+8=;
 b=cnaujSaPfcR1GI6Z8zxIMCM+SUW1m97SeIXz6RV6Hr0/Lf5TnpzTsGVBTxQ28XlQtE
 cxCmPTiMzGoonzV7dGn8PjevamThtuTmsLenG+mJnaoKJ+0sKomL1x6eLZ2SvHJK/TGy
 Ui26wbb2jDxb+EOsLkU7aU+Da4u2mL1IGUDSuS/0Xq945IJkxJby9ZLNoCa1zKWqQT18
 S/txKArZ+dFa3IJJ1TZ2h6FN4zionv2QInHZ+9R+xiH3EZp3l0R/TIpBKrhMLgH2RoUI
 kB3/WpVr9QISkTiV21pVOloto3ADW5CXUmX3AptJTYCSJBel3OKWrh8Id4yLm+r5QBvP
 59Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dDFLsvyLe8lLl4nZKmWov7o0SG/Q1sJrDdZtdR5zH+8=;
 b=QOGzHHx+K7CDyfCz8TDDBc5Gy2Nl+gmR+KgPdYahpDJWhjXTnfuqnW5V/Jtx0lG+mb
 tORHnXir26YHzxH6Jdr9COXBQmyEWOkPH1oHDKBWCOGwA9dicAxAKy25fiZ0Sga47AMB
 JQBCbrGcpIvD60729/W7HvLD7YVBlQvG2EqGVwTIiPnjHa9NEvKsfy0dDm9Z2NxUPZHf
 Q78ImIx354EVBtEN/jWButWzUszBGQJ2sgHAvJcxT+xW12gK7ctjWtlj1EtZjCHWV3fA
 D3i1uJaz0Ug7MDFTGZqafAtiDzIbYZEfPrHhHfwn6+A0sIDVhoFOAQemB5qTW6On2VLl
 8XRQ==
X-Gm-Message-State: AOAM530XHyxQR0kGWEjpp5jzcDMyC7z1iIyKLr0bmxMHYogDK9rVsD+x
 bFNOkF7i92O+e0rI7uZVJikIeHzuJ94Kzg==
X-Received: by 2002:ad4:41c6:: with SMTP id a6mr2314549qvq.56.1619739727073;
 Thu, 29 Apr 2021 16:42:07 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-23-174-92-28-28.dsl.bell.ca. [174.92.28.28])
 by smtp.googlemail.com with ESMTPSA id i2sm1093229qtg.0.2021.04.29.16.42.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 16:42:06 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org,
	leif@nuviainc.com,
	rad@semihalf.com
Subject: [PATCH v3 7/8] hw/arm/sbsa-ref: add ITS support in SBSA GIC
Date: Thu, 29 Apr 2021 19:42:00 -0400
Message-Id: <20210429234201.125565-8-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210429234201.125565-1-shashi.mallela@linaro.org>
References: <20210429234201.125565-1-shashi.mallela@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f33;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qv1-xf33.google.com
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
X-TUID: rWalD271nwSC

Included creation of ITS as part of SBSA platform GIC
initialization.

Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
---
 hw/arm/sbsa-ref.c | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 88dfb2284c..d05cbcae48 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -35,7 +35,7 @@
 #include "hw/boards.h"
 #include "hw/ide/internal.h"
 #include "hw/ide/ahci_internal.h"
-#include "hw/intc/arm_gicv3_common.h"
+#include "hw/intc/arm_gicv3_its_common.h"
 #include "hw/loader.h"
 #include "hw/pci-host/gpex.h"
 #include "hw/qdev-properties.h"
@@ -65,6 +65,7 @@ enum {
     SBSA_CPUPERIPHS,
     SBSA_GIC_DIST,
     SBSA_GIC_REDIST,
+    SBSA_GIC_ITS,
     SBSA_SECURE_EC,
     SBSA_GWDT,
     SBSA_GWDT_REFRESH,
@@ -108,6 +109,7 @@ static const MemMapEntry sbsa_ref_memmap[] = {
     [SBSA_CPUPERIPHS] =         { 0x40000000, 0x00040000 },
     [SBSA_GIC_DIST] =           { 0x40060000, 0x00010000 },
     [SBSA_GIC_REDIST] =         { 0x40080000, 0x04000000 },
+    [SBSA_GIC_ITS] =            { 0x44090000, 0x00020000 },
     [SBSA_SECURE_EC] =          { 0x50000000, 0x00001000 },
     [SBSA_GWDT_REFRESH] =       { 0x50010000, 0x00001000 },
     [SBSA_GWDT_CONTROL] =       { 0x50011000, 0x00001000 },
@@ -378,7 +380,20 @@ static void create_secure_ram(SBSAMachineState *sms,
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
@@ -405,6 +420,10 @@ static void create_gic(SBSAMachineState *sms)
     qdev_prop_set_uint32(sms->gic, "len-redist-region-count", 1);
     qdev_prop_set_uint32(sms->gic, "redist-region-count[0]", redist0_count);
 
+    object_property_set_link(OBJECT(sms->gic), "sysmem", OBJECT(mem),
+                                 &error_fatal);
+    qdev_prop_set_bit(sms->gic, "has-lpi", true);
+
     gicbusdev = SYS_BUS_DEVICE(sms->gic);
     sysbus_realize_and_unref(gicbusdev, &error_fatal);
     sysbus_mmio_map(gicbusdev, 0, sbsa_ref_memmap[SBSA_GIC_DIST].base);
@@ -451,6 +470,7 @@ static void create_gic(SBSAMachineState *sms)
         sysbus_connect_irq(gicbusdev, i + 3 * smp_cpus,
                            qdev_get_gpio_in(cpudev, ARM_CPU_VFIQ));
     }
+    create_its(sms);
 }
 
 static void create_uart(const SBSAMachineState *sms, int uart,
@@ -763,7 +783,7 @@ static void sbsa_ref_init(MachineState *machine)
 
     create_secure_ram(sms, secure_sysmem);
 
-    create_gic(sms);
+    create_gic(sms, sysmem);
 
     create_uart(sms, SBSA_UART, sysmem, serial_hd(0));
     create_uart(sms, SBSA_SECURE_UART, secure_sysmem, serial_hd(1));
-- 
2.27.0

