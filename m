Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp2123057njc;
        Tue, 11 Mar 2025 13:51:42 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCX5z8lsogq27Ogi4PAoxjN14+coEcaw0KdPAVZBc8ZyVLsUQxBjZr/idj/iutAH2U579T+aZIm0cqs2Fg==@linaro.org
X-Google-Smtp-Source: AGHT+IEm2JdAqjc3xNLEBRCDY99iYkXDJ997FA0CafMlRZQZkR4TQcKWe5XZXL75afx0Ph94CQ2O
X-Received: by 2002:a0c:f844:0:b0:6e8:f770:5045 with SMTP id 6a1803df08f44-6e9006752f6mr211583446d6.28.1741726302374;
        Tue, 11 Mar 2025 13:51:42 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1741726302; cv=pass;
        d=google.com; s=arc-20240605;
        b=gESMNk9i4MstASlFP6CY71PBIgozcjVmg0QsU25GXPBtTbPgcq+Q9+4hxrxgwKqJak
         DDuZCqVSwHs4KUJuT61DPJR9NBfITohLwtlr91xMbEgFifrIKczpgowdpcnTXhn6JUpj
         gXd5sTvY4kbr2ICjF0L54DHEFhdTySrKDkeP0nMX21EakaVqnYWZjlgg6yN3djM0oGg7
         mwiwQcjG2gyV2PLrRQQTNQwXSGJYCXiC/YFlbHJRtqZS9YuUsHszxXOFitCWbOACTveg
         vrha72Sn8FHxrRh8/51P9gQfYFDEOhv3HKZWl4/vu1HIYXM6IsiR4SWJCsXEZbVq/7jZ
         1mZg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=1xYfTqFO4LTrIXHwYxF5i+k+LwnXuwVPQu1zV2DqBUA=;
        fh=QfLtm739FJDwnQIBN1Vfdx7A0lOP9u5+VoNIhuGgE/E=;
        b=cMjQ5OToHfmzNSV56Ko8WwFB0Spxbq9fouH6ipdHgyJ0/o8Wol7SKkyVShoBZKKT2x
         X1eqWnMwoZ+yd/NvFyQuv4D0C9edg6JdvFrfoBz7OlfWoJL7PvI0B+wSNYbbuKUgFRRj
         CdmWRCBGlFICmqoYHSrWgmuoF7WrYR6iqPVKfjLQMmEtuFWqnJ6XBVHj8ia0X1bPNoxO
         1YayfARR120X/Tj1qyPBUYPnzf8Y92zZP8lxmAUD+JxifBUR1wSC2zL9/+QBmkipHhSi
         lQxAmKQIc2a2vOAJ+BbaZQCV/C879t2wb6vG3PzF+zJJTCrUcZZH5m8vhzOxzLn52pGo
         3K2A==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@Nvidia.com header.s=selector2 header.b=dRd2oSI0;
       arc=pass (i=1 spf=pass spfdomain=nvidia.com dmarc=pass fromdomain=nvidia.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=nvidia.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47679b84a7dsi62828251cf.643.2025.03.11.13.51.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Mar 2025 13:51:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@Nvidia.com header.s=selector2 header.b=dRd2oSI0;
       arc=pass (i=1 spf=pass spfdomain=nvidia.com dmarc=pass fromdomain=nvidia.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=nvidia.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ts6ZI-0005Hw-N1; Tue, 11 Mar 2025 16:51:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nicolinc@nvidia.com>)
 id 1ts6ZD-0005Bg-GR; Tue, 11 Mar 2025 16:51:11 -0400
Received: from mail-bn7nam10on2061c.outbound.protection.outlook.com
 ([2a01:111:f403:2009::61c]
 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nicolinc@nvidia.com>)
 id 1ts6ZA-00087Y-VQ; Tue, 11 Mar 2025 16:51:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WSCUAXHkUla9VAHV/jl9LBjA9LD3SQMMNRRCpLGszTam0PCWSS1iI29vqnw53JJP6y4iwxUOIdzxcLA5DkKjT1df1q69JVw61lpEo5Bb0YyJQE1mGyaTbQ6VKjmJYHBfeDjtkkh6hubIfxoE3ujohETU1Bluw+jDPy85WxtW/BZBG6mLxqJSQAZPu7GrfTQlieRCImLgJ49wHq8kiYuGVFnHbNBTBuj3ldm3ZGcNuFlJ5zku/eyfrLFm23IELZTDsGz7U4cdWOKaBiRkvKq//KDmVK6QKtEYsHSay/5fxDyueuAVv5U4Kie6eQ+rymzJxo7W2A0aX5zu7wLIAgJgYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1xYfTqFO4LTrIXHwYxF5i+k+LwnXuwVPQu1zV2DqBUA=;
 b=dCdqqMuAzHBSkEC9sDT0Ay0EnZ1e7rPU1yBRAa7WarLhUckvcNz3/rWcPRZmpXoOw6qdtsrOLQULjexXOhCd1/xD/vFTd5+HAOQgU2cPNMfzj7riNddMTI9diIaVKPECV7/eVctV2q/yLEHoXgdK0hJOvLNqqflNlyaXlzaxnsmmtaBjNINbMG/okoNPORsm4IZWz8T6rpX628g+flP555aphF3h4+NAyDWuPqBzL9oSRcuApv+xojJfJSRyS1IprBxXVx3efHXySCKrg0tQmSnH9GD8pQQUv2hfXzuk6A5j6AbCZv98/yD0JoZG4AlErqwM+bLgNtWaNWfdNQCkpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=huawei.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1xYfTqFO4LTrIXHwYxF5i+k+LwnXuwVPQu1zV2DqBUA=;
 b=dRd2oSI0Ovq6JuhdzWwc0Wr5scjnUX4TgBQsfH+pAomzEPJSF7Id5ME/lh9CUPULhUSZX3yJjuOOQh0VO+z0OJH3fvhj4ivYt3yB8x87c6QYukg8m69q5wkSpQI7UhPB3eiw0GrrlsYSVetHiQMdTo83SGMDLyFYI7Gzch3tTOGlNV4+L9Z1rVOa+XRVCMIfiEIJP4cn72mct3bPypeKcBqFr0jpETNkeanXEcf12nsQG9mnN+o2ZH286QFsEObWleMhsuV7WazKE1tiHGBdNLLOKGTSevqcuGOucPbP5NWyoDnCwlButKuxF35ZtftCAGGl7wjayh3aBfuLdH9hHw==
Received: from SN1PR12CA0109.namprd12.prod.outlook.com (2603:10b6:802:21::44)
 by DS0PR12MB7608.namprd12.prod.outlook.com (2603:10b6:8:13b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 20:50:59 +0000
Received: from SA2PEPF00003F64.namprd04.prod.outlook.com
 (2603:10b6:802:21:cafe::92) by SN1PR12CA0109.outlook.office365.com
 (2603:10b6:802:21::44) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.24 via Frontend Transport; Tue,
 11 Mar 2025 20:50:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SA2PEPF00003F64.mail.protection.outlook.com (10.167.248.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.20 via Frontend Transport; Tue, 11 Mar 2025 20:50:58 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 11 Mar
 2025 13:50:46 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 11 Mar
 2025 13:50:46 -0700
Received: from Asurada-Nvidia (10.127.8.13) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14 via Frontend
 Transport; Tue, 11 Mar 2025 13:50:45 -0700
Date: Tue, 11 Mar 2025 13:50:43 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
CC: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>, <eric.auger@redhat.com>,
 <peter.maydell@linaro.org>, <jgg@nvidia.com>, <ddutile@redhat.com>,
 <berrange@redhat.com>, <nathanc@nvidia.com>, <mochs@nvidia.com>,
 <smostafa@google.com>, <linuxarm@huawei.com>, <wangzhou1@hisilicon.com>,
 <jiangkunkun@huawei.com>, <jonathan.cameron@huawei.com>,
 <zhangfei.gao@linaro.org>
Subject: Re: [RFC PATCH v2 08/20] hw/arm/smmuv3-accel: Provide
 get_address_space callback
Message-ID: <Z9CiIwuH5vfyuA37@Asurada-Nvidia>
References: <20250311141045.66620-1-shameerali.kolothum.thodi@huawei.com>
 <20250311141045.66620-9-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250311141045.66620-9-shameerali.kolothum.thodi@huawei.com>
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F64:EE_|DS0PR12MB7608:EE_
X-MS-Office365-Filtering-Correlation-Id: 2927acf9-a0b8-488e-1f1f-08dd60de6cfe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NJSdCknMxJUyZfdmrqGG0rTweAzdNxpi+Ez4FBTqJSzh87SLEwqPYl3D7Vbu?=
 =?us-ascii?Q?B7YnLu1Mf4Rm//XqFB1qAe8I1t/60B4K5RjUqAoXxAUolBn7yBdYNBODTqCt?=
 =?us-ascii?Q?NJRVLDuPoC+tI4jDQd5OIkmXgaOca3jWxtF5oBnUEeC0MLm+0eanZl29kPqC?=
 =?us-ascii?Q?92TRNT8i3U4EtjOl+V9C6g1zsPRKotFoSOtdZyzMnY/tDI5X1govucvfGfmH?=
 =?us-ascii?Q?wF1XURHXCXvZE75KW4dcvVWaLmwNeyGRCJUm9snC+lUDiT4pqjnzT/Sm+Be8?=
 =?us-ascii?Q?w3J5GWGoYhq6/2Jw4NV6UtEBalrcmpjopYQ1GaJ0cY0Lh+j0E5XivaX7wCgO?=
 =?us-ascii?Q?AIUHBTkohGVhkZnyBjUe3+cnc8Cgogkb1W+FvgQwJCzYjhf6wwwBdA3R4S26?=
 =?us-ascii?Q?QNwKVUDHG/CpCvR3m4xYwL/xNKTTtoh3duwxiP8xeQjrGiwS5P2Sk2JMS7iw?=
 =?us-ascii?Q?Pe6UAkIWjFRprwuIBuaDgUJnwxMhyMOISXKGtuQehe0tZUe9fDl943p8nbda?=
 =?us-ascii?Q?SR5QkQDJofYbzphXTWrwbO19rpbT1vtuPWgLU56O59u2Kef3b+ZmT3tgsTg6?=
 =?us-ascii?Q?FedWpBikU1Jvb1glD+/KmI9emo1rRPWf45HHmYAxB9GXfzGWuYeP9JEjD9tb?=
 =?us-ascii?Q?RBYiih1aZECWfDf+eYOPRnqeFoFhZix10kYN/8n414j+4fL0JsasZZIpEHqh?=
 =?us-ascii?Q?zOhT+VjRyktiHzF/WH/unz5q7qXZJwR7AOrnSZLGZTdK9kw9lvEa0YW333JR?=
 =?us-ascii?Q?E9K5RPlJLL9OHO5gi3PlenrqaMMHZalhR/RtBjb5lV5Jt5zPbgFYn06Qm82Y?=
 =?us-ascii?Q?kVNHoRZrIiLnPK3B8SGoisyNvhGSc3gS8Wt7zGGNUs8CPXaJg9gjOk13vuf8?=
 =?us-ascii?Q?EfUg9MCQ3BJsoNiiBxGcar5RBKkZqeqCdglqh+2hCZ3eDkplSR9FkAHV8RDl?=
 =?us-ascii?Q?tnmdHJBfuuHk6YSKBWWASgpP6kmtMjoMnr1SOlqqHRA5QubgwAfpshUZgPEw?=
 =?us-ascii?Q?1pz+EtFZXm4ejKkZnV3aQHVRdN1HNoM9kUQ+X525H4aYb3VdiNiSjI4Z2xlQ?=
 =?us-ascii?Q?PVVVDMPBD+v7GKlg4XPtD5kkFgL/dFUUaZ/BZQ8C607voND0N8rFt7qNiI0K?=
 =?us-ascii?Q?5q0DjDx75sV77u8cbbaNS/9gSkOIrcz+ERNVOcTzpGb1KiRAyCXQe8FGt55I?=
 =?us-ascii?Q?tePQyG9svE2sH5ZJp18pEUrfOu0woBDjHa+1qRbFnhG0qKGJY4VzUwX/lmqM?=
 =?us-ascii?Q?s4OpCGMAT3i71Hs7SEsBEGGqPvI+JNcGNXDWfQLoLR7N9A+3Ki7QQh5MOeTa?=
 =?us-ascii?Q?l6jJedP1SUIpZ91KqEkQa7t1rqMl9ClQafb2tvtTs7Jx7RmCXX/N/LAyztcJ?=
 =?us-ascii?Q?Av8LFZCn5uTFpfI7C2FAvTb4LXHPvwpNOR+ceSkAzejp4EEcruLdXpAxVi/u?=
 =?us-ascii?Q?NN0lrBH8+aHSrID0GzZCW5W4ybjeVa+RVYny/X50xtpztvxPfHPnB38OgsPD?=
 =?us-ascii?Q?CFTNix71zf9PDgw=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 20:50:58.2671 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2927acf9-a0b8-488e-1f1f-08dd60de6cfe
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003F64.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7608
Received-SPF: softfail client-ip=2a01:111:f403:2009::61c;
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
X-TUID: Jzk+I6RBmLw2

On Tue, Mar 11, 2025 at 02:10:33PM +0000, Shameer Kolothum wrote:
> diff --git a/include/hw/arm/smmuv3-accel.h b/include/hw/arm/smmuv3-accel.h
> index 56fe376bf4..86c0523063 100644
> --- a/include/hw/arm/smmuv3-accel.h
> +++ b/include/hw/arm/smmuv3-accel.h
> @@ -16,6 +16,10 @@
>  #define TYPE_ARM_SMMUV3_ACCEL   "arm-smmuv3-accel"
>  OBJECT_DECLARE_TYPE(SMMUv3AccelState, SMMUv3AccelClass, ARM_SMMUV3_ACCEL)
>  
> +typedef struct SMMUv3AccelDevice {
> +    SMMUDevice  sdev;

nit: there are two spaces?

Nicolin
