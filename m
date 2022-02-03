Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp2118567lfk;
        Thu, 3 Feb 2022 13:05:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxndWTE+U8OLuJRKN87a07TmOwei9Igx3ayWqoDJhh2PioWCycRyk9+azB1Tlmu/U7Gzglf
X-Received: by 2002:a63:c007:: with SMTP id h7mr30375175pgg.422.1643922319801;
        Thu, 03 Feb 2022 13:05:19 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1643922319; cv=pass;
        d=google.com; s=arc-20160816;
        b=0qjl9VYZ5Wql4o7cdEOnLv+ROXmFO1XrIyp+T6yAqdYr9p/vX5RpEUkiUz3M7Aztkb
         8sBbE+/JTn44URbx3d+Ug9nR+JxrEyoX/GZQ6ocplw2Xfxz+aTvMHDMx/Q+QWAbW8Yxy
         WbIZbHaUJUWhgam48BHrxujodqf602cQ3sMLlnATGEBiDfxsBCcid/8mKfqim5aAjWL2
         jur9hDN00Opsx1wC3uIOSNWivuOAcHjZcU5toqu1S//RpPfIKexDIPA2CrLIhuBCPYnt
         DRhBrboYtB5Aq91m8ZmE6HINw85Mnd+R1Kfjks3x9pMM3gEPf91hx9VFkptz2n4/Shsg
         tXNQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature;
        bh=gcKpnbjEoLeSevR2r6n+Qy2iT1UZh7ZAq3Z8IX0agsM=;
        b=g7GoKmmXXBN0yRa4o9Eyof7pSWNkSxqEu2gdvDbmvDoCOQXJSQWWQN2Pwz5SDb7ej0
         rtYSP5YDijyRdEg6gRMM+8G6IWea+L4nUu3KcMX/aKGFKcS8lQ29S6Lt+q2AHECYsbts
         1oB3unNXyuyfOQqu56t7FGb3c39PT6OFiIo+YlRW10s3q/cArazphfxOLWaA1Zdtovnq
         Gr2vFGYOBvmY5RTQHbeL6rjAn42aa0Mi2t9jWHO/4MPR2vcI0wC2riRurGCXcvKfwgmO
         Fo1mep+9BHZArMZOxlLuyj7v7aNkhGoeuNkW79AXKkwZoA6+/9lw0fTRC0EV/u2Liq2d
         yVwA==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qccesdkim1 header.b=TCGQ9oky;
       arc=pass (i=1);
       spf=pass (google.com: domain of tsimpson@quicinc.com designates 216.71.142.165 as permitted sender) smtp.mailfrom=tsimpson@quicinc.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Return-Path: <tsimpson@quicinc.com>
Received: from esa.hc3962-90.iphmx.com (esa.hc3962-90.iphmx.com. [216.71.142.165])
        by mx.google.com with ESMTPS id y65si23368139pgd.598.2022.02.03.13.05.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Feb 2022 13:05:19 -0800 (PST)
Received-SPF: pass (google.com: domain of tsimpson@quicinc.com designates 216.71.142.165 as permitted sender) client-ip=216.71.142.165;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qccesdkim1 header.b=TCGQ9oky;
       arc=pass (i=1);
       spf=pass (google.com: domain of tsimpson@quicinc.com designates 216.71.142.165 as permitted sender) smtp.mailfrom=tsimpson@quicinc.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
  t=1643922319; x=1644527119;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=gcKpnbjEoLeSevR2r6n+Qy2iT1UZh7ZAq3Z8IX0agsM=;
  b=TCGQ9okyQ29gHJuGBcIOwohQhFoAEms1ezQVvmOCPNaObgpiUVqpvQRB
   G3E5NU6ITIXGPEsicKL3SSUMvspL5u/1C8vZ3YX+TzgromB3OZ/dJnM1r
   VVi6+biN6VQtCh9h5QYxRrWHxk7iuANohL6dDoAg3y74U1kxgxk+1bndh
   E=;
Received: from mail-dm6nam12lp2173.outbound.protection.outlook.com (HELO NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.173])
  by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2022 21:05:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=huTGUzzA1CfgFTHF2y1yV0v5eWFaet1S3SOO9qmXxdDZ2XdPhz7we6JtPpeNkoQrn1BUgVADg1wI+iYjeqMfTw5w2HRtAu/JhAd2qZxXOVFKwbAzdjPBaOUeJbZCkf0sUMfCwYWtEk+VuEsHWxKIQJI/MMVhv+JfIbLyvSRbDToguZzRLaJS2ak4z3DOwy4IExLTkVA/H4F/5Dz4Bc9j36Wll0Chw9XkD96G2gxrf86F3OlAWGhwT8xrJgo3u49Nf6aCbQRvBbZg+0l7GzkA6jfXZYwmfMLAXBQ0xttr6TcCKDZ3f2vLfgZW+au28Sys/jkZ9geokFhkYoNll6ApQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gcKpnbjEoLeSevR2r6n+Qy2iT1UZh7ZAq3Z8IX0agsM=;
 b=KRbNd0DLlmgmQvXZEN1St8Qj/3kX0xRRCyNBNYeDiD1kQjDuYl/KI0KjDx2OQVmNSjHXYTZEGOh7Kfo/UzL3v9iVfuELbT3Ul+pYIDOd2FOWdSCPhGMWf8s2EoG+47z8vxhMfIXOwpuW/fkGC0UFaljnQacT/zF5W5Xu326WDpGogYurpR3RO6V4aRwLYzlnvEG/R/Maimy2h7t1ruJPBFXviHrBXGtJoi8ZpyEOHfUul3JPL9LSNltd3y4k5Yd/Oi2V6xDBKODBovcYZWs/mzrow0ERQKoIhaHEX30LtTZ0dLOgvwhFFPY1e9e3LvyyrwgeyHAeX/OSal4qz76GbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by BL0PR02MB5473.namprd02.prod.outlook.com
 (2603:10b6:208:8b::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.18; Thu, 3 Feb
 2022 21:05:12 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::bd2b:92ca:d25e:9d10]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::bd2b:92ca:d25e:9d10%6]) with mapi id 15.20.4951.014; Thu, 3 Feb 2022
 21:05:12 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: =?utf-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
CC: "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org"
	<qemu-arm@nongnu.org>, "fam@euphon.net" <fam@euphon.net>,
	"berrange@redhat.com" <berrange@redhat.com>, "f4bug@amsat.org"
	<f4bug@amsat.org>, "aurelien@aurel32.net" <aurelien@aurel32.net>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "stefanha@redhat.com"
	<stefanha@redhat.com>, "crosa@redhat.com" <crosa@redhat.com>
Subject: RE: [RFC PATCH  0/4] improve coverage of vector backend
Thread-Topic: [RFC PATCH  0/4] improve coverage of vector backend
Thread-Index:
 AQHYGHGJHyYvQ8C+vki+6vd1G/AKz6yA5OuAgAApILCAAPft0IAAFiAAgAAAdCCAAAmWAIAACUOggAARGICAABG2oA==
Date: Thu, 3 Feb 2022 21:05:12 +0000
Message-ID:
 <SN4PR0201MB88083BAD6CD177114DFF4615DE289@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20220202191242.652607-1-alex.bennee@linaro.org>
 <87k0ecvoxu.fsf@linaro.org>
 <SN4PR0201MB8808B91BF0F27E376C1872AEDE289@SN4PR0201MB8808.namprd02.prod.outlook.com>
 <SN4PR0201MB88089C0A52C660DC7A6D71E6DE289@SN4PR0201MB8808.namprd02.prod.outlook.com>
 <87pmo3sut4.fsf@linaro.org>
 <SN4PR0201MB8808A6436C987408C04CED6BDE289@SN4PR0201MB8808.namprd02.prod.outlook.com>
 <87leyrst2m.fsf@linaro.org>
 <SN4PR0201MB8808C67FF92D6656EB9DD5B0DE289@SN4PR0201MB8808.namprd02.prod.outlook.com>
 <87h79fsor3.fsf@linaro.org>
In-Reply-To: <87h79fsor3.fsf@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1acaf6dd-368b-4bb3-3b5f-08d9e758de46
x-ms-traffictypediagnostic: BL0PR02MB5473:EE_
x-microsoft-antispam-prvs:
 <BL0PR02MB54735B4C01C371D55300CFB4DE289@BL0PR02MB5473.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 o9y99exYwae7nHS5QF9YKimR/hhOXSmpG9U9/Z6UnYSgxT8SIf6xdGvME0dZp/OnZXwnbaZV9a3+6bBOE92arUKtP/7j3E7yREhYB3DZbG5icFxsBt9k6zk2u6Y5RV2fZP/P5zIYjvZZHdKKz8N1rrsFEGVH4mdlP9fZGcprYmHjQu0y1M0a7FYl+iYRGxrvNngdL6yXb0g/0UOfBk4JqiT74v9dFFchfQ3OsGSuwtMh/jq8eeNV4rBRjg1XhCIS6WcsHPgiSjqWhp6475yYm6AW106S7uhYNOxIpHyCe9xBPQNiRw8Q9/w30rteWSZzy0wcqu4006bK+dMyGuDBR1hXWvBS5kXsypskkoGCWGpdgnblm5XFtPuFxpEpFnlyRifRuo6wC4KX+Osgm5HpHO7zywmYySyezzfPdkF8/i3jo0pmmjtrTy3selVISm6FvuWL4awSQRXDji9k4VZw/tLY4PYzPafJb+/Q7LFevV2jhpBsbK60pjbm53ACmSYjJnYeZKpMyl5OgoL9OnIaOQ6UBN+tk04CU5HsumMILG/syNio6o2i44hQVsXtbYiNNjFefkt7bu3pZPf8mf7iv5pt+nMLfN7OMtV8HXwy0Xuxn7SIA4K9nwL3WrDrH2J4fsPB0CLlaCaUYPeYX1ATDcUV+7ZeI47np1Lm7hENZ2tEp6Rn1EijC0/PMvOpcmm0sBs+/TLE/I8uq/rsR32KXrM44nZBRLcXAMyBpSuRElqh++JtF/a/J6zIrYw+JrPX7KzYlcS78dAL3Il5BdmC1VVpzGgtDkohkbxnt2pJevg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0201MB8808.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(966005)(316002)(5660300002)(76116006)(66946007)(7696005)(8676002)(54906003)(71200400001)(52536014)(6506007)(86362001)(38100700002)(53546011)(66476007)(6916009)(508600001)(66446008)(66556008)(64756008)(7416002)(8936002)(9686003)(4326008)(55016003)(186003)(33656002)(38070700005)(83380400001)(66574015)(26005)(2906002)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bDdzQnlzNlZpY3R1MG5WK2J0bmo1aGs0V2tGU3I4UmMyVnVHSi81YlRySUkw?=
 =?utf-8?B?cUwvN3F2UVFkMWk3RVMyUjNEdnd5VmR4ZFpPNDRPY3krSElsQ3dmS2JFNGRm?=
 =?utf-8?B?N2VuTVRQYkM1Z1J1enBZdDI3NDN5UllWd0Z6NzBqKy9WQmUrbGc0d2hFU1cw?=
 =?utf-8?B?MUIwQ1JQMXdKdkFrQ1ZBZ3JBS29SRmpjbm50SjY0RE9qREpsMXk5RHoyN0ZZ?=
 =?utf-8?B?ZnQrc2tVU1BxbS96SXRGMEdjVE1WK01pM0VOVDBoNVZxa2tZVUdBWDFKT1Jh?=
 =?utf-8?B?S1VidkxRQmo1L2wxQnZWSFN5UG5LdjNPNm4yNGxzQW5VZWNva3ZTVGVHZEJp?=
 =?utf-8?B?QVdjbFVmbTNYdklmVUZKaExDbnBoczFwZ0U0dU8yLzlNdEdoQlU1OGpuN0cw?=
 =?utf-8?B?MUdETmdleGN0dWhEOTluRzMzejhEWTNmVHNiQXVrbDJTQlVIMXZWaGFlRVVY?=
 =?utf-8?B?NkRreHhZMU5zQmN1V2c1NG9DbXU0MlhFRml3QmprSGY5dktFYU50SzdzUE5Z?=
 =?utf-8?B?eS9jeXJmaGoxcGRmbERqeGdNQ0ZHVDhiRlpzUlFoOUIwMnhRUWVROG1RZ1d2?=
 =?utf-8?B?Ry96Z3ZTRnZPbEZ4Y0R3RUM2Qnh2YjRUY1FCSTltbGlKWmVYOVlpVFpzNmoz?=
 =?utf-8?B?VnI1aDZ1WjIzeFk5TFNCSzRBSG00VlVvZUxpcXBrR1NaZXVQRzdrb3VZRStG?=
 =?utf-8?B?TWtXc2VOamJVbTE0K2NUTGJ6V3VSR0F1cEhjeDE3MlZYU2dHV2h0YjNjMlZv?=
 =?utf-8?B?VFNRN3BBbmdPcUEzYXRTT0piZjBWSGgxNEVqL2o2S1ZOK2ZVaDZJWHBTT3pU?=
 =?utf-8?B?YnZveHNlZnNEUTVNN2UzYjVEUk5MSmRZM09sUXovYlcwODRuY2dibzlqZU8r?=
 =?utf-8?B?WXBycEl4WHkwRkNIelJWNWF1dDNBOVMwTFh5ZG9wbjNISUFKalJOcWN0TWlr?=
 =?utf-8?B?TG9BQjIwWkxMRHdtL2lGWDNBRjV0c2lZK1ZqakNaWXYrZ0VQWktyejVOL3BY?=
 =?utf-8?B?YnB1TkJ3SStSK0VzUjBSZXZrRXh3TUtRRzAwVVA4Wm05RWtFNUphanZMTDBw?=
 =?utf-8?B?aHA2WHVwaktuYytpY1ZGN09DNXpRdVFrYnVtQWhjVzBwVHVQYmRXdnoxQ0xk?=
 =?utf-8?B?YThUVFg4c1o0ZFlwVkFNMGpKTG45SmZwOThvb1BqSDlpMW45T0dMTW9rL2V4?=
 =?utf-8?B?VmRFYnhNVTV5Uk93RjkzTHcrbWVqVEMrbDZLUjZ1bmU3WU1iOTdvbE12WEtC?=
 =?utf-8?B?SmtHWHBmdFRwZHd3OFBEU1lFaVlQY0UxQWNTb0dQcmttZmFaTjJ0L0tFV2lP?=
 =?utf-8?B?L3dYZDg3eDNxWVVWUi9YK1FxSjFvRHBTcFBiV0JqbjVwQk95bzJxb3hEYW1E?=
 =?utf-8?B?L3NLa0lUang1UEpjRC8xU2VlWDBtd3JPVCtBdXVSVk9pOWg2MmJuNTBiVDZD?=
 =?utf-8?B?cHFQaXU5NWFpUm9JRDdGamdKYytQWDdJSURNZzV2S0VWRDRPaTkyeWtMbW9X?=
 =?utf-8?B?UW1LTHFaUUx0NytKc2Z1MEtFRXVnQW82S29sQ0RUdmhVb28xMzdEYlJPZkw1?=
 =?utf-8?B?NGs4djFRVmNnSEpYZG9XckxDWko2U0pDVWgrNDNYREhyelVFa25pRG4zTlJP?=
 =?utf-8?B?YzFhS3EvWG51ODM4NWJORlBkYXJNNTJrTUk3TDNqU1p6ZnRBNGpzOWJseFJx?=
 =?utf-8?B?QW8zNGxmc2JkYStyVWhCTUloeEkySUxxYWROalNSeWd3WXU0STJpaXhXQzJk?=
 =?utf-8?B?TzNwTmZ4TkdnWWxUSHR2UVRaSmN5TU45aDBIcnBSaXFFRTdCMVl4N3dQd3VX?=
 =?utf-8?B?SXhqSnZaVWpTYWxodWVZN3pRdkduZHE1WHVKdU5ReGdBbjFRZWpOYXJ1TjMx?=
 =?utf-8?B?Rzd4U1ExVy80b2Q4MUpJUTNVa3dORmFVaG5kNHZwRXlhaDF3a3kzR0lOaVl5?=
 =?utf-8?B?ZkUzWjhIc25IZXhKQ2diZW9jVFJLTVFXK25mTm12QzhxMjh5dGVKS3h3R3JP?=
 =?utf-8?B?dEFVQ1RVQisxT0lWc0FQbkhIbkUyT1Ura0ZSZWZTRGZ1YnVwbXNwZ2ZnMEdK?=
 =?utf-8?B?Sy9aaGVYa083OFRyOVd5Z1NYcFJKVFZsMngyVVcyUERJYWR0Qm0wTDU5UmxK?=
 =?utf-8?B?c2ZUQmN4dXVsTDZKN2tOT05vL0Rqa3JqbDFhREc0ZzVidTVwaTVBKzZTRys0?=
 =?utf-8?Q?VM4/ucSnA7PSjIdCF8f5wYo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1acaf6dd-368b-4bb3-3b5f-08d9e758de46
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2022 21:05:12.0669
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +Ftx7eEDAjvhMUJoGrM1J5Dl0b86j5rnNZuzJUjprejx4qSUfXsQnD/GEiPpT2u/PbfoXs/0WLPhLe6g7rOXRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB5473
X-TUID: MQ8XIpfV6BQI

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQWxleCBCZW5uw6llIDxh
bGV4LmJlbm5lZUBsaW5hcm8ub3JnPg0KPiBTZW50OiBUaHVyc2RheSwgRmVicnVhcnkgMywgMjAy
MiAyOjAwIFBNDQo+IFRvOiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVpY2luYy5jb20+DQo+
IENjOiByaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnOyBxZW11LWRldmVsQG5vbmdudS5vcmc7
IHFlbXUtDQo+IGFybUBub25nbnUub3JnOyBmYW1AZXVwaG9uLm5ldDsgYmVycmFuZ2VAcmVkaGF0
LmNvbTsNCj4gZjRidWdAYW1zYXQub3JnOyBhdXJlbGllbkBhdXJlbDMyLm5ldDsgcGJvbnppbmlA
cmVkaGF0LmNvbTsNCj4gc3RlZmFuaGFAcmVkaGF0LmNvbTsgY3Jvc2FAcmVkaGF0LmNvbQ0KPiBT
dWJqZWN0OiBSZTogW1JGQyBQQVRDSCAwLzRdIGltcHJvdmUgY292ZXJhZ2Ugb2YgdmVjdG9yIGJh
Y2tlbmQNCj4gDQo+IFRheWxvciBTaW1wc29uIDx0c2ltcHNvbkBxdWljaW5jLmNvbT4gd3JpdGVz
Og0KPiANCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogQWxleCBC
ZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPg0KPiA+PiBTZW50OiBUaHVyc2RheSwgRmVi
cnVhcnkgMywgMjAyMiAxMjoyNiBQTQ0KPiA+PiBUbzogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29u
QHF1aWNpbmMuY29tPg0KPiA+PiBDYzogcmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZzsgcWVt
dS1kZXZlbEBub25nbnUub3JnOyBxZW11LQ0KPiA+PiBhcm1Abm9uZ251Lm9yZzsgZmFtQGV1cGhv
bi5uZXQ7IGJlcnJhbmdlQHJlZGhhdC5jb207DQo+IGY0YnVnQGFtc2F0Lm9yZzsNCj4gPj4gYXVy
ZWxpZW5AYXVyZWwzMi5uZXQ7IHBib256aW5pQHJlZGhhdC5jb207IHN0ZWZhbmhhQHJlZGhhdC5j
b207DQo+ID4+IGNyb3NhQHJlZGhhdC5jb20NCj4gPj4gU3ViamVjdDogUmU6IFtSRkMgUEFUQ0gg
MC80XSBpbXByb3ZlIGNvdmVyYWdlIG9mIHZlY3RvciBiYWNrZW5kDQo+ID4+DQo+ID4+ID4gQW55
IGNoYW5jZSB0aGUgcHJvYmxlbSBpcyBpbiB0aGUgdGVzdCBpdHNlbGYgKGUuZy4sIHNvbWUgc29y
dCBvZg0KPiA+PiA+IHVuZGVmaW5lZCBiZWhhdmlvciBvciBhIDY0LWJpdCB2cyAzMi1iaXQgZGlm
ZmVyZW5jZSk/DQo+ID4+DQo+ID4+IEl0IGRvZXMgaGF2ZSBhIDY0IGJpdCBieXRlc3dhcCBpbiAt
IGl0J3MgcG9zc2libGUgSSBicm9rZSBpdCBjb3B5aW5nDQo+ID4+IGZyb20gdGhlDQo+ID4+IHVw
c3RyZWFtOg0KPiA+Pg0KPiA+PiAgIGh0dHBzOi8vY2NvZGVhcmNoaXZlLm5ldC9pbmZvL2NyeXB0
by9zaGE1MTIuaHRtbA0KPiA+Pg0KPiA+PiBidXQgaXQgZG9lcyBwYXNzIG9uICphbGwqIHRoZSBv
dGhlciBhcmNoaXRlY3R1cmVzIHdoaWNoIGlzIGEgbWl4IG9mDQo+ID4+IDMyIGFuZCA2NCBiaXQg
Y29kZS4gSSBkaWQgaGF2ZSB0byBoYWNrIHRoZSBlbmRpYW4gZGV0ZWN0aW9uIGNvZGUgdGhvdWdo
Lg0KPiA+PiBEb2VzOg0KPiA+Pg0KPiA+PiAgICNpZiBCWVRFX09SREVSID09IEJJR19FTkRJQU4N
Cj4gPj4NCj4gPj4gd29yayBmb3IgeW91ciBjb21waWxlcj8NCj4gPg0KPiA+IE5vLCBidXQgdGhp
cyBkb2VzDQo+ID4gI2lmIF9fQllURV9PUkRFUl9fID09IF9fT1JERVJfQklHX0VORElBTl9fDQo+
ID4NCj4gPiBXaXRoIHRoYXQgY2hhbmdlIGluIHRoZSBzb3VyY2UsIHRoZSB0ZXN0cyBwYXNzZXMu
ICBXaWxsIHRoYXQgd29yayBmb3INCj4gPiBvdGhlciB0YXJnZXRzPw0KPiANCj4gQXQgbGVhc3Qg
bm90IGhwcGEtbGludXgtdXNlci4gVGhlIGpveSBvZiBoYXZpbmcgbm8gc3RhbmRhcmQgY29tcGls
ZSB0aW1lIHdheQ0KPiB0byByZXBvcnQgYnl0ZSBvcmRlciBpbiB0aGUgQyBzdGFuZGFyZCBkZXNw
aXRlIG1vc3QgdGhpbmdzIG5lZWRpbmcgdG8ga25vdw0KPiBvbmUgd2F5IG9yIGFub3RoZXIuDQoN
CkhvdyBhYm91dCB0aGlzPw0KI2lmIChkZWZpbmVkIChCWVRFX09SREVSKSAmJiBCWVRFX09SREVS
ID09IEJJR19FTkRJQU4pIHx8IChfX0JZVEVfT1JERVJfXyA9PSBfX09SREVSX0JJR19FTkRJQU5f
XykNCg0KDQo=
