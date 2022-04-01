Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp555816lfb;
        Thu, 31 Mar 2022 20:07:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9zSgD9c8jbBxkOsrxtw7rg0Tt302nyPnKW6xPPKDzrlK2a+shW8+qBvUMXh0VlQE7dAb2
X-Received: by 2002:a05:6214:27cc:b0:441:499f:76ac with SMTP id ge12-20020a05621427cc00b00441499f76acmr6750816qvb.36.1648782465601;
        Thu, 31 Mar 2022 20:07:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648782465; cv=none;
        d=google.com; s=arc-20160816;
        b=uZVrDPJZWbZ8rQfZfutM+q4dqV7OVDZJcHAa4RtjWNiEIsnq6Rr8GL5rPLbMIVYSxr
         Q/OZdp14lK/iWPn0mVT28mgkKtknyPJ6sBSWOWkgJwyhOoVXpZM9EvWwMHy2IY5v9f27
         XZHd5AHSG2vBa2Aiw9/CWdA49UlLA+dQxOStFEjF+uttvr1H13e58XfmFmALgUz802C+
         Z8n1/fupySLpTy5CQfFnImTwnONjZmcg78Bof32huOvhwV0BFTya4xsGXeLr87vMlLFp
         6hzgoqGlZDtkl5zKVC3B4qK3fKnEzChoFtPKYL+t+FP0iUoM63FUjO/rQ8SSPQWVlJEu
         yDog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=pJM/LNzRx1+n63j8mTdOIkojrmV+oY1YtrMXGFZECoc=;
        b=OH0o4LSpD7saPWUegWIekMdfWeBKPB8DKNDpIl81Hl1pJAlJPiRTREdgRkaXoMVMFp
         dXxyIGnsHh5xISQbKyjEKwlT18O82spBMGQU5kW4W+F3+WcWh68dJlSjW+ba2yEk2+vS
         9ON0t8NP1LmrMQ8pgEhdQKrk2oPj4XB4ft4p7EETPt4TJX2ySEp9vf9ZoCgtjvhgtREC
         O/323Ap5tOmtAo903Jfw4LI8rkPplGQ4Q7X+0NzHNs9I4bnf+jcKRPQkdhGlt+zyyp8c
         /QxAuVk9ageehr+CxsIlGujb1WeJE3Ow2/mgz+s3C1KGpvL6DRQaiNtVh1OwIPVclU77
         NNZg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j15-20020ac806cf000000b002e1fbf3befesi628584qth.239.2022.03.31.20.07.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Mar 2022 20:07:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1na7dZ-0006JV-1w
	for alex.bennee@linaro.org; Thu, 31 Mar 2022 23:07:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1na7cQ-0004ck-D0; Thu, 31 Mar 2022 23:06:35 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:48536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1na7cN-0002mg-OD; Thu, 31 Mar 2022 23:06:34 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 2312sDCK090591;
 Fri, 1 Apr 2022 10:54:13 +0800 (GMT-8)
 (envelope-from jamin_lin@aspeedtech.com)
Received: from localhost.localdomain (192.168.70.87) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 1 Apr
 2022 11:05:14 +0800
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, Alistair Francis <alistair@alistair23.me>, Cleber Rosa
 <crosa@redhat.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "Beraldo Leal" <bleal@redhat.com>, "open list:ASPEED BMCs"
 <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
Subject: [PATCH v3 8/9] aspeed: Add an AST1030 eval board
Date: Fri, 1 Apr 2022 11:05:07 +0800
Message-ID: <20220401030508.28133-9-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220401030508.28133-1-jamin_lin@aspeedtech.com>
References: <20220401030508.28133-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.70.87]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 2312sDCK090591
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
X-TUID: zK0RIZTXY7eB

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

