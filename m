Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1902934lfp;
        Fri, 14 Feb 2020 05:21:38 -0800 (PST)
X-Google-Smtp-Source: APXvYqwm80tVJol1wk0poZxLg17QmJ10aaGi5O+cI9u83PKhv3T/YLj1JcOIzssH5aM9t1qCqNzK
X-Received: by 2002:aed:3203:: with SMTP id y3mr2520141qtd.23.1581686498190;
        Fri, 14 Feb 2020 05:21:38 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1581686498; cv=pass;
        d=google.com; s=arc-20160816;
        b=H9jXaL4w+5dCDLNwl0WWURIVQrGOKVCuQqvQPm35GAjf3px3cYXBqZG5khVssXaG+P
         vam1kzVecSdPXlQtVn4AfV6s8WK1cwMA6GT5OeI5+yCAfVUpPW4AWvHLFV0rgXu3p1hr
         BPcvmMafGPiH6lOSdoTupbcPvG10XI4GKfuz0+DXJ+VMKuOu/BfUxE+fuy/CF9ecApgw
         p6Kqh1qupcIGYX8lL9nSq8qFDy4MlrPUoGnAxfe9LQS0F+2xtFjK3Z2hlCvo+y6Xu1Xh
         sZcSdDvmt3Yx7ctUiUqD6LcXYgtu+U5JPDr1DmSJqhCMGiwd6iBQaGoPIctyiBjAwtN7
         cWXg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:dkim-signature;
        bh=1BJo5rEO5dzyXi04sXf9u5m3jLCW+OiBRx7qyMr5kOA=;
        b=yISKqwAid56C1b1jb8mSXzVUylT5tSuEKEiLFuPjL+YUnLBNgCmBt9/uk4wrCMb9cZ
         fhwYtI5oY/IAJh7Ur43ghF4EFHKol4tKGmZSFDabonCDveLRAGdO/FmsUzpigcy399l7
         C4ZjIUC1Xfb+/l0dPVlp8MDB4K8TqzUmAF0hHlhYFqdGvxtgj4ektvrtOVKcODMT6kOg
         W4GTSVhKUntx7opuE+NHLSiWr+5RnC016ZJ6kbQB6wmo8T8BLpqWZjIrJp0pEJU9So7J
         or4+/W8f9ZJYMfVPbFQHTkFk988CThtKuOHluDsYmKof1aBQKyydeQtU7o9AitRogmSq
         uvaQ==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@xilinx.onmicrosoft.com header.s=selector2-xilinx-onmicrosoft-com header.b=h5uuV+Tk;
       arc=pass (i=1 spf=pass spfdomain=xilinx.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i70si2781683qke.224.2020.02.14.05.21.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Feb 2020 05:21:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@xilinx.onmicrosoft.com header.s=selector2-xilinx-onmicrosoft-com header.b=h5uuV+Tk;
       arc=pass (i=1 spf=pass spfdomain=xilinx.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j2auX-0000xk-IY
	for alex.bennee@linaro.org; Fri, 14 Feb 2020 08:21:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49941)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <saipava@xilinx.com>) id 1j2auJ-0000tL-Gr
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 08:21:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <saipava@xilinx.com>) id 1j2auI-00059R-GP
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 08:21:23 -0500
Received: from mail-eopbgr680089.outbound.protection.outlook.com
 ([40.107.68.89]:2365 helo=NAM04-BN3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <saipava@xilinx.com>)
 id 1j2auG-00056C-9q; Fri, 14 Feb 2020 08:21:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NTjb5iHP77g0uOxUPZUyIti7mzPgcm6ZO+jL6izptPT1Jy59YSn1EKki5txqDJyR5RtVrkSvjnyy3FTzfeZWulNYCwFj1ulxzmGiLmSNjwd6MsuBAg0PciQe12LAT/pkWwUTBYCFRJxoYbNu7A7P1QhS7JIBXpScnkBizB4JG9kQLlinOC6wq0nsF8z3/A1N9BFQ4wLfkK/q8u8Mw6+W0DXlEhO9QNuZ84q7tYiU7B8vsbS78VXYKiWoBn0lobiGaBXRtswazEylz1Nw9gvu8nb7ljrOdia/s1V7ZYGlra+uqY5GQwvCX1TCZujcmfi9A3PyElmr7KT9mSh42d1QYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1BJo5rEO5dzyXi04sXf9u5m3jLCW+OiBRx7qyMr5kOA=;
 b=ZBLqrk4gsDJXTyyH081Blc1/zkJtuilTAfixCIu6GIedFmWtJBPqzaBqLvBM59E57eUefWQiHZk78aAXHfPM0TtMLsWlbvCaMUO/tYj7k1wsaeADbviC9m6kfHOAoIs4GoHOxZ7RO7rabsFqSCKMoojlP2zDvWxFSRumAMc5Po4zNr7Y6AzfV+W9RicfGRyKxtsff2UHcPU7ZD5hB5N1l+FwPkQ968Cdq6qNRLT/wQgGKfG08GYlrQLKYpHYn0JfPAgK35Y9Tat5zs+PzeZ+b6sS8q8dAoCG1YdzXTyyy6ZipNxpR2lUMYmGQXrVfqW7k5j4HPSuzbpJ//lmdMDPIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=suse.de smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1BJo5rEO5dzyXi04sXf9u5m3jLCW+OiBRx7qyMr5kOA=;
 b=h5uuV+Tk7aVRH5V+E89gAvTduIjfed/7gJ+8YU45e4/nZRC0yW0wkJBmyqspjgcb8fAxs2LcmttODYFmpfVgXYzrdsuOXE5zbqlGhfvlGjVnf8QEki/P1gV5fiXc8ti/s+Vpw00UqULZqUuVht4dOlDGJsx/kXN1BgnnzqlAKyA=
Received: from DM6PR02CA0123.namprd02.prod.outlook.com (2603:10b6:5:1b4::25)
 by DM6PR02MB5452.namprd02.prod.outlook.com (2603:10b6:5:78::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2707.23; Fri, 14 Feb
 2020 13:21:17 +0000
Received: from BL2NAM02FT052.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e46::207) by DM6PR02CA0123.outlook.office365.com
 (2603:10b6:5:1b4::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.22 via Frontend
 Transport; Fri, 14 Feb 2020 13:21:17 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; suse.de; dkim=none (message not signed)
 header.d=none;suse.de; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 BL2NAM02FT052.mail.protection.outlook.com (10.152.77.0) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2729.22
 via Frontend Transport; Fri, 14 Feb 2020 13:21:17 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1j2auC-0001WX-Kf; Fri, 14 Feb 2020 05:21:16 -0800
Received: from [127.0.0.1] (helo=xsj-smtp-dlp2.xlnx.xilinx.com)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1j2au7-0006gE-Gy; Fri, 14 Feb 2020 05:21:11 -0800
Received: from xsj-pvapsmtp01 (smtp3.xilinx.com [149.199.38.66])
 by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 01EDLAwT008733; 
 Fri, 14 Feb 2020 05:21:10 -0800
Received: from [10.140.6.35] (helo=xhdsaipava40.xilinx.com)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <saipava@xhdsaipava40.xilinx.com>)
 id 1j2au6-0006g4-G9; Fri, 14 Feb 2020 05:21:10 -0800
Received: by xhdsaipava40.xilinx.com (Postfix, from userid 14131)
 id 096ED13C04B9; Fri, 14 Feb 2020 18:47:04 +0530 (IST)
From: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
To: "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>,
 Anthony Liguori <anthony@codemonkey.ws>, afaerber@suse.de
Subject: [PATCH 3/3] arm/xilinx_zynq: Set number of priority bits
Date: Fri, 14 Feb 2020 18:46:52 +0530
Message-Id: <1581686212-9625-4-git-send-email-sai.pavan.boddu@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1581686212-9625-1-git-send-email-sai.pavan.boddu@xilinx.com>
References: <1581686212-9625-1-git-send-email-sai.pavan.boddu@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(396003)(39850400004)(346002)(189003)(199004)(478600001)(4744005)(5660300002)(110136005)(36756003)(42186006)(316002)(6666004)(356004)(26005)(2906002)(186003)(2616005)(426003)(336012)(6266002)(4326008)(8676002)(81166006)(70586007)(81156014)(70206006)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR02MB5452; H:xsj-pvapsmtpgw01; FPR:;
 SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; MX:1; A:1; 
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d48e064d-89f1-4933-105e-08d7b150c605
X-MS-TrafficTypeDiagnostic: DM6PR02MB5452:
X-Microsoft-Antispam-PRVS: <DM6PR02MB54527FD58A2011D210F1458CCA150@DM6PR02MB5452.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:854;
X-Forefront-PRVS: 03137AC81E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cVeyM3/9/2w2bst//edilmt+gVRX6bWTZut9NNryIthck2+UwIH9HLj9v9OSpBZ4I74Qne7IxGkPCAAw660FQm5t4rLxDXfPHphtDfY2H3pTD6v0WbV8s1eNMngu4MyFs3El8ul6hwK9w8RMywxN2DakRfOCmKaO2B2/23a1uPU23io8w7EfOXODpP2sUyep25hYsGJpVPvqUlXy0OPx+DEQvzy11j5O52wLmGhG/s0x/3nnE+/4qA5DfFxyBelU7zEKledAVVe9dYBShpRzn48maox9TxjRPhxB1uLFZX7u8VRKvSHgF58ayciCwTQ6XeZHFSg1QMlzMzsreehgh42z2m+N4uJ8vPaFcxXgGlBOd6fdEPwRiFoH0Gktmlf6qy73naaRYkYXAkJbOBIhszG2FX5cA5+G1WjzpFxk5k3YfoOllTrInVJk9MLYANrw
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2020 13:21:17.2203 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d48e064d-89f1-4933-105e-08d7b150c605
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB5452
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.68.89
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HHR5g96HkWM5

Arm GIC in Zynq SOC implements 5 priority bits i.e bits 7..3.

Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
---
 hw/arm/xilinx_zynq.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
index 3a0fa5b..7aa43ad 100644
--- a/hw/arm/xilinx_zynq.c
+++ b/hw/arm/xilinx_zynq.c
@@ -214,6 +214,7 @@ static void zynq_init(MachineState *machine)
 
     dev = qdev_create(NULL, TYPE_A9MPCORE_PRIV);
     qdev_prop_set_uint32(dev, "num-cpu", 1);
+    qdev_prop_set_uint32(dev, "num-priority-bits", 5);
     qdev_init_nofail(dev);
     busdev = SYS_BUS_DEVICE(dev);
     sysbus_mmio_map(busdev, 0, MPCORE_PERIPHBASE);
-- 
2.7.4

