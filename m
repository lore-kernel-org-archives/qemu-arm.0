Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp104143lfg;
        Mon, 24 Feb 2020 01:45:38 -0800 (PST)
X-Google-Smtp-Source: APXvYqwhEGEeLWH4Awlwrs+ToghNDN8D8PG2KiZKSxal+SaFsXWQ8GEXm98AmfD/Dt45S2NuzR0C
X-Received: by 2002:ad4:4a69:: with SMTP id cn9mr44866776qvb.218.1582537538712;
        Mon, 24 Feb 2020 01:45:38 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1582537538; cv=pass;
        d=google.com; s=arc-20160816;
        b=foLCtOm0OlNB/vtyOAD7vhWWhhdxwCIciEuKyAXs2VDSSixHnR82Y+7OVVyxZYNoo0
         lI3R8mrhhXvSKVv93qWJe/GcXQGRzvl70/SZTgSkl++L81P1nHpQMzUlxK4OFkMVrQHY
         wg9zyoyIAUrtITJvob/xu8iZK/JcWszUHg/sNPyNfuY8iS1AZThlWFZGeQpbADkWK7Na
         D5RHKjyCqDMTPP6++QM3UT6X0Y4GNS8oDDHgRN9aYiMc3jxw+KYupw1fT7kEQQDzCsrI
         bMgYrXkez1XclKjOHlNkaYINYduzVX7Xl0OrsW5fFyvwitJCO39oSfl+hqSCJuxb8y9J
         LmhA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:dkim-signature;
        bh=WftwKRsIrb/fF0x7O6VjbxITpvbok74tcZgzj4cYi+A=;
        b=RPlnAZNtfruHWjMdwrNNughjLfWqAOYRfCDcO9+jAM02P34nJ4VRhf488VRVFriF3z
         0Kw2RWqFLF/Nl5+hkn610VU+1UyFAJLU0bjYqzdFLW809zdoWZ0p671UICKOUvBDKkPK
         pTSpg74GvGUEw0dda04WJx+MWe7EismPFNituJco2bFi3to8m0Q/4vGF+GBtHDuj6qp6
         g0qcB3iFmbAeTbmBarMloAfXs5bi5T/Uy8ey9Etya19EqilZdqaKk4juj3mx8DqC7lqC
         xTynoGtbEi/tlABbLg7l1ZanM/6F0FFAE37LRON1otIhH8ay6ubuZBfUEZFGk47K3Hds
         g//Q==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@xilinx.onmicrosoft.com header.s=selector2-xilinx-onmicrosoft-com header.b=LpudzdZO;
       arc=pass (i=1 spf=pass spfdomain=xilinx.com);
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j22si5839129qkl.215.2020.02.24.01.45.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2020 01:45:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@xilinx.onmicrosoft.com header.s=selector2-xilinx-onmicrosoft-com header.b=LpudzdZO;
       arc=pass (i=1 spf=pass spfdomain=xilinx.com);
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:33864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6AJ0-0002Ee-2z
	for alex.bennee@linaro.org; Mon, 24 Feb 2020 04:45:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37435)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <saipava@xilinx.com>) id 1j6AHl-0000ny-Rs
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 04:44:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <saipava@xilinx.com>) id 1j6AHk-0007wS-Pw
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 04:44:21 -0500
Received: from mail-bn8nam12on2070.outbound.protection.outlook.com
 ([40.107.237.70]:6021 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <saipava@xilinx.com>)
 id 1j6AHk-0007w1-Jh; Mon, 24 Feb 2020 04:44:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=emcM362LTYIKblLCjTxf52zDAtb1afH/NiQ+6uP+8zHfgG8y5aNsLsEMUXeV07ozncKvDeFNvR9Uq4gphsrLsYq7c3pRw6FSr9/xJVEGWyIJl/nPRBou7E34YaRkTUUU67WVcpvqkrGYJO6EoUypFcRUUk7iob2f0q9aIvHQ8qV72oFoNcdY+rd9jVITS4tSsJGQ9C+ZET1GDL4ZBBqygoRw2tXjzv46VaU8CBSo5lhQcRL3ApJt0WALmewb2qkRf3DMkNoOlLbfGhLbWTUVRBYQluwvfbTlENviwM1na7zT5DOmL+i2qWjJ/lXPsreUHclUfnGx1zoXT1nQ30ZljA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WftwKRsIrb/fF0x7O6VjbxITpvbok74tcZgzj4cYi+A=;
 b=Yy5LgzrqKePmJMkzpFXRQcNIKZXdYsLHp3Z+zvcUe7ywbuVtj3ZA4hq8SAA8n15JYbg2UIH6L+i4lt64JzN/UOfe+gEASmIJ0PWu/vihMtnOQOXy6t5Xw3mmKNwf/EzV/Wux67aYQDnt5UECbBW0wJ+OXP0ZfDNLIc+gkuhP6TDE9RiRMZfmAxrrw45GsBJrUvkQIQxW81HvHjb6O7T1Hzr5sMyFNk0VjsXPuPSiQ0KE+m4Y+OUZgGX0x04hd6A5moicZijq8yXoLv5eR2xnCL98omOukF0/DHld2k68UXIF0O01pxucaRq7dqYx8NpVU2WUZVa55w7sb4MFg5FdWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=suse.de smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WftwKRsIrb/fF0x7O6VjbxITpvbok74tcZgzj4cYi+A=;
 b=LpudzdZOWa0uuJoHiYQW9/jIKQO+ZYB5Hc1NJtCICVWzTmxNoJ9sWAjPB9ZYNVXOrs1n5sUiSn1/UCVyhh/PmdU2a+kxFY875ze7XwzkCMi4FTYuGdDxHoePxoiFAq944p0VowcoVEW/hmTThi+KX0OsQHwW0qttIofTMreIcbw=
Received: from MWHPR02CA0021.namprd02.prod.outlook.com (2603:10b6:300:4b::31)
 by MW2PR02MB3820.namprd02.prod.outlook.com (2603:10b6:907:c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.21; Mon, 24 Feb
 2020 09:44:18 +0000
Received: from BL2NAM02FT008.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e46::203) by MWHPR02CA0021.outlook.office365.com
 (2603:10b6:300:4b::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.21 via Frontend
 Transport; Mon, 24 Feb 2020 09:44:18 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; suse.de; dkim=none (message not signed)
 header.d=none;suse.de; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 BL2NAM02FT008.mail.protection.outlook.com (10.152.76.162) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2750.18
 via Frontend Transport; Mon, 24 Feb 2020 09:44:17 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1j6AHg-0003mu-W3; Mon, 24 Feb 2020 01:44:16 -0800
Received: from [127.0.0.1] (helo=xsj-smtp-dlp2.xlnx.xilinx.com)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1j6AHb-0008Pe-T0; Mon, 24 Feb 2020 01:44:11 -0800
Received: from xsj-pvapsmtp01 (mailman.xilinx.com [149.199.38.66])
 by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 01O9iBJc025457; 
 Mon, 24 Feb 2020 01:44:11 -0800
Received: from [10.140.6.35] (helo=xhdsaipava40.xilinx.com)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <saipava@xhdsaipava40.xilinx.com>)
 id 1j6AHa-0008PX-SX; Mon, 24 Feb 2020 01:44:11 -0800
Received: by xhdsaipava40.xilinx.com (Postfix, from userid 14131)
 id 6DAD113C0BA2; Mon, 24 Feb 2020 15:09:38 +0530 (IST)
From: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
To: "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>,
 Anthony Liguori <anthony@codemonkey.ws>, afaerber@suse.de
Subject: [PATCH v3 2/3] cpu/a9mpcore: Set number of GIC priority bits to 5
Date: Mon, 24 Feb 2020 15:09:23 +0530
Message-Id: <1582537164-764-3-git-send-email-sai.pavan.boddu@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1582537164-764-1-git-send-email-sai.pavan.boddu@xilinx.com>
References: <1582537164-764-1-git-send-email-sai.pavan.boddu@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(346002)(39860400002)(376002)(189003)(199004)(316002)(356004)(5660300002)(6666004)(2616005)(81166006)(8936002)(26005)(186003)(2906002)(336012)(426003)(6266002)(36756003)(4326008)(42186006)(110136005)(70206006)(70586007)(81156014)(8676002)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MW2PR02MB3820; H:xsj-pvapsmtpgw01; FPR:;
 SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; MX:1; A:1; 
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 02857715-7e0c-4869-3a74-08d7b90e1de0
X-MS-TrafficTypeDiagnostic: MW2PR02MB3820:
X-Microsoft-Antispam-PRVS: <MW2PR02MB382038C70C816865E0A5C46DCAEC0@MW2PR02MB3820.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:161;
X-Forefront-PRVS: 032334F434
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nQRW0BA+xBC4f7O7IJgwmxed3Go3kbYYW1iyiyJZ+Q8XmCZc1IwdjjVaYEJsJKfT4EZ/+5gH/3O/f6liIz6fyz+ktqmN8BzbzjgmRS8WLeyLRpaEUTNc5rboy9NOis7UsjgAYSVgDmRcrTscvk3Yh7PGMguFPFrEaz2i9HhjLTivd/5AYm29OIr/5PSCkuqq11/23EILlq+f8kJmnkS9x4wWNiRD9gyB7CN0m31mkT9jhkWqJocHj7IZLwQ7f2Pthgxtp7/Z1bKQjBD4nWYS0IGk62G7KX/WRH/jtx5pTlq7s/YhhWkJhsMa4iXVuyT1nRlQT3HbobrpNbADxdlG6kYe1fjMttcdGQYpiUGI4249qz0TfbG+Wro7WGOV8Ev/+KVmEMtDcIEPy0DcUtHNVExFYUBiukU4BdLPWaPo8gn/tex5LUNO0DDEiTqNWaDY
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2020 09:44:17.6314 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 02857715-7e0c-4869-3a74-08d7b90e1de0
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR02MB3820
X-detected-operating-system: by eggs.gnu.org: Windows NT kernel [generic]
 [fuzzy]
X-Received-From: 40.107.237.70
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BxglidevHprC

All A9 CPUs have a GIC with 5 bits of priority.

Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/cpu/a9mpcore.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/cpu/a9mpcore.c b/hw/cpu/a9mpcore.c
index 1f8bc8a..b4f6a7e 100644
--- a/hw/cpu/a9mpcore.c
+++ b/hw/cpu/a9mpcore.c
@@ -16,6 +16,8 @@
 #include "hw/qdev-properties.h"
 #include "hw/core/cpu.h"
 
+#define A9_GIC_NUM_PRIORITY_BITS    5
+
 static void a9mp_priv_set_irq(void *opaque, int irq, int level)
 {
     A9MPPrivState *s = (A9MPPrivState *)opaque;
@@ -68,6 +70,8 @@ static void a9mp_priv_realize(DeviceState *dev, Error **errp)
     gicdev = DEVICE(&s->gic);
     qdev_prop_set_uint32(gicdev, "num-cpu", s->num_cpu);
     qdev_prop_set_uint32(gicdev, "num-irq", s->num_irq);
+    qdev_prop_set_uint32(gicdev, "num-priority-bits",
+                         A9_GIC_NUM_PRIORITY_BITS);
 
     /* Make the GIC's TZ support match the CPUs. We assume that
      * either all the CPUs have TZ, or none do.
-- 
2.7.4

