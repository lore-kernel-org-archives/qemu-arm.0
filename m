Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp1527811lfc;
        Tue, 12 Oct 2021 00:49:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxeVfNctQrgx9hM+E3nN6BTBna+o64kNdgdadZTulDs5EQ0EfQd8hWXaA8cxpxjbj3Ngic5
X-Received: by 2002:a25:244e:: with SMTP id k75mr25986675ybk.346.1634024979689;
        Tue, 12 Oct 2021 00:49:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634024979; cv=none;
        d=google.com; s=arc-20160816;
        b=f6Mel+fhxroxe4EINwg/xiVcNMHidwDE87pMySz7A0xAdQJJ2NMHGGfE+XQytBCYHp
         jnHwSnZVgAjA2RDvs9Sk+gOLxStF6GUEi4uQwV0afaai00ghVyyljDHZ9Br8hhSQgYk4
         Gbzi6v2LVIrpEAQHEmDIybdUjHzWt2IMA5aKKBkzElYucrAWOp1j/cvFTEiFfJ2SRXF+
         sFRBTezn+/EtuNB/llf+bOsJlaiFM1IAkB4ksr4xMWGE3ONnD3cpkMpV9mmHg/PzU+Cr
         hHH5XW5I6nT0KUxGFiTeCjkaapGTZyAAf8ruWE2h4E0D5Miuh2bWwLGhT30O02YzDIaW
         UjBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=7MRwRAsvWya7u607vZJBfk/cDD8bOLE0mW6DYrq3u0U=;
        b=VAyShffEPH0MVVLMzVr5g+XUIfjZ33LH2EtMFmzKLhj5ghTllm5WN0vZiMJxpPMbYL
         zUSZos7MfNtly72s+36kfxXAOZN4vTjoMYCstgbzQ2DmUqjdE+Sfiu1QLu10QcIIgpY2
         CUSrvkAvHnj4Fho3hphcuFdUhbLJKj3NfAW3X8gFJvhVxvZAZyc6l6aXkmSFdfyYnDpK
         inJL896ZgDmnfoNSDTGiJbP4a5ZkTB5IIS1Hs2Q3+G6ikPoKk4lBvRznU2c91NYAJOjT
         VlEISAVszyoMf6qXFGq7DGmY1MfmUjKwhUU4Xj1ns7oE1TCsI5D0lYzwsf/syokL2MwJ
         9Qlw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y70si11694581ybe.369.2021.10.12.00.49.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Oct 2021 00:49:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:39182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1maCXb-0006sG-0u
	for alex.bennee@linaro.org; Tue, 12 Oct 2021 03:49:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1maCML-0000ef-Bc
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 03:38:01 -0400
Received: from smtpout4.mo529.mail-out.ovh.net ([217.182.185.173]:33591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1maCM8-0004z9-BZ
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 03:38:01 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.2])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 008AEC407CF3;
 Tue, 12 Oct 2021 09:37:35 +0200 (CEST)
Received: from kaod.org (37.59.142.106) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Tue, 12 Oct
 2021 09:37:34 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R0063d1dac54-4938-4ba8-83e5-28026d6b8a69,
 B93E5558764F88B003587FF4B0B721A638511A69) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 08/18] aspeed/smc: QOMify AspeedSMCFlash
Date: Tue, 12 Oct 2021 09:37:18 +0200
Message-ID: <20211012073728.257748-9-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211012073728.257748-1-clg@kaod.org>
References: <20211012073728.257748-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: d6e3ee8a-1793-40bf-9feb-c3e08684d02c
X-Ovh-Tracer-Id: 4268849500482538345
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrvddtjedguddvtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=217.182.185.173; envelope-from=clg@kaod.org;
 helo=smtpout4.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hAg1SKuaPH4j

AspeedSMCFlash is a small structure representing the AHB memory window
through which the contents of a flash device can be accessed with MMIOs.

Introduce an AspeedSMCFlash SysBusDevice model and attach the associated
memory region to the newly instantiated objects.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/ssi/aspeed_smc.h | 13 +++++--
 hw/ssi/aspeed_smc.c         | 76 +++++++++++++++++++++++++++++++++----
 2 files changed, 77 insertions(+), 12 deletions(-)

diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
index 40b6926b3e02..ee943228b96f 100644
--- a/include/hw/ssi/aspeed_smc.h
+++ b/include/hw/ssi/aspeed_smc.h
@@ -30,18 +30,23 @@
 #include "qom/object.h"
 
 struct AspeedSMCState;
-typedef struct AspeedSMCFlash {
-    struct AspeedSMCState *controller;
 
+#define TYPE_ASPEED_SMC_FLASH "aspeed.smc.flash"
+OBJECT_DECLARE_SIMPLE_TYPE(AspeedSMCFlash, ASPEED_SMC_FLASH)
+struct AspeedSMCFlash {
+    SysBusDevice parent_obj;
+
+    struct AspeedSMCState *controller;
     uint8_t cs;
 
     MemoryRegion mmio;
-} AspeedSMCFlash;
+};
 
 #define TYPE_ASPEED_SMC "aspeed.smc"
 OBJECT_DECLARE_TYPE(AspeedSMCState, AspeedSMCClass, ASPEED_SMC)
 
 #define ASPEED_SMC_R_MAX        (0x100 / 4)
+#define ASPEED_SMC_CS_MAX       5
 
 struct AspeedSMCState {
     SysBusDevice parent_obj;
@@ -72,7 +77,7 @@ struct AspeedSMCState {
     MemoryRegion *dram_mr;
     AddressSpace dram_as;
 
-    AspeedSMCFlash *flashes;
+    AspeedSMCFlash flashes[ASPEED_SMC_CS_MAX];
 
     uint8_t snoop_index;
     uint8_t snoop_dummies;
diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 643cde832396..c534e9bf87ee 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -1101,6 +1101,18 @@ static const MemoryRegionOps aspeed_smc_ops = {
     .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
+static void aspeed_smc_instance_init(Object *obj)
+{
+    AspeedSMCState *s = ASPEED_SMC(obj);
+    AspeedSMCClass *asc = ASPEED_SMC_GET_CLASS(s);
+    int i;
+
+    for (i = 0; i < asc->max_peripherals; i++) {
+        object_initialize_child(obj, "flash[*]", &s->flashes[i],
+                                TYPE_ASPEED_SMC_FLASH);
+    }
+}
+
 /*
  * Initialize the custom address spaces for DMAs
  */
@@ -1123,7 +1135,6 @@ static void aspeed_smc_realize(DeviceState *dev, Error **errp)
     AspeedSMCState *s = ASPEED_SMC(dev);
     AspeedSMCClass *asc = ASPEED_SMC_GET_CLASS(s);
     int i;
-    char name[32];
     hwaddr offset = 0;
 
     /* keep a copy under AspeedSMCState to speed up accesses */
@@ -1170,8 +1181,6 @@ static void aspeed_smc_realize(DeviceState *dev, Error **errp)
                              &s->mmio_flash, 0, asc->flash_window_size);
     sysbus_init_mmio(sbd, &s->mmio_flash_alias);
 
-    s->flashes = g_new0(AspeedSMCFlash, asc->max_peripherals);
-
     /*
      * Let's create a sub memory region for each possible peripheral. All
      * have a configurable memory segment in the overall flash mapping
@@ -1182,12 +1191,17 @@ static void aspeed_smc_realize(DeviceState *dev, Error **errp)
     for (i = 0; i < asc->max_peripherals; ++i) {
         AspeedSMCFlash *fl = &s->flashes[i];
 
-        snprintf(name, sizeof(name), TYPE_ASPEED_SMC ".flash.%d", i);
+        if (!object_property_set_link(OBJECT(fl), "controller", OBJECT(s),
+                                      errp)) {
+            return;
+        }
+        if (!object_property_set_uint(OBJECT(fl), "cs", i, errp)) {
+            return;
+        }
+        if (!sysbus_realize(SYS_BUS_DEVICE(fl), errp)) {
+            return;
+        }
 
-        fl->cs = i;
-        fl->controller = s;
-        memory_region_init_io(&fl->mmio, OBJECT(s), &aspeed_smc_flash_ops,
-                              fl, name, asc->segments[i].size);
         memory_region_add_subregion(&s->mmio_flash, offset, &fl->mmio);
         offset += asc->segments[i].size;
     }
@@ -1231,12 +1245,57 @@ static void aspeed_smc_class_init(ObjectClass *klass, void *data)
 static const TypeInfo aspeed_smc_info = {
     .name           = TYPE_ASPEED_SMC,
     .parent         = TYPE_SYS_BUS_DEVICE,
+    .instance_init  = aspeed_smc_instance_init,
     .instance_size  = sizeof(AspeedSMCState),
     .class_size     = sizeof(AspeedSMCClass),
     .class_init     = aspeed_smc_class_init,
     .abstract       = true,
 };
 
+static void aspeed_smc_flash_realize(DeviceState *dev, Error **errp)
+{
+    AspeedSMCFlash *s = ASPEED_SMC_FLASH(dev);
+    AspeedSMCClass *asc;
+    g_autofree char *name = g_strdup_printf(TYPE_ASPEED_SMC_FLASH ".%d", s->cs);
+
+    if (!s->controller) {
+        error_setg(errp, TYPE_ASPEED_SMC_FLASH ": 'controller' link not set");
+        return;
+    }
+
+    asc = ASPEED_SMC_GET_CLASS(s->controller);
+
+    /*
+     * Use the default segment value to size the memory region. This
+     * can be changed by FW at runtime.
+     */
+    memory_region_init_io(&s->mmio, OBJECT(s), &aspeed_smc_flash_ops,
+                          s, name, asc->segments[s->cs].size);
+    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->mmio);
+}
+
+static Property aspeed_smc_flash_properties[] = {
+    DEFINE_PROP_UINT8("cs", AspeedSMCFlash, cs, 0),
+    DEFINE_PROP_LINK("controller", AspeedSMCFlash, controller, TYPE_ASPEED_SMC,
+                     AspeedSMCState *),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void aspeed_smc_flash_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->desc = "Aspeed SMC Flash device region";
+    dc->realize = aspeed_smc_flash_realize;
+    device_class_set_props(dc, aspeed_smc_flash_properties);
+}
+
+static const TypeInfo aspeed_smc_flash_info = {
+    .name           = TYPE_ASPEED_SMC_FLASH,
+    .parent         = TYPE_SYS_BUS_DEVICE,
+    .instance_size  = sizeof(AspeedSMCFlash),
+    .class_init     = aspeed_smc_flash_class_init,
+};
 
 /*
  * The Segment Registers of the AST2400 and AST2500 have a 8MB
@@ -1625,6 +1684,7 @@ static const TypeInfo aspeed_2600_spi2_info = {
 
 static void aspeed_smc_register_types(void)
 {
+    type_register_static(&aspeed_smc_flash_info);
     type_register_static(&aspeed_smc_info);
     type_register_static(&aspeed_2400_smc_info);
     type_register_static(&aspeed_2400_fmc_info);
-- 
2.31.1

