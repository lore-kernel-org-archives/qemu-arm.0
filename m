Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp1857757njb;
        Thu, 20 Feb 2025 00:12:23 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCXBb7eyy1zSC5x0XDiazdZO1Rm7u/qzk8JyhamrPIIT7beSbe0yHU+29BZBBeUaqbD6rvovHd3nSs6xsg==@linaro.org
X-Google-Smtp-Source: AGHT+IEtW6zaug2GcQ9YJw0HGc9YuY+UDak96LA8OJas006NvPVLBXtPMhoQlSzTHhQ6SffkhwOe
X-Received: by 2002:a05:6902:1890:b0:e5d:d340:b045 with SMTP id 3f1490d57ef6-e5dd340ba69mr16168720276.38.1740039143437;
        Thu, 20 Feb 2025 00:12:23 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1740039143; cv=pass;
        d=google.com; s=arc-20240605;
        b=SGYXUJXHYLNqP+m0INtHWZ4K4nIn+F4htoZslJY0JQvdhVZt/MFVk+PnbVkULFPgPM
         +wonRYKyGPgnqsjAF1zjtxW9r6sitXX55S3GH7f8xs8Ou+F7aDHO0L6vWiwtDe+591q6
         TGy/6HScz+SujjI4VuEDwIjOxWBiK2l5rx/b7mceevru8YeO+IS6n/Is0KMSqFcsfGZ6
         WLDvCof3TFqOrpyMyGuidTavLSDoBFV6lmsuK5JSefmEwzxC4Z4WEFy3DamRoC2OODD0
         P7RbTyWz2gm0CZg0S/BK6brr3cp4ivVbac5mOBHy6pVtWsbbaNRH4uUfVTsdKD8OyQIZ
         bKnw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=cdUzK0kNMy+CsRafYa1CK5vShPOjW/jgI6X5DCe1YTw=;
        fh=McEJFpNWooeu4KfjMpm8Y/6NgpK0tuD9PnL3C9AEwbM=;
        b=DB9Oc3d2Caq3CV4upGKpN4uZ7TAXUbsMqY99xaEhS+XYIGXhla0atko1L4HIrSkfFu
         DnxKpAK6wZ4T5eRjKe+46CFYOlJh4/JTnkRVjrs40xyodcL/8cfC9nznWy50P1YZQiGp
         +gxBWIEREP/DVOkh5JNT1LRWmW95GXyZrGQkVzq6q55oGL26YmWSLEGS3OVRh81mT2Op
         Na6M4XIFB1NrsGLvZXo2MWENiLh53VTK7g8OQ+gxSLQf9TVR42bqL9HgrtGXQ3GdjUqj
         sByec49ya3ZuUrmqpoNzxpcMY1eA5womJNY0gfxmG0YF4a84rtp8zPLNfmKt2uVLrlvl
         Ry+w==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@amd.com header.s=selector1 header.b=h5OeDHMZ;
       arc=pass (i=1 spf=pass spfdomain=amd.com dmarc=pass fromdomain=amd.com);
       spf=pass (google.com: domain of luc.michel@amd.com designates 2a01:111:f403:2415::60c as permitted sender) smtp.mailfrom=Luc.Michel@amd.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amd.com
Return-Path: <Luc.Michel@amd.com>
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2060c.outbound.protection.outlook.com. [2a01:111:f403:2415::60c])
        by mx.google.com with ESMTPS id 3f1490d57ef6-e5dae12f7a7si13043534276.457.2025.02.20.00.12.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 00:12:23 -0800 (PST)
Received-SPF: pass (google.com: domain of luc.michel@amd.com designates 2a01:111:f403:2415::60c as permitted sender) client-ip=2a01:111:f403:2415::60c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@amd.com header.s=selector1 header.b=h5OeDHMZ;
       arc=pass (i=1 spf=pass spfdomain=amd.com dmarc=pass fromdomain=amd.com);
       spf=pass (google.com: domain of luc.michel@amd.com designates 2a01:111:f403:2415::60c as permitted sender) smtp.mailfrom=Luc.Michel@amd.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NiuX7CopJt4Cs8SLE+GkGjV/D1iEmWQzSzebk3AukwbzEQpBHtveQH3aost4PT3bWdwqR0u4e2QMvHE+DGXQeCJR0gVi8V5cu2aSiTJwZjH1ZiE/H1L848ALU214xxy1kNULGKOEe3Vu4X96UVBnRtYVd0zfwJcyBsu6RuI5LCgQLWrjw/hiPvTEUsItua0KKNDva2ANscJnPfQK+A9F4Uz064hB2dWM5qjsaLvdvc2pxYuGa/o0pxdnxbS6m23Gc0A8JGFp6caaQzM2i9fiTFBzl7BZCNFUWj+QlyrJKKo1oN178JmCnqIn4Gw95BPv8sFc2jFpUospPu2H5sjv4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cdUzK0kNMy+CsRafYa1CK5vShPOjW/jgI6X5DCe1YTw=;
 b=qvMFSaYA+Flc2Cun/rz/8Zy7ezz4MORF8Um79H3Tul9rQYJjs3HQZiejSzvkCAhntdjDJxMoBmT3Pf8VFL6tafPC9sPmeA/XAL75syTEiB238jP5TSV9/h03ZKnRFjCQG4eF9WGRJFax/RK3/oU8euUY5+S4+Ivl84oBnjVbyC4Zj1R9nRKY/I4CxCdKY7jQEQr8fM6dgeIY0j3Thxe3kamEkfCiFX2CsT5l/wotDeiMvCzuuZY9zc5jy6PIxnr79qCubXqWJSEloYEbUIVaoS+oYqan7qPZbp9s6jzkTqRn6nIaRBoDHCAdQR/nsW9hmCtXGLisw3bELEFz+NhguQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cdUzK0kNMy+CsRafYa1CK5vShPOjW/jgI6X5DCe1YTw=;
 b=h5OeDHMZ22w9JUuJ5h+1Sl3mD0mKrGglqRZr+toS/7Ut9Qtu+RB0UdfoMFxtDG+GrolmbGgpoKuaStguG+JPL4VK7GDtWCt6gNAaRbGLI+uKK5+bvqwT23CGE/rHcEzSFhlLKjClZnRZyMOPf5FzmVd6ScCQ5bCUSm9s+mPegyc=
Received: from MN2PR01CA0048.prod.exchangelabs.com (2603:10b6:208:23f::17) by
 MN0PR12MB6031.namprd12.prod.outlook.com (2603:10b6:208:3cd::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8445.19; Thu, 20 Feb 2025 08:12:19 +0000
Received: from BL6PEPF0001AB57.namprd02.prod.outlook.com
 (2603:10b6:208:23f:cafe::11) by MN2PR01CA0048.outlook.office365.com
 (2603:10b6:208:23f::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.16 via Frontend Transport; Thu,
 20 Feb 2025 08:12:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB57.mail.protection.outlook.com (10.167.241.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8466.11 via Frontend Transport; Thu, 20 Feb 2025 08:12:19 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 20 Feb
 2025 02:12:11 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 20 Feb
 2025 02:12:11 -0600
Received: from XFR-LUMICHEL-L2.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Thu, 20 Feb 2025 02:12:09 -0600
Date: Thu, 20 Feb 2025 09:12:08 +0100
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
Subject: Re: [PATCH 2/9] hw/char/pl011: Simplify a bit pl011_can_receive()
Message-ID: <Z7bj2Dv8uyldHXuB@XFR-LUMICHEL-L2.amd.com>
References: <20250219210841.94797-1-philmd@linaro.org>
 <20250219210841.94797-3-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250219210841.94797-3-philmd@linaro.org>
Return-Path: Luc.Michel@amd.com
Received-SPF: None (SATLEXMB05.amd.com: luc.michel@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB57:EE_|MN0PR12MB6031:EE_
X-MS-Office365-Filtering-Correlation-Id: 404d0592-b9e5-4a58-c64f-08dd51864bed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|7416014|1800799024|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R3ZmMStkd2VBMWI3aEowN3hHeS9PMlIvVVV3QmpCTmxUWmtEZFJGeHJMb0xn?=
 =?utf-8?B?eTNpT3VyNzlMU1pZbGdwa0VwTWhYbHd3aC85NUlDNVE1QlU4MzVWcTg1MHdS?=
 =?utf-8?B?dExpWEtoMGs2d2JpK2F5TDdLbmUvZXZkamRkTVFhWjV2L2hlNnRPc3Q4emt0?=
 =?utf-8?B?Nzc2S1gvSXYvQVlQMjRZQlRxaWZ4ZEg2b0NmcGFObGpSTGxxK01ZMVZPUGx4?=
 =?utf-8?B?TzVwSkc3RXk5N25GZWVRc3JVN3lhSHR4MVV3WGtZYWVMZmFXNW1uSm1pOVZE?=
 =?utf-8?B?SVBLa2pFd0FnbCtVMGFORDAyYzlsMUpJMkMvNFkzWXh4OUNMRkNBUGJ2VHZI?=
 =?utf-8?B?UFBWZnZQWkxUVGpwcHJubXg3dE9YTGgvWmhHWWVYQS9IMkNXQUNlVWFLV05Q?=
 =?utf-8?B?dTRLcmdhODJtR0wyRXJXcStRTUwycEJTZjMyaDNZbytMOEtwUUJkcWxtdEYx?=
 =?utf-8?B?RnNGbDN4Rm5veXorOWdJNThVWXVKOWs1V2ZBQyt4VEd1UkZMSXJ5d3hodXJR?=
 =?utf-8?B?ZDRKYVVqNyt5dE8vTm9IU0VjTjVSNlJIa0N4OWFsd3laVkdwN0syUS9wT2pP?=
 =?utf-8?B?a3l2SnNETmQrY2lJaE83d3VoLzhSa0UrQkdxdmNIU1pHcTlWUnRMcEJrclpy?=
 =?utf-8?B?OVk5eVdDMkhhemtPQXBkVkJ2K2xjNHRXZ25sNFlROWwyNitJbURMUHliWE83?=
 =?utf-8?B?alA1RU9XOHZlVTBmNm13dFJkMUxxeFFpZjU2RUs4QndOQ25Id3R6M0FheXFO?=
 =?utf-8?B?T2Q5aGc5R2d5V3JDWEFSM3dZUEwwZ0JtNWhJZkE4ZUhRSDhTNXF1WkJ1c2ZQ?=
 =?utf-8?B?aWVoY2tqWHdlSVoyZjM2RC96b29ROWcxYkhhNTlEZS9PZlBYNUpScjMveDdH?=
 =?utf-8?B?RVM0TW9BaGhHTEZGY0NZRzIxSkc2WnZJSUNvYUI5MVFWSkpna1hmS3FvU1JN?=
 =?utf-8?B?bmQ1N0FEWjVMc1V3MHVicitkOHlCTlQvK09aem5xS1lTMEhzR0xKRzJPS2Vh?=
 =?utf-8?B?OC9TeWw5OFhyRTYzYWtaT1NXY1pxcExmc1BzbkpJQmZrSFVOSHBlQVFta1ZI?=
 =?utf-8?B?M0tWNTQ2ZlF1YkY4VzhocnZHak55d291RFpLTGFIMGFBaTA3Z2ZjaktjbVAv?=
 =?utf-8?B?NHJUdmJLR1c1RGlpUENic3M0NWV0QlhmS2dCTFhZUnBBcTdpWmtuYmdIUkNp?=
 =?utf-8?B?alJseG5wdnZRU1lpb0ZMbUpzdSt3dUZEOWhQckY1SkNMMW5GVlA4Q2Y5aEZ0?=
 =?utf-8?B?TjFINmZ6Uk9IMG5LZ0xOZXpMbDZVZmJVM0JxYUlHSHBCNkdnNnd4aWY4R0I1?=
 =?utf-8?B?Zng1WHNYeGhqcy82T1FlVWlKbnd3TlRzY1RSMUlGSVBVMHpsQm5Rb0ZnYTlC?=
 =?utf-8?B?OU1KU1hVZTJ0R1VKdjVLRGRZVGk4eGJWeFFFS0NuQ1RVa0dOQ1B5aGlaeDFn?=
 =?utf-8?B?TG4raWxSaHI4elFjdlNCeTNaeHBvKy9rV29nZG5lWjFOR1Q1eVoyZVgrMHNN?=
 =?utf-8?B?L2FzRzVMeTl6TzdmTG1naEs3UEg5S0pnV2Q3NWF0WHlFaXQxdjcrNWJiamZL?=
 =?utf-8?B?aDRNcjZiUFk0UHlqZldqK3MwL3lCSk92V01OdDdvSjJyTGZzSytPVHQwSmFI?=
 =?utf-8?B?Z002Ry9Wbzh6SGVqbys5VUlyK0lRQ2s1NHBtVkliWG9sd08wM1lVTGtJMUhQ?=
 =?utf-8?B?cGcwaWJBWGk3S3Fkak9sTVpyZmk3b1ZDTjJ6TmJ6K2J6RkNiRGpJTmNNVlRE?=
 =?utf-8?B?ZGxROExveTRiWUlBcDdWS0tVUGpnVFd2VFgyUFRHUE1uM3JOdm9JTm1CdG41?=
 =?utf-8?B?QjRRaENrM0x2NWpIMGxieDBvaHZRcWc1dFkwOFhOZWVzeEZBcXdXRlAxcWk0?=
 =?utf-8?B?ZTV0dG5iZ24vM1gwdXdjUFp1RHpMVTlyR29SUVZZMUVVYldDWjNQKzFKRDZq?=
 =?utf-8?B?R2o3aEtWUmJKajZpUlNCN2tNcTRDSVhFdlJxcVgrSkNONXJFWnhIbHBEeUdi?=
 =?utf-8?Q?ETdBbnJIw0NMTiVPYHrapo35UrW+wo=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(7416014)(1800799024)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2025 08:12:19.7351
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 404d0592-b9e5-4a58-c64f-08dd51864bed
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB57.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6031
X-TUID: 8yrmzMD7USJE

On 22:08 Wed 19 Feb     , Philippe Mathieu-Daudé wrote:
> Introduce 'fifo_depth' and 'fifo_available' local variables
> to better express the 'r' variable use.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Reviewed-by: Luc Michel <luc.michel@amd.com>

> ---
>  hw/char/pl011.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/char/pl011.c b/hw/char/pl011.c
> index 60cea1d9a16..bcd516d682d 100644
> --- a/hw/char/pl011.c
> +++ b/hw/char/pl011.c
> @@ -486,7 +486,9 @@ static void pl011_write(void *opaque, hwaddr offset,
>  static int pl011_can_receive(void *opaque)
>  {
>      PL011State *s = (PL011State *)opaque;
> -    int r;
> +    unsigned fifo_depth = pl011_get_fifo_depth(s);
> +    unsigned fifo_available = fifo_depth - s->read_count;
> +    int r = fifo_available ? 1 : 0;
> 
>      if (!(s->cr & CR_UARTEN)) {
>          qemu_log_mask(LOG_GUEST_ERROR, "PL011 reading data on disabled UART\n");
> @@ -494,7 +496,6 @@ static int pl011_can_receive(void *opaque)
>      if (!(s->cr & CR_RXE)) {
>          qemu_log_mask(LOG_GUEST_ERROR, "PL011 reading data on disabled TX UART\n");
>      }
> -    r = s->read_count < pl011_get_fifo_depth(s);
>      trace_pl011_can_receive(s->lcr, s->read_count, r);
>      return r;
>  }
> --
> 2.47.1
> 

-- 
