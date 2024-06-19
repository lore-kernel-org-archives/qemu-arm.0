Received: by 2002:a05:7022:f201:b0:7e:eb73:5b3b with SMTP id rf1csp838037dlb;
        Wed, 19 Jun 2024 02:17:04 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCVDhLVruh4KAl+re9ZPkBueZ1NzMKyShsBV1s7JbDuFpyvjZbftrIvcaN9wG9pGXrx3hpefdeOziHRBE3NSZQ5YBGpc7bkN
X-Google-Smtp-Source: AGHT+IFdoCGT0FSB+wONIxsdOKlP6TTca+53F6hT2OqIvxRQdeMi4bVapVSrlkjSgQGZeMCHNtSK
X-Received: by 2002:a05:622a:d6:b0:43f:f07a:249b with SMTP id d75a77b69052e-444a79c261cmr28288391cf.17.1718788624001;
        Wed, 19 Jun 2024 02:17:04 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1718788623; cv=pass;
        d=google.com; s=arc-20160816;
        b=e1oCcQtErUMDpx3UHkoNs2E7qyGI5J+6O6Wd3dfxoy7F8qVc7piY5t0ugzxEg9SEBF
         ODAleICUmnFPRZ9VFs2fMXk8hhpMZoxWljTeRL9YeChRQR6EDLh1acN3rXkn1NOhsD6R
         k/biwNPstKnzAIbSe2LbdM8MpkgTj/5FK9PaJmFqp4i6Dq1+/T7TLFclyHWXlWCUWmHj
         M++XXoY6p1wo+6S0vHsGWDqIZSz4kIGRnBXobytaoX9BUUp0X8gbxuF5porTf3uJFoUG
         oBeyWRD3336Og0NL/gl08LcnjFCDtxScAtDx6D6tK9+H0CXLektxwzDjsUy1NX1CdVbc
         TS3Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=jvamlq+3atkXRl9UXQ722T+p7FhrjBnF4rhoNIqGCXs=;
        fh=COLUgn0n0wMHSFNgp+WnvUbwzX7rF20PaYC+CQuUEbU=;
        b=oWqZs6T7k+gcyFeuNRiUmSfAhP8bdBYQwGTUVxQslfXbkTuU1j0pgr5edh3bZJ6FF3
         XiN1e2V2TD1fqYt/1ojtN1uYSw3742hYRIfUaXsKk27rgqBxSmeHZKGEh5a9LU616Rx8
         XY+ELla6O8FTDcyjh31LMRbUk52B0Igy1CcnKmQqCiXucVQeS+bCmgn6l02B5NyPpwul
         FcXZ4UyFVgHCtjV4QS39eTv89SFLsoHhxUUton2tpoZlzMPYHk3dlQEdJ0dvOy4KrVbq
         OEWCqUnlafYiDgHiMLr2b/qrIgKeTVQFq2EFGY9nV6k6LRcL24Cie/jAjjLnSyEe2p4Y
         PK9A==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@amd.com header.s=selector1 header.b=aAGI17fJ;
       arc=pass (i=1 spf=pass spfdomain=amd.com dmarc=pass fromdomain=amd.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amd.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-441ef3bb054si149112661cf.121.2024.06.19.02.17.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Jun 2024 02:17:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@amd.com header.s=selector1 header.b=aAGI17fJ;
       arc=pass (i=1 spf=pass spfdomain=amd.com dmarc=pass fromdomain=amd.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amd.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sJrR5-00048Y-MZ; Wed, 19 Jun 2024 05:16:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sai.pavan.boddu@amd.com>)
 id 1sJrR4-00047N-At; Wed, 19 Jun 2024 05:16:58 -0400
Received: from mail-dm3nam02on20601.outbound.protection.outlook.com
 ([2a01:111:f403:2405::601]
 helo=NAM02-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sai.pavan.boddu@amd.com>)
 id 1sJrR2-0003rP-Ef; Wed, 19 Jun 2024 05:16:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ETCCkCLiau00kObTUOkQjC8J9ez7uIU+a4ZcXhtp7U3Xg4VDY0+mrgz2JIkVBzpHWQrSs08EcfXwVDqMveH7y7lzYjtNrR0e2BRNVSRNa+gTvAwiKZFmbeFyNZ4jLdggnMn/Rfybmk44bv5kGmcO2K23qHnCz9G8o6m3imMUMEDwWyqtosc3Swh3kk2zmH1j24axtHXLkJxW9+hgC2x6rZB9ItAhvA4lGjD4B8qs9wZXDq/+zUFVtvslGzHZjdyc41OJPs9RSWqirTxz2Ebt2Qg+D8FtPq/RLyaVOIcHvrqda0OlhQu2+bDt8S2cxUYysZ7sMmxtf+0p7D9eSpenyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jvamlq+3atkXRl9UXQ722T+p7FhrjBnF4rhoNIqGCXs=;
 b=Hsq4pzXqfPY9bsWQ14DJX3ZxB2UgU1nB23kFB0qLooapQjl2A8oMNwF+o2lECXsSBPrOxnMJi5ZAWp2zCEdeAJK7Vn3mD89MCbnq14yt6He8KOuPKGskIceoAh+tfl7PRPYUGRhHthKCqVYV5fkigKN7xYCKrFmcgdCm9vHOEOFSw5IPcdMfGgLUNwgh6xc2tu8w6fsaej2bhwFyY/1bdcVNrTeChqPqejhHe+enP5a41/TVXlHee03yCwczLCtS/eGCXRNMXPVTGu6FgolBdQOnEX8t+nNVJFEKyyqtMP7Xl6B9I8+Ry7aX0b0a5kxi2jnvai/E5dNijALYgJiOGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jvamlq+3atkXRl9UXQ722T+p7FhrjBnF4rhoNIqGCXs=;
 b=aAGI17fJAelODIyFZDBvLYf/coi7Na375liv1OCgSAsqPxxRa5YN2AuBIKKLLa0h2uKVy03x3g6J3JWTcu0dPwvDKruQRvfrBb5vJ+EnBAxB0b3lXOV1rBeuzcfRkyyhvPUbWHk3eaXqm+fQ0jzqHv8I4dMPAx3KN60FWV7D2V0=
Received: from BL1P221CA0007.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:2c5::33)
 by SN7PR12MB8436.namprd12.prod.outlook.com (2603:10b6:806:2e3::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.24; Wed, 19 Jun
 2024 09:16:51 +0000
Received: from BL6PEPF0001AB55.namprd02.prod.outlook.com
 (2603:10b6:208:2c5:cafe::98) by BL1P221CA0007.outlook.office365.com
 (2603:10b6:208:2c5::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.32 via Frontend
 Transport; Wed, 19 Jun 2024 09:16:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB55.mail.protection.outlook.com (10.167.241.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Wed, 19 Jun 2024 09:16:51 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 19 Jun
 2024 04:16:50 -0500
Received: from xhdsaipava41.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Wed, 19 Jun 2024 04:16:49 -0500
From: Sai Pavan Boddu <sai.pavan.boddu@amd.com>
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
CC: "'Edgar E . Iglesias'" <edgar.iglesias@gmail.com>, Peter Maydell
 <peter.maydell@linaro.org>, <francisco.iglesias@amd.com>
Subject: [PATCH v2 2/3] hw/arm/xilinx_zynq: Add boot-mode property
Date: Wed, 19 Jun 2024 14:46:31 +0530
Message-ID: <20240619091632.2825550-3-sai.pavan.boddu@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240619091632.2825550-1-sai.pavan.boddu@amd.com>
References: <20240619091632.2825550-1-sai.pavan.boddu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: sai.pavan.boddu@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB55:EE_|SN7PR12MB8436:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f89437a-83fc-4b18-0e33-08dc90408e10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230037|1800799021|82310400023|36860700010|376011; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iUYUDoTz+2CqSPAU0oZaHoSGi6ILjZccuBu3F2yOXGsz4lR/XrmHtJxqVIdc?=
 =?us-ascii?Q?NjUouaX6/AZju20u3tGBHUgr9dRoLtA2J8iaM8bOCWjQoGYCybHp2RN19PUb?=
 =?us-ascii?Q?XPc/u67yu9DQ+1NK6ucwWFkg5uVlFaYYwCICBk/U/v5MnA45ImRi4uVQDJA7?=
 =?us-ascii?Q?njcy607YVH6mvsyP9koVZV6MzDKaiFDCO0qv3Uz86oBNR6SB6j3P2euQemgp?=
 =?us-ascii?Q?kj3BFWYbbpJ7k5QoGEX0pvWTmhGR5h8quq1y4ovN9dzZoBOmubxR/95mAwwt?=
 =?us-ascii?Q?EophAv05K01uJsL3wExlve94WfytI3ihDhVnR33ObBqUwX0KN/kfBzKScknx?=
 =?us-ascii?Q?7fMmbO/u0KaQPoCXdJOMCOqzu0heI/S3opZZhvVOYVS7zAzdwlP4ixSEkvi0?=
 =?us-ascii?Q?mAA8JUb75C/s4ppHHeI7CqfzG0ePA6tEwijWlI9iYZ+OoZsBbl6oRz3LcFvq?=
 =?us-ascii?Q?LNSRhY5rTlf6TeKi//XSNLatNlRft7YyVF2KqxWwhXAGhkkp3HnLsntV3Ikn?=
 =?us-ascii?Q?aQqUoK0ccdm52kaMBmYGAcZsCB3pyNrANXETUeXdfdEZlQHESVLHnxYz5hm0?=
 =?us-ascii?Q?/Rzgb5bv2zGeNm7Vxj0YE+cW6VbswoHgmK0c7mNnl4cHRNnzFlMIW0pdSllz?=
 =?us-ascii?Q?TkAFETWhNIVpj0D33uiKit7ybymTPyaK3qjjNQiUrKO4sty8zHCHs7cQ8GAB?=
 =?us-ascii?Q?vP5fgcvUJ0RL8x3JLGwEXNRwQXh2biPKPMvgYAIi24vYRyde7vN7OIoNXprm?=
 =?us-ascii?Q?x36JwrzgThZxRZvN/5eyCkEBbtkRGD5YMtaUlD3WNNh0JY2owBQriPWLe6Uz?=
 =?us-ascii?Q?mkzbhhgYbqE/g7mOf9ey4yBY5LetuZu7riWf6hxh2Ig5kuxyb+d5JCoc21zB?=
 =?us-ascii?Q?1SXoqEDhcz4AYnujEE2ZcUZ2TBtuELZgCgxoj5hdN0a0E/10kdHhQFsA2XcA?=
 =?us-ascii?Q?Jc9+PNJTBn1BIIWMMW/6wD2e6rNuHEsVcLrPCTN3RnJnfIytERw5Z9JnegFB?=
 =?us-ascii?Q?zE+b1VezL8irFgaeeve7mUYMAPP14WQEEerU6ygZ0HKSVLxo+HfiySyGXEOZ?=
 =?us-ascii?Q?JDQ/w14VEj5kT1sI4fpZjEu3QHk5AaGd1oEwzKGABh8UiQMqaaXJK1Q4U14Q?=
 =?us-ascii?Q?bS4mvjL6GNGzPCEH1ISYVKc0NW6hhltzHuJU6Ud2VZwR8bIyc8ftCCQnSSlY?=
 =?us-ascii?Q?3IVsc9LyqV/ji7iEZetIA4w6QfJU/gdztXUpT2cl0K4FqDXaY3SI9MGBp8Qa?=
 =?us-ascii?Q?t6WablGSgAcnCDsIL0ZOk9y+o4VRbD+6u+a0B3uOEFyEbuZwNIOiMSP6U3L5?=
 =?us-ascii?Q?m48XSBPvjG5r0jG7TCS9y5AvICOZWnQ9WyiTVVEUrFi96QHe97wabw7a9KpZ?=
 =?us-ascii?Q?8RV3ilzipWwcbyy8CQUFFMhNTRdC5TXR0Ls3lc4DA9mceXfRRg=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230037)(1800799021)(82310400023)(36860700010)(376011); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2024 09:16:51.4866 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f89437a-83fc-4b18-0e33-08dc90408e10
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB55.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8436
Received-SPF: permerror client-ip=2a01:111:f403:2405::601;
 envelope-from=sai.pavan.boddu@amd.com;
 helo=NAM02-DM3-obe.outbound.protection.outlook.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.148,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: fdmIbqu8qzn6

Read boot-mode value as machine property and propagate that to
SLCR.BOOT_MODE register.

Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@amd.com>
---
 hw/arm/xilinx_zynq.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
index 7f7a3d23fbe..39f07e6dfd8 100644
--- a/hw/arm/xilinx_zynq.c
+++ b/hw/arm/xilinx_zynq.c
@@ -38,6 +38,7 @@
 #include "qom/object.h"
 #include "exec/tswap.h"
 #include "target/arm/cpu-qom.h"
+#include "qapi/visitor.h"
 
 #define TYPE_ZYNQ_MACHINE MACHINE_TYPE_NAME("xilinx-zynq-a9")
 OBJECT_DECLARE_SIMPLE_TYPE(ZynqMachineState, ZYNQ_MACHINE)
@@ -90,6 +91,7 @@ struct ZynqMachineState {
     MachineState parent;
     Clock *ps_clk;
     ARMCPU *cpu[ZYNQ_MAX_CPUS];
+    uint8_t boot_mode;
 };
 
 static void zynq_write_board_setup(ARMCPU *cpu,
@@ -176,6 +178,27 @@ static inline int zynq_init_spi_flashes(uint32_t base_addr, qemu_irq irq,
     return unit;
 }
 
+static void zynq_set_boot_mode(Object *obj, const char *str,
+                                               Error **errp)
+{
+    ZynqMachineState *m = ZYNQ_MACHINE(obj);
+    uint8_t mode = 0;
+
+    if (!strcasecmp(str, "QSPI")) {
+        mode = 1;
+    } else if (!strcasecmp(str, "SD")) {
+        mode = 5;
+    } else if (!strcasecmp(str, "NOR")) {
+        mode = 2;
+    } else if (!strcasecmp(str, "JTAG")) {
+        mode = 0;
+    } else {
+        error_setg(errp, "%s bootmode is not supported", str);
+        return;
+    }
+    m->boot_mode = mode;
+}
+
 static void zynq_init(MachineState *machine)
 {
     ZynqMachineState *zynq_machine = ZYNQ_MACHINE(machine);
@@ -241,6 +264,7 @@ static void zynq_init(MachineState *machine)
     /* Create slcr, keep a pointer to connect clocks */
     slcr = qdev_new("xilinx-zynq_slcr");
     qdev_connect_clock_in(slcr, "ps_clk", zynq_machine->ps_clk);
+    qdev_prop_set_uint8(slcr, "boot-mode", zynq_machine->boot_mode);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(slcr), &error_fatal);
     sysbus_mmio_map(SYS_BUS_DEVICE(slcr), 0, 0xF8000000);
 
@@ -372,6 +396,7 @@ static void zynq_machine_class_init(ObjectClass *oc, void *data)
         NULL
     };
     MachineClass *mc = MACHINE_CLASS(oc);
+    ObjectProperty *prop;
     mc->desc = "Xilinx Zynq Platform Baseboard for Cortex-A9";
     mc->init = zynq_init;
     mc->max_cpus = ZYNQ_MAX_CPUS;
@@ -379,6 +404,12 @@ static void zynq_machine_class_init(ObjectClass *oc, void *data)
     mc->ignore_memory_transaction_failures = true;
     mc->valid_cpu_types = valid_cpu_types;
     mc->default_ram_id = "zynq.ext_ram";
+    prop = object_class_property_add_str(oc, "boot-mode", NULL,
+                              zynq_set_boot_mode);
+    object_class_property_set_description(oc, "boot-mode",
+                                          "Supported boot modes:"
+                                          " JTAG QSPI SD NOR");
+    object_property_set_default_str(prop, "QSPI");
 }
 
 static const TypeInfo zynq_machine_type = {
-- 
2.34.1

