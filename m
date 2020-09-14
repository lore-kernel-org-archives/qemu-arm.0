Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp2629737lfq;
        Mon, 14 Sep 2020 15:11:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxHM7FVxB2+WQOWT0cWdSL4LrEgsSIOTwSuYyRo9iKhmTAPKl4XqABotNeoi0rR4yIMTydn
X-Received: by 2002:ae9:f209:: with SMTP id m9mr14737356qkg.301.1600121472491;
        Mon, 14 Sep 2020 15:11:12 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1600121472; cv=pass;
        d=google.com; s=arc-20160816;
        b=Jh1GJvMMJkJnzvlvj2UbMZeUV7Joq2fs0BOw22HeG5TqVuE341k+xoC1JTuJQeQMXj
         1WGOqvY7yvgOIy5DN7DFtJkitSgxZkj3DIGFNUgu9nq66iZbTf95DhGVT2HmpOKdb5n5
         EwzpBGU3NX3aYBCbpUZ5mV6LOIlJIBd4BlB2luc3m0xgcfM9lSM+0SiYBsVRajCh8zQL
         y5BFm0k5mlpHG5tktokGMsSEppIDAnMrsMJi0yVOwGB096SIgbNkUqpVsxBJY/2K92Yp
         dc3A9Ak0ijgh+VhZ4Az+n7PJ1NzqKGPk4/xzOUsS8uHFMoPXYIahXo3DNyQmdah+8Rul
         hkqg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:dkim-signature;
        bh=R5o2BH4H16hNvgbWdLBjKXwDZeYei+QOB7tl1xYlzy4=;
        b=aDv3XivAcRp7YqbeMGBVXTV0mZcq/eu7uRJ5367F8eNY8UzVtMaQTTvsoJTclQ2Dg9
         jgtlsPjmaFeoF+Tb+qFx36kA/IZQCCpdS1bgYQuPKfB5Sc8slkgDzaPUbMueCNWqQtcw
         ObGP6XC42MaDg2pQFo59y3gONTLVoZW0QZY282pMwpKYvPiAYwX47xE6z0Tvg43Qs/sH
         HlyjlxzlDCHHFwAlVoGJZ+876H8EoKr+lm3Nd2aYOE2fuJI/+Ns8Y3pn7GiO3JZA9KlA
         /9OCUl2qTypDPBnwgSMqv48qAshUMCi/7YmHDKycI67HK0HRqGioWF5VUqaezYIQryXq
         fsxQ==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@xilinx.onmicrosoft.com header.s=selector2-xilinx-onmicrosoft-com header.b=XXqX8K91;
       arc=pass (i=1 spf=pass spfdomain=xilinx.com);
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 4si7712345qtu.94.2020.09.14.15.11.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Sep 2020 15:11:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@xilinx.onmicrosoft.com header.s=selector2-xilinx-onmicrosoft-com header.b=XXqX8K91;
       arc=pass (i=1 spf=pass spfdomain=xilinx.com);
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kHwgp-0003GO-PK
	for alex.bennee@linaro.org; Mon, 14 Sep 2020 18:11:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fnuv@xilinx.com>)
 id 1kHwfC-00020w-AW; Mon, 14 Sep 2020 18:09:30 -0400
Received: from mail-dm6nam10on2075.outbound.protection.outlook.com
 ([40.107.93.75]:40096 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fnuv@xilinx.com>)
 id 1kHwf8-0000b3-20; Mon, 14 Sep 2020 18:09:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JR3yU5F8Pe9vThgMzwoZYOBz1PfPhPyNszhu+CIZgwNcwvpJkLCPnd7as9I9Enh1wuR3DXZe9zqMyGJq5+8bVyYSQokSZ+qoqt6m4RrzOzHRX3JT93v59RKF0u1ORHmhA651CxFjg7XcLgBK49HwQiCwqrqokacRQV9ArJcjD+TcCF17LMsFaslBtaBmIz/+b/q9zmDSgwXeqYo2AJr77YqrxwQ21VpQRtXRlGe6Wb/+zrUYC+GcvTqZrWEiRtOxF6vbY++bByqvgK/Lw4uJIJXGCEu8saF+Dymp3+GvXZaoGoB+t2u5lojmjBQf+Py+9HK3QfK7D4v1TMs+r3j1xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R5o2BH4H16hNvgbWdLBjKXwDZeYei+QOB7tl1xYlzy4=;
 b=Mwd8qeIvU4ao1SfF+aGlEVD6jcTJKGMsYTtmu+8Why/ag7CEMIel4GI5+4pYzJXeguXrgJMXgkbIluTCrVZFgj3heqWMTdCCBlOhkmmx9Y+dYSX10jJ3lCQsmGRfCvx+9TPg6kZ8t5HCXdOYdiihR4K94NOUmPR5x8G1iN1XhArEu7fgnGIZxpblyt0ef6VpXlPalXY3kgI3FIFYZZG2sB3Dadp9VCgP0CyQOwmrWFH8OtiLMjBR8Hkn2U/Pu1gkwxMrIZKY2i9uCFBQU7RkPJ7SlUtrZPCPaogUMdeEWn7BO6/UgBzE8YDIFdum7VV+vS01V/cNbwSEx1pa8JRtag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R5o2BH4H16hNvgbWdLBjKXwDZeYei+QOB7tl1xYlzy4=;
 b=XXqX8K91xtNhJznXx84CKjRsGGVVzJ53G5o1CWJZUfPV8UESpGdNmnvDk/UccDPWppioth62JatIKVhkJVmRLRdsgNdhoP0J0fxEOKFkAG3W1CvHP67q7a6oRpnOGCmgPi5xwebDVG8CiyzvppCRyNznWbMV1SrPpteCrtlA1bs=
Received: from CY4PR02CA0019.namprd02.prod.outlook.com (2603:10b6:903:18::29)
 by SN6PR02MB5390.namprd02.prod.outlook.com (2603:10b6:805:ea::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Mon, 14 Sep
 2020 22:09:17 +0000
Received: from CY1NAM02FT016.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:18:cafe::e9) by CY4PR02CA0019.outlook.office365.com
 (2603:10b6:903:18::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16 via Frontend
 Transport; Mon, 14 Sep 2020 22:09:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT016.mail.protection.outlook.com (10.152.75.164) with Microsoft SMTP
 Server id 15.20.3370.16 via Frontend Transport; Mon, 14 Sep 2020 22:09:17
 +0000
Received: from [149.199.38.66] (port=48267 helo=smtp.xilinx.com)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
 (envelope-from <fnu.vikram@xilinx.com>)
 id 1kHweu-0003rb-6N; Mon, 14 Sep 2020 15:09:12 -0700
Received: from [127.0.0.1] (helo=localhost)
 by smtp.xilinx.com with smtp (Exim 4.63)
 (envelope-from <fnu.vikram@xilinx.com>)
 id 1kHwey-0006ms-VH; Mon, 14 Sep 2020 15:09:17 -0700
Received: from xsj-pvapsmtp01 (xsj-smtp1.xilinx.com [149.199.38.66])
 by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 08EM979H016761; 
 Mon, 14 Sep 2020 15:09:07 -0700
Received: from [172.19.2.115] (helo=xsjfnuv50.xilinx.com)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <fnu.vikram@xilinx.com>)
 id 1kHwep-0006b8-4c; Mon, 14 Sep 2020 15:09:07 -0700
From: Vikram Garhwal <fnu.vikram@xilinx.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v10 2/4] xlnx-zynqmp: Connect Xilinx ZynqMP CAN controllers
Date: Mon, 14 Sep 2020 15:08:42 -0700
Message-Id: <1600121324-31337-3-git-send-email-fnu.vikram@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600121324-31337-1-git-send-email-fnu.vikram@xilinx.com>
References: <1600121324-31337-1-git-send-email-fnu.vikram@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a0310f8f-f962-4d9d-bcbc-08d858fad2a7
X-MS-TrafficTypeDiagnostic: SN6PR02MB5390:
X-Microsoft-Antispam-PRVS: <SN6PR02MB53906D4A3A441A969BBDB2D2BC230@SN6PR02MB5390.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:114;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4VWOAt5lu1j6LGMRegsRRPvDlYJ/WYCzhwm405fy64nG9YUYpKSk3t7qIwEbJyt78BE9KRo+zeoSy8VrFmH6blbm3r8HYDUWLcfZgagRuVNL9aDyWpNOfbHZOVVTZ5xyqI+rgF1eCQKqn19/hmQsLFJu3XGIxauIph7is3Xg5RnRzrk0zLYTuQATc518tRU4kGmqtydaWNCF3BYsxzaZLPU2M0pAF44thCmxouOnPB3QB0kc1tv/zFN2P95ZIovLg2ppqeZ/zBizbsl+OeGW3silLZcgnhHSfIu2MZA7IAQnssyNeWkDVJfSTAeM4WoAacUtamHp4yjRBTWAFiF3PZld9m4yV/lt97oysWW/97L190LsZQ2j8rsjJ2kEoxq6DUKszuVL01vkU4DEy8ut0Q==
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapsmtpgw01; PTR:unknown-60-83.xilinx.com; CAT:NONE;
 SFS:(396003)(376002)(39860400002)(136003)(346002)(46966005)(2616005)(8936002)(4326008)(316002)(6666004)(478600001)(54906003)(70586007)(82310400003)(70206006)(6916009)(356005)(36756003)(9786002)(47076004)(186003)(8676002)(26005)(81166007)(336012)(7696005)(82740400003)(5660300002)(426003)(2906002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2020 22:09:17.2141 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0310f8f-f962-4d9d-bcbc-08d858fad2a7
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT016.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB5390
Received-SPF: pass client-ip=40.107.93.75; envelope-from=fnuv@xilinx.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/14 18:09:24
X-ACL-Warn: Detected OS   = Windows NT kernel [generic] [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, Vikram Garhwal <fnu.vikram@xilinx.com>,
 Alistair Francis <alistair@alistair23.me>, francisco.iglesias@xilinx.com,
 "open list:Xilinx ZynqMP and..." <qemu-arm@nongnu.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6F0vRQ/kIsWu

Connect CAN0 and CAN1 on the ZynqMP.

Reviewed-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
---
 hw/arm/xlnx-zcu102.c         | 20 ++++++++++++++++++++
 hw/arm/xlnx-zynqmp.c         | 34 ++++++++++++++++++++++++++++++++++
 include/hw/arm/xlnx-zynqmp.h |  8 ++++++++
 3 files changed, 62 insertions(+)

diff --git a/hw/arm/xlnx-zcu102.c b/hw/arm/xlnx-zcu102.c
index 19d5a4d..cb0fba7 100644
--- a/hw/arm/xlnx-zcu102.c
+++ b/hw/arm/xlnx-zcu102.c
@@ -25,6 +25,7 @@
 #include "sysemu/qtest.h"
 #include "sysemu/device_tree.h"
 #include "qom/object.h"
+#include "net/can_emu.h"
 
 struct XlnxZCU102 {
     MachineState parent_obj;
@@ -34,6 +35,8 @@ struct XlnxZCU102 {
     bool secure;
     bool virt;
 
+    CanBusState *canbus[XLNX_ZYNQMP_NUM_CAN];
+
     struct arm_boot_info binfo;
 };
 typedef struct XlnxZCU102 XlnxZCU102;
@@ -127,6 +130,14 @@ static void xlnx_zcu102_init(MachineState *machine)
     object_property_set_bool(OBJECT(&s->soc), "virtualization", s->virt,
                              &error_fatal);
 
+    for (i = 0; i < XLNX_ZYNQMP_NUM_CAN; i++) {
+        gchar *bus_name = g_strdup_printf("canbus%d", i);
+
+        object_property_set_link(OBJECT(&s->soc), bus_name,
+                                 OBJECT(s->canbus[i]), &error_fatal);
+        g_free(bus_name);
+    }
+
     qdev_realize(DEVICE(&s->soc), NULL, &error_fatal);
 
     /* Create and plug in the SD cards */
@@ -222,6 +233,15 @@ static void xlnx_zcu102_machine_instance_init(Object *obj)
                                     "Set on/off to enable/disable emulating a "
                                     "guest CPU which implements the ARM "
                                     "Virtualization Extensions");
+    object_property_add_link(obj, "xlnx-zcu102.canbus0", TYPE_CAN_BUS,
+                             (Object **)&s->canbus[0],
+                             object_property_allow_set_link,
+                             0);
+
+    object_property_add_link(obj, "xlnx-zcu102.canbus1", TYPE_CAN_BUS,
+                             (Object **)&s->canbus[1],
+                             object_property_allow_set_link,
+                             0);
 }
 
 static void xlnx_zcu102_machine_class_init(ObjectClass *oc, void *data)
diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 7885bb1..8818472 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -81,6 +81,14 @@ static const int uart_intr[XLNX_ZYNQMP_NUM_UARTS] = {
     21, 22,
 };
 
+static const uint64_t can_addr[XLNX_ZYNQMP_NUM_CAN] = {
+    0xFF060000, 0xFF070000,
+};
+
+static const int can_intr[XLNX_ZYNQMP_NUM_CAN] = {
+    23, 24,
+};
+
 static const uint64_t sdhci_addr[XLNX_ZYNQMP_NUM_SDHCI] = {
     0xFF160000, 0xFF170000,
 };
@@ -243,6 +251,11 @@ static void xlnx_zynqmp_init(Object *obj)
                                 TYPE_CADENCE_UART);
     }
 
+    for (i = 0; i < XLNX_ZYNQMP_NUM_CAN; i++) {
+        object_initialize_child(obj, "can[*]", &s->can[i],
+                                TYPE_XLNX_ZYNQMP_CAN);
+    }
+
     object_initialize_child(obj, "sata", &s->sata, TYPE_SYSBUS_AHCI);
 
     for (i = 0; i < XLNX_ZYNQMP_NUM_SDHCI; i++) {
@@ -482,6 +495,23 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
                            gic_spi[uart_intr[i]]);
     }
 
+    for (i = 0; i < XLNX_ZYNQMP_NUM_CAN; i++) {
+        object_property_set_int(OBJECT(&s->can[i]), "ext_clk_freq",
+                                XLNX_ZYNQMP_CAN_REF_CLK, &error_abort);
+
+        object_property_set_link(OBJECT(&s->can[i]), "canbus",
+                                 OBJECT(s->canbus[i]), &error_fatal);
+
+        sysbus_realize(SYS_BUS_DEVICE(&s->can[i]), &err);
+        if (err) {
+            error_propagate(errp, err);
+            return;
+        }
+        sysbus_mmio_map(SYS_BUS_DEVICE(&s->can[i]), 0, can_addr[i]);
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->can[i]), 0,
+                           gic_spi[can_intr[i]]);
+    }
+
     object_property_set_int(OBJECT(&s->sata), "num-ports", SATA_NUM_PORTS,
                             &error_abort);
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->sata), errp)) {
@@ -619,6 +649,10 @@ static Property xlnx_zynqmp_props[] = {
     DEFINE_PROP_BOOL("has_rpu", XlnxZynqMPState, has_rpu, false),
     DEFINE_PROP_LINK("ddr-ram", XlnxZynqMPState, ddr_ram, TYPE_MEMORY_REGION,
                      MemoryRegion *),
+    DEFINE_PROP_LINK("canbus0", XlnxZynqMPState, canbus[0], TYPE_CAN_BUS,
+                     CanBusState *),
+    DEFINE_PROP_LINK("canbus1", XlnxZynqMPState, canbus[1], TYPE_CAN_BUS,
+                     CanBusState *),
     DEFINE_PROP_END_OF_LIST()
 };
 
diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
index 4cc97b4..ae91480 100644
--- a/include/hw/arm/xlnx-zynqmp.h
+++ b/include/hw/arm/xlnx-zynqmp.h
@@ -22,6 +22,7 @@
 #include "hw/intc/arm_gic.h"
 #include "hw/net/cadence_gem.h"
 #include "hw/char/cadence_uart.h"
+#include "hw/net/xlnx-zynqmp-can.h"
 #include "hw/ide/ahci.h"
 #include "hw/sd/sdhci.h"
 #include "hw/ssi/xilinx_spips.h"
@@ -33,6 +34,7 @@
 #include "hw/cpu/cluster.h"
 #include "target/arm/cpu.h"
 #include "qom/object.h"
+#include "net/can_emu.h"
 
 #define TYPE_XLNX_ZYNQMP "xlnx,zynqmp"
 typedef struct XlnxZynqMPState XlnxZynqMPState;
@@ -43,6 +45,8 @@ DECLARE_INSTANCE_CHECKER(XlnxZynqMPState, XLNX_ZYNQMP,
 #define XLNX_ZYNQMP_NUM_RPU_CPUS 2
 #define XLNX_ZYNQMP_NUM_GEMS 4
 #define XLNX_ZYNQMP_NUM_UARTS 2
+#define XLNX_ZYNQMP_NUM_CAN 2
+#define XLNX_ZYNQMP_CAN_REF_CLK (24 * 1000 * 1000)
 #define XLNX_ZYNQMP_NUM_SDHCI 2
 #define XLNX_ZYNQMP_NUM_SPIS 2
 #define XLNX_ZYNQMP_NUM_GDMA_CH 8
@@ -94,6 +98,7 @@ struct XlnxZynqMPState {
 
     CadenceGEMState gem[XLNX_ZYNQMP_NUM_GEMS];
     CadenceUARTState uart[XLNX_ZYNQMP_NUM_UARTS];
+    XlnxZynqMPCANState can[XLNX_ZYNQMP_NUM_CAN];
     SysbusAHCIState sata;
     SDHCIState sdhci[XLNX_ZYNQMP_NUM_SDHCI];
     XilinxSPIPS spi[XLNX_ZYNQMP_NUM_SPIS];
@@ -114,6 +119,9 @@ struct XlnxZynqMPState {
     bool virt;
     /* Has the RPU subsystem?  */
     bool has_rpu;
+
+    /* CAN bus. */
+    CanBusState *canbus[XLNX_ZYNQMP_NUM_CAN];
 };
 
 #endif
-- 
2.7.4

