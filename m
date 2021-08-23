Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp2079471lfg;
        Mon, 23 Aug 2021 10:49:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyBonXuwG0Pr0YsPwLkMMoU9YpbdC4V51ty+hUoZSW/w/0LS3hCu4cEQgi5dmegwSfuV2/Z
X-Received: by 2002:a92:2002:: with SMTP id j2mr4275867ile.37.1629740989132;
        Mon, 23 Aug 2021 10:49:49 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1629740989; cv=pass;
        d=google.com; s=arc-20160816;
        b=mioHlgJF9/gi0L4krBahiaJQyT9t3gkmXdEXm4JjRUc0q7/qOe9/U7ycOopbM3Pxsj
         fzLTTusSU0CSNwO9hLOlHZ3D2xWgD778eWfJTc4ucUrD6CxuAC1bVQmz/+6xVzBQzgD9
         ouVT6um6k4gMk/5VVWIIfoOf1y8LnJUeSOvyfImN3ufu1iBSrA0BIwKeOk6tsegB+/8b
         QKtoRaZeaS/W4Hded0p4B2zoPZl4SEw26iBAFvJzTuUlaA+j1XXtVWuFqkQoP7Eq40t9
         NZZmZ0au1OFnp1EoPjIKCQo9q06+PFq5UIJ96sauwjSt1oBEtg0tZrQfwXsSBqk0VJxu
         EbSg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=y0WRKEKpg5vg84WeZ0p0EP1QrcUo9MUbdy2Uf7Rs4VA=;
        b=vvm6YNeH6cQc9I3WYViwsoWQMaL5JXYRyrmhC2NDjVP2ZGom+uLdCSBOk0PsQSRAP6
         MxFZHi/3mMmCvWNrQQydzSb/kPa8Ql5jw5IIfXCKcnaD9RV6X4z3lClcQ3/xbhhCSp8R
         FZhDU6Zps4Xq2DduZAKXbD4mx++6x008shWgw+kPNgM1LNAN5YTIdoBmrhrYILeFVYuY
         0Fi0BS0OY9nvc4xJwGMQtUp8TUTlq9lRrOh7WtBzh11hOiJN7JDJm6jHX3dw48/d8hPc
         FGvyC+RAZTeUOkcD3FBi7ky7Wr+lZytt9+t5mvzsy7a3ZV9n/skVTJBl68U1QaYE3SLJ
         RjbQ==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@xilinx.onmicrosoft.com header.s=selector2-xilinx-onmicrosoft-com header.b="alk/RgiR";
       arc=pass (i=1 spf=pass spfdomain=xilinx.com dmarc=pass fromdomain=xilinx.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=xilinx.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r131si12978932ior.19.2021.08.23.10.49.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Aug 2021 10:49:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@xilinx.onmicrosoft.com header.s=selector2-xilinx-onmicrosoft-com header.b="alk/RgiR";
       arc=pass (i=1 spf=pass spfdomain=xilinx.com dmarc=pass fromdomain=xilinx.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=xilinx.com
Received: from localhost ([::1]:56738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mIE4y-0004bz-4h
	for alex.bennee@linaro.org; Mon, 23 Aug 2021 13:49:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tongh@xilinx.com>)
 id 1mIE4i-0004Y6-Dp; Mon, 23 Aug 2021 13:49:32 -0400
Received: from mail-bn1nam07on2054.outbound.protection.outlook.com
 ([40.107.212.54]:52345 helo=NAM02-BN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tongh@xilinx.com>)
 id 1mIE4f-00018f-Qr; Mon, 23 Aug 2021 13:49:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D958JD23qvjcB/gozh9b6ZrMPqSIlKyLtJ9Zo4XgenLnIwlj11sqyahDTq2TtxCLfr4VPdb5vbkbnpiSqglp4M98J+JgjxbKQZASKMGmfDEFFdmdBfYWSyY2ASKRtdecTLCAweFfSqI30TTsreTSRAHE8R+QNfKUOipJmKQkH3NT23KhsB0VvXBVh9zyFthxJPii+i3pASbfpcLU1QDLS/vXh7Erhv7xTzrLSJOIiyKk4k0CqCpS3AGxJiaf1qlAST9HNSjN7m2BvaYRRkFlAPf4DmygTGvWm4AbADuYb4pLCRgQkROO+pFXVuPB3KiCyYf1jfmEk4bBoG8ML0hT6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y0WRKEKpg5vg84WeZ0p0EP1QrcUo9MUbdy2Uf7Rs4VA=;
 b=WuwKUPUviKDP2yGHmfRzxJUEGecAyUdu90bZsY3BZ00tbj+GqS9SzrZidSDRl3iTO4CvjsN4rwYFTURdDky+c5gwERA+wJiGivYBzFSQscN6/LWJHTcG42XSTMvo68U09KfAVoooG8aWfZKi05oKu/IXeJDnGHJhtbUI2OSbuu0VY/5R/P9ppmVAODUC5JdYYb0MYpnp0qO3EsCOzGzjo2m4rFYDmq3x3i4NMl0G+2Dr+Zc7X37gKdnn3MHfaQ2b5bMla+2ILHylLib0H4VDFomwthzhZO0HWKMboFg/JXRmxaVCBi7m3fi673z2CEnoWh8nZj10Zldn7kDijbk7IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y0WRKEKpg5vg84WeZ0p0EP1QrcUo9MUbdy2Uf7Rs4VA=;
 b=alk/RgiRmuerGgneHobs44zihPpQWRRlQXilkAC/1HmD9V851hR9G/DNw6DSn5PjZdHkg/xjGUAo4aWCSdHULEgbGk+//gPiftNoTF/pBjO/vLVm6hT1442vC1SzKlchiI9sCm0htumy0Hoxv6tcAinmRg9zLfYFHyqEOnlAcOY=
Received: from DM6PR04CA0003.namprd04.prod.outlook.com (2603:10b6:5:334::8) by
 BYAPR02MB4246.namprd02.prod.outlook.com (2603:10b6:a02:fc::26) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19; Mon, 23 Aug 2021 17:49:26 +0000
Received: from DM3NAM02FT035.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:334:cafe::6c) by DM6PR04CA0003.outlook.office365.com
 (2603:10b6:5:334::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Mon, 23 Aug 2021 17:49:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT035.mail.protection.outlook.com (10.13.4.78) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4436.19 via Frontend Transport; Mon, 23 Aug 2021 17:49:25 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 23 Aug 2021 10:49:24 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 23 Aug 2021 10:49:24 -0700
Received: from [172.19.2.40] (port=46976 helo=xsjtongh40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <tong.ho@xilinx.com>)
 id 1mIE4a-0007u4-QR; Mon, 23 Aug 2021 10:49:24 -0700
From: Tong Ho <tong.ho@xilinx.com>
To: <qemu-arm@nongnu.org>
Subject: [PATCH v2 5/9] hw/arm: xlnx-versal: Add Xilinx BBRAM device
Date: Mon, 23 Aug 2021 10:49:20 -0700
Message-ID: <20210823174924.201669-6-tong.ho@xilinx.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210823174924.201669-1-tong.ho@xilinx.com>
References: <20210823174924.201669-1-tong.ho@xilinx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 39db28f9-1814-44d6-46a3-08d9665e5919
X-MS-TrafficTypeDiagnostic: BYAPR02MB4246:
X-Microsoft-Antispam-PRVS: <BYAPR02MB42468226434708DCD5E41CA2CDC49@BYAPR02MB4246.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:167;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IDO1rbPf6/pHYNh7iGZDIHKloXvPqWr0NBhAlVqsNdDQM2ww2y2GRQqEHTFLhod5Il+EMUMzSPJgudHvL8XVBxgcH1ujBS2NTApK4GTIm2Tehg/1wqzGob7AidVw8JYMl8kiAHIZMDarxUlX+wkU5hzBeSWk4JVQ88AYgYY0ZFv8vc3N2R3H8nleZ9x1fxQJanSmWkMPhud9aW30StL+Fw3hfCnXYqWBSZDdM4lTA3/DSOVnkT9p8Z8NgAIBZf8zf2jfMQK00DVGBp/Dtpj42TCkJyPVnajFVsgchwuZXvnr/SoEL1O8YHhOzt+rUhePjGUPTNRXhNYDmLqh653cdAgI2TmRvUniNJ6fM8QN0rzH6jDSQ7TB5mj7SXXho+GIxEtIw+tuFzbihdpnDOiF4/pvApoMiNOUQBD7XLZLtsieLt1QC0XFkNONAuZ/UyDXl7Vh+FNpA1c8l1cCtCADfMwxNZb3+ujmr2Msj3AAgDqXOv+JvVFpccQxJn0YfRUh3ndIF7CpIDt7IsIO6d8HW4olD9e1gCRm+PvTY7R/+owjfiBM+A3VnZ1GEMrjGLDcOLvADj28F9AktHJIOD6ArCKrZqqEWRW1BO36Tgb12bb9z8XXAg14NdKnIF/0j+YfX0tFCz350SwKKhfjo3UDPXhvb+yi2O/8GLwrIOTrx7lp8V3qIQxUFvAQdmH+tRpw6drs5XnOxSdQJw0cnunXZX2vOLSg37LGrjMuOql50GA=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(396003)(376002)(136003)(46966006)(36840700001)(426003)(6666004)(82740400003)(44832011)(70206006)(70586007)(356005)(107886003)(2906002)(316002)(2616005)(478600001)(336012)(7696005)(26005)(186003)(7636003)(6916009)(8936002)(4326008)(47076005)(8676002)(1076003)(5660300002)(36860700001)(82310400003)(36756003)(54906003)(36906005)(9786002)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2021 17:49:25.6513 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39db28f9-1814-44d6-46a3-08d9665e5919
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT035.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4246
Received-SPF: pass client-ip=40.107.212.54; envelope-from=tongh@xilinx.com;
 helo=NAM02-BN1-obe.outbound.protection.outlook.com
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
X-TUID: ycfTxpABFBJI

Connect the support for Versal Battery-Backed RAM (BBRAM)

Signed-off-by: Tong Ho <tong.ho@xilinx.com>
---
 hw/arm/xlnx-versal-virt.c    | 21 +++++++++++++++++++++
 hw/arm/xlnx-versal.c         | 18 ++++++++++++++++++
 include/hw/arm/xlnx-versal.h |  5 +++++
 3 files changed, 44 insertions(+)

diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
index 5bca360dce..d9e2a6a853 100644
--- a/hw/arm/xlnx-versal-virt.c
+++ b/hw/arm/xlnx-versal-virt.c
@@ -356,6 +356,26 @@ static void fdt_add_rtc_node(VersalVirt *s)
     g_free(name);
 }
 
+static void fdt_add_bbram_node(VersalVirt *s)
+{
+    const char compat[] = TYPE_XLNX_BBRAM;
+    const char interrupt_names[] = "bbram-error";
+    char *name = g_strdup_printf("/bbram@%x", MM_PMC_BBRAM_CTRL);
+
+    qemu_fdt_add_subnode(s->fdt, name);
+
+    qemu_fdt_setprop_cells(s->fdt, name, "interrupts",
+                           GIC_FDT_IRQ_TYPE_SPI, VERSAL_BBRAM_APB_IRQ_0,
+                           GIC_FDT_IRQ_FLAGS_LEVEL_HI);
+    qemu_fdt_setprop(s->fdt, name, "interrupt-names",
+                     interrupt_names, sizeof(interrupt_names));
+    qemu_fdt_setprop_sized_cells(s->fdt, name, "reg",
+                                 2, MM_PMC_BBRAM_CTRL,
+                                 2, MM_PMC_BBRAM_CTRL_SIZE);
+    qemu_fdt_setprop(s->fdt, name, "compatible", compat, sizeof(compat));
+    g_free(name);
+}
+
 static void fdt_nop_memory_nodes(void *fdt, Error **errp)
 {
     Error *err = NULL;
@@ -570,6 +590,7 @@ static void versal_virt_init(MachineState *machine)
     fdt_add_usb_xhci_nodes(s);
     fdt_add_sd_nodes(s);
     fdt_add_rtc_node(s);
+    fdt_add_bbram_node(s);
     fdt_add_cpu_nodes(s, psci_conduit);
     fdt_add_clk_node(s, "/clk125", 125000000, s->phandle.clk_125Mhz);
     fdt_add_clk_node(s, "/clk25", 25000000, s->phandle.clk_25Mhz);
diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
index fb776834f7..46d7f42a6b 100644
--- a/hw/arm/xlnx-versal.c
+++ b/hw/arm/xlnx-versal.c
@@ -312,6 +312,23 @@ static void versal_create_xrams(Versal *s, qemu_irq *pic)
     }
 }
 
+static void versal_create_bbram(Versal *s, qemu_irq *pic)
+{
+    SysBusDevice *sbd;
+
+    object_initialize_child_with_props(OBJECT(s), "bbram", &s->pmc.bbram,
+                                       sizeof(s->pmc.bbram), TYPE_XLNX_BBRAM,
+                                       &error_fatal,
+                                       "crc-zpads", "0",
+                                       NULL);
+    sbd = SYS_BUS_DEVICE(&s->pmc.bbram);
+
+    sysbus_realize(sbd, &error_fatal);
+    memory_region_add_subregion(&s->mr_ps, MM_PMC_BBRAM_CTRL,
+                                sysbus_mmio_get_region(sbd, 0));
+    sysbus_connect_irq(sbd, 0, pic[VERSAL_BBRAM_APB_IRQ_0]);
+}
+
 /* This takes the board allocated linear DDR memory and creates aliases
  * for each split DDR range/aperture on the Versal address map.
  */
@@ -398,6 +415,7 @@ static void versal_realize(DeviceState *dev, Error **errp)
     versal_create_sds(s, pic);
     versal_create_rtc(s, pic);
     versal_create_xrams(s, pic);
+    versal_create_bbram(s, pic);
     versal_map_ddr(s);
     versal_unimp(s);
 
diff --git a/include/hw/arm/xlnx-versal.h b/include/hw/arm/xlnx-versal.h
index 22a8fa5d11..7719e8c4d2 100644
--- a/include/hw/arm/xlnx-versal.h
+++ b/include/hw/arm/xlnx-versal.h
@@ -24,6 +24,7 @@
 #include "qom/object.h"
 #include "hw/usb/xlnx-usb-subsystem.h"
 #include "hw/misc/xlnx-versal-xramc.h"
+#include "hw/nvram/xlnx-bbram.h"
 
 #define TYPE_XLNX_VERSAL "xlnx-versal"
 OBJECT_DECLARE_SIMPLE_TYPE(Versal, XLNX_VERSAL)
@@ -79,6 +80,7 @@ struct Versal {
         } iou;
 
         XlnxZynqMPRTC rtc;
+        XlnxBBRam bbram;
     } pmc;
 
     struct {
@@ -105,6 +107,7 @@ struct Versal {
 #define VERSAL_GEM1_WAKE_IRQ_0     59
 #define VERSAL_ADMA_IRQ_0          60
 #define VERSAL_XRAM_IRQ_0          79
+#define VERSAL_BBRAM_APB_IRQ_0     121
 #define VERSAL_RTC_APB_ERR_IRQ     121
 #define VERSAL_SD0_IRQ_0           126
 #define VERSAL_RTC_ALARM_IRQ       142
@@ -170,6 +173,8 @@ struct Versal {
 
 #define MM_PMC_SD0                  0xf1040000U
 #define MM_PMC_SD0_SIZE             0x10000
+#define MM_PMC_BBRAM_CTRL           0xf11f0000
+#define MM_PMC_BBRAM_CTRL_SIZE      0x00050
 #define MM_PMC_CRP                  0xf1260000U
 #define MM_PMC_CRP_SIZE             0x10000
 #define MM_PMC_RTC                  0xf12a0000
-- 
2.25.1

