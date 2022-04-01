Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp575578lfb;
        Thu, 31 Mar 2022 20:53:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzW1KvNgEu0dUzLgQk/VawGO8KDn03aIFyr7iddsmkVRCb9yhi0M1WdMw9l2cYvCzUhkBsN
X-Received: by 2002:ad4:5dc7:0:b0:443:6f15:fe32 with SMTP id m7-20020ad45dc7000000b004436f15fe32mr6422940qvh.6.1648785185789;
        Thu, 31 Mar 2022 20:53:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648785185; cv=none;
        d=google.com; s=arc-20160816;
        b=ty6bZu6nUADKsTqlWDchmwk1AYWrh/kzmHQDiRBOLPev3cSyeylWCfs1oNTiOa2hNU
         Zvhmmbu7bint/V3r7ok1rsjlddSRROe7D22CX6ZWKSzPy3QlVHh6HORhl3ZVVNeaTkk7
         7AF/p/HweFKt5advBWSXGhwoeEswijURNeg2Kvi0QSCe27yHaiJ/GxdRlJHh8krzl9Bo
         J9F83++LKng3CTML0QyoUJvoVwLTCAY9Gk6UwehbfIek/ryIV2hUpMjFyREpQ71DyY3g
         qREo6APVzDtT1YBSjeXwx/8rlvsmaiFar2vg4zr5Trh+A88/dpBSHRUj3gfcJvpGsugn
         MqMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=pJM/LNzRx1+n63j8mTdOIkojrmV+oY1YtrMXGFZECoc=;
        b=Mnt2xuQjoCQF7l8Gl+XRweaadHeLC/WfsFReUtW4Ab2nsKmeL6prBbiFb9yUBhtGc6
         of0eeS3mK/kL8i+lsOqDu2XdSYlUgXQMBbsiWY1ntjAybQwTZszdbalK7+bl5rkqrmSP
         mkDbCUtkkWW4i6ZmRyMZV6g8zGXVX1ktz/WMqXdFkN/wQahR8gM77otUl5lne1WV7m0D
         NHJQCua1Y8YgdjG6AK0wAue+zT8Wi+mbovlA7VyGcutywkzAbII1zGXoSlHKBGgc7wZG
         ozzly3W2pzlQ/tKO2Q8eiyp+8XqkS9T7ca5XuUYz5namKUckLPxZE58OjXP4i6w3ySeg
         Qpkg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o13-20020a05620a0d4d00b0067e4be23964si782507qkl.425.2022.03.31.20.53.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Mar 2022 20:53:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1na8LR-0004yz-6F
	for alex.bennee@linaro.org; Thu, 31 Mar 2022 23:53:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1na8Go-0003Ce-Hz; Thu, 31 Mar 2022 23:48:18 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:39636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1na8Gm-0000tO-GE; Thu, 31 Mar 2022 23:48:18 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 2313Zumt095963;
 Fri, 1 Apr 2022 11:35:56 +0800 (GMT-8)
 (envelope-from jamin_lin@aspeedtech.com)
Received: from localhost.localdomain (192.168.70.87) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 1 Apr
 2022 11:46:56 +0800
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, Alistair Francis <alistair@alistair23.me>, Cleber Rosa
 <crosa@redhat.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "Beraldo Leal" <bleal@redhat.com>, "open list:ASPEED BMCs"
 <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
Subject: [PATCH v4 8/9] aspeed: Add an AST1030 eval board
Date: Fri, 1 Apr 2022 11:46:50 +0800
Message-ID: <20220401034651.9066-9-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220401034651.9066-1-jamin_lin@aspeedtech.com>
References: <20220401034651.9066-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.70.87]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 2313Zumt095963
Received-SPF: pass client-ip=211.20.114.71;
 envelope-from=jamin_lin@aspeedtech.com; helo=twspam01.aspeedtech.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: jamin_lin@aspeedtech.com, troy_lee@aspeedtech.com,
 steven_lee@aspeedtech.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NmNpU54FDwhh

The image should be supplied with ELF binary.
$ qemu-system-arm -M ast1030-evb -kernel zephyr.elf -nographic

Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
---
 hw/arm/aspeed.c         | 97 +++++++++++++++++++++++++++++++++++++++++
 include/hw/arm/aspeed.h |  6 +--
 2 files changed, 100 insertions(+), 3 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index d205384d98..30b49d2db1 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -24,6 +24,7 @@
 #include "hw/loader.h"
 #include "qemu/error-report.h"
 #include "qemu/units.h"
+#include "hw/qdev-clock.h"
 
 static struct arm_boot_info aspeed_board_binfo = {
     .board_id = -1, /* device-tree-only board */
@@ -1361,3 +1362,99 @@ static const TypeInfo aspeed_machine_types[] = {
 };
 
 DEFINE_TYPES(aspeed_machine_types)
+
+#define AST1030_INTERNAL_FLASH_SIZE (1024 * 1024)
+/* Main SYSCLK frequency in Hz (200MHz) */
+#define SYSCLK_FRQ 200000000ULL
+
+static void aspeed_minibmc_machine_ast1030_evb_class_init(ObjectClass *oc,
+                                                          void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    AspeedMachineClass *amc = ASPEED_MINIBMC_MACHINE_CLASS(oc);
+
+    mc->desc = "Aspeed AST1030 MiniBMC (Cortex-M4)";
+    amc->soc_name = "ast1030-a1";
+    amc->hw_strap1 = 0;
+    amc->hw_strap2 = 0;
+    mc->default_ram_size = 0;
+    mc->default_cpus = mc->min_cpus = mc->max_cpus = 1;
+    amc->fmc_model = "sst25vf032b";
+    amc->spi_model = "sst25vf032b";
+    amc->num_cs = 2;
+}
+
+static void ast1030_machine_instance_init(Object *obj)
+{
+    ASPEED_MINIBMC_MACHINE(obj)->mmio_exec = false;
+}
+
+static void aspeed_minibmc_machine_init(MachineState *machine)
+{
+    AspeedMachineState *bmc = ASPEED_MINIBMC_MACHINE(machine);
+    AspeedMachineClass *amc = ASPEED_MINIBMC_MACHINE_GET_CLASS(machine);
+    Clock *sysclk;
+
+    sysclk = clock_new(OBJECT(machine), "SYSCLK");
+    clock_set_hz(sysclk, SYSCLK_FRQ);
+
+    object_initialize_child(OBJECT(machine), "soc", &bmc->soc, amc->soc_name);
+    qdev_connect_clock_in(DEVICE(&bmc->soc), "sysclk", sysclk);
+
+    qdev_prop_set_uint32(DEVICE(&bmc->soc), "uart-default",
+                         amc->uart_default);
+    qdev_realize(DEVICE(&bmc->soc), NULL, &error_abort);
+
+    aspeed_board_init_flashes(&bmc->soc.fmc,
+                              bmc->fmc_model ? bmc->fmc_model : amc->fmc_model,
+                              amc->num_cs,
+                              0);
+
+    aspeed_board_init_flashes(&bmc->soc.spi[0],
+                              bmc->spi_model ? bmc->spi_model : amc->spi_model,
+                              amc->num_cs, amc->num_cs);
+
+    aspeed_board_init_flashes(&bmc->soc.spi[1],
+                              bmc->spi_model ? bmc->spi_model : amc->spi_model,
+                              amc->num_cs, (amc->num_cs * 2));
+
+    if (amc->i2c_init) {
+        amc->i2c_init(bmc);
+    }
+
+    armv7m_load_kernel(ARM_CPU(first_cpu),
+                       machine->kernel_filename,
+                       AST1030_INTERNAL_FLASH_SIZE);
+}
+
+static void aspeed_minibmc_machine_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    AspeedMachineClass *amc = ASPEED_MINIBMC_MACHINE_CLASS(oc);
+
+    mc->init = aspeed_minibmc_machine_init;
+    mc->no_floppy = 1;
+    mc->no_cdrom = 1;
+    mc->no_parallel = 1;
+    mc->default_ram_id = "ram";
+    amc->uart_default = ASPEED_DEV_UART5;
+}
+
+static const TypeInfo aspeed_minibmc_machine_types[] = {
+    {
+        .name           = MACHINE_TYPE_NAME("ast1030-evb"),
+        .parent         = TYPE_ASPEED_MINIBMC_MACHINE,
+        .class_init     = aspeed_minibmc_machine_ast1030_evb_class_init,
+    }, {
+        .name           = TYPE_ASPEED_MINIBMC_MACHINE,
+        .parent         = TYPE_MACHINE,
+        .instance_size  = sizeof(AspeedMachineState),
+        .instance_init  = ast1030_machine_instance_init,
+        .class_size    = sizeof(AspeedMachineClass),
+        .class_init    = aspeed_minibmc_machine_class_init,
+        .abstract      = true,
+    }
+};
+
+DEFINE_TYPES(aspeed_minibmc_machine_types)
+
diff --git a/include/hw/arm/aspeed.h b/include/hw/arm/aspeed.h
index cbeacb214c..b7411c860d 100644
--- a/include/hw/arm/aspeed.h
+++ b/include/hw/arm/aspeed.h
@@ -13,18 +13,19 @@
 #include "qom/object.h"
 
 typedef struct AspeedMachineState AspeedMachineState;
-
 #define TYPE_ASPEED_MACHINE       MACHINE_TYPE_NAME("aspeed")
+#define TYPE_ASPEED_MINIBMC_MACHINE MACHINE_TYPE_NAME("aspeed-minibmc")
 typedef struct AspeedMachineClass AspeedMachineClass;
 DECLARE_OBJ_CHECKERS(AspeedMachineState, AspeedMachineClass,
                      ASPEED_MACHINE, TYPE_ASPEED_MACHINE)
+DECLARE_OBJ_CHECKERS(AspeedMachineState, AspeedMachineClass,
+                     ASPEED_MINIBMC_MACHINE, TYPE_ASPEED_MINIBMC_MACHINE)
 
 #define ASPEED_MAC0_ON   (1 << 0)
 #define ASPEED_MAC1_ON   (1 << 1)
 #define ASPEED_MAC2_ON   (1 << 2)
 #define ASPEED_MAC3_ON   (1 << 3)
 
-
 struct AspeedMachineClass {
     MachineClass parent_obj;
 
@@ -41,5 +42,4 @@ struct AspeedMachineClass {
     uint32_t uart_default;
 };
 
-
 #endif
-- 
2.17.1

