Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp499420lfc;
        Fri, 15 Oct 2021 13:39:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxWiOZv4aZrHSG5Dd5JMqF44EEGwwFHnEg38aKTD6mOuONJgz/N5JPwwo5CD02E8wXEbgka
X-Received: by 2002:a67:eec9:: with SMTP id o9mr16370675vsp.53.1634330358707;
        Fri, 15 Oct 2021 13:39:18 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1634330358; cv=pass;
        d=google.com; s=arc-20160816;
        b=kfKG+Umzmn4ZNpxkwqJV0sxh5xseRqwwdJhZFrOnBRSZHO/YSziAtOG6yIcCVhAZeb
         ZM0fUTsLcFlS9ZBRtzYs0w3YJ9WtrheUOzlYjdVOI2DDQeEnF9XlfnbcCJac0rZMAo8e
         kepwID0k9yZThMsH59j8BEhZBoeEJFCFTOzrMSrhiVSGHG9bSpKTn6Y4RssXsIBMMEaU
         rW3uXw91eN4cjh4N3vh8q96Upyl7lm5DoImtqMbsdXgPNX1vJ5sX09BKezNEcir1qnB9
         YOdP9GvIZDDsmq/mcbILbTCXSp1nnUyTEcdpBOMHVANbZSpaDlysJACIUDIbEAIeppYE
         4zgQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=I3KWTabP03ClI+yX9/i8IP+n+U06HUu7XfK852+fWR0=;
        b=Rebv8z4jhvIXW09c8QOUYItZ3W7RBkj3EIp+X0GB+edbjixZnsqHlIjwfFgfqIbSQ2
         UlVPtVSCCmqHnYrFF10+590fjo5KHp9YuTmB2/ahqdIvNBuF1+bq+P1I7bdDLn4gdrM3
         R5zg6u/WeIfqvhWGnxsRcQSiweKalGcPfqi3zt1IF/dPUt3rcVwcjZtDtwormuFIV/St
         V/KdEbZXhqvq/19oTI4+SvjSTvfg8kyLWU4e4fUaIGuoeRlHoTrX1fuyf0zZ9218F8CN
         Vm9uOtgD24DRXKcij4GiXsgBwtP9E24jcOs9qjwcEcAf9okxVCITHTWNTykq189sZ0BP
         awYw==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@xilinx.onmicrosoft.com header.s=selector2-xilinx-onmicrosoft-com header.b=NaDwKK0s;
       arc=pass (i=1 spf=pass spfdomain=xilinx.com dmarc=pass fromdomain=xilinx.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=xilinx.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x3si7683080vse.75.2021.10.15.13.39.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Oct 2021 13:39:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@xilinx.onmicrosoft.com header.s=selector2-xilinx-onmicrosoft-com header.b=NaDwKK0s;
       arc=pass (i=1 spf=pass spfdomain=xilinx.com dmarc=pass fromdomain=xilinx.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=xilinx.com
Received: from localhost ([::1]:35174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mbTz3-0002oJ-Ve
	for alex.bennee@linaro.org; Fri, 15 Oct 2021 16:39:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tongh@xilinx.com>)
 id 1mbTvh-0005yW-76; Fri, 15 Oct 2021 16:35:49 -0400
Received: from mail-dm6nam11on2041.outbound.protection.outlook.com
 ([40.107.223.41]:24008 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tongh@xilinx.com>)
 id 1mbTvX-0002zl-Gt; Fri, 15 Oct 2021 16:35:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d/4PPCBBC35hj1RuUL//NXNtsXCCvqGl2GZqB/pCaU21TVuNmlxSBYLKJb0DOq5Wg1PGOkS+WtHC7G5YZ4cA5PkO8Q5okUPmLOC5GDm20rGTWzLgJZqRGyLlOpnOVgAlcYo/Gc+en5GLMsatVZnQNA79TkZ/ikbaHI8pAIlEq59ljBhaMu1Edc/nun55LjiJChPEcDZXh0BitxofaQcxN9OEsofbxjTLAW0wviZtfl2FgpeHj2Jv5sckmKN9L/LLkYVss8G4RY/LKWtR6MiNFO0EbHorr7yoeRbgf6c9RSBCj76KjknNGxbW57zqzbDxp7fTH7YxU9lkFEUONDfMkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I3KWTabP03ClI+yX9/i8IP+n+U06HUu7XfK852+fWR0=;
 b=kQzdeisfZLNyzPA32BUVKZN6JDOafizplwH4yGUBC5U8w9A0WAYgG2RMf1TaOPGTzAsuHRf2iF3x8yQGkjwwJbU5QVHF9Kxs3xWWxbj0By0HFVP5J94MAhP2sf6KzkldgZzs6vrtoz58m6mXbDA9DMC4pnwVQwo+X4fhjddyPpBxgGOywZQU3/GZf37ecxW45LqugFEzEvDSHG7byEpXO6vL5VVvlKEB27PINmHdi7HIQG7p3edWNPqCup2uTDdfyvHMT5J3x/lVrriQFsiaw4BDr34W8yUYL0Ex9DTUYzYVuNw/lTkizrzizHPefYFkW6uRm9ZVFry8FRe+Yf1Imw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I3KWTabP03ClI+yX9/i8IP+n+U06HUu7XfK852+fWR0=;
 b=NaDwKK0sMmeVpvCrlK7W3esyFYy6pcatpAnpSybYpf8Xwu8INowisyOmQSRQgJuVCoFfg8yqB3W2L1rGe25sNUHUYL7oSXommgLB0teBz+qL1WT1PKlcnTr5/Y8/lUpd4DnCQQbN2dsqt52kXA3Ci9b+hvDpPeXMaNpe+RXIZoA=
Received: from SN6PR08CA0031.namprd08.prod.outlook.com (2603:10b6:805:66::44)
 by BYAPR02MB4088.namprd02.prod.outlook.com (2603:10b6:a02:fc::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.24; Fri, 15 Oct
 2021 20:35:33 +0000
Received: from SN1NAM02FT0036.eop-nam02.prod.protection.outlook.com
 (2603:10b6:805:66:cafe::9a) by SN6PR08CA0031.outlook.office365.com
 (2603:10b6:805:66::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.14 via Frontend
 Transport; Fri, 15 Oct 2021 20:35:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0036.mail.protection.outlook.com (10.97.4.102) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Fri, 15 Oct 2021 20:35:32 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 15 Oct 2021 13:35:32 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 15 Oct 2021 13:35:32 -0700
Received: from [172.19.2.40] (port=43112 helo=xsjtongh40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <tong.ho@xilinx.com>)
 id 1mbTvQ-000G9T-32; Fri, 15 Oct 2021 13:35:32 -0700
From: Tong Ho <tong.ho@xilinx.com>
To: <qemu-arm@nongnu.org>
Subject: [PATCH 0/3] hw/nvram: Fix Memory Leaks in Xilinx eFUSE
Date: Fri, 15 Oct 2021 13:35:29 -0700
Message-ID: <20211015203532.2463705-1-tong.ho@xilinx.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 299f0496-44d8-4e3a-80d2-08d9901b55bd
X-MS-TrafficTypeDiagnostic: BYAPR02MB4088:
X-Microsoft-Antispam-PRVS: <BYAPR02MB40889705E82B4466AB157758CDB99@BYAPR02MB4088.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B28mTZbXjyhodKLfshp/eP+A49aS/9oW11slPKkZoROCMOQ1hsIvElLSNBLoJLT9qfGgVmz9I6L+CYaoGrqM6ilEDMzYLpstdCUOS9VVx5bhbyChlf/oDeoS/SMsBJxAOewO3aC1fxPkXmHLI/RgNeHIpQQPneHLvOGPORbowVzKd+3P7pYMvRQLT30BLKj3VQr88FobnS4IGF/BbOPsWd745+46E+Zl3HWVuV0SF3x/uEVz8k4ASK343ZKK0gXvbgnD/hE5AFMcm5NeDsUijgdHP6BoMNWHApKIo8KnOuE8+MU6y5QE6c6XeP5c+Lzii+SnTIvUJNim/7M/gMt0Weqqbp9JC410wIYY1RRIBXTm7DogDRaPl53byphZMMBBrk4W2/uiwoeFgDEw0saYFuWpRUeULut/kz5zLzCbm8PqSNja8q82Rz6S95q5NkyQSR3lR7jSQIP9IlGIpcuUyCX5pIs2rNK3xJGbNJPsB4EFdccT/fq6jvTmGzj2gQrxTJrWaRD6hJUX85oIK2DED3ezyoOqP2cdcssNrqdUfUkDITQKOgMF7mlt5HP5lKjOfZuVJB1aPhjHvINZyVFKqAn5/tkw9PBvsxT/wBj/yC5s6GKnf8mWR0BQ9yusV3wiVwHo18h24M7HD24UYRsio2Xc3cbutZH15Sc5sHjagfaEWal45gZpRbJn9vPIQXq1JT+U6VoWOmfsAXv5z8CifHt4k8SzHNqR9xYyJ/E1vu4=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(46966006)(36840700001)(54906003)(6666004)(47076005)(70206006)(316002)(7636003)(2906002)(8936002)(36756003)(44832011)(82310400003)(36906005)(186003)(336012)(1076003)(70586007)(8676002)(6916009)(2616005)(426003)(508600001)(7696005)(356005)(107886003)(36860700001)(83380400001)(26005)(9786002)(4326008)(4744005)(5660300002)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 20:35:32.5835 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 299f0496-44d8-4e3a-80d2-08d9901b55bd
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0036.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4088
Received-SPF: pass client-ip=40.107.223.41; envelope-from=tongh@xilinx.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_PASS=-0.001,
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
Cc: alistair@alistair23.me, tong.ho@xilinx.com, qemu-devel@nongnu.org,
 peter.maydell@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bCUTVbkY7df4

This series fixes memory leaks in Xilinx eFUSE devices for
the Versal and ZynqMP product families.

The leaks result from failing to free memory allocated
by object_get_canonical_path().

Tong Ho (3):
  hw/nvram: Fix Memory Leak in Xilinx eFuse QOM
  hw/nvram: Fix Memory Leak in Xilinx Versal eFuse device
  hw/nvram: Fix Memory Leak in Xilinx ZynqMP eFuse device

 hw/nvram/xlnx-efuse.c             |  9 ++++++---
 hw/nvram/xlnx-versal-efuse-ctrl.c | 20 +++++++++++++++-----
 hw/nvram/xlnx-zynqmp-efuse.c      | 18 ++++++++++++------
 3 files changed, 33 insertions(+), 14 deletions(-)

-- 
2.25.1

