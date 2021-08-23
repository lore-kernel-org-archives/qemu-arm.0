Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp2079638lfg;
        Mon, 23 Aug 2021 10:50:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyCJ8UUhcAGsMjUhroSaWy7XytAlAjhK9tDI0XQDuXnz6c+6U0O3sFMtXQkz3PLBuY3qgML
X-Received: by 2002:a5d:850f:: with SMTP id q15mr27843394ion.118.1629741003529;
        Mon, 23 Aug 2021 10:50:03 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1629741003; cv=pass;
        d=google.com; s=arc-20160816;
        b=Oko/L9vUjkWifx/A8QuarWOt/I4oLfZ4ECQQltfG8x9lNKEIg3vjrNhvbGH3nLKeNI
         jEKtVSC+JFlVhNUtmSpSHrf5jWWaqZfDC9/j/DLSehinr/TaWXB/QTlxLI1ClDVzjZy5
         YM+KDUo8ETvtKigPzgjXg9gZtuWp/r+Go+sWUEjMtJiIz5ADzWZQpLNxoHd5O6Zwn/N7
         IIs41w0dWg8bWtM8I/PHs8RDaXc+oBkl1oBiQlNhF0GFoMLWUJvNyIca2NVj26GpTWME
         To19O/gMFLCexzpE8rmUqYA7N/K2xh0COekDskwfAzNdnGIVQihzWoDl95USH9+tm36V
         viHA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=DP0irHmJmDA+nrAj+yLx0ch5DbzRyDx7WdBrxMTkzjs=;
        b=EVRSQ0iS8f2s13aQpkRsKohbd/tjIAl7bI/gu/IjDAaNoQaU+/q1ayH1yc6J0MtPfH
         5U1sb6jGKGo8qyY1QtBY1vxEJ7y5VE3sl2LjoQClwP2bxxsjywzXdIV1JbDTtZw/52U+
         kAcA+DiGDwEPNWv2Ip7UiTFOgn1wLd2WzVapkhhS+Uk7H3d7uNEYPeNxA1vixkukFCRK
         blx406llawtMVASyUgk75vv+o8BXY3r4WZptr43EdtbVDmKmMuCfMC3RNAQdxBEkGY7H
         7YbYvCHYT83XFHyVmRWQPLh2aE4DeYUXl4lxoa1O4IMVf6mIqBkRx8g4dIpwZXMXwYyD
         NcJg==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@xilinx.onmicrosoft.com header.s=selector2-xilinx-onmicrosoft-com header.b=sbfAX5Kl;
       arc=pass (i=1 spf=pass spfdomain=xilinx.com dmarc=pass fromdomain=xilinx.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=xilinx.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r6si14972728ilb.145.2021.08.23.10.50.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Aug 2021 10:50:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@xilinx.onmicrosoft.com header.s=selector2-xilinx-onmicrosoft-com header.b=sbfAX5Kl;
       arc=pass (i=1 spf=pass spfdomain=xilinx.com dmarc=pass fromdomain=xilinx.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=xilinx.com
Received: from localhost ([::1]:57788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mIE5C-0005Ny-Pr
	for alex.bennee@linaro.org; Mon, 23 Aug 2021 13:50:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tongh@xilinx.com>)
 id 1mIE4i-0004XE-Dx; Mon, 23 Aug 2021 13:49:32 -0400
Received: from mail-bn1nam07on2043.outbound.protection.outlook.com
 ([40.107.212.43]:38117 helo=NAM02-BN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tongh@xilinx.com>)
 id 1mIE4f-00018d-OH; Mon, 23 Aug 2021 13:49:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cwno5UqrNUeJUiEFe9m+C9WX12yxZpgLWXAeSy8PTC1+WWmEgZnhmi6xGviNfA+zXgsEwv/xwWVNSXfavBA8NfB0LQ/v4s0f0FxZ7i758Hk92k8gj54E0yzPDUnkmDEx1mjG07523/oQqsI4tKO48dqqelzBeUVNscWi5deej14E/Nj6HcvItJPGgsX53AUH30+n/6Mxt2xUt0ETEZVDcJGLyYSyFFPDF8RYoGfsQP26j5pm9RXdbKcgU3cI75uFu7V2ygRA3jRzm9laf5ZXvW+ZCSh5VUxsTbyjQ30UuQBfbTjkx4WMgPKSviFKVSHiHpCsnqUGxcVnsSHU4pZ0PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DP0irHmJmDA+nrAj+yLx0ch5DbzRyDx7WdBrxMTkzjs=;
 b=FfoJ/Gy7OHg46ekfTcEVS3Vr5ilGezwkiiyL1v3LMTM/tP3M8+Y5qw1d3R1v9kyxyZXyeUObpPyiAhUZOIxzESFKiwlVzsxSb0QErNp1ofC7GX51rc8C9dN06nw08R8EOLDvgdTJ/YnhgcNqj4KIKE5vL7Xv5wguTpzFs4o4aoB0dHsbMCW7p4UN5uzQqNtwGLj4lA+itQQGqP4vG+lY36BSEKpNaw02bOm1nxtRPzijKmREEii1BDza8bgI1QD6W5tT1Iffz0IEDrVY9JWaVTlO4D98h1smrCxWyISIH8RISXHGVHS8YnBCLOdBn9qKGm6IEMIxXP67LEvjDhbHPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DP0irHmJmDA+nrAj+yLx0ch5DbzRyDx7WdBrxMTkzjs=;
 b=sbfAX5KlNTN65F9AAJvEM8FMbT4aGaa0/LLZ6BS7mWdkCbbhQZcDxuK4g3XdfEdfE0trdTMmf2OkH3C2CF0DjbYh/HsmV5D4oMvlTBNyUxiHaNOrkjEo0VdUSr5gTC9hpEjtluci5FowkQMvYEdY1c3VbuB81aTAyUFlfXuCtPE=
Received: from DM5PR22CA0003.namprd22.prod.outlook.com (2603:10b6:3:101::13)
 by MN2PR02MB5840.namprd02.prod.outlook.com (2603:10b6:208:112::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Mon, 23 Aug
 2021 17:49:25 +0000
Received: from DM3NAM02FT008.eop-nam02.prod.protection.outlook.com
 (2603:10b6:3:101:cafe::f5) by DM5PR22CA0003.outlook.office365.com
 (2603:10b6:3:101::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Mon, 23 Aug 2021 17:49:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT008.mail.protection.outlook.com (10.13.5.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4436.19 via Frontend Transport; Mon, 23 Aug 2021 17:49:25 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 23 Aug 2021 10:49:24 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 23 Aug 2021 10:49:24 -0700
Received: from [172.19.2.40] (port=46976 helo=xsjtongh40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <tong.ho@xilinx.com>)
 id 1mIE4a-0007u4-A6; Mon, 23 Aug 2021 10:49:24 -0700
From: Tong Ho <tong.ho@xilinx.com>
To: <qemu-arm@nongnu.org>
Subject: [PATCH v2 0/9] hw/nvram: hw/arm: Introduce Xilinx eFUSE and BBRAM
Date: Mon, 23 Aug 2021 10:49:15 -0700
Message-ID: <20210823174924.201669-1-tong.ho@xilinx.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8e4e7c28-0601-42bc-2e1b-08d9665e58e1
X-MS-TrafficTypeDiagnostic: MN2PR02MB5840:
X-Microsoft-Antispam-PRVS: <MN2PR02MB5840AFC8817F297F76D53C3BCDC49@MN2PR02MB5840.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZOof1r5ZwfeeVzLLXUCCz8ArrZJyA9BWmolGAzHM4yIysUoxtDUOO6pF+lX/Tu51vidXNqplwHq29l1WckJvQ2xilJFIyPlQmenTJIxSWq/0C6mH68G58i/+Zy0FTb8JIP2425akd3S+11J5zN+Kf1GARafEv8HhCdjfI8lq5DhJQYBUi3H9NalCYHsJxWgtRx21q2EJlo3pb472bVQkel9Jjuodpf/lscqLZXVdtuIBk9NCFDsIMyBigee2P8xu6IWUOeYxCDMcuBCjsnqxmlCa7X8gBRAGN3QVk8h3kjBdH8kxRegt8PhKHh++cSNfeYSKoRTCTUyF0t+qjnjATju/w4eRackt3olnc2ozvEqdXTRj5uMAlPrEFbwp5MSpA6vT1p+XvgWjPgdijY5sRuVdbUDYDNDRUAnOA9rY2OkbLZcH3l5ZC6Rg6osbJl1UOlNt7lPdLPHpv4q8PmKfbvrfQoin9d9IwJtNavnx8DS1/MzoVok8TQe6ghFxi6qqVSPRHqWRvAE/uRKcNjuvcm9GRSYV0ecT/AzXKrORO8GniL1IZgVfTusQlGSi88/vW0HvMmjeyaXHay1Lf3ts73XMX8AyiCRlLIf0hBmXDeUa4eQR1g0CGDu43qKlTD1cuDedepLnexAKqNnkcAz6/8C7p5o9VW0YM/bysGAo+f/Hf1FscT5cveuUfm2qnQnORhWdI8uJK12S9fcz2cKqpOPFwHW3mOqoUA+XtCcstNc=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(39860400002)(396003)(36840700001)(46966006)(8676002)(9786002)(6916009)(316002)(36906005)(2616005)(8936002)(2906002)(36860700001)(44832011)(4326008)(5660300002)(26005)(186003)(478600001)(426003)(70586007)(336012)(70206006)(7636003)(47076005)(356005)(82740400003)(54906003)(1076003)(36756003)(6666004)(107886003)(7696005)(82310400003)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2021 17:49:25.2707 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e4e7c28-0601-42bc-2e1b-08d9665e58e1
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT008.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB5840
Received-SPF: pass client-ip=40.107.212.43; envelope-from=tongh@xilinx.com;
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
X-TUID: P7y75ZM2XswP

This series implements the Xilinx eFUSE and BBRAM devices for
the Versal and ZynqMP product families.

Furthermore, both new devices are connected to the xlnx-versal-virt
board and the xlnx-zcu102 board.

See changes in docs/system/arm/xlnx-versal-virt.rst for detail.

---

Changelogs:

v1->v2:
* Move doc change from 1st to last of this series
* Remove outdated comment of 'autogenerated by xregqemu.py'
  from all affected files.

---

Tong Ho (9):
  hw/nvram: Introduce Xilinx eFuse QOM
  hw/nvram: Introduce Xilinx Versal eFuse device
  hw/nvram: Introduce Xilinx ZynqMP eFuse device
  hw/nvram: Introduce Xilinx battery-backed ram
  hw/arm: xlnx-versal: Add Xilinx BBRAM device
  hw/arm: xlnx-versal: Add Xilinx eFUSE device
  hw/arm: xlnx-zynqmp: Add Xilinx BBRAM device
  hw/arm: xlnx-zynqmp: Add Xilinx eFUSE device
  docs/system/arm: xlnx-versal-virt: BBRAM and eFUSE Usage

 docs/system/arm/xlnx-versal-virt.rst |  49 ++
 hw/arm/xlnx-versal-virt.c            |  58 ++
 hw/arm/xlnx-versal.c                 |  57 ++
 hw/arm/xlnx-zynqmp.c                 |  50 ++
 hw/nvram/Kconfig                     |  17 +
 hw/nvram/meson.build                 |  11 +
 hw/nvram/xlnx-bbram.c                | 534 +++++++++++++++++
 hw/nvram/xlnx-efuse-crc.c            | 118 ++++
 hw/nvram/xlnx-efuse.c                | 252 ++++++++
 hw/nvram/xlnx-versal-efuse-cache.c   | 139 +++++
 hw/nvram/xlnx-versal-efuse-ctrl.c    | 784 ++++++++++++++++++++++++
 hw/nvram/xlnx-zynqmp-efuse.c         | 860 +++++++++++++++++++++++++++
 include/hw/arm/xlnx-versal.h         |  17 +
 include/hw/arm/xlnx-zynqmp.h         |   5 +
 include/hw/nvram/xlnx-bbram.h        |  55 ++
 include/hw/nvram/xlnx-efuse.h        |  80 +++
 include/hw/nvram/xlnx-versal-efuse.h |  62 ++
 include/hw/nvram/xlnx-zynqmp-efuse.h |  45 ++
 18 files changed, 3193 insertions(+)
 create mode 100644 hw/nvram/xlnx-bbram.c
 create mode 100644 hw/nvram/xlnx-efuse-crc.c
 create mode 100644 hw/nvram/xlnx-efuse.c
 create mode 100644 hw/nvram/xlnx-versal-efuse-cache.c
 create mode 100644 hw/nvram/xlnx-versal-efuse-ctrl.c
 create mode 100644 hw/nvram/xlnx-zynqmp-efuse.c
 create mode 100644 include/hw/nvram/xlnx-bbram.h
 create mode 100644 include/hw/nvram/xlnx-efuse.h
 create mode 100644 include/hw/nvram/xlnx-versal-efuse.h
 create mode 100644 include/hw/nvram/xlnx-zynqmp-efuse.h

-- 
2.25.1

