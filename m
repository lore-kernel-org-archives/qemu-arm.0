Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp1273676njc;
        Fri, 15 Nov 2024 14:13:16 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCWxEf3981X+Gy078iDa39+LtV2gdGn6DWCvaOTyj0F777qRcUQvBNvCtbmipI85qW7S9x2lYlkF1igyog==@linaro.org
X-Google-Smtp-Source: AGHT+IG+XeWVeiGQ7gmrck4jXP0XF8/ULZ2jwRGeipWhF1pe5rbdjGAcksdWpFvJD/dwkBfelgeK
X-Received: by 2002:a05:622a:5105:b0:462:fc9b:985d with SMTP id d75a77b69052e-46363eb5ba1mr58240281cf.51.1731708796799;
        Fri, 15 Nov 2024 14:13:16 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1731708796; cv=pass;
        d=google.com; s=arc-20240605;
        b=fyFxNNr2ub/LiI6gidEhcPPOrBMTTxEYWSEYAhL7m5M6Q3RdwWiAWPK50Sbexh1hOE
         OjVUkV6RliFkcBrtMI3odRumJYObsS5mvfLxkt35MPjBh/Znb5qOe6Uje6e21FDglqOd
         kaUlr68zGTZmQNygxHuzq5ywu/nToOrjewFUGrDbHtkzQflUhOpaTqr3FX9g1Re6ztk0
         E3GvhrH5Tv1irBDm3ur/f3teik4T/1fzSijTH+ZM96JfSZtXep+GkObkSsJpAjeIBcUI
         JC6c/w5sMVrrrLziY88ktxqeTKn3QsyvQIbZO88QxqI241l1qYFDHHhZ6IT1K4QRjzd2
         WInw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=JCKdkj34elrzrch45Y0A03++SfE04vRhJ88Oah2C+3s=;
        fh=9vqjk0VsEqMEpRYwHIrq7Kj4LCBrFUMmls5zY4cK8oE=;
        b=YVZO8iB2fJewUMQO4hPD6a2KbAmIX3TgukIIjuDebZAvd8mYOWWW/6hpq3A3FsPpgF
         /d/q1U9+2NamMKEiR6Wop+PPf6Nvq+lJAKzVetkTo9bZ/vvpxxnAoZFX8JD/bzYCiE/B
         RyZuIHCN8sY5x+rTLATvSlIZJ5vjRFcW95vs1I+6y+yV4uyY5Ov6LXQwH7NCxNWB25C4
         8IFXvVNLSkCFmQUhJkIvXAlaka8HiIr8BbrAc3uk1rNtXUsXQsdddHuU13HPLfw1E+Uc
         rUmwmUqxbGfcOxcrSpphdGQThE9ZZ9ipC6/PScVtzL0aGOZeWqJpwc+k6jkntZYmgOwj
         StUg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@Nvidia.com header.s=selector2 header.b=oA9EMJ8n;
       arc=pass (i=1 spf=pass spfdomain=nvidia.com dmarc=pass fromdomain=nvidia.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=nvidia.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4635a989649si43974491cf.136.2024.11.15.14.13.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Nov 2024 14:13:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@Nvidia.com header.s=selector2 header.b=oA9EMJ8n;
       arc=pass (i=1 spf=pass spfdomain=nvidia.com dmarc=pass fromdomain=nvidia.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=nvidia.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tC4YU-0000qj-0A; Fri, 15 Nov 2024 17:12:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nicolinc@nvidia.com>)
 id 1tC4YS-0000qP-Vy; Fri, 15 Nov 2024 17:12:41 -0500
Received: from mail-dm6nam12on20604.outbound.protection.outlook.com
 ([2a01:111:f403:2417::604]
 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nicolinc@nvidia.com>)
 id 1tC4YQ-00079M-3n; Fri, 15 Nov 2024 17:12:40 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wa4bGiJ2F6W/n0nu6twfBEI4r1LkkFH2hDoBWw6xYOUh99/jfGfdj3Nh0gHnoAVhrY+C8y4JATFlGJZ9b62LTrp1+mez8YdmVAct5rqbLy6ok7XI193m1xWjZzQUf5zZ7BlLuZ6G/U6mcgqimiaJ9wMT4VHNYJGXJN8dDwbOg214iVeRUoZ+1zHGs2S7cxRbsffxL8H5OOui3nZc6AA2wI5Mt3NrjUbUDbgqVHrRMZ9StHcpL5rtWGge+WcTkp+RNk940dq8Blff1Eq33VOsg24H5jXVHqfpVMBMOgiRSwQE/l2h3UfI80cNktYrPRLsoECeHjpu0eQjA2D39NeFog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JCKdkj34elrzrch45Y0A03++SfE04vRhJ88Oah2C+3s=;
 b=ZdHQdCCvLbbc4jTGcBQNtAsXNsvtUVft5nRQYFHVgFotBnM7hB4uRBl/aEbdrl8VrKHwx4EFw40XJ5pio8uJuQiWm8Yx4Sg98MjgNY02g4TX+87JlewzSa5vYqz5bKrA3LGL5MWMqzKBk6fPQmLxSqxT0h4BZPUCjmJczCk+ZriTfTXkbkFjf8UUeSVfpEJFXduFU9niIo+uW0Tf3PdMcOPqmKCajQ70kH6YBvkCL677PdTAlGfLq9Ssch5BO5YgvIOZ+j1wkZ9LJiXqFshPwaByorANHUn2xPZYyATHQxMS8foYo96f+MZ7dfDoWpI+kQHGpQpNdHgfnbzIiW8lpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JCKdkj34elrzrch45Y0A03++SfE04vRhJ88Oah2C+3s=;
 b=oA9EMJ8n4HS9R2CXUFCWEGMjO759gdsIUnOxJPJOSiJJwvoVgZR5oMXkDkQfp+94XWjRhbA3nZfUiKbDPqBITexNUDuYhRp7wRxPLkxz+E7fwMCJma6XSBCROZWD8sFasq4VPDwxU8oqrFKRbGZCH9jusQ4xcyfpFUSik8g8aJPWLMpiILJW9C1hKJ9+N6Gkdl2Bj4DpZEP2YyW0AeSTOXqyLB7MIwd0JpnVur1mnn83oiVfhn5BnUDpsmnVtCh1mhZ/m1m7/xHw8ZJLvwVuohKvU1jlsLiUBiRMosdmZVGCLjCxRZ6fpVSuG5yJ/gexUj622BswzDvB29xGCUtZmg==
Received: from BYAPR06CA0014.namprd06.prod.outlook.com (2603:10b6:a03:d4::27)
 by DM4PR12MB6591.namprd12.prod.outlook.com (2603:10b6:8:8e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.20; Fri, 15 Nov
 2024 22:12:31 +0000
Received: from MWH0EPF000A6732.namprd04.prod.outlook.com
 (2603:10b6:a03:d4:cafe::d) by BYAPR06CA0014.outlook.office365.com
 (2603:10b6:a03:d4::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17 via Frontend
 Transport; Fri, 15 Nov 2024 22:12:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 MWH0EPF000A6732.mail.protection.outlook.com (10.167.249.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8158.14 via Frontend Transport; Fri, 15 Nov 2024 22:12:30 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 15 Nov
 2024 14:12:23 -0800
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Fri, 15 Nov 2024 14:12:23 -0800
Received: from Asurada-Nvidia (10.127.8.12) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4 via Frontend
 Transport; Fri, 15 Nov 2024 14:12:22 -0800
Date: Fri, 15 Nov 2024 14:12:21 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: Eric Auger <eric.auger@redhat.com>
CC: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "peter.maydell@linaro.org"
 <peter.maydell@linaro.org>, "jgg@nvidia.com" <jgg@nvidia.com>,
 "ddutile@redhat.com" <ddutile@redhat.com>, Linuxarm <linuxarm@huawei.com>,
 "Wangzhou (B)" <wangzhou1@hisilicon.com>, jiangkunkun
 <jiangkunkun@huawei.com>, Jonathan Cameron <jonathan.cameron@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>
Subject: Re: [RFC PATCH 5/5] hw/arm/virt-acpi-build: Add IORT RMR regions to
 handle MSI nested binding
Message-ID: <ZzfHRZlt4v6Hp7wf@Asurada-Nvidia>
References: <20241108125242.60136-1-shameerali.kolothum.thodi@huawei.com>
 <20241108125242.60136-6-shameerali.kolothum.thodi@huawei.com>
 <ZzTwZWXp0dIZB3E4@Asurada-Nvidia>
 <cf0d88bc649344a4b396575cc58394ac@huawei.com>
 <a30e5df1-3dcc-48c9-b632-861dbeee7886@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <a30e5df1-3dcc-48c9-b632-861dbeee7886@redhat.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6732:EE_|DM4PR12MB6591:EE_
X-MS-Office365-Filtering-Correlation-Id: 9023cc3b-34e7-4a79-0444-08dd05c29932
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|7416014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Hl4fT+dIik56+pQYDMkj0LUKHV82NG4CaxNPToCm59/gH7+xAmX6EIonCIu+?=
 =?us-ascii?Q?2DUm+1JiuWAys0I/Xm5Mbk9V5+qYoES3SdkuVq7bW9P4pNAbSDHwPCuvapU0?=
 =?us-ascii?Q?TslpUorNmCpohdylT8uktoU5QxqNlqZgfvLZJoQem0F7yOem351lhqNr04pY?=
 =?us-ascii?Q?cgdOp0/8zhLDQTXmiR+ANt3lu558y+TBLI2VWvxXOgAhIR3fkvCRsQUYlfk2?=
 =?us-ascii?Q?qe+KQrDmKarW2q1d0Ani7RKHGRCssbLMRcCnGg3Jcacfkxst+AUdaXBkXYn6?=
 =?us-ascii?Q?26r8bjev25/threAb7gFAPDcZ8/FJx8iOhTU6AZJgd4fNf1wTDPRDbsvsbp6?=
 =?us-ascii?Q?puRxwal8Z15KE+m3eGxlUKDaNRhl07y36Pw1Ia1iB2wHjxtlQDV10O7oSCIM?=
 =?us-ascii?Q?0sPjFG1Dl0R8syPRKtZwMY1xoSRR7T7C/Cj/Q2ZTui8fcqYTDhwIyJBrrJ8l?=
 =?us-ascii?Q?uhUXnAcYO13rfKa3C7IBT6Fj32u59KHG5Dy100YwY7Dk2fgXDVeDeTe8fY1Z?=
 =?us-ascii?Q?jpwWnW9faWyIGjgDAfVUFPUEuMCHhVec3t0zgxPmvTH9JhB6HxYQgJDKvg+s?=
 =?us-ascii?Q?1EGzLZl38n/mY9MBHjAaX9jvskH4Hfhy/ju4f6s9wttjDpfvxSHZtMdiR2Yv?=
 =?us-ascii?Q?zajaLcTC+8/he4ik6j/SsxKpw0L6yeeu/+mUjQ4vP9XQlpGXftlMLRsKOMff?=
 =?us-ascii?Q?ZT0ll8towZGGAZpQygx21juYoXqfyuGFitm1elwGdoVdSSdNBuECZUrW6mGs?=
 =?us-ascii?Q?zsd5jBtpVwLLrXUdedEGfFyAU6zPZqiqGnTAVJzSaC9NcttUkD0BpIkqd0hd?=
 =?us-ascii?Q?opJY+Zt+GiNDDKQA94vK9La/VzzmO+BUTZCIp4oSp8l0KUDHToNmlOwNQbLH?=
 =?us-ascii?Q?TgAJlI2rZA5rtYFMpC1yNmEpj7zLNAuwaPSn0uNq3HQvNnWLINbQDQVVecRN?=
 =?us-ascii?Q?fEmoxaBY+h9NjORw776Rk9dUWdNp9EXIHCtWvmymIU8TwVETHZnz5e/TySjk?=
 =?us-ascii?Q?LBRfbnxdJVAH/5Ehy0hFeNPy5VKq82ztVaUWNSDFq+JDVbAkirNex9ws8jD1?=
 =?us-ascii?Q?CHC50SNfq4rabTNG2uJDPBYWQrQpydVg8W9oKhwlj+tujx7hbgp2flUUGmTK?=
 =?us-ascii?Q?lBvEZrdNSdPspaPr6uWaJdi0j09kDqoTUs+IH30L9/3WUhEjhLhnr8BOkytT?=
 =?us-ascii?Q?3y860P4SBU/2k8Kn8UoFN1WyUgDJi0w1OzYDXvteLKnjVEOcSueZcyxBTpFc?=
 =?us-ascii?Q?+BFSTm4k0VVV8meeHjAZY1688cBVb7gSVRY2c+nCOp9pCk7aNVRPRny3zRhL?=
 =?us-ascii?Q?nAtNqxoOq39nUOPQ7cMQZ64T94Fpmm1OsAVJKJVMe/UtKcO+Tmq53E54r/Xv?=
 =?us-ascii?Q?+KmshqzL9TwQ6bf6Vtgt4oBIGuOf36ItHncsIe10M7VEdrJEQw=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.233; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(7416014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 22:12:30.7839 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9023cc3b-34e7-4a79-0444-08dd05c29932
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.233];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A6732.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6591
Received-SPF: softfail client-ip=2a01:111:f403:2417::604;
 envelope-from=nicolinc@nvidia.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
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
X-TUID: xuFlxtJXZCZy

On Thu, Nov 14, 2024 at 11:41:58AM +0100, Eric Auger wrote:
> Hi Shameer,
> 
> On 11/14/24 09:48, Shameerali Kolothum Thodi wrote:
> >
> >> -----Original Message-----
> >> From: Nicolin Chen <nicolinc@nvidia.com>
> >> Sent: Wednesday, November 13, 2024 6:31 PM
> >> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
> >> Cc: qemu-arm@nongnu.org; qemu-devel@nongnu.org;
> >> eric.auger@redhat.com; peter.maydell@linaro.org; jgg@nvidia.com;
> >> ddutile@redhat.com; Linuxarm <linuxarm@huawei.com>; Wangzhou (B)
> >> <wangzhou1@hisilicon.com>; jiangkunkun <jiangkunkun@huawei.com>;
> >> Jonathan Cameron <jonathan.cameron@huawei.com>;
> >> zhangfei.gao@linaro.org
> >> Subject: Re: [RFC PATCH 5/5] hw/arm/virt-acpi-build: Add IORT RMR regions
> >> to handle MSI nested binding
> >>
> >> On Fri, Nov 08, 2024 at 12:52:42PM +0000, Shameer Kolothum wrote:
> >>> From: Eric Auger <eric.auger@redhat.com>
> >>>
> >>> To handle SMMUv3 nested stage support it is practical to expose the
> >>> guest with reserved memory regions (RMRs) covering the IOVAs used by
> >>> the host kernel to map physical MSI doorbells.
> >> There has been an ongoing solution for MSI alternative:
> >> https://lore.kernel.org/kvm/cover.1731130093.git.nicolinc@nvidia.com/
> >>
> >> So, I think we should keep this patch out of this series, instead put it on top
> >> of the testing branch.
> > Yes. I think then we can support DT solution as well. 
> >
> > On that MSI RFC above, have you seen Eric's earlier/initial proposal to bind the Guest MSI in
> > nested cases. IIRC, it was providing an IOCTL and then creating a mapping in the host.
> >
> > I think this is the latest on that.
> > https://lore.kernel.org/linux-iommu/20210411114659.15051-4-eric.auger@redhat.com/
> yes this is the latest before I stopped my VFIO integration efforts.
> >
> > But not sure, why we then moved to RMR approach. Eric?
> 
> This was indeed the 1st integration approach. Using RMR instead was
> suggested by Jean-Philippe and I considered it as simpler (because we
> needed the SET_MSI_BINDING iotcl) so I changed the approach.

Oh, I didn't realized Eric had this..

Now, Robin wanted it back (in iommufd though), against the RMR :-/

Nicolin
