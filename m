Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp1861292njb;
        Thu, 20 Feb 2025 00:21:30 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCUeyTx7zaWMOTSE8I/cVwiCNiLxYZdlYNep12yX6/EL/IdvhdMuunkjTrwdgjBKQs1SLvMgfzgtrU1Xcg==@linaro.org
X-Google-Smtp-Source: AGHT+IFsfLs92AeQGSDETZRJJmKEgIrnWt82pKbbzKePFCEU5+ey3C25Hj/XDwnJP591y1/YVVzq
X-Received: by 2002:a05:6a21:a41:b0:1ee:dcd3:80d7 with SMTP id adf61e73a8af0-1eee5a71498mr3301408637.0.1740039689850;
        Thu, 20 Feb 2025 00:21:29 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1740039689; cv=pass;
        d=google.com; s=arc-20240605;
        b=YHT6IWIIDhJDc9+Fl1DoY5DcIQwCAHFdGpr9AP9OuqtRJdAoGjhYY+2RHCEWR0Tg7r
         2n4m70E0VWU/gd5C5X372HxqkkFhLL8FvzgFsTY9AKx2fnhA+wZzbawogIuqf85rhlJa
         jnZ2HrLhpJOuQPzbBHHsXGp+B/kKRqlG/Brm4ZhJO423/AlR0aNI6Id8sVfcvStMUPx0
         Hu7HjingvXD0B4AnKiRVvlNQQBWBQeaRDyzud6P+3ZnS4lMJp7mDXnY21CJh2XAExufS
         Bl0nDsVNMrinqcfmsdzyVdTf4nqBbbcPA4TSMNJ39VXL7bAymk7intgLw/GzDu4HTPUE
         k6sw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=wwQuZmY1WhrO+ScNAcw91nkeQJVmwxpl7uySFAJ0FuI=;
        fh=McEJFpNWooeu4KfjMpm8Y/6NgpK0tuD9PnL3C9AEwbM=;
        b=lgRTTQlsH48iaur/8RJBRTLTM7VmtWbaNL/P7cHuvHulPMcj9fTxrn/nsIod+goQjL
         2ltlyxrbXtwelZEw2U2gNi3j8vwssrBRbyuXi0BrXc1OzDBfgYy3UC4Pi0h9TBoMhLmM
         PiTUuxgfgO0IkEF4nhTglAMOq9K6t/+wi9D5BWnNXx7kPKHfBdjnJLQ8OaEviyCLDOwi
         5ywxZrGdWSnYXZUOGOiROUtC5YIDPcpvTaczQ+DEPOcYl8nLF+smqjZLqrqiLNUL9EHI
         H8np6crFKYNwoLJMOezCmLnTFTe2JYZsdz/3Hy0bnoIH6bv60zzRLdCxpm/ZhoyU/9fS
         z/iQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@amd.com header.s=selector1 header.b=Wxz3wmaN;
       arc=pass (i=1 spf=pass spfdomain=amd.com dmarc=pass fromdomain=amd.com);
       spf=pass (google.com: domain of luc.michel@amd.com designates 2a01:111:f403:2417::622 as permitted sender) smtp.mailfrom=Luc.Michel@amd.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amd.com
Return-Path: <Luc.Michel@amd.com>
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20622.outbound.protection.outlook.com. [2a01:111:f403:2417::622])
        by mx.google.com with ESMTPS id 41be03b00d2f7-adf87ad4c6fsi13646154a12.94.2025.02.20.00.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 00:21:29 -0800 (PST)
Received-SPF: pass (google.com: domain of luc.michel@amd.com designates 2a01:111:f403:2417::622 as permitted sender) client-ip=2a01:111:f403:2417::622;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@amd.com header.s=selector1 header.b=Wxz3wmaN;
       arc=pass (i=1 spf=pass spfdomain=amd.com dmarc=pass fromdomain=amd.com);
       spf=pass (google.com: domain of luc.michel@amd.com designates 2a01:111:f403:2417::622 as permitted sender) smtp.mailfrom=Luc.Michel@amd.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S3GQY7JKH0Befg5az3J+8nZ7gx296A8SI5GL885cNLpgYoJXku5uroGNQd3BINbMCzg994b7wibQyImHYob4xbJefuiScNWXMucRtEOSY2lxsnlr5Arr8XpYouZQLLGJJ2MRr2bAsuEsnkKbswl5sGMwa6osvhpJ4U95O9SeN8BtBvW0e/h/VoTz9TW0Eo5cizwXwcVgo2pP7gTOXq14MNkqIyS2R6i8nFgAKly5bORneCVElTTiVwssKsi/Ngu2+IaDUl8bL1+OCxlCY4vwGXFAZ/tVO73WPnYSJ1svv8sLajdNCOEGLrwC8qS1dilDjxdOExJ2EVgw/XnuWOf8IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wwQuZmY1WhrO+ScNAcw91nkeQJVmwxpl7uySFAJ0FuI=;
 b=hxQ0KqiX50fL8+1o0gLy/a9A57w16xfvv+sVSmdtvN7GCjWFs5huUBjCYABRKVMnUVJ89Nt1WKkbR2y6X4V9SLjhImK2LVtJB1vmTPm8bYImuXpQ0XsVIl/eKIHvtxoExxVKknOjsGcNO6gWVIWOK8MPwgLDsHdXRPyh2t3luljPyjVntqjNeoZwg5AMnamEnKXsQllECLMrxLPlCsMYjN9jyRcZPk+2eapSi0B/FuoovHo75y3suO9EZc3sU9ZRuOWUowdzNkrrzv3gyUJ1fzOpMyMmYcJzM+tEsacWIg2urGKMYcj9T0ltper/1TtV9Vu22jBq5FA/LuLypV95ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wwQuZmY1WhrO+ScNAcw91nkeQJVmwxpl7uySFAJ0FuI=;
 b=Wxz3wmaNG8g6iJwHjiD9hf8rGTpV8jHiX6ZW646IPasRBz2VTvUTCKxMZQfJGy0k4dgVEJIepBaHq/hifRv6KGXTO7hFGXhrXIF6nz/XuTZkjTbvOsy/V7EbsutFz7dX6XQY9o+O9c6KZnPbXOUbLtCalmMEKOZxqdVC/hSWYcM=
Received: from MW4PR04CA0054.namprd04.prod.outlook.com (2603:10b6:303:6a::29)
 by LV2PR12MB5896.namprd12.prod.outlook.com (2603:10b6:408:172::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Thu, 20 Feb
 2025 08:21:27 +0000
Received: from SJ5PEPF00000209.namprd05.prod.outlook.com
 (2603:10b6:303:6a:cafe::97) by MW4PR04CA0054.outlook.office365.com
 (2603:10b6:303:6a::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.14 via Frontend Transport; Thu,
 20 Feb 2025 08:21:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF00000209.mail.protection.outlook.com (10.167.244.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8466.11 via Frontend Transport; Thu, 20 Feb 2025 08:21:26 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 20 Feb
 2025 02:21:26 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 20 Feb
 2025 02:21:25 -0600
Received: from XFR-LUMICHEL-L2.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Thu, 20 Feb 2025 02:21:23 -0600
Date: Thu, 20 Feb 2025 09:21:22 +0100
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
Subject: Re: [PATCH 5/9] hw/char/bcm2835_aux: Really use RX FIFO depth
Message-ID: <Z7bmAqE4z2y_kNse@XFR-LUMICHEL-L2.amd.com>
References: <20250219210841.94797-1-philmd@linaro.org>
 <20250219210841.94797-6-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250219210841.94797-6-philmd@linaro.org>
Return-Path: Luc.Michel@amd.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000209:EE_|LV2PR12MB5896:EE_
X-MS-Office365-Filtering-Correlation-Id: 97062dae-01af-4e53-008c-08dd5187922e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|36860700013|376014|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aGd1ZkU2YmJUcE9YMEZrTHQ2YitrMVBzeUpoMGxsanpvS0VWem1yb25zNzBY?=
 =?utf-8?B?Z0NMZFM4akkzSDduN1oxanVMcE9iakZaWUZJZVo4TDBzZXc4WDd0d1BrWm9l?=
 =?utf-8?B?L3Rxb2dnTDFPcTAyMzlZN2E4KzdDcG1hZFNhMDhJOFlOUEtDUHFOZVpOS204?=
 =?utf-8?B?YXVIUmt1SGs1T1hnUG1ZZFp0QllyNkhsSnpSeVpZakJCa1hXUm5MZllSNnVt?=
 =?utf-8?B?VnY5eVpsdFBpMmNwM1JRelVoNGVxS0h3SjhYWFlVbWhJMC9Xb0h0Y08rZXpT?=
 =?utf-8?B?SVNrVjc1RjJLeDA0U2pRN0Y3aUcyRWl3K0dZQzNGQ2srVmIvVDlyNmlzcGVJ?=
 =?utf-8?B?N1FGRU03OU9oT2ZINE5yNUtoMDR2VFpwUldYekFBRUE0alEvQ0FMVEdma1hF?=
 =?utf-8?B?cHJiK0lESEhla1NsQ2Y4UUxKYmZqcm9VTWlCRHQ0N0J2bTU1dWRRdTNqRzV5?=
 =?utf-8?B?WVh3SU1OU3ZBMFl0blM2RzBpSWd1MmUrOUp2MXYwdjIxRStoUW5saHVUbEFt?=
 =?utf-8?B?Tkw1WDFZT3c2Rmp4OWRxMzZHMHUyUzAxVEk0ekFRalU0L1FNQmplc0YzQWlr?=
 =?utf-8?B?SkhCbWphVENmbTZmcW1QQkJZcFBrazE2MXZCVERBSllWckJoa3VuajFHcWxk?=
 =?utf-8?B?SHFrS05GM3F4d1k0bzE2NmN4WnZJL3Njb1QydVZsWlF4ZStYMm10OGcxN0V0?=
 =?utf-8?B?ZFRZTGhtV1JLV3pzRThRcmpITWpZcU1Qc080STNwNE4rL1hvUUN5REh0QkdT?=
 =?utf-8?B?YzlFTFAwc0tpZDFiZ01pcTJzM25GT2hod29YTnBHa0U1OVpQVFVrV1hIMWF3?=
 =?utf-8?B?R00wWS8zUWpKbFo2ejVsWFdKY1d2VTc1eHVSRkRCd2xwVVVGSXJFQ3BGMXBy?=
 =?utf-8?B?aWVmaDRqWHRkbmtpVmd1UndNYXhkOEt2T1MvNk1QeEJidTU3NmVVajczdXN4?=
 =?utf-8?B?dVk5MGZ2bllHR0JndFVoR205aHhmR3JDZnNFTllWek9FcXJHZjNYWTdRYUVu?=
 =?utf-8?B?VlBHb2FlN04waWtKalFKR0dDVlVxajNIS3RBMmR0bkFDWWU1VjI0VDZZTFRJ?=
 =?utf-8?B?cC80VDdzL293Nkp0RHAxc21oRlkybnJ0ZGdMZjZnd0IrNVFDVWJucHhHUE13?=
 =?utf-8?B?amRzSGo4RXJBTW1LM0tRTFpWbWFhOTh0YWVwVkViczJ2b0IxV1h3Yi94NnF5?=
 =?utf-8?B?ZUY3NEkrS2p6VVpzVUNaYzMxc1dxUHlSNEdBN0U1cFkrS3YxTGE3WEtEcHE5?=
 =?utf-8?B?b2ZHcWRJQXFCR0FSckJZQUg2TUF0Y3NPNG9VWExCNk9oNnViSmVtRHhXMjUv?=
 =?utf-8?B?dTZlSEs0dFZzYnllcEt6Q2dKVnJHd0JaSEhBcTdzOW8xRzFrQ2lUTEdNUVV6?=
 =?utf-8?B?V0FDTzNBUnBDZUhETmtNbmxSR0hkRCtYNGUzeE9UaTMvNUJGM1RaZFZZS3ZQ?=
 =?utf-8?B?NDVVenVPZzNzcFF1M1FsVndmcUxObFRyMk93Z3NzSklZVnlDaUxDWDE0RFFk?=
 =?utf-8?B?UkI1c3dLZGxsUGU1YU1udVdRSHppTTNGZlp1cUdSbjJGYzJjcWNsdzdkcjY1?=
 =?utf-8?B?d0xZem5MRko5QXFvalhBelVxRWxaalcvazB1N3ZxZ1lDZ0duSllZaTVWVkpE?=
 =?utf-8?B?ZHY2VkVMTStoMk9FMWZHbHE3cUNCekczSXhNNCtRUHYyV05xR1ZwS1ZEN0dN?=
 =?utf-8?B?SnFybWp6V3FhY2NyOVNjb2YxeDFEUXBTRVMyV2d2SGdqN1czazFBdTNVWWh2?=
 =?utf-8?B?WFZOVnZQSlNzSDFJUURaNkhDV1VvejIvb0hLUWZialZ2RDY4anNFbGV5akdQ?=
 =?utf-8?B?OXNPSnZEdDMrbXBIcDNnbDJLWXRlUisxYTBrb1lPVHpMNHd0L0lTbE1za0xG?=
 =?utf-8?B?cnhTVUNJZHJ5dyt1SytxTVlaaHRIT1k2bkcrWUhvd0s1R2dGeVlDQldmUW1G?=
 =?utf-8?B?dW5mRytDQzlJeW10QVp1N1o1T3puTmNPcWhZT3YrbWI1R09aSzduMDFISXdj?=
 =?utf-8?Q?aiPZJDf/IxM2CEGq/8VTcDdgO0swiU=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(36860700013)(376014)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2025 08:21:26.9839
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97062dae-01af-4e53-008c-08dd5187922e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000209.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5896
X-TUID: 1u8uQyrdb5SL

On 22:08 Wed 19 Feb     , Philippe Mathieu-Daudé wrote:
> While we model a 8-elements RX FIFO since the PL011 model was
> introduced in commit 97398d900ca ("bcm2835_aux: add emulation
> of BCM2835 AUX block") we only read 1 char at a time!

I'm not sure I get why in this patch and the subsequent ones you keep
mentioning the PL011 model while you modify other UARTs. I guess you
mean "the BCM2835 AUX model" here?

In any case:

Reviewed-by: Luc Michel <luc.michel@amd.com>

> 
> Have the IOCanReadHandler handler return how many elements are
> available, and use that in the IOReadHandler handler.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  hw/char/bcm2835_aux.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/char/bcm2835_aux.c b/hw/char/bcm2835_aux.c
> index 73ad5934067..c6e7eccf7dd 100644
> --- a/hw/char/bcm2835_aux.c
> +++ b/hw/char/bcm2835_aux.c
> @@ -221,7 +221,7 @@ static int bcm2835_aux_can_receive(void *opaque)
>  {
>      BCM2835AuxState *s = opaque;
> 
> -    return s->read_count < BCM2835_AUX_RX_FIFO_LEN;
> +    return BCM2835_AUX_RX_FIFO_LEN - s->read_count;
>  }
> 
>  static void bcm2835_aux_put_fifo(void *opaque, uint8_t value)
> @@ -243,7 +243,9 @@ static void bcm2835_aux_put_fifo(void *opaque, uint8_t value)
> 
>  static void bcm2835_aux_receive(void *opaque, const uint8_t *buf, int size)
>  {
> -    bcm2835_aux_put_fifo(opaque, *buf);
> +    for (int i = 0; i < size; i++) {
> +        bcm2835_aux_put_fifo(opaque, buf[i]);
> +    }
>  }
> 
>  static const MemoryRegionOps bcm2835_aux_ops = {
> --
> 2.47.1
> 

-- 
