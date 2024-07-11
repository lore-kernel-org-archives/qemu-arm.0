Received: by 2002:a17:504:1dd4:b0:1be9:327d:8ee3 with SMTP id b20csp31492nji;
        Thu, 11 Jul 2024 01:53:59 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCWVKIEwpHPF0nAc45AJ4CUqw4yWX3UzNNUnWIfFv92IEHznNqRSNsRP/Sr6N8jBz9sBUlwCa6u9cpYTa2NLXD56qLyvSacU
X-Google-Smtp-Source: AGHT+IGrYqI4v4vLkgA/QN+WXHX2lLvJmCsK9DAfePdNH/4Z2DNbwWDq5BqrWOJ4rsS1nWt0GwkD
X-Received: by 2002:a05:6122:3670:b0:4ef:678e:8a90 with SMTP id 71dfb90a1353d-4f33f18e8a3mr7871123e0c.3.1720688038747;
        Thu, 11 Jul 2024 01:53:58 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1720688038; cv=pass;
        d=google.com; s=arc-20160816;
        b=UCDPXfgBw8xEWeMp/UAW7RyL8f5LnROggHZuXkiQE5VA1P2PbgWEW7riNZTTl54t98
         l1k+IAxVcj+xFP0ArXijZmK4WEbIKiUfnj9v4Y7guSDLgdO1Lmei/TK1LhLMK8dyyuaQ
         XkKnW8AqIojcR0WUtj2rpWXnxAjyXRG8GiCR2WD9UgFml1XboYM/heibrUStRwzS8r74
         1pry/RnMWXclo7585VUGsxgh7xJNM5d4kh1qFHbc8kCUGHQ6ErFsDcwPt2JF/vUpaWZC
         HMUGZ4Fi5gqEu9zbc6PgY+vQfPln/k0ld47cJYk8swf+LjF99AfsGikJSJWohTWuTIn3
         5zBw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:date:message-id:dkim-signature;
        bh=SjMXH9CJuRlvchjDp+1egeDD+vex8DQ+5n17sq7g88Y=;
        fh=zg+tSE9ouKREXMNblpkMALLAOBml+yZjIDb8gyn/b9Q=;
        b=kP+7eOEcIH7EauQnMH27R+futkOblMhsTzjNPovYSRPGkRxVX6HptWw2f8fzE/KvRN
         h2o+mLso3HVnsP06bh296IcqwNE/OGRS0npYcjevSyEPtSVESYkv2e2nO8vuBKF+DBF5
         o9dR39c3vrhcgHB48wpEpKxeIFqGbQmCOmMYaJWXpfK+NG81aJgaf5JAR5aSVW3IIRqT
         x+t/SGtpap/PNhuX5CyKV4RB5KhVqefFyAzgQ1bgYJq+tFFhytsFW0SVSvKTuJfixv/3
         cnpybBMGPWxOE2Ij1WgBDji9RpRn8OUwSWgLUB2DiJyd2uyaRATrsIlBbtY37HKAJZEH
         J+CA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@os.amperecomputing.com header.s=selector2 header.b="N/PEYe5g";
       arc=pass (i=1 spf=pass spfdomain=os.amperecomputing.com dkim=pass dkdomain=os.amperecomputing.com dmarc=pass fromdomain=os.amperecomputing.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amperecomputing.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79f19010157si754559285a.104.2024.07.11.01.53.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Jul 2024 01:53:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@os.amperecomputing.com header.s=selector2 header.b="N/PEYe5g";
       arc=pass (i=1 spf=pass spfdomain=os.amperecomputing.com dkim=pass dkdomain=os.amperecomputing.com dmarc=pass fromdomain=os.amperecomputing.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amperecomputing.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sRpYc-0004qJ-EX; Thu, 11 Jul 2024 04:53:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gankulkarni@os.amperecomputing.com>)
 id 1sRpYb-0004km-3U; Thu, 11 Jul 2024 04:53:41 -0400
Received: from mail-eastus2azlp170100000.outbound.protection.outlook.com
 ([2a01:111:f403:c110::] helo=BN1PR04CU002.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gankulkarni@os.amperecomputing.com>)
 id 1sRpYV-0004lt-GF; Thu, 11 Jul 2024 04:53:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W2H19JDl0DKTvkksaUFKCXCNS1MSihJOX8WOXMP+wJT+pUG2OFL2V+Jxkgn6gf1BznwREeiJuJbrdzrHheI6dWAgZdv03IGFPbF5+hxshmOWAO1/K1tNDXO6PFRq40EJg7yE3gcN9HB1wxG1swEMkp/2HbYqhOeyPfUR30sD+16z9Zb/Qyf2ccgErBBD2tSUljHpNWBiM9+dNT+W3R1nj5LQ55DT692bj8XgZzMgk4RPPu3qPnWRkxTXR7gHCpyuzAzBJSwcZSKdXwhZvjs88o2D/9ioysBpr2NeNvP6zDu9ExrZnsc5UUG3hQ/pqDcTRDTplgJSeY/GsvHH2FrQ4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SjMXH9CJuRlvchjDp+1egeDD+vex8DQ+5n17sq7g88Y=;
 b=WjtvYHHB1XxiTxG4gQOlf+DWhJ/RoGysSB9DGm1/qNFKrO1I0QnoM93NuvIHWIBnrvFdPA0x6BlKE0O6fKD7s55/bw2sjIvJLVi0Oq0t13jZIago1+11H5ZawAw5L3B5Oxt6H+U8DAL3qzWvmtWs8NQ7SID/1i0HpnAPq9XNudWPNQZbZda39b9Ds4uH1vnaOa1aOrB9UjGVfkt02ZQIrEdoLW/2rJ+8hFmU4h5FjAygVNyh9P1/GDwvazhs3wxKjyhsiieJ4hU8W8J2g691m9cUKsfuRPwvktMJEmxdnAoDrvAEEcTwyQKm5ZGnx0kwV/V3W1ifqZ7DFiCFDBUsVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SjMXH9CJuRlvchjDp+1egeDD+vex8DQ+5n17sq7g88Y=;
 b=N/PEYe5gXw9Bn+IlcOFvb6Sc8Aa+eqaVDHX4IwpHMfrB8Xg9sT5l0JlydQxhRWdM5y4qEt1ZqHkJ8MFxV1S3yuqUEftAZmq9llOMwpUhClaXZV/ngbs5Kvmqm6+xwWjEcZHQ/KgvtIUYnLmUAccnLBkn9i1SW0e+fZWg8uoisyI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ2PR01MB8101.prod.exchangelabs.com (2603:10b6:a03:4f6::10) by
 CH3PR01MB8686.prod.exchangelabs.com (2603:10b6:610:20b::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7741.36; Thu, 11 Jul 2024 08:53:30 +0000
Received: from SJ2PR01MB8101.prod.exchangelabs.com
 ([fe80::292:6d9c:eb9a:95c9]) by SJ2PR01MB8101.prod.exchangelabs.com
 ([fe80::292:6d9c:eb9a:95c9%3]) with mapi id 15.20.7741.033; Thu, 11 Jul 2024
 08:53:29 +0000
Message-ID: <35a4749c-775b-40c2-b1e7-3bb554cf41d4@os.amperecomputing.com>
Date: Thu, 11 Jul 2024 14:23:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm/kvm: add support for MTE
To: Cornelia Huck <cohuck@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 darren@os.amperecomputing.com
References: <20240709060448.251881-1-gankulkarni@os.amperecomputing.com>
 <875xtdcky2.fsf@redhat.com>
Content-Language: en-US
From: Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>
In-Reply-To: <875xtdcky2.fsf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXPR01CA0117.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::35) To SJ2PR01MB8101.prod.exchangelabs.com
 (2603:10b6:a03:4f6::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR01MB8101:EE_|CH3PR01MB8686:EE_
X-MS-Office365-Filtering-Correlation-Id: 85a6e7ea-b3d4-4736-aa2a-08dca186ef29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NHExdUxoeDNLWTlOKy9QNW9aRXh1bXQyd29aTlJGbHZ1KzZPd0REbDY3MnU5?=
 =?utf-8?B?SlBwcXNqY0JGdlc4MmNiUVMrQ2sxSmJTdFZ1YTJEZWs5N0VqSHBkQ0dsbjJD?=
 =?utf-8?B?b2JiVVg1a1FiLzdXZk1EdDRjSjdYN1VOOGt4VjduQ04rWllJaWVCR3hNRUpy?=
 =?utf-8?B?a2cwSnQwMnFYZnNvakl3ek9ESEVDQjRhbW5BMVV4akpuM1NEYkVEdnlJalRB?=
 =?utf-8?B?SUEwZ2xGSUowS0MwMmRhTGUzNFFmb1M0Tm5WRlRmMzl3K28yUkVxcW5SdHZL?=
 =?utf-8?B?dlpqSFMxd2hWSFpXQ01uRGNtdXJIWmhwTHcrdWJaSEdLckJKSURoK053QWdl?=
 =?utf-8?B?RW1oOFBqYjhMVlV6VHhKSHQ1TEplTjhCSWhPSGxRVy9qbDcwNlVZTjVEb1hH?=
 =?utf-8?B?b1B4TTdZQmxrNmc0OEFjM3NPaGlrcEN3ZWl4ZlJPQjJOVEptVWhrVHVNdjVu?=
 =?utf-8?B?UTgvWk5Pam5lY0xTczgxbytKWURCWUdnaGs3b2ZzWmtCTG8xNHBXQithS2xp?=
 =?utf-8?B?WFk3OWc1Nkt4ZlZ6bTdQZXpNYUQ2VXl6aFR3bmxsT3pKdXhGTWhlY0tPZ2dX?=
 =?utf-8?B?bDBqbTh5WUlkaE9SbEtQTEI0bTBOWUI1TDY1UHhmUjFKVnpzMElnZmdWUnFv?=
 =?utf-8?B?VmNTMllXQjdVOWsxVmNKS3g5cE9ZaDEyV3RKWXhjeWorbU96M1FHWGh6aWtY?=
 =?utf-8?B?bGU5d0RSMXR5UDFFbEllbWk1R3hKb2ptbVBHV0Zwb2hhNmFYMVdNVTNMR3Jl?=
 =?utf-8?B?SUZuMzJTemR3Z0dWbHpDOUx2S2tBNllXQUpqcWxOVUl1d2hGaXlqYU5HV0RP?=
 =?utf-8?B?cEZySDFtdm50QklGZlp0OGNDdzRaTFMvaDdMOStXaDFUWDdsWElYRjlmK0FD?=
 =?utf-8?B?NCs2b0dGOWhHb1k2M0p4Z0kxS2lkNFJBSis2U29lekkyVC9OMHBWRGlCcERn?=
 =?utf-8?B?cHAyamoxb0Ftc3lDUm1LTUtsTXFkdklSa3F3djB0blBoNjhkYWIrSFpFYUlI?=
 =?utf-8?B?eFd6dit3TlkwOUNXRi9IS0xnSms3TkpMVFJQY3FmWXg2cUxSU0d0YTNiSGlk?=
 =?utf-8?B?NDNSNmcvSDNqQ1RxT1NvZWJNL2RpTk9hMUNYcHBkb1VLV0tQYm15VXY3d2NI?=
 =?utf-8?B?WWpqNEFvM3JOWmVnZXlrUTBGeDU4OXZ6dm9DN2l0MWp1YXV2c3JDNW9LUEg4?=
 =?utf-8?B?d1cxUGVnc2l3SmtFQURWbTZIUUlYQjRvaEtObFh3S3dERm1YbHRVOWxuYUZF?=
 =?utf-8?B?aTBhblhIcmFBM0tpOUtQVUNLR0NERTFMQm9UVU8zNDVUUmNTWEpuOFR5NFMw?=
 =?utf-8?B?T2F2ZzMxc2pRV3o5VC9oUjJNYTNMNlVPck9mZHV6Yy9VNVhLd0FqMkVSZ2ZP?=
 =?utf-8?B?bk9nRUtNRzMzR2lPRndDK05Rem0yaGtrYnp4QVBOMjFDb0l6MmE4Wkp0RFA4?=
 =?utf-8?B?SHkyeWVUY05WSm4rbjN5cm02dUZOTDVld0phQUs3eTRlcUtjUmkyWEdEMkVC?=
 =?utf-8?B?ZGxWc3l2aGtmWVd2cy9MTjFzc2FBMUk5V25rYVdqVnYxYnlBMHhvekJ6Sjdr?=
 =?utf-8?B?NjB3QUdpclRVVHBBa3g4bVQ2ZlVhdW1pazZuMUNiTFRDMEQ3MlJ5dzlTcVIr?=
 =?utf-8?B?YWtqbjR0WUpPZmExKzFId0kyUnpKUW1ET0F5U0c2cHA0T3BEeXIzL1hPd3Y3?=
 =?utf-8?B?TGM0SlNjTDRQQkJrU29DK0xpNmNKeTM0Z0JsaFlVeEdBeUoyS0dUd3BYSUZX?=
 =?utf-8?B?bnFlcWZxdzVtSzVmRUh6VXZLSnhzY2tWclNUcFFvVkRsbFBiRWRsQWFtdWxV?=
 =?utf-8?B?RFVaeldVVWlaSnJHa3pWUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR01MB8101.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MXlIenZUR1Z2aU5LKzdaRUtLRk5RaG80Wk00L0dHV1FmVllBdzhpSllKYXRO?=
 =?utf-8?B?QzNuWVE1aHpVVzNoSDY4dlVVUU1KaWYxTUFiUThXb1VGdDhWS0NSWGdxQzRK?=
 =?utf-8?B?ZEZoRG9wcm9aYjZGTlNJVDVkVWJpVmZHdVdPRjY5N0tSNWRLYUtscnpvN20z?=
 =?utf-8?B?aGxtOXNkWnhpQ0RmZzNxQmpWQ1BrYUdnRm9zNG9PTU43UkM5VDNtQndGZHZ3?=
 =?utf-8?B?N3lPT2NWcFhWanBUQU5UQUk0a1pxYXRwL3BOZHlhZGRhZkprZTROM2w0eElL?=
 =?utf-8?B?U0VHL25ha0ZvMUxBdmlMSDFGbno1TnU0WXR1a3hua1RySlVWcEFTaWU1T1Zi?=
 =?utf-8?B?V1NIWjAyQmlQRHJKQ3NKdE1mQXZBOG5JS3dWVW1oWUVQYk1PZHRDSU5qVDlY?=
 =?utf-8?B?R2dHcDlaVm84Y2xmWHp5SENEakgramY5a1hkOUQvTzNRNklaWDE2UlljclJB?=
 =?utf-8?B?RHNjVGxOWThuZ1R2dG02N3R5eVA5Vkt3czEzcHBCL1BERjZ2UnhDQUF2Zjk4?=
 =?utf-8?B?WGNDbnBpTjdYMHBNcXQvQ2hNVlhkNUhJVk9FdzRyK3ZEVjcvdjJPU3h6QzFs?=
 =?utf-8?B?RnVORko3NUJYTTQxbndsc282ZUt4QVZtZ2M4ajh1aGpEVFVBVzkxT3dQVTFk?=
 =?utf-8?B?U3BJQkowTFVCY2xUT0I4ek4yRVlqOUd4N1FOejcrMFdFRFMrMllGaUxOMmxw?=
 =?utf-8?B?dTZkc3BMZEU2T0c1UURWTGdHTGEzc0RYQkNCVGYrR013RHFTWS9Xc3J2eWVI?=
 =?utf-8?B?aUlxb2xoK0NvRGIwcmY4SThYNzh3ZHRjckpqY2xYQ251eHgwWnhlQ2dycUI1?=
 =?utf-8?B?LzN4SGZ2Q2Q3bVNsYVVzaUdqWCtDZ3Q0SFVURWN4ME5tSk9FNFRsd2NETDVC?=
 =?utf-8?B?Q2dHeDBPVDFqbFhDYng5VWRhTlhSNWFHc3FkTkhJWGhBS0tnaHgvT01GYkJv?=
 =?utf-8?B?THFSWlMvbGJtZDFMdE1UQm50aEhTTklPSHpjeVpValVsNDI2dm1VU0NtZkt3?=
 =?utf-8?B?UjJSQ2psTXJtS3h6aHVvY1kxRVRmcHRVcHpTZVhablNzbHZnaHUzNHprQmQ0?=
 =?utf-8?B?bWRoZDdqMTRFWkxMQitEV0tvRzZaRDJvZExiUzJyMkIxT2Zua211R3BycU9B?=
 =?utf-8?B?NVM2OC9yUnNQeVVGRDFvL2wyZk5QU1IrMkU5SWI1WXNweVc1alJnSzdNYTJz?=
 =?utf-8?B?WE9nZVlnWUtjYjhvVG5mTDRmRlR1aDY1NkErQVhvTHhud3cwVDZ3bTJZWUtG?=
 =?utf-8?B?QkNrUVRRRldyTEovVUN1OHNuQXVuVkRPODd1MUxZOWtrZUM4cFV3MStPQ2da?=
 =?utf-8?B?R2JSSFpleS9zLzhFWk4yV0VUV1Y3eEJKRHB2MTNHQnpjNlI4ZUtRMDNlWVBz?=
 =?utf-8?B?L2NRZjhoSWlJTnh5VUZsVkVIb1pORTlqcEdBMEN6UW1WZmRtSFlnYkN2cjZh?=
 =?utf-8?B?WmV4c0ZJN0NTQWRQMWJoOXhqQWNVQWhKSHZpY3JQR21NUkphUDF1ejkvVGlL?=
 =?utf-8?B?UUhRaHJ3NWtKVUhIR254MVpwWEIzbWxpVDBTOUw1OUE3R3oyVGpqSjlzZGNY?=
 =?utf-8?B?SjJCRkN1MWhhaWVWQllESktYV3FtV1Y4bXR3ZTNPcDl4Z1FKRU1EeWUxZVJx?=
 =?utf-8?B?bFNYYnN6YlU3akt5WFhjQ0JxUXJ1TXRzWlRhcUhxd2FDL1A5OWNCMDZ6V3VK?=
 =?utf-8?B?YytqVTFwdTFzcVNncW1CMmliYmZhTktKNG9pMXVBSkxsenVqa01YUzhlcnZ3?=
 =?utf-8?B?Um8vSUhKeVYrOWpxdlhyM1BaVkFSWWVsbEdJZGhjTVlHb1F1bkFISDNTcjNM?=
 =?utf-8?B?SEd3a2ZjS3RmVFI0RDEwVnBXcFg4MUNLbGYyQm1wclUvQytOZmVTaXdqczNy?=
 =?utf-8?B?elA0OTd3Yk9iTFFaVjdOamZ2WHRTdTF0cXAxN2xDTDRGdi9MNW1Md0dVS3lL?=
 =?utf-8?B?ZFdHOGlGalU3eXkxSU5hdmYyR0JlNEZHdEZpOHpoTzdUc2x3WnBieFZqZ1RS?=
 =?utf-8?B?OVJjU3lNYzhvdEIvRWxpT1gvYk10Z2ZuSHlCdW0wbHZ3MGNMR0thU2NBbHBZ?=
 =?utf-8?B?VnpUQ1IwRCtFMlU1b1V4NlVGMGRBdDdFK3lyMEdYMXZSZWlaVHBaSVNPVEVD?=
 =?utf-8?B?WnVweW1lbTVQVGV3YWR1KzJzVUphQWFhNWx2cGZDdFNrN1prQXV3KzFLYUcy?=
 =?utf-8?Q?LV0oxBq+4nqBY5kU3CePE60=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85a6e7ea-b3d4-4736-aa2a-08dca186ef29
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR01MB8101.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 08:53:29.3454 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 84xfkW22ENvavK7Kp53Cei7CErYVUhnJIWCBQ9evTMyXr+K0/WzUg6+QhhnnIPfAcyKbsXEaF6y8rAAvJYB6fd6PwAZYT94FwZKA0neo2YSfIcrBtRceNPjcO+DadRod
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR01MB8686
Received-SPF: pass client-ip=2a01:111:f403:c110::;
 envelope-from=gankulkarni@os.amperecomputing.com;
 helo=BN1PR04CU002.outbound.protection.outlook.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: X1uNuj7a+gtH



On 10-07-2024 09:12 pm, Cornelia Huck wrote:
> On Mon, Jul 08 2024, Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com> wrote:
> 
>> Extend the 'mte' property for the virt machine to cover KVM as
>> well. For KVM, we don't allocate tag memory, but instead enable
>> the capability.
>>
>> If MTE has been enabled, we need to disable migration, as we do not
>> yet have a way to migrate the tags as well. Therefore, MTE will stay
>> off with KVM unless requested explicitly.
>>
>> This patch is rework of commit b320e21c48ce64853904bea6631c0158cc2ef227
>> which broke TCG since it made the TCG -cpu max
>> report the presence of MTE to the guest even if the board hadn't
>> enabled MTE by wiring up the tag RAM. This meant that if the guest
>> then tried to use MTE QEMU would segfault accessing the
>> non-existent tag RAM.
> 
> So, the main difference to my original patch is that we don't end up
> with MTE in the max model if we didn't configure tag memory, but the
> rest of the behaviour stays the same?

Yes most of the patch is same. What I changed is to fix the code which 
was advertising MTE feature through PFR1 register for TCG based boot, 
irrespective of the tagged RAM allocated.

> 
>>
>> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
>> Signed-off-by: Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>
> 
> (...)
> 
>> +void kvm_arm_enable_mte(Object *cpuobj, Error **errp)
>> +{
>> +    static bool tried_to_enable;
>> +    static bool succeeded_to_enable;
>> +    Error *mte_migration_blocker = NULL;
>> +    int ret;
>> +
>> +    if (!tried_to_enable) {
>> +        /*
>> +         * MTE on KVM is enabled on a per-VM basis (and retrying doesn't make
>> +         * sense), and we only want a single migration blocker as well.
>> +         */
>> +        tried_to_enable = true;
>> +
>> +        ret = kvm_vm_enable_cap(kvm_state, KVM_CAP_ARM_MTE, 0);
>> +        if (ret) {
>> +            error_setg_errno(errp, -ret, "Failed to enable KVM_CAP_ARM_MTE");
>> +            return;
>> +        }
>> +
>> +        /* TODO: Migration is not supported with MTE enabled */
> 
> Do you have a plan for enabling migration in the future? From what I
> remember, pre-copy support should be doable within QEMU (with a similar
> approach to e.g. s390 skey), but post-copy would need a kernel API
> extension to support getting additional data while faulting in a page.
> 

No plan at the moment.

>> +        error_setg(&mte_migration_blocker,
>> +                   "Live migration disabled due to MTE enabled");
>> +        if (migrate_add_blocker(&mte_migration_blocker, errp)) {
>> +            error_free(mte_migration_blocker);
>> +            return;
>> +        }
>> +        succeeded_to_enable = true;
>> +    }
>> +    if (succeeded_to_enable) {
>> +        object_property_set_bool(cpuobj, "has_mte", true, NULL);
>> +    }
>> +}
> 

Thanks,
Ganapat

