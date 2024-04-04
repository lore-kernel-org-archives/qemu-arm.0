Received: by 2002:a17:906:4f0b:b0:a47:c39e:cbe with SMTP id t11csp274843eju;
        Thu, 4 Apr 2024 07:02:34 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCV4pvbZ9mbuRstflpts2RVbcKC3GXiZNhwFaoGuCdL7uXkDs7I68svDd7CUgJ5PkSD+LlhfJZPZA9AxHYtn45FaOvxPdYMR
X-Google-Smtp-Source: AGHT+IG5z2vJ5hcnLx0m23lmdYeLEgYH9THwe+UlR18M1OvAhfEcsahjOLef6ug/skVHn73e1YbM
X-Received: by 2002:a17:90a:fd08:b0:2a2:94e4:6eba with SMTP id cv8-20020a17090afd0800b002a294e46ebamr2770600pjb.9.1712239354090;
        Thu, 04 Apr 2024 07:02:34 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1712239354; cv=pass;
        d=google.com; s=arc-20160816;
        b=U2b5+l9sYH21VKh41zKL5iXj1FVnp5KIdZEX9MZdurNaleXrvPJJ4C+SQryi38Co0Q
         gLPGMT5xUuG75ij2y4GTdJdjvIreKABmE25tg+0VjJISPvNN3WJbNjXJ9bDFhtGvRZ17
         XrKpNoU3qXCU6VjWnudkgSDodhXrwN3hPuTbC4JxSeOgT1GzKtUAv42NbHwabGUbQJVF
         znqTd4ERkRgupoV/8YD/zmNner4t9XjFGARJOSwoJkgZtLV4ZTCd4Pa06cSzNohPZnnx
         e0smQ/psfgyCnqFyeqMCXiu5Vx7CDKU3cd+J3frGuIFPi9PFBTJCxwffQ3GknPTBPhS/
         9gpA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:in-reply-to:from:content-language:references:cc:to
         :subject:user-agent:date:message-id:dkim-signature;
        bh=xTOW4eL2J48x/anFI1wj+IwFebKlVPP2FM9QzD+so7k=;
        fh=9tX89LzYy1PPJUislzf9FzzhMfJBhSEzF9KOgLRDmLY=;
        b=Yz+f4KjX3ccQyhGmq4Xx1tc/MWRMmo4jjIzcmhPFcdWxUILl0RFI4Esgu5ke4ekshH
         0Hh/Mj3y3gAf3G2TQ3y6KCBmiwXHjvyx/qbRfH82JPWy6WndhOpUjJ0gzreVqIXjTF3B
         fF6mZM3llG4ozdk123VrlY9+1TxulfYljGHITloBMkrDiUFT4KSRm9GhgNsmeAm0ty00
         Mi9W3xeEwTZ1eg79Ixc2sXmRF3fMoxoIspEAU/U5mMIXjOVu921vxyvaW5imPwhfoG/I
         u2RRZk9UJSEKPf/pn2S80RIg5fxJKT13+zvVhBXauw2tsPlNmsMr1w0QGHhZLxBxO0vf
         moCg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=temperror (no key for signature) header.i=@amperemail.onmicrosoft.com header.s=selector1-amperemail-onmicrosoft-com header.b=J89j8rv3;
       arc=pass (i=1 spf=pass spfdomain=os.amperecomputing.com dkim=pass dkdomain=amperemail.onmicrosoft.com dmarc=pass fromdomain=amperemail.onmicrosoft.com);
       spf=pass (google.com: domain of vishnu@os.amperecomputing.com designates 2a01:111:f403:2416::701 as permitted sender) smtp.mailfrom=vishnu@os.amperecomputing.com
Return-Path: <vishnu@os.amperecomputing.com>
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on20701.outbound.protection.outlook.com. [2a01:111:f403:2416::701])
        by mx.google.com with ESMTPS id pf2-20020a17090b1d8200b002a2f7dd8afcsi329838pjb.31.2024.04.04.07.02.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Apr 2024 07:02:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of vishnu@os.amperecomputing.com designates 2a01:111:f403:2416::701 as permitted sender) client-ip=2a01:111:f403:2416::701;
Authentication-Results: mx.google.com;
       dkim=temperror (no key for signature) header.i=@amperemail.onmicrosoft.com header.s=selector1-amperemail-onmicrosoft-com header.b=J89j8rv3;
       arc=pass (i=1 spf=pass spfdomain=os.amperecomputing.com dkim=pass dkdomain=amperemail.onmicrosoft.com dmarc=pass fromdomain=amperemail.onmicrosoft.com);
       spf=pass (google.com: domain of vishnu@os.amperecomputing.com designates 2a01:111:f403:2416::701 as permitted sender) smtp.mailfrom=vishnu@os.amperecomputing.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E5K3krKrG81TGo2NlLfeEv8jiBTWmLC1TR4gq3/cuK60DrqJ+MEY61ySWhuM1Xz4vjsjaWyXcbUfLYmw3FKa91pD3I7bbce0ypKIs2EdoZp/hmKnlGJgV6ZD8Kq1EfZYgk4RU6pB/ZgjMgdfyGvvXHifcIaq+50F5kNpGlnFTWZmQWfLfeaveKGYgxWFDdaA0wAYoPLEdKqRy3aSTN4xlfp+T/SmxABeLPkTRP7bpSZUaHoLN4H3lECZA6o4iATyEocuoYAzyxHyy52OFx+mkCuAiCgWPlPyDfnRZP2ly/YOBgM/JBNOle0p2+XnDIuCfOvwl0zuDDvfj6n5CxNgaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xTOW4eL2J48x/anFI1wj+IwFebKlVPP2FM9QzD+so7k=;
 b=gJfmFLwmiffusNptXAQ1/VV9XQZYhzPtU0jRmZtu4xIMD0vvEAiN9JYXhhI9WJIG3MaXBL76O04czusMj6OpHKfl+rE6PvZKvTb0970mqXSHAUJxSLf0eC+P9tmqhx7Exy1hN2fLccziMTEzBOH+Gbp/5g+hstXOh0hxzVXKV7n+LZIzr9Q+YY34DpKQVvfmLrg4RdcqO1pSdOHMRL+bMmKcyFX+Pu2kxEsxdqruKuFUypL6LnYImuSMKHFjVLSbO2TvWobVA5sPLIvjHdCbt3NxDohDo4VQWrF7H0We7wllqSLjHKf99bY7oMRcgIEfdlXp72luAhECSXP0ugsAJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xTOW4eL2J48x/anFI1wj+IwFebKlVPP2FM9QzD+so7k=;
 b=J89j8rv3sbiVwjkAjWL6cr7MkZwXhqLBAXxj5UIs3IXzG60hAGEhvaNPxTTNyJ5jnkYebSdr8tZ9KdNkS8cnhhP0D+usQaWce8GLZ7VuVOtCQzVplD5U6yVogAXnex8rQFH+zJDJW4tL3Fs2MRyFVyvQcvcP71oZCniWEI2jodA=
Received: from DM8PR01MB7142.prod.exchangelabs.com (2603:10b6:8:1::11) by
 CH0PR01MB7106.prod.exchangelabs.com (2603:10b6:610:ff::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.46; Thu, 4 Apr 2024 14:02:27 +0000
Received: from DM8PR01MB7142.prod.exchangelabs.com
 ([fe80::63bf:3703:b8b4:9d1]) by DM8PR01MB7142.prod.exchangelabs.com
 ([fe80::63bf:3703:b8b4:9d1%5]) with mapi id 15.20.7409.042; Thu, 4 Apr 2024
 14:02:27 +0000
Content-Type: multipart/alternative;
 boundary="------------cF4OedXxvwA4KzUguFT5AQgH"
Message-ID: <884099cd-f57f-417e-aff9-52a7d77dab31@amperemail.onmicrosoft.com>
Date: Thu, 4 Apr 2024 19:32:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V8 7/8] gdbstub: Add helper function to unregister GDB
 register space
To: Salil Mehta <salil.mehta@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: maz@kernel.org, jean-philippe@linaro.org, jonathan.cameron@huawei.com,
 lpieralisi@kernel.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, imammedo@redhat.com, andrew.jones@linux.dev,
 david@redhat.com, philmd@linaro.org, eric.auger@redhat.com,
 oliver.upton@linux.dev, pbonzini@redhat.com, mst@redhat.com,
 will@kernel.org, gshan@redhat.com, rafael@kernel.org,
 alex.bennee@linaro.org, linux@armlinux.org.uk,
 darren@os.amperecomputing.com, ilkka@os.amperecomputing.com,
 vishnu@os.amperecomputing.com, karl.heubaum@oracle.com,
 miguel.luis@oracle.com, salil.mehta@opnsrc.net, zhukeqian1@huawei.com,
 wangxiongfeng2@huawei.com, wangyanan55@huawei.com, jiakernel2@gmail.com,
 maobibo@loongson.cn, lixianglai@loongson.cn, linuxarm@huawei.com,
 gankulkarni@os.amperecomputing.com
References: <20240312020000.12992-1-salil.mehta@huawei.com>
 <20240312020000.12992-8-salil.mehta@huawei.com>
Content-Language: en-US
From: Vishnu Pajjuri <vishnu@amperemail.onmicrosoft.com>
In-Reply-To: <20240312020000.12992-8-salil.mehta@huawei.com>
X-ClientProxiedBy: CY5PR19CA0072.namprd19.prod.outlook.com
 (2603:10b6:930:69::14) To DM8PR01MB7142.prod.exchangelabs.com
 (2603:10b6:8:1::11)
Return-Path: vishnu@os.amperecomputing.com
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR01MB7142:EE_|CH0PR01MB7106:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kcBFvsrU9y4aJtcepmA9oprYocQOfpDTUMGAY4PaSDhgjPDiopcpqx/emxJ9aYPtnXEf8lnIbTOuGFD6hBXrNnZ/U2uf5RYso6dN0GLiWSBr51bdVJo7I5tfgAXPVCTcKgGGD245m4KIP90XYVnxuFHfkIR140CDvx+HUYFF0Zn0sg70MSeCe2FauIwfWEdZQ8OkwLJoR6T9ewd1qU7R4GdRzVbPH1O9Zlc+uHFgDIKtqtWKUn826sJ/4H3tkHFm0HWpMwgIWZ1mbjUaOEGtECBLNdOlDGAEHFG4jRz0FpMJqh9GzapCeLadh+4v2IFOhITmwSnykmcb4XV3hu1EltTUKtibBvkVG4ZUL69FQ7DBTjLJktzFv1la126QbZxvPe27sbMkRej5wXTWqfr4qjctlcpdpb0PUP3YLU1NW5cvpYfnOuJRiWIXiuar9LNf6wCYDQraYE1TiXEbHcF/AVbJuaHgI0xz7rFmNQRCJ0ULoaXM9JlTzy1aJ5Vzkrxzde5S39GAPV6jI2Ee6Rdz6MoMGYyX6M2IhvPRDEr6VP/wLA/ktqQ3ZcN40s4RaDnqq98QhvDDB/6I2TjRVPOGzEfiAnMq55M79065+Szf3QLg/FSjbNg5ieEOA8nwePPI7FUJFaEQS/9GKquNUM+SYbDRT1AVNLcsYtmy1llubPE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR01MB7142.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(7416005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NzdaajFTNDdlTk4zNmNSNm1rak5Oci9YT3o5Q3ByZjg4elliQTI5TVlHWDF6?=
 =?utf-8?B?R0g5OGVOMEg1WXV1dDZsbk5sUUQrQzdDM1pua2I1SlRIaE8zS3lyN3dkakJq?=
 =?utf-8?B?TkdJKzNhbEc3UUFxOE0rSktaS0djUmxlK25oRVZ1a2ZNQjZ0eEo4UWptOTBu?=
 =?utf-8?B?OU1YTFlQa3R4dGxmT0xVVm40TXlxRGdocUQ4M3cwd3dYbllBcnhKZmM4VlM2?=
 =?utf-8?B?bDJpYlNZZ3Zmd2d6b1ZpNVVIMU1ISkNKdk0wTldkU1lxSkt0RE9lMEYyMHFM?=
 =?utf-8?B?RmIrR2xwWE9kWHJJYVNxYnlRYW9YSGd6anhKM3RHdGpDUTR3c2lxcVNnUlE5?=
 =?utf-8?B?a3hwanl6UExVdmk2ZXlhcDhvNHl6Z1dZZzhSZEhxQlNHaGtQOFZteTQrWStw?=
 =?utf-8?B?MnBHWUdReUdyN2dxdnZoSVcydmZzbzcweGJyZUlXSWNSeEZVNXRpWUZTMHg0?=
 =?utf-8?B?NXVBQlJvMWYyZkx6RG5jRTJTNnZ4d3VPd3VIdGhFZzVGNThTeFMvY1FwRGRY?=
 =?utf-8?B?RkRnWHMyR2ZoRzRYcmphL25KcGlDS20renRsRU9VVGNjd0pubmcya29XZWpS?=
 =?utf-8?B?ZStxck1KNHVIOWV3c2gycnl1akhWUE1qTkVpSnlVZmFHSWRNc0V6Tll5bXB4?=
 =?utf-8?B?cmxFSkowcU8zc3BwUnRwQ1BNOXJsRmtxcUhobnFQZHAzSnNKN2hoUVFSd3ZO?=
 =?utf-8?B?WXJRRTY2bTNpT1A2WWcwQkpIRytsUm16WGlQRVZ0MXFlV0NvTHJqSUJvdDE2?=
 =?utf-8?B?SU8vTzZWVGFJNUVSK003ZFpPRk9BK1BjdytoeGpwRFNubHlqdjhpNVBHcGJk?=
 =?utf-8?B?K0t4ckNZQlduN0s5VGVLNmhJTVRNaEY1YzUzWk82dUlzcEZIbGtVb1ppbFZv?=
 =?utf-8?B?MkcxSnpZT0J2U3p2OGthZnFNQkg5R3F6b2pIMGlEcTRYSXZMejlUdUxXbnVu?=
 =?utf-8?B?eHlaSzQ2MjBZY1BNdk9SdmxBcWsyNTA4d2RFK3pDWUlRYlhPYW5wTEFxVHN5?=
 =?utf-8?B?WVJ1MGsvZmpHSnlndDFyQnNXRVZuNk9uWTRsU1dMR0d3bjBPSUpCQ1ZrSmww?=
 =?utf-8?B?Sy94bnNNU2x1R2RCQUtwS2xWQnowQ2c4UFB6bWhRaCtoaDFtNkd1SlJiMCs2?=
 =?utf-8?B?bkE3eWp5ZzJEUlNiR21mWnJhSlU0TjJSSjFyWFVqQ2ZmK05nVDRvbUorQlNK?=
 =?utf-8?B?QUZyd3lrYkxETU92NVY4RGh4UU1lY3VHejdzL1lHVHRnK1NXWklpSFNJM1pK?=
 =?utf-8?B?WFkwVlVtU1YzYXhrSE1qdURYQnlHaFcwR2hqVDhoSXNGQ0E2cDVDV1ZTSnBl?=
 =?utf-8?B?d3daRk0zUk9SQUJQRUVsVHpKRHFIb2dTSnlyaWt2a2ZhU2w3dEgvQ0YzNXZS?=
 =?utf-8?B?cG4wK3loQnRtZzJ4K1UyMXdlYnM0S0RlZ0ROZDJucldkZnJkd3ZCRDJ0WTc2?=
 =?utf-8?B?eC9CbU9mbWkvNUZPYmgvZE9QUFZMMFB2U2tSS0pLZUNoaXh2WlpBMGJPS281?=
 =?utf-8?B?UUF1Y0UvL1lqUlhpL2Z1cDJRSENNQzJHZGRLb1NQWmxyTVlUd0J1S1RjM1h0?=
 =?utf-8?B?U25TYkVXL3RoYkFxVUZESVNhNFNtWTZnMnp1ZU14VitrMEdFaUtVUUpCVjQx?=
 =?utf-8?B?QUUvd2c1UmY4WDZBU0wyeXJORmZpL09QQk5FM2ZYc3U0Sko3TmhlVm0yRHoy?=
 =?utf-8?B?K1YzVUtIaGQrNWZGZ1hGMGl1aEo2aFREZ3Y2MjN6V0pIc08vOE5wMkhrZXUv?=
 =?utf-8?B?NXVMelk3Y1BUTUszaVc1Zk9nTlNqL2tvS1BYS21vajhDUVNOYUNzZE5lenI5?=
 =?utf-8?B?YUc1cUhPajVHTElyTkVvMXFvRER0SXV2aDVEWmxUNmp1YlhXdzJ6aUJqQjFM?=
 =?utf-8?B?aWNrd0NucDlBcjBCcUdLM2lpMWpNVytWZmtlU0doSFN1TXVHNW11NGo0ZEJU?=
 =?utf-8?B?Vmo3dFNLYVlaMlpCYVBCRnlFSUdqVmNuSnZhY2JoUWdvVE9BN3F1b05TNFNl?=
 =?utf-8?B?Nndsb1ZqMG5BU0pMNXlwWmUvNzRHNW9KQ3JUMnAvQVlRVzNIR3JrVGQ4QVpI?=
 =?utf-8?B?bHN1bEttdXZTbWpRa0tuRnA3QXBRU2paWWlua05VbCtPYkVJTC9ULzUvc0My?=
 =?utf-8?B?b2IvTDlMM0NKZVhnYncvTjE1aDZQeFVGZ2JxOWtoVzVOMWxMbng2dDgyUllk?=
 =?utf-8?Q?XTkiwqZssbeuU1nnfynVhKI=3D?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 145bfea8-c8e6-49cb-d990-08dc54afdc8f
X-MS-Exchange-CrossTenant-AuthSource: DM8PR01MB7142.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2024 14:02:27.7282
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qGnJF4DfJL7YAYmd+2eN6PalxL+Ya6vXLI+xIvrsSwx3oxGhCPW8dWCksO3s8280dXFiwU6QHnb5xI2Rym45+gMQzJPn06rH8FoDYh1gzcPUKR8kMzabMLY9HR1axK19
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR01MB7106
X-TUID: usF8m1epd5aS

--------------cF4OedXxvwA4KzUguFT5AQgH
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Salil,

On 12-03-2024 07:29, Salil Mehta wrote:
> Add common function to help unregister the GDB register space. This shall be
> done in context to the CPU unrealization.
>
> Signed-off-by: Salil Mehta<salil.mehta@huawei.com>
> Tested-by: Vishnu Pajjuri<vishnu@os.amperecomputing.com>
> Reviewed-by: Gavin Shan<gshan@redhat.com>
> Tested-by: Xianglai Li<lixianglai@loongson.cn>
> Tested-by: Miguel Luis<miguel.luis@oracle.com>
> Reviewed-by: Shaoqin Huang<shahuang@redhat.com>
> ---
>   gdbstub/gdbstub.c      | 12 ++++++++++++
>   include/exec/gdbstub.h |  6 ++++++
>   2 files changed, 18 insertions(+)
>
> diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
> index 17efcae0d0..a8449dc309 100644
> --- a/gdbstub/gdbstub.c
> +++ b/gdbstub/gdbstub.c
> @@ -615,6 +615,18 @@ void gdb_register_coprocessor(CPUState *cpu,
>       }
>   }
>   
> +void gdb_unregister_coprocessor_all(CPUState *cpu)
> +{
> +    /*
> +     * Safe to nuke everything. GDBRegisterState::xml is static const char so
> +     * it won't be freed
> +     */
> +    g_array_free(cpu->gdb_regs, true);
> +
> +    cpu->gdb_regs = NULL;
> +    cpu->gdb_num_g_regs = 0;
Likewise, you may need to set gdb_num_regs to zero as well.
> +}
> +
>   static void gdb_process_breakpoint_remove_all(GDBProcess *p)
>   {
>       CPUState *cpu = gdb_get_first_cpu_in_process(p);
> diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
> index eb14b91139..249d4d4bc8 100644
> --- a/include/exec/gdbstub.h
> +++ b/include/exec/gdbstub.h
> @@ -49,6 +49,12 @@ void gdb_register_coprocessor(CPUState *cpu,
>                                 gdb_get_reg_cb get_reg, gdb_set_reg_cb set_reg,
>                                 const GDBFeature *feature, int g_pos);
>   
> +/**
> + * gdb_unregister_coprocessor_all() - unregisters supplemental set of registers
> + * @cpu - the CPU associated with registers
> + */
> +void gdb_unregister_coprocessor_all(CPUState *cpu);
> +
>   /**
>    * gdbserver_start: start the gdb server
>    * @port_or_device: connection spec for gdb

Otherwise, Looks good to me.  Feel free to add
Reviewed-by: "Vishnu Pajjuri" <vishnu@os.amperecomputing.com>

_Regards_,

-Vishnu

--------------cF4OedXxvwA4KzUguFT5AQgH
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Salil,<br>
    </p>
    <div class="moz-cite-prefix">On 12-03-2024 07:29, Salil Mehta wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240312020000.12992-8-salil.mehta@huawei.com">
      <pre class="moz-quote-pre" wrap="">Add common function to help unregister the GDB register space. This shall be
done in context to the CPU unrealization.

Signed-off-by: Salil Mehta <a class="moz-txt-link-rfc2396E" href="mailto:salil.mehta@huawei.com">&lt;salil.mehta@huawei.com&gt;</a>
Tested-by: Vishnu Pajjuri <a class="moz-txt-link-rfc2396E" href="mailto:vishnu@os.amperecomputing.com">&lt;vishnu@os.amperecomputing.com&gt;</a>
Reviewed-by: Gavin Shan <a class="moz-txt-link-rfc2396E" href="mailto:gshan@redhat.com">&lt;gshan@redhat.com&gt;</a>
Tested-by: Xianglai Li <a class="moz-txt-link-rfc2396E" href="mailto:lixianglai@loongson.cn">&lt;lixianglai@loongson.cn&gt;</a>
Tested-by: Miguel Luis <a class="moz-txt-link-rfc2396E" href="mailto:miguel.luis@oracle.com">&lt;miguel.luis@oracle.com&gt;</a>
Reviewed-by: Shaoqin Huang <a class="moz-txt-link-rfc2396E" href="mailto:shahuang@redhat.com">&lt;shahuang@redhat.com&gt;</a>
---
 gdbstub/gdbstub.c      | 12 ++++++++++++
 include/exec/gdbstub.h |  6 ++++++
 2 files changed, 18 insertions(+)

diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index 17efcae0d0..a8449dc309 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -615,6 +615,18 @@ void gdb_register_coprocessor(CPUState *cpu,
     }
 }
 
+void gdb_unregister_coprocessor_all(CPUState *cpu)
+{
+    /*
+     * Safe to nuke everything. GDBRegisterState::xml is static const char so
+     * it won't be freed
+     */
+    g_array_free(cpu-&gt;gdb_regs, true);
+
+    cpu-&gt;gdb_regs = NULL;
+    cpu-&gt;gdb_num_g_regs = 0;</pre>
    </blockquote>
    Likewise, you may need to set gdb_num_regs to zero as well.<br>
    <blockquote type="cite" cite="mid:20240312020000.12992-8-salil.mehta@huawei.com">
      <pre class="moz-quote-pre" wrap="">
+}
+
 static void gdb_process_breakpoint_remove_all(GDBProcess *p)
 {
     CPUState *cpu = gdb_get_first_cpu_in_process(p);
diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
index eb14b91139..249d4d4bc8 100644
--- a/include/exec/gdbstub.h
+++ b/include/exec/gdbstub.h
@@ -49,6 +49,12 @@ void gdb_register_coprocessor(CPUState *cpu,
                               gdb_get_reg_cb get_reg, gdb_set_reg_cb set_reg,
                               const GDBFeature *feature, int g_pos);
 
+/**
+ * gdb_unregister_coprocessor_all() - unregisters supplemental set of registers
+ * @cpu - the CPU associated with registers
+ */
+void gdb_unregister_coprocessor_all(CPUState *cpu);
+
 /**
  * gdbserver_start: start the gdb server
  * @port_or_device: connection spec for gdb</pre>
    </blockquote>
    <p>Otherwise, Looks good to me.&nbsp; Feel free to add<br>
      Reviewed-by: &quot;Vishnu Pajjuri&quot;
      <a class="moz-txt-link-rfc2396E" href="mailto:vishnu@os.amperecomputing.com">&lt;vishnu@os.amperecomputing.com&gt;</a><br>
    </p>
    <p><u>Regards</u>,</p>
    <p>-Vishnu<br>
    </p>
    <blockquote type="cite" cite="mid:20240312020000.12992-8-salil.mehta@huawei.com">
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------cF4OedXxvwA4KzUguFT5AQgH--
