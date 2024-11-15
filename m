Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp1281746njc;
        Fri, 15 Nov 2024 14:33:37 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCWv6VqsFvmOYYKIKr4leofSZFWmGzKnJMDjRCGsfm6y+jaQl9Dx9w2NqN4jbxEAgw3bk6U2v+SefEfPqw==@linaro.org
X-Google-Smtp-Source: AGHT+IHiaINwzPv0K7Lg6IFE0xPCDrlpsqmzEk5E8C6f0LwfNaAiDUooLu5YGwxgl/I2pi27b6in
X-Received: by 2002:a05:6122:8c22:b0:50c:79a4:c25 with SMTP id 71dfb90a1353d-51477f7c9f3mr5791233e0c.8.1731710017455;
        Fri, 15 Nov 2024 14:33:37 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1731710017; cv=pass;
        d=google.com; s=arc-20240605;
        b=TSOlWH2iYZpbXOuQwTDAbkbT1p2Va4nBcmehGAYVA5lPT3sjy7b9KsjoZLXhaq1+Lr
         kh/UGDN2d32P+6f74JZSIgRS2OgFXaKEV9sgVk+km6zAetMd+Zw2ukb715aCZxfBKNAs
         mqtcn3iKjsJUdu0fbvPKWo+QUve5mGIbyumvL1nzSsIHD/gDjcf3aQvDIj30kuckQ86i
         i9LcyNMEve/u4DlD1Rcjc49fjsZ4+PU/eba3M3n+fYNtBdMf3JxhZ8y3T3CAVyzYBFCd
         LQURnW2VNqA4JNaV+KygKtw8AlltU9luu6gj9JB5SYKzApNSpf8u3tA6uHpL6LssdJjA
         6j6w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=YiEbPPp6iPj13niALs/l2PFxGcuBdpw4WkEuwcXHDpM=;
        fh=051D/jN0C4GzL/tvU8N8+lYGhKBB7tZ9kc34xjwRei8=;
        b=ImH1wuiIn5mMFuIz3Riz4JG+7bKTdXyopTUYrqHiNKseMZuWMdyVDf5VH8KEH6kf9S
         C3R64igaoZPa8z9mSQUhu3+9G8et2FW3vMCGu/gg6IV9zuW0LW5CgYY4utNZfkJ7hsQH
         ABMJvuqnsxPqsQVwyCyQdj5hdy0AnuvzLx6Yao+SruIM83tdIBSN8DQDGaq4CEJ2zyB3
         6755KyPpbqEtTG7w3X8G++PlrN42AjvB0fb+9eMKRIOwxVAc+1PUVywadz6wi8+NHXjF
         z1QXjOKPwTHCOTSNal4AzAHCV94WmnHAs/IxyUAGjU7ZrY8oGKu+ZeS1ES4PEQ5aIlAF
         qPsA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@Nvidia.com header.s=selector2 header.b=M0eP4c11;
       arc=pass (i=1 spf=pass spfdomain=nvidia.com dmarc=pass fromdomain=nvidia.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=nvidia.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b35caf3487si457139285a.618.2024.11.15.14.33.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Nov 2024 14:33:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@Nvidia.com header.s=selector2 header.b=M0eP4c11;
       arc=pass (i=1 spf=pass spfdomain=nvidia.com dmarc=pass fromdomain=nvidia.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=nvidia.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tC4s4-0004rC-30; Fri, 15 Nov 2024 17:32:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nicolinc@nvidia.com>)
 id 1tC4s1-0004qq-Qo; Fri, 15 Nov 2024 17:32:54 -0500
Received: from mail-bn8nam11on2061f.outbound.protection.outlook.com
 ([2a01:111:f403:2414::61f]
 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nicolinc@nvidia.com>)
 id 1tC4rz-0002U5-Ui; Fri, 15 Nov 2024 17:32:53 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EQb6vawKxCT0oDRImEWCQ+J/nLTCUxZr4yPCZ1T8yjKyVvm81GMdL73x2AP2L0ARypnLJaFmNox8qlvk0q3ujlrDVCSYq2B3VTmH06hTfPcTu+YPxB8Lptir9nqzU5hOXGxcBW53Jpl9sxW2wg5w7to3VZ8qHkrhPKOgE5dLAwqrakaANTuhdrSfMefDEaqBGp7xdXivf51/TXtMaB7x+CpYzWJmyzPSy3So0pnTIhEvzIIz5cfSDnGXFkZ7Q4NrO+4i23cGhrHhDow7KHtxWJYyhBFGtg255U67HAELH1O/OJPgHU5AoHk79B0pkhegiQtksjulY50qMQ8pCOJsUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YiEbPPp6iPj13niALs/l2PFxGcuBdpw4WkEuwcXHDpM=;
 b=v3eF9wbdXX//CA3F+joimX5rl2uW4BYzMkDmp1PxC2rSsbqjTN7abmJ6W8MiT5G0A1/aVCrDS65ukk/NQbn1GPSLb9sbWemyK72fBT2mL6w8i0ikXup26sKO3hJ+XkGekRXf+6YvnQ8lsQjtu8QPWfsAByY/tI8jWv5G0vUPrHyWy1DkimN03URxapKxr6G9Snih2pcthBEv5pgyQEyof0XR/Li9TYu/7SibwBN3JqFfORcJTR6uuqKbcyTkHF1JXYwLsoijDzr98sfpE4roCR4IIMWzBx1FBja9MqYj9q0WZdt5PqhSRETDwsSAuy7bvtTwXJBvXO5MY/4tj+AsbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=huawei.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YiEbPPp6iPj13niALs/l2PFxGcuBdpw4WkEuwcXHDpM=;
 b=M0eP4c11oQLyAiRaypp4yHkimgLmZevTWs7A/ZkN43c/7KfAzB1q9EZtqRzlp2dN/o8wTD+V9+h8jDct363mqpF/QpX9OyojkjSI7v0o/547wASndNat6Zch/lq+U0GoMz+nySs+9nrLXM6XwysA/8QhQPwhTBhLH+sE66cwR6238Ifadh71RrBtC+/6aSJdYH5hW7bM6idh+gQnRGO7EB/PLqJyAUZnfwUbOrDLNfTAmhDWyny9CM/Us0Lk4w5GLgDwjQRZq6TeVpoG5yYB/3bR9f4x5aHzP/59DaHS5K7LtmzByB8AFjaH7peu8J3t+6OvT0HW8NnFea/6PGvlig==
Received: from BN8PR16CA0021.namprd16.prod.outlook.com (2603:10b6:408:4c::34)
 by CY5PR12MB6432.namprd12.prod.outlook.com (2603:10b6:930:38::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.19; Fri, 15 Nov
 2024 22:32:43 +0000
Received: from BL02EPF00021F6E.namprd02.prod.outlook.com
 (2603:10b6:408:4c:cafe::22) by BN8PR16CA0021.outlook.office365.com
 (2603:10b6:408:4c::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.18 via Frontend
 Transport; Fri, 15 Nov 2024 22:32:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF00021F6E.mail.protection.outlook.com (10.167.249.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8158.14 via Frontend Transport; Fri, 15 Nov 2024 22:32:42 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 15 Nov
 2024 14:32:29 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 15 Nov
 2024 14:32:29 -0800
Received: from Asurada-Nvidia (10.127.8.12) by mail.nvidia.com (10.129.68.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4 via Frontend
 Transport; Fri, 15 Nov 2024 14:32:28 -0800
Date: Fri, 15 Nov 2024 14:32:26 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
CC: "eric.auger@redhat.com" <eric.auger@redhat.com>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>, "jgg@nvidia.com"
 <jgg@nvidia.com>, "ddutile@redhat.com" <ddutile@redhat.com>, Linuxarm
 <linuxarm@huawei.com>, "Wangzhou (B)" <wangzhou1@hisilicon.com>, jiangkunkun
 <jiangkunkun@huawei.com>, Jonathan Cameron <jonathan.cameron@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>
Subject: Re: [RFC PATCH 2/5] hw/arm/smmuv3: Add initial support for SMMUv3
 Nested device
Message-ID: <ZzfL+hDCC2bdY2Cv@Asurada-Nvidia>
References: <20241108125242.60136-1-shameerali.kolothum.thodi@huawei.com>
 <20241108125242.60136-3-shameerali.kolothum.thodi@huawei.com>
 <00e8a5d6-c926-44bb-8d11-dab4ddc4820d@redhat.com>
 <7a3b6dcb5db349f5a7e718784ef46c97@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7a3b6dcb5db349f5a7e718784ef46c97@huawei.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6E:EE_|CY5PR12MB6432:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e6b1f6e-0944-49fc-d350-08dd05c56b8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|7416014|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UDM3T0ZxaFkvbFROd1NJL3RqU3hOcm54YWRLdTRKZDY4UTRDRzNmdGIxWTNo?=
 =?utf-8?B?Vmo0RFJNTFRlQ2h0UlNtMlZ1U2Z2WGxENFA1cXppV3p2dFMvVXhhL29tQzFu?=
 =?utf-8?B?WFM3eityNGVyRGw4WEh3QkNXRU5PakNYa0hEMGNreG4xWFZVT1JxLzZEYW91?=
 =?utf-8?B?QXNRL081SWdwVzVXSENvTFpDaVVJN3Q2Z2ZnbjdrVVNKTnplSmp2bUlreFhV?=
 =?utf-8?B?dnpsaVArV2x6ODNQaXlyWVVhcDNqM28wMkdKY3Ayc3Z0VnFBcTlwUnFkRThB?=
 =?utf-8?B?SHFNVzRnaFVwWS9ha1NabStkQkFmSW5jejlUUHBVMVZBQ0JzenZqQmk0Nm5z?=
 =?utf-8?B?ZFpOTWdSOHNQUmpSYTVEQnk4NW5TbFh1b0dLNno3Yi9wMlhSVzUwRlNCaEtW?=
 =?utf-8?B?bi9BWlJ6Qkw0ZURTWVl5SlljVDJPM29Gb0pUYkNxS3ZvZGgrT0xPS0FuVFhI?=
 =?utf-8?B?Wk1jYTJVNi83TElJUG0xRVpWbmZSYWRrQ2x6VnBjTTYzamY3VG1zTkpuL29M?=
 =?utf-8?B?aWliOFRTYUxzSGd3UkRTWDFTZVdkejc3akswdklGNy8zRFJpbUJCZnorUy9r?=
 =?utf-8?B?aHBHdFYvTzZLZ1pPN2pCWjcvVkpnZURoWXF2MkQ3MUljR2c2L3NMSjdxR20v?=
 =?utf-8?B?QkRRbnlENDByd3RlSWtFZ09KekVaa2lzQTlXNThTUlNiTUdqYVNKcXFqeFIr?=
 =?utf-8?B?VCsva0hqTDEvSGFud3JIOGNvZUdNTDNrLzB1QkZkWE8vekl0ZVRxSEhhOWJh?=
 =?utf-8?B?OVMyNVgzdjhOM2ppMmdXT1ZRMnE1QWF1MW5UWWh1aUF5V0lRcjllWkpsOUVo?=
 =?utf-8?B?bDRyL2kzZXpnMi9kZU1leEw2QzMwVFd5Yi9lWC9IbGZvTmlSQkpaY2drMmY1?=
 =?utf-8?B?MWdXb0kwOURFNzlUSkZ4KzRpengwZ0NML2pQeWNiL1F6eHFNZGhvcXBRa01K?=
 =?utf-8?B?c1kwNDcramlXZnhVeGxTWmthd1FuRTA2ZEU2ZUJoWGxWemYrK0dMdjVHQ1Rp?=
 =?utf-8?B?aS9yVTg4QkprTThlSHpCMHQ3Nkt6cE9VOFA0OUs5VXowUms0ZkVBVE1PSXNJ?=
 =?utf-8?B?b29TbzBPRlNhYjhxV0Y4WHdnbkJZcG5XWTdPbmgxNXFSUkN6ZUVGM1dUbFdF?=
 =?utf-8?B?QXdHazJaZVFkNC9EdmJMUEMxZEdBRzhSZEJaTjVWQVNab0tRaVZydnBqSGh1?=
 =?utf-8?B?NWdqSlB3bjBTaDBFWXlQalB5U0FQNjhENFUxSTVPWWQ5UTVtNmJibmdiMnJu?=
 =?utf-8?B?SGF6eFJtbWRyVTEySDlLRnNyYjhNNXJFLzRwSFdmRU44UElwMUFZUytqbDAv?=
 =?utf-8?B?ZFI2TmtLQWs0UFBjeldoZUlDWGx1V21FdHNac0s3MWRlRndpV1V1dDNHMkFO?=
 =?utf-8?B?dlJkWTNiYTY3aG1HS2lEU2pwbmZDd0FjQ2djeHhjbTA4STU4dzJEVGVMcjI0?=
 =?utf-8?B?NC9nNDhadTMvK0krWGtpMXRsS295SHUyY0hDc2hyM0huT0lZWWorUnhTY3dL?=
 =?utf-8?B?OUFkcU5jY3I4Z0xFaDd5K0pGek0zL2dOSXQrUmQ1YTdhbjhicGE5Zmx6NjRL?=
 =?utf-8?B?K3RkaHp0RnRqeVdEc2tmMkt3SzVuSC9oc2xNU3RXaHowbW0vQU9UcGNyeU42?=
 =?utf-8?B?YTA5UXMwNEFnZzNSakF0Y2xvcDhpeUE0MFhKcWkwOGV0czRPS2V4RGxBUG5s?=
 =?utf-8?B?dFhuZWttWWhjOXVqbnFMY1pwWkJydklRaEpHc0ROKzZnS0pSc3ZiaWs4T1pF?=
 =?utf-8?B?R2FKMVJlemx4bGcwbUQ2YjU2WUwzb2lTVEhxRS83M2lXTWNLUXRXbTVBQ2ZT?=
 =?utf-8?B?NmtDT1lmZnR3ZnZZVythK1hld3VyYXNVZGtwcERySVBaQllHcWdQOWlsMGpw?=
 =?utf-8?B?OHRoVGpXZERZaGNERkt6K1l1UmJDVG4rRFBtZ2dXc202SUE9PQ==?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(7416014)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 22:32:42.6003 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e6b1f6e-0944-49fc-d350-08dd05c56b8c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00021F6E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6432
Received-SPF: softfail client-ip=2a01:111:f403:2414::61f;
 envelope-from=nicolinc@nvidia.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.12,
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
X-TUID: iQ/Tr62Vpvgm

On Thu, Nov 14, 2024 at 08:20:08AM +0000, Shameerali Kolothum Thodi wrote:
> > > diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h index
> > > 46f48fe561..50e47a4ef3 100644
> > > --- a/include/hw/arm/virt.h
> > > +++ b/include/hw/arm/virt.h
> > > @@ -50,6 +50,9 @@
> > >  /* MMIO region size for SMMUv3 */
> > >  #define SMMU_IO_LEN 0x20000
> > >
> > > +/* Max supported nested SMMUv3 */
> > > +#define MAX_SMMU_NESTED 128
> > Ouch, that many?!
> 
> 😊. I just came up with the max we can support the allocated MMIO space.
> We do have systems at present which has 8 physical SMMUv3s at the moment.
> Probably 16/32 would be a better number I guess.

FWIW, we have systems having 20 physical SMMUs at this moment :)

Thanks
Nicolin
