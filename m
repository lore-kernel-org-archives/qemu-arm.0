Received: by 2002:a17:907:60c:b0:a6f:8e2c:4d9d with SMTP id wp12csp1116886ejb;
        Tue, 18 Jun 2024 17:18:11 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCXyiIccFpSRv+JE/8Z4mOOWW7q8eqSU4QyrMAD2Dxoq4WgqDtfzmI2daPlM3hstUIRmKgLEMA06Iy8l/4KB62pvpHw0EY/R
X-Google-Smtp-Source: AGHT+IHWsO/8EtQZwqwjmvU4lRXhr1pqjg7BlIUYNaOYpkqa/CROKglQwnQ/swa941aP7M1xYTjy
X-Received: by 2002:a05:6214:8c:b0:6b0:7fa6:c004 with SMTP id 6a1803df08f44-6b501ec3ab8mr14264346d6.59.1718756291000;
        Tue, 18 Jun 2024 17:18:11 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1718756290; cv=pass;
        d=google.com; s=arc-20160816;
        b=A4lZbaSkVFrUEbBx8+VVmtAEmbt8li/TZ0ELE+gNbuE3JZgWYk8TFCtTEE1h0o1TVe
         4J4UPDHunk44gH8i3r98nCK4gDvw+jyuZ6GkDgYMA+MWYeG0kk64fTFmPr8m1AvVKUFz
         /bCFtZaekA8MxDPR6LueRL1bXvSJa2yguAbtlDhpaEAtS+5YalTJ13RyMiV1SfcoMx0u
         17pkAgz5eM6xjBvwBcH/aeFXSYl5cQQh1ENmouwPpUVlGDGpvKh2EQoostz+FkHkQc/S
         w2+P1Jsrw2Idol8BW9vceN/jXZ3XRJ2X0D3wzs2D+zqlqzpqVMRzR5acmfCOIXj8Pw2f
         +Sbg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=nGrv90x889s+WMaq0F8KeBpjrTcRj0/oObSinvc2CG0=;
        fh=4fgkMo46VbJ+b1qVDZNQnKje8PgUCbNncRzu1US7yIY=;
        b=nz67eTZEPEv9h71Nsflmz/hDdeq0J7j1LNLhgm85hP/JtnY1XNJRjabQ8qAsWxSJ0r
         VMqfwNI+umHdB22jrZUNKdrQcjGzd9Je8GEtJKnmgKJu5DZAcYAi4346ww2LNPSVotmi
         8i8kmmYR9ERwrD6qvstiqDm8iFdeVqoc9EI+EHKngTb2nL6MXFmgky788bH+JjzHCOJ+
         zq5HLSlB/PUKePtEASyA/NJmkRIJ8+sJqLqdSiH2Gv9oWqi++4oi8fZ72uRsvyV2UM/C
         AY129G/LPZgiYXErvv8f54pg4lZJF6/utYsY5qvXRss2u1vvj8guy/AeHjyWENzIR86a
         CbGQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@Nvidia.com header.s=selector2 header.b=jgJzF+C6;
       arc=pass (i=1 spf=pass spfdomain=nvidia.com dmarc=pass fromdomain=nvidia.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=nvidia.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b2a5afd67fsi132554056d6.209.2024.06.18.17.18.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Jun 2024 17:18:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@Nvidia.com header.s=selector2 header.b=jgJzF+C6;
       arc=pass (i=1 spf=pass spfdomain=nvidia.com dmarc=pass fromdomain=nvidia.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=nvidia.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sJj18-0001UK-2K; Tue, 18 Jun 2024 20:17:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nicolinc@nvidia.com>)
 id 1sJj13-0001TQ-W7; Tue, 18 Jun 2024 20:17:34 -0400
Received: from mail-bn1nam02on20602.outbound.protection.outlook.com
 ([2a01:111:f403:2407::602]
 helo=NAM02-BN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nicolinc@nvidia.com>)
 id 1sJj10-0007Zt-3W; Tue, 18 Jun 2024 20:17:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eWVAcBM2oqWuKgcp1dswI/BFE0jAmCNJN1V1aW9ju1Xbi+4RSDfax+Y0AQJ5QpP3A8WpX+/rHTYn+nD3tL0/kf0Bhg2pTdTuOqgWO0ZtRitGz1t1zb4wzmAWlfxLBFACYtz7wJIJqxyVy/aGJuASrK/tSsscSZcBaxrL5+BsoxPYSlhKLBqBZYKCYAFFY1VTQ+mm1zC0vxN1SPXpo9w1WRIxh/xTuqsgsgkXFmN69QDtC2YYjhwdZCzWRGVbKIFTQ000e28xYKol4vwLdLVvVODHdiOzJ2beKqI7GPdWc30pGnhtzpxP0cUfZ+LinBuUnNhz9o61Og1HM6Yn4OTECQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nGrv90x889s+WMaq0F8KeBpjrTcRj0/oObSinvc2CG0=;
 b=YgB+4SR+lB64qFh/3biDYsbDzcclgo+4z6X4kMLiPwlkN4DxyEhdqtn4LOFwOxT57VCL2W2oDQ0ZGSxG8Qe8MD4AEWFiCCQz23tqSv/mKQx1/btVn++cGIrYEcY8OmPe8WAKBWq7e+3ltyLMUeGRDeO/Pr3M6U0XYYLdLnQLIACCfWC2ynZYCaSqFvucQfJOACM9Y2QoUWz6G/KPLG9ht5MoORhRlMSjsraoNQBp04MK/Mbds4Cz51O0SaCToKovG/l2CfkIDVS7wpI3+XbKNUuGob6m3xqMct6mYvzdq0kunz4h/qyJNP10YY9736yrRyfqtaJDgcBsReazMEmYrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=linaro.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nGrv90x889s+WMaq0F8KeBpjrTcRj0/oObSinvc2CG0=;
 b=jgJzF+C6pSFp0yGrpI0Ks6+GgQsTUnI+5HxC7Bw/Qgt5l1yI+zY8y4ZlMqTC7OLoPpMxHGxc2Cg5Mb/0HIJse6Ot69uh6SUNSXSb43pF5xEuhI3C3UKRG7Op/IZMaBXbfDZV/7Ab07f9t/XTze7Dv7qB4U1HgEk23O+LKGSZqhUgeOW0WhIj6+fmQlTtEOlVWSkcvfS2Nda+hiurHlrMsHuleX1Wtk8fc4SaGLR1k11YC7+YA2bsWt8E0Fqt63aoebdzoVqTvMfC+ylJJTCYwSClox30LjD9DgWBdMGjUfMHHHXZO19L1UapOvRlWZhByT3N5PWnM5k0SLKGuJzgdQ==
Received: from BL1PR13CA0238.namprd13.prod.outlook.com (2603:10b6:208:2bf::33)
 by MN2PR12MB4318.namprd12.prod.outlook.com (2603:10b6:208:1d8::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Wed, 19 Jun
 2024 00:17:25 +0000
Received: from BL02EPF0001A105.namprd05.prod.outlook.com
 (2603:10b6:208:2bf:cafe::5d) by BL1PR13CA0238.outlook.office365.com
 (2603:10b6:208:2bf::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.22 via Frontend
 Transport; Wed, 19 Jun 2024 00:17:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BL02EPF0001A105.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.15 via Frontend Transport; Wed, 19 Jun 2024 00:17:25 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 18 Jun
 2024 17:17:11 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 18 Jun 2024 17:17:11 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Tue, 18 Jun 2024 17:17:11 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <peter.maydell@linaro.org>, <mst@redhat.com>, <imammedo@redhat.com>,
 <anisinha@redhat.com>, <shannon.zhaosl@gmail.com>
CC: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PATCH] hw/arm/virt-acpi-build: Drop local iort_node_offset
Date: Tue, 18 Jun 2024 17:17:08 -0700
Message-ID: <20240619001708.926511-1-nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A105:EE_|MN2PR12MB4318:EE_
X-MS-Office365-Filtering-Correlation-Id: edd132f1-1367-4f0a-b242-08dc8ff5324d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230037|376011|36860700010|82310400023|1800799021; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3d4lU9VXutVnryO1Gla6hN21uXxUY+86tn+dmWRgjZlEhKxvhkYSKzpG4mas?=
 =?us-ascii?Q?F6mLigKKdaBEgxasWoTo+/AqfhCYzOmrQOQsq/p9Pc0/+pFDDvg7Lo7p0lgD?=
 =?us-ascii?Q?GcSnOYuCBZTHhAUPEkWLdmVe/RKjU79kBm+QbrMdt14pQPFycBaHMqg3MKlM?=
 =?us-ascii?Q?sLUi90d4kKE8xARKYP+yBhncDJMWSaXvQXeUFlZTBc2gKJ8OBXP1JlgYEECj?=
 =?us-ascii?Q?uT82O0riyuwkE1KMFM2CViS+lPHlICW94BckG6ikbPT9wboVwpLBF2Q7DhRA?=
 =?us-ascii?Q?o8qIGaKdk9KZDL7kJyPBj90VYoMRI/eq52D/lm03s0UX/vbrWdzoZdVG4zHy?=
 =?us-ascii?Q?SkwAuwNQvDNoEpG4NQP8lJGzcZx5uNE1p5HUf3u/V4gkDADIdfXK97RlR/US?=
 =?us-ascii?Q?MABOaBL3sseiE8JzOiMtrHHqadFB2ZWkteRGh7OXKj+gqTXU0pvsztj4TqCY?=
 =?us-ascii?Q?p5XykXM5Emlq7TtnVHmL1ZEe3ZOVOuWwqZ0cwacyedxeEZ1oRZmRE4uSaBB0?=
 =?us-ascii?Q?50IWvmgbrIVAa9mDiBXltGXEwWH/r0GgytRt/enjFHrOVhLbTLsZ+1wtKB7c?=
 =?us-ascii?Q?sABd2kDPodGDDoUFbTob8ICZ/3esPQEzM0cSaItz4Y23y58Zs8KAyEZPbA46?=
 =?us-ascii?Q?4NbfdRuOMlL9KNZ8NdSDJ7Feg9y+5TsGfYxgOtg4DM/hux2KVNWfrmxbJDm4?=
 =?us-ascii?Q?cAMcdIe9aGWBlU5SxSjd1YD5+z03qLX17ta4nVk7TtPn4EoxHftsDIJo62AD?=
 =?us-ascii?Q?Tf4fq3CmlRvpSAL9lAqLyHG6bxgzXmE71LaIJsUGuWREgY06IwwgeQdhPBzG?=
 =?us-ascii?Q?fCOCZU7W1LIag/ORd0mY3f8I+AtzwmyHL4FdN0XVyFv7IixbE6vD2KBdEi9x?=
 =?us-ascii?Q?2YFh8toV0ukIfO38YRIrNDFXjfkjbIOHvVgm1qsv8F5nZ3G94VoZQHS4WYi1?=
 =?us-ascii?Q?YQAiujgjEM+s4prFv0ZwldqdqGZTrdLoQnkbuwMqKf0QINS8MhzqVCQ1zzpt?=
 =?us-ascii?Q?cEvvwwWfv+Qqrh60AmqY0Qy4JU0D7SV5Ydd1IVv3gHxzLybRCTjx0L1fW4PO?=
 =?us-ascii?Q?+LefXd+lU6samSHYRraiISYYrASazPYPSBKX/BRqCKyAKfvueBhi3gWCtN+j?=
 =?us-ascii?Q?z/w1TTLKK5/Sz7nDwbt/Bq9aWVDToTITEaUWlrCNDHliakD6tyyv0gda9gcr?=
 =?us-ascii?Q?u9RuYrGSnNgBoEC/AZVIP/cP/OMch1IVOajIeVDaXT6/KBjvODJtL6zE7lBy?=
 =?us-ascii?Q?s9Fc8YMfuV3Efs5mWidV7VUn8X0WlFUpcrOyCHD4btX/szn7xA07d9+C+iV+?=
 =?us-ascii?Q?ohUFil1vUMbqia4Rrz12WTzfmDB4zbVh/b5+hTSxvfy6INbXHUOHtcdgBY0x?=
 =?us-ascii?Q?/UrnkRtyx/0528GVXF4DJAS1OYlYOgsKj7UBKFa4+Ztc5Q7rHg=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.232; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge1.nvidia.com; CAT:NONE;
 SFS:(13230037)(376011)(36860700010)(82310400023)(1800799021); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2024 00:17:25.1604 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: edd132f1-1367-4f0a-b242-08dc8ff5324d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.232];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A105.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4318
Received-SPF: softfail client-ip=2a01:111:f403:2407::602;
 envelope-from=nicolinc@nvidia.com;
 helo=NAM02-BN1-obe.outbound.protection.outlook.com
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
X-TUID: xTDk1fC3zKHO

Both the other two callers of build_iort_id_mapping() just directly pass
in the IORT_NODE_OFFSET macro. Keeping a "const uint32_t" local variable
storing the same value doesn't have any gain.

Simplify this by replacing the only place using this local variable with
the macro directly.

Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 hw/arm/virt-acpi-build.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index ee6f56b410..05af407bbd 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -277,7 +277,6 @@ static void
 build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 {
     int i, nb_nodes, rc_mapping_count;
-    const uint32_t iort_node_offset = IORT_NODE_OFFSET;
     size_t node_size, smmu_offset = 0;
     AcpiIortIdMapping *idmap;
     uint32_t id = 0;
@@ -423,7 +422,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
             range = &g_array_index(its_idmaps, AcpiIortIdMapping, i);
             /* output IORT node is the ITS group node (the first node) */
             build_iort_id_mapping(table_data, range->input_base,
-                                  range->id_count, iort_node_offset);
+                                  range->id_count, IORT_NODE_OFFSET);
         }
     } else {
         /* output IORT node is the ITS group node (the first node) */
-- 
2.43.0

