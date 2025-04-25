Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp4433847njd;
        Fri, 25 Apr 2025 08:04:13 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCUMOYF6B9om0NnVCX26nBmq2gVPHcTuPJVK2xr0eJU/ro6CsXjuVoWNWKmqMhAd2ir6wtWffDy2Fi397A==@linaro.org
X-Google-Smtp-Source: AGHT+IHV6mn4UAxbEJ6XH7cRFkxtUMM0WvmmNBD4MAbbaUt47A2BOhhOlqihGH4RnpS+DBp4d6ui
X-Received: by 2002:a05:6902:70a:b0:e6d:efaf:3c26 with SMTP id 3f1490d57ef6-e7316a724acmr3182841276.1.1745593453098;
        Fri, 25 Apr 2025 08:04:13 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1745593453; cv=pass;
        d=google.com; s=arc-20240605;
        b=V8xTJdfwar+tHgVCteaVhsKCDONOr9sKPDmlEKFb8p+3CDz8WZ1SpfS58RUXXLYgQ4
         OEAqYllNeo1kHKOOOZJG21JOKDLprpxkQKMzXWjM2SdghhOO/JLNvYzSYbLb3tT5XR6J
         SKQozg3Wl47v9WekZxhvLFlUKeZBmcSJl2bMBIUujS0wVAbKjeaZwPGqCbPhljBi8eXB
         qwJ/MM93I3gojsi5C7Epn4ILOEjD9oing9U6J+znhYfisAr0UGvTw95ktjMixdU3/gKi
         HnHDkzpi6Woc78y9YJV1lhWqZ8rTqSvEZ4M8o3QiiyXQXOGMKLw1P3d+m07R+sfX1glC
         1hdg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=mime-version:in-reply-to:content-disposition:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=IoOlwyvVb/E1l6h8O1Gd24WKSEZL4zzANdt/LeszLe0=;
        fh=XqyZ5lja4LqQo4P++zhFsbKkqk5zQdHgEpNEIHRAawM=;
        b=e8cHvm4dlI0qmIl6jK1X3+Q63CG1NwSvado8SNA3zrQoIfMDVgiDbzW+Xe987pB50A
         Ik/HNi+xP+FKHmlBZQSeZBQQAXBe4YVgnJ3QovpNcWZoYbvYti6VQlvyqqpbPFjdh+FJ
         LS/he1bBBt1bAyIuTe0uREcQEmvBohgpkUQh9s/KTfCWXeEMaTPea0L0j2CFV002k2DU
         9lWl5DswgUuNNFvupbSP2YTXeAyjWMUPSZiyqVJZLH6SwuTcx65PPnRnO4ar+/1WXT/9
         Uhj+ZNILNjGXHMc7YiFM+NSY0IXiBmJ75MqLa1DY48p1StFUvJO6f/G2XZ0m4cMqU+TZ
         AVYg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@amd.com header.s=selector1 header.b=38lgTa1P;
       arc=pass (i=1 spf=pass spfdomain=amd.com dkim=pass dkdomain=amd.com dmarc=pass fromdomain=amd.com);
       spf=pass (google.com: domain of francisco.iglesias@amd.com designates 2a01:111:f403:200a::60c as permitted sender) smtp.mailfrom=francisco.iglesias@amd.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amd.com
Return-Path: <francisco.iglesias@amd.com>
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2060c.outbound.protection.outlook.com. [2a01:111:f403:200a::60c])
        by mx.google.com with ESMTPS id 3f1490d57ef6-e73040fd1e9si3764867276.507.2025.04.25.08.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 08:04:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of francisco.iglesias@amd.com designates 2a01:111:f403:200a::60c as permitted sender) client-ip=2a01:111:f403:200a::60c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@amd.com header.s=selector1 header.b=38lgTa1P;
       arc=pass (i=1 spf=pass spfdomain=amd.com dkim=pass dkdomain=amd.com dmarc=pass fromdomain=amd.com);
       spf=pass (google.com: domain of francisco.iglesias@amd.com designates 2a01:111:f403:200a::60c as permitted sender) smtp.mailfrom=francisco.iglesias@amd.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jkJzqIr9eoTIlWR/pMUPjVqhg/wLksoaUHc3VKcgJfYyKN8Yh8O99RUyBk+/pWcRMTJ/nOFWuHqoawrhCiWBkKNLfvqQtWZ/TNDHS5QSMoySokrKmfV11WgssWuVZAWlni2KzJYHVOd/EqXqiRx29h8vgLRSYhE43u+SDTzcVV3c2FwUb1EI/xy6b1+nDres2eL8mF8HyS7E2XIqoQIjtZGAtAdA9tZ5q7d0+2rYfh8z/JqBHJwODI0VUkI3q+jx6V4xryiZIJXtKzOehznIrM+eGpTgQ+nmnDrMBuOv8h1+XjTfOdWt8AclHe3iqXvqRWZYBpIX9OVZeW3hmvdDFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IoOlwyvVb/E1l6h8O1Gd24WKSEZL4zzANdt/LeszLe0=;
 b=ef6eKWEcw5x/qmguQnojir282HnSBoTIGp4dYDSQ7WcNVHmqXnOhCXD43+eZKkkynnnAzNSrxaAN0+hrFNGXUiObmtvE9ZBsN2y6liC/LKEv3FDoUlcwNpD27tMKe8ITnVG3tvGtSmWiDBzO3cahfk0PGjG7S9reHlLhnz4TkVpv4uIaTs8fydLv3u/o3WzPN/SsOJe4z0RzcVbiiir2yykucdVIT9qSv5WbaKTWgd7Y9ET5CJtkmtw/DslTIVmammOCJRKdZ2XTqkI+YjILNHSxqF/WSJ2LCU5D8eFD9rd3tc/XYB3DPg+LIbzi/a2iz6V+/pHwWmdkzFKq3le6KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IoOlwyvVb/E1l6h8O1Gd24WKSEZL4zzANdt/LeszLe0=;
 b=38lgTa1PXJBXKuioOGXRryTv++ZWnEUtPHKLAy/mV8+bXn9u7L2yyrY1Whbd6M4WcOCjes2MtO+asD+ZtM855FQLF3I5lmvpTuv78k8PYaZxOA3aUnvPytWwUs/c8JG6PheZLLeYifxb44CBf2m0FHcyaV13ZtbioikFNZ7/CTM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB8739.namprd12.prod.outlook.com (2603:10b6:a03:549::10)
 by MN2PR12MB4078.namprd12.prod.outlook.com (2603:10b6:208:1de::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Fri, 25 Apr
 2025 15:04:09 +0000
Received: from SJ2PR12MB8739.namprd12.prod.outlook.com
 ([fe80::29bb:9aa:2a72:df1b]) by SJ2PR12MB8739.namprd12.prod.outlook.com
 ([fe80::29bb:9aa:2a72:df1b%3]) with mapi id 15.20.8678.025; Fri, 25 Apr 2025
 15:04:09 +0000
Date: Fri, 25 Apr 2025 17:03:54 +0200
From: Francisco Iglesias <francisco.iglesias@amd.com>
To: Kohei Tokunaga <ktokunaga.mail@gmail.com>
Cc: qemu-devel@nongnu.org,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Thomas Huth <thuth@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Pavel Pisa <pisa@cmp.felk.cvut.cz>,
	Vikram Garhwal <vikram.garhwal@bytedance.com>,
	Jason Wang <jasowang@redhat.com>,
	=?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
	Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>, Peter Xu <peterx@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>, Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org
Subject: Re: [PATCH v2 07/20] hw/net/can: Fix type conflict of GLib function
 pointers
Message-ID: <aAukWsGgmQS5NZ1w@xse-figlesia-l2.amd.com>
References: <cover.1745295397.git.ktokunaga.mail@gmail.com>
 <4d47a75c5768c9a6dc5d8b3504e78837577ad70d.1745295397.git.ktokunaga.mail@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4d47a75c5768c9a6dc5d8b3504e78837577ad70d.1745295397.git.ktokunaga.mail@gmail.com>
X-ClientProxiedBy: LO2P265CA0078.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::18) To SJ2PR12MB8739.namprd12.prod.outlook.com
 (2603:10b6:a03:549::10)
Return-Path: francisco.iglesias@amd.com
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8739:EE_|MN2PR12MB4078:EE_
X-MS-Office365-Filtering-Correlation-Id: 29ee9a65-2667-47a2-16cc-08dd840a6e68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N0puRHVtSmVxeFZaSDlleVplbHBiZG1FNFc5eVYyT2JhaUx3bGlac3RGRVZy?=
 =?utf-8?B?VGprdTEzRVByekRzMEM1cGdNZkdrcTN5akM2WmhwOGFxZHVEQVBteDk4TDMy?=
 =?utf-8?B?eExXdW9INEFrRys0ZXcyM0Mrd3NIejZobHNPMTNiWEE0dER2eG9yYlA5UGFv?=
 =?utf-8?B?czgyZ014cjVVcnFtZFJEY09QYVNFc2VadENURlV2c00wNzlXZlhUTWlHa3M1?=
 =?utf-8?B?c3dUanA5TW9MMGJwMkliUksvQ3BSWWIwN25ITDZ3MUptV0N3VUIrcEw1eGh2?=
 =?utf-8?B?OER4cG1MdGI4cnFQS01KdEdpZFBwa244OGx2WmxqcUJCWDFvVFJPeUVIRFdr?=
 =?utf-8?B?R1BDYnl0Nk9zeXlwQ2s3WUdwRDZ3UU94RVVHTG9HTnV4WU4vOVVPK29OMERC?=
 =?utf-8?B?NkFOTS9HamppakpSM0VlMTMrTUpRMVg2b2lBQWZ2bTJNVHBxQm1Sa0FMRHc0?=
 =?utf-8?B?YnNZMHBKZWZIaXRSMWd4akxJVlpod0l2eHN4ckJaZFlSRjFUaGdhYmRWSzBn?=
 =?utf-8?B?N3BXR2diMmR4ZnVUVmtaVzFjQy8zaW16ZTJ5TEJ0cEN3Q2hFdGlrSnpTbGI2?=
 =?utf-8?B?bS9NZHZienMwQWR3MWw0OTZ4V2Z0ZWlLNTArUU5TTnlxQ2RSTlRJYkxURG5B?=
 =?utf-8?B?TGdlYzYwdHZEL2J4ODRzNjdFQTRLSUhpeEdrV1BsdDJGSlNnOWVmSWZZWmFL?=
 =?utf-8?B?TUgyU3Mxc2JhK0JlQ2JHeWtHc1k3N1JGSUF2OHVZejg0MlhrTGZFWWRNc0Y4?=
 =?utf-8?B?TkRUdHBXOHVNOHI2UnZySzNxSUZqZWozNmp0Y2l5ekZhNC9oT2RQdFFiU1ZL?=
 =?utf-8?B?QkdGVFlVeGJKdzNlTkVhS0FsOEcyRitaZlljM1RHT253dEZxZFpsUndTTTZo?=
 =?utf-8?B?cGRmRENWdDBhRTBScjl1ek1LVFR5MkhSMDFpZ2dhWE5yTUVaNE4zVE5Obmsv?=
 =?utf-8?B?VGhTYWdvWkpMRmFXbnpqc0pobDM5b3dkS2JlUHNJSU1tWnlGYXdQSVQvZUlN?=
 =?utf-8?B?Mno1ejAzN2lqaXNSMkQ4N0lmL3BSbFQ4UW1ZZitOem9uelZVTFhwRWxKbHI1?=
 =?utf-8?B?TkFvVDV4LytmTXBkM1FwQ2RVdUhYMkFRYTNQekVnZTcyMXFVQnlRbXUvK0tk?=
 =?utf-8?B?L0xTR3dwYm85V1piQmZ3QjdhWDFPQUtlNXovUnNSeDBXdVFkM2szejA3Y01B?=
 =?utf-8?B?YUprNlQ2eFVyMFNZbXAwM0xuUkhUYlNiM1B2Ty9FWENXOTljYzFNdkVHaUZo?=
 =?utf-8?B?OUFub0hPSlllRzF6bUJuTi9wSXkrcFlUVU03YWRXZmpKZGRVWC9HcjF0SGVT?=
 =?utf-8?B?T3hPbXAvdndJanBvYzRWdyt4WUM3VjJ1NktLdXVLNkx2S1dNaGp6WkR1b3Iy?=
 =?utf-8?B?TEkrTVZhclIvOEtMcEllUnJyamRIaGhBRmNzNml5TjFpR25VWmdvWi9Bdk5u?=
 =?utf-8?B?STJlU2FNTEtPaHNJdnhJWTBqR3EzM3ZTUFpBa2NCRGVOT2Z0YXdiR282VWlN?=
 =?utf-8?B?dU4rRVZrbTM0eHc1THVSYjBRRGtZWWxUcEhvdStDOTJRS1dxYkFqWllXS2Y5?=
 =?utf-8?B?RkhXOHMxc0UvT05wMlBTUmcxMjNEQ2dndnZLT2RQbWY1V0JSRk9hL2pMZmM4?=
 =?utf-8?B?d09QMExxMlYvMWNhenF6YVMrQklrNDZuZmM4T2xoOUpaak5xYU83TDRQMmM4?=
 =?utf-8?B?ZWpaMi9BWjZCK0t6OVY5NzhoaDJSSjNzVlhMaUt5eDZSRjkvOHJWaFd2WVRK?=
 =?utf-8?B?NzBxdDlZYysveDFrcXErdFVoZVBiWlBmZ2NZNWVKSU5sbk1IVXdjTk01d0tU?=
 =?utf-8?B?Y1Z5TC9oMGhwVGtnVGZ3bFR3WG5RbUFNeDlpaVE5U2VxbGNTRE4vcjJGbVlx?=
 =?utf-8?B?NC9HSThPV1dUbGovWTRod1JvQVJReWkrQ0UzaDZnckJmVG1EWHliOGZYU1lO?=
 =?utf-8?Q?TDHZ6lixnrI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8739.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U2dxbzJjdXF2MWlhdXFtY3g3dnJUV3pFTXlTSWhjOThGNGx2SjdHMzlITFRH?=
 =?utf-8?B?K2t4d2lXZFExT2MveWNLbzdtU2VSSGRnZDZFemUvMzNIaTZBSFBJMnZHeTVj?=
 =?utf-8?B?d1l5QzFONk53T29uZE4vOTdPVkFuYlI5UGFNN3RFbUppOGdWcHAwWlkreXVF?=
 =?utf-8?B?QWhaZUw5QmNUMnBLZGZDOVBaaUNvVW5jMTNCMDJtVHlxS054WlRMREpuR2Fv?=
 =?utf-8?B?WUlmKzNsM2Niei9Tem9wNjR5djBqbnNiL3RvNXZDWlJXT3QvbE9zeXlualJY?=
 =?utf-8?B?RU1WYkwvVCtObHdORmgzSGxNaHBSbXBNaGN4UUg2NXZTMlRSWHc2OEhQR2lR?=
 =?utf-8?B?WHkvc0JmcXI5Y09sUGFHZlBuTS9uVE8ralpuUm95TU9tbXJic0s1MGJHQ2hp?=
 =?utf-8?B?cXBHcjVmdlo0N1pnVVFZS0xJYmx2MG9LUFBRZ0VieFhreEdHNmhmWDhhVXQz?=
 =?utf-8?B?ZnJUSklzOVBLN2cwUDNpYjBrMkM5OTFGZ3ZRUFF2RmhIand5NS9Hb3RQS252?=
 =?utf-8?B?VjNMYTRreUd5NWxNU0VKbGI4US80UFFtUERnT1VWc2FGT0dMMk5TczNGcTZv?=
 =?utf-8?B?cmpyMVZHbHlEeHB1bUZjZFJzbXc4NGM3d3Btbm5aT3hIYWROcWxmaUo4Rm8y?=
 =?utf-8?B?V3UrYUdXeUtQcU1sd1hVNHVHNXBsVDlsVXRvRTdHTi9BSmNTOFlvMjdQSm9Q?=
 =?utf-8?B?MDFvWGNLeUEwYWYzYkZlMFpVRnQ3SWg3SGdJdlgyYUQ5dkRnTm5FMWFBSTZn?=
 =?utf-8?B?WVZVamd5Y0dPeWlvTWViVk55Yy9MSlQweHJTUnN2OUlLdTd2S3JqMWdRc3ZW?=
 =?utf-8?B?VDdJSGhPWHN5Y2JhWDlUbmR6RGszS0NBUGdVQXlUdkpFdG4zQjVkRytjaFVZ?=
 =?utf-8?B?RlJxWDFUNHE0TUM5dWtGQXAxc0hZM0JVWkZHUVFTbjRJQ29icVhMeXd0N3Nr?=
 =?utf-8?B?NHJ2Q0gvK3N6QThuQzFZTjZPK3QyUWVIT21wTzhnbU9vbUNNRHRPUWxONUJu?=
 =?utf-8?B?L0lFVGgxaGhidDV4RGZnZCt4QlFuYUVDS3g2R3VwWkl3bm5kZVlqWXhYYytT?=
 =?utf-8?B?S0VPK2JOTTByNlNkdldYaXI3M0t5UjBMZmUrNlUyaXVReExxRXJWU1ZqUjVY?=
 =?utf-8?B?OUNRd0hnU0x6N2F5NWo5TERpN0dtWHdEdExaZnJIbkw2UUZRZVFqbkJGRjFK?=
 =?utf-8?B?d3l0OWxReU1Wbzd5Z2NTTHdzOFRoKzFrcFJybTRkMHdCb3BIbDRxR0Q0MnJ2?=
 =?utf-8?B?bytRNGNoTjJIMmlTQWJ2OU5lTWRzY3dhWE1kL2lldEdWcWkveTFFc1Y3UGtz?=
 =?utf-8?B?T0pMSlgwMnFjejNGN2prRmNIQytlZzJrQUdWSHZORlduTjBlN2RVY3VjbHpq?=
 =?utf-8?B?VXFZbWNSMlNJbmE1UXRYSXZpTmplU1ZoUVM5L0tKS1lWWmR5bWtaUDB2MTJZ?=
 =?utf-8?B?ZTdSY3owKzV6Z3BjVFpEa1I4OXRGYUovS1VWOEhXd0lYSXg0UnhDcXpmd1Mw?=
 =?utf-8?B?UDVtVkZWU05TaVc1K1ViZlNDZUlDNnViK014a1IzUjdrUytnYzhNOHdLdnJH?=
 =?utf-8?B?My9PNzJkOUpEQ0Q1eDRzR1BoQ1FzN3lBWS9OaExkSFFGYzN0WGkrQlNQV0RS?=
 =?utf-8?B?OWY5c3Y4L1N4bDVVZndlRVJJRUVRQXZGOHc1MnpBTzVnQXNyMFU1N0RBNHIz?=
 =?utf-8?B?YnlZUy96cCtsSFFlSEZZcEZXSE4xWVhNRm1ObmRlOHp0UFkySDlqa0MwZlNM?=
 =?utf-8?B?KzVOeVdLSFJuaTgyN0c1ZjZTL1NUR0JpMGJhcDJ5VEVndFhzMVd0ajN6cUFv?=
 =?utf-8?B?bllzOVVTeVJNSDNReW02T3VJM2ExUVY4TkJXN25oWmlsZW9TajUvZURRNi9H?=
 =?utf-8?B?azJZTEEreW92MjcycVNRa3hFK2VsZ1NNNjNUUDBrb013MC9vMTlsMmdyaHRq?=
 =?utf-8?B?cHJiR0NRZzB0NkxiUXU3Q00yOWdFR1RvSTMrQjN0VHFvS2Y4NXM1NFJUMnlk?=
 =?utf-8?B?T0plNnpzNWVDT2FjeUNHYjVXa2xiYjR0WGNibkFVUXlhY3ZQZndoQnd5SHNY?=
 =?utf-8?B?UGFZd2xxOW9CNm03WUcycTBndlZqS2VJSmJFdUNEeWRGTU5uT3VMZlRJY09I?=
 =?utf-8?Q?pdukLnzewpRo2+x4seauKO5CJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29ee9a65-2667-47a2-16cc-08dd840a6e68
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8739.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2025 15:04:09.6270
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4BhB9Ddq6KIyr0OELyonMjbbvUeaBuuBWzhA0jfEZqV38rn37VojTUd1WzIYsRhOIDNpTkcn51SWKEhIuGMR9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4078
X-TUID: 0PAV72pw0jdC

On Tue, Apr 22, 2025 at 02:27:11PM +0900, Kohei Tokunaga wrote:
> On Emscripten, function pointer casts can result in runtime failures due to
> strict function signature checks. This affects the use of g_list_sort and
> g_slist_sort, which internally perform function pointer casts that are not
> supported by Emscripten. To avoid these issues, g_list_sort_with_data and
> g_slist_sort_with_data should be used instead, as they do not rely on
> function pointer casting.
> 
> Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>

Acked-by: Francisco Iglesias <francisco.iglesias@amd.com>

> ---
>  hw/net/can/xlnx-versal-canfd.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> V2:
> - Updated the commit message to explicitly explain that function pointer
>   casts are performed internally by GLib.
> 
> diff --git a/hw/net/can/xlnx-versal-canfd.c b/hw/net/can/xlnx-versal-canfd.c
> index dc242e9215..013ebc10dc 100644
> --- a/hw/net/can/xlnx-versal-canfd.c
> +++ b/hw/net/can/xlnx-versal-canfd.c
> @@ -1278,7 +1278,7 @@ static void tx_fifo_stamp(XlnxVersalCANFDState *s, uint32_t tb0_regid)
>      }
>  }
>  
> -static gint g_cmp_ids(gconstpointer data1, gconstpointer data2)
> +static gint g_cmp_ids(gconstpointer data1, gconstpointer data2, gpointer d)
>  {
>      tx_ready_reg_info *tx_reg_1 = (tx_ready_reg_info *) data1;
>      tx_ready_reg_info *tx_reg_2 = (tx_ready_reg_info *) data2;
> @@ -1318,7 +1318,7 @@ static GSList *prepare_tx_data(XlnxVersalCANFDState *s)
>              temp->can_id = s->regs[reg_num];
>              temp->reg_num = reg_num;
>              list = g_slist_prepend(list, temp);
> -            list = g_slist_sort(list, g_cmp_ids);
> +            list = g_slist_sort_with_data(list, g_cmp_ids, NULL);
>          }
>  
>          reg_ready >>= 1;
> -- 
> 2.25.1
> 
