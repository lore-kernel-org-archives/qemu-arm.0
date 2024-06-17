Received: by 2002:a17:907:60c:b0:a6f:8e2c:4d9d with SMTP id wp12csp341790ejb;
        Mon, 17 Jun 2024 09:48:40 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCXgARsXAQQHQCbLLgdBFTNizyNRPrCZNKsl64L9M0XbSMVp1ofTSLoeIDI+HPbtpy/3YJYsIdErO/d0DxI5eD2Pk7ybl0kW
X-Google-Smtp-Source: AGHT+IEFbeeJlZC2ExhCEigloEZcgy+5MFPgEhjmEQ9h/4qfxnU1T1wCPFbJ3dfum/Ca9fqrG3iZ
X-Received: by 2002:a05:6214:5484:b0:6ae:116b:ef6a with SMTP id 6a1803df08f44-6b2afd81783mr105821056d6.60.1718642920692;
        Mon, 17 Jun 2024 09:48:40 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1718642920; cv=pass;
        d=google.com; s=arc-20160816;
        b=aQkY5l89bhVQ/nHex+D1vw5eWfeaBYbhaK8rfjfBMg9aGaWMoc3USk+bFog/yWfxze
         23GEPWXHiB+9/X+taMVtdjjhx/PH7DeniEs5p3cj7JKZ37iNb2HiH9Co5PsEwNIP4TU7
         lEkn0BuWtyBz+dhZTTe1Xze2vLsbWs7AniuXnE9lp41TTdlJjk5/tGcqdJYIj5VB8cyx
         R/fN74YEW9UL9BBOwMR+xEUVaGYwj2FDiw3WmRVsFK/dYnxgFpkgofWzcYdhNxCkc7DR
         vS3gOBw9XTL4Y99cIWwjTEfnJ4EgrqNlXjE3NFHCM99bopw40lA2CrBqyKNdfIZVGiFT
         VXDg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=jeS6IFN8PylkDH5q5x0lxMpA5EQv1fXDb2PwjCo8rzs=;
        fh=0wnVIHYO/3dz3U2XKl6qqwYe8t/fv6cArwL0ZcV+PY8=;
        b=LltYCzWLVrz9faGqDj9UhchpnIa98KTE7ad2kTOh6L88uBBf8up3sUiQLOFuimhkgV
         lSfW0Xu3JwXzwjjjBpEqb7w5Iqqj4gVzS7RlkdkxLwrGKYocNuldBHJYOwK2dHxYS2c8
         R+9maIwQn80Vqoi2FXWMzZhJaCVe/w15t1XwnU78CckhrZAvSvrnE073vcxKvQYydEUR
         XIAdpqEG/nenhkldw/ysY/oiVjUomCkoJGF9Abj46DDSO8jUx4OhSuhfowlg58KYamEC
         pVL6tfkcTEbpUKQyIrrIg9nfmpwA6XxUuUB/JaFGcF08OdO2LOtHy86PI2ViSR+rEeb2
         4QnA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@Nvidia.com header.s=selector2 header.b=HZJj+RPP;
       arc=pass (i=1 spf=pass spfdomain=nvidia.com dmarc=pass fromdomain=nvidia.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=nvidia.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b2a5b67915si72917646d6.475.2024.06.17.09.48.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Jun 2024 09:48:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@Nvidia.com header.s=selector2 header.b=HZJj+RPP;
       arc=pass (i=1 spf=pass spfdomain=nvidia.com dmarc=pass fromdomain=nvidia.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=nvidia.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sJFWw-0006FE-0z; Mon, 17 Jun 2024 12:48:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nicolinc@nvidia.com>)
 id 1sJFWu-0006Et-7q; Mon, 17 Jun 2024 12:48:28 -0400
Received: from mail-bn8nam11on20613.outbound.protection.outlook.com
 ([2a01:111:f403:2414::613]
 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nicolinc@nvidia.com>)
 id 1sJFWs-0007yH-AO; Mon, 17 Jun 2024 12:48:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hZqqlnPWSH/LnS5kejlDcDnU5krbVzixOKrlO8/KQDIHuO+H2pA88449rWMjjYR+ORBo+JauRxFsLBz0S1xGsU7dXp2yF/ynhcvTjKeBdIq2Cd6sDsQuUnLfyXs41ljSSOn/PJAvqt0YQhCnYPDPYqqp5BBPKoyu6d8O5gbK2d5KDKHpuj/7Ll86NuX3pOJ7vl946mBPdaowr0BGStn0sNDepwLW98mcaVaVmiXZxJFQZjTbeTcZ14chcmjJzTzEG5DXUA1Pgu7lXOYPYkcXZwvPQRHETsQwqNYPhLUmF80pROu1gvrBf9bp9Anrg8PS+5SwI3UilqXq5Q870O15wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jeS6IFN8PylkDH5q5x0lxMpA5EQv1fXDb2PwjCo8rzs=;
 b=jR85zl6N89bq0RbGgjLEaS+YTwsnLKcnzI2X8WcezwKsbTK5pqZxp61aKJtTK/W9O2960LDNEFF0kT+jGmgmumPYG3JS2QC08T29TwTN1d+Z1wnSIEOQVpEF9yEKDNqUUPEPSDzo2VjdDObthpWaEfMteDQUU5JojdDSM0ixY9UyDNS9JGykKRkHl0406wWrWjEpMA7YKVniM3bTTzApFrzJPSd0jXgNcJvR+xswvwUF8gyEBaZ+/LgqnEiPhNStv4wDFq62K09POo75PhhdVpaBvji4HfV3g/MNsIYEdnQOhkGQuyF/IDgJqxn38d9V1J/vu6ogyYFb2C9ZvJxF3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jeS6IFN8PylkDH5q5x0lxMpA5EQv1fXDb2PwjCo8rzs=;
 b=HZJj+RPP/SktxWE111NTiaP8JGLnspscg6pNs1+LAJYzHoJiNkrst2j5xhbvLbmYOKoizi7OfUIsNGpPU9OA+fmhhkR5yDhmlbtUwwEZyqBL63zvYvH1QlyGeTOU49m17e6hBnPxEChYOQTcVnEx3ikyufV+gyHXrZSfB5N0hJfXzr3pB5c2CuE1v8lMtBBmp9Xyh/DX9IicubrGD4W02oEtCMTZay7BbW9mjoL9n7l1A7FfDcq8wzbWMmz+T9ICQ3KDlWAs9gXTpSFtE/OXTVq49s2khU2OAHhjLsehi9Ez4JQOEckNsTSF0PJTDfd9bV+XbhOtuEaNVPKj1hx42g==
Received: from SA1P222CA0054.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:2d0::29)
 by CH2PR12MB4293.namprd12.prod.outlook.com (2603:10b6:610:7e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Mon, 17 Jun
 2024 16:48:17 +0000
Received: from SN1PEPF000397B2.namprd05.prod.outlook.com
 (2603:10b6:806:2d0:cafe::cd) by SA1P222CA0054.outlook.office365.com
 (2603:10b6:806:2d0::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30 via Frontend
 Transport; Mon, 17 Jun 2024 16:48:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SN1PEPF000397B2.mail.protection.outlook.com (10.167.248.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.15 via Frontend Transport; Mon, 17 Jun 2024 16:48:16 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 17 Jun
 2024 09:48:03 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 17 Jun
 2024 09:48:03 -0700
Received: from Asurada-Nvidia (10.127.8.13) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4 via Frontend
 Transport; Mon, 17 Jun 2024 09:48:02 -0700
Date: Mon, 17 Jun 2024 09:48:01 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: <peter.maydell@linaro.org>, <wangxingang5@huawei.com>,
 <shannon.zhaosl@gmail.com>, <imammedo@redhat.com>, <anisinha@redhat.com>,
 <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: Re: [PATCH] hw/arm/virt-acpi-build: Fix IORT id_count
Message-ID: <ZnBowWr2UVUD9x3Q@Asurada-Nvidia>
References: <20240613234802.828265-1-nicolinc@nvidia.com>
 <20240617063156-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240617063156-mutt-send-email-mst@kernel.org>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B2:EE_|CH2PR12MB4293:EE_
X-MS-Office365-Filtering-Correlation-Id: 22b9739d-8d6e-4c68-5146-08dc8eed496a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230037|82310400023|1800799021|376011|36860700010; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qzDQ7XF4HtYoIsKmgRmhUKVM6nJkX/bnSekt9dnKS8LFvpebhJgJl+QY2L5l?=
 =?us-ascii?Q?Yuzi+C6N5Fk5Hlzdn2lFLoMbe/MAREAKNRo7Bp1Mfpsaiy5yPOfl2mIACHDp?=
 =?us-ascii?Q?DtZ/kQDiLbDyvVFKamtTXHLnw6DRSPhxKzwCRpNTfdX2GzbmCCAybRNSra8h?=
 =?us-ascii?Q?LFWxBEKckVMA77BzZZ76lkbpuae1JBoVP3GWKOQ6v25sGpBiebCEMhk4fB42?=
 =?us-ascii?Q?oGg2tjdPpvAFzBZhg0HE4u1XMBXn1YTaNVnEDZ0jJ2yggiDOLYbJrix3NVq1?=
 =?us-ascii?Q?mp8NOFqqPohc8VepSCDF0Kgt+JyckkbrSy0R4Fxrg+1nXP1zOMYNGpcYPXU2?=
 =?us-ascii?Q?aFvqcJVS6dEx8ffkdF+DIeKAuejp3UsAdla3n9YbgwZBjNeUo6Q0B7PlxDDH?=
 =?us-ascii?Q?p9h/RwkDGUGO2qLJQyHQ66YEQb5y775HDNJAiQypeIYq7nP6nrtcoolOS1dt?=
 =?us-ascii?Q?yXW6NE0A+7zIpgFiXhAinixnpS8Mou8KjPDGd0WTb/13l2t8XMSx2zzWGYBq?=
 =?us-ascii?Q?S1vlCAwH0l4Si7dkrn4GhapaJZbWeAOPuAPeWKnOar05C07hlNszM1u8pRJd?=
 =?us-ascii?Q?CPsgOnGg53fq6c2vfWBSuHsXZtMAFrVi5VI2ABW86GpmjHr/B4NM2zdgkj31?=
 =?us-ascii?Q?kZSpx4jQFK7hZeqIAA9UhA+IfrsXSRojEmX/HPJ1/eRipRKaFmMglY8rtBxc?=
 =?us-ascii?Q?qNTt2kZ9bMAsU2wG6I8I5U7LGZsOZ/pK3nwFDcAnZHtsVoyLK4ca4C6mppEx?=
 =?us-ascii?Q?pyt1hGsytJalTt8VS0XkY6MjsjQPm3/kYHzrpkBgTCKo0bG+7vG81I29E7zv?=
 =?us-ascii?Q?YM+/x/xm+ybgIxSnJ4HoFwa5lE034QqFcnTMwyxnZXp+x+Aq0B3KN6lP2QWY?=
 =?us-ascii?Q?IQRX+hUA1bAqUt34zNZtdC1vAyUaX9DzsQNED0RWx3zxR/kTDcMV44GeeQzk?=
 =?us-ascii?Q?hLrMQ15ClswY/hu62lR1FbVFA+dunmVBQE5zIlGuvcG9Ng+Y20HxCQgNf9vk?=
 =?us-ascii?Q?7H8ICM5ERaNSi3Lnz0ameIrSUJOgqHgp1abU4xiCNQHPNykJx/+csCgs5I3O?=
 =?us-ascii?Q?wKv4TMA/mXERMNASu+M3xb5Klh8ryDnbF5U9LuINpTNRifTJdUuzJFKmx3VT?=
 =?us-ascii?Q?Ijq9q76k4WrpkzrPI6ZLGkqut3lXh+6oQN26nGcMn2ju8Vp3VdLZSagks8bW?=
 =?us-ascii?Q?esbRu0EOaQr6aPX2uqAxYiFdCqWWvOvUwN46tDhoddn+GNz7wSfftTW5V/If?=
 =?us-ascii?Q?/oaPMSqTAtEPdlex5kUXqjfKDkhbsPXZJQzO9HQyKIWSzC+SRlt0yfJPMHQM?=
 =?us-ascii?Q?6swFbFKTpYVkTb7L12w+Ljk8v2cPnNYfnRflzRGe4ZHqWYiecN6bub4o4LRe?=
 =?us-ascii?Q?K1LmfpaXpayit44BXEt/oQbMhkgijX8Ko1iTfGh6YdKorrv+NA=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230037)(82310400023)(1800799021)(376011)(36860700010); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 16:48:16.8303 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22b9739d-8d6e-4c68-5146-08dc8eed496a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000397B2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4293
Received-SPF: softfail client-ip=2a01:111:f403:2414::613;
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
X-TUID: vG9qw6uWAXzQ

On Mon, Jun 17, 2024 at 06:41:55AM -0400, Michael S. Tsirkin wrote:
> On Thu, Jun 13, 2024 at 04:48:02PM -0700, Nicolin Chen wrote:
> > The IORT doc defines "Number of IDs" ("id_count" in the virt-acpi-build)
> > to be "the number of IDs in the range minus one". Otherwise, Linux kernel
> > reports "conflicting mapping for input ID" FW_BUG at the overlapped ID.
> >
> > Fixes: 42e0f050e3a5 ("hw/arm/virt-acpi-build: Add IORT support to bypass SMMUv3")
> > Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> > ---
> >  hw/arm/virt-acpi-build.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> > index c3ccfef026..b9343dde0f 100644
> > --- a/hw/arm/virt-acpi-build.c
> > +++ b/hw/arm/virt-acpi-build.c
> > @@ -243,7 +243,8 @@ iort_host_bridges(Object *obj, void *opaque)
> >
> >              AcpiIortIdMapping idmap = {
> >                  .input_base = min_bus << 8,
> > -                .id_count = (max_bus - min_bus + 1) << 8,
> > +                /* id_count is the number of IDs in the range minus one */
> > +                .id_count = ((max_bus - min_bus + 1) << 8) - 1,
> >              };
> >              g_array_append_val(idmap_blob, idmap);
> >          }
> > @@ -298,7 +299,9 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> >              idmap = &g_array_index(smmu_idmaps, AcpiIortIdMapping, i);
> >
> >              if (next_range.input_base < idmap->input_base) {
> > +                /* id_count is the number of IDs in the range minus one */
> >                  next_range.id_count = idmap->input_base - next_range.input_base;
> > +                next_range.id_count -= 1;
> 
> I would just add - 1 on the previous line, instead of making it
> incorrect then correcting it.

OK. Let's do this then:
-                next_range.id_count = idmap->input_base - next_range.input_base;
+                /* id_count is the number of IDs in the range minus one */
+                next_range.id_count = idmap->input_base -
+                                      next_range.input_base - 1;

> 
> >                  g_array_append_val(its_idmaps, next_range);
> >              }
> 
> 
> But the value is used later:
> 
>             next_range.input_base = idmap->input_base + idmap->id_count;
> 
> Wouldn't that make next_range incorrect?

Ah, missed that. Thanks!

-            next_range.input_base = idmap->input_base + idmap->id_count;
+            next_range.input_base = idmap->input_base + idmap->id_count + 1;

> 
> I also note that
> 
> static void build_iort_id_mapping(GArray *table_data, uint32_t input_base,
>                                   uint32_t id_count, uint32_t out_ref)
> {
>     /* Table 4 ID mapping format */
>     build_append_int_noprefix(table_data, input_base, 4); /* Input base */
>     build_append_int_noprefix(table_data, id_count, 4); /* Number of IDs */
>     build_append_int_noprefix(table_data, input_base, 4); /* Output base */
>     build_append_int_noprefix(table_data, out_ref, 4); /* Output Reference */
>     /* Flags */
>     build_append_int_noprefix(table_data, 0 /* Single mapping (disabled) */, 4);
> }
> 
> 
> That comment
>     /* Table 4 ID mapping format */
> 
> really should be before the function and it should mention the spec
> it's from - specifically the earliest spec including the relevant table.

Well, it's an inline-like function called by build_iort() only,
where there is a function header mentioning the doc.

Should this function have to repeat?

Anyway, that would be a different patch. I'll submit a v2 first.

Thank you
Nicolin
