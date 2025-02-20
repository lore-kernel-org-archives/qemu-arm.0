Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp1861908njb;
        Thu, 20 Feb 2025 00:23:00 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCU8a7Hq6UiriJamzcGHbrgyQzsepvW9KfYB7Hgou3OzoIHNFEe815BUKW6ORZ9WYhEUIB4Tp+gWn37NFQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEAw9EuoYEjf1U6nUFVzvNqTrPNJYX4cQlAAsMH7wgK9pXSGPxrZnnnaGvKZyhd2ydFq1sO
X-Received: by 2002:a17:90b:1809:b0:2ee:8430:b847 with SMTP id 98e67ed59e1d1-2fc40c1d6f1mr31288765a91.6.1740039780695;
        Thu, 20 Feb 2025 00:23:00 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1740039780; cv=pass;
        d=google.com; s=arc-20240605;
        b=YYC1IDqer8KoJvIHgTc8njSwaPJYLf34DRAo9P3sLCRT4zWBGTOSZ2eiqraFLLK99z
         DUnCMXwHCIwsmrZ8xk6ZLwb4c6pceiiQm1BkXFsfU+xlk69MqY82ssPAzo0YaRs4EiCb
         Ls3SMBuIJglKvhpzSxbJNyrr0AsJG7ho6nltW7wu6p+SufYgRddbdrXpN8q7iUTVpHgm
         MojiFXgkz8puOG3AIArqW4LqLHi0DY+MEJMDjmK6tVI6Y9r7yGgVL3W3t9grQ0NrYL5L
         cYDOPeo6hMu/U8coPh/Gvzz4o9xDSYF9acUqiu4llnxXxHi2azuUC0KzopxDmqYIs2Da
         BWJQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=uc6GUXjUb/LyczG9cvj5VvXUby17eIRF9KknA7+WepM=;
        fh=McEJFpNWooeu4KfjMpm8Y/6NgpK0tuD9PnL3C9AEwbM=;
        b=XS/B9daieyh99JtmaRPkrk+H9nHX7gidN1+5qvo+iM322cCa+9o2ORKkyJ41qtHvhO
         b5FcOh2fvDRAccn+3rnI48ZL1mDXifQZmBd1BJVq+xiIfhp9kb0xXWGQQWS2HLj9W/6B
         hiwy8WWcNeo3WOhFhnmJmqNsD9QSY2meKLelcQKvDhKCSzTSAqw2D2IZaIqw20y2YWDg
         mob7o1dUAkulGh6PpqKaTPrbAwsWLxfuT0xZrv2P9Dq+QgmpXgIInl6UekXyBBaTss55
         X+D9NlmUv+5QEjmRajkasio7JLVgfhALUoDa/DRZNMflN9AT0o4LUBEsqKiM9BTIRObB
         eyyw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@amd.com header.s=selector1 header.b=mrB4DlNW;
       arc=pass (i=1 spf=pass spfdomain=amd.com dmarc=pass fromdomain=amd.com);
       spf=pass (google.com: domain of luc.michel@amd.com designates 2a01:111:f403:2416::60e as permitted sender) smtp.mailfrom=Luc.Michel@amd.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amd.com
Return-Path: <Luc.Michel@amd.com>
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2060e.outbound.protection.outlook.com. [2a01:111:f403:2416::60e])
        by mx.google.com with ESMTPS id 98e67ed59e1d1-2fbfa08ed0asi23996758a91.146.2025.02.20.00.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 00:23:00 -0800 (PST)
Received-SPF: pass (google.com: domain of luc.michel@amd.com designates 2a01:111:f403:2416::60e as permitted sender) client-ip=2a01:111:f403:2416::60e;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@amd.com header.s=selector1 header.b=mrB4DlNW;
       arc=pass (i=1 spf=pass spfdomain=amd.com dmarc=pass fromdomain=amd.com);
       spf=pass (google.com: domain of luc.michel@amd.com designates 2a01:111:f403:2416::60e as permitted sender) smtp.mailfrom=Luc.Michel@amd.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l41NdOekU7hDxXnK38g310MxGs+XUJJALLm63dc8AkdKLB0pwjAks73xZpeJ/M2JpjuUwzjsJFE8hNvoO9lMTRMnUDADma9QuVNAUsdVDOed62AZmRiHsGuGYZ3Nrtwi4zjIy8ltAzvfJDg4JGvCEmoamSHa19awN21sspr1qUeUNLHRHTbz1At/uCmDMWRe/v6tZyVB9azGLGr18Udnh52cunXeH+O4gHTkuzU8hmI8eU9PoTkG6SanZfHnLRLMWlBm9cQsFLiljkz+7NazV64rMIr2mCxgyBBQqiVLb2iUXhAJXruGxAxMeQxirK4NB5YgEmhTntYFi+PeVFA4Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uc6GUXjUb/LyczG9cvj5VvXUby17eIRF9KknA7+WepM=;
 b=mQXKb9cwQUn+0iZoF1acpk4IMqVtQbWqnL6D3nb6/VRzoaYwcZ+BRdnaedMsvV4u7PB8SdsaIj6GqLwChp+OzZy226SMMg84kwEo50I8G6Ve1stNYAvEbIgm5/dJLppTL0GIDw4CxlkDs1wM87awEZV6MX1w4BvazgtM6fJ19fTXXDIEvBhSXUAAa+oKhBPcP6gGz0geJ/uns7/aDDZ3qz1XaLNVsj01JdZb13kLGMVgK138VDOb62L3Q+a3gXNhFhc1dzdDc0zAEM86ufFwLTej8WTe7eprA311lW3S9TDAviAztaT2qnORh1mSX8lqozzxpNWS+3CSAmiZS8uPKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uc6GUXjUb/LyczG9cvj5VvXUby17eIRF9KknA7+WepM=;
 b=mrB4DlNWLpnkMdPNPYuuHmuk+zbkb3TyWj++XbdF5pczMLhngjU5JmKDdL4FnHPxVH8++Oqf+AEo3L6/zdnplOLBjR5l6mZgz+Ac1jtDvZYL5cmNyRwnWjXXsh75EkC23FXwV6E/5UuLjl5KCV3BpkbhT43GXUZEvOC0g9BsEqA=
Received: from SJ0PR03CA0300.namprd03.prod.outlook.com (2603:10b6:a03:39e::35)
 by PH7PR12MB9151.namprd12.prod.outlook.com (2603:10b6:510:2e9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.16; Thu, 20 Feb
 2025 08:22:58 +0000
Received: from SJ5PEPF00000209.namprd05.prod.outlook.com
 (2603:10b6:a03:39e:cafe::20) by SJ0PR03CA0300.outlook.office365.com
 (2603:10b6:a03:39e::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.14 via Frontend Transport; Thu,
 20 Feb 2025 08:22:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF00000209.mail.protection.outlook.com (10.167.244.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8466.11 via Frontend Transport; Thu, 20 Feb 2025 08:22:58 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 20 Feb
 2025 02:22:57 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 20 Feb
 2025 02:22:56 -0600
Received: from XFR-LUMICHEL-L2.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Thu, 20 Feb 2025 02:22:54 -0600
Date: Thu, 20 Feb 2025 09:22:53 +0100
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
Subject: Re: [PATCH 6/9] hw/char/imx_serial: Really use RX FIFO depth
Message-ID: <Z7bmXYWTFFdUSe4O@XFR-LUMICHEL-L2.amd.com>
References: <20250219210841.94797-1-philmd@linaro.org>
 <20250219210841.94797-7-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250219210841.94797-7-philmd@linaro.org>
Return-Path: Luc.Michel@amd.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000209:EE_|PH7PR12MB9151:EE_
X-MS-Office365-Filtering-Correlation-Id: 26a85be0-c557-4b01-bd0f-08dd5187c87e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|1800799024|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cnFtTll5YmxTVWo1MC96b2RXbDVyQ1d6SmhxOUFremNIdzRZM1NsbHZsOWg4?=
 =?utf-8?B?V0ExVkVNNTFTemo4U0wvWno0Z3Y4L3JOQ1pNNU1ROGdvWnM1Y3dYK0xEU3VU?=
 =?utf-8?B?aHYzYVZlRVp1LzZWOW9DZHJwK3gxdmNhK1RkUTdPSWNBdTVLVVdNQTk4V212?=
 =?utf-8?B?QjZyazZZZDNnTmMvZ2NHak5Ccm5YVWYwdVZ0RUp3UXJOb1ErQ0RWS2JiTm11?=
 =?utf-8?B?QWdBSUphem5aZGJRZjg2ZzliNCtlSjJVamJpQzJLM2xJZnN3a1BwVzVIaG1v?=
 =?utf-8?B?dXA0R1RrRUUwK0o3OTQ4UVZsaTZ3R1BPVVZFYnYzMzlITzJVQk9xS1JIY3g0?=
 =?utf-8?B?NXVRaG1zemIvVkROSVpCc1k3Q3FDRmZRa2t4dHUrWU9lVUN6OTNsSVFkUDVT?=
 =?utf-8?B?aEczZWdoaTJFemxMWENZdE5ielUyZGIvRkFxOXF5aEMyVzV5QWV5U041KzVW?=
 =?utf-8?B?MXY5aUxPUGdKTWV3RnYyMzNCOUd3enFNdEdYaFovaDVaS1pYZERyZlZwQTRH?=
 =?utf-8?B?bnN6YXVkWENJcUhWcmlJOG5vWUhzYjdPTHJ2QzhiOUtnYk9lL1c5UGJocmgv?=
 =?utf-8?B?SGswNlBHOXlidE94OFIrK1ZLRzIzSTFwckt4ZFRrSzA0Z21odTJQRDhlaGlT?=
 =?utf-8?B?UEZ4ZXBwNUFLV2pmOUhPZFpOVGlDc1hTdko3L3E0S3VYQVYwaXU1UFV6MnVv?=
 =?utf-8?B?bkxONmpOTkU1QlMzSXNCWktWcE1NNTRaYWdjY2djLzEwNmhXakd6eE01ZDJ3?=
 =?utf-8?B?clZJWDVtWDZ5cWwyV1BoWjFrNkxLYTYyaHQrYVhQakRvK1l6S1FyT2RqL0gw?=
 =?utf-8?B?aXRlaXNoS2MrSk1MWWZGSzE4VjZ5T2Y4WmRmem0vYmJxUGl4eVRUQlJXVDJE?=
 =?utf-8?B?ZUxyOXhEcGtqOURHcFYrMjFhYVVIc1lTUHg3N29ScGpCWDEwMjFqMklUc1d5?=
 =?utf-8?B?c1FHekcvTGJsSDdCTW5LWEsxUnBhM0theDZDY1daeHhCYVRUMTZzdjFLRSsx?=
 =?utf-8?B?V25YblQvbTVrSjBLMU5RWWVhWnRicS9kY29IVFVUMkhKTmgyY1ZXRitFbXBa?=
 =?utf-8?B?bXB2NUlkSWdKMzY2c1ZkaUc4SHVTRm5CVGpVSks4cW5vV0hmMHNtVFJpcHk4?=
 =?utf-8?B?NG5IOHA3RTdWdEk4WXNCcXpnK3RiSHd2WHFUVmR5VC9CL1BYWmZVTFdCMnZw?=
 =?utf-8?B?dEJEanVRMGR0Smt0cUtkUGNEYTRxdHBpbmNmUllERE8zVHo5SkxSLzYrQXFE?=
 =?utf-8?B?RStwQ1hseDZoNXhWN09jeTdrNlpsWGRjaUpHeXBKZkhQYzlnUEtwQUZoYjFw?=
 =?utf-8?B?Qk9oS3dNWHZ3TDJ3L2dXN3UwbnpCbEF6OEpiT05xbzRkNUp3VFppZTk5eHd5?=
 =?utf-8?B?czZ6K2NaZzlRWFA5cG5KUkRzdlRXcFErZnFnMExaNTB2akF6bWJOZjdlaDFY?=
 =?utf-8?B?akhJdHBuZUMvS1lDTGg3eDZ5VGpFM1NNT0ZWVWI4UzdpWmR5OTZJSWZlRW1q?=
 =?utf-8?B?eFBma055eFlablJFSFkwWURNZUFFNlQrV25CcS9nOUp2SEIxSmN5SWVUVk5V?=
 =?utf-8?B?TFhBWXFXWHk5UlhNT2prdXZLbnJXZklDM3NQdmo3YnlSNUsxVnd3UzdGR0do?=
 =?utf-8?B?NlNnTEFWNzRuMk9lL1lXd2Znb1IyRFpRU2ZTUS9KREFCdDd6dTk2eWEvKzMx?=
 =?utf-8?B?V1lvWkFGQ3JUMTF3T01yUVQ2WHUzNmltdlkwbVdJT1VpQVBoVS9xZTc3clhy?=
 =?utf-8?B?K3VhVmhJbHY0UE96OThNSlBIR3U3NFQ2S2JjNjNpWjlFQ1ZncnA0Y2JnMmNm?=
 =?utf-8?B?aFBKSmwycDRZN3NSRXJacWIrb1RMd0Fsc3psb1psNTZyNy9sdEtVcW4xbXAv?=
 =?utf-8?B?NUI0Sy96WnFmSGg0OVV6YXo2am1IcERXUGdIS3ZiRUp5L0pxb29FUUtJUHlB?=
 =?utf-8?B?cUpnK3g3Q054VVU3TC9JM2lpbmhCYWxwVWVLNjAvUkhFdE5lMEZSbVF1OVdE?=
 =?utf-8?Q?GIvyxGiBHL2thinhUWJlHngXwVavxM=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2025 08:22:58.0943
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26a85be0-c557-4b01-bd0f-08dd5187c87e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000209.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9151
X-TUID: BuWv6xosuMiw

On 22:08 Wed 19 Feb     , Philippe Mathieu-Daudé wrote:
> While we model a 32-elements RX FIFO since the PL011 model was
> introduced in commit 988f2442971 ("hw/char/imx_serial: Implement
> receive FIFO and ageing timer") we only read 1 char at a time!

"the IMX serial model"?

Reviewed-by: Luc Michel <luc.michel@amd.com>

> 
> Have the IOCanReadHandler handler return how many elements are
> available, and use that in the IOReadHandler handler.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  hw/char/imx_serial.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/char/imx_serial.c b/hw/char/imx_serial.c
> index 38b4865157e..6f14f8403a9 100644
> --- a/hw/char/imx_serial.c
> +++ b/hw/char/imx_serial.c
> @@ -386,7 +386,8 @@ static void imx_serial_write(void *opaque, hwaddr offset,
>  static int imx_can_receive(void *opaque)
>  {
>      IMXSerialState *s = (IMXSerialState *)opaque;
> -    return s->ucr2 & UCR2_RXEN && fifo32_num_used(&s->rx_fifo) < FIFO_SIZE;
> +
> +    return s->ucr2 & UCR2_RXEN ? fifo32_num_free(&s->rx_fifo) : 0;
>  }
> 
>  static void imx_put_data(void *opaque, uint32_t value)
> @@ -417,7 +418,10 @@ static void imx_receive(void *opaque, const uint8_t *buf, int size)
>      IMXSerialState *s = (IMXSerialState *)opaque;
> 
>      s->usr2 |= USR2_WAKE;
> -    imx_put_data(opaque, *buf);
> +
> +    for (int i = 0; i < size; i++) {
> +        imx_put_data(opaque, buf[i]);
> +    }
>  }
> 
>  static void imx_event(void *opaque, QEMUChrEvent event)
> --
> 2.47.1
> 

-- 
