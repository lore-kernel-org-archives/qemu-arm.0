Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3337830lft;
        Tue, 28 Jun 2022 09:14:02 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1toxfI/ebRfLMJbxndZ+lRiO2dDrRvKaST1k6wGb/XN7Q+J5miubqGamalQyjwrCCIofAdQ
X-Received: by 2002:a05:620a:4083:b0:6a7:7988:3cf with SMTP id f3-20020a05620a408300b006a7798803cfmr12132297qko.518.1656432842781;
        Tue, 28 Jun 2022 09:14:02 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1656432842; cv=pass;
        d=google.com; s=arc-20160816;
        b=uK4mLIZliKqJtBYgXFxaUEftfZaLLBjKCNgW2BlcFP0LK7dYBiRCup95hNsl+5LSoY
         0DUodIgFf5W7jdSHhMrJaBJaWx0RgD3NgtyrYqVVfqS8dls3GxdrGRG9ZIETGdjJSKna
         LANVN9y8DE2t5KFD5BOQrHWj7/FgF1sHKaenvsrt1DrI7GGOB8v5wVL2PBRwR0B9y+DJ
         a4kgwGabHpFZ8z5d6HP9KgGEs9Vd/7xpBz+xRCET5K9w9m50q/zR03d0YP2gvXbP0QhP
         6incELTzleafJ9NCpw4FQw3zQOxaU1E9P9sJjlDkqLFkN4qpVKUgnu5qMf2bDlV8/ft+
         GEcA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-id:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:from:dkim-signature;
        bh=aaXNZe7gt0UNz0qf9iEsmUy16uvKTaA0yRiAlBfXu9g=;
        b=XeeljCbl3pG1v0QAn0uHq/GQoW4OSKcGJp+fyUEczc4gfBpfDl8vw3NIGXyqNVhn2V
         NY+P5jab3q0CdKq6BoQLZsvObhhqhZG5zWLwCBIVUgYTLoQY569aqc26FIgiLTh7utIN
         4ETwUxn1Ws+xcY19Lf26GXBhWdjklSVDrh6kQb45wcOeM6cYP+OCgnk7J1iHoqCmXa8X
         yI45B6wB4K7FrzD6llxIgtXcZ7bRmx664mpY+16fkCoHdMvIKAaWY2hXKoptbhCtKxVs
         QjN4B6UqTZdyd/fuqq8j4hlUTOGguJvXl+r+SdCio85qzw7F6u/Sz1IT6MyDNTqtLb6N
         70Ng==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@fb.com header.s=facebook header.b=oS3MMpjr;
       arc=pass (i=1 spf=pass spfdomain=fb.com dkim=pass dkdomain=fb.com dmarc=pass fromdomain=fb.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=fb.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p8-20020ad45f48000000b00470b4ce9882si4421477qvg.201.2022.06.28.09.14.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Jun 2022 09:14:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@fb.com header.s=facebook header.b=oS3MMpjr;
       arc=pass (i=1 spf=pass spfdomain=fb.com dkim=pass dkdomain=fb.com dmarc=pass fromdomain=fb.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=fb.com
Received: from localhost ([::1]:58910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o6Dqk-0006H8-8n
	for alex.bennee@linaro.org; Tue, 28 Jun 2022 12:14:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=8178b97bae=pdel@fb.com>)
 id 1o6DqC-0006Fo-AD; Tue, 28 Jun 2022 12:13:28 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:56000
 helo=mx0a-00082601.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=8178b97bae=pdel@fb.com>)
 id 1o6Dq9-0006Yg-TZ; Tue, 28 Jun 2022 12:13:28 -0400
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
 by m0089730.ppops.net (8.17.1.5/8.17.1.5) with ESMTP id 25SAANZm003752;
 Tue, 28 Jun 2022 09:13:11 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : cc : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=aaXNZe7gt0UNz0qf9iEsmUy16uvKTaA0yRiAlBfXu9g=;
 b=oS3MMpjrEHM+500aMDW8WJTdxquudgwDuvKneg+jCexUHdnTPfHwSpmfVigKH8ls9fn/
 7e+YvhTjaB3OsylSctz312ji4HJsjNs6fGcfveP95K9Q7a61uR2hPqc2mTCYAVPjnpvY
 k8TWHoAjaz8cz6VjCe4irMmby5I57W9+78w= 
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2173.outbound.protection.outlook.com [104.47.57.173])
 by m0089730.ppops.net (PPS) with ESMTPS id 3gywp2b158-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jun 2022 09:13:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TJTG8O7roN70XnAiYKPgxtKY++76JKWMIzmmcvJooylJxgRAcPCtnN2w7A5rA+9ykL8ZKL+MogtYbHpLFwkLx/iwhBX5fJFWL4Ogt9oEeDk2OKf3pmI9TIBM3NrltIfpwKh0g3oX3NT//40ST5e3U9PmcblSxSSLww+umDPs3U9XRv/wVUOW4tJLkZWXTKXGPqJXzMzahg6s60EA/vYqxh2G2y0ttpfynLDzVPXvVkIVzxURr0Sq5LbSMHH5Xw92leYTzyi7mo/TWz/k/9N/MBSJ2aZRFNtf107CsfJLdPc4zNtJTd5GAtbyPLzsHIw7fHaBhmFCof7DGivFhCV3ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aaXNZe7gt0UNz0qf9iEsmUy16uvKTaA0yRiAlBfXu9g=;
 b=megMciP9GpL7//rkYWtzmNABsoQTVnz/iW8e0WZHA6s4eTtnLjUZg4iI5pvZJlvr10TdQ9CWOBSCDgVRmP9vNlWxu41e7V+B9qUEtn9Pw33KETnCVS1keIRfTGuuua8iBS+dfbZBYXXKw9CVos0oOFLL/zmwGepSWJiqWW57wIXdZ15hRGVQaiV+1Vj+rY3IfxajnlQNPM3jdJzZXSRL1SSNrCOAjJvSigTA51vs67YEgf9uK5kUKjes+hL/ilUieQYeZJvunp3tY7hJfuUFmIKd4nkzwHNhy75OZmxZdk6IZDR53qDAVoFYiPlHN99XEPr968kvwZoBpnI4Qc6n8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from BYAPR15MB3032.namprd15.prod.outlook.com (2603:10b6:a03:ff::11)
 by DM5PR15MB1786.namprd15.prod.outlook.com (2603:10b6:4:51::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Tue, 28 Jun
 2022 16:13:09 +0000
Received: from BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::70d0:8133:42cc:f134]) by BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::70d0:8133:42cc:f134%6]) with mapi id 15.20.5373.018; Tue, 28 Jun 2022
 16:13:09 +0000
From: Peter Delevoryas <pdel@fb.com>
CC: Peter Delevoryas <pdel@fb.com>, qemu-arm <qemu-arm@nongnu.org>, Cameron
 Esfahani via <qemu-devel@nongnu.org>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>
Subject: Re: [PATCH 2/3] aspeed/i2c: Change trace event for NORMAL_STOP states
Thread-Topic: [PATCH 2/3] aspeed/i2c: Change trace event for NORMAL_STOP states
Thread-Index: AQHYiwaUnptj+MJcmkOW0amJFoa/J61k/dyA
Date: Tue, 28 Jun 2022 16:13:09 +0000
Message-ID: <E5CD7088-3046-4C8C-A60F-7DDA2FF66D7D@fb.com>
References: <20220628154740.1117349-1-clg@kaod.org>
 <20220628154740.1117349-3-clg@kaod.org>
In-Reply-To: <20220628154740.1117349-3-clg@kaod.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 78f52f8a-ea87-4525-1deb-08da592117e6
x-ms-traffictypediagnostic: DM5PR15MB1786:EE_
x-fb-source: Internal
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gJPLySkd7LD6HX/zwRelM23NRz3BSmjwSSe2kmq9LR/KJIJ5gbRP72yqxhCWOWddN9R2Kr4K36VIaza3Ci3e/14BRVAZJB96bxLHnEemK1txohClKBcqrd44J8Pw7sJP0fxFdQq73vHF81vvvVKFRnuIlZXhZY81LVFKTSeyAMu0azj4R+UO9A+03XubxxbGkBTHdGlJ/tcCdIuB6He9aB53YY98igaVOZ9s4MURj19EJTostZjWkl9S1w2jG6lTNHAC41KZIgDRzDcepqfa/E3dtZKjJr9dv/hV+ODiTFcVOlnAJmQHuLe09O4Yl9vrj2rtMkHslkWE77vCiZq2naVgLQsFWj8Kmdge2n4NE2hk8w32LpLS1UPkyAjGcg3h1ejaqD32QT/4dAvM6Ws4tDbz4IuJjXDFNIw5Wrsvn+LesZjeQqkWQ/r07FP/mPK/pg8O3E4c/7EG3PdZ8Z+Utqyghb7BIOm68L1VcisWsxBrUT5FEJK1jVIE+ywwlfdz61MH1YKZfiUHyxpgUSyvSxDhRrqxMAKzbY4TGF+WkqW0qilEFf4S2pRA35WVMWIAK5Q9/22m4MeG4kH1d8rA7PFadEb6BRxjTCZsJBfNaB2cCei3EeZ5MZ2MYV0SuWWEic4Bd2VEUEVkzApw9Zd6p1/FtgiYd7bEPRzlPRd0ovjzoscqpykkciQyy6C7vxTz19PjHIV5mPOsH1kwy04ynhTOfgZg4yn3bvnCAXCxzudwdtL9aeI5pwaOH/MZq4LejHRWC4vXIdglq7eAAURXhbk+o643rE2ro3PEM3PTHyAfpQbHJ5dOiPq2BXpFQKkCzaZqhu+lhj2aqYGEGKMj7A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB3032.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(396003)(39860400002)(366004)(136003)(376002)(38100700002)(316002)(6506007)(41300700001)(64756008)(4744005)(86362001)(8936002)(83380400001)(76116006)(122000001)(8676002)(66946007)(53546011)(71200400001)(66574015)(36756003)(33656002)(2906002)(109986005)(186003)(6486002)(54906003)(66556008)(2616005)(66476007)(66446008)(4326008)(6512007)(478600001)(38070700005)(5660300002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eUlGSDZLc0xKcFg3U2psN2xCR2hvc25UVXdkQ25YVEtFVUZWWXp0cCtvbExi?=
 =?utf-8?B?RkdWejZFSHNpL1ViU3BwNm9MMlBxV2d4Qktacmh4dUVCc0pZU3UzWE5BWi84?=
 =?utf-8?B?czNzM09LWGRaTnpPOThzRUZFV08xV0RCak9mYW1KcCtNUGZTYzJPQnFWOW9p?=
 =?utf-8?B?dDdyYWRHbWw2SXlhcW1acDVGV29rd3pFRmN4dnl2S0Y1c2xKWUxwYUtaczJM?=
 =?utf-8?B?TlliTStFVXo4UGdmMzJNN3YvN0hWRkdnV0pydXVZV3pHdCt2bkVMbVVEVHhE?=
 =?utf-8?B?NDJMa1NvR05tSzVHdXVTdVMwQVRSZ1BhaFh3S09lQnYwZW11dGlSMGpDaTl0?=
 =?utf-8?B?NzliUGlMcWwwbEcyOFVBMXdDbnd1SUU1alprYmxiSTZWYmVPR3orREVBTmpH?=
 =?utf-8?B?MDI2SzdoTGFCa0w3cTFySFFEbkd4a1BqRkx6L2dKNitFN1JaMTU5RlUzN1N6?=
 =?utf-8?B?NnVkejV3bndRT3o2N3NTT3dtOFZKK25lczFkNUdIbjVFVFNJWUxvSWVUUkZV?=
 =?utf-8?B?MU5McjNZaDJCUk9pNlhBdEhHbTV4UjNhRk1PYmwwWXJpMWZsVHFrSGpQTkJP?=
 =?utf-8?B?SS9vUnZCdFhGNkxuYVVEUG5xNGwxSjgvOStDVTNaazlwVXZabXdGSHpRSldo?=
 =?utf-8?B?RVRhSVlmMDVwMFB5RWZoRnE4dDRFVmliSFJoZ0p0aGhPQWJzaVkrVW1vZW1l?=
 =?utf-8?B?OERDVTFmSUp0WklFTFgrZTdXWFBlSCtqY2Rud1NpcW9yQ2YzMERvVVFZd1dI?=
 =?utf-8?B?YzMrSE9mZDdISWhISXJRUXNxOXE1UUFUVjEwOS9JYzFZRVdCQnEyQXd1NWRL?=
 =?utf-8?B?YUxUZk9VenAxc2h2VldRdTlsQ01RTnE1ZmpLUThCdmxKMnRMWUtiRzhUcGFG?=
 =?utf-8?B?aVp2WDBvOW00a1RRLzhpRHRtMlczb2NMYTU1WHdreUFzOElEeTVSZW5YRm5n?=
 =?utf-8?B?R294SXJGNGhuY1owSm5OVnFrUHhGZzhYMzcwOGlSbS85bFlKUUlMS0pNUlNJ?=
 =?utf-8?B?Q3hiQjlUSHhaaDV0YXJpbWNjbjZVa1RUczdmSGxBNlg5UFpVbndQeDFBOHhH?=
 =?utf-8?B?RWN6RTFNelJJY20wa2QzSGJrdkN6ZldtRWJIRzhiRm4zbFArUWlKTEJxMml1?=
 =?utf-8?B?ZDVjUmRsam9GYjNjWDh2YXFaVUtGMkdQL0NuYmhXaFhJN043Z1MwZlc5L241?=
 =?utf-8?B?M1htWnNQVEM4VUlvK0tCSS9XbWdvd3UrTndMcVJFVFE1YXNPVGlzNHpSSmxK?=
 =?utf-8?B?TGFkT1BUeERhaGFET1ZwY1J6dFJUZkpHTmR4WGlRYUxGdFY4UEJHVnd5MHNE?=
 =?utf-8?B?YkNsMVBHTU5QYzFaSG9iTkx6YktvM0lxWFFQR3BzUEphYWNBSVROYVBlUVY2?=
 =?utf-8?B?WW4zOWZBS0JSQXp1bVBPWFcxSlp4NktZc2NDNmdhZmJMVzFNdTlLeUxnMkFC?=
 =?utf-8?B?cVpRVmFxb1UxRXBSUndZMDlVMWRTSXRHeFJkbHV4b1o1RDN4ZjZadm1YTGY2?=
 =?utf-8?B?eG9xc2hDaC9DNUhsd1JiSUdEbUZQcjBqaldzME50VUtYUldhNURGd2cybUt4?=
 =?utf-8?B?N1lOM1hURjVTVDkxMTNPVFEwbmt0NGlHcTl4VGkrOWhTRzlmMVl2WkpYMmtk?=
 =?utf-8?B?ZXRDS0dhdmVHL1Jma1FSMUFXMkhpNVZPZDgwNTdjemEwWW9NN2lTUk9XZWpN?=
 =?utf-8?B?WW9sK0VDYWFPbDhTWnIvSWxwOG5aQVV2WnRkM21WeXplMGhJWHU0NXE3ZlNh?=
 =?utf-8?B?U2NKMmtRUG5Td2RyU3FoMXBrRlE4MjhHSjBNNTR6emQ0U1ZxNHp2NC84emJZ?=
 =?utf-8?B?TElJVkFiZ1NDNlJkSncyb3hPMFlMN2tZWXNjTWdmZTJDRUlZRG1jMitNWWVJ?=
 =?utf-8?B?VTNTOXlKY2Q3akE4eTNkYTJhU1NrWG9ORlRFVVpQZGcvOUduN1dOZFRpWkV5?=
 =?utf-8?B?Rm1tTTVVU1JPZnM3VjVwUXgxWDdNWk45RkcycFlXRFZIMllDcWNEUUUwMkFv?=
 =?utf-8?B?a0J1c1hrSWFpWUxaMVQ3M1o3MFpTVkFzdnFEcnNxd0JNdGR4aUhtbDFSa3lB?=
 =?utf-8?B?LzRSdnBhdEgyVklGNG94anlwMkJxemtzRzRtaDR4WG1HY25KSjRjT3pDUHFt?=
 =?utf-8?B?WVZyRDcvZ2lMT3VKaFBhN0FudnJnRXF2ZEFMRUErcHVSck9CeStEeE45Nlcr?=
 =?utf-8?B?b3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4252885043634A4CAA2DBEA37D071028@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fb.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB3032.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78f52f8a-ea87-4525-1deb-08da592117e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2022 16:13:09.5939 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4PUU+K0DhTD2HowSUbPizvs1nUAsZrd2e3rmf9e75Owt0aoq4gpg8nEnyZ/u8uSF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR15MB1786
X-Proofpoint-ORIG-GUID: zzkniSAQxU9clyMK8oeRWH3O64PthP8T
X-Proofpoint-GUID: zzkniSAQxU9clyMK8oeRWH3O64PthP8T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-28_09,2022-06-28_01,2022-06-22_01
Received-SPF: pass client-ip=67.231.153.30;
 envelope-from=prvs=8178b97bae=pdel@fb.com; helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MISSING_HEADERS=1.021, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZCX3KvA6ky+O

DQoNCj4gT24gSnVuIDI4LCAyMDIyLCBhdCA4OjQ3IEFNLCBDw6lkcmljIExlIEdvYXRlciA8Y2xn
QGthb2Qub3JnPiB3cm90ZToNCj4gDQo+IFVzaW5nIGEgJ3N0b3AnIHN0cmluZyBzZWVtcyBtb3Jl
IGFwcHJvcHJpYXRlIHRoYW4gJ25vcm1hbCcuDQoNCkhhIHllcyEgVGhpcyBpcyBhbiB1bmRlcnN0
YXRlbWVudCwgdGhlIGNoYW5nZSBpcyBtdWNoIGFwcHJlY2lhdGVkLg0KDQpJJ3ZlIHNlZW4gdGhh
dCB0cmFjZSBhbmQgbmV2ZXIgcmVhbGl6ZWQgaXQgd2FzIHJlZmVycmluZyB0byDigJhzdG9w4oCZ
Lg0KDQpSZXZpZXdlZC1ieTogUGV0ZXIgRGVsZXZvcnlhcyA8cGRlbEBmYi5jb20+DQoNCj4gDQo+
IFNpZ25lZC1vZmYtYnk6IEPDqWRyaWMgTGUgR29hdGVyIDxjbGdAa2FvZC5vcmc+DQo+IC0tLQ0K
PiBody9pMmMvYXNwZWVkX2kyYy5jIHwgMiArLQ0KPiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9ody9pMmMvYXNwZWVkX2ky
Yy5jIGIvaHcvaTJjL2FzcGVlZF9pMmMuYw0KPiBpbmRleCAzN2FlMWYyZTA0YmQuLjliNDFiYzM4
OTY0ZiAxMDA2NDQNCj4gLS0tIGEvaHcvaTJjL2FzcGVlZF9pMmMuYw0KPiArKysgYi9ody9pMmMv
YXNwZWVkX2kyYy5jDQo+IEBAIC01OCw3ICs1OCw3IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBhc3Bl
ZWRfaTJjX2J1c19yYWlzZV9pbnRlcnJ1cHQoQXNwZWVkSTJDQnVzICpidXMpDQo+ICAgICAgICAg
ICAgICAgIEFSUkFZX0ZJRUxEX0VYMzIoYnVzLT5yZWdzLCBJMkNEX0lOVFJfU1RTLCBTTEFWRV9B
RERSX1JYX01BVENIKSA/DQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgInNsYXZlLW1hdGNofCIgOiAiIiwNCj4gICAgICAgICAgICAgICAgU0hBUkVEX0FS
UkFZX0ZJRUxEX0VYMzIoYnVzLT5yZWdzLCByZWdfaW50cl9zdHMsIE5PUk1BTF9TVE9QKSA/DQo+
IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJub3JtYWx8
IiA6ICIiLA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAic3RvcHwiIDogIiIsDQo+ICAgICAgICAgICAgICAgIFNIQVJFRF9BUlJBWV9GSUVMRF9FWDMy
KGJ1cy0+cmVncywgcmVnX2ludHJfc3RzLCBBQk5PUk1BTCkgPw0KPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJhYm5vcm1hbCIgIDogIiIpOw0KPiANCj4g
LS0gDQo+IDIuMzUuMw0KPiANCj4gDQoNCg==
