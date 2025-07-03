Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp586114dyc;
        Thu, 3 Jul 2025 07:44:22 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCWexf54zgMWYuXbRupV5cwTxh76vk1JRqYxOPXzsqK1vZbxQn2Cf5TljTz67/5iurFxfcQBt4teILiGNQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFsnSxEXdTyuaZaThDgvZBrEdjN5vcq5okdcrpj7dKiLN2RfzHqhQVnx8eKJi6ufilS29VZ
X-Received: by 2002:a05:620a:280d:b0:7d3:f0a0:ea5f with SMTP id af79cd13be357-7d5d13f3399mr653276385a.22.1751553862703;
        Thu, 03 Jul 2025 07:44:22 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1751553862; cv=pass;
        d=google.com; s=arc-20240605;
        b=B5omki43gaW6fE8h016LetbwHyil7PN6zky72HwA0kNKxWipaaB6fwbWy11Cpvh2xQ
         hs4ZvE8aNbDjDEkhbwevptq1/A0M+ri8HI1dRCnK6jEXS8zUEYFc15UVP3Gz1TihfpHm
         B5QW64wuFSPa0Z2838K5e9mMTlN4kQYDGt7QKPo7YbWVkiKxC/zxypbxznl6gq7Rky1n
         blXUIh7VSQot21DY/2ov4K1pKGIFZN4oQJJXu0lKh9W8a5NBfYg5H/ZPuS4BfQ4qAJye
         Je4lwcEQzZ5Djje+vIy9VthhxmzauRYLQkNtto/AoIJ+66J7KZofQ3e/6BRiIOZcY/QH
         NpNw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:references:in-reply-to:message-id:date
         :subject:cc:to:from:dkim-signature;
        bh=rcH1E2ZK9pMDGZzdHyVZF+vURoJ31zRQbSlMRo/QOd8=;
        fh=hW/bqFFTfjXv4sxqjwCrIg9MyDPwTe3qPKGLExKRIuo=;
        b=kP7gRIxOWEO7zwjzBNk09SXPiLlKNx0ga8Ui86q+lGrwAeK7VqLHCvhCqe9xa7eVPb
         A3uPMWhEzhitZunSCL6aXzZ5fLfN2YvGpLKjkFJ6jckupKVxsZDuz1JrL87x32yhdn9p
         /BsZD1xkV9ZIplb2vyTmVgouBsc6osOikdAEbGgZf73XGBjXgI7+bsilCpHpR4lsKV6V
         wgmaVOiJp8qDkqr/lrdLIVAKh7Kxh3j7bdmu7iE9vMnTzL18Ay5QWaCZLXMFVRUe+zpI
         e1CE0eW+taQ8OOZImStMM6f2FQy3kSIiIk34QMcDhKd41OAT8J1FwrFIk33xV2eJiIEu
         sjvw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@Nvidia.com header.s=selector2 header.b=oEJXpjR3;
       arc=pass (i=1 spf=pass spfdomain=nvidia.com dkim=pass dkdomain=nvidia.com dmarc=pass fromdomain=nvidia.com);
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=nvidia.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d44327f91csi1516855385a.494.2025.07.03.07.44.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Jul 2025 07:44:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@Nvidia.com header.s=selector2 header.b=oEJXpjR3;
       arc=pass (i=1 spf=pass spfdomain=nvidia.com dkim=pass dkdomain=nvidia.com dmarc=pass fromdomain=nvidia.com);
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=nvidia.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uXL9Z-0003EB-A8; Thu, 03 Jul 2025 10:43:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <etanous@nvidia.com>)
 id 1uXL9V-0003Cu-R9; Thu, 03 Jul 2025 10:43:06 -0400
Received: from mail-bn8nam11on2060a.outbound.protection.outlook.com
 ([2a01:111:f403:2414::60a]
 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <etanous@nvidia.com>)
 id 1uXL9T-0004DF-O9; Thu, 03 Jul 2025 10:43:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=goKXY2JHQEc1omAEQdkLZRC0dPoGsI7m/hm+DNWI/xwW5aWlPokqBsTzhmKtX9/nFiABL1tdMEc1jRr/Vk5Gl7eXJ14fWth9PjgK++c7wv8md/E6KG4kvyrjnnn7G0G3GG3FJjEi3RpAwv0nH1nl1ROXmUKwKHpQjmg3LCsunTnMC9LnPDVjkhyZZRvDMJR0x9yiOrNlNGQJbTbZb9OhTPrZF1PfqSOD2MPaWR7MiFO00ECN4T35KuCuOA5lvbLpvn3d1EVojqrUyFpCy/z/F48rh3XA+/nIpxpexA6YcxJAn1xITo2V1e1OG8Cv+4EW0p9o3FKSfpKj7HIbnJ74GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rcH1E2ZK9pMDGZzdHyVZF+vURoJ31zRQbSlMRo/QOd8=;
 b=aXfb1bHqJKQfS9AKiMJ81OCgkdYcOFNwe3uuzdVnf5KoZcJ8Fc/Rb0u40QsJieaBw4pmgRqExWsH6MkPy5wk7ISsA4iHFMaKB4zqFjAxo+1n8qsmU6HihAMBsz+TVa4J/gScoo1Jad8yZBl6+xFNuo9M0Vd0nlbbS5J3huS66NzS22cDb+4mrnC+9Lsw+IAI7F4qeq8fV8H91qY+vvBTAJXW/zy4Co+8OT/MXa/fEVp0hP4k8xiRNEArK28FDwWzO5XLH7GZ8ypMOikgu/q2MuiN/frdZswuDfkshbP3lgr8byhwW4jwAcL81/6W2b32MvYiQsnZj8MfL4Ng9F3uNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rcH1E2ZK9pMDGZzdHyVZF+vURoJ31zRQbSlMRo/QOd8=;
 b=oEJXpjR3s0sBAGyrhOeOT4NkVzGyVsz3p9dIaRY9DbFjFI8lfCmWlLLiu/ELuIqkm6Xroqwk4wTKrU5jVNjSvICOMbXukKo9H2FKa96xqL2qdm/PBDsy8zVhokMApfxw0zzzucP+dpJffTcDXDGRjwz8hUczDmRisbyQGCQsMElrDbI84AkANmygxOrpaLnShX7ugEXHuDknsZI4wi4OAb4OlvV5tyUbboezKhQxlOOG7o8T9fYjR95H2VKBvm0JniXnVsON4L359OOztr8F4GMl39FWBk1fxEZsREeG2hfYjaRh3i4nXcLlASe4Ssp6qdzMjWQ8W4xmicPoCu6/VQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB4277.namprd12.prod.outlook.com (2603:10b6:610:ae::23)
 by SN7PR12MB7836.namprd12.prod.outlook.com (2603:10b6:806:34e::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.19; Thu, 3 Jul
 2025 14:42:54 +0000
Received: from CH2PR12MB4277.namprd12.prod.outlook.com
 ([fe80::8857:98e9:8b64:787]) by CH2PR12MB4277.namprd12.prod.outlook.com
 ([fe80::8857:98e9:8b64:787%4]) with mapi id 15.20.8880.021; Thu, 3 Jul 2025
 14:42:54 +0000
From: Ed Tanous <etanous@nvidia.com>
To: qemu-devel@nongnu.org
Cc: Troy Lee <leetroy@gmail.com>, Steven Lee <steven_lee@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Ed Tanous <etanous@nvidia.com>
Subject: [PATCH v2 1/4] hw/arm/aspeed: Add second SPI chip to Aspeed model
Date: Thu,  3 Jul 2025 07:42:46 -0700
Message-ID: <20250703144249.3348879-2-etanous@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250703144249.3348879-1-etanous@nvidia.com>
References: <20250703144249.3348879-1-etanous@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0056.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::31) To CH2PR12MB4277.namprd12.prod.outlook.com
 (2603:10b6:610:ae::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB4277:EE_|SN7PR12MB7836:EE_
X-MS-Office365-Filtering-Correlation-Id: 38bbf357-9c05-40dc-57e6-08ddba3fe4a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fvacXHFwfETNyHl30j0LdRQtZ1bIbhsarGkkYfFQuXY0sWkUuGUgmlZ9rjQg?=
 =?us-ascii?Q?T4oa/qp7GbOe1+DwsBEhI8AdHuo5nEfw+X7013TpwWdyAKAtf3rhcRBweFXN?=
 =?us-ascii?Q?BpFliUdexQJuxOYrX+zpb7asE31ecuaHbiN6azf3SIZoH4NwonJpsdyGT8v5?=
 =?us-ascii?Q?2vPBMKq3i9ADq0RzelrkG8gVXlQJqYp/wVrMLWKBqNI80icMfT2IwrFIKWBY?=
 =?us-ascii?Q?47O3DaK3azt03X6QZSiMM7oDjKjAk7MHjo+T8bb7dUOivKTiGBe7kfcb5r6G?=
 =?us-ascii?Q?tsRdlKVuI89ohQlce7YBfHMsC4nsetfesltly3Xf08zzCU92XQY+asY+XCX3?=
 =?us-ascii?Q?uAi9lcEKsvY8ioBgEWGwoREUSMakUZPY834MgaSW/ECH0MjbraAwrBqeW4Mx?=
 =?us-ascii?Q?/6ss32WBjZK7y+devD+nBQPdiX/77lJDcNpltXZwuQ1M1MHIacAr1gE0JrZI?=
 =?us-ascii?Q?8AzxIqrof54ve/Wl5j2hESCKa7V3vmdE5hJDcrCo8zKMbUWCWxZCsfLcqeRD?=
 =?us-ascii?Q?iq3dXb2ZlW2ZG8wrGg/SJhkF75jZ/vSOYxNAxS2TepfKBt0BjgVEz4ibrx1Y?=
 =?us-ascii?Q?q7p6Iii0Ta85TXFe9AgN8WPxxN+nDfXan8Cd5pFE3aagq81s8ayKS39VF5q8?=
 =?us-ascii?Q?USsYijUsdB+oSjWt25tjRhYmJNghv+W5C/J61RQZYq5gn0YDpj3vo5ut4DLs?=
 =?us-ascii?Q?mU2k86p+ykTVe4Bqqay5QkVZhkZCuFnKmx6HkFbZWrqQPJpvYhQ3ok+XzaPD?=
 =?us-ascii?Q?N8nuuhVk3byXqjImIGut9lZFJImtI8pLIGzKwMTIt0Ua/TBuURhtfxJGqSb8?=
 =?us-ascii?Q?YiHErr1ppMwavOQIPyncK3hfso7fUFbGY2zw/FMB6qLQ0rSW/pMVeLg1iO3q?=
 =?us-ascii?Q?SKr4M13RTLn7pSEwoN7+392sYijCABxVYcaY3DH6PQ1hE2Ng4rYvmFKmbqe2?=
 =?us-ascii?Q?x/mnrwNKLMRhBdZFDHTTrF68pdbgxsPhS1v/Vk/gaMy2QHp4A4CvM8gzaKWD?=
 =?us-ascii?Q?N920W+S0IBy63KGKTKvwmbC7P8POeRGdodvLIhEGmM/8ufuKaVpXP992gVMW?=
 =?us-ascii?Q?+wgYa6UyqeDB9XpiBbcefA5XM6HmZODVD1QM1XtCKIro5bP7wfESJCymeYTv?=
 =?us-ascii?Q?8Ik/BJ2eG57VAkLJSPG6INNPh4OJvVfWzQURdFm5Jz9FaJk06D1uBMDsQIhU?=
 =?us-ascii?Q?7XDSGh0f81t+y3KE9XtGVi0S8xKdVRFCYceRBDaPNdAQPYb3TyEHFi9GAnHh?=
 =?us-ascii?Q?o5JeP15+zvavR1OgX3BG0yIuJLksUvVGdxZNUkklcpNbkYGv6bOv4Hema4Ta?=
 =?us-ascii?Q?MBdC9+3Bwgqx6r7kuqydghpeDvu48QYr5imEz5w762bEuHYj9IBNCW1qTwOI?=
 =?us-ascii?Q?MOm8MgvaFl1kMxAqZMFp25NvS0DszMU/WGEu3dbvEHYsPHrakqooalH5LAoV?=
 =?us-ascii?Q?bK3j2fm1vTU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB4277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?O2RjGjRBuOvYpee1A1T1NEbRVJqHaQmub7zTZ9NU+xKePJzRtVuKWkZZtDDF?=
 =?us-ascii?Q?4uTmFQpvlDYhykuKiGbId57PUU+3PldvQHGBMQc9dXcnvXz8BFy58jUVFfwM?=
 =?us-ascii?Q?v49DSh88Or74ecwk03kuZQz6xzl7iJbvQm7xdaOnDJHSuwd8tllGKtjrnMmW?=
 =?us-ascii?Q?V0p8aHZNmocgJa261yAOfYu8IbLbhrMIu5dp5yLP/aHfi2CpM5gepW56N1fp?=
 =?us-ascii?Q?e+Xm6i4cnNOM93LmNrPGzhvF74D4bl7TEC3Pnxk/ub5afXzWze5Q4foer/1b?=
 =?us-ascii?Q?b0WWU+cLl7StuUzItN/t+HB10kfAwWY9Q8VjEvZMFVb1iKQlAUKa2LLeq/KD?=
 =?us-ascii?Q?nqbOER3A33qRZsGhzkmbg3gfQ7H57TnIUYevc/16D8iovPxEo5ldNEgAZWMA?=
 =?us-ascii?Q?/X987i9B940+OLULVVgcqfLcAgdD2XnN9Sk6mndL39k0bU5v66HsBlBkK4XP?=
 =?us-ascii?Q?qOxF2y+4uND8hgn8IQu6sZwNcXe5zNOxI8U73o0YUKHALY8ArMJQH1Y0Cg4q?=
 =?us-ascii?Q?Cb/1XX1ze991gLbtPWHplel/SxMJfKIAMt9gyd0oisLZl1Sdrf+IaE/KIMtm?=
 =?us-ascii?Q?y9Iy9K5v1nIQbv+YelpIDvdGcScfu+BDya3YahGD3NvZG+fCtbkRn2I6GUr5?=
 =?us-ascii?Q?Z3Lqqfmkb7XsgztYU/JWyHmaH1i1VA3hb01qAsCJAyKbO1E3+tJI15YNngo9?=
 =?us-ascii?Q?hLe7HY3nsntlfHFeEVY3dkA91dywnqTp+hZxsvMpS+WZjxuKxhtTNMJvxlWs?=
 =?us-ascii?Q?H5z2tVZ78iKjzJDsnamL0wX+CWHlYNMnarB9p8YY8DP3o+tcbi4d80IQiCmN?=
 =?us-ascii?Q?4XMSe0RdXGMJ1JqRIs4WIpWy6z/aNyMl1f4P6eMq5QppBJLQwnhD0qi8EDp9?=
 =?us-ascii?Q?DVUTgetEtgb8ueu9TBd9L1Z7rXiFMOM+eGWtBVpKJ7oVBzxvDjXx7jEDepbJ?=
 =?us-ascii?Q?7ZtfZTNKgJZYQmmb8fk4ozqYw3JkTZk1VtCNLMhQNmFtMg682CHzkfyAAujw?=
 =?us-ascii?Q?cKPvEdDTk0iIbyethFc+S+nefaOJoW3pzcNepUer7TLv3ggJBodHUKZ7xo+U?=
 =?us-ascii?Q?ewOEPl/JRv6V1PJ/c42eVwBidAVIsrdQlDKu2BN72dwYd10wGpLGbhl5r0U/?=
 =?us-ascii?Q?7au+FjkJvaLy+fohESL0f6d/w/WjhzRZCs6BILMCXLWsxJGqebdlRKqIXO6o?=
 =?us-ascii?Q?+hjCW2Ib9gZTgE7b9D+oORpFJVx/RVLpEUWVlwqE6gvbBoChiiotvbsz/Ffw?=
 =?us-ascii?Q?0paceCAeKwlCh6hzKDyQc5b+dpGBIebFqJaci8wnDlRw7xGeQt5IWuKypdFl?=
 =?us-ascii?Q?UpGRBunBm56t0NwN6Y7a/m5gLYmVHXEsFCMSi3eYIyYcR/r3hI289M2PS/0r?=
 =?us-ascii?Q?E9zfJn0aa/nSI4b4+emwOs+QLSENdXJK/PGq1+32LeJlyWPu7HW+TyKhoCh8?=
 =?us-ascii?Q?SErLtkiWGAoBuVNyC66TMQNecdAhqSIdJgo50JgusfMYedtpt0Jn6pZ7Bi63?=
 =?us-ascii?Q?/S280N7IF2+uD2+XBTdBiK3lO1ss8tpogT/88yuTFWsBAe4dqu8MAETMGlrY?=
 =?us-ascii?Q?xDsLlExSnA19XzL6MgRefKc+MTQOxYicjmTZWQGa?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38bbf357-9c05-40dc-57e6-08ddba3fe4a0
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 14:42:54.1820 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OsXAFZI+JvkoghsylzeGkHdHY/c5coFkRAn7MDsEIhHns15a+RidXlcJMkfiBk5jGjhfutNxwxUu6nVkBPebPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7836
Received-SPF: permerror client-ip=2a01:111:f403:2414::60a;
 envelope-from=etanous@nvidia.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: qpahoqXoXqA1

Aspeed2600 has two spi lanes;  Add a new struct that can mount the
second SPI.

Signed-off-by: Ed Tanous <etanous@nvidia.com>
---
 hw/arm/aspeed.c         | 2 ++
 include/hw/arm/aspeed.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index d0b333646e..3ef7f6c5b2 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -465,6 +465,8 @@ static void aspeed_machine_init(MachineState *machine)
         aspeed_board_init_flashes(&bmc->soc->spi[0],
                               bmc->spi_model ? bmc->spi_model : amc->spi_model,
                               1, amc->num_cs);
+        aspeed_board_init_flashes(&bmc->soc->spi[1],
+                                  amc->spi2_model, 1, amc->num_cs2);
     }
 
     if (machine->kernel_filename && sc->num_cpus > 1) {
diff --git a/include/hw/arm/aspeed.h b/include/hw/arm/aspeed.h
index 973277bea6..6c36455656 100644
--- a/include/hw/arm/aspeed.h
+++ b/include/hw/arm/aspeed.h
@@ -35,7 +35,9 @@ struct AspeedMachineClass {
     uint32_t hw_strap2;
     const char *fmc_model;
     const char *spi_model;
+    const char *spi2_model;
     uint32_t num_cs;
+    uint32_t num_cs2;
     uint32_t macs_mask;
     void (*i2c_init)(AspeedMachineState *bmc);
     uint32_t uart_default;
-- 
2.43.0

