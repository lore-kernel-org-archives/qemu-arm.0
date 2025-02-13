Received: by 2002:a17:504:240b:b0:1be9:327d:8ee3 with SMTP id v11csp345767njc;
        Wed, 12 Feb 2025 19:41:42 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUKTzCUeI5rNM5tspov44MrjSJd2104rgjW9oWrb6yBl8xVNkrolqS+bORffMt7PJxhjbyQkeIk9u47YA==@linaro.org
X-Google-Smtp-Source: AGHT+IH+VkpvXlDjsGO0Lm7LO8fkeaNRzavsueB3sGmGpi2YLG6rEQGFKhaBw40IYZv36LJlHHDp
X-Received: by 2002:ad4:5ba7:0:b0:6d8:9bbe:392d with SMTP id 6a1803df08f44-6e46ed775b9mr83361196d6.6.1739418102642;
        Wed, 12 Feb 2025 19:41:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739418102; cv=none;
        d=google.com; s=arc-20240605;
        b=f4nAJ/h8U0lGdbkAV/GwmMBvo45GYLgptbNDmnmgw9tve/bS9olSxf4VIFUG+mgdWD
         +EPT335QO8Vai6rH2nyJaltl5NnrRVwMKQVStc9CF4Ysj/T4VZKbj7cMqQ+zsPe05Ksu
         KZwSDlYM25SuuFkTGOvyrN0fKjV+6V4fk+FJzzePHqfrSc6tRaDTv0dlTtYOQwmD8sg1
         QAsFjvU2mrIlC1lwV7DdRwMw6CAMLraeHkpYl+F0yW5uYq/sK3twlQGQS2NinCXVPJ8R
         VzZ8plmenb9fcyYeAamIR9cxizN/HhL34Dp0Oepc00DUS2k2Im3uNkaXYYAhlzaCuTEX
         BG6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=z8icjOU0hZ6JDh4rw53WvQrWauYiNvp7fj/1z37Ckd8=;
        fh=08d/IJI4U+AnOjHRYBcV+/5HqY2oyeWSX1NtojG11zk=;
        b=YaaTIL90azeENBIDPW/NSVDju7/ponN5ReVBDWZJGnZJyHdrEXqUWCrkAAtZpAntxx
         ZMXK5+zT5k2g6jXgPPXxiKb+mQMMTRq8T47cNw0MIsbtk9T6pF2vDTYN+cEnTasX51uI
         JLrmc1s7xbGl/ZEhj8mi+pHCan70Htce3q8mjbSUYjS4dGg6dlCbJbE8CvEPOG2I4qiq
         5cDJu4ud4aITBGljH+DAKgHuODhQ/lAuugwb6JodoiwdDbbIHKR7U1SU9AfIhCOu+Xuh
         tHC175Y7t0cmLK8mcuXK8cBSXD7s/NmAPlqdyCdQDN8RzUSlMgEuINbNuzD+EQ1W0Pwk
         QOuw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e65d733aa4si6575916d6.32.2025.02.12.19.41.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Feb 2025 19:41:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tiQ2N-0008Pg-8j; Wed, 12 Feb 2025 22:37:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tiQ2E-0008IL-P8; Wed, 12 Feb 2025 22:37:07 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tiQ2D-0000nL-2v; Wed, 12 Feb 2025 22:37:06 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 13 Feb
 2025 11:35:38 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 13 Feb 2025 11:35:38 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>
Subject: [PATCH v3 18/28] hw/arm/aspeed: Add SoC and Machine Support for
 AST2700 A1
Date: Thu, 13 Feb 2025 11:35:21 +0800
Message-ID: <20250213033531.3367697-19-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250213033531.3367697-1-jamin_lin@aspeedtech.com>
References: <20250213033531.3367697-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
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
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 1UcbGSsfAt3i

The memory map for AST2700 A1 remains compatible with AST2700 A0. However, the
IRQ mapping has been updated for AST2700 A1, with GIC interrupts now ranging
from 192 to 201. Add a new IRQ map table for AST2700 A1.
Add "aspeed_soc_ast2700a1_class_init" to initialize the AST2700 A1 SoC.
Introduce "aspeed_machine_ast2700a1_evb_class_init" to initialize the
AST2700 A1 EVB.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/arm/aspeed.c         | 13 +++++++
 hw/arm/aspeed_ast27x0.c | 80 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 93 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 6ddfdbdeba..c0539e5950 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -1672,6 +1672,15 @@ static void aspeed_machine_ast2700a0_evb_class_init(ObjectClass *oc, void *data)
     mc->default_ram_size = 1 * GiB;
     aspeed_machine_class_init_cpus_defaults(mc);
 }
+
+static void aspeed_machine_ast2700a1_evb_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    AspeedMachineClass *amc = ASPEED_MACHINE_CLASS(oc);
+
+    mc->desc = "Aspeed AST2700 A1 EVB (Cortex-A35)";
+    amc->soc_name  = "ast2700-a1";
+}
 #endif
 
 static void aspeed_machine_qcom_dc_scm_v1_class_init(ObjectClass *oc,
@@ -1798,6 +1807,10 @@ static const TypeInfo aspeed_machine_types[] = {
         .name          = MACHINE_TYPE_NAME("ast2700a0-evb"),
         .parent        = TYPE_ASPEED_MACHINE,
         .class_init    = aspeed_machine_ast2700a0_evb_class_init,
+        }, {
+        .name          = MACHINE_TYPE_NAME("ast2700a1-evb"),
+        .parent        = MACHINE_TYPE_NAME("ast2700a0-evb"),
+        .class_init    = aspeed_machine_ast2700a1_evb_class_init,
 #endif
     }, {
         .name          = TYPE_ASPEED_MACHINE,
diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
index 0ccec774de..926b4c3e76 100644
--- a/hw/arm/aspeed_ast27x0.c
+++ b/hw/arm/aspeed_ast27x0.c
@@ -119,6 +119,52 @@ static const int aspeed_soc_ast2700a0_irqmap[] = {
     [ASPEED_DEV_SDHCI]     = 133,
 };
 
+static const int aspeed_soc_ast2700a1_irqmap[] = {
+    [ASPEED_DEV_SDMC]      = 0,
+    [ASPEED_DEV_HACE]      = 4,
+    [ASPEED_DEV_XDMA]      = 5,
+    [ASPEED_DEV_UART4]     = 8,
+    [ASPEED_DEV_SCU]       = 12,
+    [ASPEED_DEV_RTC]       = 13,
+    [ASPEED_DEV_EMMC]      = 15,
+    [ASPEED_DEV_TIMER1]    = 16,
+    [ASPEED_DEV_TIMER2]    = 17,
+    [ASPEED_DEV_TIMER3]    = 18,
+    [ASPEED_DEV_TIMER4]    = 19,
+    [ASPEED_DEV_TIMER5]    = 20,
+    [ASPEED_DEV_TIMER6]    = 21,
+    [ASPEED_DEV_TIMER7]    = 22,
+    [ASPEED_DEV_TIMER8]    = 23,
+    [ASPEED_DEV_DP]        = 28,
+    [ASPEED_DEV_LPC]       = 192,
+    [ASPEED_DEV_IBT]       = 192,
+    [ASPEED_DEV_KCS]       = 192,
+    [ASPEED_DEV_I2C]       = 194,
+    [ASPEED_DEV_ADC]       = 194,
+    [ASPEED_DEV_GPIO]      = 194,
+    [ASPEED_DEV_FMC]       = 195,
+    [ASPEED_DEV_WDT]       = 195,
+    [ASPEED_DEV_PWM]       = 195,
+    [ASPEED_DEV_I3C]       = 195,
+    [ASPEED_DEV_UART0]     = 196,
+    [ASPEED_DEV_UART1]     = 196,
+    [ASPEED_DEV_UART2]     = 196,
+    [ASPEED_DEV_UART3]     = 196,
+    [ASPEED_DEV_UART5]     = 196,
+    [ASPEED_DEV_UART6]     = 196,
+    [ASPEED_DEV_UART7]     = 196,
+    [ASPEED_DEV_UART8]     = 196,
+    [ASPEED_DEV_UART9]     = 196,
+    [ASPEED_DEV_UART10]    = 196,
+    [ASPEED_DEV_UART11]    = 196,
+    [ASPEED_DEV_UART12]    = 196,
+    [ASPEED_DEV_ETH1]      = 196,
+    [ASPEED_DEV_ETH2]      = 196,
+    [ASPEED_DEV_ETH3]      = 196,
+    [ASPEED_DEV_PECI]      = 197,
+    [ASPEED_DEV_SDHCI]     = 197,
+};
+
 /* GICINT 128 */
 /* GICINT 192 */
 static const int ast2700_gic128_gic192_intcmap[] = {
@@ -838,6 +884,34 @@ static void aspeed_soc_ast2700a0_class_init(ObjectClass *oc, void *data)
     sc->get_irq      = aspeed_soc_ast2700_get_irq;
 }
 
+static void aspeed_soc_ast2700a1_class_init(ObjectClass *oc, void *data)
+{
+    static const char * const valid_cpu_types[] = {
+        ARM_CPU_TYPE_NAME("cortex-a35"),
+        NULL
+    };
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    AspeedSoCClass *sc = ASPEED_SOC_CLASS(oc);
+
+    /* Reason: The Aspeed SoC can only be instantiated from a board */
+    dc->user_creatable = false;
+    dc->realize      = aspeed_soc_ast2700_realize;
+
+    sc->name         = "ast2700-a1";
+    sc->valid_cpu_types = valid_cpu_types;
+    sc->silicon_rev  = AST2700_A1_SILICON_REV;
+    sc->sram_size    = 0x20000;
+    sc->spis_num     = 3;
+    sc->wdts_num     = 8;
+    sc->macs_num     = 3;
+    sc->uarts_num    = 13;
+    sc->num_cpus     = 4;
+    sc->uarts_base   = ASPEED_DEV_UART0;
+    sc->irqmap       = aspeed_soc_ast2700a1_irqmap;
+    sc->memmap       = aspeed_soc_ast2700_memmap;
+    sc->get_irq      = aspeed_soc_ast2700_get_irq;
+}
+
 static const TypeInfo aspeed_soc_ast27x0_types[] = {
     {
         .name           = TYPE_ASPEED27X0_SOC,
@@ -850,6 +924,12 @@ static const TypeInfo aspeed_soc_ast27x0_types[] = {
         .instance_init  = aspeed_soc_ast2700_init,
         .class_init     = aspeed_soc_ast2700a0_class_init,
     },
+    {
+        .name           = "ast2700-a1",
+        .parent         = TYPE_ASPEED27X0_SOC,
+        .instance_init  = aspeed_soc_ast2700_init,
+        .class_init     = aspeed_soc_ast2700a1_class_init,
+    },
 };
 
 DEFINE_TYPES(aspeed_soc_ast27x0_types)
-- 
2.34.1

