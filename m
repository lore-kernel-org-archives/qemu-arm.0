Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp75843njc;
        Wed, 18 Jun 2025 23:42:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVo1emfhRDSWVvtXGapqHlzYv8KXGoMHOcNq5hfLSD8p53MC6/74Z+iczP2aL7ESiIk9LyUZrPL0JMOBw==@linaro.org
X-Google-Smtp-Source: AGHT+IERDF1cf4/FQNNbS3JHPYXA6qf4DxITpHkK7U5nMGpYh8Qw+Uu+Ce/H05QYeo7Al73POsmf
X-Received: by 2002:a05:622a:1a9c:b0:4a5:98c2:34b9 with SMTP id d75a77b69052e-4a73c595002mr342785951cf.34.1750315330862;
        Wed, 18 Jun 2025 23:42:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750315330; cv=none;
        d=google.com; s=arc-20240605;
        b=IgCXjtR4IMBhPMTEFaErz5hrQqJ4GLMgaam8PMGsm3YdFPDQZI0gd2J2dTBSWlupjp
         /moquUMzP2dqYHXBGu6XUL+2fBtQ4h+HkS6SwQcFK0GhuvDnwMViubruyVQZgdPzrpS+
         WKEmNATXSviTdXkXkvGLPu2HTTeTtkgwtpNE4LXyLr152QNRXBCb3AxH6Dd9h6iJxbmf
         tnW82XW/bHVU/sIWqhLl6/ICXseQ197FZpP8KhOJsdo+dT0ipB1LZuunoT9T2ei3+lH5
         +UUIeAViV8bCUpTCRwhw2z+e7QtpnUbOGj511gdavWCWMnNW4LAoaGoWzxRri/2GoV1M
         CSog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=MjaxmAHWJDTmRKgCswuyzroUUoM27wR6I2Moz/iJyVk=;
        fh=3E+GgkJ59sv88GyUpaKWpV4DoJlJz+B5Ev7H4uQXan0=;
        b=T+mVe6O41Sng5xp2ePGn6nBV/K0wOlIZd+Uy8Q6leQMWMRsM5OzKa1pO/gUe0peID7
         eqsfnDGCkaALVwIKmQEmxdqeRfJp7+w5TzPnxwyYS0ULMvo+ggbgCoym63J4TAu9hhkP
         JeExubzpgzGwXpkubsBouE6jVu2PdsqVaCLa3dVGhTDVKqEL9DuVNgxbRBK6zE8Q6GON
         QIpna+h83RzsPOUwUsvxg4/rkcoqVyjcJa34Ude8ZwCH6CZwmR+RHVj24BP4fLgO1yOV
         3X8kNGwpAWDKxIyDyHJrgc/CFjLID6KkADSDs4sJZB8j2LdEkGoVu6J90piprtOQmReL
         tvaA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a72a4f07ffsi152966081cf.462.2025.06.18.23.42.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Jun 2025 23:42:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uS8y2-0002Xb-R1; Thu, 19 Jun 2025 02:41:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kane_chen@aspeedtech.com>)
 id 1uS8xv-0002WQ-AX; Thu, 19 Jun 2025 02:41:40 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kane_chen@aspeedtech.com>)
 id 1uS8xs-0001s1-TQ; Thu, 19 Jun 2025 02:41:38 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 19 Jun
 2025 14:41:16 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 19 Jun 2025 14:41:16 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>, Andrew Jeffery
 <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, "open
 list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <troy_lee@aspeedtech.com>, Kane-Chen-AS <kane_chen@aspeedtech.com>
Subject: [RFC v5 3/4] hw/arm: Integrate ASPEED OTP memory support into AST10x0
 and AST2600 SoCs
Date: Thu, 19 Jun 2025 14:41:12 +0800
Message-ID: <20250619064115.4182202-4-kane_chen@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250619064115.4182202-1-kane_chen@aspeedtech.com>
References: <20250619064115.4182202-1-kane_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=kane_chen@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_FAIL=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-to:  Kane Chen <kane_chen@aspeedtech.com>
From:  Kane Chen via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: SJflbiYv+OY2

From: Kane-Chen-AS <kane_chen@aspeedtech.com>

This patch exposes a new "otpmem" machine parameter to allow users to
attach an OTP memory device to AST1030 and AST2600-based platforms.

The value of this parameter is passed as a QOM alias to the Secure Boot
Controller (SBC), enabling binding to an aspeed.otpmem device created
via -device. This allows emulation of secure boot flows that rely on
fuse-based configuration stored in OTP memory.

The has_otpmem attribute is enabled in the SBC subclasses for AST10x0
and AST2600 to control the presence of OTP support per SoC type.

Users can preload a custom OTP memory image for boot-time behavior.
For example:

```bash
for i in $(seq 1 2048); do
  printf '\x00\x00\x00\x00\xff\xff\xff\xff'
done > otpmem.img
```

Users can test OTP memory integration using the following command,
which loads a file-backed OTP image into the emulated SoC:
```bash
qemu-system-arm -machine ast2600-evb,otpmem=otpmem-drive \
  -blockdev driver=file,filename=otpmem.img,node-name=otpmem \
  -device aspeed.otpmem,drive=otpmem,id=otpmem-drive \
  ...
```

Signed-off-by: Kane-Chen-AS <kane_chen@aspeedtech.com>
---
 hw/arm/aspeed.c              | 20 ++++++++++++++++++++
 hw/arm/aspeed_ast10x0.c      |  2 +-
 hw/arm/aspeed_ast2600.c      |  2 +-
 hw/misc/aspeed_sbc.c         | 18 ++++++++++++++++++
 include/hw/misc/aspeed_sbc.h |  1 +
 5 files changed, 41 insertions(+), 2 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index d0b333646e..734416c217 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -47,6 +47,7 @@ struct AspeedMachineState {
     uint32_t uart_chosen;
     char *fmc_model;
     char *spi_model;
+    char *otpmem;
     uint32_t hw_strap1;
 };
 
@@ -1199,6 +1200,21 @@ static void aspeed_set_bmc_console(Object *obj, const char *value, Error **errp)
     bmc->uart_chosen = val + ASPEED_DEV_UART0;
 }
 
+static char *aspeed_get_otpmem(Object *obj, Error **errp)
+{
+    AspeedMachineState *bmc = ASPEED_MACHINE(obj);
+
+    return g_strdup(bmc->otpmem);
+}
+
+static void aspeed_set_otpmem(Object *obj, const char *value, Error **errp)
+{
+    AspeedMachineState *bmc = ASPEED_MACHINE(obj);
+
+    g_free(bmc->otpmem);
+    bmc->otpmem = g_strdup(value);
+}
+
 static void aspeed_machine_class_props_init(ObjectClass *oc)
 {
     object_class_property_add_bool(oc, "execute-in-place",
@@ -1220,6 +1236,10 @@ static void aspeed_machine_class_props_init(ObjectClass *oc)
                                    aspeed_set_spi_model);
     object_class_property_set_description(oc, "spi-model",
                                           "Change the SPI Flash model");
+    object_class_property_add_str(oc, "otpmem", aspeed_get_otpmem,
+                                   aspeed_set_otpmem);
+    object_class_property_set_description(oc, "otpmem",
+                                          "Set OTP Memory Drive");
 }
 
 static void aspeed_machine_class_init_cpus_defaults(MachineClass *mc)
diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
index e6e1ee63c1..c446e70b24 100644
--- a/hw/arm/aspeed_ast10x0.c
+++ b/hw/arm/aspeed_ast10x0.c
@@ -154,7 +154,7 @@ static void aspeed_soc_ast1030_init(Object *obj)
 
     object_initialize_child(obj, "peci", &s->peci, TYPE_ASPEED_PECI);
 
-    object_initialize_child(obj, "sbc", &s->sbc, TYPE_ASPEED_SBC);
+    object_initialize_child(obj, "sbc", &s->sbc, TYPE_ASPEED_AST10X0_SBC);
 
     for (i = 0; i < sc->wdts_num; i++) {
         snprintf(typename, sizeof(typename), "aspeed.wdt-%s", socname);
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index d12707f0ab..59ffd41a4a 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -261,7 +261,7 @@ static void aspeed_soc_ast2600_init(Object *obj)
 
     object_initialize_child(obj, "i3c", &s->i3c, TYPE_ASPEED_I3C);
 
-    object_initialize_child(obj, "sbc", &s->sbc, TYPE_ASPEED_SBC);
+    object_initialize_child(obj, "sbc", &s->sbc, TYPE_ASPEED_AST2600_SBC);
 
     object_initialize_child(obj, "iomem", &s->iomem, TYPE_UNIMPLEMENTED_DEVICE);
     object_initialize_child(obj, "video", &s->video, TYPE_UNIMPLEMENTED_DEVICE);
diff --git a/hw/misc/aspeed_sbc.c b/hw/misc/aspeed_sbc.c
index 8e192e9496..38f6d2745e 100644
--- a/hw/misc/aspeed_sbc.c
+++ b/hw/misc/aspeed_sbc.c
@@ -323,8 +323,10 @@ static const TypeInfo aspeed_sbc_info = {
 static void aspeed_ast2600_sbc_class_init(ObjectClass *klass, const void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
+    AspeedSBCClass *sc = ASPEED_SBC_CLASS(klass);
 
     dc->desc = "AST2600 Secure Boot Controller";
+    sc->has_otpmem = true;
 }
 
 static const TypeInfo aspeed_ast2600_sbc_info = {
@@ -333,9 +335,25 @@ static const TypeInfo aspeed_ast2600_sbc_info = {
     .class_init = aspeed_ast2600_sbc_class_init,
 };
 
+static void aspeed_ast10x0_sbc_class_init(ObjectClass *klass, const void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    AspeedSBCClass *sc = ASPEED_SBC_CLASS(klass);
+
+    dc->desc = "AST10X0 Secure Boot Controller";
+    sc->has_otpmem = true;
+}
+
+static const TypeInfo aspeed_ast10x0_sbc_info = {
+    .name = TYPE_ASPEED_AST10X0_SBC,
+    .parent = TYPE_ASPEED_SBC,
+    .class_init = aspeed_ast10x0_sbc_class_init,
+};
+
 static void aspeed_sbc_register_types(void)
 {
     type_register_static(&aspeed_ast2600_sbc_info);
+    type_register_static(&aspeed_ast10x0_sbc_info);
     type_register_static(&aspeed_sbc_info);
 }
 
diff --git a/include/hw/misc/aspeed_sbc.h b/include/hw/misc/aspeed_sbc.h
index 858e82861b..34ee949fad 100644
--- a/include/hw/misc/aspeed_sbc.h
+++ b/include/hw/misc/aspeed_sbc.h
@@ -14,6 +14,7 @@
 
 #define TYPE_ASPEED_SBC "aspeed.sbc"
 #define TYPE_ASPEED_AST2600_SBC TYPE_ASPEED_SBC "-ast2600"
+#define TYPE_ASPEED_AST10X0_SBC TYPE_ASPEED_SBC "-ast10X0"
 OBJECT_DECLARE_TYPE(AspeedSBCState, AspeedSBCClass, ASPEED_SBC)
 
 #define ASPEED_SBC_NR_REGS (0x93c >> 2)
-- 
2.43.0

