Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp191960njb;
        Fri, 6 Sep 2024 11:55:40 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCVnE02LNF2qWZ6Mydld6lQMM4u8DkwkpzuvjTjHJogI3JVkBgEwtvtquldtOyMHhZOQfCykMQjYT9xWAQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFIWF9x/RHoMO/WF5JOoiX9o6DIbHC5ggEBBuQ1Kb/pTcCV7qZ0blghWIxpcKh5cGPKW/x5
X-Received: by 2002:a05:6102:941:b0:48f:db3d:593e with SMTP id ada2fe7eead31-49bde1c40f1mr3934970137.14.1725648940129;
        Fri, 06 Sep 2024 11:55:40 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1725648940; cv=pass;
        d=google.com; s=arc-20240605;
        b=XhUddK2KRCtC8WthpYKMi35TnOCLKtjIwHc88+sf1asd0N+E3OfdP1IffTWkGGMtCq
         5Sz0n2z39Biw1xr9e4Gd0NkoNv5j2ECDa213/7OCq2ey6DyUpBEygaYfXBWZjew0jYO4
         CkWJeyAhoYkTS6P7L2dJwe+zBMCdLf49jnK6gO9o7W0E2Q1QuMtekp6WNptsl6TtUO69
         EpwZe52JDv92Xch2japUocTkdJt1wvvWEazZUHq5qCD5UIHcR7OcGGizwYy3/XVc0+qr
         I6gDZnp1XNPJ0hPE5nB2Obs4S3SG4BJr7xQwE1lpTA+tiv0PBvZtg+M37NVEaxjvDhyW
         PuGQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=TEutcluOSJOBQzLSnkCqcud17Kmdv89rV32zuZH4b0s=;
        fh=q58WE8b3BnSdt1W7hK9WmZBkIX+3Z49AJNEXZ6u7L20=;
        b=LWAD/C7B6FGjFsyajB5mNhz14abQHe2qf74/3fRoAhbRR/S/DK+c/S858UZ5mrNxay
         5wVI6lYkidu5bM5ahVvcF06i+BR1/cs+RyEbV/GKCm+phuu5a39QH1PAhKg4n4iIgOks
         MrTjY0vLcFMQtdJRxXJ1T4c6KHwakEZxkFf/tTGBnIDT3LqESiX2DcBsQW5qv4zdJDtV
         Ji6rVLDV4IgWMV/IWDH8CXtt37gimBMuHbTeMTTQFrBzi/6gBUbP9qMuix9g+jmMrD/9
         f6i4qBzESzL0Z+MaXWIPuM1jJcQVkEdpvB6Z8gx5Ba6LlQZTvl/QUWxqPYNt/GkRZH1E
         DJBg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@Nvidia.com header.s=selector2 header.b=enTKmrc3;
       arc=pass (i=1 spf=pass spfdomain=nvidia.com dmarc=pass fromdomain=nvidia.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=nvidia.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a9a33b89b8si18642085a.454.2024.09.06.11.55.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Sep 2024 11:55:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@Nvidia.com header.s=selector2 header.b=enTKmrc3;
       arc=pass (i=1 spf=pass spfdomain=nvidia.com dmarc=pass fromdomain=nvidia.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=nvidia.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sme7I-0004V9-2Z; Fri, 06 Sep 2024 14:55:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nicolinc@nvidia.com>)
 id 1sme7C-0004UE-EI; Fri, 06 Sep 2024 14:55:27 -0400
Received: from mail-dm6nam10on20625.outbound.protection.outlook.com
 ([2a01:111:f400:7e88::625]
 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nicolinc@nvidia.com>)
 id 1sme78-0001JT-Nf; Fri, 06 Sep 2024 14:55:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pSJNy2in4FYip/A1VqtqRGYqoFfL7mQr4dO/S6XEjH+ikezTClSZ7bzG3nt8Om0YorMz4hArOPeaiLpwOQh9YX2FjGuBkGCbyS9IVjSJZxXjhAIc2UL+sWNkHVB7IrcxA+m9SC6YLj7yA5nwblqk/YMP1aSawW7WATtUHUz3OQfE7F0RFBo/zPqan+7HJrsMfrx+Gy+L8OmygUr658PbRrI5xq3E7Zq7pjmUSZ8z1yjx+KlXPIN+jk/HW8EJ0tPhsyyZrJm4d6a/O4xqWIxg9sViN9/AKrMnH3rS12N+D9hTfLBQXBouaK9LUq7qgZYKkPFVsgF1tTGCunDHeETZRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TEutcluOSJOBQzLSnkCqcud17Kmdv89rV32zuZH4b0s=;
 b=vGyZFX6IHhKgh2rqNN+Yks5buV5JxpaHfq+Zulz+qUPFCbdd+qM8KPrxC/Dr2cFshHUmy6pRFFx5U6JEyHny37Cgl890WB68Jt+BFSyw59Y1DDyuxmeSMGc0LOstIRge6CFds4Vqjz7VkWrS7NMpKm9FVApt2ka67wCQ2TvRDIw/T5punQOWNfC77A+BREmkaa1u3trcrhqhtO4838N27p4MIXCVhpuSX8bZI+Fodo7KbQMimXxo+vhSJDiEuYNDZgdKJQB6GYr5z2L/ou9Js9yptnlP68i76Ap4uTfN4ndJ2QvfUpE9TfO0iASpGAXuIkHgjMzbhUK8ea1igi1WcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=google.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TEutcluOSJOBQzLSnkCqcud17Kmdv89rV32zuZH4b0s=;
 b=enTKmrc3+D3NzeXg3EP6OsKCVCRSsq+s8Lahh5J+ryXq1+5E8dp/vz9JBXuCyLAlerv7ksP4SnyWH57GmHCBQxC3vKjBGQFl1ucrAOyiXeqj+0pdbJ2cinCI5YopqWJjAucneq6ULTv6E3uaKdwwDLn5lduQLg8iI1kwQtPxiHFxgXuzrrRCSy3uZLi6309126c7FA/Xk7b9IyazE0Y1g3Bw2BMcMjdIgPa9JSad859Fj4MfrOnvmrRgEVZbPdrJJrokzVQPpz1VYDXMV4DyhYpJMeYAvthfdc8er3HJazQkSUn/B0Fe1piZ1JbDSKKXQXHZdQGBMFoV8LgupOUg4Q==
Received: from BY3PR05CA0035.namprd05.prod.outlook.com (2603:10b6:a03:39b::10)
 by PH7PR12MB7841.namprd12.prod.outlook.com (2603:10b6:510:273::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Fri, 6 Sep
 2024 18:54:52 +0000
Received: from SJ1PEPF00001CE6.namprd03.prod.outlook.com
 (2603:10b6:a03:39b:cafe::cb) by BY3PR05CA0035.outlook.office365.com
 (2603:10b6:a03:39b::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17 via Frontend
 Transport; Fri, 6 Sep 2024 18:54:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF00001CE6.mail.protection.outlook.com (10.167.242.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.13 via Frontend Transport; Fri, 6 Sep 2024 18:54:52 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 6 Sep 2024
 11:54:38 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 6 Sep 2024
 11:54:38 -0700
Received: from nvidia.com (10.127.8.10) by mail.nvidia.com (10.129.68.10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4 via Frontend
 Transport; Fri, 6 Sep 2024 11:54:35 -0700
Date: Fri, 6 Sep 2024 11:54:33 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Mostafa Saleh <smostafa@google.com>
CC: Eric Auger <eric.auger@redhat.com>, Shameerali Kolothum Thodi
 <shameerali.kolothum.thodi@huawei.com>, <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>, "Jason
 Gunthorpe" <jgg@nvidia.com>, Jean-Philippe Brucker
 <jean-philippe@linaro.org>, Moritz Fischer <mdf@kernel.org>, Michael Shavit
 <mshavit@google.com>, "Andrea Bolognani" <abologna@redhat.com>, "Michael S.
 Tsirkin" <mst@redhat.com>, "Peter Xu" <peterx@redhat.com>
Subject: Re: nested-smmuv3 topic, Sep 2024
Message-ID: <ZttP6WDbrjwG46HJ@nvidia.com>
References: <ZtlrLJzZqpnUrZQf@Asurada-Nvidia>
 <ZtrsjoCvwZFYFEjS@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZtrsjoCvwZFYFEjS@google.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE6:EE_|PH7PR12MB7841:EE_
X-MS-Office365-Filtering-Correlation-Id: a9f856bb-fe39-4710-01a9-08dccea563ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|7416014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VnVYK3BNbC9Oa09kaVkvdWxNZFl0NkxYVUZVTGVEdUpuZzR2WUIxZVlaMVFu?=
 =?utf-8?B?VmNYTkRKSUZOS3hGZTFxTDVWbzZWWXpWVzFxUjNYdzdVVUx5djh4bzRyay90?=
 =?utf-8?B?Ull3eHEvK01ZNlNnanRPRERPcmtUeXIvM2V6K3hZR0o0VnN1S2FMRXhkYU1y?=
 =?utf-8?B?eDUwbkdUeks4MkhacjdSdVJRMTIvdE9DN3lWeWFjZlhXeWlGbk5KbzRncUZM?=
 =?utf-8?B?N3dNWkRCeHBTVDRxSkhQbC9uQWJsYVBqSVo5N2d0ckhBNTN0T2ZNVzhVN0tl?=
 =?utf-8?B?eStIZ1dFeTVZQ0d0TVliMllla2s1RThLWlorWmV1b0FvRjArdFo5Z0ZkVERl?=
 =?utf-8?B?TEp4VDVIRm5yRjJqblpGWnN2Q0l5bVZzQWxEajg5OElRaVNCQWNydHdRSm9S?=
 =?utf-8?B?V0ZER1FOd3FtdWdDZVBTdWJuYWN1S0RtWGZzVEtzYXltL0RnelYyc1I2Zk1r?=
 =?utf-8?B?VkJ5SWFHWjAzWWI3bVpZOTNXMkFGN0h4TXU5MS9YM2RZdmdlWFUrUWV2cnhm?=
 =?utf-8?B?eHBVZ3g3S2dRZW5HaWtVMUJxOXJUaWlLZTg4WjYva2s3Qi9HdDErTEVzSkRi?=
 =?utf-8?B?OFFaUzRVQnl2eFR1dWlpNXpaNVFWNTF3LzJSOWhpbm5ROVZUelJIejRZUHVE?=
 =?utf-8?B?RkVFSUI1Yzl1c3g2dGFtQUs5TWJRNnpxVWNIZ0tscnFjRHV0c2hXSHdhZHFQ?=
 =?utf-8?B?YzJqNWNMTXFJRE9UOFpLMnY0NGZYbDBpemsvS2I1M3dSdTUzdmhsd3d0azJj?=
 =?utf-8?B?Y0tGdTJpWDBHN2svV1QvTE9COTlJRkpYdnNDckJZd25XTkZ2V0RkSnIzN3pB?=
 =?utf-8?B?QjJIcW0ybzhFTUFOTUZqVEw3UEVmY0dSZ0MrN1NwNFNFcTNKYW91dEdIbnpQ?=
 =?utf-8?B?WmhLT09XMm5WN1hUNUNvbXZsN2ZFY0t0dnRyWGFWUlVFNHJLZHF5ZzdpUGdP?=
 =?utf-8?B?WVJaWHBUTVJZVUhaVnpBLytxNllHT0dHaENXRDdmRGJPN2t2SUVrOU5ZV01q?=
 =?utf-8?B?YlZ2N1NPaXBObFozdC9GUFZlcnNHT0JYdFF6ZUFtKzdCb3RvNm82Mmx2UGg0?=
 =?utf-8?B?eVlQVnE0QmhZMExZRGtmZjZ3S0RxeWYwcDl5aE11dkVUTWpETU1LaklxSmJp?=
 =?utf-8?B?aW5DaVNQNXk1Q0dEQnRtd2JRMEEybC9Gc0tDRVA2L0dzeFV1bmxURjhkZDhR?=
 =?utf-8?B?a1hVNmFQbFVsV0dYWlBXdVBQVUVZQndiVllVMDZKdm5ySzVveUp6SXFKSXFP?=
 =?utf-8?B?N2RDTTRwZVczb1Y3S2JLZ1RicTFORXczV0h3cmhwa3AxR2dVNmhoR1lXK2Zk?=
 =?utf-8?B?dUNtV3FhcU8rM1JXWm1XVmsvU0I5QVgwODR1VmJrQnVpSTlOdHovUTlkamx6?=
 =?utf-8?B?cnI4VlEzbFdGWGVBN0k3S3JZc2thYXRvUFhCUHZzcUpGZW15b3A3eE5sZ1NZ?=
 =?utf-8?B?eFNQNkFaK2Jqb3doR2taczZSQTNHM1JjeFE0Q1NjVm42SkUzQUhDdHJOL1po?=
 =?utf-8?B?cEpWY2F6ZEN6MWdYMCtheFFvNFlyUGFzYlNmRVN6dXdDWm4vdHdRWHBQOFpv?=
 =?utf-8?B?NzBxMU9lLzVIZVV3ZXFmT2ZKMVFpNHlCRW5xRDVnRVpCYno2R1JYVlJjM0lp?=
 =?utf-8?B?S0ErUDFqT1cyVGFQcVBOdmVqZHY2Y0NnS0t5ZXl0TSs3Z2doTWlNVE13YWNF?=
 =?utf-8?B?ZGJNUTJFcVZuWHl2clNCK1JRZndiU29ld3YyR0RxNVdpL3BQM24xeFpJa3RH?=
 =?utf-8?B?MGMvZDZINXRZVmdKbGdEbHNxT2dNZ0NXbHpsVmY0bUpYUnNOSHJScUZoOEx4?=
 =?utf-8?B?S3UvQjZCSTNnVFVnYXBxYllXbDY5bkVuYkg1SnRYTENnemNZK0pwRTVvZWRl?=
 =?utf-8?B?aENXTnpobXhDZW9vSUVITlQ4Mzd4Z3RSZGxtTGkxejVKRFlyTXR3MysxOTZ0?=
 =?utf-8?Q?/N9o4LSOHhAqP2a4Eqb+X9pfRvA087QV?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(7416014)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 18:54:52.0636 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a9f856bb-fe39-4710-01a9-08dccea563ec
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7841
Received-SPF: softfail client-ip=2a01:111:f400:7e88::625;
 envelope-from=nicolinc@nvidia.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.142,
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
X-TUID: QGcF0lhvWnN6

Hi Mostafa,

On Fri, Sep 06, 2024 at 11:50:38AM +0000, Mostafa Saleh wrote:

> > <-- Help Needed --->
> > So, I'm wondering if anyone(s) might have some extra bandwidth in
> > the following months helping these two tasks, either of which can
> > be a standalone project I think.
> 
> I don’t have plans to work on qemu in the next months, most of my
> upstream focus will be on pKVM SMMUv3 support[1] in Linux which might
> overlap with some of the vSMMU work but in the kernel side.

Oh, that's a big work. I'll keep that under my radar.

> Otherwise, I’d be happy to review patches.

That'd be helpful indeed!

Thanks
Nicolin
