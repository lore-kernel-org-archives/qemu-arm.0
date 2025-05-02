Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp1004636njj;
        Fri, 2 May 2025 10:23:39 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCWdOCF+qslXBOP2YVlgffh9MbR1z2rW7b2rk1ObSnTmoXCNbvr8s9KbO7rm25yhBgDS1p5iz/Wxpxv9IQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEb6JcMEe3iy5pmV3hprfT683QuEIlxjB3B8WCI2mpDi/n89LdhWuzGbMdWXmRt1JqmPkbQ
X-Received: by 2002:a05:6102:1492:b0:4b1:1eb5:8ee3 with SMTP id ada2fe7eead31-4dafb6ec028mr3116707137.22.1746206618811;
        Fri, 02 May 2025 10:23:38 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1746206618; cv=pass;
        d=google.com; s=arc-20240605;
        b=IkNpQv7paGi73ajyWXvAi/tj+0//kHpcZsJCq9pkjcc9tSAH2Lr2DQdwFZhvhmvS2N
         wH4rmFtLE8jCvJ4wgG/6wN0Tj2dxJZ/AbI5ZuJfSSfu+JcEJGQ7eP166qCfDz7cUqp76
         +wpWWysoRmWqizsSnZEsTL7Oa9CtVQs51hCCHepO+nIbJ3sRzbr5EIGSBFNlvMql15mF
         bevCjPJGA8iq9GgES3ufD9V+1jg0m3RgHTevsDpIkRFQEF6Qg5ypRXdVVoSOoyoCi493
         3goB1lqHCkdxVhKWDmMZvsGaOgU6PvrXEVFpJWuNjwhKDUwkQc4/QJV6brF3usByROB5
         JNMQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=F3XkpiET1eaHa9CR+gkoP1WLTprc69eZED8gVgKbEpo=;
        fh=QfLtm739FJDwnQIBN1Vfdx7A0lOP9u5+VoNIhuGgE/E=;
        b=NMRnurPIFp2ZUhhxSeVghsDdRqOUnKVSbScfJ5X7rgi2Ut/1k9kADujduKJJiAXauR
         aLQvdmkQg4VKQBufRN5dkckWzbeQxQpGqm9JvFyGLsjEM0wVwQOCveM5i6VQijN8toy6
         HwIiD0ooCDWl9GrMUcG4SsSWFRs/K29iPnLQlYo4jGnhsnOo3tOhFG+RmFQePwrT2lPe
         VUjDSbmikaR6bNS30OMp/A6P473KeVlQf/Q0t0dSpPV3MuDBk6wgWWC35LXXCCqgALmi
         pjj19gcZRJJY4+CTnL2TjOJkGGb9sjTEp1Ruh0BQGBYx+g+CJ2Ntgp6qnNPnq/Ac2j4O
         EtkA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@Nvidia.com header.s=selector2 header.b=N1amip8x;
       arc=pass (i=1 spf=pass spfdomain=nvidia.com dmarc=pass fromdomain=nvidia.com);
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=nvidia.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4daf2501d17si878462137.267.2025.05.02.10.23.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 May 2025 10:23:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@Nvidia.com header.s=selector2 header.b=N1amip8x;
       arc=pass (i=1 spf=pass spfdomain=nvidia.com dmarc=pass fromdomain=nvidia.com);
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=nvidia.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uAu6X-0002CA-Pb; Fri, 02 May 2025 13:23:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nicolinc@nvidia.com>)
 id 1uAu6Q-0002BJ-61; Fri, 02 May 2025 13:23:11 -0400
Received: from mail-dm6nam10on2061e.outbound.protection.outlook.com
 ([2a01:111:f403:2413::61e]
 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nicolinc@nvidia.com>)
 id 1uAu6N-0004uK-PT; Fri, 02 May 2025 13:23:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eoUr/OrvW42q5gem5VvcBuqmLZoFtuVn5IFl0L87GRswBb4Zx8r65/QIqQarMRB9xcuJ1QBFD3src+oLLuIxIgO9nIkBYo6//8ojg5txqsXqGsL0QvE3ouUEi9cFdGHt3SsIfExbwcn4jaTuFVeNJkgH+ls7UhaICjys6JmDwxpqlEaYWqF7/q4Tbk21lbdXZ3Hvfx1MfVMnEjGyFHD/A2bue3CByM4Lv1yhiIGNZesm/o98sOtCgl3LvCqR9BySHPHXAQ51N3fSYnB6td/mLOgLGzb7hEsCj3K1jhQFyI3L3sa+VgAR0bdmXBNBdVzbJ0BkkXXVeZeq+s3T1txa8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F3XkpiET1eaHa9CR+gkoP1WLTprc69eZED8gVgKbEpo=;
 b=Ce0HyS8QriSW8FqjOHWh1uAuh7F1QdbwX8W9S6kN0zEag8JHgrgaHPK3i8kpms7xlu0dA5ncNS5XMqFjI+voYvLZXizplh3ds+pM3hXsBySrdV0y44Vtc1FO5l4nVcgwbnHbRooSupxskkz7dza66Ov/oMw3224N56QyPh4ZPI/k4Wy95N/cyv4l4oA2z3A69j+74ivwfiTTUM9iP3zbt/P3mAkqzmh7fbsv+yQ5bbC4LXwHvpjpGu60nKHWTsJrWGw6lf2jhHmxTn4ccZLSOtoGKEKf2rVrL7MyhQf+wH8tBNvZlBYiGjf6b14gXc0gkD2cDjVDgAsiLrQW2GbcpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=huawei.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F3XkpiET1eaHa9CR+gkoP1WLTprc69eZED8gVgKbEpo=;
 b=N1amip8xICE/gX8xeKIWVuJ5uJtaELxwEPezDKoRvsk+9T8eqVbtYJn757JxFtouidiYnLoCtp2+bHXIGENY5vLmol0xywjx7kvX6NIFAgexC3JkFs7afg8UMnlJtIac8l2ipGaaJRwy5sjpvtSAfXdDnS+Ayc5f+jTlXcUTyd79/KE3svoSoMEWyXdwDqzx124cqfZJmDkO3vxXsC1clrIHkUoyJhz6WFP18vTjh/IKUW9bCZH8MJNAEgIQAGQzHKGzXWRSH8fBlMzF30qmUKfmrL48KxOZVqePz/ByUQg8e1uhr0gyU/ant6xfwJOnmWaosPythbPDmw+e5WWgLQ==
Received: from BL1PR13CA0208.namprd13.prod.outlook.com (2603:10b6:208:2be::33)
 by PH7PR12MB5879.namprd12.prod.outlook.com (2603:10b6:510:1d7::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Fri, 2 May
 2025 17:23:01 +0000
Received: from BN3PEPF0000B077.namprd04.prod.outlook.com
 (2603:10b6:208:2be:cafe::c7) by BL1PR13CA0208.outlook.office365.com
 (2603:10b6:208:2be::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.22 via Frontend Transport; Fri,
 2 May 2025 17:23:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BN3PEPF0000B077.mail.protection.outlook.com (10.167.243.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.20 via Frontend Transport; Fri, 2 May 2025 17:23:00 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 2 May 2025
 10:22:53 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 2 May 2025 10:22:52 -0700
Received: from Asurada-Nvidia (10.127.8.14) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14 via Frontend
 Transport; Fri, 2 May 2025 10:22:51 -0700
Date: Fri, 2 May 2025 10:22:50 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
CC: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>, <eric.auger@redhat.com>,
 <peter.maydell@linaro.org>, <jgg@nvidia.com>, <ddutile@redhat.com>,
 <berrange@redhat.com>, <nathanc@nvidia.com>, <mochs@nvidia.com>,
 <smostafa@google.com>, <linuxarm@huawei.com>, <wangzhou1@hisilicon.com>,
 <jiangkunkun@huawei.com>, <jonathan.cameron@huawei.com>,
 <zhangfei.gao@linaro.org>
Subject: Re: [PATCH v2 1/6] hw/arm/smmuv3: Add support to associate a PCIe RC
Message-ID: <aBT/DKnSpdV1SEmb@Asurada-Nvidia>
References: <20250502102707.110516-1-shameerali.kolothum.thodi@huawei.com>
 <20250502102707.110516-2-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250502102707.110516-2-shameerali.kolothum.thodi@huawei.com>
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B077:EE_|PH7PR12MB5879:EE_
X-MS-Office365-Filtering-Correlation-Id: cdb9c2fe-3405-495d-389d-08dd899dfd03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|7416014|82310400026|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1mW6QXwlBi+6yFh6RWxBwWEip1EOkXgbbUAPM0Et/bWf9MKQ8OrLHP4umLww?=
 =?us-ascii?Q?y28fwpjGV5uUprYEJ4RHmSDyxs753wCKaJiDVa/YrgzGbHHOHsIqXL+Z1HOs?=
 =?us-ascii?Q?g5WDl+aU9HyULNmvVs/7WjQ9J5rTSx5A2Sc/XIG5oF9FthsO6TD9Lr+7YzPK?=
 =?us-ascii?Q?CAB0523tZ/jvyKJbLQe/GHA0rv9bnqZc6IttTD7zCwDXl4URi9sR8CGWuq+k?=
 =?us-ascii?Q?hrH0bszRSiNCXAG4rJMf9v/thialeP3uDpva9O3JyrRGI8gTBhsiu1rfg5gf?=
 =?us-ascii?Q?q/wMcMM7Sa+LscdTyyKpJ21ATE9/FgDcnn9VNQaxi3fLoagI9EEU+V82JHqN?=
 =?us-ascii?Q?+wvnxW+VSdw8B6vCBW1LxYaW9CxJfAssGmM4psQexy0cRiSGB7CCkmHN/8dh?=
 =?us-ascii?Q?BYalnjJ+qQjYYRTSb8aWFlkbq6deDie2KXyoM7rR9UAcalvsspQv0oqcSF0V?=
 =?us-ascii?Q?Wg4yH9lXgl8wHwnoRBcM/lt2S59EFbQF+0Vko6ujQSxHuXfaG/uFr8uQoLY3?=
 =?us-ascii?Q?Z8F+RCR1u1ESwJUC/8XfGzdD2yT/AXpqNmJ/JtMU+ECOCJ4Vc0xRvIofsQes?=
 =?us-ascii?Q?hINjw46nV6//KaFwbOhHm04mOUmzKWMyM6sjdhlDiwg9NB8FYD+qBVi/84My?=
 =?us-ascii?Q?i+IEEaF6msYlzzUFvAHjQx8NLB5vmp/5wUBu9D8zqu+1vu8xGoMbYanfRNcW?=
 =?us-ascii?Q?mYQjKHJthtrnHD+qHwUQMEN7glVNJAaRETrE+7MxNLhg4GfnwMm0Pj5FAsP/?=
 =?us-ascii?Q?Rp+H/BB62GIzUTSCC43FIfrLeOYvddJix+y08xlfp9n47KLSr17koA6wcgCt?=
 =?us-ascii?Q?+gZWX5e50mzWL4VDXSy8qjZWtlPXloahYLL8fJfQqzJFKqFvv6rDeetTIR/d?=
 =?us-ascii?Q?ecQ6KseIeAJUJO9SNN406HTRk9awY5eFhXhkayGCurIvJpT1hsvw7vFu6Fz9?=
 =?us-ascii?Q?w6KVvuDBIAJe+r1PCeGipIxPGYWVLUUhIagXJGArKDvQ7ud93/dEHwZsSuuF?=
 =?us-ascii?Q?vSMKKALA6gEnqUjBWgOCRsbfHu1YhG6eM8HCqM3peHTtuxm4bQU7Jcc9CyJ7?=
 =?us-ascii?Q?XdXYpOtSmflAh4Fu7yssSEt7He0dAvWJU/KHcg2TZafOPenq52EWeRr9U6Qv?=
 =?us-ascii?Q?Oaq9kd7aYs/EmttxtV6vgftBddEPapNlJNdO9H+QJQ7h4H85l0jFHIWYNuDh?=
 =?us-ascii?Q?A5iYzjQQwSj8cYs6b5JYv+4R8VyopFBLSjeJyfdUgcKMM60tQ6JPEQwxubgu?=
 =?us-ascii?Q?Fs8NaevwdVzb/pkz/8blFodfJ2WhTljIwfX/D9mKX2mV5gkl7BAvS5c4mSco?=
 =?us-ascii?Q?qRJX2lQiGDrk3AdamO1QFeIbMcQgkZMTs3ocy/uOdZsnK//yxI8NKO4ORBF6?=
 =?us-ascii?Q?zz11K0ctkYtpVHRNxE8GwhNRYNreeS6eDQMVxJZs8dXlEQVRhLs8zu9NgYvM?=
 =?us-ascii?Q?74UqmEQQaK/YyC47ms3Q7a2pRqq9+Uscx/+cXei7JFmIg61WCno3SJ+c4bUx?=
 =?us-ascii?Q?75+u1/Ymnns/n/mUJ8lTMgvFvlA3azSVWMcf?=
X-Forefront-Antispam-Report: CIP:216.228.118.233; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(7416014)(82310400026)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2025 17:23:00.2222 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cdb9c2fe-3405-495d-389d-08dd899dfd03
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.233];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B077.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5879
Received-SPF: permerror client-ip=2a01:111:f403:2413::61e;
 envelope-from=nicolinc@nvidia.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.644,
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
X-TUID: 99szABLo5CTJ

On Fri, May 02, 2025 at 11:27:02AM +0100, Shameer Kolothum wrote:
> Although this change does not affect functionality at present, it lays
> the groundwork for enabling user-created SMMUv3 devices in
> future patches
> 
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>

Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>

With some nits:

> ---
>  hw/arm/smmuv3.c | 26 ++++++++++++++++++++++++++
>  hw/arm/virt.c   |  3 ++-
>  2 files changed, 28 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index ab67972353..605de9b721 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -24,6 +24,7 @@
>  #include "hw/qdev-properties.h"
>  #include "hw/qdev-core.h"
>  #include "hw/pci/pci.h"
> +#include "hw/pci/pci_bridge.h"

Could probably replace the pci.h since pci_bridge.h includes it.

> +static int smmuv3_pcie_bus(Object *obj, void *opaque)
> +{
> +    DeviceState *d = opaque;
> +    PCIBus *bus;
> +
> +    if (!object_dynamic_cast(obj, TYPE_PCI_HOST_BRIDGE)) {
> +        return 0;
> +    }
> +
> +    bus = PCI_HOST_BRIDGE(obj)->bus;
> +    if (d->parent_bus && !strcmp(bus->qbus.name, d->parent_bus->name)) {
> +        object_property_set_link(OBJECT(d), "primary-bus", OBJECT(bus),
> +                                 &error_abort);
> +        /* Return non-zero as we got the bus and don't need further iteration.*/

Missing a space behind the '.'

> +        return 1;
> +    }
> +    return 0;
> +}

> @@ -1442,7 +1443,7 @@ static void create_smmu(const VirtMachineState *vms,
>      }
>      object_property_set_link(OBJECT(dev), "primary-bus", OBJECT(bus),
>                               &error_abort);
> -    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> +    qdev_realize_and_unref(dev, &bus->qbus, &error_fatal);

Could add a line of note in the commit message for this change?
