Received: by 2002:a17:505:57c2:b0:1be9:327d:8ee3 with SMTP id yd2csp410332njb;
        Fri, 13 Dec 2024 04:47:30 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCVLNeo/q4yFqLUtdO4YonndYZWXnu+G9ZuUkWjyyZY4XpYn+nzzZR4vja12Gu0Tj+NuWy1UMXCzo5YykA==@linaro.org
X-Google-Smtp-Source: AGHT+IEOwfT5aJLn4as7UtYB1p0+aO41WqstTWKeGEvflrY4ouxAoHMoCdsXNGNrjRidFbMDfo+H
X-Received: by 2002:a05:6402:4584:b0:5d0:ea4f:972f with SMTP id 4fb4d7f45d1cf-5d63c318beemr5480647a12.8.1734094049880;
        Fri, 13 Dec 2024 04:47:29 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1734094049; cv=pass;
        d=google.com; s=arc-20240605;
        b=fPzgrY0qvZ3UHMrvUSJSjdhEEBx1JCe6WvUqgB5GRdKQTKr/Af5xCtN64KOOZD+eUa
         Lh7JdXX0Hbj6mlPOZZOa4ZOjTqTUl3pgvIrc67a2eZPWBI6I7MM3yu3JEgxg0S2Wv78A
         tyiV0acWqk7E0JeIKjW/uT+aSFDwF1qvUXrXE8gnKO7PUWMdIAplMXUOSZGN09SvkPjW
         Mj1GBz0kTAQ4CQjoeZt8NGL6swqJN66JzB77JODlZOEdgytHjJ0zXgizS6WoSO/8vhUb
         R178IOmLs1uorzaPflK8JGgDhgDPIGblc2wQiHdOo3sgLMeRwgn9PR0l/I35/0h7rcUx
         tzQg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:in-reply-to
         :content-transfer-encoding:content-disposition:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=/gMENy0OlGDL4NWR+U1NLFg2vvmBCFE1YJu7APXIr4Y=;
        fh=0IUiDdIqHKh25zGNx4+H7xMkKO83Mkgj1whOslbw6nA=;
        b=OxI2HYt6+QlC2TKJToxCsX+bhooyM7fAj4EBK30828iMHmVgqeFZVDxMbjdA/HWSkc
         83I1en3uOidcwObKvV2J36vnBfIKu/zWOusnvYtW9r+6Ft6q7Ay0T+FK+MO6fwz3GtzP
         I70CehTFgiGUAwGA6ybwuNSXqEjdKnAQ3AiLZxUNjQ1ettHXSJwZP284M7A0ZvCDFSX0
         NLTo0jIn3Tx4JW7gWqIsDGfEfTyF5yLPCC8LvvvmD5VlxDgdWi4Mh+tWfD43kvnCbdMf
         VjZlun2t34Z7EAXDj09B/9hqAEQ1wdeQGPGan9CyiPMvJhcLqSt+Xm4ZBMOo41jdMSxQ
         xOkA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@Nvidia.com header.s=selector2 header.b=ZS5bp+k9;
       arc=pass (i=1 spf=pass spfdomain=nvidia.com dkim=pass dkdomain=nvidia.com dmarc=pass fromdomain=nvidia.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=nvidia.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 4fb4d7f45d1cf-5d158c4e2a7si13128502a12.428.2024.12.13.04.47.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Dec 2024 04:47:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@Nvidia.com header.s=selector2 header.b=ZS5bp+k9;
       arc=pass (i=1 spf=pass spfdomain=nvidia.com dkim=pass dkdomain=nvidia.com dmarc=pass fromdomain=nvidia.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=nvidia.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tM54V-0004nY-Kl; Fri, 13 Dec 2024 07:47:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgg@nvidia.com>)
 id 1tM54I-0004mu-Hx; Fri, 13 Dec 2024 07:46:56 -0500
Received: from mail-dm3nam02on20604.outbound.protection.outlook.com
 ([2a01:111:f403:2405::604]
 helo=NAM02-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgg@nvidia.com>)
 id 1tM54G-0000Zu-8p; Fri, 13 Dec 2024 07:46:53 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UCM9ZEA++RZ+6UKcALg36XiL/HI4G7wTll86Eyq6FyhieJbGrJqNH7Y5NAOu5AdVTx9WWbKJSCcCqBanKBc8uul/q2h9bPmBnIjvQVzJQC4uXWjSHP1fuUP0YiY9wRaVvp9RGM8CsiDwuKrjvV7GxXuZcMeK5dB2GTOnBjFLWh5rLg4ym0l5/VYkRccLg/75x3DF+GL84tCVgtmU009SV6MEVDPEh7mT9iua5s6pu9gzt5PjZWG4+KhCcuxcnvDKJDffMyERvh2eUxQ8IrbiWilblJ9HD7pAplKgVBSFVHHyGODJKQv+X7K2o9WSDnxEU7FxaF/VCq5x0E8BIlnbsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/gMENy0OlGDL4NWR+U1NLFg2vvmBCFE1YJu7APXIr4Y=;
 b=WJlgoyCbTZ2XoOW7/yi2cCjjE+HgGmLeIwAZNNwJdu619fGrS8XZb2SRU/WO+IIt/eI4Tx8wpFXI9R43aBIpN3n0WeVyLNfrYshAzm1t5mSK4SnbERm1yc3LHodjwFKaDlMVBQwGrg4Jw3Gy7wTTas+sD0uZz9clf3kdgtp3xvT0yhANc+8pxr/Tu0zrsATAtwAgsHKECklKvtMKRssPitYieLb3oQVXFnpn785Yid4ccsvW1VVl2BVOZtomfR2L7SsVgD671Kv69ZtAQRYeBqyjgPl6Am424TUP4vLcjs4n57JAbozIkhmeYwEHURUV2leufHRz5FN++Rj4yi16bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/gMENy0OlGDL4NWR+U1NLFg2vvmBCFE1YJu7APXIr4Y=;
 b=ZS5bp+k9Tt6asVeCJ3NRGP1wR88uuuxxORMUlaewFa6R3mkZcX5PPKE7XyDvfkGVPoAsvDHWdYOMu+Wr9U5fL9Pn8z8PKAVdFj06lveJCUH0mjxwjWq+TYGKi4YCAFmryOnvQRr9+gp/jKc2d3q2rTKOCW9/bDn3Ah1580zUSfAUyv5+qAnX5EOXHt7SSn2YfqbIgBQofKMvPZHyxNMeW0SGWLx3UZQF48UZGoI5wcgjZMSOHr4DkOvBaSbMLv0Zao6raOXSiieSGpaLRbAIPqKmGli3xC9WePWAaHQv7f8F2yw61JPXx6d/oZU5zKyJ2+plyVfBJKcC2+eVL0uLFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by PH8PR12MB7028.namprd12.prod.outlook.com (2603:10b6:510:1bf::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Fri, 13 Dec
 2024 12:46:44 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%5]) with mapi id 15.20.8251.008; Fri, 13 Dec 2024
 12:46:44 +0000
Date: Fri, 13 Dec 2024 08:46:42 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, eric.auger@redhat.com,
 peter.maydell@linaro.org, nicolinc@nvidia.com, ddutile@redhat.com,
 linuxarm@huawei.com, wangzhou1@hisilicon.com,
 jiangkunkun@huawei.com, jonathan.cameron@huawei.com,
 zhangfei.gao@linaro.org
Subject: Re: [RFC PATCH 0/5] hw/arm/virt: Add support for user-creatable
 nested SMMUv3
Message-ID: <Z1wsslDnwlth3A8+@nvidia.com>
References: <20241108125242.60136-1-shameerali.kolothum.thodi@huawei.com>
 <Z1wh69_gZ9izr1iU@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z1wh69_gZ9izr1iU@redhat.com>
X-ClientProxiedBy: YQBPR01CA0166.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:7e::28) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|PH8PR12MB7028:EE_
X-MS-Office365-Filtering-Correlation-Id: 39f82907-286f-4c9e-b73a-08dd1b7432f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QW1VcXVVTVpBQXFRVi9VK2xzUEhLOVkyaXZRS3c2MHZtNjZXdEdabXlDNHFX?=
 =?utf-8?B?Tktpc2xKZHZZd1dXa0dZYnNsaGhPUVRjRjlXQXZyak1xZm1iMi9vY3Jja1c2?=
 =?utf-8?B?OVJWMUFuMzlqTDhFSTVsSDZnNUlQektGZG5uT29Pa0IyQ045NU5FMXhJODFB?=
 =?utf-8?B?cEZ0dXc3SCtKRWNTdkhSY0NuZEZxZ3lva293TTJkYXg4VWhHWGlUa04xTWVs?=
 =?utf-8?B?TXF5TkczanRubUlGS1VnNEpZMStTUHJpMEVnbDB6aWRLQ1RPcCtRdEU3OVVq?=
 =?utf-8?B?SmxvK1o5VGZnTVc4VWZuVndraVZGRjk4VnhIOHFnY0JxNU1FRlR0WVJXN0xa?=
 =?utf-8?B?SDZ2ckE5WThkR0dPVHNPcTVWSnlrK1RseXhPTGZuMWpEU2lJRndreE1laG9G?=
 =?utf-8?B?cUNzNlZQcFZFRUpGTXRwVzBGTWR2MzNCOEoydXgzc2lNYnphRWEzc0YwbnBC?=
 =?utf-8?B?aTJqQXZQMjVFVStneUxKOHQvcG5NbXVxTW1XRFUrbHhTSm0yanJJVEJoVVh2?=
 =?utf-8?B?RjZYSElySWJmSkEyQW1VdkNLMjIwNklnV0Vud3NIWk1vdS9WSjNlSENGa3A0?=
 =?utf-8?B?cEpUUGNzcm1IWHRYTXJpUGV0c2xWUHhmeHhiK1kzU0JMRm05dkdkdmhCa05n?=
 =?utf-8?B?QUNTRHlSRHlXMlh6U1FKMU1TWllzYVV6alA4cEc1emtBVDlSWDlxWFZFZ0Ux?=
 =?utf-8?B?aU12MXRsVEUrVWVlMDhTYVRvckVjYTdLb1F4UzFKTE14RGs1RTNtK2JOVU55?=
 =?utf-8?B?STB1WGFzS29SNVFFN3pRQ0ZaUTBFTGtXOEVyTTVOR0daQ3FSNjZlcHNFR0Vu?=
 =?utf-8?B?eFk4Y1NpQmY5eW1EUG5iWHRkNzFzdGpZbnZUL0c1MWN6ZHJYYjZxK1NYK2t6?=
 =?utf-8?B?dGFiMVMva1gvSUNReTdhMWVHc01wZ0llWTFtVnJSb0lzZ1hYRy9wQ1BBN1Va?=
 =?utf-8?B?V2M3b285RUl0Z2hnS1ZUL2lzMy9wOWQvZnlrYkFxVWJsWWtWbzR1aHRvei9h?=
 =?utf-8?B?WmIvOU9hZW1WUk5KenZsUWpydVVtUUI5VmxKOGNXMmpJT0srY1NIQmxGMVdz?=
 =?utf-8?B?NktaUHN1REZKNnh4bW1mdDRkOEROQkE3UksrVDNvZ0gzNHJ3MlZzQ1ErS1JP?=
 =?utf-8?B?dW9KeU9HSk1hbU0vT2UySmRFWGxsUnJCRUFmdmk4cFgzZnFNY2VFTVN2eko4?=
 =?utf-8?B?RTkyUENpTDFSOFdYQ0g5M0M0WHdRSis4MWNKQVJMY2xaZEVUQ1FRU1F4Z3Bw?=
 =?utf-8?B?YVBvRmVvcjVqY2dkNzJmWGVnZlhIQ3h5RVhvcExSRGJLcVVVR3lIeW9VNWQ2?=
 =?utf-8?B?c0p6YTVTVGdhZ1Ewb2dtRHpoMDlRTjNBSVBQU1hqTlpyZVpQTkZkdS82T2Zn?=
 =?utf-8?B?MC81dFdXODAwb3dvbndKV0FZNHNEMGhQTzh2MVFNMmR0WmxJbGxmb1lrbml4?=
 =?utf-8?B?WXlFakdNdlFMQTZPUzY3cWRLQU1wTnRGbEdBakxQWDlXeUpxMkE2ZmdoaC9C?=
 =?utf-8?B?Vys0WWIrNzRDOXQ4WGJ4ZVJsNlc3dFNNZ05MQXNJM2pIcmlaSW0zeDV6T3dp?=
 =?utf-8?B?aWZ1M2ZWS3RFN3hneTJ4RmlKMTYwN2FoT2VXOTRNR21vRENQaUNSemdIRkJq?=
 =?utf-8?B?Y3B3S3BTQUNTSEowMzJsdHcxV1hpUVhKRFpvKzE0ZTZaTmtLdTZVRTBnT3hy?=
 =?utf-8?B?dU1wK3EyUjhkdFcwZDkxL1B1d1RHWTVabFVLem1uaW1kc3F1SXg2SUpSQWk0?=
 =?utf-8?B?ekcrTjFoak1QUlIyamtBQjlrQWtwNVN5Vm5HSEhFZEI3ZkZpd1BXa2hKczdk?=
 =?utf-8?B?V2Z4ckNpYXB4YUo4RVFHZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cExNckhmZXRwTm8wNjVYRldsY3RBYkg2SVgxUXoxMmV6MjdsbDk3M1BZNm9G?=
 =?utf-8?B?UDRvQ2ptanM3bUM0V1dMWVlCd09PM2doZzFYOGhEUFg2QTBlbEVyeVhod2VP?=
 =?utf-8?B?alNCWU9PTlJyQm5sV3pveVRyMis4NUJuYXE0ZEI5V050TXErMXdsUnNCcGNS?=
 =?utf-8?B?by96OUxLdGFUYWM4NnlhU1I1cHhEQ2R1Y1l0WnFoRXJCR2hkbkJCWExlL1dG?=
 =?utf-8?B?VEt0U0RsdTkwaVI2Z3BFY2tRWmF6UUtVQm9aL3lOYVIzSlQ2L084LzNxMG43?=
 =?utf-8?B?SnBqYlI2dGpCQzk4ei9Pb2xmWG1WL0duRThndjBhNno4akZOQVpGc1U3V3Jh?=
 =?utf-8?B?UHB5NUlDWlpCKytudE53RURaZ0lJWkNKYmZoeGJXdm5xMm5BenZGb3plV2VG?=
 =?utf-8?B?Qmh2aXloMm5OTVdXSDBBenZkd3dTMGZqaEh1aEZ2SUZXKzJKVDFRSXBtQUlP?=
 =?utf-8?B?VHNjYXE5YXdGVDF0d3NBaldxU0pmSTlQMjRlYS9oNnZBQ2RKQWZoTkFqSlE1?=
 =?utf-8?B?VmUyaVcxYmU1NWY3bnV5SjZGWCt1Q3JGNkxYZGFIU2hJK0xDd25RbVBpOFpQ?=
 =?utf-8?B?UnoxblZlV2ZXeFozbGFha0ZGR3R1S042Ykh2WmU4N3RHNm9TTHd0TDZacTVL?=
 =?utf-8?B?ZFd4RWd3UnNISkhxQ3ZRVjNJZWhDeUhyL0tZK2oxTWJxenRSWmYxc0VJUE9M?=
 =?utf-8?B?RFByaExNMzkrbkw3cWpEZWlQSTNRNFJWZC9YVDVTQmNuRFJFMks5YmtOeDRL?=
 =?utf-8?B?NldYeFViMXhpQ0Q1L0NFQUR0clZOaVNHdWE0YXBKOWd0UDlDZ0VGWGJkRi80?=
 =?utf-8?B?dEEzM3FtNnNLNnMycGwvOVJ1dG1yaE1mbWVnQkVWejRoaU80VFdJQ3NrR0hE?=
 =?utf-8?B?dGJWcGxraWduZUhZQUJiK0NEMnFrdkJVRGxaamc2NXBjOEdOK0VHM2pVS0sz?=
 =?utf-8?B?MjNzRlRjV2RyQmZUd3FEOWw2TGxDaUFPMnIxUEdmQzZkVzluNlRFTjY1TlRN?=
 =?utf-8?B?QjA2elVZakZXOHVKalo0SGdkQ2lOclc4VzAxbFB2bWdSOGpRUThnN0dMWTF6?=
 =?utf-8?B?SjdVZEY4YXZlTGhERllGZWJkZ01mYmhtaFpKQkpGd3JwYjFqZ3Nsd1hFMlpt?=
 =?utf-8?B?TXlwZjhuSXFiQUZWTG5FcUo0NTV3b3dBT1g4SmdySHNSSldBN2E0bEQxMUxB?=
 =?utf-8?B?Y2NiNG9XWnpkMWV2NjFWbVFsY0tkcFk1WU1nR3NYdi9PV21pS1pYTDJCU3Fu?=
 =?utf-8?B?MWJxVHpYRGJNS1FPbS8zdEMyUE01WDNaQ210elZJYUZLR0g2SGdzc1ZBaS9G?=
 =?utf-8?B?Z09VaDAxNEo2aGQwQWJoU2hzR1N1b1BUUnZ5QzZLaGNQWGQxOGgxeWFxUVhZ?=
 =?utf-8?B?YlhOMUhDekJVYXBpc0dSSThLYTRzb2h6VjR2anBDYUhpaGRjRE9SWXdaS1Fp?=
 =?utf-8?B?MURreUJUbmRrMHQ1LzNaR3c3Q3J2UHFUUkpkdjdmKzUvbnFTaDArRTVWUE82?=
 =?utf-8?B?Vk1FRnQ3TUxINkxrRndXd3o3UjNyT1FiNStROGFhbjJXbGZCQmx4dW80d3hU?=
 =?utf-8?B?WnpUektJTVN4Y3h5MklLaTBNSjlJV29pQnFTYVh3RUtDYlJvRXlLRS83K2kv?=
 =?utf-8?B?Z3NlUkI0U2ZzNWVhZU0wclorSUpOMHlJcUxqSG1sY21vRDZLWmp1cmVrTlFq?=
 =?utf-8?B?NGpCd0l5OVVBQTNjeUdIUDVjUldwTm1LSjFjSHJPL1dnRkJVNld3QlhlNnBJ?=
 =?utf-8?B?T1RBMXNVSlhWRUg2OGpwVVRIS01FNTZPbFZ2NVVwYVRxSDN4c3JxdysvRllX?=
 =?utf-8?B?NzVjNFNodnIrWEtWc1llOFVTUmhZdFllUFI2cE5SSzdmRFliNUxRRW9YcUdv?=
 =?utf-8?B?MStXcjJiK0MrSWFUNFRzVHlVM21yWUVjRERuUnJ0VTVZcnBBL0kxWjg2a0ox?=
 =?utf-8?B?cnpUUlpvOWdkWFJIVUx0MGQ4WmxNeUpOVjBGNE9vTFhuTlJFQTdDbDIwQ1J3?=
 =?utf-8?B?YmVVQXQ1U2EwRVVVZWVkWWZ5R3ltOEhQUHFMeWVNN1pSSkxKQW1EdVZjazRP?=
 =?utf-8?B?TUU1cjBOV2o2QVpWd25yY1ZiWll2elcrV1E3TCtSTC9BYXVxUGxZampmeld1?=
 =?utf-8?Q?6tORxdOEU3BohOusGfIfYt8EW?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39f82907-286f-4c9e-b73a-08dd1b7432f5
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2024 12:46:44.3133 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NwPUO9jf+xZ+uwDpqv7x9fNx6DMhAIaDSOCUqkOXZlw58yXWbzETb4WHLPGEAjm3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7028
Received-SPF: softfail client-ip=2a01:111:f403:2405::604;
 envelope-from=jgg@nvidia.com;
 helo=NAM02-DM3-obe.outbound.protection.outlook.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.495,
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
X-TUID: P6HGnv7iuvls

On Fri, Dec 13, 2024 at 12:00:43PM +0000, Daniel P. Berrangé wrote:
> On Fri, Nov 08, 2024 at 12:52:37PM +0000, Shameer Kolothum via wrote:
> > Hi,
> > 
> > This series adds initial support for a user-creatable "arm-smmuv3-nested"
> > device to Qemu. At present the Qemu ARM SMMUv3 emulation is per machine
> > and cannot support multiple SMMUv3s.
> > 
> > In order to support vfio-pci dev assignment with vSMMUv3, the physical
> > SMMUv3 has to be configured in nested mode. Having a pluggable
> > "arm-smmuv3-nested" device enables us to have multiple vSMMUv3 for Guests
> > running on a host with multiple physical SMMUv3s. A few benefits of doing
> > this are,
> 
> I'm not very familiar with arm, but from this description I'm not
> really seeing how "nesting" is involved here. You're only talking
> about the host and 1 L1 guest, no L2 guest.

nesting is the term the iommu side is using to refer to the 2
dimensional paging, ie a guest page table on top of a hypervisor page
table.

Nothing to do with vm nesting.
 
> Also what is the relation between the physical SMMUv3 and the guest
> SMMUv3 that's referenced ? Is this in fact some form of host device
> passthrough rather than nesting ?

It is an acceeleration feature, the iommu HW does more work instead of
the software emulating things. Similar to how the 2d paging option in
KVM is an acceleration feature.

All of the iommu series on vfio are creating paravirtualized iommu
models inside the VM. They access various levels of HW acceleration to
speed up the paravirtualization.

Jason
