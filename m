Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp1647775njc;
        Sun, 15 Jun 2025 22:21:26 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCUo3HKJpRexKfAkXFt70xyqDtgJ0+5bmEV6q2eCwhjDMqXw5kwFm5abAJTZXViemQZN0wn8Z80K0WSB+w==@linaro.org
X-Google-Smtp-Source: AGHT+IEzVWj9DU2Wf2uphHDrK7YNkyxk8tgOmYHOboxX3olhh9mcE7zb4kN5qMo2vXj+wuvw52vl
X-Received: by 2002:a05:620a:f05:b0:7ca:e971:8335 with SMTP id af79cd13be357-7d3c6c043c7mr1614489385a.8.1750051286481;
        Sun, 15 Jun 2025 22:21:26 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1750051286; cv=pass;
        d=google.com; s=arc-20240605;
        b=W7cZBKF8LiC1Wf2p7PpMw5nY+pSAqUiHdHtydhQ7DHkmMHjIe4+Dn/fvDoow6S4MqK
         BaQLdbjr7MK32APtLB9hwlLNqcZ22ftm4ZbZNYkW/CSQNUsmMKNnrQfICSi1mrtdFACy
         B2uTNYd5Ww+bC9zSfXjt4ru7jHIeIMupt6XrKD5ua0IGw7CIvwF6mLTyW8CFd9N54yIt
         ao2BhZCfhH4jhjU+H2U/5WX3pEY5c/3W6a1HfvD7mZD3D56+VaNMTWzh5w1yGjMV778S
         xXcEIac13Szn0zIlhfRsU0g4dJ+WeD3aVyvA+yVcQlVw0s2IHRmd7daAiaDhRm5O7Uoo
         8iBQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=R4SmsWmylT8qYcxKIGzHnjRZKgy142Z8rZJGSa11BHc=;
        fh=1obnVUD2joL31Sc3JNHhq2/pTvgfpy8itZqkj4FleSc=;
        b=luNGoUweFrkGD2DXB672uTf+SdpxaDUqkvultjcfLR57vbcqnNikVCPgXIcgr29QP8
         rwTp+iL5BDiCh35ZUFaAiDeMZD4aFhSxhXLD2WefH/QLeVCqfQpR38WNolgUFA3lC3JL
         grgKhi6zqeYb799wHEzNHKBLEvP473Jw+eSeTwtZyaerIOV/TDIjcWPKvP3FLKEXjFTd
         hoGUfHOW0Ix6EoD2hDQ/axrBqAb/uTw0TB+XS2zbSUHtd+LE4dTzB5iKLPd2fJ5n86Oq
         514Hg37k3PchZglhkRzN/ttIe/KLpAPsti7iK+NbJljtXXf/fniE+1RWZNmf7NwZiXEp
         8+mw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@Nvidia.com header.s=selector2 header.b=ZcZKNpXJ;
       arc=pass (i=1 spf=pass spfdomain=nvidia.com dmarc=pass fromdomain=nvidia.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=nvidia.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d3b8dc328esi902589885a.56.2025.06.15.22.21.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 15 Jun 2025 22:21:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@Nvidia.com header.s=selector2 header.b=ZcZKNpXJ;
       arc=pass (i=1 spf=pass spfdomain=nvidia.com dmarc=pass fromdomain=nvidia.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=nvidia.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uR2HP-0003WA-4k; Mon, 16 Jun 2025 01:21:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nicolinc@nvidia.com>)
 id 1uR2HD-0003Tw-Qe; Mon, 16 Jun 2025 01:21:01 -0400
Received: from mail-dm6nam11on2061f.outbound.protection.outlook.com
 ([2a01:111:f403:2415::61f]
 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nicolinc@nvidia.com>)
 id 1uR2H7-0005Aa-DR; Mon, 16 Jun 2025 01:20:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w33qQaRiSNGR8zk43AJeVQ6Z/EOCEoHSxJzBpfhdjZGTVbwXbT1VdJkngKL5MJMeYmI8n5UKbVEcowTZdriTRuwknSSeaqmNSPJel4pXohrw90LxFPzi9HGIvv3C94HLSzB6xVCWrQm52GMSKspJeYBIDmQGdLAvV3mn0sbj6vrF+iiB3SuUYq4vtg9cUwhNYYsY9SGuSrcAijJoydhPz3hWy3Aby13JjT0z0eBtjeWu+iOwU6lHpH6MKg7dpROL27jWcUTq7eo5CBwDtCQ+XUgkbD3au5isN8WbcYFCO8SPAAagTsn06aT5VodZpY86+8/S8b4MYs3NFBc8Es8yfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R4SmsWmylT8qYcxKIGzHnjRZKgy142Z8rZJGSa11BHc=;
 b=iJy5S1IaAcFsnGkjGb8i/bAdveMan1dwHxfdllOH8AX89pjWAVqEsTKWHkeVnOQgbvxcWPSpvZtsXDS8PrQvZ5o9E6F6OXvuhD4ZdPUPAF+lUZa/5Cb+jzFPmUAPzsVR+4pp68wOGe/Y4xiYNIun51XZR9Zl6+EIOKULn8MhCvKRWml64ZxV4f49Kh4d/tU/SGgOegSnFRK95Vi2qU5ehQvJKskPZSCUBoKg4M9/fhMj6HFESSPS3V9QnLuOZahAZNdwRsvhgMyIA0OwS3vH6QTLjB8LRzdIydt8utVnTcueRvuFhl9/ILEzCnQ4hE3dd0vGoHECEf99loktS66P/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=huawei.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R4SmsWmylT8qYcxKIGzHnjRZKgy142Z8rZJGSa11BHc=;
 b=ZcZKNpXJb0Oh83ADEeyccWreW5ku2I1+vci1RT6io4r5svL/6QA9ounJsGw3vR2Q7INm/6E2OtBjrmBQn/b72eY9G4pDGXDv0zGrJ85HPzK5vpbvBomh7JOj07hhOOTL+NLd2wPvm2FN93YNyvD1WFqOI2oi0/lodfmFHXzNQv9rwgkZE7L4K/SeuTv0tfcZ6gEQyzY9wZRm8AcO5GfS3dnHuyGjLBYg8EtJOgQ2q+7aKJGA1LbW6G6TBkLQSjPxywIh/S+o6cKSLDighP8nzZTjK7QfYcLc3SMFIvnFpySkFsQZbdPBKMSAgn5Yizf0iQdwrEJ0Wp5w9+W3+uy/eA==
Received: from CH2PR07CA0031.namprd07.prod.outlook.com (2603:10b6:610:20::44)
 by SJ5PPF183341E5B.namprd12.prod.outlook.com
 (2603:10b6:a0f:fc02::98c) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 05:20:44 +0000
Received: from CH1PEPF0000AD78.namprd04.prod.outlook.com
 (2603:10b6:610:20:cafe::d8) by CH2PR07CA0031.outlook.office365.com
 (2603:10b6:610:20::44) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.23 via Frontend Transport; Mon,
 16 Jun 2025 05:20:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CH1PEPF0000AD78.mail.protection.outlook.com (10.167.244.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.15 via Frontend Transport; Mon, 16 Jun 2025 05:20:43 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 15 Jun
 2025 22:20:35 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 15 Jun 2025 22:20:34 -0700
Received: from nvidia.com (10.127.8.12) by mail.nvidia.com (10.126.190.180)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14 via Frontend
 Transport; Sun, 15 Jun 2025 22:20:31 -0700
Date: Sun, 15 Jun 2025 22:20:29 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
CC: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>, <eric.auger@redhat.com>,
 <peter.maydell@linaro.org>, <jgg@nvidia.com>, <ddutile@redhat.com>,
 <berrange@redhat.com>, <imammedo@redhat.com>, <nathanc@nvidia.com>,
 <mochs@nvidia.com>, <smostafa@google.com>, <linuxarm@huawei.com>,
 <wangzhou1@hisilicon.com>, <jiangkunkun@huawei.com>,
 <jonathan.cameron@huawei.com>, <zhangfei.gao@linaro.org>
Subject: Re: [PATCH v4 2/7] hw/arm/virt-acpi-build: Re-arrange SMMUv3 IORT
 build
Message-ID: <aE+pnYzGzQmc4Phs@nvidia.com>
References: <20250613144449.60156-1-shameerali.kolothum.thodi@huawei.com>
 <20250613144449.60156-3-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250613144449.60156-3-shameerali.kolothum.thodi@huawei.com>
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD78:EE_|SJ5PPF183341E5B:EE_
X-MS-Office365-Filtering-Correlation-Id: b2037d5b-82a7-4e2a-97b5-08ddac958ac6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|7416014|82310400026|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LUObipd+V/IU5MG6OiNR2IufgkWSR7MCgoPGK136hnZ2aO1iFqLVS96InHj6?=
 =?us-ascii?Q?3A7JQ4xw2cDZf3o/4J5MOvIqIeIpNt9TbsE52G0vTUrkvsOz2T1vw7b2x7ht?=
 =?us-ascii?Q?mipSs6MjHmYiYKnH3DeEKR3+gEeuX7Q4wBv4l/MmjHICHpFj10wfJHycM95h?=
 =?us-ascii?Q?tdW2oTZie2oQwpnCyLawfedirNFuoeONp96lp1n+qFngQgO7EdFMTZ956y2c?=
 =?us-ascii?Q?9vF8jqR0jy9NDoxlzzx4EFYYWi/z0xAel9A13PlMgb6bGwGh6LmhthY8lx7U?=
 =?us-ascii?Q?xO35mSJF8xZiVZmZMM0xMwBJqRzWaYdkViVGdrBHxXfk4+wxfEGmexn0b+Wv?=
 =?us-ascii?Q?iMtpAGDzZRIoQcxYWRQDjQQE/Fq4+wic3vL5YdzAcxag3qws9sNRDJsl7o3z?=
 =?us-ascii?Q?7uLRy4FKG5R4NEFaElq1VqSBIwlmd+JeTBuP7xFQ6QpOyK7k6gDAbPz0/GZo?=
 =?us-ascii?Q?+yMsLV3J2V+fDyo8ALMjNX6by+TZ/KZ5NlbBVzhj/mY9yqmUBTJabJsgKqdB?=
 =?us-ascii?Q?nynWJ9DhgS/XeiWdv1Li9EL9BCNWNiR2kfukvMN8i0Tu60ORNSKASe6BkMx8?=
 =?us-ascii?Q?Xi98N+e8rJDyocOrzChB/xFWUSQ9E1K2pSAdA7rRaGzwUUiJvAzsmNesL68q?=
 =?us-ascii?Q?xis3v7amXgYMtEJc1ya6v1SPm4x0LuOXWtIyf9QWsmLb5Ky9DVqrDg1Wr1G1?=
 =?us-ascii?Q?+HpFUJUnDjci6c/DZXzIja1Mi6gmVw7+QrFe1lb/Y6ThfCNlmmCdYbIISko0?=
 =?us-ascii?Q?0x7Upe3oQmwEH/bA0L+QgTxfMC/AqCvOuQP6Of+0xXl6HIvsKTwilQvtx+P6?=
 =?us-ascii?Q?ny9ZG1FDdyH3nTC2OD3UUe2I7eE8QoB8Pzg8lFl68QpFoU6dpw5RS2fa1hDg?=
 =?us-ascii?Q?MYkkIEvilrHx1H/TauGDI9lB13V2R+Llc5Yn/F8kB960/t8IxcUrLvqks/40?=
 =?us-ascii?Q?DlOovGaVVqqlWRN2Kksy8/WvGjXZcDKZX+kn3CA4OT+kd9ymTKUSLrHaaS9o?=
 =?us-ascii?Q?6PWIypkSKIu1mzujAdssVP+sgeKStQ4pS3XRcPqHCdMjC5lv/tqP2C0pBNCz?=
 =?us-ascii?Q?hfcdPrSPIKDeFMa/cf9L3BKRFQUtY6q/N+hANJqXx3/BHJeyI2aRsQbFb2Lj?=
 =?us-ascii?Q?4srJABVvwf1bHTBF8/WzmJ5lkKUvAIqqr5rkiYJArYjwSAFYZb69DxS/oEDv?=
 =?us-ascii?Q?Fj1lil4B19BgWb1O0d322ErviuHPzKIawjEL2T0/gUXqvOyII7yp2efoMLXH?=
 =?us-ascii?Q?i39QBfVugsPk4vGtfqXieTozOr3Rjn0+vZJTrTlWPOlqyiryD11Vc4a3UtQE?=
 =?us-ascii?Q?BYCM1N+drzyEzLrRoQ+FjLMNiGSHRqkEu1nrm3n10HxdBwZJCT4gEhMxjVWj?=
 =?us-ascii?Q?HnF2tK990LJQ0P72fJicPZh7yE3ZOWOCvJGqAEAOeF17wHeo/7+Dh9ZS9Uvx?=
 =?us-ascii?Q?iIVaC04myQkTIa0gleieaC7iJHdbi7uZt72NR5r08POXmgm37OkjOPIwFrKC?=
 =?us-ascii?Q?GCv9+EhZg9CJHFG90SYQQfyQGtNYen3xykld?=
X-Forefront-Antispam-Report: CIP:216.228.118.232; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(7416014)(82310400026)(1800799024)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 05:20:43.3621 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2037d5b-82a7-4e2a-97b5-08ddac958ac6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.232];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD78.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF183341E5B
Received-SPF: permerror client-ip=2a01:111:f403:2415::61f;
 envelope-from=nicolinc@nvidia.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 87d4L9yeRAgT

On Fri, Jun 13, 2025 at 03:44:44PM +0100, Shameer Kolothum wrote:
> Introduces a new struct AcpiIortSMMUv3Dev to hold all the information
> required for SMMUv3 IORT node and use that for populating the node.
> 
> The current machine wide SMMUv3 is named as legacy SMMUv3 as we will
> soon add support for user-creatable SMMUv3 devices. These changes will
> be useful to have common code paths when we add that support.
> 
> Tested-by: Nathan Chen <nathanc@nvidia.com>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>

Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>

> +static void
> +populate_smmuv3_legacy_dev(GArray *sdev_blob)

nit: could fit into one line?
