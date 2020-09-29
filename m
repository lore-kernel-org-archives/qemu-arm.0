Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp4276812lfq;
        Mon, 28 Sep 2020 22:53:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy1kHPwacZGwRe3bXuof7nwyor7ouuGOxyRNtSph5j7eamRXX1cZUOvg5C/3oErBlYYZHiJ
X-Received: by 2002:a25:aa93:: with SMTP id t19mr3865758ybi.482.1601358809565;
        Mon, 28 Sep 2020 22:53:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601358809; cv=none;
        d=google.com; s=arc-20160816;
        b=uqHaFuuHMteaBDf7lAVNHnHNZZO7R0ubActQ1/2LURrIsUb7/vWxWd5OQqkC7W7IFN
         KsBejCqy6Vi6wwxhyn0Uz0++7TrV76J7HMo9RhUcbBP1kkB4erOqezFZL9jhuBjE14e7
         dQiQTu+t1Eil3mnwF5tBW7DBNLGNxOTsDqzdo9S+USGMqyaK4qS1CSs7xPUR2oYZppGx
         MCZcn75qyCGr0nxFi/Kq80e+ToY4YB/A4WgnOVORSpwVrJ9hvZ//w/6LmJhrK4Jj9HNf
         21NCDArjdmSu8ivrKpeqZCJOqcNDFV6npKd2OzlJdr5GuNrDZ0DXTohXjspP1NQBVjwh
         GP1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=iaqxygqh0sAXKPaEqsfokpUsC+kEzlNVGmu10uaREI4=;
        b=eVG/IIEOiSmYao8VbsWFjnjraleAO8MSc1sxb7JCkE4VLMOLZzJkptTVUaH22HXS+h
         92KFJOHFuYSo5LOJe1nkgOtMxAljGN29dtepUyGTY2WFEtO646gSQC0BmPlmSlVbpSMJ
         /N55HF/Rq03pncKlJV9ZlHNJMx5dDxC/0I+0pjYjNNRv8TlmH4zkbvK+eCRdVLsgk4/S
         VGG4LW1daxrxZKp4ZhcY7HnAWSKp1JAd9Lo6vdYJL9VVoqsdhEC5s+ftKXgF0BZapMK6
         Nt2Wb8VRX5C1AT+4tTLxR+6rmtWumd7Ix2yHnlZSOPQ6EFM+N5eAveRecPd4sWKQ/LmN
         WvxA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@bytedance-com.20150623.gappssmtp.com header.s=20150623 header.b=h8qaL6OB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bytedance.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s199si3740275ybc.19.2020.09.28.22.53.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Sep 2020 22:53:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@bytedance-com.20150623.gappssmtp.com header.s=20150623 header.b=h8qaL6OB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bytedance.com
Received: from localhost ([::1]:49594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kN8Zs-00047t-Tj
	for alex.bennee@linaro.org; Tue, 29 Sep 2020 01:53:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangzhiqiang.bj@bytedance.com>)
 id 1kN8Zk-000455-8N
 for qemu-arm@nongnu.org; Tue, 29 Sep 2020 01:53:20 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:32861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wangzhiqiang.bj@bytedance.com>)
 id 1kN8Zh-0005lv-Ne
 for qemu-arm@nongnu.org; Tue, 29 Sep 2020 01:53:19 -0400
Received: by mail-pg1-x52b.google.com with SMTP id o25so2983794pgm.0
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2020 22:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iaqxygqh0sAXKPaEqsfokpUsC+kEzlNVGmu10uaREI4=;
 b=h8qaL6OB4G22zx/uD7Y+LlroUsoEgbSOE7WoiFcfdT3j6n8ngwz2HJLWtgfbZVbN3k
 qgy1UnKDOKSVOFRDpPK3sgKQSjo5an7BRuxF7McPfR78bTSctrbUKY6B63/8rBpmxRap
 WwviFsYyZr/fxKIsCyUQIqAnQe0Vfa4E6UNcbZhXAGXuAB2dUBp1txJpD3lJUeaFpLcy
 n3TIo6JHwxSg+XAqUPtCJQvxI/F9hgYqAtwCiCIXeASGEKkOfDK8UnmB3NV2RLcsIPGz
 rDcFFhd//PD+bgxqgmOtzH7CPOHOl77jwnLXoWs3Ax8RtCvnb0POlzAArd4Sn3SY2i0x
 RU1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iaqxygqh0sAXKPaEqsfokpUsC+kEzlNVGmu10uaREI4=;
 b=CuQCbX86vLBl9rIxXg0htHbfbjb0jo5VgETEJHPMmclTG6QWf0LPOkbXH7CgdEr2sf
 zuEWalFBMqowOoCU31LrZ5qsZZgNfGycLeY8jLJ1RTXBjwnfYzvmkAhCxcL+K9ZVhgrA
 CEAakALRX5OJJu2Jty7qMXrDPmwsI887IUsDqUtyNt3Uh3Jo2WuBcTFMbBQnJk8sbxoY
 aOV1nUOK53+9tmnYOyJuqTseoV8i0pRtVwZGzOULxVGFkuGwV+B5uZz9OnBnyohh3dED
 aUJK1ZEyazGuwoEwCnzCXduHveza5+HldntRDr518+NiZnP0F6WerAnNurtuwPrEIm/g
 a0uA==
X-Gm-Message-State: AOAM531IVQH2A0bq4MnvdK0/5uaEBEv9K0z//1U9c0fQ/qsgNlHs4gbY
 B3KA+IFXZXTDxUAoTiv9jYtQaA==
X-Received: by 2002:a17:902:8b89:b029:d2:4345:5dd with SMTP id
 ay9-20020a1709028b89b02900d2434505ddmr3058889plb.57.1601358796108; 
 Mon, 28 Sep 2020 22:53:16 -0700 (PDT)
Received: from localhost ([61.120.150.74])
 by smtp.gmail.com with ESMTPSA id 99sm3095625pjo.40.2020.09.28.22.53.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2020 22:53:15 -0700 (PDT)
From: John Wang <wangzhiqiang.bj@bytedance.com>
To: clkg@kaod.org, yulei.sh@bytedance.com, xuxiaohan@bytedance.com,
 joel@jms.id.au
Subject: [PATCH 2/2] aspeed: Add support for the g220a-bmc board
Date: Tue, 29 Sep 2020 13:53:09 +0800
Message-Id: <20200929055309.509-2-wangzhiqiang.bj@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200929055309.509-1-wangzhiqiang.bj@bytedance.com>
References: <20200929055309.509-1-wangzhiqiang.bj@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=wangzhiqiang.bj@bytedance.com; helo=mail-pg1-x52b.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sGleuIx7HB6z

G220A is a 2 socket x86 motherboard supported by OpenBMC.
Strapping configuration was obtained from hardware.

Signed-off-by: John Wang <wangzhiqiang.bj@bytedance.com>
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
2.25.1

