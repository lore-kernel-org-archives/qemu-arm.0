Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp1896477njb;
        Thu, 20 Feb 2025 01:52:52 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCWsQGgVTLsF6e3BRjc+jOqbMCsfwtgQF8lPevBDAFbl8uYs0nwVzfllFyLfn/qSstu8SoSN1RvXK5sgPw==@linaro.org
X-Google-Smtp-Source: AGHT+IHOGBRh1084AWHtt/8FkFk7fTAWGPfKOg45PAJozIc3fjglCC+1AmGKuSVDpK8AYQhVn3Da
X-Received: by 2002:a05:6a21:692:b0:1ee:d438:3fb4 with SMTP id adf61e73a8af0-1eed43844dcmr12502304637.28.1740045171752;
        Thu, 20 Feb 2025 01:52:51 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1740045171; cv=pass;
        d=google.com; s=arc-20240605;
        b=J4c2GLxLDs/sR/FP6HGYvlBVuAur6jxtBXyG50nE2sfTnwofNhl9Io0kwS5SJBuuqy
         RByM8iKhIkkU+psF3yOi2InwP6PCVdX2vucYoy309UXwq/grz63ECoLX4IOv41HCuxZ3
         P9EWY/LTMNwWAC42Vk3lzG7SJczx6vS3szmWQdmrQpLpbQCFxiRn6yUtonBb2TyGa7AL
         apj+Yw0lmJH6KCDsplvKuh3TAMSU1NCMvBoq0b2s2zWpusNU78LYLAaz39cRg8kYav6X
         R97yQz3ZB7FMUzEvsX21+jJ14O9PWiLI3FBZx5qo7Tl6ZpCPxcG3nUZ5AFRClwtt2vwi
         zTwg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=TVTew98GA14YCjGmwmXsDsmOKLLe6iJQ3MzhcVwBBio=;
        fh=mtP1oai+Ru0UdrXSBeF4f+U29bVJLmGg0b78oCljT2Y=;
        b=I4ovkPU0C1NYXvbfs4F2JoOJVVqakF0FuzrqKBmuSBCok0tFhEEZfDjggefS18+W+O
         riIN00Pbg/1OF4Pd53Yai6+jzdHLkPIPmDpHUeCQ5NP8h0mXtxdthTYukkNIyOAeHXv3
         IEkF/8q5D/jQ7lRnD0zyaC86Ztvly2gh3WPsJfN3RV5cUKASwaQuutGvsCaRk+LuY91b
         J+RniahBToqpoLyPhUz85z+onxSKWxlzfHbS523Trsdm+FnlLXF7T2qLVPEjiGEuH1A6
         QOIey47sM1wsLEwP2YR+3id+iw32lkL19BkhzMhCqojDXjND+5h9OjT8yW1FjLryUPSh
         vdkg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@amd.com header.s=selector1 header.b=F9QMvpZn;
       arc=pass (i=1 spf=pass spfdomain=amd.com dmarc=pass fromdomain=amd.com);
       spf=pass (google.com: domain of luc.michel@amd.com designates 2a01:111:f403:2412::62d as permitted sender) smtp.mailfrom=Luc.Michel@amd.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amd.com
Return-Path: <Luc.Michel@amd.com>
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2062d.outbound.protection.outlook.com. [2a01:111:f403:2412::62d])
        by mx.google.com with ESMTPS id 41be03b00d2f7-adc807cd9d6si19133359a12.437.2025.02.20.01.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 01:52:51 -0800 (PST)
Received-SPF: pass (google.com: domain of luc.michel@amd.com designates 2a01:111:f403:2412::62d as permitted sender) client-ip=2a01:111:f403:2412::62d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@amd.com header.s=selector1 header.b=F9QMvpZn;
       arc=pass (i=1 spf=pass spfdomain=amd.com dmarc=pass fromdomain=amd.com);
       spf=pass (google.com: domain of luc.michel@amd.com designates 2a01:111:f403:2412::62d as permitted sender) smtp.mailfrom=Luc.Michel@amd.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VdJ3M6t0wn9OK198Ne/+Y0ZDC1UEj7sZzdRsxN26HT+TTD390GGJzXeuE8jnpE6X/tIHRaOb1LfR7jyDOQZw+XBwkGCbNXpm8w/gxEdyU1fUBdsR/INYQRl9Jx5lucUQ5GpF71a4sh65+B9U+I9d6ZV09ZcDdekJf2SIoA9O19ulKsKy9dqfdU8NEbTK1lQzHKr7HA7FS1/tgTlEY25hFj0keiVgJw3KqVh6LlwOdGtX0WXr+urO8+ZjiDRM69/skUoNXEJjohtOsp07vGTHJ6RtHe1uI6z4i7H58gsJmwSKcY7PWKx7zUF8EArloZZWvk2sDE/SgSgsb3/avWrCug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TVTew98GA14YCjGmwmXsDsmOKLLe6iJQ3MzhcVwBBio=;
 b=RfDBgLC+ofG3hcle76cpkI3ZFx0zYWDjnMNDVu+U8LF3MfgjmG778ZcTAObCSiCMAGYWcXZSyiP0OHlJoyNYPp8ADphZFLJT00+EL7Dd/NVlmIJBc14WXaWKfQgX3rbtPPmE2NU7IyLnfaPVhvVzFgBpeY6C0+nOKzwaf0odeIrMba8SJ5VB2+IqAi67R92XtoaLdNY14D322jPU6jlKt1bcPjzl2ISqMz+I32o8gPmv9UFglRr4Lb8W1ExArlkGPBHmdHvvM3kbtjMWlbIHgTuOn+76D2VUqRLirZXFp2bSbDR5BFT68GVdLbNlg7cbi5P0mlRzQ3MsOlafqnijxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TVTew98GA14YCjGmwmXsDsmOKLLe6iJQ3MzhcVwBBio=;
 b=F9QMvpZnkHesGgPizT02JCp8pzzZQnUWDHViKU0sw/XtCYynGFlPz50UHB5bBAOB7xLBx0oZGSUPtIkhNffpOLwBexaDAFs6MyBYhMdT4Ct5Ewha4jRggMhJ8Ki9WjjhJe4j34Gy7O72aRNjz/Ub8XgQL5h/uUFoRddcHqP4Ny8=
Received: from CH2PR19CA0020.namprd19.prod.outlook.com (2603:10b6:610:4d::30)
 by CH2PR12MB4327.namprd12.prod.outlook.com (2603:10b6:610:7d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.15; Thu, 20 Feb
 2025 09:52:47 +0000
Received: from CH2PEPF00000142.namprd02.prod.outlook.com
 (2603:10b6:610:4d:cafe::6b) by CH2PR19CA0020.outlook.office365.com
 (2603:10b6:610:4d::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.14 via Frontend Transport; Thu,
 20 Feb 2025 09:52:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000142.mail.protection.outlook.com (10.167.244.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8466.11 via Frontend Transport; Thu, 20 Feb 2025 09:52:47 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 20 Feb
 2025 03:52:47 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 20 Feb
 2025 03:52:46 -0600
Received: from XFR-LUMICHEL-L2.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Thu, 20 Feb 2025 03:52:43 -0600
Date: Thu, 20 Feb 2025 10:52:39 +0100
From: Luc Michel <luc.michel@amd.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
CC: <qemu-devel@nongnu.org>, =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
	<marcandre.lureau@redhat.com>, Alex =?utf-8?Q?Benn=C3=A9e?=
	<alex.bennee@linaro.org>, Magnus Damm <magnus.damm@gmail.com>, Thomas Huth
	<huth@tuxfamily.org>, Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
	Rayhan Faizel <rayhan.faizel@gmail.com>, <qemu-arm@nongnu.org>, "Evgeny
 Iakovlev" <eiakovlev@linux.microsoft.com>, Paolo Bonzini
	<pbonzini@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, "Yoshinori
 Sato" <ysato@users.sourceforge.jp>, Richard Henderson
	<richard.henderson@linaro.org>
Subject: Re: [PATCH v2 1/9] hw/char/pl011: Warn when using disabled receiver
Message-ID: <Z7b7Z4oGbpw89CDK@XFR-LUMICHEL-L2.amd.com>
References: <20250220092903.3726-1-philmd@linaro.org>
 <20250220092903.3726-2-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250220092903.3726-2-philmd@linaro.org>
Return-Path: Luc.Michel@amd.com
Received-SPF: None (SATLEXMB05.amd.com: luc.michel@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000142:EE_|CH2PR12MB4327:EE_
X-MS-Office365-Filtering-Correlation-Id: 485bb6a4-10b2-4c04-6e98-08dd519454cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700013|82310400026|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SkdLdWhzajlUZWJGVTlpRWtwdVJ6WGZmSHlsTmdyby9pNDcvUzduVlVycHIz?=
 =?utf-8?B?MURtYXhrMnNsWkhDWlRFSElSdzV4TG8rZzBxd0g4UDNnUWlrS2VxemJHN2tK?=
 =?utf-8?B?ZkxrOUpLY1E3NFdhdHUrK2x2S1ZSR3V5YnFWNHFrTDRveXA1Tll2VVFsOFlj?=
 =?utf-8?B?eXJCUEc0VTBSVDFwZDlteWJnSzI3eDFaMkgrUVczUnUxL3VNek5FQS80d0sw?=
 =?utf-8?B?MkRaZ1NDd1UxajJxaWFPR3ArNHJ6MTEwaHgzTWVSbW5TZFBsbEtSWGhucloz?=
 =?utf-8?B?SG9rVnVJbEZxNk9EcDBpeExjZFZDeitOd2ZoWVZ4Z0djbytNOHMyM3ZiZmFY?=
 =?utf-8?B?dmNtZkhFQWUrdGl5UHZaRWRFVnpjNXArTHlsWStiQWFuVGpMRWhTTlF6K2hl?=
 =?utf-8?B?UTBac3U4ZUNjTWFERHFuZ1MvUkV0emxWU0tyUG5veVp5TzAwc2tSV3hRNjRG?=
 =?utf-8?B?S09hVFdlajM2MTlwWmFJQXQ5MlNFQmtzMGFWei82WWVRVlhuak9QVXZpUXd0?=
 =?utf-8?B?c1U4OGZTc2tpRjJWeTNrREFtRlErT2VRYjU0Z2xjT215dFJnRSs1UVMrODNJ?=
 =?utf-8?B?c2VNWjN0UzN3RkRrYjJLZ3dBa3ptTzlWc0J6RGNUb29oVCt1dm9OZEdvUmpl?=
 =?utf-8?B?U3FuMHpwN2RoOFA2bUhVVkZhS2xLVWRLKzZ0OGJzZHl1aXFjMnZyckpIOVpP?=
 =?utf-8?B?RGt6dytaQ3RDem9JeTNDTHJCWGtQc1p5YWxNR1h0RWlqRnJBa2YzL2M1aG1s?=
 =?utf-8?B?S3ZHUFV5UHZjWEFsRFRJR2lRMzd4UHRaYUU3ZXFlWHpyV3AweTFSNm5pdTdI?=
 =?utf-8?B?cFpxdGRWYkJUUWkveWpDdHV0ZjhXbWgxU3ZoMWQ3ZUM4MVFMKzYwM3MzcU5R?=
 =?utf-8?B?QUpNU1JFYnd1SUs2a01BMjFYK3I0QkZmRHQwcXZsa2VvYmdtQWs2T2J4ZzZo?=
 =?utf-8?B?SWRZcTVxN0Y0eEZFaS9yZkNzdzVsSGZ3ckdEamFPS3hoSTJJUE1yaTN5Yi9x?=
 =?utf-8?B?RHZzT0VXSFVQVmt3T2ljcUhGMjJlUEhEZjRtSEFNazRPYzdJajJEbWVSeEI5?=
 =?utf-8?B?Z2RFYUhqQnRnbWFlMnNpT0tDczE0clpCYjJkaERqbEpXUElwbFExc1BlV1ph?=
 =?utf-8?B?RVdzVUZtTUxqL1FNWFFma2tiemhYbEhIaWQvMFB1ZkJ3N0dlUzJWODlMelM2?=
 =?utf-8?B?VnlIczhUb05BZHFLU2V5b25lUHY0aFBsT2dmSUVoVFhJYzV3aXFNT1cvVUkr?=
 =?utf-8?B?dkNzc21Ycko0bmVNaU5rcTdkOWp6RWkxY21wMXh3WEdyN2pKS0wyUVhYL0F5?=
 =?utf-8?B?MHZFdkdYSGM5Uy9EZHhFTkdQMUdOTGxNOXFVcER2YVpUUk14SHdTdlNtMDR6?=
 =?utf-8?B?UkdNYjd2ZHFFM1NIa2FYdTVNUFdhajlqbStSUU1BeGw1VXFzK04wcjR1S3lp?=
 =?utf-8?B?MDQxRldpMlJ5STNBbEdqQk9sbTg0b3NVWW1YajFRL0tTdFg2VEp4MDJUMytZ?=
 =?utf-8?B?aTNwWmJuS0tPRkY2b1FFeVR2cWlNUzVpZXlMQVZDNEMzN3drSjh0S0lPUml3?=
 =?utf-8?B?YnpmZFhsc2pxTlQ2c0pYRW5iVm1uU2ZqQ1YyQWpZUWxFNk5XRmpsQ2F4YTV1?=
 =?utf-8?B?WFRWaGdBb0FvYm9LWnJVMXVhVGl6U1Nmd2ZSM1hBRHRjci9mS0VPVXN6VE4z?=
 =?utf-8?B?OHJxWkVaQzY1eS9FU2JCdmtIbktuaVNlVHpzZmo1SlBBWlgyVnEzVnJFS2xP?=
 =?utf-8?B?Zm1FR2IxeTZtTCtaeWFGcjJaTndzRGR0TGFrMTZic1p4REExaENzMUx5MU14?=
 =?utf-8?B?aUZSdFBIeEdBaFRpeFhnZzVCQ0FTNXYyemRQSDlVcXhTcWFtcHc1Z1Y5ZkVF?=
 =?utf-8?B?N1hXVVF2cHhyQlBka01jY2xrSU54c0pReGVlYjF5dDk3OTFiamhxeEdSQlFt?=
 =?utf-8?B?ZXk0eEIxbzhObEh4Tm81RjhWSldSUzh5c3JiRW9FWE8zU3c4dVhRRTF6V2Zv?=
 =?utf-8?Q?GC4dzngr032lGeCXwxVY6FQQKpqZDY=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(82310400026)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2025 09:52:47.5546
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 485bb6a4-10b2-4c04-6e98-08dd519454cc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000142.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4327
X-TUID: ZyUNmqq3G1K8

On 10:28 Thu 20 Feb     , Philippe Mathieu-Daudé wrote:
> We shouldn't receive characters when the full UART or its
> receiver is disabled. However we don't want to break the
> possibly incomplete "my first bare metal assembly program"s,
> so we choose to simply display a warning when this occurs.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Reviewed-by: Luc Michel <luc.michel@amd.com>

> ---
>  hw/char/pl011.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/hw/char/pl011.c b/hw/char/pl011.c
> index 06ce851044d..12a2d4bc7bd 100644
> --- a/hw/char/pl011.c
> +++ b/hw/char/pl011.c
> @@ -85,6 +85,7 @@ DeviceState *pl011_create(hwaddr addr, qemu_irq irq, Chardev *chr)
>  #define CR_OUT1     (1 << 12)
>  #define CR_RTS      (1 << 11)
>  #define CR_DTR      (1 << 10)
> +#define CR_RXE      (1 << 9)
>  #define CR_TXE      (1 << 8)
>  #define CR_LBE      (1 << 7)
>  #define CR_UARTEN   (1 << 0)
> @@ -487,6 +488,14 @@ static int pl011_can_receive(void *opaque)
>      PL011State *s = (PL011State *)opaque;
>      int r;
> 
> +    if (!(s->cr & CR_UARTEN)) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "PL011 receiving data on disabled UART\n");
> +    }
> +    if (!(s->cr & CR_RXE)) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "PL011 receiving data on disabled RX UART\n");
> +    }
>      r = s->read_count < pl011_get_fifo_depth(s);
>      trace_pl011_can_receive(s->lcr, s->read_count, r);
>      return r;
> --
> 2.47.1
> 

-- 
