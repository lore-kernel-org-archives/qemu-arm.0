Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp1859825njb;
        Thu, 20 Feb 2025 00:17:38 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCXmSM0ebYSx6O2uqz07cbIMmzIAPbFNW0vP4mm9h4lwlo9sBsg6+gAzKjpvVH6kkNWBmbi/QNB3HDXbzQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEPmCy3Xtw8XGh2d4pOVpFCKmg0Tb6peF8Mqz8TGzR9yAHbwW7dVFJB0g49DiYvwoVMMnn6
X-Received: by 2002:a05:6a20:7284:b0:1ee:cac0:1b42 with SMTP id adf61e73a8af0-1eee2e1d0b7mr4112858637.5.1740039458366;
        Thu, 20 Feb 2025 00:17:38 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1740039458; cv=pass;
        d=google.com; s=arc-20240605;
        b=G+bqTDFHv1KkLo6esHFGpHUGw44O1pYYyKJwhE3+mWARwsHA5nDR0UGc6u8ShLbICi
         Bd2KyePD8aG2/SNaRk5Pc8bvN6L1oDl8g6GDbhyCcTMjFgAn6+pUu2dNzfynR/aTOIIx
         tFqBqWizEyzVZj0hqkzIFTQelKYcjK7a0fRczxt7K3XQh5z35KzKArguxvo0vkvTBsHC
         chs9CuIaOl9xF6AXRaLTeCZmSGCaNtQ6079zlw7UZUDwnNXRKr9h4cRa6eNL38jsOosC
         E53dk5ld1kOO0zYjbisdpfghhp/ulTPpNC1oEejTdtMYSuZV4zMANGzXUmEliLG8XIR+
         Qzqw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=uUBoKSk05DK2fTdE3csISnaoksFe7GaF07MSbdbU9Eo=;
        fh=McEJFpNWooeu4KfjMpm8Y/6NgpK0tuD9PnL3C9AEwbM=;
        b=dLNfndT+7ovxBvaDBvLGlpfyjjjaLZObar6GPK0hFBvtQ9RAFprxlsJeyDbqIB26Vy
         r7+HWy4I29Kn8n14+Cagk1St/+n5UibiRS9SARtP+vz7BPEBZ5S+Tf7nQOkyzkMcwLJc
         hVTlyedMf8qb11688Bp1R/HolNAAm8DGFhxKzgORHE7WEIc2eE/zzr809eqOKhj36l+R
         3gFLuH8JSI1uFpGqZu4/fnqN7g1u3xARms6TTBCASGZ6DWaGboG0rzpm7t87NDl60khl
         cbzuPuDxU6LMvAV+2uvjrY61luE4RkIf7mO4X0LDDpcE2F0p64ARm6KV/OJ+Mr5ZozWf
         wV7Q==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@amd.com header.s=selector1 header.b=TbfV79QJ;
       arc=pass (i=1 spf=pass spfdomain=amd.com dmarc=pass fromdomain=amd.com);
       spf=pass (google.com: domain of luc.michel@amd.com designates 2a01:111:f403:2407::60b as permitted sender) smtp.mailfrom=Luc.Michel@amd.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amd.com
Return-Path: <Luc.Michel@amd.com>
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2060b.outbound.protection.outlook.com. [2a01:111:f403:2407::60b])
        by mx.google.com with ESMTPS id 41be03b00d2f7-ae0fb9ae329si10235829a12.691.2025.02.20.00.17.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Feb 2025 00:17:38 -0800 (PST)
Received-SPF: pass (google.com: domain of luc.michel@amd.com designates 2a01:111:f403:2407::60b as permitted sender) client-ip=2a01:111:f403:2407::60b;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@amd.com header.s=selector1 header.b=TbfV79QJ;
       arc=pass (i=1 spf=pass spfdomain=amd.com dmarc=pass fromdomain=amd.com);
       spf=pass (google.com: domain of luc.michel@amd.com designates 2a01:111:f403:2407::60b as permitted sender) smtp.mailfrom=Luc.Michel@amd.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NnJ23yWEMgNZOaVPRbT5Sjzv98t4Srom1q8tu1jM4KvfbkGYcEb8dRstbMRyNi1w/G2Uy1tyJAFm9EeAQxQUtA4+IC/3e//T5w6NgtLSj5jEOL2oZ+7iLOWZGxohxd7oHXSOYxWRZmR6pQAzQVA0dBlP8t887mfXvVvhaJ4xoUPLQlYAJzw9aMb6KrCt2xiknv0aotZGm/7VFfqJN38LqjqkOuXSrkB4Dr3g6Tum8R0foZY6B6+Qri9nzZ+dMiw80AmaKrEijt8UcUA2q3WTiaFoU5GKVHOzIabCg4JlZdvQ4A9whX2klEqvJI4RFyBziurEQ2XnaQ2RFeozDhTOsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uUBoKSk05DK2fTdE3csISnaoksFe7GaF07MSbdbU9Eo=;
 b=T/tJW1CXPBqcM5lkNpVq56ecZcROTPbICwFSQyjTAWd9H4NBsMV74YhrW43fxn9ufyZhG5OThcXNUDgBTX0ldDdMSS1PMCETbgYZju/vQAgLFL2tH53Gcw7JNzIZejLyqAXV63nn6PrfMWnnoaW3oC6o2VdWxEdJLyWH0Yuyg4o/gU6DQACM2xzPWRgBEdcLhEl6EYqGod1f6yrTcsBjr4rN1jv2eIgN90obyV4xVfSI/uGM2qeX7J6VNVDIfi/Pi4sQWhK4OpcGVghJNTEYIeMdf7HswvqphPIbTADYF8N6lNbn414fkocymuZXBZUUYUFnbPqA4voicDJAoxZ3SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uUBoKSk05DK2fTdE3csISnaoksFe7GaF07MSbdbU9Eo=;
 b=TbfV79QJRC60p7YNzoHjIeuy/sN6ffSQl4aFJrLCWmC2afvK7HBsdD7JyTanr5q7aiyEeBN0eevkZerHje1jACJkS/ZTbF/eO0C2r53vFRkmGA14iF1cgtx9Kl0AiGQ84o2lkaOdIqiMETy673aaCZcRXH1qUQ1kpC/X5hwszZ8=
Received: from BN1PR10CA0016.namprd10.prod.outlook.com (2603:10b6:408:e0::21)
 by CH2PR12MB9457.namprd12.prod.outlook.com (2603:10b6:610:27c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.15; Thu, 20 Feb
 2025 08:17:33 +0000
Received: from BL6PEPF0001AB53.namprd02.prod.outlook.com
 (2603:10b6:408:e0:cafe::a9) by BN1PR10CA0016.outlook.office365.com
 (2603:10b6:408:e0::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.20 via Frontend Transport; Thu,
 20 Feb 2025 08:17:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB53.mail.protection.outlook.com (10.167.241.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8466.11 via Frontend Transport; Thu, 20 Feb 2025 08:17:33 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 20 Feb
 2025 02:17:32 -0600
Received: from XFR-LUMICHEL-L2.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Thu, 20 Feb 2025 02:17:30 -0600
Date: Thu, 20 Feb 2025 09:17:29 +0100
From: Luc Michel <luc.michel@amd.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
CC: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
	<qemu-devel@nongnu.org>, Evgeny Iakovlev <eiakovlev@linux.microsoft.com>,
	Rayhan Faizel <rayhan.faizel@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>, Magnus Damm
	<magnus.damm@gmail.com>, Peter Maydell <peter.maydell@linaro.org>, Alex
 =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, Thomas Huth
	<huth@tuxfamily.org>, Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
	<qemu-arm@nongnu.org>
Subject: Re: [PATCH 4/9] hw/char/pl011: Really use RX FIFO depth
Message-ID: <Z7blGQR_KDCjn6cG@XFR-LUMICHEL-L2.amd.com>
References: <20250219210841.94797-1-philmd@linaro.org>
 <20250219210841.94797-5-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250219210841.94797-5-philmd@linaro.org>
Return-Path: Luc.Michel@amd.com
Received-SPF: None (SATLEXMB04.amd.com: luc.michel@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB53:EE_|CH2PR12MB9457:EE_
X-MS-Office365-Filtering-Correlation-Id: 5afd59c6-4889-4d5c-43ec-08dd518706eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RzdVR2R1cVhDZEVrSGtBQmtKTUtTTnFXeGd2bDQ0UDFnUVI3dXA5WCt4a3JG?=
 =?utf-8?B?cmhDSzlESzV3dHBXNWFCRUd1a1hrbk5obFVmRWFSNWRFbXNKTXZ2K2RUZWFY?=
 =?utf-8?B?WjNMQWNjZHkzcXoxbHFjaTlZWmVKQWZLWW9rSFZqQmVtVEFENndHYngwcDc2?=
 =?utf-8?B?d3c4dEVCUkl1UDB4Mktsc3F4cEU0VU95RVVxeFJyWGtROXIzUldjZG0rRWJU?=
 =?utf-8?B?bHQzZDRnclpNUGVyRUE5QjFHbUpMR1NwV0p5d21NS2d6eU9BQWo1WjNaUy8y?=
 =?utf-8?B?Y1c5VGRQUUlqbjFrK0N3ZmpmY1k3YlQ0cUhua1RRQjFERm1CMU1vc3NrUklt?=
 =?utf-8?B?QW9iYktvMmFuVmFKMml3Z05LcTZMWkpRMjhYMERRTlFuWm12UTY2OFM0TGMr?=
 =?utf-8?B?UGFJUjFKeHV6VXlORzR0SVd0M2Z2U25Ua3hNWVBrTDVkN0Zsa0R4YkxQZ0Fy?=
 =?utf-8?B?eXdybXlDU2ZKY2R5ekN5NktvbEpKVTVnMGpSTmwxcFJTYWlDUE85NmY3cE0r?=
 =?utf-8?B?RXlvb2dvdFUvREp0WFU1N1EyRldpRkptQlV6QmM1c0FzSUtPRm56UjVGYUwr?=
 =?utf-8?B?NUdpUHJTbUJpUXpmNnJnQUpZd2NWM1FDRHBqSDJPRlphYlhTQXNXVXlMbGQ5?=
 =?utf-8?B?N3A5NWNhYnYyenFSS1BQUUMxa0kyRytUMDhXRDhqZW1GYUhsVDJCNUFOWDlE?=
 =?utf-8?B?d3BJellVeW9iS213UlBDb3hveWRqSkhEZlhkK0FhelRmc0cyUmRiSkt2U2t2?=
 =?utf-8?B?b3hMdWdnUGQzcDluNUpqOTJRWUNMOXAwVDZpUnQxMk1VQWkvZjQ2WFNsUkVP?=
 =?utf-8?B?U2M0RWplZVkvdmxEUEJDOVNEY1dUdXI5dy9zSTJnRU1yR0xELy9oYnl6ZGhQ?=
 =?utf-8?B?V1Fodi9PZUsrRGxpbTZNN21MT0VTcVFyZHlsN2dvS1ZPWmNmeXA1bHpPTFdS?=
 =?utf-8?B?TTFsajEvYk02L0llUGY5aEVRT3NKbGM1NmtNNnh6RlRITFpnQXVtV09ORnFy?=
 =?utf-8?B?L0ZzRnRENFRuM0ZpU3NXa3gvQ0N3RTRMUEdUYkY2cjVVd084OEE4amFlVWhq?=
 =?utf-8?B?clcweHN3a1Z1dGkvR0NaQlBsZjRhTDIyendRa3hTRVIrUmRRZ2VwZlJhYVNt?=
 =?utf-8?B?akhHdnFLNE5NSmZ3ZzNIcDZuZGZGaTBJZVljNTRpUHhsYUFyN3RZajdwWUFx?=
 =?utf-8?B?eWE1RHpjcFY4UHVndGcxL3VLcFpoNHBTL0taWktCWTBjdW9MWHZUc0d2OHJu?=
 =?utf-8?B?bmNlYVFIVlFIb3huNWwwK25HdklOYTBSZnFtS0RyMW5WS0FKRUJ5UE9UM1Vm?=
 =?utf-8?B?WnJEdFRXYVdETjI5dnNTb0cyb3g3dlN5R2xDeUJ1d21EWnp6a0pRME9RWGEv?=
 =?utf-8?B?MWV3MkZXeVl5WlRDRWZob0VSaU9GU3AwdUczV1pWdndtN0NWMGV4cnphcE9a?=
 =?utf-8?B?NVlsc21iV2s1MFZFMlBSRXlzbmkwcTZGRG1mSDFxeHhPeXY4Rys5VU1RY3dM?=
 =?utf-8?B?aHhuU2dLbXM0bG9OcEs5OGJnaDFpTExsOW5yN3pEaHFmMnd0eEtPYWdSS1p0?=
 =?utf-8?B?QmcyblBiY1pzUTJXMWhWR0tZZHR3dkUvQnpPVGhrUDdyUzNzS1gzODFtWUlO?=
 =?utf-8?B?MUk2QmFnVXJGTFZWcnYxRGd6UmhnQnU3VWQya01DcDhSYkRtRHZRbHUyZEtl?=
 =?utf-8?B?YWRQODdVM09Obms2YlJLME9OV29EV3hVTTBUNTV1TjdnMTZXVm9acmVJUG9s?=
 =?utf-8?B?S2NqaC9qSDh5M2tmeHhlc3N0ZU40UzJFem5XWWM0ZmFxdnp2OUdEbUpZajRi?=
 =?utf-8?B?R1g0ODM3Uk55ZEIrenQrd0RScWhxcVovMjNMSE9zK29HYWhCV2NKeitHM0hL?=
 =?utf-8?B?Vzl0NDBWbFlWQmQyeFp3cUpwQ0FpVXcza0lEaThhblVZeFRaZmZadDVSMmVR?=
 =?utf-8?B?SEhQSnN5YVZtR1ZlWUxKdzBaN0wrRFQ0NnRseUdYcXc2UVFCdXpuWW1YQjlt?=
 =?utf-8?Q?6PHML0LD2tBSZTiNtSPUSnsU6GOuts=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2025 08:17:33.4682
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5afd59c6-4889-4d5c-43ec-08dd518706eb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB53.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9457
X-TUID: hJZrAJrK62mc

On 22:08 Wed 19 Feb     , Philippe Mathieu-Daudé wrote:
> While we model a 16-elements RX FIFO since the PL011 model was
> introduced in commit cdbdb648b7c ("ARM Versatile Platform Baseboard
> emulation"), we only read 1 char at a time!
> 
> Have the IOCanReadHandler handler return how many elements are
> available, and use that in the IOReadHandler handler.
> 
> Example of FIFO better used by enabling the pl011 tracing events
> and running the tests/functional/test_aarch64_virt.py tests:
> 
>   pl011_can_receive LCR 0x70, RX FIFO used 0/16, can_receive 16 chars
>   pl011_receive recv 5 chars
>   pl011_fifo_rx_put RX FIFO push char [0x72] 1/16 depth used
>   pl011_irq_state irq state 1
>   pl011_fifo_rx_put RX FIFO push char [0x6f] 2/16 depth used
>   pl011_fifo_rx_put RX FIFO push char [0x6f] 3/16 depth used
>   pl011_fifo_rx_put RX FIFO push char [0x74] 4/16 depth used
>   pl011_fifo_rx_put RX FIFO push char [0x0d] 5/16 depth used
>   pl011_can_receive LCR 0x70, RX FIFO used 5/16, can_receive 11 chars
>   pl011_can_receive LCR 0x70, RX FIFO used 5/16, can_receive 11 chars
>   pl011_write addr 0x038 value 0x00000050 reg IMSC
>   pl011_irq_state irq state 1
>   pl011_can_receive LCR 0x70, RX FIFO used 5/16, can_receive 11 chars
>   pl011_read addr 0x03c value 0x00000030 reg RIS
>   pl011_write addr 0x044 value 0x00000000 reg ICR
>   pl011_irq_state irq state 1
>   pl011_read addr 0x018 value 0x00000080 reg FR
>   pl011_read_fifo RX FIFO read, used 4/16
>   pl011_irq_state irq state 1
>   pl011_read addr 0x000 value 0x00000072 reg DR
>   pl011_can_receive LCR 0x70, RX FIFO used 4/16, can_receive 12 chars
>   pl011_read addr 0x018 value 0x00000080 reg FR
>   pl011_read_fifo RX FIFO read, used 3/16
>   pl011_irq_state irq state 1
>   pl011_read addr 0x000 value 0x0000006f reg DR
>   pl011_can_receive LCR 0x70, RX FIFO used 3/16, can_receive 13 chars
>   pl011_read addr 0x018 value 0x00000080 reg FR
>   pl011_read_fifo RX FIFO read, used 2/16
>   pl011_irq_state irq state 1
>   pl011_read addr 0x000 value 0x0000006f reg DR
>   pl011_can_receive LCR 0x70, RX FIFO used 2/16, can_receive 14 chars
>   pl011_read addr 0x018 value 0x00000080 reg FR
>   pl011_read_fifo RX FIFO read, used 1/16
>   pl011_irq_state irq state 1
>   pl011_read addr 0x000 value 0x00000074 reg DR
>   pl011_can_receive LCR 0x70, RX FIFO used 1/16, can_receive 15 chars
>   pl011_read addr 0x018 value 0x00000080 reg FR
>   pl011_read_fifo RX FIFO read, used 0/16
>   pl011_irq_state irq state 0
>   pl011_read addr 0x000 value 0x0000000d reg DR
>   pl011_can_receive LCR 0x70, RX FIFO used 0/16, can_receive 16 chars
>   pl011_read addr 0x018 value 0x00000090 reg FR
>   pl011_read addr 0x03c value 0x00000020 reg RIS
>   pl011_write addr 0x038 value 0x00000050 reg IMSC
>   pl011_irq_state irq state 0
>   pl011_can_receive LCR 0x70, RX FIFO used 0/16, can_receive 16 chars
>   pl011_can_receive LCR 0x70, RX FIFO used 0/16, can_receive 16 chars
>   pl011_read addr 0x018 value 0x00000090 reg FR
>   pl011_write addr 0x000 value 0x00000072 reg DR
> 
> Inspired-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Reviewed-by: Luc Michel <luc.michel@amd.com>

> ---
>  hw/char/pl011.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/char/pl011.c b/hw/char/pl011.c
> index 148a7d0dc60..57d293d1e3a 100644
> --- a/hw/char/pl011.c
> +++ b/hw/char/pl011.c
> @@ -489,7 +489,6 @@ static int pl011_can_receive(void *opaque)
>      PL011State *s = (PL011State *)opaque;
>      unsigned fifo_depth = pl011_get_fifo_depth(s);
>      unsigned fifo_available = fifo_depth - s->read_count;
> -    int r = fifo_available ? 1 : 0;
> 
>      if (!(s->cr & CR_UARTEN)) {
>          qemu_log_mask(LOG_GUEST_ERROR, "PL011 reading data on disabled UART\n");
> @@ -498,7 +497,8 @@ static int pl011_can_receive(void *opaque)
>          qemu_log_mask(LOG_GUEST_ERROR, "PL011 reading data on disabled TX UART\n");
>      }
>      trace_pl011_can_receive(s->lcr, s->read_count, fifo_depth, fifo_available);
> -    return r;
> +
> +    return fifo_available;
>  }
> 
>  static void pl011_receive(void *opaque, const uint8_t *buf, int size)
> @@ -513,7 +513,9 @@ static void pl011_receive(void *opaque, const uint8_t *buf, int size)
>          return;
>      }
> 
> -    pl011_fifo_rx_put(opaque, *buf);
> +    for (int i = 0; i < size; i++) {
> +        pl011_fifo_rx_put(opaque, buf[i]);
> +    }
>  }
> 
>  static void pl011_event(void *opaque, QEMUChrEvent event)
> --
> 2.47.1
> 

-- 
