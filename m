Received: by 2002:a17:906:d9da:b0:a3d:1c09:7d3d with SMTP id qk26csp280283ejb;
        Wed, 14 Feb 2024 17:31:13 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCUMeH/jQ3Bjm8s7xh9JcZJnSNUTZPxqx1zOvpGPeHoFSWZgVhrt8EkSBX6UDR8bJdT7ZudSoM5ZgoKItAk3CxgaCM31Tlst
X-Google-Smtp-Source: AGHT+IFOJk9HFZmTkaRRQrQ79iEOXnwBF6Q1r40MxWB3ezZo09rtXNH/iE216e6A9JCDaxYw4AbN
X-Received: by 2002:ac8:5d92:0:b0:42c:37b1:a5f8 with SMTP id d18-20020ac85d92000000b0042c37b1a5f8mr563226qtx.62.1707960673392;
        Wed, 14 Feb 2024 17:31:13 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1707960673; cv=pass;
        d=google.com; s=arc-20160816;
        b=JG6gleF/femVAjBTOJNq82IFOXGLFfCYVpkl8FBj9VrCnJxysfmHbXEApR+szdNo49
         HVQU5zk+P1EgaqK++RhF66Jpk1SOpJA1JMYNsk+pBtoka4WG9ggTA5RHCOgLyAt1YZrP
         /acuLBsZ6rz/pOlA1oGDevwgb0sZFHZKS4CyO2/8WwAXVkNwdgSpyByINPcEvwI+nf4U
         zKmQOoJ4bnMYkjShCKyJOUbiwBmsSgYwb3heArQR6Z58v5fd0tO60f67B/wPNnld/HJJ
         7nh7lvbe728oC2cfhe38Hahk+aUVyVNiMTReO6qj9Zpm8kcWlhKKvKCzUnpfcaIBC14q
         QBUg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:cc:to:from:dkim-signature;
        bh=jR1ry9HSbULN1ap6LA5SXWgAqCD3xb+ehXLRYfhg494=;
        fh=2wkGQtzyYJpCNAITaeXI+bbZJVHirb54CdQM2UY4qBI=;
        b=anX0hN7qsc6Il8jKfUQwE6J21U/3Wqe4W0x8qL6/ZtEtQsK6B+3Pyb/1GaFWsFogDZ
         KyVJZ/qTWwUr+4L8+YvfbTFwCF6QZP4XSgs3UIecPpA+lyqCloA/P5vkjevTHY+HzsRc
         VYDvyPX+FBX0Bd5OEl7Erb03MP/Z9Dat2HYxL0m8mZfr3No21MhkXI6uqX3nL8+aJ6ZA
         Iu+D1zxsbCIhE/or34dR3lt2aOSgvBNyF30y+h/VZ+d8bLHLIR1Y06QMTUhL4RL9IFWD
         psJiQbUyEy/BFLzz1zEUuOvKX8tZWyH5SpZbyrHqnU9xOdHAaCpwB31SbG/MKHpG8icK
         DeSQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@aspeedtech.com header.s=selector2 header.b=PMyKm7x3;
       arc=pass (i=1 spf=pass spfdomain=aspeedtech.com dkim=pass dkdomain=aspeedtech.com dmarc=pass fromdomain=aspeedtech.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=aspeedtech.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g15-20020ac870cf000000b0042c7fd0ffd9si283743qtp.183.2024.02.14.17.31.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 Feb 2024 17:31:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@aspeedtech.com header.s=selector2 header.b=PMyKm7x3;
       arc=pass (i=1 spf=pass spfdomain=aspeedtech.com dkim=pass dkdomain=aspeedtech.com dmarc=pass fromdomain=aspeedtech.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=aspeedtech.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1raQaL-0004b7-5j; Wed, 14 Feb 2024 20:30:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1raQaJ-0004ac-IQ; Wed, 14 Feb 2024 20:30:44 -0500
Received: from mail-sgaapc01on20711.outbound.protection.outlook.com
 ([2a01:111:f400:feab::711]
 helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1raQa2-0003qJ-3l; Wed, 14 Feb 2024 20:30:42 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iTSX1pRpyg/sKr0ThdXpPoCTTRs+j1DYHYqmV3xsDWGBsZ09Xj6siD7tkbGBKENkuJ7mEgGZfV9xm8q7Zp11CkTyfdilWvcbPMz+UtprVGzyVgd1QkuTx5+qd7FdXlU4iTACQrkEnEaSSzHSphRYFJt6CpWlme85RRS0zyru/XFErLyBK3szZac08JolAR6Pep5q1xpolliGr+W6hYA4KsJ66Pl/tyqtmSVK6ciZRYuOoDvIYguH7QBcv+R4uxvrYKxDLNMOEg7QwYFZhMbWmz8xYK5LZ7Fv3OkvMksLkkivxyPZnjOe6LZ12ZykWmOjQsSDIC1xHFupwy0p5o/3DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jR1ry9HSbULN1ap6LA5SXWgAqCD3xb+ehXLRYfhg494=;
 b=dQn8KLwtWHnuwj6zFOO4nFHBoWS16r/Da8QGw7bbcr+FnWE+ZTansItSMk0+9AAAQPCWZoDMAMR/LrBI1QsBOqMwTLi61c4i+RjzdF/6VEKsrXxwsMlMiUcoIDGqN4gVYKFA4HLsxCG4/E3hZvZBvK4gVNTl2vMQbyHX48B9/Wzoph589/UBFfHDBx33j9cIYQXfJmo/mevQg3Sv05F9TGUVulUkE3sDaeCoN/Q4h2rFREk5oUT8hFX3wcSdZqQCxFtlxn28Hiv5qiux+7j7sLq2ZIZR2r30SnahtXHrZvKzSbveMCc9HEQo3IorwtRGPHGT6l7o+9lvIkMoYt/SAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jR1ry9HSbULN1ap6LA5SXWgAqCD3xb+ehXLRYfhg494=;
 b=PMyKm7x33vcpV0q6qxXbwY2zC5lUw0FGrPuV+DiTqwi5OjKYuAZ1+JuWHTkdaYKW2XLvS5ZkXGguo562mfB/n5OZqSbYcb18xDR/9GjAstTBpyppMK6VhIWZqmMuAtLg7Fyb53ajPBpQTISMJWoUYr4ll77Zgdfnng6Fe8Hi/dQ2CGYRD6vQfWiABlPWxIhUk5jRE1sS0EHwIbjG3A5PHp3+GvzbnBSlDXyUJcZuWYTb98yxbmxlSB8WTDLyHKO+gqtWWA2o8U1qoGmitbK3m08rl0/q486MJuvsnalAvYsTLCdw2e1R1rxJBzz2oxVKMlSCTeNI424xuy/S9krZAg==
Received: from SI2PR06MB5041.apcprd06.prod.outlook.com (2603:1096:4:1a4::6) by
 SI2PR06MB4250.apcprd06.prod.outlook.com (2603:1096:4:13b::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7292.26; Thu, 15 Feb 2024 01:30:11 +0000
Received: from SI2PR06MB5041.apcprd06.prod.outlook.com
 ([fe80::79a8:927d:1e03:51d0]) by SI2PR06MB5041.apcprd06.prod.outlook.com
 ([fe80::79a8:927d:1e03:51d0%7]) with mapi id 15.20.7292.029; Thu, 15 Feb 2024
 01:30:11 +0000
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>,
 =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: Troy Lee <troy_lee@aspeedtech.com>
Subject: RE: [PATCH v2 2/2] aspeed: fix hardcode boot address 0
Thread-Topic: [PATCH v2 2/2] aspeed: fix hardcode boot address 0
Thread-Index: AQHaWf8w9ds0mW/nUUuxu7qEysR4x7D/VH2AgAtUCqA=
Date: Thu, 15 Feb 2024 01:30:11 +0000
Message-ID: <SI2PR06MB50417801DCEF5BDC05FF313FFC4D2@SI2PR06MB5041.apcprd06.prod.outlook.com>
References: <20240207195224.452987-1-jamin_lin@aspeedtech.com>
 <20240207195224.452987-3-jamin_lin@aspeedtech.com>
 <09f9ca34-4e0c-4ada-b808-643a8c578511@linaro.org>
In-Reply-To: <09f9ca34-4e0c-4ada-b808-643a8c578511@linaro.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR06MB5041:EE_|SI2PR06MB4250:EE_
x-ms-office365-filtering-correlation-id: d69aead7-4428-4ead-7557-08dc2dc5a71a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uiXa+zphxvZHoyv755XJ+cJT58OWaks4V194BNV+pc0JsmfdN1Wnp4jRhila2AkMy4RpG5yioL+CX0Q1gUgB8EfdyrAX7SVUTBEgrJT15oKoQdB6LD+cnK5N+7QTh0dRJTvRjp6CTfGO7QuYzhwd9ZIbGJgWvHHuKhoU8yKUNJt/54TpudLE7AHLNxwOqal6929enk/g8kvx2CvKlb66fjtELgwwYbKi+CGhxy2ZzM+Rko+ecOPqPJB8FbpSIhz5AWOuOALNq/Vw22jz9Z7JnF0QK7AvepUQMIkcGRmToXldJOuYZZMJJhhyLWaU4L45KdCjZawoLQtp4t3egX4yO8v3cCin8rBQqxjVXQwDiHxYbJcnbnW06XILfwXZNGIDLvZBURaN3doNhpjFt8DTvMQFjz1ZHLBnhuNsQ1smiGIUlUZN92KHI++Wuhg6YI4K3U57gE15N9VV5yvgPkWam90seNhBaP/qBHwYlAAk39vqbMu8nKg1Rcebl/9kNagpWTiJdkA9cih/S4cs1FWUIzNN1nyAy/W6hwwBjJpO0ilTI15nUA0D6Udf3wkRBwPNXY/E0gfrRZLeAdcpdMflvJrszsAjxvlHxCrOMbl7iKw7HxtiijN7VqZz3Hq0HYok
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR06MB5041.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(346002)(396003)(39840400004)(376002)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(38070700009)(5660300002)(2906002)(53546011)(9686003)(6506007)(478600001)(7696005)(110136005)(26005)(107886003)(41300700001)(52536014)(66556008)(76116006)(66946007)(64756008)(66476007)(66446008)(4326008)(8936002)(8676002)(316002)(71200400001)(83380400001)(86362001)(33656002)(122000001)(55016003)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ejF1ck9PRU1QWjhLUUk1L0xHaURVaWtXQmsrdkdzQjU4UVZKb29ocXVVc3Vw?=
 =?utf-8?B?MWdwTXl0SWw1Qnd0T01rVHdvblJCY0t5ZWZTQ0VOUWliMXJVOEk2UzFNam5G?=
 =?utf-8?B?cEdpM0p5TE53Y3RreW02MDRpVDlQTWNWVjkyVTNINk9TRTBzSmVZRkpNTzhM?=
 =?utf-8?B?UitYWFFhclVMKzRPeG9tWmJtZWl3aXc5MmtCSXVxWE82Mm5TR0FubkZlSmVp?=
 =?utf-8?B?VzdwUlgrd3dvR01nMWdMeW9hWG1iV000NXFTSUhsb0k0UmhBOUFQUzEvTmN2?=
 =?utf-8?B?SkhKQlFvY29kOG56bkxaaXQ1c3BWZDNvd25CYnRLOThtUDUvMTF6VGtKYVE5?=
 =?utf-8?B?TlFrMCtjWjNkQlNpMVZqZjVmTHd3Q1RqTnBERVBJeEF4WnBmeG0yQkx1eGhp?=
 =?utf-8?B?NTdxZHh3aFZISXRSVmdMUWMwVVdKVjdjVXVVK1Y5WUJZT1BVSDJpUTFPVGhu?=
 =?utf-8?B?RTdMby9pdnR3U3NCamZhbUtrRFhKckM5T3M4WjhVUUFQUDZwNEwyMERwUTF1?=
 =?utf-8?B?MStaVWV1UG9MZXQxME1XNVExZVA5L20rVmYzQ2ZMU1Y4eDdESkZRb2twRXVx?=
 =?utf-8?B?WjFHVlQzMEZQRk40ZGVqajZrN2s4VUtmenFQT2xaOEs2Q01yNnpyMFBOV0xM?=
 =?utf-8?B?SWFndFN3TTBjTTg4eGRUaElqdkd0N1Z5SEErOEEzTXYzMnFQamdobVZtVHFo?=
 =?utf-8?B?eTU3R2d3U0YzZ0pIVHV4UjZaQ25TMWJCZWdXaTZQMlVmM0tROFNJZ01jTGdT?=
 =?utf-8?B?czVxQUJ1L0JkRUl2QkEwZ09iMHBPRGttdm8rTTdPTm0zdVh2NkpOaThQdFIr?=
 =?utf-8?B?M2JPVnBwQ3M2NkJ4UnZOaTErSk1rbHFKNklyUk50K1dzMHdaVG9jdVV5VDdB?=
 =?utf-8?B?MGJoZTcwbWdkbkRtbW90R3RhODZFSWREbFNVMWhaTE43aVFldGJmZUVsbENZ?=
 =?utf-8?B?eU1xV0lySys2ZVlmSXJGK3lvbkk1TDRMTFl0dnplYUJtSXlmanZJeFZHNUZZ?=
 =?utf-8?B?ZzZ5bitXMSs4eUJZZGFqSEdIL2YxYXJDcC9TczJFVVdROW91K1p3Q1Y3VnNo?=
 =?utf-8?B?QncvOHVLeGJnVkNrSUJBb2xIZWtoUWxsRFduTE1ibWhqOE1acDcwTlArUXNO?=
 =?utf-8?B?SjZrSkJlRHdZOStwL0lGSGRKbUVnMjJzVGt4bS9ZZXdyTWVZVHAwSExNUXBO?=
 =?utf-8?B?TVBXU1dNOHpkZkh1ZGVScDRYeWw5Sm05U2tsQ1JTdjhZVzZWMXBiV2c0Vm8r?=
 =?utf-8?B?WU1BdHI5clVMaHY4c2dvdFpkSGUzNVZwYWtqUkFCMWgxV2FpcWRtM0QvUHN1?=
 =?utf-8?B?dkJ5TGVKNUk3Y0RpQVZtRXM3UTN3R3J6bmVVVzRZcElhNWQ4S2RzaE1SL2k4?=
 =?utf-8?B?U0cvRWdjdjRMb0JMcEQ3aHE1Q1FDcUY4YVFoaEZEZW0rTWxBa0kxQTZxajZW?=
 =?utf-8?B?cUZmQmM0WlhucWswNVEyZ0ozN3NDQldPc05JbGZjMkltaUNEdmhSVkRwOTFI?=
 =?utf-8?B?ZXJ2NkIrNmNONzFvam5NcGg2aFU4eTd6cmtKeWFPUFl6Z0N2VU1QUGpCbmds?=
 =?utf-8?B?Vm10SjNRZXNuSzRuVUlXZDR3U2tPVlhGeVRpYWVqa29OUldLbTlKUHZDaHB3?=
 =?utf-8?B?OGdGZkpUUlZJZkxvV0ZEdmVHMW4wTXFUVmZXYytBZnB6UGFrY2ExZzl2bjZl?=
 =?utf-8?B?OXhIeVBPcURaWjBQTFBGOHlzU3RYbXVLcERNZG1jd2JjbnZkTHYyNVdjczdW?=
 =?utf-8?B?UzFtdHJoWjVQc3NVQllhTzdqTDUrb21xQkNkZUE0eHlmNEU0TXMxdWRMR2Vk?=
 =?utf-8?B?WGF4cmhBSlEyZm8rV241UFNRbllKYzhISThTUWpaa0lnaENjSlNQTzNZRFlq?=
 =?utf-8?B?UGc3RVQ3V0U5RWFmVWljTHE5SlZIeEwwb3M5aHRkNEg1OThHWWt0aVBYOFRP?=
 =?utf-8?B?ZGYrU1VnNys3ZndBRFlTeUJTbGRGSXRNN2R6NiswZm9Yc3ZrcW55VDNlajU3?=
 =?utf-8?B?OEJLUnVpbDU2ZWJpbkJXM2RQN3FabWRRdFYwbEdIZysrNEVaMS85ZGVYbzlS?=
 =?utf-8?B?LzFmZU5BT1BnMHFNeDB0dGNIeGNHTHR5TlJWclNKdFRKL3ZhYmh6TmtnbThS?=
 =?utf-8?Q?fi1scgdxWt9cmhQB2W0HBLb+2?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5041.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d69aead7-4428-4ead-7557-08dc2dc5a71a
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2024 01:30:11.4599 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /ccBeVCLA4xAbRwmbwweHI9JU6/MAB+mY3M5wXU/JqalvcfDXPFSGn1uLoLwK7u4NaYLhgrcXcAOPfhljTDAN85uOu9MStF3rNDw31Jwda0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB4250
Received-SPF: pass client-ip=2a01:111:f400:feab::711;
 envelope-from=jamin_lin@aspeedtech.com;
 helo=APC01-SG2-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 6hjLd5SBL2Po

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQaGlsaXBwZSBNYXRoaWV1LURh
dWTDqSA8cGhpbG1kQGxpbmFyby5vcmc+DQo+IFNlbnQ6IFRodXJzZGF5LCBGZWJydWFyeSA4LCAy
MDI0IDQ6MjkgQU0NCj4gVG86IEphbWluIExpbiA8amFtaW5fbGluQGFzcGVlZHRlY2guY29tPjsg
Q8OpZHJpYyBMZSBHb2F0ZXIgPGNsZ0BrYW9kLm9yZz47DQo+IFBldGVyIE1heWRlbGwgPHBldGVy
Lm1heWRlbGxAbGluYXJvLm9yZz47IEFuZHJldyBKZWZmZXJ5DQo+IDxhbmRyZXdAY29kZWNvbnN0
cnVjdC5jb20uYXU+OyBKb2VsIFN0YW5sZXkgPGpvZWxAam1zLmlkLmF1Pjsgb3Blbg0KPiBsaXN0
OkFTUEVFRCBCTUNzIDxxZW11LWFybUBub25nbnUub3JnPjsgb3BlbiBsaXN0OkFsbCBwYXRjaGVz
IENDIGhlcmUNCj4gPHFlbXUtZGV2ZWxAbm9uZ251Lm9yZz4NCj4gQ2M6IFRyb3kgTGVlIDx0cm95
X2xlZUBhc3BlZWR0ZWNoLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAyLzJdIGFzcGVl
ZDogZml4IGhhcmRjb2RlIGJvb3QgYWRkcmVzcyAwDQo+IA0KPiBIaSBKYW1pbiwNCj4gDQo+IE9u
IDcvMi8yNCAyMDo1MiwgSmFtaW4gTGluIHZpYSB3cm90ZToNCj4gPiBJbiB0aGUgcHJldmlvdXMg
ZGVzaWduIG9mIEFTUEVFRCBTT0NzIFFFTVUgbW9kZWwsIGl0IHNldCB0aGUgYm9vdA0KPiA+IGFk
ZHJlc3MgYXQgIjAiIHdoaWNoIHdhcyB0aGUgaGFyZGNvZGUgc2V0dGluZyBmb3IgYXN0MTB4MCwg
YXN0MjYwMCwNCj4gPiBhc3QyNTAwIGFuZCBhc3QyNDAwLg0KPiA+DQo+ID4gQWNjb3JkaW5nIHRv
IHRoZSBkZXNpZ24gb2YgYXN0MjcwMCwgaXQgaGFzIGJvb3RtY3Ugd2hpY2ggaXMgdXNlZCBmb3IN
Cj4gPiBleGVjdXRpbmcgU1BMIGFuZCBpbml0aWFsaXplIERSQU0sIHRoZW4sIENQVXMoY29ydGV4
LWEzNSkgZXhlY3V0ZQ0KPiA+IHUtYm9vdCwga2VybmVsIGFuZCByb2ZzLiBRRU1VIHdpbGwgb25s
eSBzdXBwb3J0IENQVShjb3J0ZXgtYTM1KSBwYXJ0cw0KPiA+IGFuZCB0aGUgYm9vdCBhZGRyZXNz
IGlzICIweDQgMDAwMDAwMDAiIGZvciBhc3QyNzAwLg0KPiANCj4gVGhpcyBqdXN0aWZpY2F0aW9u
IGZyb20gaGVyZSAuLi4NCj4gDQo+ID4gVGhlcmVmb3JlLCBmaXhlZCBoYXJkY29kZSBib290IGFk
ZHJlc3MgMC4NCj4gDQo+IC4uLiB0byBoZXJlIGlzIHN0aWxsIHVuY2xlYXIuIFlvdSBwcm92aWRl
ZCBhbiBleHBsYW5hdGlvbiBpbiBwcmV2aW91cyBwYXRjaCwgbWF5YmUNCj4gd29ydGggaW5jbHVk
aW5nIGl0IGluIHRoaXMgZGVzY3JpcHRpb24/DQo+IA0KPiBPdGhlcndpc2UgZm9yIHRoZSBjb2Rl
IGNoYW5nZXM6DQpUaGFua3MgZm9yIHJldmlldyBhbmQgc29ycnkgcmVwbHkgeW91IGxhdGUgZHVl
IHRvIG15IENoaW5lc2UgbmV3IHllYXIgaG9saWRheS4NCldpbGwgYWRkLg0KSmFtaW4NCj4gUmV2
aWV3ZWQtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAbGluYXJvLm9yZz4NCj4g
DQo+ID4gU2lnbmVkLW9mZi1ieTogVHJveSBMZWUgPHRyb3lfbGVlQGFzcGVlZHRlY2guY29tPg0K
PiA+IFNpZ25lZC1vZmYtYnk6IEphbWluIExpbiA8amFtaW5fbGluQGFzcGVlZHRlY2guY29tPg0K
PiA+IC0tLQ0KPiA+ICAgaHcvYXJtL2FzcGVlZC5jICAgICAgICAgICAgIHwgNCArKystDQo+ID4g
ICBody9hcm0vYXNwZWVkX2FzdDI0MDAuYyAgICAgfCA0ICsrLS0NCj4gPiAgIGh3L2FybS9hc3Bl
ZWRfYXN0MjYwMC5jICAgICB8IDIgKy0NCj4gPiAgIGluY2x1ZGUvaHcvYXJtL2FzcGVlZF9zb2Mu
aCB8IDIgLS0NCj4gPiAgIDQgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA2IGRlbGV0
aW9ucygtKQ0KDQo=
