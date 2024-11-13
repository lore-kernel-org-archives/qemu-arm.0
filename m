Received: by 2002:a17:505:7d82:b0:1be9:327d:8ee3 with SMTP id wv2csp689907njc;
        Wed, 13 Nov 2024 13:44:06 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCXJBtNwcwQRXyyr6968BJmbHSwWF8vCZzJkQlPratoAC00DpfFC0oibQD5B83u7BpZcx/geBOH3RGh28A==@linaro.org
X-Google-Smtp-Source: AGHT+IEEReYWWKHpoeKIkvz8vStdWp4zQYqc+frrlatD0I/r5g1s3YA7/qIyl5gTuPCLG0+ToOUn
X-Received: by 2002:a05:6359:4281:b0:1c5:e36f:d3f1 with SMTP id e5c5f4694b2df-1c641f7c35amr1189583655d.24.1731534246729;
        Wed, 13 Nov 2024 13:44:06 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1731534246; cv=pass;
        d=google.com; s=arc-20240605;
        b=MVk30KmGyC8wZ1XoI5xU4hdu6kDfUjWf/g3Hl3Cwxs4AYJ266QWJzUr7RN3H2on5P4
         7JGzYh9KkrWjg9x0N4HADqbamspNFEkvau7nQYU10LlNxkRF6KNPfMElM7D6zzHtvN9d
         lQU55hbgsHMKdQse6HpLQCKwhyXk48FNYyGniMbdTNL04cIZMjCitzmNpK0+gzx78rZJ
         jboeCt+amIS0BjRZX/ecsyXcDfKXHf//rqW57AKAcgHmmFHeR8Y+/IScdbDR3zEuPDpN
         +sqZICigC3j3N17od+pW4DrfruGNsweWVN93pG4eJtbLSkCj50QJ6OHQbdK4fzoG5eJX
         Hb1w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=9uK0wILbNtUTkmcx3YyjA7XUXsebLOuuTVHhr0tlmgo=;
        fh=mFh0UseOZ7WBHkzWxjVfUZZ//aB7vuEaOSOeyTCWH4I=;
        b=P5q2qJ5IcN6+u7DLMbvOXo/aPWmiA68rjWloshhbTiFlybI0a3DyitAgrl9uybSbSk
         8EW6kzVEFBgAia5Ih/PIgiGwgiwIvhOO+NEaVuVjE5BgMFKZvqkVZqmriSIYBxNmGh+n
         nTYChD/5C2IlGK/JV2UNSKBS6L/Q2q/p/kUiYuHLcU9WgIwHdSlyG+zw9p01Nd8NsBmd
         JtkTXm3dc/aWvdoBe5yFh925gMKJhtCg9b5sv1zUANIitON4aqj8RJDqe4GlrkokGPY7
         tV+eWT/QsExpnNjafLsu97igESy2Ff+Katf6IJ2uwtNhw+0uJySBjxvAg2IfLtnzxHWd
         +udw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@Nvidia.com header.s=selector2 header.b=BZTEPOET;
       arc=pass (i=1 spf=pass spfdomain=nvidia.com dmarc=pass fromdomain=nvidia.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=nvidia.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b330883253si1642562385a.379.2024.11.13.13.44.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Nov 2024 13:44:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@Nvidia.com header.s=selector2 header.b=BZTEPOET;
       arc=pass (i=1 spf=pass spfdomain=nvidia.com dmarc=pass fromdomain=nvidia.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=nvidia.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tBL93-0002VS-Ar; Wed, 13 Nov 2024 16:43:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nicolinc@nvidia.com>)
 id 1tBL91-0002V6-1q; Wed, 13 Nov 2024 16:43:23 -0500
Received: from mail-bn8nam11on20612.outbound.protection.outlook.com
 ([2a01:111:f403:2414::612]
 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nicolinc@nvidia.com>)
 id 1tBL8y-0006xt-VF; Wed, 13 Nov 2024 16:43:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gG2wTBN52bVXvtJhQewNBhEa2MTAut6EiBMlNEMrEQZ+EnA6/R77Iaj6zQlLeE0G07bhkhO7tsYx4vWb8pVQvspGcswPVFSoC040vCWNuqdXtCG8qsckeLOFeCTxQpp7gd77T8+Dl31W2/nSiBt4PaSzLK/Y8RNe5qFzRVInx5vX7suRIw/BSYvR3HohNl1/F+OgJxzGkCDNbF4ytLhyEZ0Wg7DfjggwO6ioM/2BK3CZI5O+8o+p4jXHHayh5bEBwPWesvniu4tMAgfJz2Dpu4NljBkJaBiDH7c2AwKDVs76W8qDR5PfA1oapWQ0MVCQ60qEW8g+c9fHnqgJYzFWNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9uK0wILbNtUTkmcx3YyjA7XUXsebLOuuTVHhr0tlmgo=;
 b=ZDqPNIPZQUrUM15saooITAl2nVgNINaD3ICVNaWdAoR4DkdhzU1wVUC6YVO7Ee9fYbGMpLt6j+pcMO834Xx4q+yXlQkoLza2IkvjEBNnBMiPM6FrO/x9+K43M+j7YWiKXgFVw4iChENdQVrA7BStuVXfXyQIzVl+qV8L0xGb0iiJXcKcL6bAGKZvJ0F3k7/poeSQGT5PcQbpaWeE9A/S+Rx0kZox0ulyjHEuZKOU0PS/W6UZ868x/a0eA7828aIzUQP69b4MMO8KFL2W3r+dL/CZn1qNbEXvvpNPjJxk4FWJfOney72kNkcrolwhZ0HNuyIFbSU/rtvReutJZSfaxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=huawei.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9uK0wILbNtUTkmcx3YyjA7XUXsebLOuuTVHhr0tlmgo=;
 b=BZTEPOETLTJ4EaATJfKsyNrqD/EAsYVwp8DgP0S3pcmqz5CtwlhfCz3vcBgWK8hJ/Awqs1jvbiy0fHU74tXFEGT67XdILCs4a2t0Fg6AHxFal0w3PiZZ0gqXG7qtJ8z2HFnDopYvKlULkp5vmYC7lRM4lg07JnrysO21LLiWZE/7T/oCpok9eDBCdnQdSzLsa47fraolikXIkLakv1QkIDxA1qYp/KCXfMME0eiF4ntv7nBsWbOnhOOl1FmdV3kLDSHBZk1dzXuLrvrdsLy4qOj4rwZk4a25qz8m522n0sU4sVmr8kuPpCGgN+dmg8dk8+xyCtgiwu3wMBthsguA6Q==
Received: from DS7P222CA0003.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::19) by
 SJ2PR12MB8691.namprd12.prod.outlook.com (2603:10b6:a03:541::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Wed, 13 Nov
 2024 21:43:12 +0000
Received: from DS2PEPF00003448.namprd04.prod.outlook.com
 (2603:10b6:8:2e:cafe::52) by DS7P222CA0003.outlook.office365.com
 (2603:10b6:8:2e::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.16 via Frontend
 Transport; Wed, 13 Nov 2024 21:43:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS2PEPF00003448.mail.protection.outlook.com (10.167.17.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8158.14 via Frontend Transport; Wed, 13 Nov 2024 21:43:11 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 13 Nov
 2024 13:42:59 -0800
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 13 Nov
 2024 13:42:59 -0800
Received: from Asurada-Nvidia (10.127.8.12) by mail.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4 via Frontend
 Transport; Wed, 13 Nov 2024 13:42:58 -0800
Date: Wed, 13 Nov 2024 13:42:57 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
CC: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>, <eric.auger@redhat.com>,
 <peter.maydell@linaro.org>, <jgg@nvidia.com>, <ddutile@redhat.com>,
 <linuxarm@huawei.com>, <wangzhou1@hisilicon.com>, <jiangkunkun@huawei.com>,
 <jonathan.cameron@huawei.com>, <zhangfei.gao@linaro.org>
Subject: Re: [RFC PATCH 0/5] hw/arm/virt: Add support for user-creatable
 nested SMMUv3
Message-ID: <ZzUdYWad9HLo/w6t@Asurada-Nvidia>
References: <20241108125242.60136-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241108125242.60136-1-shameerali.kolothum.thodi@huawei.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003448:EE_|SJ2PR12MB8691:EE_
X-MS-Office365-Filtering-Correlation-Id: d3287066-baa8-4093-167a-08dd042c2c13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|36860700013|82310400026|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WOTWOKTYYrxaVIdQe2Lpvtpes4qQPEgTc1EccV7iHrot4i79WNgyKGm4kUr/?=
 =?us-ascii?Q?dF/56OHAG3/QRg20kQ38su14BfHSwVmgQMhATDPt9ji+UBk11+8MBTCwih8Z?=
 =?us-ascii?Q?r6mx3/sxZlcakXgvt+VcwqdKXkZS8s4ux5Zla0GTEXosMC/vJInjung8ZfeC?=
 =?us-ascii?Q?HQusbM674jlE47aOlvVa0yR+Xd6TFVlrz63dDN9rNaULGUGKAEVOebit+Pgj?=
 =?us-ascii?Q?uJcwckldWjPjYOeruNOK0OVwj+53N/yXqyRM7HSvwuYab+jObqxYk5kN0ORt?=
 =?us-ascii?Q?6xvgbBI4jeIYK/KiI84jrdCUD5oICiqQnQsg2pDJEkUu/Pubsmlgd4HK82WF?=
 =?us-ascii?Q?0ERuCFqOt9anSFdvkaqTHB11Uy4STVs7mL44KQhw8NWnovhqyktov3/IVVTW?=
 =?us-ascii?Q?7U6nrMCc3WegMHFWEPLhTS3Sv440PgLiA8XBYFs2S1g92EnC8D9yRlzIsNiE?=
 =?us-ascii?Q?zW/hry1QAiFjoRYwvNhLTuMjo/DMbV/qBVFDF5rEXV4Oz49Gq8Rfp14vXk92?=
 =?us-ascii?Q?p6n9zWjj1ocZbYBU5WlDsMqxaMBcQLNxJItis8MzzUBWvDj3m8C/lSN7TsNO?=
 =?us-ascii?Q?epeZzhuGOa7g6pVoUN0lRmyB5PzJS8cmuSgyOqqkcho6i1NZuLQbMQoKnGmL?=
 =?us-ascii?Q?VicVGWW2tWle6KE8WCOft57Sx6vdJmDe6KIb4oS1g2fJhT/dBDH/QTY57Lls?=
 =?us-ascii?Q?wDmSOqsB9OuOYss9hXXBeknvhV+v230RNMN16ekWL/Im4LDxl+lZhXuqJtQc?=
 =?us-ascii?Q?GO2j/x/5Q6rkrFOIOYWthh/ZOsjrVDzywA/DhSw1OuCdPVuMP/AzNwlZVuHU?=
 =?us-ascii?Q?O/cwHi+8ppzA8j7TYngsnFGGHq93NRARogvKTSidb3spwuMQqHkxWVMxTRYL?=
 =?us-ascii?Q?HE9Oci72agDb+JX8yb/6Ne0X7fm/NBBsxXpsDg94cfnS6KLQvu6N7VpGTtGq?=
 =?us-ascii?Q?ybc/E0Wm3QD/xhym8tAMuUgHnsK4CCE97l2nWLttfx6nDscYhARnXAHZ4wkS?=
 =?us-ascii?Q?01d6Me9cIHORGvsBufshXgtycfSDwJ4153qlTFiIR+pDZWOy4FlzPtg2/xx/?=
 =?us-ascii?Q?RwzjXb0z61DrTDsHAKhJJB6c95yQfozxsPPtSVqNZBM4z5uFuI//XLUDI1dm?=
 =?us-ascii?Q?p6Wqc2wev5hM3G77FKM6AB2w0Kly0I5l+lx2aQtP6x1+dPTqOnmrpgYnBHNx?=
 =?us-ascii?Q?/kmSMUx9MiLVcypuN6bv6Qt5308x386MCIAXsSG6lHY7qwpxqXm5AP477i6X?=
 =?us-ascii?Q?Lc/LB0oTPpsYFWOJkMqJ1ckrcJlBwDemP9qvV8Mjauhejd/2SBEe4VsNYcLf?=
 =?us-ascii?Q?isMoeKlyKiqd2J6cP+EHzoivX5iC1kl4DcuKBD/Tdoos1zsgsmLvBTN6/YQZ?=
 =?us-ascii?Q?Q9ZCaAuvIaWAXVMHSFxmWdku9PzpYt9s//BnCouIWn06+SZ4cPU9boq0S9Be?=
 =?us-ascii?Q?GwtK2H9pG6Y=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(7416014)(36860700013)(82310400026)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2024 21:43:11.9749 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3287066-baa8-4093-167a-08dd042c2c13
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003448.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8691
Received-SPF: softfail client-ip=2a01:111:f403:2414::612;
 envelope-from=nicolinc@nvidia.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.119,
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
X-TUID: 85bdoSWMX8Tc

On Fri, Nov 08, 2024 at 12:52:37PM +0000, Shameer Kolothum wrote:
> This RFC is for initial discussion/test purposes only and includes patches
> that are only relevant for adding the "arm-smmuv3-nested" support. For the
> complete branch please find,
> https://github.com/hisilicon/qemu/commits/private-smmuv3-nested-dev-rfc-v1/

I guess the QEMU branch above pairs with this (vIOMMU v6)?
https://github.com/nicolinc/iommufd/commits/smmuv3_nesting-with-rmr

Thanks
Nicolin
