Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp756247ejb;
        Thu, 2 Feb 2023 13:11:46 -0800 (PST)
X-Google-Smtp-Source: AK7set8/cGf3GAvlwojkMje9VtSSMtowUuiTJkPD+bTv1cKXLbArNDgfQvtUCcwqNX1BuJAPY3c2
X-Received: by 2002:a17:907:9917:b0:88d:6de1:96bf with SMTP id ka23-20020a170907991700b0088d6de196bfmr8423807ejc.12.1675372306092;
        Thu, 02 Feb 2023 13:11:46 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1675372306; cv=pass;
        d=google.com; s=arc-20160816;
        b=z99dY7RzmZnzx0UahhV+s8pyBs8YjKTPzbDL+wdayUfMSRv9TbEXbEqm11cWj5UwUI
         khGUVHfzeXHyfOMxEoDRU85r0ibjIXLwivgcxixlevv97tPU/kBqcVg27jJRstOaI57J
         +vKVzFy/B+KZ7+h1x99c8kvYVkUafSvFwTTPaGWP1G+cTwjyOVBsxGg5qy5uJh52g+Pk
         9BvKHpeJrbP6uRj4zru081Mi5BVHoqOI5mBpPPPc3J5XAx0eQv2pPDeg3sGOCv2xOo/Y
         2VRsX195HhKOz5DY6Or27l+GENyOIaZ3axhRG1Oav8/QwOD2pwPvDlXo9JeicwR2bAt8
         J6kA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=TdnUeiDw8d1UPxlgIx/ae7U6H4RyP/KDY59ynJtnUEQ=;
        b=BAqabYAmVKS1kNB1wzDC4FQWY4syaEYd3tp262ffLmbD8Tg34o8h2w8FeAgImjpHse
         BSGggkUW5kNXkRGxN97e2snW+oLrL95nFx5QA1iVh3ZdC6Sej1ff5TWZ66NCRjnNDm+I
         +ISfbxrs86DHPi8ukMFa2WH0jii3FFrFfUAUaySM1jaroWJX36YQKvbocAvYDa7D6XgC
         peFIZ7ees6soJXJOEbdkONma6A/WdT+pHqk27oCnSv04p/1ykKH2tspoJBQZYECFL9Nc
         9k+ig6x9d3HXO5/6BXQkSJj+bUYKpq8YrzdzIdtnAN1DBMhFM9ICwnX2yReT6khRd/Bn
         jqpg==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@os.amperecomputing.com header.s=selector2 header.b=tTZHyfqx;
       arc=pass (i=1 spf=pass spfdomain=os.amperecomputing.com dkim=pass dkdomain=os.amperecomputing.com dmarc=pass fromdomain=os.amperecomputing.com);
       spf=pass (google.com: domain of aaron@os.amperecomputing.com designates 2a01:111:f400:7e8a::708 as permitted sender) smtp.mailfrom=aaron@os.amperecomputing.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amperecomputing.com
Return-Path: <aaron@os.amperecomputing.com>
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on20708.outbound.protection.outlook.com. [2a01:111:f400:7e8a::708])
        by mx.google.com with ESMTPS id kb21-20020a170907925500b008834ce399casi645794ejb.36.2023.02.02.13.11.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 Feb 2023 13:11:46 -0800 (PST)
Received-SPF: pass (google.com: domain of aaron@os.amperecomputing.com designates 2a01:111:f400:7e8a::708 as permitted sender) client-ip=2a01:111:f400:7e8a::708;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@os.amperecomputing.com header.s=selector2 header.b=tTZHyfqx;
       arc=pass (i=1 spf=pass spfdomain=os.amperecomputing.com dkim=pass dkdomain=os.amperecomputing.com dmarc=pass fromdomain=os.amperecomputing.com);
       spf=pass (google.com: domain of aaron@os.amperecomputing.com designates 2a01:111:f400:7e8a::708 as permitted sender) smtp.mailfrom=aaron@os.amperecomputing.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amperecomputing.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jwvgQ8/xjo4PSOi2JE2N1/xEgMozk6XNSmGefR78Ny7+UGRFfur1PCWze2eGZauLPZj4za5B0h1rbkbOwDwQ4Jlqu/hldtPUdm0x1vQZTXmWh4bCjrb5fGF/dR+8KWMi7lWFyRK3UqRc6b6V5QTaWgQ2Nv564BCs5J9UIAS1T7DTuj76g5yxfmyWA6vLHAJdVy0QvshLfqO0AMG8t4YOXpwXy54EnX7RUcGDgF4kcnV3YyrEuWMtHSef9EhkTgJzrE+6ATrfr28Rs6bR9tFiGbIk5ls9h+6o7UDQ+Q7pf4sY/sF0NWyoGcgMaa6bBweDfmKcoKWgXSGRAo/nvfKBEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TdnUeiDw8d1UPxlgIx/ae7U6H4RyP/KDY59ynJtnUEQ=;
 b=YNU338U1sE0zHf3LhkTFeEcIchcOH5WTxo4zNuFdWN7tfuJj/bDgNvHKGu0gAbFP7gDDUqeRX5OuHvF8jkJtuanRoHcsb2fWpkKbkwvcsVBH2qR9bS+4BDgNsPMTIHzXqLlhQWf4ediVajH5X2dhtszXwciY6lFvmhFJEjYMRcLDP+RlFIKJqZ462/02SFA1vQ9KQlbZ5doHbUKM6zCYxf1ayT2m5W7rKAQakOphNVt3mE27Q8LYCOlWWROY/iKt7x0YVOFMjoZkaBhW8Gkb/GQ3ONX6XJBiPmV8Fb7xSoPJlbLgM2XOJMOs088auDY7oy3uci/e2o9DO3I/RJxyzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TdnUeiDw8d1UPxlgIx/ae7U6H4RyP/KDY59ynJtnUEQ=;
 b=tTZHyfqxkHW7S16NzTxsCLz6bspGgyndRCwVu9SwJs8sDydUDCL8ie0+c8vgxu35qp89RRrQhvU28eZGsxKlno9py6OAqQ9LPlGJAqKA78d69VwElTg+v+fERP5mLe+EuzD979nly/unWTs6AFZDw3OPqUgcnnfC1UcAVux4yGM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB7124.prod.exchangelabs.com (2603:10b6:610:f3::20) by
 BL0PR01MB4801.prod.exchangelabs.com (2603:10b6:208:7c::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.38; Thu, 2 Feb 2023 21:11:43 +0000
Received: from CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::c6ce:a93c:6bfa:2ec8]) by CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::c6ce:a93c:6bfa:2ec8%5]) with mapi id 15.20.6064.027; Thu, 2 Feb 2023
 21:11:43 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Vincent Dehors <vincent.dehors@smile.fr>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Aaron Lindsay <aaron@os.amperecomputing.com>
Subject: [PATCH 0/7] Implement Most ARMv8.3 Pointer Authentication Features
Date: Thu,  2 Feb 2023 16:11:22 -0500
Message-Id: <20230202211129.984060-1-aaron@os.amperecomputing.com>
X-Mailer: git-send-email 2.39.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH2PR20CA0027.namprd20.prod.outlook.com
 (2603:10b6:610:58::37) To CH0PR01MB7124.prod.exchangelabs.com
 (2603:10b6:610:f3::20)
Return-Path: aaron@os.amperecomputing.com
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB7124:EE_|BL0PR01MB4801:EE_
X-MS-Office365-Filtering-Correlation-Id: fc85a09b-0d43-479b-c773-08db0562157e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iICTxqKDfK63eaXvc8S1MDGRFP6xZ9LoXwUwLyekOKsuYZ9wuuXFiFIYdZBxkJ5XpVI9grsDj60KwVq+6aVieWUOaYRqE3qRuORZ4OaUMsfOJoMaG8q5c9lxTmQ1v7gsmUzoXXUk4HqF3vnWqJfXFRudjm0YF+7EPPifH36Zhw7tg68NfaMzMcTKqzRDX351uzEnoLn+jwENbmDpW0qefE6/caj9YULSTUzeev7+g96G5knQB9hi9obNwdTkJ+ZCdjBquXt25DwX6NBWpuX8v2PgqtMeSNJ7BsYNPKdCMVT+B+easdGn69toTKy4/FX4HmCl9TQJeGrvJXTI87OmFiEccZc57GdY4pfjygFs0/S3jZUKduYD9ykD8+sdyYxC/6VyWwF7EjiQOwiXD7Yf+MT89u/EAjGNgSZyxqamUZnBz7RouD623K9IG3LYUnEEo5cMW4NLhUlJ7xlH5Izo+MiWEWyJwcfq7omnSREruA9ofOtGL8IOBEQZvqMHLu9HLy3IZfZd+C7IJmRwpZ3lsppFDrjApkSBxBkAG2+ku99kVzVOOAPKcsP0RE72WS9Pdo5V9wK21W9Ph0O3chrCJokq7XT4Y8xcmcoQC4ovEfv1ByyhCqUNAJvNSmutgVLEZf39j9Al+nsOq4NgEu+SrYfrmw4gavL2hkMi4zPOIWLX3tqhARad9jiwLDOA2+iwJJmal+Us9TivJWOmn9DvUw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB7124.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(366004)(39850400004)(396003)(136003)(376002)(451199018)(186003)(4326008)(6512007)(26005)(1076003)(107886003)(6506007)(41300700001)(4744005)(8936002)(5660300002)(110136005)(6666004)(316002)(52116002)(66899018)(66946007)(86362001)(38100700002)(83380400001)(38350700002)(2616005)(2906002)(8676002)(66556008)(66476007)(6486002)(478600001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LuBWqHlEK1D713XJnoq68wxViNO4Accj1vYq7OhFefv2FSN5+JofYASSzmDq?=
 =?us-ascii?Q?9DaVrZKLbPug6LPd7P63ZI2SF0b228jyhPMAutjOoGtc99Eds+Vr7+ibzj5A?=
 =?us-ascii?Q?ZlOf815YuKxyFORNS/Xs2BlSOGTnsyuMRBkLMYKpdj0veyOzumHYhoW09feE?=
 =?us-ascii?Q?RfISJOZaa/7P0I65R2FVFNmoW86BGk+OtJ8pyP9rHZwGdPGMS7iWWD/qyk6U?=
 =?us-ascii?Q?51e1TWpIwF6KRBX3vjHiku0I+Lp7Wqk8IPMa3N3TkuQghQ5aBI9yXfWnV/M1?=
 =?us-ascii?Q?6DKDqWByTGgvR22nwu/yS/GMpARWtQmAWXXZ/PQpu49Dw0mlcx+pQhGSiTWM?=
 =?us-ascii?Q?GEz4oscfI/BqjqzfKsCTOlM7mxrASvL2siWNydvJiwr/DdT/hEhegJe0/XXU?=
 =?us-ascii?Q?98/VasDKLBYvYKQywhpMUGVyq31USayo7ELugfd4H9Z6Kuk0FF0QldcNQTIE?=
 =?us-ascii?Q?LbGLmWvVpkEpWlcddjdjKK1m2CHhC+m00ICxplsbt8+CX5ZDMXGqUxwFspyj?=
 =?us-ascii?Q?x5FE+ytNptTKmkOL4JGE/2c3RMEh7HW2f9V0APRcXAXKnxucoyMn3mI9PNqS?=
 =?us-ascii?Q?jDDlFkOxBH4gZLRpZ0WRkdqyh7/iK+XaewG5dxXGBxyLOwc5SQIEHzaAhYA6?=
 =?us-ascii?Q?PXk1MxLQs6En5ZIkb1DkqfiB+MV7hS1ffc9s1XlBYn1AvK9aAlgJJTdDbiHE?=
 =?us-ascii?Q?dmrt1xIpAZc7BAQeGqaC63iue/sV1GTz4F642m3kxtXUTYxGHeNgey9VpGco?=
 =?us-ascii?Q?RAkAVEB3JIb/uwUfHztbJzVbGPSf552GLKiAyjTgwzKX9Ud0eGIQqn4HiEUG?=
 =?us-ascii?Q?N23mwsmN/zb6GF5/6j4oscZ9mug+iLZKSso+qNnH7TO11Hk8zYxXGkjWGZwC?=
 =?us-ascii?Q?qbi6v6JIMgiME3A4RH08IMlDX7+v9bG5UUXRteEfUUAg+3w9a9q9m058TpC6?=
 =?us-ascii?Q?G4YCGvC5UB1H88iHeh8qVNbBYCwquO/ZANB84Wi2wDdf3nnmFl5HcjVrGXiP?=
 =?us-ascii?Q?u1v8KAxgxt7XB69QEHqDCmsJ5n8QORfMy5SKdgaVdtByig66c3tf7VN81Z5Z?=
 =?us-ascii?Q?ddeGVC9XS8jYq/WOkW/1hAglDm4ekzUZLu/W1FLLndH8o6WOHFjcD7o9n1Kw?=
 =?us-ascii?Q?Bl9P58zKuMWICMwpjHhDNkB/uUbNzpbmmGBTjw+TUiPyENA0+Zvdng46hTsg?=
 =?us-ascii?Q?zdrzjGgVjXf8MHZk2M4TXxMgK88XJC1phT3ASbsfsQSIj5EpBOkokaOet9Wi?=
 =?us-ascii?Q?kTZB3NeNryf5pbR+VLlqxQxpclsEidfZAN7ykuqDDchvQzGsLO65XFNnK2UF?=
 =?us-ascii?Q?pc45G5DzdAI2FEN7wMusgXebSI11QNH031Y3mUa1lxGOFpRRtEv+Z/Oi9+E7?=
 =?us-ascii?Q?tcz9Eekw3tQ+2apUz0xT1NN0BVxAsuLwS5JxKAf2fAUSivCp3HuLsHyiT1qU?=
 =?us-ascii?Q?kf9puF9jOlExCs70fW0vxVIwtCBvdvZVAZl0GZqhCTN/sZ/3Ko21wRsQcTA+?=
 =?us-ascii?Q?x2KG2NJ0ZH7rkFahKAFc1lzbqHNEhcSCGwkydEg0W6jG/SDYNEAESg+jkNM4?=
 =?us-ascii?Q?GcbKe7uWh4lB0pGlyTNfduZadG7zZ4fU5kin4oMjQd5nfi549oIEJYl6C+It?=
 =?us-ascii?Q?IvW2SG3FVSRhOhydDaJ8U+0=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc85a09b-0d43-479b-c773-08db0562157e
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB7124.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2023 21:11:43.0964
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Amgehy2slyysUHnlIEZgy6IJ6a6EWvRBQVWg6Qh+zJHELh1+A6Siw/SmxOdRRiNK2NgWyT5KCPXMtS9vFK6pYx+EQs57PYtiU4L4MrCfmIUkHRMy6vfG8UeO854DvWaO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR01MB4801
X-TUID: mZzJXru/015R

Hello,

I've taken a first pass at implementing many of the ARMv8.3 Pointer
Authentication features and welcome your review.

Thanks!

-Aaron

Aaron Lindsay (7):
  target/arm: v8.3 PAC ID_AA64ISAR[12] feature-detection
  target/arm: Implement v8.3 QARMA3 PAC cipher
  target/arm: Implement v8.3 EnhancedPAC
  target/arm: Implement v8.3 Pauth2
  targer/arm: Inform helpers whether a PAC instruction is 'combined'
  target/arm: Implement v8.3 FPAC and FPACCOMBINE
  target/arm: Add CPU properties for most v8.3 PAC features

 target/arm/cpu.h           |  62 ++++++++++++-
 target/arm/cpu64.c         |  81 ++++++++++++++---
 target/arm/helper-a64.h    |   4 +
 target/arm/helper.c        |   4 +-
 target/arm/pauth_helper.c  | 182 ++++++++++++++++++++++++++++++-------
 target/arm/syndrome.h      |   6 ++
 target/arm/translate-a64.c |  20 ++--
 7 files changed, 296 insertions(+), 63 deletions(-)

-- 
2.25.1
