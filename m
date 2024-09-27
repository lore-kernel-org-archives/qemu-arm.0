Received: by 2002:a17:504:5f68:b0:1be9:327d:8ee3 with SMTP id gl8csp332967njc;
        Fri, 27 Sep 2024 06:23:51 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCU/t2yPCmULBejFNEo1p1opmsHUv6o5sdBj0z1IlNrSWD7Zl1hxFLJy2s4eKsyzAlXYCg7A0Y+VueLjcw==@linaro.org
X-Google-Smtp-Source: AGHT+IEmyzGK/rcEAjM6L9LV5VEHvLjEe9sM9RuNFLoZ0z2u/MfgwVlj4fNYNuvEQQO+qKStphHB
X-Received: by 2002:a05:6a20:43a8:b0:1cf:4fd9:61db with SMTP id adf61e73a8af0-1d4fa639514mr5414555637.8.1727443431141;
        Fri, 27 Sep 2024 06:23:51 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1727443431; cv=pass;
        d=google.com; s=arc-20240605;
        b=W9DVWgSkslXNfAIPAHz9IXa02lYg4k/1xyx5wILiIwAIRZNv0/X1DNuSe6wOw/7cYL
         Cy9GEDLdfzLI9t/VBC4tLrFnodVHZzaMdj1aRme3yJzOdpdAs8/Fm410+wgt2t7LLLUy
         8BiLq1ANi8y+p0nISKrLwdjQU6TqsJN+oPHrXn681IQBYPz1FtMpao/IGryLvZtsQHIA
         p8zzNtOY9UOHkpsPCtDpwQWXCciFqDoiuEVQB09WlaioVe9K3894hxQCMde7E2uCAUe1
         j7F54R6Wgf++jDvZKWHT6+EYfw/A3Pf+DGru++3DyFzYELMFF1r/E/yQFYlPIOzaw1cW
         tR+g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=mime-version:content-transfer-encoding:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:date
         :message-id:dkim-signature;
        bh=D/VNLFB3ehuJOZnxYL0zTKp2f7fASMuD3elmvLWy6Ws=;
        fh=MKhFJWd2xNARcdHQ77UO7XiMxQnssJnHEshjaavlATo=;
        b=h0CBDksf7oVVHtvdQL0xX4139lhQZsB3qY5d2RdZd7B5UKKR4ANuH+6q+lRw5QGUH1
         dPYyRDQVL44wcrVrxf88UVELzBDWXESGD/bwyDDN5OMl4Xr+v+OoAGh/oAOsdTUkRytK
         H43UiZpWuv+DTw+pFRj2O+6WOGpd9l6RvBPK0nTOwPJwm/nCMOxsaJzBr9co7C7UZg8o
         wcS9bs5wJ6NkwkYA06wYgWAF8wIPpdSg+EJ6aNsuVcL9nFYdV4gzNTYeYveaAb+tW6Nc
         z02FDHgklipHLrJZeiHj/mXxjrvAUqRn1pHIAnDgWEhQ8P6I0Fox1GI0eFNA1zTGQ5SA
         kIrQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@os.amperecomputing.com header.s=selector2 header.b=Ek728IBt;
       arc=pass (i=1 spf=pass spfdomain=os.amperecomputing.com dkim=pass dkdomain=os.amperecomputing.com dmarc=pass fromdomain=os.amperecomputing.com);
       spf=pass (google.com: domain of gankulkarni@os.amperecomputing.com designates 2a01:111:f403:c110:: as permitted sender) smtp.mailfrom=gankulkarni@os.amperecomputing.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amperecomputing.com
Return-Path: <gankulkarni@os.amperecomputing.com>
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azlp170100000.outbound.protection.outlook.com. [2a01:111:f403:c110::])
        by mx.google.com with ESMTPS id 41be03b00d2f7-7e6db6c577fsi2324320a12.479.2024.09.27.06.23.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 27 Sep 2024 06:23:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of gankulkarni@os.amperecomputing.com designates 2a01:111:f403:c110:: as permitted sender) client-ip=2a01:111:f403:c110::;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@os.amperecomputing.com header.s=selector2 header.b=Ek728IBt;
       arc=pass (i=1 spf=pass spfdomain=os.amperecomputing.com dkim=pass dkdomain=os.amperecomputing.com dmarc=pass fromdomain=os.amperecomputing.com);
       spf=pass (google.com: domain of gankulkarni@os.amperecomputing.com designates 2a01:111:f403:c110:: as permitted sender) smtp.mailfrom=gankulkarni@os.amperecomputing.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amperecomputing.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uvbWiJJPXgrd+8i6aNci5+Un+HMR7f2WYk8ZZAOH9H+Iu0oTRVafMxaYytJmJGUTJs6diK9hAoc0ny0SYRdpCOhLuFcCgf+5zgth5NkLWwoSadScjzxEZ+tqG0Igua1GID8LA/5Y5WFhCX1lacZ2uKgkaB9gHdYZvUZg1ipBMuFxLxMtTiLoGvqd+6Vk8QJ70a3WNU2da/VREpa4AwCpwUIBjx1CE7WK4ndZ40CFns059PJmstsiMWmaQX5lBeZjnVIfWwq7z+hmaliw3rbH0vrKmKneaZETflafauVg6BOREK1LlUB1+eACfpp8OTC8z98OzjuAO12LD937fEG/rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D/VNLFB3ehuJOZnxYL0zTKp2f7fASMuD3elmvLWy6Ws=;
 b=vaDdN0W7fdJmeHB5KuLBkN4OlbYr/GvOb6iMDo53ESmSoFqANb4dI06ZKc8sHt5X9DKfwUa08U0kj4AxkAC54nFTW/SuCUNDliSqB+ew2EPIKyNVYNpK0pHNbfVueKEW7n3SzBL9h4Xpw/FyYjJXL383A8JalJTVYhJ3yxOcjI01fIDEZCQLraNLsf+g3XRL0hdekmNaOrBtTuZUlF90vV0I5SHs1ONlRz3nnRZU+Zsm6mlJmtciNeeLIMA6nXBZ9Yms93GIiegcmP45BHEOlzeTrmbAopGyROhzoul8a9SUhoGOCvK9cOhdPcqNSxfW/EaHm7D3bW320YeeQCYUEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D/VNLFB3ehuJOZnxYL0zTKp2f7fASMuD3elmvLWy6Ws=;
 b=Ek728IBtLlBVtJzbzLIfODTIe6mdAxGFsx5wgZKie6Ct6XhtKD4X1j/gC9uUMTpgsPSzHwIv7RO/v92wJ7wzlCcYTxRqOrQeF6sSTcVTgNEoSwDl1W6A4MZxpFwXz7h38BEdrkl4Y4mdu276J5GKoLaSLWTyc/mH6KZjL1vbMoc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ2PR01MB8101.prod.exchangelabs.com (2603:10b6:a03:4f6::10) by
 BY1PR01MB8994.prod.exchangelabs.com (2603:10b6:a03:5b3::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7982.27; Fri, 27 Sep 2024 13:23:46 +0000
Received: from SJ2PR01MB8101.prod.exchangelabs.com
 ([fe80::292:6d9c:eb9a:95c9]) by SJ2PR01MB8101.prod.exchangelabs.com
 ([fe80::292:6d9c:eb9a:95c9%4]) with mapi id 15.20.7982.022; Fri, 27 Sep 2024
 13:23:46 +0000
Message-ID: <5fe798a9-7654-4487-9631-a5dce43a73cb@os.amperecomputing.com>
Date: Fri, 27 Sep 2024 18:53:38 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3] arm/kvm: add support for MTE
To: Gustavo Romero <gustavo.romero@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 alex.bennee@linaro.org, darren@os.amperecomputing.com
References: <20240920073725.410373-1-gankulkarni@os.amperecomputing.com>
 <87tte3sxkx.fsf@redhat.com> <f3da8f58-615b-42ed-a99d-20bfd9ec6b56@linaro.org>
Content-Language: en-US
From: Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>
In-Reply-To: <f3da8f58-615b-42ed-a99d-20bfd9ec6b56@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0114.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::12) To SJ2PR01MB8101.prod.exchangelabs.com
 (2603:10b6:a03:4f6::10)
Return-Path: gankulkarni@os.amperecomputing.com
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR01MB8101:EE_|BY1PR01MB8994:EE_
X-MS-Office365-Filtering-Correlation-Id: 770336cc-f8f7-4d92-382c-08dcdef79d64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R2F2TEdjaWVRbmhaNUwvQUtJZTRTN3ZDNWoxd1UvVDd6TUQxeEJ0bmNhVlNU?=
 =?utf-8?B?ZUJtS1FvQitWQlBHRmc5T3hZemdLSFlaQTZobi9tVThsczRjVGpxYmc5eWtw?=
 =?utf-8?B?V2dDaFVCNnltdXlVeWFBeE5HMTJ4R1Z6RE0rckdJVU53YkdjTXRVYkNGQmp3?=
 =?utf-8?B?WnJxaWltS3BEcWkwSHF0UURYOGtmOGducGU5UlpNd0JuZU0vbUZVeXJpZklJ?=
 =?utf-8?B?S0E3S1QraXNMcElzdU1YbnhCdXpZbHJxZEc4bEVRK1lWdzB2V05XOGd3REhn?=
 =?utf-8?B?M1l5a2c1Skw0YWVlZXVObjljVmhOV212K1RPM29YNUFYT2NGaWYyTE5mb1JP?=
 =?utf-8?B?UFBBNUpHcjNHbDA2Tk1YTXkwVU9rRmdXbEJKVXVVbFZUYmx6NDREbk9YUXl3?=
 =?utf-8?B?SGJyeVVBR0RscklQN3JTTnFwSGsyYjkzSUNNTVBSNmFyZ0JqZTQwV0NXUmJ3?=
 =?utf-8?B?MlMzbnY4cDkwU3VCWDRXMTFIVFhtblpuUVNwM0poeFMzSnVkR2E3RjVlRDN0?=
 =?utf-8?B?MEFtSlhhdjRRc2FFU1VUWEFqMGh6a2VHQUJMT0p5Y01EVnJFYjRwOFpmeTdn?=
 =?utf-8?B?S0pqZU9ET0ZNMWJwMVFWTTRISjFsNk1qb2xTLys1ZEtBbFdFMHpBN01FbG1m?=
 =?utf-8?B?QUxBdXloMGttTHBtbktQWklrOXh1UHJ5Qm1kQzRibmZxZ0tCSG5yVmY4T1hr?=
 =?utf-8?B?SmRwMkk2enBYWEZXQTFhYTNhYVFVamN0WmRnU0hnUlA4aU9HL2k4bnVRa2V1?=
 =?utf-8?B?QjQyWmRJSFl5OWpUd0tjdG5IQno0ZlpBNnJYbTdyV3pnWEVGSE9FdlZ0em02?=
 =?utf-8?B?US8yYVR1aTE1S1hreGUxbVNhMml5RVVGQkZxTDRTMXNUSVdmVm1KUk5TNkQ2?=
 =?utf-8?B?TUpTbnNTdnBsYW5GazRTN1dTaVNQUzdNNmxraFp3MTQrOXpDSS9MZTZWWW9H?=
 =?utf-8?B?R0tOeWIwZUxjeWtpSVpQM2hvRjVJNHVQZ092YjFvcTNLOGR1SDIwcSt1c01J?=
 =?utf-8?B?aVpPSDNSRE9ETDNobmJoanVEaXdEUkRkV0k0L3M1Vm1pT3NUempSVmMvQ1RW?=
 =?utf-8?B?N3RQbWxuN0laUXdSVFcwZGxaVnB1TlVXellybTdGWSsxYlN5NDhvL1B2L21r?=
 =?utf-8?B?akZaQUZ1WDZGdHVaMHV6K0dHdWZ5VGhKL3plVm9qZEthVk15akw1YzJXbGY4?=
 =?utf-8?B?UDFtd2EyZG1rSVpZdUJBR3RzWGpGSDJmVTBFUVRKdlJFQVBOTU9YTGxBSHVU?=
 =?utf-8?B?RzNDZ01VYWMvekNUWnpKVGYrMmNXL2k0QTVnOTBYSDJHc1lidUordUxFeUVv?=
 =?utf-8?B?T0JVbGJ0elVuQ0l4RHIwQThpb1IzbGR3TGtlUzRVVnpDN2NNekR1d0o1T28w?=
 =?utf-8?B?Mk85R0NJd090eDhSSE4yTVluTmZycVB0Y3VUOUI0aHM4SlZHU3pPRFg1NjBK?=
 =?utf-8?B?azlQaFhOUlhhNEdpdktidzdkUFA5eE1pRDJ5bDAvdktHdURmdmVFcVFMZ05L?=
 =?utf-8?B?cHhKdkdiL2x4U0tYOW5vczQwWUpHVFRFMEpzTVpSNEdQWG9LdC9nRHVFVVRx?=
 =?utf-8?B?V3AwdVhqMGtjbEsrQ29mY0RTdmhnWDFyQnoxUzcwMEtlMGxNNW1henhQVXlO?=
 =?utf-8?B?NFNoeWNlNUhEOXhyYjl3QmRiY2RsbUJZYWl5QjBQd29VYVlBVHZCazQ4UnVR?=
 =?utf-8?B?YmJ1S1ZBWHVDcEtrbUlTOTJ2QkdTWVh2ZzdpdldoVVJjWWxRaTVHVmxRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR01MB8101.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YUpjTHAzek5UZkxDVExNNFBnd0JMUU5GVll3c1BCZFpYNm85anhvdVh1MEw1?=
 =?utf-8?B?NUZGSFIyOHFnc2RtWTZSVXFLK1JQUFZyWDJZUmJTUk5BTllGQnM2bTF0OWxZ?=
 =?utf-8?B?N3VaY0FEWHVQMGFrT1YveW1KT214RjhrK2pLUXlTdFBqSW44OGNQWnZsTU52?=
 =?utf-8?B?WXhTdnhwcGkvT1JoRGU3c0F0c0t0L3kxZkNRWjhMRm1TWEJ6SWtSZmM5ZElB?=
 =?utf-8?B?WXdjNk00dXJhOEtmQnZia1VGaUhnQzc1NzFXM1Jaejc4YUtWcngxVzQ1WUxq?=
 =?utf-8?B?Qi91OWdOWWdOL2NOL1NsdUhWWjFGRTQ0QXg3UWxwMUlhUmlnMEM4dlRsUWNr?=
 =?utf-8?B?S0FwL1JORlZObkxnZ0ZqNnY2MVZqSURmdVN0TVNIYWlJcHU3Q3RiNDFVQ3RB?=
 =?utf-8?B?bUQvT0d6VnFHc2t0RnpOUDhORkdCVEQ2ekJUM0pPWHp0UFJRTkRYc0tLVHZQ?=
 =?utf-8?B?emNNT29wTlVYK0NXSG9NNWVuY2hYdDQzZ2xrdWN0SmlEYU93UEJJSzlrK2Jm?=
 =?utf-8?B?Q3JWbkx1RTRNM3FHOG1TMEd4VlRyWHdqaXQrRFNMUWNiRnlGTjdDM3ZteVor?=
 =?utf-8?B?aDNDRzhZeVltNC91Sk5YTXdYb2pOcGJPcGsrUE5MR296RDNKR3gxS1U1dXpM?=
 =?utf-8?B?WHFDMXJvYzZueTEvQlc1Slc1bjYxSzZSL0RPdjMrZ05FUGVuYUdWaWR1ZGtO?=
 =?utf-8?B?Ukg3eHFQRUpIaUdJZlRjQmZzUHVjZFUvSFhzZW9UWG44MENnNEpOSGF6TnB6?=
 =?utf-8?B?Qm9seXVaYXlBSFNFSTR1MDFCQ1l6RWF3cTJ0SElhMzlQblJIbk1rZnJ2cXVS?=
 =?utf-8?B?TjhBT0x0NExTdThpNGZLMnZoL0h4U0IrbU9OcWs4ekMraHV3S1kyT1BXT3JO?=
 =?utf-8?B?U2J2aFFFK1hVcGt3YzhOSmtSak1PM2lYTi83ZnZyem4vVGtlbzUwTlFnaXBW?=
 =?utf-8?B?SFppSFI1STRRdjNlZndOcGJReW13V0dvaVhjYWdidGFQYTRiK3hxTVBuYVlq?=
 =?utf-8?B?MXpoQk9jWWlXSXRpQVJjWUZFallncUtKTi9EMklFTjB2Z2tMaFFOZWc1S1BD?=
 =?utf-8?B?YkJXSUZ4STRVZ0lVREJlbEVCWmxXaHArdXJNS1BhdkNuck9nQXd0d1ZPcldj?=
 =?utf-8?B?SWhmT0hGQnpMT1lGTUZESlZlY0dYdUtUWEZidzZOa2NpQW4zNkNxallQeWdh?=
 =?utf-8?B?dFEzVkdEb2pCOGYvQnRCLytqUzRzZUNEWWJPV2xZTnh4T296Zi9Tb25zRHVa?=
 =?utf-8?B?clQzb3YzRjlLUlpVWk05MXptaWdoMjNJcEJsRUxxNG9kWGl3d2UwbDdXMmkw?=
 =?utf-8?B?WU9NUnJOanNBNDNQSk1ZSFEzbVc5NE1neFZsUTZmNHBLcFRrc1RvQ0RLK0xq?=
 =?utf-8?B?SjV6a1Nnb1ZVODg4djM3T2hmREhxT3dvTENXVVhienhZZldod1RZRTdmVkk5?=
 =?utf-8?B?Rm9tV1oyN1pFVFVYTGtiWXhoNk1IT25CcWNQd0o4Sk9OSTloMnBFMXVVQ0Ex?=
 =?utf-8?B?NkJKaUtPdFg3Nm9zQUV0MXBXb2FMRW9GdGlOZmMrMURtazB1UlhBc1BBaks5?=
 =?utf-8?B?SnFuc2paOWltMFE5OUEyQjhXWElJVDVFZkNudEg5QzRjb3UrWU1rZURkVW1t?=
 =?utf-8?B?SUlpTlB2WmQraElZcHJwRVJyWG9UTXFYemd5UXRkSUZJQmZDb0NYZ3NxaXVV?=
 =?utf-8?B?ZnQyclJQL0pqRkw3OXlKaHpxa3JQL3Q5REZjQjJIREVXb1E1TWZaaHFNb2Zq?=
 =?utf-8?B?bWgwQ2ZmQXM4NjhvR0tqWXY2elEyYlUzWkdkTWhpTloxVTVvTmduMXBsV0NU?=
 =?utf-8?B?RWxzMmJPWVFrMWtHa0l0b0JWbU9yWGJWaHcvcEI3WjB0ZzJyOHVyU25yN3hx?=
 =?utf-8?B?NmduVmYxTFRDVm9QcUw5NXlnN0hEZE5FdFVXRmlYMDNJOEZXR2xlaTA3eUhL?=
 =?utf-8?B?VG1JeXRWYldXZVcycGVSZFRxMzhuS0JQMnUvS1JTaU5uSnhhQmh0V1dINGg4?=
 =?utf-8?B?SEdCdG5oVFkySnd4aHIwanMvemIzZG8vQndveUk4Ujc0SFcvK2FRTFBpZ0xW?=
 =?utf-8?B?WTd0Mi9pZS9TNkprblRDalNjYUsxUjd6dUpxWTJNV05tb3gzSUFTaDk4QlQw?=
 =?utf-8?B?ZmQva2F2UmlwUkJNRUczK015WjRPdWZudkRaR2RUTmxlVFV5d2JyOS90T3RP?=
 =?utf-8?Q?GHKIRglGwvREKE4n3T9AMTM=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 770336cc-f8f7-4d92-382c-08dcdef79d64
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR01MB8101.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2024 13:23:45.9700
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ErvSD69Nt5Kn5w8iIafQO6X7MmE0sXkOE69O+skTG1a7eIFjXlHw2rkxJJCQn2paGK+AViKitpuLjAqEhFhI6bGD8cxSsJG8HKVAD3fZTmox0fPrx4v7G+bKc21hEO/C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR01MB8994
X-TUID: A+hVVYfjldsO



On 26-09-2024 09:41 pm, Gustavo Romero wrote:
> Hi Cornelia and Ganapatrao,
> 
> On 9/25/24 14:54, Cornelia Huck wrote:
>> On Fri, Sep 20 2024, Ganapatrao Kulkarni 
>> <gankulkarni@os.amperecomputing.com> wrote:
>>
>> Mostly nit-picking below, otherwise LGTM.
>>
>>> Extend the 'mte' property for the virt machine to cover KVM as
>>> well. For KVM, we don't allocate tag memory, but instead enable
>>> the capability.
>>>
>>> If MTE has been enabled, we need to disable migration, as we do not
>>> yet have a way to migrate the tags as well. Therefore, MTE will stay
>>> off with KVM unless requested explicitly.
>>>
>>> This patch is rework of commit b320e21c48ce64853904bea6631c0158cc2ef227
>>> which broke TCG since it made the TCG -cpu max
>>> report the presence of MTE to the guest even if the board hadn't
>>> enabled MTE by wiring up the tag RAM. This meant that if the guest
>>> then tried to use MTE QEMU would segfault accessing the
>>> non-existent tag RAM.
>> I think the more canonical way to express this would be
>>
>> [$AUTHOR: reworked original patch by doing X to avoid problem Y]
>>
>>> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
>>> Signed-off-by: Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>
>> Also, the S-o-b chain is a bit confusing that way, because you are
>> listed as author of the patch, but I'm in the chain in front of you -- I
>> think I should still be listed as the author?
>>
>>> ---
>>>
>>> Changes since V2:
>>>     Updated with review comments.
>>>
>>> Changes since V1:
>>>     Added code to enable MTE before reading register
>>> id_aa64pfr1 (unmasked MTE bits).
>>>
>>> This patch is boot tested on ARM64 with KVM and on X86 with TCG for 
>>> mte=on
>>> and default case(i.e, no mte).
>>>
>>>   hw/arm/virt.c        | 72 ++++++++++++++++++++++++++------------------
>>>   target/arm/cpu.c     | 11 +++++--
>>>   target/arm/cpu.h     |  2 ++
>>>   target/arm/kvm.c     | 57 +++++++++++++++++++++++++++++++++++
>>>   target/arm/kvm_arm.h | 19 ++++++++++++
>>>   5 files changed, 129 insertions(+), 32 deletions(-)
>>>
>> (...)
>>
>>> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
>>> index 19191c2391..8a2fc471ce 100644
>>> --- a/target/arm/cpu.c
>>> +++ b/target/arm/cpu.c
>>> @@ -2390,14 +2390,21 @@ static void arm_cpu_realizefn(DeviceState 
>>> *dev, Error **errp)
>>>   #ifndef CONFIG_USER_ONLY
>>>           /*
>>> -         * If we do not have tag-memory provided by the machine,
>>> +         * If we do not have tag-memory provided by the TCG,
>> Maybe
>>
>> "If we run with TCG and do not have tag-memory provided by the machine"
>>
>> ?
> 
> Yep, I agree, this is better.

Sure, will update the comment.
> 
> 
>>>            * reduce MTE support to instructions enabled at EL0.
>>>            * This matches Cortex-A710 BROADCASTMTE input being LOW.
>>>            */
>>> -        if (cpu->tag_memory == NULL) {
>>> +        if (tcg_enabled() && cpu->tag_memory == NULL) {
>>>               cpu->isar.id_aa64pfr1 =
>>>                   FIELD_DP64(cpu->isar.id_aa64pfr1, ID_AA64PFR1, MTE, 
>>> 1);
>>>           }
>>> +
>>> +        /*
>>> +         * Clear MTE bits, if not enabled in KVM mode.
>> Maybe add "This matches the MTE bits being masked by KVM in that case."?
> 
> Clearing the MTE bits is also necessary when MTE is supported by the
> host (and so KVM can enable the MTE capability - so won't mask the MTE
> bits, but the user didn't want MTE enabled in the guest (mte=on no given
> or explicitly set to =off), so this comment is not always true?
> 
> How about something like:
> 
> "If MTE is supported by the host but could not be enabled on KVM mode or
> MTE should not be enabled on the guest (e.i. mte=off), clear guest's MTE 
> bits."
> 

Ok thanks.

> I do assume MTE is supported by the host (i.e. MTE bits >= 2 in the host)
> because otherwise condition "if (cpu_isar_feature(aa64_mte, cpu)) { ... 
> }" is not
> taken; and at this point cpu->isar->id_aa64pfr1 is set from the host's 
> bits via
> kvm_arm_set_cpu_features_from_host() and kvm_arm_get_host_cpu_features ().
> 
> 
>>> +         */
>>> +        if (kvm_enabled() && !cpu->kvm_mte) {
>>> +                FIELD_DP64(cpu->isar.id_aa64pfr1, ID_AA64PFR1, MTE, 0);
>>> +        }
>>>   #endif
>>>       }
>> (...)
>>
>>> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
>>> index 849e2e21b3..af7a98517d 100644
>>> --- a/target/arm/kvm.c
>>> +++ b/target/arm/kvm.c
>>> @@ -39,6 +39,7 @@
>>>   #include "hw/acpi/acpi.h"
>>>   #include "hw/acpi/ghes.h"
>>>   #include "target/arm/gtimer.h"
>>> +#include "migration/blocker.h"
>>>   const KVMCapabilityInfo kvm_arch_required_capabilities[] = {
>>>       KVM_CAP_LAST_INFO
>>> @@ -119,6 +120,20 @@ bool kvm_arm_create_scratch_host_vcpu(const 
>>> uint32_t *cpus_to_try,
>>>       if (vmfd < 0) {
>>>           goto err;
>>>       }
>>> +
>>> +    /*
>>> +     * MTE capability must be enabled by the VMM before creating
>>> +     * any VCPUs. The MTE bits of the ID_AA64PFR1 register are masked
>>> +     * if MTE is not enabled, allowing them to be probed correctly.
>> This reads a bit confusing. Maybe
>>
>> "The MTE capability must be enabled by the VMM before creating any VCPUs
>> in order to allow the MTE bits of the ID_AA64PFR1 register to be probed
>> correctly, as they are masked if MTE is not enabled."
> 
> I agree.

Ok, thanks.
> 
> 
>>
>>> +     */
>>> +    if (kvm_arm_mte_supported()) {
>>> +        KVMState kvm_state;
>>> +
>>> +        kvm_state.fd = kvmfd;
>>> +        kvm_state.vmfd = vmfd;
>>> +        kvm_vm_enable_cap(&kvm_state, KVM_CAP_ARM_MTE, 0);
>>> +    }
>>> +
>>>       cpufd = ioctl(vmfd, KVM_CREATE_VCPU, 0);
>>>       if (cpufd < 0) {
>>>           goto err;
>> (...)
>>
> 
> Comments aside:
> 
> Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>

Thanks Gustavo.

-- 
Thanks,
Ganapat/GK
