Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1155681lfq;
        Thu, 8 Oct 2020 02:05:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyNji6mfaglOMwJuSRl9hfXOY3ut0kczvOio57+7u+nXA3+JV7jtScCfeAp5sARJG/HUhZk
X-Received: by 2002:a25:cc86:: with SMTP id l128mr9684680ybf.232.1602147920138;
        Thu, 08 Oct 2020 02:05:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602147920; cv=none;
        d=google.com; s=arc-20160816;
        b=sWfjKHdZpga2ZwEzTsZwgVWCTkSHhsraz8c5xDTeu+AlF2i1zFgjnnjwIHiv8KQjz/
         bB0REJoP+yn83rxs3Q+nc0k77+/Yc9POOzLWXPnH3XquBrJdT3gVSfrr20pDkBag0A0y
         9E5mO2dPF+4pbTk5Ea4xYXiMyFIrnKtzEi8Dg9I9sDmfw4srgu3J+pTd4/I3xaJX+J2X
         myUKrVV5PWvNXEW3zhSeKlAD53MWQNCleWHKAcQKdPKxyPIy27/MbO1aZKTZisZ41laO
         XQW3rJiFJFZgGlqsqOpMhgk+iqx/bIGLaxwc+mi4QVojIbJGlXzU6PKiMwdhFJ1ivLbk
         FIYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=tkPzO/sEfgYCDokZyidOZG4oHQpLtbrvVAaaA28oWrA=;
        b=PFdiKH9T5Qw0zT1Msm8SgeX9h3A+ESN3JcnDLPM93O1ZNyzjDhqySU+UosJTn2jNgl
         8+gJdEyuj7D+WtEMKAU0KzA4/grDeqaAcl6m8o6V0uCoss0D+GdLMen+v5JTTjGvKxK8
         p0T4MVXHZvxGvykyTtKVBDzNzxSOYHsRHabjJYLgMBH0OfzclULCv5TPiWQ0R4LB9UTK
         bx3pvAkDIKfAldj9Vz1MjABv/bcVDnTLNEXnU9Cpm3cDVpc50rbdFJJU+z8wLlJGIREo
         9HSdmPz9WW0smhsi/Ttkt/f9U1J6Gvot+EXUqzXJQ30W0VXBDNIfjD51rdT8/+LyQL2r
         gKug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@bytedance-com.20150623.gappssmtp.com header.s=20150623 header.b=lUBfSOA1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bytedance.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 188si4110617yba.417.2020.10.08.02.05.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Oct 2020 02:05:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@bytedance-com.20150623.gappssmtp.com header.s=20150623 header.b=lUBfSOA1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bytedance.com
Received: from localhost ([::1]:35622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kQRrT-0008Jj-8B
	for alex.bennee@linaro.org; Thu, 08 Oct 2020 05:05:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangzhiqiang.bj@bytedance.com>)
 id 1kQRpC-0007Pg-KO
 for qemu-devel@nongnu.org; Thu, 08 Oct 2020 05:02:59 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:41159)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wangzhiqiang.bj@bytedance.com>)
 id 1kQRp6-00021x-Km
 for qemu-devel@nongnu.org; Thu, 08 Oct 2020 05:02:58 -0400
Received: by mail-pf1-x42c.google.com with SMTP id g10so3450995pfc.8
 for <qemu-devel@nongnu.org>; Thu, 08 Oct 2020 02:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tkPzO/sEfgYCDokZyidOZG4oHQpLtbrvVAaaA28oWrA=;
 b=lUBfSOA130fwcSmdFYGLDEEkVFurQqIRQrzHKqtfDqhAMGz9GstNsCdcaBiqtOXfvm
 31Qt7vWvGpHJox3JmynxDYtzN+rGD8KZH7fW616/idskzY8XEMPwo0ohQcFf7qnyDT14
 nal2rq/ucr4lSR5mUHsRpsgy3ns5pGahshNzgopBbKtuiX5SCuW8YjJUGe9+zJX3fZd1
 G9NhghVSs1ULsNJfjvBxiPfk3Yd0G8v9P1SYn+Z9/jKGhgG3lq+4JfFB5YMV/C5kaelG
 1RAXmBlqmbtfIo6pciOEfKKhdEqq69hdjpy9sU2L7jqn4HSaa1o9eOazpxM6bdsEJwXp
 OF1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tkPzO/sEfgYCDokZyidOZG4oHQpLtbrvVAaaA28oWrA=;
 b=Q+EGtjACoF+C/jl9H/2Y51GbI7oJD5kUgLCtmiK5SSUoXaVwNidEn6jHkcbahfnd5m
 eyqziUtEN3LmsuPXswpL/C8JQzx2GHSZ2hHYF/jGbjQtycHdG+VhXJtdOc6yink/Nvwd
 WEXmEjrMivzyP3sROk/G7G/yQT6MHIWSuh8XOjPRvcgZFV8j3GIop7LVsT8iK6tgap3a
 5hoWMBw5oJy9ZpaQtvhq3BB1kQ3T/GFirKWNELHTx77+LykziqWu0eKcJiyUc1jVe0P4
 WsmovxU316rd85BqW44TD4dhDzg9z9BRTiE6KDSiHR9p9HugoMlAL8lUESYU80A1gTK3
 fj1A==
X-Gm-Message-State: AOAM531/AO4PRZmupN+ZuSaBQAlcTOkKrm6brM9ijN3Mruc3pbENr9ud
 MXoiphZeRiuIOdw2SsMR4WFO6Q==
X-Received: by 2002:a63:4822:: with SMTP id v34mr6486281pga.342.1602147768560; 
 Thu, 08 Oct 2020 02:02:48 -0700 (PDT)
Received: from localhost ([103.136.220.74])
 by smtp.gmail.com with ESMTPSA id k9sm5745787pfc.96.2020.10.08.02.02.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 08 Oct 2020 02:02:48 -0700 (PDT)
From: John Wang <wangzhiqiang.bj@bytedance.com>
To: clg@kaod.org, xuxiaohan@bytednace.com, yulei.sh@bytedance.com,
 joel@jms.id.au
Subject: [PATCH v2 2/2] aspeed: Add support for the g220a-bmc board
Date: Thu,  8 Oct 2020 09:02:44 +0000
Message-Id: <20201008090244.3770-2-wangzhiqiang.bj@bytedance.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201008090244.3770-1-wangzhiqiang.bj@bytedance.com>
References: <20201008090244.3770-1-wangzhiqiang.bj@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=wangzhiqiang.bj@bytedance.com; helo=mail-pf1-x42c.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fCeNB5Ry9YV7

G220A is a 2 socket x86 motherboard supported by OpenBMC.
Strapping configuration was obtained from hardware.

Signed-off-by: John Wang <wangzhiqiang.bj@bytedance.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
---
v2:
  - No changes
---
 hw/arm/aspeed.c | 60 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index bdb981d2f8..04c8ad2bcd 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -120,6 +120,20 @@ struct AspeedMachineState {
         SCU_AST2500_HW_STRAP_ACPI_ENABLE |                              \
         SCU_HW_STRAP_SPI_MODE(SCU_HW_STRAP_SPI_MASTER))
 
+#define G220A_BMC_HW_STRAP1 (                                      \
+        SCU_AST2500_HW_STRAP_SPI_AUTOFETCH_ENABLE |                     \
+        SCU_AST2500_HW_STRAP_GPIO_STRAP_ENABLE |                        \
+        SCU_AST2500_HW_STRAP_UART_DEBUG |                               \
+        SCU_AST2500_HW_STRAP_RESERVED28 |                               \
+        SCU_AST2500_HW_STRAP_DDR4_ENABLE |                              \
+        SCU_HW_STRAP_2ND_BOOT_WDT |                                     \
+        SCU_HW_STRAP_VGA_CLASS_CODE |                                   \
+        SCU_HW_STRAP_LPC_RESET_PIN |                                    \
+        SCU_HW_STRAP_SPI_MODE(SCU_HW_STRAP_SPI_MASTER) |                \
+        SCU_AST2500_HW_STRAP_SET_AXI_AHB_RATIO(AXI_AHB_RATIO_2_1) |     \
+        SCU_HW_STRAP_VGA_SIZE_SET(VGA_64M_DRAM) |                       \
+        SCU_AST2500_HW_STRAP_RESERVED1)
+
 /* Witherspoon hardware value: 0xF10AD216 (but use romulus definition) */
 #define WITHERSPOON_BMC_HW_STRAP1 ROMULUS_BMC_HW_STRAP1
 
@@ -559,6 +573,30 @@ static void witherspoon_bmc_i2c_init(AspeedMachineState *bmc)
     /* Bus 11: TODO ucd90160@64 */
 }
 
+static void g220a_bmc_i2c_init(AspeedMachineState *bmc)
+{
+    AspeedSoCState *soc = &bmc->soc;
+    DeviceState *dev;
+
+    dev = DEVICE(i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 3),
+                                         "emc1413", 0x4c));
+    object_property_set_int(OBJECT(dev), "temperature0", 31000, &error_abort);
+    object_property_set_int(OBJECT(dev), "temperature1", 28000, &error_abort);
+    object_property_set_int(OBJECT(dev), "temperature2", 20000, &error_abort);
+
+    dev = DEVICE(i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 12),
+                                         "emc1413", 0x4c));
+    object_property_set_int(OBJECT(dev), "temperature0", 31000, &error_abort);
+    object_property_set_int(OBJECT(dev), "temperature1", 28000, &error_abort);
+    object_property_set_int(OBJECT(dev), "temperature2", 20000, &error_abort);
+
+    dev = DEVICE(i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 13),
+                                         "emc1413", 0x4c));
+    object_property_set_int(OBJECT(dev), "temperature0", 31000, &error_abort);
+    object_property_set_int(OBJECT(dev), "temperature1", 28000, &error_abort);
+    object_property_set_int(OBJECT(dev), "temperature2", 20000, &error_abort);
+}
+
 static bool aspeed_get_mmio_exec(Object *obj, Error **errp)
 {
     return ASPEED_MACHINE(obj)->mmio_exec;
@@ -798,6 +836,24 @@ static void aspeed_machine_tacoma_class_init(ObjectClass *oc, void *data)
         aspeed_soc_num_cpus(amc->soc_name);
 };
 
+static void aspeed_machine_g220a_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    AspeedMachineClass *amc = ASPEED_MACHINE_CLASS(oc);
+
+    mc->desc       = "Bytedance G220A BMC (ARM1176)";
+    amc->soc_name  = "ast2500-a1";
+    amc->hw_strap1 = G220A_BMC_HW_STRAP1;
+    amc->fmc_model = "n25q512a";
+    amc->spi_model = "mx25l25635e";
+    amc->num_cs    = 2;
+    amc->macs_mask  = ASPEED_MAC1_ON | ASPEED_MAC2_ON;
+    amc->i2c_init  = g220a_bmc_i2c_init;
+    mc->default_ram_size = 1024 * MiB;
+    mc->default_cpus = mc->min_cpus = mc->max_cpus =
+        aspeed_soc_num_cpus(amc->soc_name);
+};
+
 static const TypeInfo aspeed_machine_types[] = {
     {
         .name          = MACHINE_TYPE_NAME("palmetto-bmc"),
@@ -835,6 +891,10 @@ static const TypeInfo aspeed_machine_types[] = {
         .name          = MACHINE_TYPE_NAME("tacoma-bmc"),
         .parent        = TYPE_ASPEED_MACHINE,
         .class_init    = aspeed_machine_tacoma_class_init,
+    }, {
+        .name          = MACHINE_TYPE_NAME("g220a-bmc"),
+        .parent        = TYPE_ASPEED_MACHINE,
+        .class_init    = aspeed_machine_g220a_class_init,
     }, {
         .name          = TYPE_ASPEED_MACHINE,
         .parent        = TYPE_MACHINE,
-- 
2.17.1

