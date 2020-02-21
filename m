Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1484108lfg;
        Thu, 20 Feb 2020 23:47:26 -0800 (PST)
X-Google-Smtp-Source: APXvYqzJJJPcebPbRnz/TIEjgSrPakLjTzWExMYYgnYHr7IAqri6IfkG4wVXa/mCDbNuIDxorqKj
X-Received: by 2002:a37:aa8c:: with SMTP id t134mr31190009qke.243.1582271246084;
        Thu, 20 Feb 2020 23:47:26 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1582271246; cv=pass;
        d=google.com; s=arc-20160816;
        b=tNjlZic3yXtxZK9fq966hnUf58CNqalUpMF6XiHoeHzBBgQJgMhyKdOJviMVj1K50Y
         YsgkqViNO/rivUYHR3L9/Ml2QW5i6us7xTeBym2DRgY84/4oPWwl9nUJSrIB1LaSedJD
         zxHD8zmddMVvReg9rWz+eadcKg52JaBFWVZwP6xr2Rcc5SiTPapKuX5L4unlI/KMr9n0
         vHpP6yzLUsENujOdNIQlQoZvbpYC6YYL3DhDVC6E3jcA+/5NtJmFyjjHt4W8UhqVJYYs
         S/JaIyvG1Yn6NtXnCFMMyLd1L1YpWBuSvlXGZdYchwV0EhaFnZovQDGG9tlnOClnTZzo
         fnhg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:dkim-signature;
        bh=93ZmqlyPxWPJk4CKMBWKy7wmcow9SiFeY4euBrW33Ts=;
        b=O6REUwxrx9ZYwHTZMgAfflgIunvSMWN9MNyS6Dqy2UieQS1wQ79JSj9QjKT7BtTvmk
         NPfU4YgVeGAfOs8aGwWnkc5ZsAg1In4DsIwqdo90ANgwee7DUWF/qStG6sWVh1EMxowG
         +BeKNiR2VvJkhsNYgZwpfMx2exPZyX1BPU2Q8w+HOV2sO9nej39HRwbB+Bp8TpytGDGg
         KdAubYQJ/cR2MeYVCz79Y4epqNEbtBOfUnxkS7rjEcF2/bFYekgkcmJj0tcmABafD2vq
         E4Dat1BZ4MAr3DUlRdRNUJEABInJvz4ofcSwFoFn71yT+7lbBn7Jdt2/wcAMukrzLacW
         HqZA==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@xilinx.onmicrosoft.com header.s=selector2-xilinx-onmicrosoft-com header.b=AuT2HACd;
       arc=pass (i=1 spf=pass spfdomain=xilinx.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v23si980338qtk.131.2020.02.20.23.47.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Feb 2020 23:47:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@xilinx.onmicrosoft.com header.s=selector2-xilinx-onmicrosoft-com header.b=AuT2HACd;
       arc=pass (i=1 spf=pass spfdomain=xilinx.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j531x-0001HK-EE
	for alex.bennee@linaro.org; Fri, 21 Feb 2020 02:47:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60666)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <saipava@xilinx.com>) id 1j531d-0000y6-8v
 for qemu-arm@nongnu.org; Fri, 21 Feb 2020 02:47:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <saipava@xilinx.com>) id 1j531X-0001Hp-N0
 for qemu-arm@nongnu.org; Fri, 21 Feb 2020 02:47:01 -0500
Received: from mail-mw2nam10on2043.outbound.protection.outlook.com
 ([40.107.94.43]:6028 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <saipava@xilinx.com>)
 id 1j531P-000160-TW; Fri, 21 Feb 2020 02:46:52 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X1aB/CUt5GAqJqJMJ4AMCvncQiJJYKIeQiyF/iwyDVf6NtsjCTEQUdVQDKWit+Esx3q8B7q7UPYr6T/UiRt0ykTMNrfWIWeIMvmvjkPP8Zl4bg5tX3YyQUyG+lkzBncMi0MIji6jIRQb3D4eKxL1QbvCF66z5YjArheEFnuYenQ+Z+EzkP/Hltq2SSZXIGXUT7kOdWEINkcHH7snB3SqsYcepyr9/Mv016V086AbRUWGNys543+uvXMvFfa4PywfWKekpKIN1Q5GCcWgDWzhWv+sZk1yHu7OEGED4M/L4KF/VO2VRt296PIC4gqpfLTlLkYlnmb2ZrSd8SwP3uBtjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=93ZmqlyPxWPJk4CKMBWKy7wmcow9SiFeY4euBrW33Ts=;
 b=ZsKkSr3CM0+nEn4HHefDmCnHvj+Bo+QSzhi52z6eVvtElVT/6FevygEHaho9PY4UWgVr9B/jMB7CwYFJ/qazhGeGvsv2oqZ0Xs0rGUxafoQD+daHkyVJ/l/HkryfFTOKMxu7tyXd5XYTERO/ESfsR0/dz2SSSR7o6CoSbb2JltXxgogBr46DD1CqWunxMld4FlhvjPZMRb653LMI3Z8OY4m/1iBiP10yVovrRwVBj20jUI/xqWeaMe7qlRnBqqIPTLpaPayLvJOEE911lsj1l+Qt0pxjFPWIOMaeOwpA72g2dEISFl1e19a82CUHDqHZEFQbeFPK0u10Xx3fH4tS+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=suse.de smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=93ZmqlyPxWPJk4CKMBWKy7wmcow9SiFeY4euBrW33Ts=;
 b=AuT2HACdvQU/w2VcuQTGKEHaPl+Kuxj3Waq1QuoCvlJL/TzWj2BjAxgQRY62VDDeoU9i9qaPAfXHtb3AOK09AFIhzln3SJnaOH+LEnxvX9hYlnkwbidU6fCoNoobKXl4/RQSdpr1GOrCWKgNlGB6B/xekdIKxOwDN7WgPbaOpL4=
Received: from MN2PR02CA0029.namprd02.prod.outlook.com (2603:10b6:208:fc::42)
 by SN6PR02MB4334.namprd02.prod.outlook.com (2603:10b6:805:ac::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.22; Fri, 21 Feb
 2020 07:46:48 +0000
Received: from CY1NAM02FT041.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e45::204) by MN2PR02CA0029.outlook.office365.com
 (2603:10b6:208:fc::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.25 via Frontend
 Transport; Fri, 21 Feb 2020 07:46:48 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; suse.de; dkim=none (message not signed)
 header.d=none;suse.de; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT041.mail.protection.outlook.com (10.152.74.156) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2750.18
 via Frontend Transport; Fri, 21 Feb 2020 07:46:48 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1j531L-0002CM-OZ; Thu, 20 Feb 2020 23:46:47 -0800
Received: from [127.0.0.1] (helo=xsj-smtp-dlp1.xlnx.xilinx.com)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1j531G-0006Cp-Lc; Thu, 20 Feb 2020 23:46:42 -0800
Received: from xsj-pvapsmtp01 (smtp-fallback.xilinx.com [149.199.38.66] (may
 be forged))
 by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 01L7kfep018626; 
 Thu, 20 Feb 2020 23:46:42 -0800
Received: from [10.140.6.35] (helo=xhdsaipava40.xilinx.com)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <saipava@xhdsaipava40.xilinx.com>)
 id 1j531F-0006Cf-Kr; Thu, 20 Feb 2020 23:46:41 -0800
Received: by xhdsaipava40.xilinx.com (Postfix, from userid 14131)
 id 58DAB13C0374; Fri, 21 Feb 2020 13:12:17 +0530 (IST)
From: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
To: "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>,
 Anthony Liguori <anthony@codemonkey.ws>, afaerber@suse.de
Subject: [PATCH v2 3/3] cpu/arm11mpcore: Set number of GIC priority bits to 4
Date: Fri, 21 Feb 2020 13:12:07 +0530
Message-Id: <1582270927-2568-4-git-send-email-sai.pavan.boddu@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1582270927-2568-1-git-send-email-sai.pavan.boddu@xilinx.com>
References: <1582270927-2568-1-git-send-email-sai.pavan.boddu@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(39860400002)(136003)(376002)(199004)(189003)(42186006)(426003)(316002)(70586007)(81156014)(81166006)(8676002)(70206006)(8936002)(336012)(110136005)(2616005)(6266002)(4744005)(186003)(26005)(4326008)(356004)(5660300002)(6666004)(2906002)(478600001)(36756003)(42866002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR02MB4334; H:xsj-pvapsmtpgw01; FPR:;
 SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; A:1; MX:1; 
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 32e7c70a-940d-47eb-c5e6-08d7b6a234cf
X-MS-TrafficTypeDiagnostic: SN6PR02MB4334:
X-Microsoft-Antispam-PRVS: <SN6PR02MB4334EB2154051167806FF303CA120@SN6PR02MB4334.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:78;
X-Forefront-PRVS: 0320B28BE1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p89TLr+GNGTBsUx4T9zj74xaxKi4vRZEM2+dBD7imJhziBbkho0WZd+Je0hUWAHjYT3UcGrGXUCXa7Uq5c6nw8IIIfT8b5a8venGTxay59CG0iXIPMhvk/3jlFsOwnMBogJO//EpqeQM4UC2v5SCMATV/Mgb28WAtb6LCzWMtdGeUfXnKaCdI+JbPoZUkNLSc9Oce7+xSa81nzVfvHO5wqVwbHM5jgbKsjZTT/CMmbj9ZaFDgs2QKj325yMczzUt7I07wsXMHfl0kG6p/XlXoZIXRFkmJsxNVHW9PoJ8HYbfIWIaz1xVjNb9nh6eCTZ9MRkLSidH7/BrjPeQNtNPKXUlxk5/rg1y+Fvw308eOvJGCZTsLPcGW9oD3rcszskm9Uv/bRheN4UpetwuExgHLdKP1xSXkGes0tfH/4SrG8/4chHuEtUbwpBZHm9hdat4vLJBcE2OLNTpssTelPn1M8bqnLRMEwFpSkoRF39mIq+K87/0qozIdU2d4+JV4xbV
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2020 07:46:48.1912 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 32e7c70a-940d-47eb-c5e6-08d7b6a234cf
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4334
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.94.43
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
X-TUID: UtsiUFSRFz3u

ARM11MPCore GIC is implemented with 4 priority bits.

Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Suggested-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/cpu/arm11mpcore.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/cpu/arm11mpcore.c b/hw/cpu/arm11mpcore.c
index 2e3e87c..ab9fadb 100644
--- a/hw/cpu/arm11mpcore.c
+++ b/hw/cpu/arm11mpcore.c
@@ -15,6 +15,7 @@
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
 
+#define ARM11MPCORE_NUM_GIC_PRIORITY_BITS    4
 
 static void mpcore_priv_set_irq(void *opaque, int irq, int level)
 {
@@ -86,6 +87,10 @@ static void mpcore_priv_realize(DeviceState *dev, Error **errp)
 
     qdev_prop_set_uint32(gicdev, "num-cpu", s->num_cpu);
     qdev_prop_set_uint32(gicdev, "num-irq", s->num_irq);
+    qdev_prop_set_uint32(gicdev, "num-priority-bits",
+                         ARM11MPCORE_NUM_GIC_PRIORITY_BITS);
+
+
     object_property_set_bool(OBJECT(&s->gic), true, "realized", &err);
     if (err != NULL) {
         error_propagate(errp, err);
-- 
2.7.4

