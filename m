Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp1643380njc;
        Sun, 15 Jun 2025 22:06:24 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCWCSoI4gUMazxEoVsblV0N1xeUUr4nI/mgI/cZbOxtZ7PXgPJ7jdpXFuHu5Ds7Hv8sdmd30yCTMeiHpBg==@linaro.org
X-Google-Smtp-Source: AGHT+IGukKokrJ2pHak8t1/zrb/GPlGv/f8H7pts0lodzTJO3u4yho407AnfKxTZ4+Car0BfmTQp
X-Received: by 2002:ac8:5fc6:0:b0:4a7:24d0:adf9 with SMTP id d75a77b69052e-4a73c58fea2mr101814301cf.24.1750050384011;
        Sun, 15 Jun 2025 22:06:24 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1750050384; cv=pass;
        d=google.com; s=arc-20240605;
        b=UqMWLoJ+afM/EebWMRfBhbLWclPzj6kj9qtNM/NEDlQFIe7QofYNDJuzNqhe353rrq
         JR5ReYgKz6utAgPax0UacXybJq3560zVcXnjVO6IznjHGLnpm4Sh3WkNOv4X0h1wKqM3
         F/6C7zU3VnTtN48OnFhZct1XSh159YlzZBQ6mpRjnMHjLMUppJjz+h2eQ6mBEYOvtP5C
         eY9CPN//un1OjQ51y5VBMyDiCuEMEcyIcGYyuakavNh6IdS2wwYVfhLT9ASzBUftz6K9
         l5lDZyrbTueyP9Zj4/Z6dvykTR2SFGRFOLCgGWZEErDz1Q6EbvvV1t+3ZoNqWxQCeoUU
         Qs8w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=miUQvXEbgN0IR8sh4tsF6xsWzj5EStHkKINrc6vXkqo=;
        fh=1obnVUD2joL31Sc3JNHhq2/pTvgfpy8itZqkj4FleSc=;
        b=Iei6fllbZQsxRnMs/2MDFL4HbZWtiRyCWSgW2YykeonPceMpZu+Wy/BHXBCAtUictG
         TG/+brhH05DmwHYGXgUViHI8F0L+1uftlGODBvHlFoeLI89b11JEimrz/EElUCZDXuQK
         zDzkXVHePCF4r4CSq1KhFCoNYhwcXAAtPnYHIG99gUiCGMLf8SBcUa6uH4nT8wZoOrUb
         4g7WjfgcVLNhpuqrepZE2oWj/ZpU258Al5PAw7MUZGTS8JfcVfoCpmZh4Fd47t7xLP00
         ZAP3qIg6/59b3rWBPqF8vpx0DeJOfiz5gXwPe+WznEq/yEC811IUiE9NqBkHzvkujqcM
         LpWQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@Nvidia.com header.s=selector2 header.b=e5Ty8lFK;
       arc=pass (i=1 spf=pass spfdomain=nvidia.com dmarc=pass fromdomain=nvidia.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=nvidia.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a72a2b8bb0si99516331cf.49.2025.06.15.22.06.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 15 Jun 2025 22:06:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@Nvidia.com header.s=selector2 header.b=e5Ty8lFK;
       arc=pass (i=1 spf=pass spfdomain=nvidia.com dmarc=pass fromdomain=nvidia.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=nvidia.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uR22W-0005va-EV; Mon, 16 Jun 2025 01:05:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nicolinc@nvidia.com>)
 id 1uR22B-0005oM-Lv; Mon, 16 Jun 2025 01:05:27 -0400
Received: from mail-dm6nam10on20607.outbound.protection.outlook.com
 ([2a01:111:f403:2413::607]
 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nicolinc@nvidia.com>)
 id 1uR228-000348-C4; Mon, 16 Jun 2025 01:05:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jjW7GpKcp3hp7v9NTEKB5GIlnaSJPkCSSrZqt2nBv7o4Mtb9vpulVPaxw4DzYq2Qm2lkdhgRLEf28CqHE9H/VHsAwk1h7MDja1arAYQO7CKaNrCnnVXSgy01/OUilfMMmLdwRSnOu5brDOjrA3Ql8bpxeDzT6SBjzE8WF2QO5zH1mknDsykQR1Vaw10VBt4lJcmw6g0f0FcLPs+mV9wOUULp5XZyJi0U6BbXhMGR30XTii3PQkdzi7xvyur9H8j3tCkXhQz+HwfO+RC0ehH0JGchbo2ENTKTNqEJYnou8UdsbyzgMEcoUyjHk6sZs4ZS4T5gWUiI/e1B23Yf3JyxCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=miUQvXEbgN0IR8sh4tsF6xsWzj5EStHkKINrc6vXkqo=;
 b=orl9jtX8+a1Y597Ene2ivY+sdX1kylVAOGWhuyki8oR0foP7BAdacmcy+Ly80x2b9bKwtNrETiOWypUUwDhl44IxirE9vNdSMY+rIZYQ16OjUiic7Blfb3efMvhQlUOTcJdx5YdgnJUZQ52lCiKPFB67BGRFcT4I4NQUAsve1suCKnHLF04INumZ48jaVZHWgN74aQpxd8zRa3K+cUzwAbwq5wmxfK3SIgT5goz336i6FrPm74HhOoBmeOgrGiVbQj/iFlKhna02susjTkjSD4MbsB1v9Y9Sy9T6ALtmLKb7UYWu9LxUwtO2L0K7xRE+P+dtPL3LGM3j3dm70y0B5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=huawei.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=miUQvXEbgN0IR8sh4tsF6xsWzj5EStHkKINrc6vXkqo=;
 b=e5Ty8lFK+N52Erb1y+JLxPRFZLHUpUB38QdEoHapIP0xTgm4smtxNUv6TRLrxP9HH7GJncWJNayTx0W3IbnjJtMfRuFx9x+CYDS30SVwFFHEgmGMSGH0UWrCUXuLJnufKkksF+xEpWtyLaSZABcQmA1rVw/2qNmFc1GKTvYe/WyiUHGJ23kozAtkZOVw85vIIeKckf0XOFCgXchoK+b5aQtWjjaIzJPNPBwMZsaGR8jYTzFymOdPn+SQeEIeCEW7ediJLqjWbPHdnkZ6XNTjVpRcrMoJn7rOBNLzUNmQPqCt969nEVBd51jvv/hRDjNJX0I6VxC748EjwD8A+/qUwg==
Received: from BY1P220CA0012.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59d::8)
 by PH7PR12MB9176.namprd12.prod.outlook.com (2603:10b6:510:2e9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 05:05:16 +0000
Received: from SJ1PEPF000023D2.namprd02.prod.outlook.com
 (2603:10b6:a03:59d:cafe::4f) by BY1P220CA0012.outlook.office365.com
 (2603:10b6:a03:59d::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.23 via Frontend Transport; Mon,
 16 Jun 2025 05:05:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ1PEPF000023D2.mail.protection.outlook.com (10.167.244.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.15 via Frontend Transport; Mon, 16 Jun 2025 05:05:15 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 15 Jun
 2025 22:05:04 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Sun, 15 Jun
 2025 22:05:04 -0700
Received: from nvidia.com (10.127.8.12) by mail.nvidia.com (10.129.68.10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14 via Frontend
 Transport; Sun, 15 Jun 2025 22:05:00 -0700
Date: Sun, 15 Jun 2025 22:04:58 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
CC: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>, <eric.auger@redhat.com>,
 <peter.maydell@linaro.org>, <jgg@nvidia.com>, <ddutile@redhat.com>,
 <berrange@redhat.com>, <imammedo@redhat.com>, <nathanc@nvidia.com>,
 <mochs@nvidia.com>, <smostafa@google.com>, <linuxarm@huawei.com>,
 <wangzhou1@hisilicon.com>, <jiangkunkun@huawei.com>,
 <jonathan.cameron@huawei.com>, <zhangfei.gao@linaro.org>
Subject: Re: [PATCH v4 1/7] hw/arm/smmu-common: Check SMMU has PCIe Root
 Complex association
Message-ID: <aE+l+htJDsolHuBW@nvidia.com>
References: <20250613144449.60156-1-shameerali.kolothum.thodi@huawei.com>
 <20250613144449.60156-2-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250613144449.60156-2-shameerali.kolothum.thodi@huawei.com>
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D2:EE_|PH7PR12MB9176:EE_
X-MS-Office365-Filtering-Correlation-Id: b34ec1af-8047-4a2c-b677-08ddac936184
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6pDlf9S4TjGszefijgTJTTG9pPc8wNvFgTjBu6j86vtHnYNcyEYq8Sl2x/mh?=
 =?us-ascii?Q?HMA4a0Vu8Rv+3LbnGUJ/pxtdNH4ouyQ9Q/G10WZhtDZpxbzbNhAyWlmTp0x3?=
 =?us-ascii?Q?EepUJ2Eg0RUZEOqOzwkOEavJ4fp2Ja/aOucuqvF1z1l83HayCj5UgJAxB4yN?=
 =?us-ascii?Q?tqAN5zWl/Lmf+IU9pPqbFeVwSslwbPvgOqW3fnhVAPeREKTjKls6a3inzZgU?=
 =?us-ascii?Q?YWdJiZKJH8sRF4uP37fFrI74IabF/E3aScFSjmSQkFfagWF941qXU1mu2BnJ?=
 =?us-ascii?Q?heTVrcACCCi2SttP2wUad9A41EpH9/gtkcGzfCGYXaLAfX4IvMuH3mh9QRMt?=
 =?us-ascii?Q?drkYD7Q7f6xwZ6zcE2BwWejNqLckljyhT8m31mtGrJuU7LEG7DBh9acLJClc?=
 =?us-ascii?Q?sldz+LTlIjLOj7ONlgAOPL0b5ftI6UaiojfdQ+3aLjxyYb+6bKN6itbB8zUO?=
 =?us-ascii?Q?JRv4Pa7auGWXYGl3OqOWrY7cmPZ+632wtFVu8TU/I1d4gmanGexViqXvoPCS?=
 =?us-ascii?Q?Vz/Yx0G+rV5GZ1twB5r0R3o4OvyToUGgHxtRKWBzDGWjoD8pMlhqSFdCEUqE?=
 =?us-ascii?Q?aiIF93vUjCnuaVjMZkqEAnf+tJ+mTF0vfKUpMB7VDqU5XAj80jTjT1wdHqiq?=
 =?us-ascii?Q?JZ4XWGR3x8vh/oOxURZDaJrXWMoBncCFuQK+X+IjqtH6Nqm62X4gDkatlBnt?=
 =?us-ascii?Q?POBcAyjkFOEG3hE4K5HyNbeF7Pz5jGwnc3ppYx9OzN5oFoff4Cia0WO+LTRy?=
 =?us-ascii?Q?9QEf5Q7CcllXFMpwL+2tQwxrtcMUq7u2obIQQCT/3TwcuTYCc3ey/VL7asYS?=
 =?us-ascii?Q?WJ73Hb4QMu4krtl248kT9SfRGKyV+IIPJEyFnTxG07m7Ed023oXyCDVnpdHC?=
 =?us-ascii?Q?M5MtZepKV6viAY2/iNMGW22GcrGl4YOKNFTqFg0cj/Wos2HtgpqggXYwfDAB?=
 =?us-ascii?Q?tlisKqzJ36Y+VQpStq8D6G0y0o1E+Sb/Yi37oJWIXaOQMYrfRSP0l6euajMJ?=
 =?us-ascii?Q?tpPesfdHk52tr1/gljN9hji+BSESNjR4dDhn730siFUlhjCUARRssW2XvZ8X?=
 =?us-ascii?Q?IUD7wV0GPBQVe6Z2fpE/1MYFoORWa02O3oryPOip9AgmgMVy8Gy37j6xcstB?=
 =?us-ascii?Q?WCNo0SOyjB1giGQ3W3oauyVX2KPFubH3KgAm8iowlWKAr/m0d2xWVm6BK5Aq?=
 =?us-ascii?Q?BVCF6w5UAgvKCmC24rZIuqPylTySt0z1rs8qs+T7/kukKmrxavKyQoldGb66?=
 =?us-ascii?Q?40HdYXklf2jhemWAEAhFn7GzfGTYaL9AAdH0Z2hyqtdnkMm8JXDlP9bR6MV0?=
 =?us-ascii?Q?GI5ni5m16rQEUNHsLoCGlRqQyHdnex8LI2VwwO6tO+7JTAYvLTJeQLtXhA6w?=
 =?us-ascii?Q?3lCk87fqzkzWSwWGr9yll4ZFpq20Ih/f1AVlkV2sgXQAtsWw/pVlkcED1LnL?=
 =?us-ascii?Q?BM/UoCcX6sY9o3mPFYPRE2rydlxgKSFJtXK+PNq1NApoQ6nyx9VTLwjTAJZN?=
 =?us-ascii?Q?RZO9RAjKPBhIVXvvNtJDQEJ5MR9vmifUsQaD?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(7416014)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 05:05:15.2314 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b34ec1af-8047-4a2c-b677-08ddac936184
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023D2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9176
Received-SPF: permerror client-ip=2a01:111:f403:2413::607;
 envelope-from=nicolinc@nvidia.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
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
X-TUID: uuz/94Aq6WKN

On Fri, Jun 13, 2025 at 03:44:43PM +0100, Shameer Kolothum wrote:
> Although this change does not affect functionality at present, it is
> required when we add support for user-creatable SMMUv3 devices in
> future patches.
> 
> Tested-by: Nathan Chen <nathanc@nvidia.com>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>

Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
