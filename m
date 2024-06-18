Received: by 2002:a17:907:60c:b0:a6f:8e2c:4d9d with SMTP id wp12csp1049689ejb;
        Tue, 18 Jun 2024 14:12:14 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCWMVdB/K7/mUrvk3vX7n6KIBz8N74Dgl+vbo/Lf8Yt9s7TC1CiPW+GrV/7ROzyb2/ggvnYPQk83sC9dYv6nZecU7cwQiftL
X-Google-Smtp-Source: AGHT+IF6QnySPWVzSmwvwCOEUiXOQ59Vh7x3N1Obamrz9dSZ4zn7br7DilVrpABAS0ffaafk/z1B
X-Received: by 2002:a0c:f286:0:b0:6b0:71c8:6baf with SMTP id 6a1803df08f44-6b501e06124mr9699036d6.12.1718745134503;
        Tue, 18 Jun 2024 14:12:14 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1718745134; cv=pass;
        d=google.com; s=arc-20160816;
        b=WVV81aNSl3rYINS/kEV8R2GL9nXCk03CovZJn3yd50c7YY26+57WfO9OypBvpFvJSf
         diraC7O+uWmeudfExzNOH89uZEIw/AI+a35W7cIGCV3m5zkg+ghlSx6AGgyQHGifnIs8
         4N7q0XoMe0ISjiD4Fd3PDb92Berec+X0tptIo3NFB5iknRwe9nQj3vRJ0RYZg8gugmA9
         5E12MssYwymDcJZAeizZVDLm9OPHosUySTzdCSO68sSrdKvKYQ0sWdnxeC1zEhl6lZcc
         vIzph0UJdifqmQ+0OpJwHy9EWJByQzOmpxHzBvdwkBAUAT/Alhax0fP4WnCptAldD5Ho
         mS+g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=Ywjd6T21QFOKkATL9nwNrz5YgBLy6uQzEusVFHkhC6E=;
        fh=/+RhblMqGAr8VthwRGofo6+1xN7hLOhHGH4a7cuHLjA=;
        b=OGuFyb0owb7INsu48nG2rVil3zR7PcMshR+Q1YssRVz2u9rhnXndOH6MllY0P7dtWK
         QLaiAPFlfnTk4ayInu+lFvewGAT2CZM0Du0c88MoUfhCYiPrLbdOsX0rY5Dygur+8H/O
         ZcdrIgwgrAzvkreyBsMm2ada1oI6QQP1scesFNsRJGT9MbJlYwnRgDuGS9jJrFZfEkDu
         7RFk0ukp2a6drEMbFgn9rvvkE3Y9avzCg+T1p/psZE3fwbc3wNyn7SO3NQfQChWDFFfR
         vtwQ5lI07D3xGkg1nnicGWn5JL+6GF9PoBXZvH5qVE5loKixFhOdWNi3znw+1PgTxybT
         KYIA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@Nvidia.com header.s=selector2 header.b=bDrOOwW4;
       arc=pass (i=1 spf=pass spfdomain=nvidia.com dmarc=pass fromdomain=nvidia.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=nvidia.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b2a70fabe6si128345886d6.372.2024.06.18.14.12.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Jun 2024 14:12:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@Nvidia.com header.s=selector2 header.b=bDrOOwW4;
       arc=pass (i=1 spf=pass spfdomain=nvidia.com dmarc=pass fromdomain=nvidia.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=nvidia.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sJg7U-0008Vp-7c; Tue, 18 Jun 2024 17:12:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nicolinc@nvidia.com>)
 id 1sJg7Q-0008VQ-AC; Tue, 18 Jun 2024 17:11:56 -0400
Received: from mail-bn8nam11on2060c.outbound.protection.outlook.com
 ([2a01:111:f403:2414::60c]
 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nicolinc@nvidia.com>)
 id 1sJg7N-0001ug-MY; Tue, 18 Jun 2024 17:11:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NQu4aJb9cCygEkwWkhhX+bwpPOTbpm1KvH5tZAoVVVzenv3Q/LialtYAprJu+PrY3aqDH4xYDfQf+xVtXaZbytEsih7NtLR1MibXPBYeeSiBxas5ZVDwkgkC8onLG1peDnMWKWVD8xek0xriaJKqYlxEQQ/882ViTICYa4cDKBBXrG+MdCIF9R5LHmwTWWlCX7YDCbKshS1cQGtfFFBhIvZFqWIeLIzwx10SUml10W0B0FkKtXLihsIl2MEjoW2VhGRDgJidQbHNpEmhiLoDoA0iXo2JIFoTlk/j0MHFxmJAYc1+nOFlW0PtDBA16X1hAT5z1ScFRm44DBDc/ZO3MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ywjd6T21QFOKkATL9nwNrz5YgBLy6uQzEusVFHkhC6E=;
 b=QTqndtmM+felwMKaHWbqAdhUqRPzdlOipgwgFxPWovDTDx0oRL+m6OUBph+fQmvKxm5N6mM77tieA6aMeE4q/rXdPlNRnrJhIylsAPb1deX+S3sGSC47JXZN78aDOy1q/Byxck8cwI/5U9pvgljQFt3gJ8uBvzwcfxTeKngTJAM28A62TowIK2s9iTVR/Oc3zlvHY+R0LTMnXltgUbl11iqaN5BhS41wjBq35Fg4e43XZr8+nNWX+MIqbRK35mbIsV8cjKmsLUaczoXWt99AVz3gyXhj+J2AmyBnb9XO0KgWhfb/mQcFQe8R5tLzcnL4rEPqq2qtbeT8h3DcHpo/vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=linaro.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ywjd6T21QFOKkATL9nwNrz5YgBLy6uQzEusVFHkhC6E=;
 b=bDrOOwW4H8Pq34wm6ZqQo1S5uJjDZyD5McS1Tto3rnsU3bh8LWsxq/Q3TQCAqTLIuAgqbVdRhuR7Kd2ZwiCO0cPzJz3Xlva+Kkmmw8f+bEudRO60zwZRzUSmSR1q/ElF/xA5liKVp5m6jb8CV7Ti9/Pg0RQFQKUSsoZ3PrBGYUDzO+OlO42B81nw2BdR9vyviMDD+Ved0gCejm0K5uYRt9qr12Cm4NiTt16ed9f02+wT2J1HUs7O9ttKPAelCml1JQVxrsi7tSJ2yOX/7mnFGj7NFmbOBxCLo8+sF2FzU60QWhteYoQiSGh+lQVLRxhw+RdpPOlh4UedfzWRfJeZ2g==
Received: from DM6PR01CA0012.prod.exchangelabs.com (2603:10b6:5:296::17) by
 BL3PR12MB9049.namprd12.prod.outlook.com (2603:10b6:208:3b8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Tue, 18 Jun
 2024 21:11:44 +0000
Received: from DS2PEPF00003445.namprd04.prod.outlook.com
 (2603:10b6:5:296:cafe::5d) by DM6PR01CA0012.outlook.office365.com
 (2603:10b6:5:296::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30 via Frontend
 Transport; Tue, 18 Jun 2024 21:11:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 DS2PEPF00003445.mail.protection.outlook.com (10.167.17.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.15 via Frontend Transport; Tue, 18 Jun 2024 21:11:44 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 18 Jun
 2024 14:11:23 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 18 Jun 2024 14:11:23 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Tue, 18 Jun 2024 14:11:22 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <peter.maydell@linaro.org>, <wangxingang5@huawei.com>,
 <shannon.zhaosl@gmail.com>, <mst@redhat.com>, <imammedo@redhat.com>,
 <anisinha@redhat.com>
CC: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PATCH v3] hw/arm/virt-acpi-build: Fix id_count in
 build_iort_id_mapping
Date: Tue, 18 Jun 2024 14:11:10 -0700
Message-ID: <20240618211110.922809-1-nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003445:EE_|BL3PR12MB9049:EE_
X-MS-Office365-Filtering-Correlation-Id: 993f755f-a12e-4149-571b-08dc8fdb41cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230037|1800799021|376011|82310400023|36860700010; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kA3iuDD/bIFgT7ghXtNMwL+ab4gavtTzN6izNoLDaxqEvaHP4YFgcWVuancL?=
 =?us-ascii?Q?Ln+JpR1fPetPHElCky/eY4uyYfsIwhglmtu71sLAMQNb3qIzYS6NUMPokTUS?=
 =?us-ascii?Q?ArC4V2VdtEiwrYx9RW/dY13w1kXJa2liFe0Muovs9U18NDcFY3MqWO43CdvL?=
 =?us-ascii?Q?KKyx1my8UAfkz2n48FhnlX34/BWK7e1pWSbo57Jd9NZ6lE0iVFE/bjn4gnRy?=
 =?us-ascii?Q?HwRJ99WgRvzIL6M1O2HlwYWrqcpbSsMzOJxBieT6/BK8mHPBQf7uCLCNIHo2?=
 =?us-ascii?Q?y+qJm90vt0ZAb9V/pbtOniZzsyMN5d80cnXSo29mzr82Yzq0nzBIrgZXM0HC?=
 =?us-ascii?Q?OfFuSuD7Jk9s4nWwnUTq+IZ/Mt8htZhCZbm2WLVKSjkhCpdo0ZIpydh9b17E?=
 =?us-ascii?Q?2UiB8kEdQyA8Llu7/bZv3jSnrpq6m72b2U23zwHvYpR8IZUTs1xMRsPrV7gG?=
 =?us-ascii?Q?6o6rZunMzx0DKAC8BSpAs81kgPHWHaiEVnx3z0xP0uSEhCFz+i+d/1iltz+q?=
 =?us-ascii?Q?PFVBV8pQo5Php56a06aPBsXkTQDrLlAeIP0csV8vy4/fhr13PDbb1w2tMprQ?=
 =?us-ascii?Q?f8YCoLO9ysTqsxLN+V6TEWoLjm7wyTuUw8biuVeODaxtGPfgM+uma5K9xoEB?=
 =?us-ascii?Q?73Pfzg/Kn9/eCmrBktL4OrjOEVevTPhYICvd3U+L9MRfXJVtdWqTiIq9j3Z3?=
 =?us-ascii?Q?LIxb7vPUUP+PQjBboL+P3LySKp4e6bfiLfC5pIftzx8MYnby9XsAx/FRyOvq?=
 =?us-ascii?Q?Y0SeZszqJySLKaJvrjNTg9bT6JQuzVbeDPrNj7KPblfLjT0uyKlCyRLKC4WB?=
 =?us-ascii?Q?omL8p2cRQkowcp1CzETwvo4pToBkBOahHTDjHKI3oNhSHUea2UdfRB2W3pDc?=
 =?us-ascii?Q?J4CCIIcCWLgHaqCqRDDkJXzrjSeMmIJE9AhPDw+dqRpmRDqIf5PgCFsf/Lug?=
 =?us-ascii?Q?110/6zz2aCpfrglcKS33mSS8EKDtWn7STbyR9bTtN/Q4G0W3xsB9mtkAfvBD?=
 =?us-ascii?Q?8bXeyQtUqGMnrcRlmigLz4HZJrN4hZX6F3L4vqV1p6+S/IiQYDWp+XBKF4X6?=
 =?us-ascii?Q?GGEs6O6PHZ9MuQgsFn0GBC+kEJoVYTTDc8nUduZ3ZUeWtiRI4u8u6KkGBTWm?=
 =?us-ascii?Q?0anh2AbpJQam96TRSXgAOpwIEkjr1FXecTLNN6knTF7zU3GM/9KjpZRNsxcO?=
 =?us-ascii?Q?woZxYVkOlKZwnMbMAwY6ueEYXf5Big2Cs9+80sJYit8rhKy88hYGdndA9DxF?=
 =?us-ascii?Q?mHoxF9mkKBsmuLX2Ax5Q2ogzNhrHoCJTMWNiZ2dvMUCi5J7GOjTJGiBXJmlQ?=
 =?us-ascii?Q?DemR3GiuUOhhGQaIPqN3Uqko/AUV+ZLdEee2tP9kx6b8zIET1NF+uiqQpnnk?=
 =?us-ascii?Q?R3Wwoyt71pQSYwnoFM659piyBxeqaPPMWL/4lYsujfYhkcgb/Tz90CsS9EZi?=
 =?us-ascii?Q?uxJ80ntp+0g=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.233; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge2.nvidia.com; CAT:NONE;
 SFS:(13230037)(1800799021)(376011)(82310400023)(36860700010); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2024 21:11:44.2791 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 993f755f-a12e-4149-571b-08dc8fdb41cd
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.233];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003445.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB9049
Received-SPF: softfail client-ip=2a01:111:f403:2414::60c;
 envelope-from=nicolinc@nvidia.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
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
X-TUID: M0tw0+DgIAar

It's observed that Linux kernel booting with the VM reports a "conflicting
mapping for input ID" FW_BUG.

The IORT doc defines "Number of IDs" to be "the number of IDs in the range
minus one", while virt-acpi-build.c simply stores the number of IDs in the
id_count without the "minus one". Meanwhile, some of the callers pass in a
0xFFFF following the spec. So, this is a mismatch between the function and
its callers.

Fix build_iort_id_mapping() by internally subtracting one from the pass-in
@id_count. Accordingly make sure that all existing callers pass in a value
without the "minus one", i.e. change all 0xFFFFs to 0x10000s.

Also, add a few lines of comments to highlight this change along with the
referencing document for this build_iort_id_mapping().

Fixes: 42e0f050e3a5 ("hw/arm/virt-acpi-build: Add IORT support to bypass SMMUv3")
Suggested-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
Changelog
v3:
 * Added "-1" internally in build_iort_id_mapping() instead
 * Added comments to highlight this and referencing doc
v2:
 https://lore.kernel.org/all/20240617223945.906996-1-nicolinc@nvidia.com/
 * Moved "-1" to the same line of id_count calculation
 * Added "+1" to the next_range.input_base calculation
v1:
 https://lore.kernel.org/all/20240613234802.828265-1-nicolinc@nvidia.com/

 hw/arm/virt-acpi-build.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index c3ccfef026..ee6f56b410 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -209,12 +209,20 @@ static void acpi_dsdt_add_tpm(Aml *scope, VirtMachineState *vms)
 #define ROOT_COMPLEX_ENTRY_SIZE 36
 #define IORT_NODE_OFFSET 48
 
+/*
+ * Input Output Remapping Table (IORT) -- Table 4 ID mapping format
+ * Conforms to "IO Remapping Table System Software on ARM Platforms",
+ * Document number: ARM DEN 0049E.b, Feb 2021
+ *
+ * Note that @id_count will be internally subtracted by one, following
+ * the IORT spec.
+ */
 static void build_iort_id_mapping(GArray *table_data, uint32_t input_base,
                                   uint32_t id_count, uint32_t out_ref)
 {
-    /* Table 4 ID mapping format */
     build_append_int_noprefix(table_data, input_base, 4); /* Input base */
-    build_append_int_noprefix(table_data, id_count, 4); /* Number of IDs */
+    /* Number of IDs - The number of IDs in the range minus one */
+    build_append_int_noprefix(table_data, id_count - 1, 4);
     build_append_int_noprefix(table_data, input_base, 4); /* Output base */
     build_append_int_noprefix(table_data, out_ref, 4); /* Output Reference */
     /* Flags */
@@ -306,8 +314,8 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         }
 
         /* Append the last RC -> ITS ID mapping */
-        if (next_range.input_base < 0xFFFF) {
-            next_range.id_count = 0xFFFF - next_range.input_base;
+        if (next_range.input_base < 0x10000) {
+            next_range.id_count = 0x10000 - next_range.input_base;
             g_array_append_val(its_idmaps, next_range);
         }
 
@@ -366,7 +374,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         build_append_int_noprefix(table_data, 0, 4);
 
         /* output IORT node is the ITS group node (the first node) */
-        build_iort_id_mapping(table_data, 0, 0xFFFF, IORT_NODE_OFFSET);
+        build_iort_id_mapping(table_data, 0, 0x10000, IORT_NODE_OFFSET);
     }
 
     /* Table 17 Root Complex Node */
@@ -419,7 +427,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         }
     } else {
         /* output IORT node is the ITS group node (the first node) */
-        build_iort_id_mapping(table_data, 0, 0xFFFF, IORT_NODE_OFFSET);
+        build_iort_id_mapping(table_data, 0, 0x10000, IORT_NODE_OFFSET);
     }
 
     acpi_table_end(linker, &table);
-- 
2.43.0

