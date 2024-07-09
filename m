Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp3417333njb;
        Tue, 9 Jul 2024 10:00:21 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCVut2ZpSeUi5JK1qz1PlyiAYPMGwCJBD7w0kgMoWi658EuzlDLMKCy6AS1g1Ug3Nd5elzIm3wrZEfLkKa2bHbRGTPOUepAw
X-Google-Smtp-Source: AGHT+IEbt7RHyhFuJzHUf9RYWREKrZmSS+nBqSf0fbidtQcYWUI1PYu6NmaztHCCipx+s7MMJ8yr
X-Received: by 2002:a05:6122:1d86:b0:4f3:1c16:7ed7 with SMTP id 71dfb90a1353d-4f33f3e384amr3668042e0c.15.1720544421486;
        Tue, 09 Jul 2024 10:00:21 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1720544421; cv=pass;
        d=google.com; s=arc-20160816;
        b=JSfTfe3ZQF9kvLL1d57wsU3CoH3On0XvhxAoHeClQoixGoHkae2c4iBywrJ7OXnZv2
         Xg/fu+kmxpLo3I/Yl6CFp411+qHmG1Io76wwi67WxhBY2IJ2/OOLA4P7xRaP/QOp4FVr
         cYSvFbevJ1qH4RGfvSIhcAvKQWqGcIE2VMshUqpT9wmeYKA3GYWlqTuRkY0PQ8U+p0dg
         +I8dUe8QcTpgIvv9ANn7M9IyI4rz0LkPyDNTincw6jpeFUk+kfb0MqpqDFafADZsCC6u
         DXG/eD14jWr9LhCOxNg65YLTFV6OcT6mA/GY6GrpcSoXcUPQSMtU+c/zPyD2JlRWV1Y9
         Govg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=rYJCuuGLoYgVHB8qF1wbG9I7ORD/rcj3789g9lZA2rc=;
        fh=3xWE0IW7veEhpolgwzKxf19ygXkIgh+JlYIMj8YAYmc=;
        b=vxy5q1t7EIEZjbhfkJB2ViZIsTcVrdDpQ/36FE3BfCHJRiGnle4+7jJNo9K1kW3bFy
         6SdJv15qVO1ij5ekKvgo1TN7CxWRjuQQipqzJRF0++5FgH7lGSiFXukg6IXQ7weP3rus
         E99Gki+xEscEMSxU6B7bkILQb5TtEgkaufm8Bpjkhcz/DofQuTiqqnwysPctxPtUuP3D
         xG+w7VqC59nbVy/w4Fa/zQVDd3HLU8c5VOCAzuB+MZrJ6vkpTs5cCMe8jJHiBPOkFhaW
         ZLZHy0kWVgmrOCU4z5iSNt+iunt1YrhXnWPO2XGrhjaDg+jY3k52ofFChU4wmWvV6oBX
         oRkw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@Nvidia.com header.s=selector2 header.b=uYa9tGit;
       arc=pass (i=1 spf=pass spfdomain=nvidia.com dmarc=pass fromdomain=nvidia.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=nvidia.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-4f33dad62e2si383703e0c.131.2024.07.09.10.00.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jul 2024 10:00:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@Nvidia.com header.s=selector2 header.b=uYa9tGit;
       arc=pass (i=1 spf=pass spfdomain=nvidia.com dmarc=pass fromdomain=nvidia.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=nvidia.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sREC9-0002ca-4G; Tue, 09 Jul 2024 13:00:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nicolinc@nvidia.com>)
 id 1sREC3-0002Xx-3l; Tue, 09 Jul 2024 12:59:56 -0400
Received: from mail-co1nam11on20600.outbound.protection.outlook.com
 ([2a01:111:f403:2416::600]
 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nicolinc@nvidia.com>)
 id 1sREBx-0006tl-Nv; Tue, 09 Jul 2024 12:59:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n4Yhqd9h6GNGtjVzouu9iFO6M4ve/FgGT7DU+dyi1M9tbJK48NsUiNJhtZ62Yu8MsVgglhgtvlv4DU837zYZOFtFLgdAwTydpyf1kpf63un9iTmrojKxnzpmf639HEVHecmRy38vm37UQCMXUwRQj1VS9NVIVs+9dqtRHVOtcgPAIm/sQ3WDaK0WpOdS/ui+9SAuXXRmGTGyA7nEDDl2TMynl8Bz6929zpsxu4V4J6NhR6uyYmJPs86ULMDyRKD50xXgJODSWnksXpfcJpHZuk2284tCkLoOtzYpd+ZpkITLRno8vLizvHnLMtFw5A/rxYxNcvYGM9KLUFmkS3NLoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rYJCuuGLoYgVHB8qF1wbG9I7ORD/rcj3789g9lZA2rc=;
 b=XicW8oMQGfKWOGrkibfdezoniEOp7naPaU9FnQNxQ+KGmzq7vnuWVrmgCKq9+UCNF9ai0RO45X71NRlWIHv45IOr95dQYaal57ANGFaNsfpwZ9jQ23edvyMWMQZjH0p1pkp1vTryll3k+trVjheylK+PaSaQtA9SP9/t/lPQOcjzhDCXY/gfsFP8BNL7LhI4f3WfboqB4njMyZsFLKApVNzVp8N9WuCiHaWHJooPpep22jIAMg9sn2ZsgDCR4sk8z7Kw8O+bj5yI8gzJw11ayWS7rZ7ewMt3B9oh3M2MBvy00gzI8WEDoh0kcBSiNpG0HlPak3tQfieuahT4LYftPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rYJCuuGLoYgVHB8qF1wbG9I7ORD/rcj3789g9lZA2rc=;
 b=uYa9tGitcxc6Zr3ate+KbaDZMvHQHzCtDBy5ycu94v0Hhg8R01O+hpfQfys7h6Zy/rLTvtXrbPlQfDtNCC7fpFmzbLZkZZlWxKw+IdTW+h9M6bx9Q/Np+CZB2KzVvDdJq6vhYrL5DY/Zq/WxHvxb1Z6piMIglR9CYxeGDZu6hd3ktu3l/I/uo0OJGxpjNtjjIB7K66W/W3959coTVCEXz6VoUIKTB1wJ4ZQ2ZnVLMf1/rJPUWW4nLa9w3zcLc8+SR2nfGxiaDlMfSMsrly/s16cjbVUj3K/JDWcq05EMki+EuhBnevbat4FKIhXO5+/GNcJjqopullAyYcO5jb76ng==
Received: from BL0PR02CA0128.namprd02.prod.outlook.com (2603:10b6:208:35::33)
 by DM3PR12MB9325.namprd12.prod.outlook.com (2603:10b6:0:46::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Tue, 9 Jul
 2024 16:59:40 +0000
Received: from BL02EPF0001A0FC.namprd03.prod.outlook.com
 (2603:10b6:208:35:cafe::ec) by BL0PR02CA0128.outlook.office365.com
 (2603:10b6:208:35::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.19 via Frontend
 Transport; Tue, 9 Jul 2024 16:59:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BL02EPF0001A0FC.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7762.17 via Frontend Transport; Tue, 9 Jul 2024 16:59:39 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 9 Jul 2024
 09:59:29 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 9 Jul 2024 09:59:28 -0700
Received: from Asurada-Nvidia (10.127.8.14) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4 via Frontend
 Transport; Tue, 9 Jul 2024 09:59:28 -0700
Date: Tue, 9 Jul 2024 09:59:26 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Eric Auger <eric.auger@redhat.com>
CC: <peter.maydell@linaro.org>, <shannon.zhaosl@gmail.com>, <mst@redhat.com>, 
 <imammedo@redhat.com>, <anisinha@redhat.com>, <peterx@redhat.com>,
 <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>, <jgg@nvidia.com>,
 <shameerali.kolothum.thodi@huawei.com>, <jasowang@redhat.com>
Subject: Re: [PATCH RFCv1 02/10] hw/arm/virt: Add iommufd link to virt-machine
Message-ID: <Zo1sblmS9+xlWObT@Asurada-Nvidia>
References: <cover.1719361174.git.nicolinc@nvidia.com>
 <df22fcd43e201fea97da8862b61614a2986ffa5e.1719361174.git.nicolinc@nvidia.com>
 <efec2974-ce96-4cb1-a00c-30fe93c5fa7b@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <efec2974-ce96-4cb1-a00c-30fe93c5fa7b@redhat.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FC:EE_|DM3PR12MB9325:EE_
X-MS-Office365-Filtering-Correlation-Id: 1348fbef-5568-4f40-7b7c-08dca038859a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|7416014|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YotztFUDCx1hJ6Q7q2WbRUOe3J520W9fDnr8zAaK7iRpWKDygD4zU/jgEIUt?=
 =?us-ascii?Q?QqJ9uzU1CBrjpOXPMqzj5s9r1v599e+0b0d6/kAuAl01rjU0Ba/69Cd9upRT?=
 =?us-ascii?Q?dtNqwuXaJQIxVeov7+HKqQ0SdOqAolr3+VAb2jS8xuPfcp3vepr3dpFX54gE?=
 =?us-ascii?Q?inlIJ4VQdPFk185ry4/bxCnndrdqbP6gwZB5mI0RAnZrmF68Aj0kDQB4M8ff?=
 =?us-ascii?Q?/FK2cBi9qHcgkMNdIwl5Vzthi7g8+u1VBg49WCAWdjr3XixQ/4ipxD1Pwnbi?=
 =?us-ascii?Q?GiJC6C3454SKspNS2IjnJm/yWBJVoVMNNy71R0i+/zBTvYS05HJQsSHk+UGt?=
 =?us-ascii?Q?7JE6B8gM3RBiomTKCMmAsPIdhY1LrYfYVmf9hWZ9lmytgXkeCPD56l5Ge7Rs?=
 =?us-ascii?Q?7MwUDZDcmrcvpuymKt52iRMWMcGvRFl8EmmzPq0xpncVhFbo4aAXK96Eb+Jj?=
 =?us-ascii?Q?bphj0D/RhRqWfMVf7sXhrYP0PMwcqLdPyI+wxLLNmmbsunhtfarMOqwe4NZs?=
 =?us-ascii?Q?nEJ+Dlsfm74Q7xma228hCJWa3B8bO4ygtxswkoGelTnspe62IYX5xbxsnmk6?=
 =?us-ascii?Q?cpAGzSJQMGiTg7oLoec6XGHuhoQdflWhp0FwSLop1/bLWpjeSxH7kI/cVIa3?=
 =?us-ascii?Q?AzeJ+kiIcLTWF8iXboVX/EsCer5xdPXwmGZV05Dw3mLZxo16z4hNKIuTlryc?=
 =?us-ascii?Q?9zllCWgZkP2KL0k+gl7CyURqxUCfgohRfDwhByANB0b4FUhKka4gPg7LfTRd?=
 =?us-ascii?Q?XOQvp8xVyOKFUDKC5YPQkUZEveEZCP/E/FN8xjK0tJ8dwfn8Uxcy0a5xxZ+E?=
 =?us-ascii?Q?p3T/HnU3JDM9W0XGdaSe4zEwWoYPpevmuWJlByCt52GeEWWiB30dqw69XeDE?=
 =?us-ascii?Q?mU8lkBbgUpuksYgXvUr4MhXmDVHxhh957T//k+rGyBZqTI2TyNwV8eK8krIB?=
 =?us-ascii?Q?r8jDKSbno8KvV3tnFzym8IHzWMT0nDXlQW+NbJaiqvwWgzh4kCFL8vq3vQDx?=
 =?us-ascii?Q?w5gTr8c+psxWMdx5wmNwHngxixNlJE1Z/4VW/ktYztNgkrGlBZTLfsWFylxD?=
 =?us-ascii?Q?+I22Y1A1wULc/SNtI3wb9vsk9JI6yPI15Ga0qOoFbb+dRKfr5w4ejM6CRoyM?=
 =?us-ascii?Q?t7T/K+vM214GJiyLGSQi2x+2RPLtuj0iPdK5Eq46QuYIf6xRIddyVyYtg+pE?=
 =?us-ascii?Q?WlzLMKhKnercDu/PGguWvDY9+k4iVo+9xOzuQDPhOisQXXAefab3ZhM484ls?=
 =?us-ascii?Q?rSPaxMnIG2AEu69Q0z6O3yoZpla7U3zkGonirCBj5U6V1Tbanjfl/cwMyONW?=
 =?us-ascii?Q?ftHcE4EhfegHb6Lg3CQZnR44D5MSirLKw7p3PdspXnxLLL9ypy0NERz5RgUK?=
 =?us-ascii?Q?K18pnfoQsPmhYPfyGINI40uqDFOmj6XjkkuLVjO5WyAqPEw3C1ROH1UvVAnL?=
 =?us-ascii?Q?fjCWVXKwbRxWll4HWn7Shp71ZLz2jIw6?=
X-Forefront-Antispam-Report: CIP:216.228.118.232; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(7416014)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 16:59:39.8155 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1348fbef-5568-4f40-7b7c-08dca038859a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.232];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A0FC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9325
Received-SPF: softfail client-ip=2a01:111:f403:2416::600;
 envelope-from=nicolinc@nvidia.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.144,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: tklQxCdxu+5X

Hi Eric,

Thanks for the comments!

On Tue, Jul 09, 2024 at 11:11:56AM +0200, Eric Auger wrote:
> On 6/26/24 02:28, Nicolin Chen wrote:
> > A nested SMMU must use iommufd ioctls to communicate with the host-level
> > SMMU instance for 2-stage translation support. Add an iommufd link to the
> > ARM virt-machine, allowing QEMU command to pass in an iommufd object.

> If I am not wrong vfio devices are allowed to use different iommufd's
> (although there is no real benefice). So this command line wouldn't
> match with that option.

I think Jason's remarks highlighted that FD should be one per VM:
https://lore.kernel.org/qemu-devel/20240503141024.GE3341011@nvidia.com/

> Also while reading the commit msg it is not clear with the iommufd is
> needed in the machine whereas the vfio iommufd BE generally calls those
> ioctls.

I think I forgot to revisit it. Both intel_iommu and smmu-common
used to call iommufd_backend_connect() for counting, so there was
a need to pass in the same iommufd handler to the viommu driver.
For SMMU, since it is created in the virt code, we had to pass in
with this patch.

That being said, it looks like intel_iommu had removed that. So,
likely we don't need an extra user counting for SMMU too.

Thank you
Nicolin
