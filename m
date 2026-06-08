Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 128D9CD8C9D
	for <qemu-arm@archiver.kernel.org>; Mon,  8 Jun 2026 13:28:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wWa1v-000329-OL; Mon, 08 Jun 2026 09:28:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <khushit.shah@nutanix.com>)
 id 1wWa1t-0002v5-Vf
 for qemu-arm@nongnu.org; Mon, 08 Jun 2026 09:28:38 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <khushit.shah@nutanix.com>)
 id 1wWa1r-0001HR-BL
 for qemu-arm@nongnu.org; Mon, 08 Jun 2026 09:28:37 -0400
Received: from pps.filterd (m0127843.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 658B9BaL2497829; Mon, 8 Jun 2026 06:28:15 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com; h=
 cc:content-id:content-transfer-encoding:content-type:date:from
 :in-reply-to:message-id:mime-version:references:subject:to; s=
 proofpoint20171006; bh=YRnLn1Db88ovrjFMATgGW2GlPXaxt5DVuTerzp4Ss
 as=; b=aL7OITMJRqQ8t24f/GFuP7wv8yY7hLmNlg8snUn4O0A/fe0m10AYgRmw1
 5SGcZ2GCS5NPXXzb5e3NGAywfYryvT3pqIc3hhTOV5o4dM/DeZe3S+squ/S8jzlx
 P/J17Z450pHoRLnJi7rUUo8g6/CmUM/QDDICFv2CqFMKKPAE2S3D3nk26BWHmNyx
 GrD4pxcNTlBJvthtPIecgaKP2H1D7ZAjJbpq/8hef2wn5tHNIDhixYBGL29H6rk3
 Xb93yvSvRg/Ux8pZRLBGwGxNgt/NEIIYDO3RM488s5b22JUQOxV6oEFXlcbQfwFY
 OrznxcOdEyc3XL55vXMsAdkmxbWuQ==
Received: from bn1pr04cu002.outbound.protection.outlook.com
 (mail-eastus2azon11020110.outbound.protection.outlook.com [52.101.56.110])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 4emhnfbnfr-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 08 Jun 2026 06:28:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BKIHoPL+JPuvJjQ//Hk5nh3b1w1JnGDWRn5z8kSq8Y5tLKp8hrnAAQ/wnh/TuRqDqNlUmk0eMO/tNkDUXVrRgKIScbaJ8zulE4xqYqFiC1C65tOnx2vbQgMITdzlqr2xo8zUCR0i2TTetysGcV3xh5FxXi7U8DEzx6oeY0Mt+4GcgelkAHuGDdQ6PfYsE6GxwfaPv/M0PgPuwTdYGFYesCGzCn2AQYVqAYeK91irYZ8vljP+Cl9unB/bGzfBPwDtyEp/C+ifG8V7mVKpi5R5m1nrS5b3ehmtZFz2KXk81Q1Byzur1eykQakDu93xatW/JFR+oh57L/agKNmBZkPXbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YRnLn1Db88ovrjFMATgGW2GlPXaxt5DVuTerzp4Ssas=;
 b=s3BTiedsbaq0ffVFpURRiMbHwc8H1Pg+YNwirkdk19/MwqN9ATYbddy0RvH/navFD1Y1edUJtu2ks2cdCYWg7IRIwvneFj4DT6ZovIO91VHoVUYHX5tmDEElYlIkCrLt65+L2FAeKSKz/KdNpC0+ZhF89Ccd0ebliv5osYtSN1vGe2SkSNHuxbifnc/H7nlbNlI7WD/t1v1tUN2FEKbLikfZ8MA+ofDzGmgxB5xO/vTh1MggdnZ1TuAD4y/+MKRP9/ul9/WcZ0GpwFFyI8AAtAPEXkjbX4PmECUGT6Ns/C1/S1/Qgnt0PLPElMFvMl6BBPBuA1R0YsBAoEPsAYPrHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YRnLn1Db88ovrjFMATgGW2GlPXaxt5DVuTerzp4Ssas=;
 b=sup6JWDBUzfxtYfGurEWQeSg9DuaLcptFkVZrFkow+JAUHyzmV4Nwdw9ENmioOjgMs8226WKIKsiRqMRqaHgKbeHcXQUM6OpAmwmMxQwXLkl5igY9Hx8peeOueN20AVh7uSuFw9bHZzqLeM0QK1DQDe/w2SOc40Qi2nga1xVzNWcLEI1MZs7+QhoMZwsmBn4QfolHaVp9eTD26xtqrQPkyvsOLgqRtSPBfSvqEBRGvGy+4fVaYR0QcHxm2ETwNsTf6UaqotplFVZnrMmDIxJKOTo8CpWRwI/sH2UDEZwikSXTjDd0qUCpq1goDUODQksT8nFhcvXJ4yILHnwJBxing==
Received: from SA2PR02MB7564.namprd02.prod.outlook.com (2603:10b6:806:146::23)
 by IA1PR02MB9441.namprd02.prod.outlook.com (2603:10b6:208:3fb::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Mon, 8 Jun 2026
 13:28:14 +0000
Received: from SA2PR02MB7564.namprd02.prod.outlook.com
 ([fe80::1ea5:acb6:ebe1:e1c4]) by SA2PR02MB7564.namprd02.prod.outlook.com
 ([fe80::1ea5:acb6:ebe1:e1c4%6]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 13:28:13 +0000
From: Khushit Shah <khushit.shah@nutanix.com>
To: Marc Zyngier <maz@kernel.org>
CC: "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, "oupton@kernel.org"
 <oupton@kernel.org>, "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>, "peter.maydell@linaro.org"
 <peter.maydell@linaro.org>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>, Shaju Abraham
 <shaju.abraham@nutanix.com>
Subject: Re: [RFC] Exposing arm64 ID-register safe_rules semantics to
 userspace? 
Thread-Topic: [RFC] Exposing arm64 ID-register safe_rules semantics to
 userspace? 
Thread-Index: AQHc9ys4Pfmi3ncHT06ezHa+2K+t47Y0gGsAgAAmgQA=
Date: Mon, 8 Jun 2026 13:28:13 +0000
Message-ID: <E58B3007-0BB1-460F-9225-707FCF811B04@nutanix.com>
References: <B5C9AE36-8181-4A76-905F-3E89B7200215@nutanix.com>
 <86se6xthih.wl-maz@kernel.org>
In-Reply-To: <86se6xthih.wl-maz@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA2PR02MB7564:EE_|IA1PR02MB9441:EE_
x-ms-office365-filtering-correlation-id: 0160ab04-b9b1-44ce-dae7-08dec561ca9c
x-proofpoint-crosstenant: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|22082099003|18002099003|6133799003|38070700021|3023799007|56012099006|4143699003;
x-microsoft-antispam-message-info: SAqOFbDVAAjX+8DBdA0em1RQLopUmgbbDkwqo/4WVRo8unT++zoc2E0aoGEwWRGrXRjIy237PWvV5+7KR5Qf8Cu7DQ6s+eyiKSxHzUvqBR9tVKHxJIs7GUB7SIc51iLjF1NcsxUqkQ6Iz47DrkuX+kehEkGQHG+YrAubUt+Hds3xG5KLeZf6BSFDDcAiRsyaVqvpOqgE+GeX4lhtINKagG7Fc/nNuJDnSv5mRuBRdohplT+0Hx3K0e3zCbT4YLzJl6fb6Qpcm8TMJEG9l/ycThNMAdzBsUz5FvPSUZiKQ304LAo6HPG14rjZGqGBE1bFKcXy8Azs4ddya0Z4yKshZZuD5QVuuY5LYG16jUX70jilNicNmNHtB3PXYocXyrbI76XSJtPQUeSfDFJC/lPs8f2BrOhwBp65iLTkL+afw1fzsLIG733b9u2lZ7L988BATDQgDjoDo259M+pFPed2D/ENrriwvB1jKp4kNO0Y3Im9ZSux0QFCASw6F/bE73YyZTg/j4gtFBSGmsA0pBxbaILmRIK2ltgc+n5DGSJspMlc0gACUeFUNikI1DSZ4cdHWkXQXx0cu6IenWo3vxnMWuYpRj5cE5j2UmpAUOLSlcJymLqftLTMoe8fBwQUPuDvPCS+M/5aNVDQBjjlO5VenfR6UUmAzn6C139HbjsTO67sYuu+t4Sqo54J8vR6mGVtNnRz8s2LAaByZisd/BrVzLbEQrdnawC0sWLUgDfIUu68AsQ8zsI0ai0Ksbnahxxv
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR02MB7564.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(18002099003)(6133799003)(38070700021)(3023799007)(56012099006)(4143699003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NmpVcENUWE1NSmZEZzY0MnFDdkgvNHc2b0F6b1IrSTJVOFdGRHFqeVlHdUVy?=
 =?utf-8?B?K1VGc2RIUHZueEc2cHNDTW96aS9LUkc3ak1FdFROVFY0bGdMZWdxUEg5UWE5?=
 =?utf-8?B?T2NZTG5zNFUyNjArS3QzYzRGT0w2anVIbnlMSEptdHFROW4vUTFER1JIRWZl?=
 =?utf-8?B?UWV6OVBNbDZMaEUxWkI5dm1LNzRmVnRPVUkyc2NWR1B5bWx2UVNnTmF0MmFJ?=
 =?utf-8?B?bnpaWVptZ1B6TGVhblBsRll5c2FMamgrY1ZuazVqZTF4ckRWVVJBcUNDZlJV?=
 =?utf-8?B?emFIYTJQTzlUWXlqYWRYTVR2dVM4aWhQWFFITG5LazlGcWhPOFZTdUx2Q01h?=
 =?utf-8?B?aGFwUndwK3ZaWDN2S0Z3RVVyUGQraVoyRnlMY1JuVXcrSC9BQW9GY05naEhq?=
 =?utf-8?B?ci9sRXlySm9TR2plZFV5S09XRVozSGwxT0c5bWJjdDAveWovdFJiK2JnSXZX?=
 =?utf-8?B?eXhSbEV1V2FYL2xTRkQwOS9HT0xMVUR5d0FVaTN3TnkxRVhBMno2eHI4QWxY?=
 =?utf-8?B?ME16RWhmSlA3dUErSjR1Ky9HVVVQS3RiRUliRFNON1VwTEFPV3ZlVUdtUWFa?=
 =?utf-8?B?K1YzZXE4RDBiY2l3VllySldoa0s4NDlab25xYVFBLzAvSjlVYUhTeHFyS3Ir?=
 =?utf-8?B?c0c2Tkk0cXRpK3VaK2wrVVNkN3NJWWxLRFF1dkgzS28rVXhoMzgxblR5bXow?=
 =?utf-8?B?VnZReUFNRWg2SkRmNGZrM2t3YmluZHNPTk0zRE9vY2NjOEhReHZ1cHdhVUhF?=
 =?utf-8?B?VmxtZDVnTmlaeTlqUlJRRnRndHBXM1V4NDJkZmlvOG84d1FmcVY4WVFBRXpH?=
 =?utf-8?B?NTk0VFgwYVFBQm1iQTB6bzlHeStTSGpjemtNR0dQRXhhKzNiNkx5Vy9uL2xO?=
 =?utf-8?B?UUlKcFEyR284ZHdzU2FsQXJ3dkZBNlFqWjIvLzRtQnZKZUNQUEJRNXNPWG5R?=
 =?utf-8?B?bXp2cTE2TzF1Y1FKclZSbnJobGgrcEpvdk9aK2Z4RU9RVjNwdFBYcExHR1Ra?=
 =?utf-8?B?MyswbTdYTWhlOFRORVNJdlNzV3dQNzZ3RkV1MGd5QjJFUHdSMUJiWlhjdGRp?=
 =?utf-8?B?OU9QSDgwMWQxUkI3Y2xGTGxYOFlqRUtUTXZnT3hBMEYra3Z2YlhOai91WnFy?=
 =?utf-8?B?dHNEdTZvOTRuakRXeEE0M3pnRUFpRnI3VldoS1RSK3hEN3laRG0yN3JZd2Iw?=
 =?utf-8?B?R2l1aGNKdU1KOGhGQ3oxMTNEN0ltaE4wNGtPZnJ5VEltZ1UvZmRvTkVTTlhV?=
 =?utf-8?B?WFJRWmVMRkxFSjdZNXYzZ3ZFUkdhdTEySzgxS0RHSWpWdjEzcXhZN1hsOHFa?=
 =?utf-8?B?VXhkVkRxU2VYLzN3RmgrWGM3UUhRbmhTMyt0TDlGU1grelgzWENmYStrbjZK?=
 =?utf-8?B?dktqeE9iM05ndENMSWpqY1VWZklJWFJMOEl0T1pvVEV0QngvSDhTRE1HSG1y?=
 =?utf-8?B?TVJYWTV6ZmNRUEZGRGFHbmVUVWpNcG4vb0Njb2NvSFRhcFBQcVFiKytmRHd5?=
 =?utf-8?B?VVpvYW9qZmxkd2xDdlFhQjhhQm94aXM1NWpzOGYyd2Y4L0xBaEorSzdsN3Nq?=
 =?utf-8?B?QTNDQ3JhWmdtQzFtYWVLVlQ2cTZkV2xlZkFaOFVnUjZVVzVDV0tNdXhrWmQx?=
 =?utf-8?B?RHdsN0JURHpaTllPcmZteTZQVmRYV05sdStOK2FkVkRud0syMFhZWlMwRGpG?=
 =?utf-8?B?Yll3bnNpbzBWNGpxOThHRnNieE5ZQStqOThwUkNsOE9HeDhDNjhEbi95am4w?=
 =?utf-8?B?VU9ubW9mRHJ2RU5ST1ArTEprUmxJOVVKSnVKcEVScmR3T0VYbXViT00vQWFE?=
 =?utf-8?B?Q3B4dHFHU1l3cDYxU29PaHVBN09VdlpHS09uZ3ZXMmdZbUM0VkhYL3prbnlk?=
 =?utf-8?B?R2VZREhPbVh3eVRyNkJ6R2JheFFzcHpsNkNvUm95aUZIT2Rra3hsMVVlK2VB?=
 =?utf-8?B?bHVjNGVSb21SUExnRi80L2s4cFBXL0w0cEFYVW55T0ZGdXRhT0tJdW1qYmxN?=
 =?utf-8?B?Z1JyUCtsbC9ZV3N2WHZrY2hTNjJZamc2a21CZ0xVbVRQeU9Bd09uRk11Yk04?=
 =?utf-8?B?ejEwWFNpWG8wVGFjeHVkb25Ya3V6VWVlcVZqRkZzTFRtaWNTaVhmc1FGTGZJ?=
 =?utf-8?B?SHk2WXNZMllXL0IyK0p3cjhxRERBQUpqMEl6TTVIbU1laUlpbDd1UW9GbDd2?=
 =?utf-8?B?Rm9uSTY4MUJYdUVsZGU4c3AxVHNyUndKdVhVb2VnOFNnM0twbDkvYTExWTY1?=
 =?utf-8?B?dVErNHhORklEU2VNQ0k3Q3k4K3V3SnlRblJRUFVBVDVVdlpwTkRxQ1lMN2tP?=
 =?utf-8?B?VTlJaVAyaDNLdml5MUJjTG83a3hqQUNKQmkybytabHBSa3VGcTc2Unljdyta?=
 =?utf-8?Q?/LA4EDtZVjW2J/TY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <10CB98971E465841BE05ADBA2CFB7F37@namprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: LkDTDvkxUE8GAUij0bqjD2+bXkKyAWLvoSUy2901lqnK2C4QrZPN41bqn4UARovUBK70L3meaMskYSUoUne4mYRGJ8mkDVdktuhq0QOfb1rC2LpoPgYez9XsQCrlSE1mxGJcqMSsJzCIU0Up2XUPTB9oDz9iV6gXwJxi8vrEFSf0Xnc6/bx0HAx4M/SR+GS+6v2ygQmPM96Io9Y/lUOoBhawW9+7Ar47NsiBPTJwXj61OYK7ESySWx2dlksWJUDC1qAJYn0Zjeq195MmTTAbbBPwvhThP259OWDOlVA1QxV8I302342l6dYWGFLLhvwEWAE2pM7EjuEZxwaFPEObXg==
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR02MB7564.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0160ab04-b9b1-44ce-dae7-08dec561ca9c
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2026 13:28:13.4927 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ULSJz4ATlHOCZ9F90D7+/qETPDSe7hQ00Fs3pWAeOKSUAmGCb/L8yG5uG3UMaz7W5gKLCaOZLpKqgiYsxrWqTQfgoU/yH9YGxlj1+K84DXc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR02MB9441
X-Authority-Analysis: v=2.4 cv=WOpPmHsR c=1 sm=1 tr=0 ts=6a26c36f cx=c_pps
 a=HmZmHFuEDL3wSU7VNlSPig==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=0kUYKlekyDsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VofLwUrZ8Iiv6rRUPXIb:22 a=dEe9Ve2bX-KnNSUMM2s9:22 a=VwQbUJbxAAAA:8
 a=64Cc0HZtAAAA:8 a=b319lBVi93aIXSau-cQA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: RKJ7aFIIin56-3pPzGWzQV6LYk9pWxQs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEyNyBTYWx0ZWRfX0O8DEHSG5njg
 7HMoMWt3VB8tW2vqCvgigNxwgllpG7KR+e82Q51MhGhIkutx21xEt86CrOjlAQOOGpPFCdcmEtZ
 KJlCfhTmVEP+5M3+A6P+V7PiCjvlUMgK/cEwiGBSZebwyB0SQlC2f8WapH0Hxl9s09ESji8w3oR
 OgufTHTICUkm2+4WxKOF3RTwd7/UkuvFE2vq5ZysMNWPITYDx/bHM696SenHlgegZTojT2YXSp9
 5J6p+pa5rka3UYbOaDKfA/P9V9Sxv1xBeKwgirfF97A6MQXbZwFlD/akDa0t/DwvVSFsdn12G9J
 TGIsOipcO7StM5MXrcL/dGKIuESJ1ACfyRAkcEBHs/t6HlCObF5JZHCFegzU0BdtNo34XLsOqWN
 s3V4PHH37iAriD5qG6IPhEzBJtRPLDOeJHzAHiSGH+XHo5FZ/TEFBVH4Dl+ZYDHvwgonuxDybx2
 Wstl0bnzmVuxsS9nK/A==
X-Proofpoint-GUID: RKJ7aFIIin56-3pPzGWzQV6LYk9pWxQs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=khushit.shah@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

DQoNCj4gT24gOCBKdW4gMjAyNiwgYXQgNDo0MOKAr1BNLCBNYXJjIFp5bmdpZXIgPG1hekBrZXJu
ZWwub3JnPiB3cm90ZToNCj4gDQo+IE9uIE1vbiwgMDggSnVuIDIwMjYgMTA6NDM6MTEgKzAxMDAs
DQo+IEtodXNoaXQgU2hhaCA8a2h1c2hpdC5zaGFoQG51dGFuaXguY29tPiB3cm90ZToNCj4+IA0K
Pj4gSGkgYWxsLA0KPj4gDQo+PiBPbiBLVk1fU0VUX09ORV9SRUcgZm9yIElEIHJlZ2lzdGVycywg
S1ZNIHZhbGlkYXRlcyB0aGUgcmVxdWVzdGVkDQo+PiBmaWVsZCB2YWx1ZXMgYWdhaW5zdCB0aGUg
aG9zdCdzIHZhbHVlcyB1c2luZyB0aGUgcGVyLWZpZWxkIHJ1bGVzDQo+PiBpbiBhcm02NF9mdHJf
Yml0c1tdKGFyY2gvYXJtNjQva2VybmVsL2NwdWZlYXR1cmUuYykgKGFuZCwgc29tZQ0KPj4gS1ZN
IHNwZWNpZmljIG92ZXJyaWRlcyBvbiB0b3ApOw0KPj4gDQo+PiBJbiBvdXIgUUVNVSBSRkMgZm9y
IG5hbWVkIEFSTSBDUFUgbW9kZWxzIFsxXSwgd2UgdXNlIHRoZSBzYWZlX3J1bGVzIHRvOg0KPj4g
LSBwcmUtdmFsaWRhdGUgYSBndWVzdCBJRCByZWdpc3RlciBjb25maWd1cmF0aW9uIGJlZm9yZSBL
Vk0gd3JpdGUgYmFjaywNCj4gDQo+IFByZS12YWxpZGF0ZSAqaG93Kj8NCj4gDQo+PiAtIHJlcG9y
dCBibG9ja2VycyBpbiBRTVAgcXVlcnktY3B1LWRlZmluaXRpb25zIGZvciBhIGdpdmVuIG5hbWVk
DQo+PiBtb2RlbCwNCj4gDQo+IFNvcnJ5LCBidXQgSSBoYXZlIG5vIGlkZWEgd2hhdCB0aGlzIGlz
Lg0KDQpTb3JyeSwgUUVNVSBqYXJnb24uIA0KV2UgY2hlY2sgdGhhdCB0aGUgdmFsdWUgbmFtZWQg
bW9kZWwgcmVxdWVzdCBmcm9tIEtWTSBpcyB2YWxpZCBhbmQgaWYgbm90LA0Kd2hhdCBpcyBibG9j
a2luZyBmcm9tIGEgbW9kZWwgdG8gYmUgcmVhbGl6YWJsZSwgZm9yIGV4YW1wbGUgYSBtb2RlbA0K
bWF5IG5vdCBiZSByZWFsaXphYmxlIG9uIGEgaG9zdCBiZWNhdXNlIFNWRSBpcyBub3QgYXZhaWxh
YmxlLg0KDQo+IA0KPj4gLSBlbnVtZXJhdGUgc3VwcG9ydGVkIHZhbHVlcyBwZXIgZmllbGQgZm9y
IFFNUC9saWJ2aXJ0L3VwcGVyIGxheWVycy4NCj4+IA0KPj4gUkZDIGhhcyBhIGhhbmQtbWFpbnRh
aW5lZCBjb3B5IG9mIHNhZmVfcnVsZXMgaW4gUUVNVSB0aGF0IG1pcnJvcnMNCj4+IHRoZSBrZXJu
ZWwuDQo+PiANCj4+IEFueSBhZHZpY2UgZm9yIFZNTXMgb24gaG93IHRvIHRyYWNrIHRoZSBzYWZl
X3J1bGVzIHVzZWQgYnkgS1ZNIHRvDQo+PiB2YWxpZGF0ZSBJRC1yZWdpc3RlciBmaWVsZCB2YWx1
ZXMgd3JpdHRlbiBieSB1c2Vyc3BhY2U/DQo+IA0KPiBXaHkgc2hvdWxkIHRoZSBWTU0gY2FyZT8g
RWl0aGVyIGEgZmllbGQgaXMgZXhwb3NlZCBhcyB3cml0YWJsZSwgYW5kIGluDQo+IGdlbmVyYWwg
aXQgaXMgc2FmZSB0byBleHBvc2Ugc29tZXRoaW5nICJsb3dlciIgdGhhbiB0aGUgaG9zdCB2YWx1
ZSB0bw0KPiB0aGUgZ3Vlc3QsIG9yIGl0IGlzbid0LCBhbmQgb25seSB0aGF0IHBhcnRpY3VsYXIg
dmFsdWUgaXMgcG9zc2libGUuDQo+IA0KPiBUaGVyZSBpcyBhIGZldyBleGNlcHRpb25zIHRvIHRo
aXMgcnVsZSwgYnV0IEkgZXhwZWN0IHRoaXMgdG8gYmUgdGhlDQo+IG1pbm9yaXR5Lg0KPiANCj4+
IA0KPj4gVGhlcmUgaXMgbm8gQVBJIHRoYXQgZXhwb3NlcyB0aG9zZSBydWxlcyB0byBWTU1zLiBV
bnRpbCBhIFZNTSBpc3N1ZXMNCj4+IEtWTV9TRVRfT05FX1JFRywgaXQgY2Fubm90IGtub3cgd2hl
dGhlciB0aGUgcmVxdWVzdGVkIHNldCBvZiB2YWx1ZXMNCj4+IHdpbGwgYmUgYWNjZXB0ZWQuIE9u
IGZhaWx1cmUsIFZNTSBzdGlsbCBjYW5ub3Qga25vdyB0aGUgZmF1bHRpbmcgZmllbGQuDQo+PiAN
Cj4+IFdlJ2QgbGlrZSB0byBrbm93IHdoYXQgdGhlIHJpZ2h0IGFwcHJvYWNoIGlzOg0KPj4gLSBT
aG91bGQgdGhlcmUgYmUgYSBLVk0gaW9jdGwgdGhhdCBleHBvc2VzIHRoZSBzYWZlX3J1bGVzIHRv
DQo+PiB1c2Vyc3BhY2U/DQo+PiBNYXliZSBTb21ldGhpbmcgbGlrZSBLVk1fR0VUX1NBRkVfUlVM
RSAodGhhdCB0YWtlcyByZWdfaWR4IGFuZA0KPj4gc3RhcnRfYml0X3BvcykNCj4+IG9yIGEgYnVs
ayBpb2N0bCBsaWtlIEtWTV9HRVRfUkVHX1NBRkVfUlVMRVMgKHRoYXQgcmV0dXJucyAocmVnX2lk
eCwNCj4+IHN0YXJ0X2JpdCwgd2lkdGgsIHNhZmVfcnVsZSwgc2FmZV92YWxzKSBmb3IgYWxsIHRo
ZSBJRCByZWdpc3RlcnM/DQo+PiAtIElzIGl0IGFjY2VwdGFibGUgdG8ga2VlcCBtaXJyb3Jpbmcg
ZnRyX2JpdHNbXSBpbiB1c2Vyc3BhY2U/DQo+PiAtIE9yIGlzIHRoaXMgc2ltcGx5IG5vdCBtZWFu
dCB0byBiZSBleHBvc2VkIHRvIHVzZXJzcGFjZSBWTU1zPw0KPiANCj4gTXkgcXVlc3Rpb24gYWJv
dmUgc3RpbGwgc3RhbmRzOiB3aHkgaXNuJ3Qga25vd2luZyB0aGF0IGEgZmllbGQgaXMNCj4gd3Jp
dGFibGUgb3Igbm90LCB0b2dldGhlciB3aXRoIHRoZSBtYXggdmFsdWUgb2YgdGhhdCBmaWVsZCwg
ZW5vdWdoIHRvDQo+IGRlY2lkZSB3aGF0IGlzIHBvc3NpYmxlIHRvIGJlIHNldCBmb3IgdGhhdCBm
aWVsZD8NCg0KT2theSwgbWFrZXMgc2Vuc2UsIHRoZXJlIGFyZSA1NyBmaWVsZHMgaW4gY3B1ZmVh
dHVyZXMuYyB0aGF0IGFyZSBub3QNCnVuc2lnbmVkIEZUUl9MT1dFUl9TQUZFLiANCg0KUmlnaHQg
bm93LCBvbmx5IDIxIG9mIHRob3NlIGFyZSB3cml0YWJsZS4gOCBvZiB0aG9zZSBhcmUgc2luZ2xl
IGJpdCwNCndpdGggRlRSX0VYQUNUIGFuZCBzYWZlX3ZhbHVlIGFzIDAsIHNvIG5vIHNwZWNpYWwg
Y2FzZSBmb3IgdGhlbS4NCg0KU28sIG9ubHkgc3BlY2lhbCBoYW5kbGluZyBmb3IgMTMgZmllbGRz
IGFyZSBuZWVkZWQgZm9yIG5vdzoNCg0KRVhBQ1Q6IDQgKFRHUkFOKl8yLCBMMUlwKQ0KU0lHTkVE
X0xPV0VSX1NBRkU6IDcgKFRHUkFONCwgVEdSQU42NCwgSW5uZXJTaHIsIE91dGVyU2hyLCBEb3Vi
bGVMb2NrLCBQTVVWZXIsIFBlcmZNb24pDQpISUdIRVJfU0FGRTogMiAoU3BlY1NFSSkNCg0KSGFy
ZGNvZGluZyB0aGVzZSAxMyB3b3JrcyBmb3IgdG9kYXnigJlzIGtlcm5lbC4gQnV0IHdoZW4gbmV3
IGZpZWxkcyBhcmUgbWFkZQ0Kd3JpdGFibGUgb3IgYXJlIGFkZGVkIHRvIGZ0cl9iaXRzLCBvbGRl
ciBWTU0gd2lsbCBieSBkZWZhdWx0IG1ha2UgYXNzdW1wdGlvbg0Kb2YgdGhlbSBhcyBMT1dFUl9T
QUZFLCB3aGljaCBtaWdodCBiZSB3cm9uZy4NCg0KPiBUaGFua3MsDQo+IA0KPiBNLg0KPiANCj4g
LS0gDQo+IFdpdGhvdXQgZGV2aWF0aW9uIGZyb20gdGhlIG5vcm0sIHByb2dyZXNzIGlzIG5vdCBw
b3NzaWJsZS4NCg0KVGhhbmtzLA0KS2h1c2hpdA0KDQoNCg==

