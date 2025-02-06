Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1799278njb;
        Thu, 6 Feb 2025 12:34:20 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCVfG2YMQCTSJvWxQ/bQGdOa6r+PX1Mt3RpGMXkLUcd4tfMK54SmjpWepYk96uf772LWUUhNSlUMwGAHVQ==@linaro.org
X-Google-Smtp-Source: AGHT+IF7pOzkMV6tNFEszhImg+vyhPU+kNZvaelhwmX0g7UA4TyyBSlc+YlbxurtxGNyYdFfVj2b
X-Received: by 2002:a05:622a:14:b0:463:64b2:2e0d with SMTP id d75a77b69052e-47167acb4abmr10137801cf.40.1738874060582;
        Thu, 06 Feb 2025 12:34:20 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1738874060; cv=pass;
        d=google.com; s=arc-20240605;
        b=aif4xrS/WEBvJdH0rEl7llos6mkHTnCpWWi4k2BPFeJqMYyPP1y5om0fiQ1o+Ddw/N
         IEw3XAEQtwh1t8GhlKxXvDjHY45dFI/QsAY5bC44W/JjWRDrxdFAEBVNkiXs7oZ7/CAd
         PfUUtd5tCgssPekDC8WxgmTsD+0sgXRL4tpyXxUeFB3BDGs9EZDSTMelT6y5fX5a0vzJ
         nxEoGdDCnRIJlUVV0ivp5fpQM81KZWDNX0a7HeuLZLqn9GXkQqx4oOtGq8aQbYiotNHB
         oHC+j1aGXm/B/YC8Rv5drE/j5OLqL2GPIZf1tAG5dn6nCp80fFNeFwUGpTCVbPZBI4r+
         FBNA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=lueOmOPM0zEEGYBUu3qw+wXc5l2wC39Pq519QYV8Li4=;
        fh=zYLN9BCkzu5fcSQ2+kISUtBk9aRohqQWHS+bUS0+FD0=;
        b=MdzskKjGHgPCB+jRJCIzUlDL1qKLRrVLxwbXzgUrK52KoBxuhEJvitYYfhLq9T/YqH
         vvSKPRadi8PEXozW8yK5889XgrSi1GznqrLkreWOPibS5NDlvyvSmgPjhnP82pedb6yI
         cNSG+FP23cVTClX2qjjdvUVnOXuXz6YbS4obK0nkUcUL6bBJYcxd2MrZg33na/DTWVgk
         ZqjZ94lGpF2GGgs75AeqMifJfnhE1jn5Vyw8y/NHHFn6fv7v5YxvqOmXTFRE1M77Lhxt
         1v+//jFHbzB5//WIwjQH2tRgR6b7ZpvBKcydtkLLLI8WuFwhEh4IF6XJxpVc989cWVxi
         dL0w==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@Nvidia.com header.s=selector2 header.b=IZp0b3LV;
       arc=pass (i=1 spf=pass spfdomain=nvidia.com dmarc=pass fromdomain=nvidia.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=nvidia.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47149279294si16803801cf.52.2025.02.06.12.34.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2025 12:34:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@Nvidia.com header.s=selector2 header.b=IZp0b3LV;
       arc=pass (i=1 spf=pass spfdomain=nvidia.com dmarc=pass fromdomain=nvidia.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=nvidia.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tg8ZO-0003gw-Dk; Thu, 06 Feb 2025 15:33:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nicolinc@nvidia.com>)
 id 1tg8ZM-0003gZ-Pn; Thu, 06 Feb 2025 15:33:53 -0500
Received: from mail-bn7nam10on20621.outbound.protection.outlook.com
 ([2a01:111:f403:2009::621]
 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nicolinc@nvidia.com>)
 id 1tg8ZK-0001BM-L6; Thu, 06 Feb 2025 15:33:52 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mLR9OtT7JVfeiOeQ4SWvoyF8m05bZXB1DYtXN/146JgEG91ki9Psrcah4CdEvrKUluE7f6SxvNekCBCrSCXgS1eLDCayPAUESKF2mGUc6fO5KEB12Nbc+MCCNJ7SbxM2E81v89LKorU2MUPGjz3ly2osvJWMzl7lYNsDt5mJyRb77iPXIBv6QJOnIKB9WiPKMe1srKnCpl46nIm/zkBMC52NoOFjy5oQY6PeRTIUi/hj9OMC591niOhNLj+e0VurlsyPSSQTemZEmh0TkK9Sb88mvZJRlsjoeJfnJpGOkBFZ0xYSmGZbzPq3D7xjHgD1FmCBv535msiLavxJ/zxZ7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lueOmOPM0zEEGYBUu3qw+wXc5l2wC39Pq519QYV8Li4=;
 b=nGnR2xGWbV76Al1bhzaztR8y68DqQuNlTOcmBfN37GIT1n2dGYbfv+EnKSaA/zCQK6hbFUOL0iDht8PEul95tjWJxDWfINA5lBtYd4KvrmJYojFZ85UbZifA0tIaSZTgq66xe9g8Sxa1Z2ejaz0q9hB4o8iRwvaz/WumAeB+kdkhlTjp1QLABTr1ZfTfwbFAlww5LOCV9GIbdsbg68qCxxmA9aRcSSZUvuRFhPxxsHzzAEPOvx2XyRvYtGWZb05jbzENprYmDFEsrz9rDbnNyfwpUSq5u016M6DW/3RuLRv1Ag0pufIow7HDYPLN8fnruGJNQw6sGd8US7+TAA+Sfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=huawei.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lueOmOPM0zEEGYBUu3qw+wXc5l2wC39Pq519QYV8Li4=;
 b=IZp0b3LVQFl33cgpIecc0ieRFDdX4qxm/GUcVXq9ckxqBt0aTmIhFykRfvStKh0CJ2P07JLd6zK3PpjA+T717aUc2T6ZIiDKXNO3vkwKEAA+FOhIQT1e60TE2dV2wGvDBaJRsQ4hCpNnE7+H+f2Sa2cU8RoGWgyejB9XNADeh1rwJIuwmo+bbiUkJnLtBIDZf7vR+lBi0repFBDzo1sHLqcUL5CyWLl8wCxflLnMmw9+bsPmsM+NNZBo6rg2niyrJx0MF54IK6nSzzm0HodbG1Km70sk7N979uEIb+Nf6qgyxKS+OpGAn0OLIrOwrvA1KD9jbemzmKSeBOP81Kq7ZA==
Received: from BL1PR13CA0411.namprd13.prod.outlook.com (2603:10b6:208:2c2::26)
 by IA0PR12MB9046.namprd12.prod.outlook.com (2603:10b6:208:405::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Thu, 6 Feb
 2025 20:33:41 +0000
Received: from BL02EPF0001A0FA.namprd03.prod.outlook.com
 (2603:10b6:208:2c2:cafe::d0) by BL1PR13CA0411.outlook.office365.com
 (2603:10b6:208:2c2::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.6 via Frontend Transport; Thu, 6
 Feb 2025 20:33:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL02EPF0001A0FA.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.14 via Frontend Transport; Thu, 6 Feb 2025 20:33:40 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 6 Feb 2025
 12:33:22 -0800
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 6 Feb
 2025 12:33:22 -0800
Received: from Asurada-Nvidia (10.127.8.12) by mail.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14 via Frontend
 Transport; Thu, 6 Feb 2025 12:33:21 -0800
Date: Thu, 6 Feb 2025 12:33:19 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>, Daniel
 =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>, Jason Gunthorpe
 <jgg@nvidia.com>
CC: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>, "ddutile@redhat.com"
 <ddutile@redhat.com>, Linuxarm <linuxarm@huawei.com>, "Wangzhou (B)"
 <wangzhou1@hisilicon.com>, jiangkunkun <jiangkunkun@huawei.com>, "Jonathan
 Cameron" <jonathan.cameron@huawei.com>, "zhangfei.gao@linaro.org"
 <zhangfei.gao@linaro.org>, "nathanc@nvidia.com" <nathanc@nvidia.com>
Subject: Re: [RFC PATCH 0/5] hw/arm/virt: Add support for user-creatable
 nested SMMUv3
Message-ID: <Z6Ucj/u3wt9muakb@Asurada-Nvidia>
References: <71116749d1234ab48a205fd2588151ec@huawei.com>
 <20250206170238.GG2960738@nvidia.com> <Z6TtCLQ35UI12T77@redhat.com>
 <20250206174647.GA3480821@nvidia.com> <Z6T3cX_fM-aeYbMI@redhat.com>
 <20250206175843.GI2960738@nvidia.com>
 <13b1d8b97a314cb28b87563fa9b45299@huawei.com>
 <20250206181306.GK2960738@nvidia.com>
 <02a0080a4a1642d69b7f5dd4707a5b3d@huawei.com>
 <20250206182201.GL2960738@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250206182201.GL2960738@nvidia.com>
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FA:EE_|IA0PR12MB9046:EE_
X-MS-Office365-Filtering-Correlation-Id: 60659fb1-e119-483c-7246-08dd46ed8b13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|7416014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Y1pkdi1g2Pk21DtQ+GimqUisHjOwirmhXPZ6up15oFRjGbK81gj9zfcSlRvT?=
 =?us-ascii?Q?KQipTDV1QCvbB3/rILu76qcPcJQOFsEt7A3gbnlvORqv0FD/OXvU4e3INSri?=
 =?us-ascii?Q?bBPL8Y4+6APniH9cE0HNAUIciklciznFJPksNC0XnAk5FuZLOWVHnUaPWcQ0?=
 =?us-ascii?Q?jKx2EE1F4kAomanT7Q0hwn5av3a1tqLVFHGpLBsHTTEk5DfS9TjAIQfO5AhI?=
 =?us-ascii?Q?WIYxXnN1wbFJEWE+TC09s3OgVQ+KtGdDD6iJ0eAVr4L9cEvyJPDe20I0IQXi?=
 =?us-ascii?Q?lrATEdrcwTXGMvStnipUbf+LruL8kh89qdH4yai0ZbO699BlX/CszYuxsTol?=
 =?us-ascii?Q?hcyXU3ozxSuPIbR833YqKW5nBkNnEOBAxYzeoyDBmgaP0XgpAVUu9hqcWgRq?=
 =?us-ascii?Q?5nDJluWDV8MpVPzoy71fFhc+hS7uiqmLjP+VSH12njbRVRWK0eSQX+38STh+?=
 =?us-ascii?Q?YYJZQaMoFMhrkFx94q097fBL0bg93OWBwDHRJ5i0c1iYCUoJFRfHI/zJpDYh?=
 =?us-ascii?Q?0pT5scfMCyY90t0xwJWXEvGmgxrDJReFEehz2kz5KFggv+G50sRmdOaZfdsC?=
 =?us-ascii?Q?kdgT732KA4K8axOumVyChGMr5ka9X/Os/Pw9Guwp1hyyEb3gGSGE4iro+XxZ?=
 =?us-ascii?Q?o7FGcSHJRUyAa2kd6ylnI/6vovRu0GJzSr0ofiUfSXpmiqZGZ4vV71+U4h9r?=
 =?us-ascii?Q?5cI1BqkunYZ64/btwvHmLxjCH5m/WQwEgm1d3L/gOdaGw9a9nEi07GmYsIQ1?=
 =?us-ascii?Q?9rkDN3AxZ+SmFgQ9MqptYhVXeuI2NtgEvp5j22y537SMUeoLWVoNsNTEo8+j?=
 =?us-ascii?Q?Vj7hTISN8zN/nGLH7Gq6kFljuGc4lAyF/dvBq6ZiaNSezPOeUGbwvA+4kykE?=
 =?us-ascii?Q?ctreFcskn8oB+6UqKV+4a3V0WCXjbfRiGzzFNCF7tEzhG8BGD17S2e6orYTf?=
 =?us-ascii?Q?H1WhLQ24m8yqdpXUuXR87cJaefD+gvzndQlkQtkMJIpaDKxTH5s09KbUNpO5?=
 =?us-ascii?Q?tFk1dmc7bWkHMDG/Yj9Km+T+yMS37BnNUOSZS2k4T8rsfxR5unoPd9JMf2PP?=
 =?us-ascii?Q?TPnS6NIKBP/pdDsozWrIJ9gJVKlS+hj4mzBMJD8oYoiu0A05rlcyKzt3z2V9?=
 =?us-ascii?Q?5SwfeeomTtQzK7Uync/xLRFr6CE2DGiNo8dxwFV95HoXIm9OLOgUwP0Vpfyf?=
 =?us-ascii?Q?iZXbMeQCj0LwI08ZSHFW0FDsZQksbu4oOdfvcRkRTWBUdkWNrC2jjfAXewJ1?=
 =?us-ascii?Q?xpFJTCPz6hxMuW5PC2+3FysntN8yd/DKk3GRJGCc8defeEvsWmb5UZVRA0ed?=
 =?us-ascii?Q?nmEuKeIv5QUeRFG4VLgg8ySEh+OHLzFx6FnmhLzI/9sbfmU5YtOURurg9pIk?=
 =?us-ascii?Q?6Rq5Q+VEDRuyjuhxMJZq9EzT6pqePbPUKaqJuP5y/+jEhC1BPo2wHTQFf3T9?=
 =?us-ascii?Q?H/Rdss4kk1i5bBW0Qkt9wYocN/PHNY6V13+rYIglD+1YmAGgPePNO6k+MqJK?=
 =?us-ascii?Q?yzshlmTx0LiqY60=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(7416014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 20:33:40.8948 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60659fb1-e119-483c-7246-08dd46ed8b13
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A0FA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB9046
Received-SPF: softfail client-ip=2a01:111:f403:2009::621;
 envelope-from=nicolinc@nvidia.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
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
X-TUID: f2XkjZtWtbH6

On Thu, Feb 06, 2025 at 02:22:01PM -0400, Jason Gunthorpe wrote:
> On Thu, Feb 06, 2025 at 06:18:14PM +0000, Shameerali Kolothum Thodi wrote:
> 
> > > So even if you invent an iommu ID we cannot accept it as a handle to
> > > create viommu in iommufd.
> > 
> > Creating the vIOMMU only happens when the user does a  cold/hot plug of
> > a VFIO device. At that time Qemu checks whether the assigned id matches
> > with whatever the kernel tell it. 
> 
> This is not hard up until the guest is started. If you boot a guest
> without a backing viommu iommufd object then there will be some more
> complexities.

Yea, I imagined that things would be complicated with hotplugs..

On one hand, I got the part that we need some fixed link forehand
to ease migration/hotplugs.

On the other hand, all IOMMUFD ioctls need a VFIO device FD, which
brings the immediate attention that we cannot even decide vSMMU's
capabilities being reflected in its IDR/IIDR registers, without a
coldplug device -- if we boot a VM (one vSMMU<->pSMMU) with only a
hotplug device, the IOMMU_GET_HW_INFO cannot be done during guest
kernel probing vSMMU instance. So we would have to reset the vSMMU
"HW" after the device hotplug?

Nicolin
