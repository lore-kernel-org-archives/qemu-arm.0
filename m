Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp45652njc;
        Thu, 20 Mar 2025 19:55:13 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCVkrj8CKrTnnbNeUU7w2N3GRXPhBjzJr2T/KcWXgQKn/XKY89JDY9trIorCOVDJy3+3HWQHFoMKIgVVQQ==@linaro.org
X-Google-Smtp-Source: AGHT+IH3E/1mPpZWc62jMdB9886cRQHTHdvO4r2681q8JPRsSW+DjeYrf36NqGdDLxW5Iv41IXgS
X-Received: by 2002:a05:6214:dca:b0:6e8:f905:aff0 with SMTP id 6a1803df08f44-6eb3f33c8ebmr24542716d6.35.1742525713306;
        Thu, 20 Mar 2025 19:55:13 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1742525713; cv=pass;
        d=google.com; s=arc-20240605;
        b=KvQIJjFHIcf8+yDn0DhdqdsJ08W+RJl5nLfQbFyepZqBLhc34s7Flmm55uQchSUfph
         AP2cvmx29rtwdgr0xEtBwLbK3BO1NdWJJs8lYp0Lev4kIze7i5s2ulCpbm3udn7I71Yf
         BpC5YSe49ejZYVEz36EqzY+CMqaZxvf3xDOGUIUbSzxFBrSU7m5wpUoR2UiIW+Xx2akf
         ISmGR4RHWzDo53NrKuc7//RTrY1aTXcV2MHfb00rRk1iIXW5H9z6yTs89IjwoHlPdnOf
         3MRl2tqUZCmy4C4Dct3TYAuXsup7D5KD+5DfZrJdA3+/TAdAktgBjuyffek/0fxIP3lo
         KsiQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:cc:to:from:dkim-signature;
        bh=vgAH5qDxZ36HVHrZsnkFWU4CTFlBuFs/b/a1BKECNrM=;
        fh=P/g+kTUW+s4mkE+kIha88BM4QHPFj0V3iiVMqTGtdOk=;
        b=PrqxOo9uwVtkycjDhW+bCcQ8cAGexzRm7ou228QYlILGvY5IEddK6kukP+pO3L/sBZ
         FDTTgVEMDOnAJf9lqkHr2H04cx5IuCT0d+CQpGqOMGWFui7NKFbbiMh2m6nzlmS7J4D7
         Iu8Dbh83jxvgKCjjzYtiPet19dlgEg21USg9BF4oHhMbkBelbEQFHXvsJ7/oRLzDFz/+
         dHcdiKPGqNqXiKLMMBzgoHcROW5O8Jdtqdp4fnV45FwE66JrcOt0tuF15mVMft1eZBOw
         dUC8fXjUtwL13NKKLoD33mCpXZkg4NtFJKNj/bCi1tCmSHA6HpfYsa1oNm9Xu+5aVoRl
         gRbA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@aspeedtech.com header.s=selector2 header.b="h/dTtkd5";
       arc=pass (i=1 spf=pass spfdomain=aspeedtech.com dkim=pass dkdomain=aspeedtech.com dmarc=pass fromdomain=aspeedtech.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=aspeedtech.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6eb3eff37fcsi10631406d6.201.2025.03.20.19.55.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Mar 2025 19:55:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@aspeedtech.com header.s=selector2 header.b="h/dTtkd5";
       arc=pass (i=1 spf=pass spfdomain=aspeedtech.com dkim=pass dkdomain=aspeedtech.com dmarc=pass fromdomain=aspeedtech.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=aspeedtech.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tvSXH-0005az-7g; Thu, 20 Mar 2025 22:55:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1tvSXF-0005ac-Dk; Thu, 20 Mar 2025 22:55:01 -0400
Received: from mail-tyzapc01on20718.outbound.protection.outlook.com
 ([2a01:111:f403:2011::718]
 helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1tvSXA-0007YY-Ow; Thu, 20 Mar 2025 22:55:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CnJ3fycerAjdjjsRKXYDERxMbUW1XrvDmL0TdvFcD4M41Ik83qZNi33PWtv0ZXupaH7Xvx0ITe69ag85jgILOCWIOb+r842vAc7EC7rJq0UJuJmDTvohfb6Mt0C6r5YLjqE2LIoSXlmT60DRjYCtQc1eEFJIZ+lLw23p5hF51wIax7NrGyaTi7hE+kg6Tl6WGDgWRnVTyALIZhM0MhOLzbceNMHwh/IF4r/Pi9049kChSE1XMQeqiaF0PIxBOk+jykGHyI4DgkgB4Z8wGOpji6Xir8pUDnvWA7zlea30vSf1B7EJvZW1hp8Z/ON1EQaLDFHtt8O+QXumeS8VnYJoUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vgAH5qDxZ36HVHrZsnkFWU4CTFlBuFs/b/a1BKECNrM=;
 b=d1m0nZYQp59qxWEgyIyonBYHdfabNBfhmcAZNAkGwGDkw2sNn7kk8Ls0L81SFQDAaqDpX6worZZsdFVrIHqb8gQh2T0mL/BmbjC1QfEtlSACifpuNe48+ZioSHZPsMfQIJMt2A7O+3434/hToR8YTPMFUdJV7xD8ElWR71crASMJT/SD9ucp1UW17mpfA0KfAEDxPfntMyV9gRTt0owZ6Uqs6rPHP4GCzkWuppYKO2Bl7W1lyHwgeSiEq05W+4LJmf12MZVKbNTECE53CerAY2gRBGE1j9VrlWUEJaV8PXzR7v6wgyfSMe5/r+1oD2zXKPFnyNInSQLG+qWKappMzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vgAH5qDxZ36HVHrZsnkFWU4CTFlBuFs/b/a1BKECNrM=;
 b=h/dTtkd5CP6rYS+yjg50Bjb4urocxYRpgjqoFI9r9Y3DeLodIcDBLHXtl1NQdxgAlk5NluJHMQezZ71zHH3K6dkfxY+OkGlH469FX8LTznMFp6Z/gpsqALk7puiExU/fFeUL25sibKUxQTbZ0lsC1Hbgt07x2815TD4c7mw/RreyHzP8E3j+uWozs9RQ/+bed4kauJcUwdmzUWcVKNRAo9gXfbILbrbohnYjf6GVCWn0zDfH0L3JpDLwkjM76uHHxuuUeEO4ai+ZaW5NQQDwzek0lYVK0zXSoqmPrmedmM6fqVsK0hkhPZQl6zuwwb8R4j7UoINtBKRMej17+jr5nA==
Received: from KL1PR0601MB4180.apcprd06.prod.outlook.com
 (2603:1096:820:29::12) by TYZPR06MB5783.apcprd06.prod.outlook.com
 (2603:1096:400:269::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Fri, 21 Mar
 2025 02:54:46 +0000
Received: from KL1PR0601MB4180.apcprd06.prod.outlook.com
 ([fe80::6fe5:1995:96a2:552a]) by KL1PR0601MB4180.apcprd06.prod.outlook.com
 ([fe80::6fe5:1995:96a2:552a%2]) with mapi id 15.20.8534.034; Fri, 21 Mar 2025
 02:54:45 +0000
From: Steven Lee <steven_lee@aspeedtech.com>
To: =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Troy Lee <leetroy@gmail.com>, Jamin Lin
 <jamin_lin@aspeedtech.com>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: Troy Lee <troy_lee@aspeedtech.com>, "longzl2@lenovo.com"
 <longzl2@lenovo.com>, Yunlin Tang <yunlin.tang@aspeedtech.com>
Subject: RE: [PATCH 1/1] hw/intc/aspeed: Fix IRQ handler mask check
Thread-Topic: [PATCH 1/1] hw/intc/aspeed: Fix IRQ handler mask check
Thread-Index: AQHbmazg+f/7g8eK2E2+7RPGx4q6BbN84h7A
Date: Fri, 21 Mar 2025 02:54:45 +0000
Message-ID: <KL1PR0601MB4180B4C4C323A2C3FE5248D985DB2@KL1PR0601MB4180.apcprd06.prod.outlook.com>
References: <20250320092543.4040672-1-steven_lee@aspeedtech.com>
 <20250320092543.4040672-2-steven_lee@aspeedtech.com>
 <f6210cfe-2a3f-47be-8ff3-568c3b2fc055@kaod.org>
In-Reply-To: <f6210cfe-2a3f-47be-8ff3-568c3b2fc055@kaod.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR0601MB4180:EE_|TYZPR06MB5783:EE_
x-ms-office365-filtering-correlation-id: 2ff670cc-e9ea-4416-433c-08dd6823bceb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?T0RCSGtFZCs3YkpoLzhGT3lYWFRIUGpjaHNRR1NvWGQ0ai9iOWhaWDRvdFZ1?=
 =?utf-8?B?RlVqR2pPY01tdnlnK0V1V1FSeEx6eG81SDJoTVAxNWZiZmpIaVh1ZFhOVmN5?=
 =?utf-8?B?L0Z1SUR6eTd6VHZ4TDNUWjVOSU9BaERoandZWkl6UWh6Ry93SWFYNlVtUGIw?=
 =?utf-8?B?MU8yM2d1VWhadmJaZXdwK21lUUhIQ0lDNGdLZVZUL01TTHMwbEpWbllRdzVD?=
 =?utf-8?B?ZUtyV0xzSitpL0NucUZ6cXZMdjFscmdZSFJQT2lqRFI4emdVTUNTdlUvZTBj?=
 =?utf-8?B?a2FRM25OZDQ3NjhoMGVLSjlaQXJIdE11U1ZPZ2lxZG8zRzFEMjBOV3lIc0dN?=
 =?utf-8?B?VzdrRjNhN3cyTkR6R3paTEhNQ1Zpakg2YTZLNi9NamtGdDFMVjgyZExlSHpt?=
 =?utf-8?B?QVFIMy91K28rMHdBekdwQ3J1QWhHYzMrdStBaDQ1Zk1EYkJjcUNIVWIyUVVw?=
 =?utf-8?B?OUdkQzluZ29jeG5aNWNZYWxTR0RZWkhsS3RHMVArMzYrTzNXVDVhOHRFOW5C?=
 =?utf-8?B?MWM5dzUxcGtUU3Z3bEdMMDg4MFp0b3RZckZOcnl2OE16OW9VOEpWSE9ZZG84?=
 =?utf-8?B?NVcyZ3AyMDArQnF6QmYvSU1TbnRyR1dpMVovUkgwTDVFdkhoZFlEbStoRHQ4?=
 =?utf-8?B?RldxV2NkT3BtMnV4Y1hZZHgwVmNLZkNLRmZDUUtrRHdTQktnRGd5VE1WQ0pl?=
 =?utf-8?B?Vi9GVWl6blpwSnQwMVN2MktaSG1hcmJkRGJ2UlJvR09TcEJHSHNFeWFURmlI?=
 =?utf-8?B?eEY3SmhmRjl1SFFCRWhocTFzT1dXMk1PWXBwdzluNDdBbUVuZ1NzRHV5aDkw?=
 =?utf-8?B?RlUrWUtwcDlxeUllaFdBUUk4UTNTbGRJZ3BzNDkvM0RVZU9zZkV6UTNnd1J6?=
 =?utf-8?B?VFZ0M0dNQ3JBSjM2Z2QyRDdWRThlWkpvUlJGRHVqRGJPODgxZ2F5KzU1YktS?=
 =?utf-8?B?SFYyYm5OOXpSTXRsWXNod3JMSHRMVTlwdWovdVBpOTVkSUFrckUxRHFzcUFC?=
 =?utf-8?B?Sjg4ei9xUlIyRUR6bnB0ei9nVnMwdFVmVGtWamhLWGFWK3AzcnplTkhGeEFs?=
 =?utf-8?B?RVBndEw1ZytVQjdjZFUvOFlGdW5XZ0tnYWNkK2JvQnN5UzlBcThQc3J1MkdM?=
 =?utf-8?B?WjRpeG90ejh4eXRuVXJzZkprRTh6dnk4VThpcnJMU3dUYTlJVm10NThIVEh3?=
 =?utf-8?B?b1JVc095WDRvQUFsVEFSV2FhY09JQmc2ak92NktmQzhRUzNXd3ZHNDNJdDEr?=
 =?utf-8?B?ejJQZmlqTmxxSGFiMlpLTVpZWXJqWHpOaDVEdlc1Wk9pR3VHQkF2emRZUjdC?=
 =?utf-8?B?SFc3UmFCRGo0ejBlQmEwVk0xdGlDWUhnakt3NWlyQnI2V05pYWJXSmRZZzBv?=
 =?utf-8?B?UGVxQThGTlVOV1JVMTR0Um5ETVlBdldxdjlvbVBHckxrN0lNY1lsSHZFdEVJ?=
 =?utf-8?B?bHpoRDRPbUoyaE5hL2EwWUNGeFZWMEJ1Q2dHb2xZVlpyS2F6MGJNblFoSWxX?=
 =?utf-8?B?WFVwdS9NUHZDWGZRaldaRTM5SU0zSWtRcnprTHErM25hdys2ZzhleDg3dnpj?=
 =?utf-8?B?ZTN1eGMwRWVZUmNaNCtqVlc2Y1lWdFpjbFFHa09TYVd1R3VvZ0lXU2Z1QW4v?=
 =?utf-8?B?Nlk4U1V2VkJwMVRxV0RtK2JhQng2cUhuY2FGWCtDclRvVVA5elI4dExYVFFJ?=
 =?utf-8?B?aUkvQklzbzIxS3hxV1g3Q3hpcTNoVmZkUXNTN25BYUNoZUs3QThsZmdsZTB5?=
 =?utf-8?B?YmtpTFJCQnJHd01id0FQQWwreDhENkxSbzBBOEM0S2gvOEFKa1UwYXpENFo4?=
 =?utf-8?B?dEV2U053bERrckphQXg4VXFXZFRNamZlR0pjRWpuR2pVL0k5MEkyc0ZJNVFi?=
 =?utf-8?B?bUJNYVE3alEzZjNvdXVJdStjSlpIVEQvSTFHKzBzRlppYWErLy9DVm0yaFZY?=
 =?utf-8?Q?RAc+LW8z3ctWRwDc3fR9OgqKZZZy6lyR?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:zh-tw; SCL:1;
 SRV:; IPV:NLI; SFV:NSPM; H:KL1PR0601MB4180.apcprd06.prod.outlook.com; PTR:;
 CAT:NONE; SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT;
 SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WDlBQmZlMnd6aE11cnNXdnRnYU1ZcGlVa09kSVBJTVdOUEp5aUpUdnI2MmlY?=
 =?utf-8?B?MloxM2w0cUdvWTlRS1hMZFgwMUxkZEVPOGpOa0VkUmhDZXRiM2xQQmp6OGY4?=
 =?utf-8?B?Wk9pcFQya0JYa0dWZW5DTURVcWl0N0dNL1MyUE5CdGtJcG11V2g2R09QOHlM?=
 =?utf-8?B?WU5ZNW1TNmVkZXdZaU1zVUloUHF5azV2RE92ajVYOVR1VTZZSVliclp1bHlu?=
 =?utf-8?B?aHZ5R2g4Q2RKMWdwWnFuWTFSY296ZWtwcUY1YkxhNkE0YmlZRStkZ3BJTTkz?=
 =?utf-8?B?K3A2L0s1YXpEbmxlY1BUbTdYNXZQQno2SEJEYytZQ3NreGdxSXhEM3JYbm0r?=
 =?utf-8?B?bmtYVUhXOE5EeTVJUEFXOU9Rb01QNDV1MVIvTjZkdVhXOHBtU3VUZ0FoUGhK?=
 =?utf-8?B?S01FR2FBWmdNcm5kNm90VGRoY2pmTkZSTU10MEVBVjh5aGl4OFRkMytuUS9a?=
 =?utf-8?B?eWI0TDlsZVZxcUVhU3lhSmZqUS9QVS95b1ZZN3JlYXpES0ppdVFnYUVMY0xs?=
 =?utf-8?B?dm5VU0lab1VWUnNkZlBGaGZlRVFtdlF2bW9DdUVGZDVkalY3Y0EzS3RsdHYz?=
 =?utf-8?B?emVKMTJhUW1ib2ZET0VLVVNLTWRyTjJPaDFvSS9USU1kc1A1VEY1VWlWTmwv?=
 =?utf-8?B?YUNEaC9BR1Noa3hva005aU84RldscHBQSC9BczBmUkkzTS9SU1hVZWdFMFdQ?=
 =?utf-8?B?ZEo3YkN6eGNQU2lPbTQ1OEt4YmJVd25QYjgyREx2d3FOek1pVWtDemRCZDNz?=
 =?utf-8?B?a0JlVmYvWEV5bXJvc1A3WCtob2dsVjZZQ1d0ZzRDa0JnS2dxZ0JDa256eElK?=
 =?utf-8?B?dlM4emhBZHNwZHJLN3dlUlN4R2xhZFQwL1hsdStNSmR4c3NDNEthWDAwVGhl?=
 =?utf-8?B?Rnh6TC9ONVdEVWphUjNPU2xVMmM3aWdZNDhKZlNlZlI2S0FNaCtKL1pDb25O?=
 =?utf-8?B?ZXduS0RmOXZUbVdlRHljSUFIMkdEQkxYZ3VMaFFNZk9qRmxrUTBUVzVjSEFq?=
 =?utf-8?B?R2RZZW00WHVuMnNDT0t5TndpWldDemNkTEozK0Y3WitXaGo4Q2ErOElBOGp2?=
 =?utf-8?B?VHZzc0hwVjV2aDJ3SVlJNC9yZmcwcFRGSmk1aXlTYytWYndOa0xpaGpqWDRU?=
 =?utf-8?B?WTVLRGc3Z2FaUmpGNWxSUUlwb1ZHM0pKOWk4TnAwOGVzbVY4b2I3WHd4Y1RV?=
 =?utf-8?B?TXBURnBWOXFNNThSNzZqcXBOYmRtMFhYdmtCWU1EdzNrSmZsTmRQVldYNEkw?=
 =?utf-8?B?dWR5VmU1UTRWdml6SzQrN2FvYmdpelBOM21qanhrR0JZTk93STdkSVhJdi9x?=
 =?utf-8?B?dzdNN3VzeXN4U1ZPMlBLN1Y1elRDVyt5RWN6WUFDUmp3Wm1XREtkNlhUMFQx?=
 =?utf-8?B?Zy9OaFJ1b2hHY0JKOXQ4OE96MW0rblVVeGc3eGlnODZLTUFuMnFyczk0NVVE?=
 =?utf-8?B?V2k4aWlXaHV6dkp3b3kza1BSN0lCQ0t0Zm40RlJQdDVWZUZUQXN0dUo5M2g1?=
 =?utf-8?B?WTc4QTVYTkE5VEdsUkRzRGxlZzVlQ0tnSnN2eXppK2l6em9GTUM0REEwMDNw?=
 =?utf-8?B?ZlBDQkJHbTJCb3lVUDdYajZSQzdMKzVVN2FtWVFzem5xbEF0dTBmK3N4emdI?=
 =?utf-8?B?VDArcFoySFNtK2xIdDFVL1lCcWs4clJFWWRFMWVMSGJNK1c4M29sTWV2dEx5?=
 =?utf-8?B?eVFxL1JSRHdCZy9pTDYvNDhrS1FTZHJ1UkNxUllmWmQyMXpQbmgwYk9tdWsx?=
 =?utf-8?B?R0U1WGlONDVIcGdFaEZSZnpqUGRtZlgzOE5KWnQvRkdLcmk2bGNhN3dRdFpq?=
 =?utf-8?B?Z3JmTFpmdWw0ODhjbjRPOGQreGlQblRKSkJxYVM0WnRzejZtN1pqamN0Wk5K?=
 =?utf-8?B?RFg0UnFta0x2YVpyT1ZBY2J4ZUFYTHJQdDdnMTZDcWxpS0g3Rnh6My84MnJ1?=
 =?utf-8?B?VHQwZ05VYThRYm1raE8zMzkzTmsyaHBhZFRiTmxXQk9IRlJDa1pzTytQbllm?=
 =?utf-8?B?MHNBTjlXN2JyL1VCM0lST2tKeklNdnI2WDZ5Zlh1OTRJcHZ4b0VUYUZaL0U5?=
 =?utf-8?B?ZzJ0S0RDVStqYm5pc1MwSnZZNVlIOG8wV1FlalhKWmlrVm5qWGJHbmx4L2Vj?=
 =?utf-8?B?c2ZBU0xmNTJjZUJJNm9IS1NEaFk4UXhXNzl1a1R5QUZHcWZMaWVoOHgzRmVo?=
 =?utf-8?B?WkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4180.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ff670cc-e9ea-4416-433c-08dd6823bceb
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2025 02:54:45.8872 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qVUhNi3XzioXZw9eai9cBfuZfHxbuidZEMax7XBdwzldpQE8s9YpkP8FaKStAWrByXVR1RmiKcV8b/m7W4FIUt5V6HiKt8zYMUrxr77Op6Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5783
Received-SPF: pass client-ip=2a01:111:f403:2011::718;
 envelope-from=steven_lee@aspeedtech.com;
 helo=APC01-TYZ-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: SgD6lq4I2UtS

SGkgQ8OpZHJpYywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBDw6lk
cmljIExlIEdvYXRlciA8Y2xnQGthb2Qub3JnPg0KPiBTZW50OiBUaHVyc2RheSwgTWFyY2ggMjAs
IDIwMjUgMTE6MjkgUE0NCj4gVG86IFN0ZXZlbiBMZWUgPHN0ZXZlbl9sZWVAYXNwZWVkdGVjaC5j
b20+OyBQZXRlciBNYXlkZWxsDQo+IDxwZXRlci5tYXlkZWxsQGxpbmFyby5vcmc+OyBUcm95IExl
ZSA8bGVldHJveUBnbWFpbC5jb20+OyBKYW1pbiBMaW4NCj4gPGphbWluX2xpbkBhc3BlZWR0ZWNo
LmNvbT47IEFuZHJldyBKZWZmZXJ5DQo+IDxhbmRyZXdAY29kZWNvbnN0cnVjdC5jb20uYXU+OyBK
b2VsIFN0YW5sZXkgPGpvZWxAam1zLmlkLmF1Pjsgb3Blbg0KPiBsaXN0OkFTUEVFRCBCTUNzIDxx
ZW11LWFybUBub25nbnUub3JnPjsgb3BlbiBsaXN0OkFsbCBwYXRjaGVzIENDIGhlcmUNCj4gPHFl
bXUtZGV2ZWxAbm9uZ251Lm9yZz4NCj4gQ2M6IFRyb3kgTGVlIDx0cm95X2xlZUBhc3BlZWR0ZWNo
LmNvbT47IGxvbmd6bDJAbGVub3ZvLmNvbTsgWXVubGluIFRhbmcNCj4gPHl1bmxpbi50YW5nQGFz
cGVlZHRlY2guY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDEvMV0gaHcvaW50Yy9hc3BlZWQ6
IEZpeCBJUlEgaGFuZGxlciBtYXNrIGNoZWNrDQo+IA0KPiBIZWxsbyBTdGV2ZW4sDQo+IA0KPiBP
biAzLzIwLzI1IDEwOjI1LCBTdGV2ZW4gTGVlIHdyb3RlOg0KPiA+IFVwZGF0ZWQgdGhlIElSUSBo
YW5kbGVyIG1hc2sgY2hlY2sgdG8gQU5EIHdpdGggc2VsZWN0IHZhcmlhYmxlLg0KPiA+IFRoaXMg
ZW5zdXJlcyB0aGF0IHRoZSBpbnRlcnJ1cHQgc2VydmljZSByb3V0aW5lIGlzIGNvcnJlY3RseSB0
cmlnZ2VyZWQNCj4gPiBmb3IgdGhlIGludGVycnVwdHMgd2l0aGluIHRoZSBzYW1lIGlycSBncm91
cC4NCj4gPg0KPiA+IEZvciBleGFtcGxlLCBib3RoIGBldGgwYCBhbmQgdGhlIGRlYnVnIFVBUlQg
YXJlIGhhbmRsZWQgaW4gYEdJQ0lOVDEzMmAuDQo+ID4gV2l0aG91dCB0aGlzIGZpeCwgdGhlIGRl
YnVnIGNvbnNvbGUgbWF5IGhhbmcgaWYgdGhlIGBldGgwYCBJU1IgaXMgbm90DQo+ID4gaGFuZGxl
ZC4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFN0ZXZlbiBMZWUgPHN0ZXZlbl9sZWVAYXNwZWVk
dGVjaC5jb20+DQo+ID4gQ2hhbmdlLUlkOiBJYzM2MDllYjcyMjE4ZGZkNjhiZTYwNTdkNzhiODk1
M2IxODgyODcwOQ0KPiA+IC0tLQ0KPiANCj4gSSB0aGluayB0aGUgaXNzdWUgd2FzIGludHJvZHVj
ZWQgYnkgdGhlIGluaXRpYWwgY29tbWl0IDoNCj4gDQo+ICAgIGQ4MzFjNWZkODY4MiAoImFzcGVl
ZC9pbnRjOiBBZGQgQVNUMjcwMCBzdXBwb3J0IikNCj4gDQo+IElzIHRoYXQgY29ycmVjdCA/DQo+
IA0KDQpZZXMsIGFuZCB0aGUgaW1wbGVtZW50YXRpb24gaXMgYmFzZWQgb24gY29tbWl0IDM4YmEz
OGQgKGh3L2ludGMvYXNwZWVkOiBBZGQgU3VwcG9ydCBmb3IgQVNUMjcwMCBJTlRDSU8gQ29udHJv
bGxlcikuDQoNCkFkZGl0aW9uYWxseSwgSSBzZW50IGEgcGF0Y2ggc2VyaWVzIGZvciBBU1QyN3gw
IG11bHRpLVNvQyBzdXBwb3J0IG9uIE1hcmNoIDEzdGguIEhvd2V2ZXIsIEkgZm9yZ290IHRvIGFw
cGVuZCB0aGUgdjIgdGFnIHRvIHRoZSBzZXJpZXMuIFNob3VsZCBJIHJlc2VuZCBpdCB3aXRoIHRo
ZSBjb3JyZWN0IHZlcnNpb24gdGFnPw0KDQpQYXRjaHdvcmsgbGluazoNCmh0dHBzOi8vcGF0Y2h3
b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9xZW11LWRldmVsL2xpc3QvP3Nlcmllcz05NDMzNzkNCg0K
VGhhbmtzLA0KU3RldmVuDQoNCj4gUmV2aWV3ZWQtYnk6IEPDqWRyaWMgTGUgR29hdGVyIDxjbGdA
cmVkaGF0LmNvbT4NCj4gDQo+IFRoYW5rcywNCj4gDQo+IEMuDQo+IA0KPiANCj4gPiAgIGh3L2lu
dGMvYXNwZWVkX2ludGMuYyB8IDIgKy0NCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2h3L2ludGMvYXNwZWVk
X2ludGMuYyBiL2h3L2ludGMvYXNwZWVkX2ludGMuYyBpbmRleA0KPiA+IDNmZDQxNzA4NGYuLmYx
N2JmNDM5MjUgMTAwNjQ0DQo+ID4gLS0tIGEvaHcvaW50Yy9hc3BlZWRfaW50Yy5jDQo+ID4gKysr
IGIvaHcvaW50Yy9hc3BlZWRfaW50Yy5jDQo+ID4gQEAgLTExMSw3ICsxMTEsNyBAQCBzdGF0aWMg
dm9pZA0KPiBhc3BlZWRfaW50Y19zZXRfaXJxX2hhbmRsZXIoQXNwZWVkSU5UQ1N0YXRlICpzLA0K
PiA+ICAgICAgIG91dHBpbl9pZHggPSBpbnRjX2lycS0+b3V0cGluX2lkeDsNCj4gPiAgICAgICBp
bnBpbl9pZHggPSBpbnRjX2lycS0+aW5waW5faWR4Ow0KPiA+DQo+ID4gLSAgICBpZiAocy0+bWFz
a1tpbnBpbl9pZHhdIHx8IHMtPnJlZ3Nbc3RhdHVzX3JlZ10pIHsNCj4gPiArICAgIGlmICgocy0+
bWFza1tpbnBpbl9pZHhdICYgc2VsZWN0KSB8fCAocy0+cmVnc1tzdGF0dXNfcmVnXSAmDQo+ID4g
KyBzZWxlY3QpKSB7DQo+ID4gICAgICAgICAgIC8qDQo+ID4gICAgICAgICAgICAqIGEuIG1hc2sg
aXMgbm90IDAgbWVhbnMgaW4gSVNSIG1vZGUNCj4gPiAgICAgICAgICAgICogc291cmNlcyBpbnRl
cnJ1cHQgcm91dGluZSBhcmUgZXhlY3V0aW5nLg0KDQo=
