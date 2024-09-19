Received: by 2002:a17:505:42a7:b0:1be9:327d:8ee3 with SMTP id rt7csp286173njb;
        Thu, 19 Sep 2024 08:56:35 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCWVZrf7twyIZnm/pD5t3ocMnWk0UjiL6vXhWCpD+46CcnZpoAumxIV4HzWcBdVOHlFnUA53neseS06NnA==@linaro.org
X-Google-Smtp-Source: AGHT+IGR8zGDMKBvBSJcDAbkPqQO1Wh/swnDh9E1yc+1dWPnlrz7NoJKhI8m7eN/zkKE0GIynaR5
X-Received: by 2002:a17:902:e84d:b0:207:1570:13e8 with SMTP id d9443c01a7336-2076e31f04amr373689215ad.12.1726761395487;
        Thu, 19 Sep 2024 08:56:35 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1726761395; cv=pass;
        d=google.com; s=arc-20240605;
        b=C0xLpyeR2Iyd2qLlbsfrQ+y1xO1+92qWFZAZI6lRqFOW7a5AyNCk6BMgEOkj20Mx78
         m0qBVUXAElLcpn21cXokHQGVl+N3B5HUbYBmR2XwtgI5Tz4u28XjvUPVzCoC7aqfdqWu
         aG5dEDuFkf0NfkzgDTELcmh4SpSdq4dWlJEV00wA3IVyCRgs9z6qXfecCikJhZahlGX9
         z0fpa5LC8qT6J3XVCIi9CX2WdWJx9zkzPD1pV30pVcgmOHx2ywaoueZf44f4Lk8xvMzk
         sDIUzGehcn9jkCFiiPyXdZasMSVk/dwueytPKkUSLzewljCgPG4tsdJd0y4o7+jykPBP
         4Ldg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=mime-version:content-transfer-encoding:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:date
         :message-id:dkim-signature;
        bh=UsAyoozlum0ealAMPfSRXaSsNvE+Wcmeefet8nSgKvQ=;
        fh=OY1nNymyeu5l2nPUN+QIeEOguAaG3EF6bwSt4m1EGes=;
        b=cE95QN0PA5M4BP7GaAfEevmvOMRUiHY1WtKVpD3d68ZRvMnzRhRM4MbLiNCBgsOh4K
         T8KDXN1kRbF7GpVP85Nt37Clz4fe9OSMlJq40Wp9IugJP7FkPbyH8lQIdfKQkAEwbaHn
         LpkDIuSIU1nQ1PYgglWbXeP3OGcv7fU1D5N7lHrGknjV7zyr73OhjjNBfuNhAG+HWTNT
         NCNqutaVYBjpn6/PbT3jYvV9/WkMCGpe0h0AA6iMQ6DCBTyc19eCb/ScsmbZ0wRmz6ce
         gWYS3jqQloR7WK1Vgc35nxyPIVI9sndu3RSbf4+RCiPmxe/ObFA/nfVG1H6hBW6WsNMk
         giRg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@os.amperecomputing.com header.s=selector2 header.b=hvOBz1TQ;
       arc=pass (i=1 spf=pass spfdomain=os.amperecomputing.com dkim=pass dkdomain=os.amperecomputing.com dmarc=pass fromdomain=os.amperecomputing.com);
       spf=pass (google.com: domain of gankulkarni@os.amperecomputing.com designates 2a01:111:f403:2009::705 as permitted sender) smtp.mailfrom=gankulkarni@os.amperecomputing.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amperecomputing.com
Return-Path: <gankulkarni@os.amperecomputing.com>
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on20705.outbound.protection.outlook.com. [2a01:111:f403:2009::705])
        by mx.google.com with ESMTPS id d9443c01a7336-207946de619si135090065ad.254.2024.09.19.08.56.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Sep 2024 08:56:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of gankulkarni@os.amperecomputing.com designates 2a01:111:f403:2009::705 as permitted sender) client-ip=2a01:111:f403:2009::705;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@os.amperecomputing.com header.s=selector2 header.b=hvOBz1TQ;
       arc=pass (i=1 spf=pass spfdomain=os.amperecomputing.com dkim=pass dkdomain=os.amperecomputing.com dmarc=pass fromdomain=os.amperecomputing.com);
       spf=pass (google.com: domain of gankulkarni@os.amperecomputing.com designates 2a01:111:f403:2009::705 as permitted sender) smtp.mailfrom=gankulkarni@os.amperecomputing.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amperecomputing.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NOzT7hqyiIL8oVBIpkWbirp3cpufCpCQJv1TQfNe6NSDGOzMCqoePYOjjQqv7paZ5Dn+EnbhXL4bZTwNoHDxhr85X0dCzvEjRBsUR+zJMf2hzoibWhWmmzLXPfU3rhdalkx3JxtVI16gteNDeS9QFGTBOd4dHbhUHDrf08Z5D741HP1OMtWlXybK3XGJPeU0I4nfgGqiG0LzRfEpfLS4Z6o7MA9PcxIiTn00vjrnW+IOXrsWzId1IuVA6LwYG6ww0NJv8Awe3jAq7AuvE8lpgDLANXiRL7aD3wzvTNzJeXnYvq0bZi3Hl7ac+HrdUgHtBbXPkFoqQY2JhLXmakRwEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UsAyoozlum0ealAMPfSRXaSsNvE+Wcmeefet8nSgKvQ=;
 b=XaG+ACWyvieKMaHfgB7I2cgSvtFzL15s8ARxpH/5M6TLd6k9uG6I+r2mg15l16CmtdcUe7VtiiTBioHxuLT7veJv6f+48Lywisqo+7ea4V5vCXjXYSU7OWH7ptQuXc/i1/FMRCrLaetwkinj99XgEkMxrhyGod4gNLUpbhcXiCdzI2nEN0X1TnjWgDPUFFIhC8c8az7sGhbX+EbejN84cOSrOQmtlMDoZ6cdrpTBteofueqpvenhvLGkLyUsrEaW/ecNtIWsrmMTwPfyOyGqOpPVXXDem2lrMCLF725ZNWeII1mmLv4+mDecuCYYCM93LbqrKkQSMLtapkSrs3pw2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UsAyoozlum0ealAMPfSRXaSsNvE+Wcmeefet8nSgKvQ=;
 b=hvOBz1TQvt/FJpWYV2mfCcdxjYhka6/4bJOF4qflezmQfQ8QN1H+z2YMApzgABlrp0rBZVdosgT6tF8kA4GDfcsrhinnJ7lBrqSYIAkuUXMyLtQ96ONXGCCoUzCZD8Qu2S4XZImyZExN3dxeBDuF9DQd8lnAYGcLWXTtFaD0MXw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ2PR01MB8101.prod.exchangelabs.com (2603:10b6:a03:4f6::10) by
 SA0PR01MB6379.prod.exchangelabs.com (2603:10b6:806:e1::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7982.17; Thu, 19 Sep 2024 15:56:22 +0000
Received: from SJ2PR01MB8101.prod.exchangelabs.com
 ([fe80::292:6d9c:eb9a:95c9]) by SJ2PR01MB8101.prod.exchangelabs.com
 ([fe80::292:6d9c:eb9a:95c9%4]) with mapi id 15.20.7962.022; Thu, 19 Sep 2024
 15:56:22 +0000
Message-ID: <cdbe8ff8-6745-4b3e-9c9e-e557bad1aa21@os.amperecomputing.com>
Date: Thu, 19 Sep 2024 21:26:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] arm/kvm: add support for MTE
To: Cornelia Huck <cohuck@redhat.com>,
 Gustavo Romero <gustavo.romero@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 alex.bennee@linaro.org, darren@os.amperecomputing.com
References: <20240912091616.393685-1-gankulkarni@os.amperecomputing.com>
 <0faf9a7c-0400-482c-974f-7b70e1d58202@linaro.org>
 <879f7e65-070a-4d9b-b70f-60576b7b5319@os.amperecomputing.com>
 <8734lvu1ji.fsf@redhat.com>
Content-Language: en-US
From: Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>
In-Reply-To: <8734lvu1ji.fsf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0014.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::21) To SJ2PR01MB8101.prod.exchangelabs.com
 (2603:10b6:a03:4f6::10)
Return-Path: gankulkarni@os.amperecomputing.com
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR01MB8101:EE_|SA0PR01MB6379:EE_
X-MS-Office365-Filtering-Correlation-Id: 43246635-570e-423b-8263-08dcd8c39b9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WWRlQWZZWm5wbVhZck9PTjE3NWRtR0ZyVzZ5TFRxNGpqK3FEdUdtVDJWOWRF?=
 =?utf-8?B?YmgvWWJMS0ZmbkJsd2MyNnpmMHFGU3NmREkrenVGQVRkRGVZSzNQakczUDdy?=
 =?utf-8?B?Mm90ditZRk9PbE9HVnJyWEczcmh0Mjd0eUlWcS8rdzFBTFhjNExNbHBxT1pi?=
 =?utf-8?B?YW90c3BrTy9yeVJyQVNvd0F6UENlTDJ2L0dnZzUvNVFRb0hhMzAwMEE2b29q?=
 =?utf-8?B?alFDd0NCOSt4MlE4Q1IxM0I1dkowa0lCRTkrVU9FZWV4eU9lTDBDQ25jZ0Uw?=
 =?utf-8?B?TkVkR3ZTQnRGei9Ma2xHUEZBOXJkeWlxVWM0bWVsbW1rM0JLZ1Fzbm9OZnE5?=
 =?utf-8?B?VXlRRDhpSjc1Ym5XLzQ3ekZpYnZSTDVCYWc3bmlQdDlJRjU1dndFckthMnlJ?=
 =?utf-8?B?aUkrc0g3aFlQZ1hHQ1FkUGNqV1Z4aGlObDNNeTkvV0k2ZzBoUDVQYTNHT2Ji?=
 =?utf-8?B?S1ByaEI2RFBackFYWGRqNDB2b29aYmhYMGozOGVWNEZmeFF6Z21uQnlhUXJG?=
 =?utf-8?B?WVdya09rcENmcUdSNngzNVdEZ2I3VW0zZVFVendRWVFiMkd4aHFqYXNLVzYy?=
 =?utf-8?B?OG96elMwYUR3eTdGMlFCTDBhRFVuSEYwa0Q3cXRHTVQ1K2sxdVVGODNXOG1k?=
 =?utf-8?B?bDlLdHdTY21Nc2JpZ3l0cVZpMzRqQW1ZOEZqZXdjamVrUzgwRzVha1dBOU9O?=
 =?utf-8?B?bDkwcFhNYUIvaUZRbmF3ZmY0bWZoZ2JyZTR1M2c1UWJSMm1kNjJ3ZDdmbzBT?=
 =?utf-8?B?UjNkQUhVNjRPNlpWaUlpUWVzY2ZhTmYxN2FOSmJvVGlLQmUrRHN1cGRpaHFR?=
 =?utf-8?B?ZHNXQmQxY0QxaVZHb1VXZVdnZjVoem8yZGtrNVh5b1JZZEhHVjRWZ1FXOXl5?=
 =?utf-8?B?MmtIM2xCK2VESHk2RjJ5RUUrWEJROGorR3hKMXQyOVZ3V3NvcW1lUGIzTXcz?=
 =?utf-8?B?dXE4YURCamZpb1VYRE9nK0FRdHAyZmtFY25aUTVYT3hLRG1kUXpaeWFibGg5?=
 =?utf-8?B?VEJlWVpPTzhvakx4UnNVVjZVcHhISjJUUmNsWm1GbS9xUm1EUi9MT0xnNDlm?=
 =?utf-8?B?blhIM01XVkNWVytGQ1RsaEJ1Wjl3RmtOZ2RHaFV1eVp5cTRNNW1XRGpmTnh5?=
 =?utf-8?B?U1B0L3EyWjd5VFh0dXQyY3NQRDFCbEtzbkNPSjM1RTVIODRVdW04MmRMUzgw?=
 =?utf-8?B?ZUMyeUtnTHdIWStHRU5SK3VQTUtBMjNRbENTb3NsY2xMVW1YdEI1cWVMdVpM?=
 =?utf-8?B?RUZ3R3FUNDgzR3JaK0NJN01wMlBLd0ZjU0pUdk5oU0dUbjZBd3hUNW1mU2Zm?=
 =?utf-8?B?bG15ZDFYUWk3NDdubDFDMllFR2tEdkJtZ1dwMWFlb0w2OGlZUGFPMU5HZ3k3?=
 =?utf-8?B?MS9PNHd5bU9yT2U3Um5kQTdSMElIYkNjcGd4TVZZYU9mMndXY2F5bHlRUWhP?=
 =?utf-8?B?WExBMlUxb2JteHExZ1JoOXhYUzlDN2QxNHdYaWxWaGlaWDVOay9JNVY4NEkr?=
 =?utf-8?B?U0c1QmRBV3hGK0wydXY3UlcwR3NhS1hNMHBXYzM0TjVQNHB0VUhEcklOdWdS?=
 =?utf-8?B?aDZIMDQ4WkY2TGxBWG1PUy9LZXFZY1lDMXNRVXhyQWgxd05DOXhndFRFQ2o3?=
 =?utf-8?B?ZSt2Vm5IMXFKT1lKSUFhaHVERlJQY0xKWnZQU3VXMnpTNlZKM2FJQjg0WGht?=
 =?utf-8?B?QzRkbitnRGZUMEIzUEEveDZxL3MyR2l0eUhTK2lhQStObEhnZWM4MG4xVUoz?=
 =?utf-8?B?ejlIY0dta2ZXVFpvRExvR3ZMNG9GSTJXRDY5b1dwVW5sL0l0TVdsUzRoMlpv?=
 =?utf-8?B?MFZJRGpKTnRLVmkyZGVVZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR01MB8101.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cVBSQkV4KzlpK2dTOVVhdC9qaDR0Z1JhZHM3cGkxb3M3ZXVZclRIc0Nlb254?=
 =?utf-8?B?bTd2NktCbWRjUFlFTzVNd0ppOTA4bnBVZ1MrTDJYL2pUbEpBWTVMSXd3SUov?=
 =?utf-8?B?R0dTd1ZVWGRPRktaRGFHYnh4a00xOVFEVnVmT1phNU8wM0lQbkNEQi9ncDJI?=
 =?utf-8?B?bWYwVUsrUldleTE0eU9WK05JeWJjZXl6UUVlY2dLVXNJWnBVN2dMWGVLYURt?=
 =?utf-8?B?TzNiY2E5NFY1UlV2OE1TdnNWTTlNWTd2WmRYL1crb3BXbmNmWkllMGdhNmw4?=
 =?utf-8?B?Z0kzRzFkWXNsVTdYOUF4akZWZzZQSVZHNUd5enl1UUVlWlhOVnFqRVRRSVhl?=
 =?utf-8?B?OTh1emsyaTBVMnhnU0tnZ1FoZFhNdlFuSUhBS0JOYk5FT1pJUEFKdU1VZVV6?=
 =?utf-8?B?b21hUTdYT1N2TGJEblRUcU5DNVpWamZDanZnUDI2SHQ1TWJoY2hPbW1tZnlW?=
 =?utf-8?B?eUp5K1pZZmVTVm5Cd0ErSEFQQ0RybmozUFNaMk5sczA5YkE1ODNmbkpwTU12?=
 =?utf-8?B?MkJKelRSazN3TGRsNFJ0dHFWNEdpVjAvc1E0RFhHSmZBUW9xSHpUaXFLcjhv?=
 =?utf-8?B?ZktMSTg2L0ZtVlpUbStyNzZFMzRTV3h6enA3SHNNdzlrSmxWT1NvRUtaWTVq?=
 =?utf-8?B?bXV4K1VGcnJiUWRrbGFEbkZNZDZxT1ZoMEJPY0oyQlZSbkZyRzFkWnVGbVNI?=
 =?utf-8?B?a0pEcXhOSVowaGJQbzRlbng1TEFpWUkydHpBcVN3RS9kQjgvQ2F2TEZHVGxt?=
 =?utf-8?B?NTBSZ3ptUVVRZkphbTE3VGhVR3BMZmRLRS9uR3JsZmxYWGFXdThzNkJ1UDRN?=
 =?utf-8?B?TUNjb0tIMlVzRXZja1BOL29xYkxoeE1ZUVdxSkgvWkM4a0ZzTWN6YUNQSmtX?=
 =?utf-8?B?cEFFbWZRdm5ERjdXRkNsMGs1dTZLMXVBbXMyZ1dRYVcvTnFiTUMybHJ1Y1lG?=
 =?utf-8?B?MUxtT2VKbnBMSlEvNW0yZFcreWxmNW5XR3lDKzRZRkNkZzNqTU9mdFBiRldR?=
 =?utf-8?B?eE10WU9kVVBBZ3VDUFN2Z21wa2k0cU1BOS8xS1FjUW1Od1VhbUJONG8vKzdp?=
 =?utf-8?B?WmpaWmZaUHpYRXJkREJQYmtQaTkvYnAwVjlVNm1qUlVDZVJjZ1piTFp3T29I?=
 =?utf-8?B?QmlpSmZJZTRzczdDWGFMWkMrWFcyU2pYaHJmNXlQT1Fya2l4L1YyU0hCMncw?=
 =?utf-8?B?TVk2Vlloc2xlWnVZNjVhNEVSY3ZpdzI3b2p0MTFjVGpCbHU5c3VXbFpHZ0I0?=
 =?utf-8?B?d2hNSCszOXNoMklsV2VyeFRwd213dm1uZkZzS2RXUHFCS3o0aFEzYyswM21q?=
 =?utf-8?B?ZVVtb2pVOGZwQ0xKSkR1ZEE4MDlkWDlxYlo4SEtqd3JwakRKQXBXWFJQTW5v?=
 =?utf-8?B?T2I2V2pnb2xkelBpdTE1ZmhmamVhcXJZSWtuSkwzWmc4NmhySWZYSkdpbnlo?=
 =?utf-8?B?RU5oSllFWGpjb1VNRnpWNDFTUlNCZHVNMEVyUVNYRUlMUmZuMzdpcHBXMGJ0?=
 =?utf-8?B?alUzZWd6SnhCVGp5Ni9sZkI0NnIraTBLYWlQUldBVkJELys3SVRwWnpQUXN2?=
 =?utf-8?B?ZVgrblNYQmNXa2RJZXl0LzF3bXdBKzdFT3JFS1pvQ2pCZHpmR0Fvb2FqRjQz?=
 =?utf-8?B?YUF1YlYvZFFpdEJWbVpzYU5BYk1TM3FrZENkYW5MSHU3ZVh3aTkvM1lTdHZU?=
 =?utf-8?B?RmgweW1DM215NFl0bWxJb1Myem1QS3RZOXdjb0FDUEdLaDRoRVdjOGNVeVVa?=
 =?utf-8?B?Ti81QktTT1FraGdzVWtMQm8yanQvMmlVZDlGcWNWWWdRTXRmREtoeEdlTFBm?=
 =?utf-8?B?aFVhTmhCTGtzem5QalZFOGtsR0picUF3VzhCUmwyeXU5dXg0SGtheXpsM1ZI?=
 =?utf-8?B?UnU0TDhma01YcmhJNWJMd3REL21aSlRaYno4MVFZcFdtTHh6UkhaSitHZkg3?=
 =?utf-8?B?ZW1OK0RMc256Z2hJOE5GdnVEaGY0WWNBQXM3OWNMOFBRVXhOM0pMNXl0U2Vk?=
 =?utf-8?B?c1FFTkpWYzJRdkhhMWo0TkI4eUN6QitGYk41TEpIMWFYZW9CZEJud3FGRFdW?=
 =?utf-8?B?OExNRmVQOEZmUnRUeWZtYW1CZXJ0b2kvN0QvSGp4R0JtVEo3NG9FUnRRdWlt?=
 =?utf-8?B?NmY4cGtWZ25IY1VKVmRuZWtsaFhUR3FnNmp2c3dDL1BCWTBVak5JdHljUGdM?=
 =?utf-8?Q?XtNeBbVz29FjHctKVFe2y6Y=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43246635-570e-423b-8263-08dcd8c39b9e
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR01MB8101.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 15:56:22.3964
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xr9xtUWmsZkEiL/0LOaUO1qKytyN+eMbgn1ZWZ+ID0Nj+KKA9zwH2D+Von8e9rthUyEVQ4NvbacsfiDCNa2Cyjp48FTOKQl/pvV4uu523lvKfInDpsWBGWqoatl2aPoz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR01MB6379
X-TUID: G7LwseHtAWYB



On 19-09-2024 08:35 pm, Cornelia Huck wrote:
> On Thu, Sep 19 2024, Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com> wrote:
> 
>> I have modified as below diff to keep TCG if loop as it is and adding if
>> for KVM case to clear/mask the MTE bits if MTE in KVM mode is not
>> enabled by user command(if no mte=on).
>>
>> Is below diff makes sense?
>>
>> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
>> index a59417aac8..523996576d 100644
>> --- a/target/arm/cpu.c
>> +++ b/target/arm/cpu.c
>> @@ -2390,15 +2390,20 @@ static void arm_cpu_realizefn(DeviceState *dev,
>> Error **errp)
>>
>>    #ifndef CONFIG_USER_ONLY
>>            /*
>> -         * If we do not have tag-memory provided by the TCG
>> -         * nor MTE at KVM enabled, reduce MTE support to
>> -         * instructions enabled at EL0.
>> +         * If we do not have tag-memory provided by the TCG,
>> +         * reduce MTE support to instructions enabled at EL0.
>>             * This matches Cortex-A710 BROADCASTMTE input being LOW.
>>             */
>> -        if (cpu->tag_memory == NULL && !cpu->kvm_mte) {
>> +        if (tcg_enabled() && cpu->tag_memory == NULL) {
>>                cpu->isar.id_aa64pfr1 =
>>                    FIELD_DP64(cpu->isar.id_aa64pfr1, ID_AA64PFR1, MTE, 1);
>>            }
>> +
>> +        /* Disable MTE, if it is not enabled by the user for KVM mode.
>> +         */
>> +        if (kvm_enabled() && !cpu->kvm_mte) {
>> +                FIELD_DP64(cpu->isar.id_aa64pfr1, ID_AA64PFR1, MTE, 0);
>> +        }
>>    #endif
>>        }
> 
> Wouldn't that be a possibly guest-visible change?
> 

Yes, the MTE bits of id_aa64pfr1 are masked to guest like before.

-- 
Thanks,
Ganapat/GK
