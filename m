Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1765932lfp;
        Thu, 16 Sep 2021 22:25:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzLEkRtrZ3bqL5UZpWxiRUwiO1NSBo1rAbFVncmI0WETLc1s3gKPZRaT2bt7XfGwcCAOWXT
X-Received: by 2002:a25:c88:: with SMTP id 130mr11478512ybm.176.1631856337529;
        Thu, 16 Sep 2021 22:25:37 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1631856337; cv=pass;
        d=google.com; s=arc-20160816;
        b=dTGOS6vRVHpEfFGjKYKjMdKWWqYggaZxVG7uPu2dtHo1+pjt+eBbW2dfUtaxSWHJPW
         Hcg977IMVkGqfTGXUOjiatmNLXigW3vMB9B6QstZTBkb+VHzMcyvoTXhGGW1+t0TaV4X
         uBK2cDIMI6LOrEVP5VxcaXZ4A6HyBg1tHKhuMIGzcJw7BdR3zKweqlu68H8NB5th+MJT
         61cTOEIEpFif2jFMSIV5Qdn4nB0b54f2cslurPs9/J2l/qf9YewRDzRX1dh/tbwnd+wn
         0d1S4oTRCoqNQZLWUJ1kIcRVz3DVbgW05EwJr/lesWe3jVaTiB9NO0Cn3Ru9XS0S3TgN
         kz5A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=DAgxYZw5XD6sh67NcaobeFummKCB/M4aAsQEdcYTsCA=;
        b=PO/3NpOkDONKJpktuaV8kgFnqHw1MADb08i5ZzDD1XX8ZtLb6aLXLeSRj3X0GNS6pK
         BnZYlw4TUP3AJDgMYbN/fTLx0zse+kr4WjgyomkXPPVd4mgEtB117Mqodqfkon2C09ik
         Lc5rdRRDkh+J0h4aufPmRKHsegug1tuCgWo7tixYAwqPxJvD3MnuDVzP1xgLGSFi5PVH
         lBvwZrOz5dm5Mr83GsTpfl85dVLjNlf1TRg2wyY/Ya1LGd9vr6lF27UHyxktjwhiMM+8
         89azRK3p6wtBR87YXL4Ur9r+s5Qhdw5mxujVdwGtv9XH1mm6Hq5bfE00PmyKFiYe0EWe
         xRqw==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@xilinx.onmicrosoft.com header.s=selector2-xilinx-onmicrosoft-com header.b=a4MlM31Z;
       arc=pass (i=1 spf=pass spfdomain=xilinx.com dmarc=pass fromdomain=xilinx.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=xilinx.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l205si5652851ybc.397.2021.09.16.22.25.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Sep 2021 22:25:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@xilinx.onmicrosoft.com header.s=selector2-xilinx-onmicrosoft-com header.b=a4MlM31Z;
       arc=pass (i=1 spf=pass spfdomain=xilinx.com dmarc=pass fromdomain=xilinx.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=xilinx.com
Received: from localhost ([::1]:33844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mR6NU-000455-3k
	for alex.bennee@linaro.org; Fri, 17 Sep 2021 01:25:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tongh@xilinx.com>)
 id 1mR6ML-0002pu-39; Fri, 17 Sep 2021 01:24:25 -0400
Received: from mail-mw2nam12on2084.outbound.protection.outlook.com
 ([40.107.244.84]:43328 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tongh@xilinx.com>)
 id 1mR6MJ-00065H-CA; Fri, 17 Sep 2021 01:24:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YYqJN+Md7DGxd1Air39bPIMOP4NVFoMVaS3u3xPJpFZ077lP1GKPHT5myZoab2JR0ELrobreDYb0vm4kFhjnUkUOLjtPhQ/G9XJ5ucMjxmjOpf7fbnK69b4jsPehCas95L00pDutkW0uQbhyXIPjRdiCeni+G4rCu4MItsAHyOdVj/hFCJcX7xTfbDRaGH3gkvE8++ky1X6PawVMfg67CBPfH3mMLH/vKYr5RtiyS60ACw1dcTU7JynpWQw2GGkv3ZQb56EXmpB9OvaudZRCHFoCT8NXxKov+b4FPzNuhQdYe4oMXaqqoIOQ9/v9Jui9dBCHVAQvigKlreYPdBFsCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=DAgxYZw5XD6sh67NcaobeFummKCB/M4aAsQEdcYTsCA=;
 b=OuHE6iGwg1sZYVhYoGz7Gn55rM0lw/Wghux4eRTjVp2ctyohIAoDgzlmPLyzoEGV3K8/o8s6j2GBrQZFsReZO7ntTP69VyeRffkTWIJiClviIRn3ZUVZYm/3+HpMyYQaUHEdjRvbB8f07dlPZBUZU40blkcsihWOcLBEyZBlEO4BXXLZkr4w0JWXJzgjkzkjht540khCAjDYRxQeE422BXLVhVTgdSWo0gn3Pg5aEFmjqfSvx347dB7eAG/s7Xur5OYjATNfzFuWwUmygzNgAVkNkUOx4KHfrmjo2UqZVH0iMkSGnVLWKqQFljVfzcyNpppZx3NkendsrLOHGrzttQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DAgxYZw5XD6sh67NcaobeFummKCB/M4aAsQEdcYTsCA=;
 b=a4MlM31ZCg8QYj7N1AN0kdbm9Pqp4bEYZ1H1wFRCK6BIcW/aM3xGKt+5zJn/02+s74WrFEIKUHINJmtU4iAD4+79sh7RxkRvcxPidm+knVQRa1Iz9stTmVaPzuFlnwRuNcWmirRGQZY0yKvyKoDyVMTwGiFHJyKTWUMLQMXaLoY=
Received: from DM5PR19CA0003.namprd19.prod.outlook.com (2603:10b6:3:151::13)
 by DM5PR02MB2411.namprd02.prod.outlook.com (2603:10b6:3:50::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Fri, 17 Sep
 2021 05:24:19 +0000
Received: from DM3NAM02FT008.eop-nam02.prod.protection.outlook.com
 (2603:10b6:3:151:cafe::87) by DM5PR19CA0003.outlook.office365.com
 (2603:10b6:3:151::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Fri, 17 Sep 2021 05:24:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT008.mail.protection.outlook.com (10.13.5.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4523.14 via Frontend Transport; Fri, 17 Sep 2021 05:24:18 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 16 Sep 2021 22:24:01 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 16 Sep 2021 22:24:01 -0700
Received: from [172.19.2.40] (port=58118 helo=xsjtongh40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <tong.ho@xilinx.com>)
 id 1mR6Lw-0005Y7-Va; Thu, 16 Sep 2021 22:24:00 -0700
From: Tong Ho <tong.ho@xilinx.com>
To: <qemu-arm@nongnu.org>
Subject: [PATCH v3 8/9] hw/arm: xlnx-zcu102: Add Xilinx eFUSE device
Date: Thu, 16 Sep 2021 22:23:59 -0700
Message-ID: <20210917052400.1249094-9-tong.ho@xilinx.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210917052400.1249094-1-tong.ho@xilinx.com>
References: <20210917052400.1249094-1-tong.ho@xilinx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: afb59bdf-8b68-4189-4dc1-08d9799b6621
X-MS-TrafficTypeDiagnostic: DM5PR02MB2411:
X-Microsoft-Antispam-PRVS: <DM5PR02MB2411C25849CF03AD0413897ECDDD9@DM5PR02MB2411.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:635;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a9ZAvn35uKiVT4D10XfHrWMEKiLDMZ4mu9c3YzNQp6XOzO1rkquGWPoaqq/E1XdYYbsG31DMO4C1QWYEG4gyBc3rdTetXHyGkd2LB135bWXZ4QPkpvEogfcdLLWonouHIH2+rvrNlq2bvJWaqMMbsWqpJ1nYv5N7XHT3tcsBX83NPDNuuKiBqAaAF+s3grjeepw+BYDRFpIcAFXVLq737V71G27vTtR4HlFVS74pE076poSPJwXcu552xzmA+wkfUQShfhNHKzD2whY1lYG/7MDOrssg7kdyYkTuROgqVYY5h7mDXxNJEWxvWJnhPb8FoGnYxPyVfBnE4uqPLbiLaMjf4mgUjfQCDHnVgVrR23rXHh6NYphmB5aY4GLmJxhGAQVC7LCdpxPMONsAle3nH5P3o3IrhvvDcaQFxe9FcoJww1la81XhjO0ZVUl352Iqg6NFtz9FxCcTr7aNGwCUeZ+PJPAryIb9PCeKm9s1v8OF4QE4GstDS2JnameARpW2BphmSewDEgnOrsbkQZMGVHqWpRpjoUJMjNxchGG13M9jEX9kfGY7fwwbqBv/ej2VncSZEuYliouEIwwH6VSpD7QN+YUj2soLuy1yYhupqx74L6aA922NRKzkl09lJc2rPyRETkMJzF9MabJJopPvJCJ8ewBcM+rki5GFN4yTTO7M5WmrVd4sd5W1teWyxo0CJuBFlPQxHbV1xcDvEJ/P9Nuq5KEx8/AjakXLO4auhXg=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(396003)(136003)(346002)(376002)(39860400002)(46966006)(36840700001)(70586007)(107886003)(70206006)(36860700001)(7636003)(47076005)(426003)(336012)(54906003)(82310400003)(316002)(6916009)(82740400003)(44832011)(36906005)(9786002)(2906002)(2616005)(356005)(36756003)(478600001)(8676002)(7696005)(4326008)(83380400001)(8936002)(26005)(186003)(1076003)(5660300002)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2021 05:24:18.9086 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: afb59bdf-8b68-4189-4dc1-08d9799b6621
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT008.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB2411
Received-SPF: pass client-ip=40.107.244.84; envelope-from=tongh@xilinx.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: alistair@alistair23.me, tong.ho@xilinx.com, qemu-devel@nongnu.org,
 peter.maydell@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AINGfJKmbosM

Connect the support for ZynqMP eFUSE one-time field-programmable
bit array.

The command argument:
  -drive if=pflash,index=3,...
Can be used to optionally connect the bit array to a
backend storage, such that field-programmed values
in one invocation can be made available to next
invocation.

The backend storage must be a seekable binary file, and
its size must be 768 bytes or larger. A file with all
binary 0's is a 'blank'.

Signed-off-by: Tong Ho <tong.ho@xilinx.com>
---
 hw/Kconfig                   |  1 +
 hw/arm/xlnx-zcu102.c         | 15 +++++++++++++++
 hw/arm/xlnx-zynqmp.c         | 29 +++++++++++++++++++++++++++++
 include/hw/arm/xlnx-zynqmp.h |  3 +++
 4 files changed, 48 insertions(+)

diff --git a/hw/Kconfig b/hw/Kconfig
index b6fb6a4507..ad20cce0a9 100644
--- a/hw/Kconfig
+++ b/hw/Kconfig
@@ -82,3 +82,4 @@ config XLNX_ZYNQMP
     select CAN_BUS
     select PTIMER
     select XLNX_BBRAM
+    select XLNX_EFUSE_ZYNQMP
diff --git a/hw/arm/xlnx-zcu102.c b/hw/arm/xlnx-zcu102.c
index b247c5779b..3dc2b5e8ca 100644
--- a/hw/arm/xlnx-zcu102.c
+++ b/hw/arm/xlnx-zcu102.c
@@ -110,6 +110,18 @@ static void bbram_attach_drive(XlnxBBRam *dev)
     }
 }
 
+static void efuse_attach_drive(XlnxEFuse *dev)
+{
+    DriveInfo *dinfo;
+    BlockBackend *blk;
+
+    dinfo = drive_get_by_index(IF_PFLASH, 3);
+    blk = dinfo ? blk_by_legacy_dinfo(dinfo) : NULL;
+    if (blk) {
+        qdev_prop_set_drive(DEVICE(dev), "drive", blk);
+    }
+}
+
 static void xlnx_zcu102_init(MachineState *machine)
 {
     XlnxZCU102 *s = ZCU102_MACHINE(machine);
@@ -151,6 +163,9 @@ static void xlnx_zcu102_init(MachineState *machine)
     /* Attach bbram backend, if given */
     bbram_attach_drive(&s->soc.bbram);
 
+    /* Attach efuse backend, if given */
+    efuse_attach_drive(&s->soc.efuse);
+
     /* Create and plug in the SD cards */
     for (i = 0; i < XLNX_ZYNQMP_NUM_SDHCI; i++) {
         BusState *bus;
diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 1e8e2ddcc2..1c52a575aa 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -69,6 +69,9 @@
 #define BBRAM_ADDR          0xffcd0000
 #define BBRAM_IRQ           11
 
+#define EFUSE_ADDR          0xffcc0000
+#define EFUSE_IRQ           87
+
 #define SDHCI_CAPABILITIES  0x280737ec6481 /* Datasheet: UG1085 (v1.7) */
 
 static const uint64_t gem_addr[XLNX_ZYNQMP_NUM_GEMS] = {
@@ -245,6 +248,31 @@ static void xlnx_zynqmp_create_bbram(XlnxZynqMPState *s, qemu_irq *gic)
     sysbus_connect_irq(sbd, 0, gic[BBRAM_IRQ]);
 }
 
+static void xlnx_zynqmp_create_efuse(XlnxZynqMPState *s, qemu_irq *gic)
+{
+    Object *bits = OBJECT(&s->efuse);
+    Object *ctrl = OBJECT(&s->efuse_ctrl);
+    SysBusDevice *sbd;
+
+    object_initialize_child(OBJECT(s), "efuse-ctrl", &s->efuse_ctrl,
+                            TYPE_XLNX_ZYNQMP_EFUSE);
+
+    object_initialize_child_with_props(ctrl, "xlnx-efuse@0", bits,
+                                       sizeof(s->efuse),
+                                       TYPE_XLNX_EFUSE, &error_abort,
+                                       "efuse-nr", "3",
+                                       "efuse-size", "2048",
+                                       NULL);
+
+    qdev_realize(DEVICE(bits), NULL, &error_abort);
+    object_property_set_link(ctrl, "efuse", bits, &error_abort);
+
+    sbd = SYS_BUS_DEVICE(ctrl);
+    sysbus_realize(sbd, &error_abort);
+    sysbus_mmio_map(sbd, 0, EFUSE_ADDR);
+    sysbus_connect_irq(sbd, 0, gic[EFUSE_IRQ]);
+}
+
 static void xlnx_zynqmp_create_unimp_mmio(XlnxZynqMPState *s)
 {
     static const struct UnimpInfo {
@@ -646,6 +674,7 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->rtc), 0, gic_spi[RTC_IRQ]);
 
     xlnx_zynqmp_create_bbram(s, gic_spi);
+    xlnx_zynqmp_create_efuse(s, gic_spi);
     xlnx_zynqmp_create_unimp_mmio(s);
 
     for (i = 0; i < XLNX_ZYNQMP_NUM_GDMA_CH; i++) {
diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
index 067e8a5238..062e637fe4 100644
--- a/include/hw/arm/xlnx-zynqmp.h
+++ b/include/hw/arm/xlnx-zynqmp.h
@@ -37,6 +37,7 @@
 #include "net/can_emu.h"
 #include "hw/dma/xlnx_csu_dma.h"
 #include "hw/nvram/xlnx-bbram.h"
+#include "hw/nvram/xlnx-zynqmp-efuse.h"
 
 #define TYPE_XLNX_ZYNQMP "xlnx-zynqmp"
 OBJECT_DECLARE_SIMPLE_TYPE(XlnxZynqMPState, XLNX_ZYNQMP)
@@ -102,6 +103,8 @@ struct XlnxZynqMPState {
     MemoryRegion *ddr_ram;
     MemoryRegion ddr_ram_low, ddr_ram_high;
     XlnxBBRam bbram;
+    XlnxEFuse efuse;
+    XlnxZynqMPEFuse efuse_ctrl;
 
     MemoryRegion mr_unimp[XLNX_ZYNQMP_NUM_UNIMP_AREAS];
 
-- 
2.25.1

