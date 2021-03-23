Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp4185982lfg;
        Mon, 22 Mar 2021 21:17:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwXZTt17VyRjT0qn/G6Z7IQGye/XaOBpJ0O7qDIqdLBfkok8+u59ANtoenljwNijqgBo+FY
X-Received: by 2002:a25:e908:: with SMTP id n8mr2558736ybd.261.1616473070079;
        Mon, 22 Mar 2021 21:17:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616473070; cv=none;
        d=google.com; s=arc-20160816;
        b=oyZhNXbg9s8NVy5mNmMtmcWMC8/TxjG8xQIa0qp9Qfv5Hu0DBfdKFJM6NQ9T8bUWKk
         HJIuioU2FdZN/gmSqjoIlgVr17dJps+O0mpREhFnlAG5XqVUdqgmBCPvDQmKEcJYk8Cf
         7l16tmH2LuM9C2SJFc8vCKE7Zfuy2kmflxjOhquhW8/mkoU86s0Kx7bdQGUrmwuuHWj4
         MH22VHG+T9KxCLjGvH19nKpIxAqGfbBgWp4vZv7wp0ASiXhfg3HwvDtjRM4DJb71o0mn
         h7dIJIersI8MYESGR3yVyL9ip9N3Ww/N/U3aWWWNmOm9PQUAWgxVCBlDrEnteiUoRNDD
         fm3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=wi/6RMFD9QHoWMG50SCOYWnSVhyjzRhsQvs0OtM7umo=;
        b=SzPXzWEsaechIU9nO6Gzao/9T5oSm6MPMS5dPjH3uazumDeYT+uGJ2rw3B/RF/VlM/
         05JXIhcGc4w32O/luA0Mps+rAbHn5AbUwF7tfEeTmBls7sfvE6TGNipoy7X+jpD/zuuf
         9TjL/5qzpo853yFHnJ+RTjEe5arPYlRmZ/P161Nw706q+NnSMUNY/MYg2F2nktObWkYk
         QVq2zHhv2vODyhfqojuGrMtrMmV03CaAJQ3vpIfwNSyxXQYKLWuWxM1tb7fLGn4+aLwg
         I07jMBLWcSjEgO1XDRDai2tLeAgY106rxR3HS5N9N5jaerN3WRRVxD55RlH58grPhheW
         I2xQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YavFE91R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g10si15797899ybd.96.2021.03.22.21.17.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Mar 2021 21:17:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YavFE91R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lOYUH-0004t8-Ac
	for alex.bennee@linaro.org; Tue, 23 Mar 2021 00:17:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lOYPo-0000nb-Pz
 for qemu-arm@nongnu.org; Tue, 23 Mar 2021 00:13:12 -0400
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c]:42498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lOYPO-0006ck-K9
 for qemu-arm@nongnu.org; Tue, 23 Mar 2021 00:13:12 -0400
Received: by mail-qk1-x72c.google.com with SMTP id y5so11561146qkl.9
 for <qemu-arm@nongnu.org>; Mon, 22 Mar 2021 21:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wi/6RMFD9QHoWMG50SCOYWnSVhyjzRhsQvs0OtM7umo=;
 b=YavFE91R9Vb/1TGYJ3DBFhoideQrhCEE2tQ8xRjZ5V4UTt+IeYnnfsZoRQ1p29sjDc
 A3gyKP/e73jqm8mlsIaakdY06gyNMVd3oJLMuNtJe1+jIEOV5QmCeoccZCr7hl4pcyHF
 C8aZyRJO1lJQitAsoLQGKmL5UeMBs9jGMLkajzmB/hW7fMQbQK+YU1KTaD2BHtjcbelr
 g6iUmUnvT5TO5x6B/y5gNUpo4opkHRtC8SP7QC1piyjpS5bGRN+8VvM9SOGt+ZnVS3SD
 7SoZTtwKJ6wCW95Eu+5+7k5J61MWoBf09YuUlfgdjs8dV6/9G3tDk1g9OFOTJsT8ZBWd
 vMaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wi/6RMFD9QHoWMG50SCOYWnSVhyjzRhsQvs0OtM7umo=;
 b=JFuEbaNTeDqSUbeIeBVVK/loy0xx/HMrpatL5FhIaO880+CNtcVPjFZSqJqpQbD030
 tstmlFSFqvgSoFiMdkHDXXljY9Eu23QjGx9W8iPqc6CsdJfDmKBlxlrvg8j3bCStiiM1
 p5c3WxkJ8QtZz72kNV2/iNAf3sLSxjMWJUNiUhpMZkV6yvLlMvTyaMsHy/rDSAMgZS1G
 a6mP0iw0YRXzC8Oq+ixuRMu1liBl7zMHo341nB6rzic0dIpNaBwF7DIdk4FiZhtiENhj
 I60fcodkw+HJG5oYRdDHRAmRROI0eTkbwW8/HEUs8rJdULLSGn1ko37nULnqIrCSYvXz
 bQ3Q==
X-Gm-Message-State: AOAM530U5tQ/YwqSGJOJ9gVDHULG8AtP8UZt+/pkYPkxc4mqYLD20KO0
 fexCvT6HCyuxU1I2TgXWMtOUbw==
X-Received: by 2002:a37:a0d1:: with SMTP id j200mr3625105qke.426.1616472765321; 
 Mon, 22 Mar 2021 21:12:45 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-23-174-92-28-28.dsl.bell.ca. [174.92.28.28])
 by smtp.googlemail.com with ESMTPSA id m21sm12601181qka.28.2021.03.22.21.12.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 21:12:45 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org,
	leif@nuviainc.com,
	rad@semihalf.com
Subject: [PATCH v1 7/8] hw/arm/sbsa-ref: add ITS support in SBSA GIC
Date: Tue, 23 Mar 2021 00:12:37 -0400
Message-Id: <20210323041238.133835-8-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210323041238.133835-1-shashi.mallela@linaro.org>
References: <20210323041238.133835-1-shashi.mallela@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72c;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qk1-x72c.google.com
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
X-TUID: mcTqNGFcKKGq

Included creation of ITS as part of SBSA platform GIC
initialization.

Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
---
 hw/arm/sbsa-ref.c | 26 +++++++++++++++++---
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

