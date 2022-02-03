Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp1966325lfk;
        Thu, 3 Feb 2022 08:33:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyKWJA95Gv4FCikv0NHjyKfsdaP8wyJxn1V6bwB6s/oG0UNpOccVu5l8XRFfmIXuJGQchbm
X-Received: by 2002:a17:907:2957:: with SMTP id et23mr23445151ejc.168.1643906033901;
        Thu, 03 Feb 2022 08:33:53 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1643906033; cv=pass;
        d=google.com; s=arc-20160816;
        b=eAiuBWxsLU/ZW/UTd9GuuzvirSsBVUd3hqeM0/m9ot1kr5D4TuO/J4bD7OKOMKHPrw
         bbhr2xufyA8GGCc1hSdXcNXxAo3GGav0fZpO1f5jkCwpeDUyQQWx008bxtyHetnXRB6Q
         axAMATh9oRe+zAWPmKVCXk0GvQzOCVkA71rNrk8Q0BwlSetbVpII0kMqe0LQMfosX2RL
         qXRmWS2uhas/2JAbdiZTd4YjVGrHaSbgHYnk0yEDpRbjzMBGicIqWwwTizrQjetVhrWn
         cZJRoV96QT4Sg4Law+vtqAZOQtFU3FDKo2fJnEFW2S/wr1ZEHy02kXMFBhLqH2FxC4el
         Ij9A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature;
        bh=VXv65nvZZfdlDrvABYV4xj3xvaC/UqyT4a41bra3+SQ=;
        b=XorE+8vtFwwFghKUT9APm7ZKQJC0GPV2qQB3J25J2XdspKFkhCyUnQz9bgvX8WE0vj
         /A3DwqGmvbFGIpMLQFQUGebJldF7FcMxqMS1KGAGwB3w0Gcn3rs+hGOhzelKgJsZ6FJB
         wmv+4eZL9kxVMHN1+2xGTafrKt4vVR7ZTRxvcuYsx8x59gGfbcc56ralbk02NirnpVM6
         L/bExAggqCSR4yrqXFgc7XluFGLuWIUdU+SvSWTbTIAimSpCP971P+qrP3ha7Z9PqdOw
         07xGCGsilvH7cIw+DgP56x+HsxQeztiIkhj9vfRwx+jZWam9QEF6v9i5/FWJdyIxcPlG
         F/lQ==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qccesdkim1 header.b=pCieErlJ;
       arc=pass (i=1);
       spf=pass (google.com: domain of tsimpson@quicinc.com designates 216.71.140.77 as permitted sender) smtp.mailfrom=tsimpson@quicinc.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Return-Path: <tsimpson@quicinc.com>
Received: from esa.hc3962-90.iphmx.com (esa.hc3962-90.iphmx.com. [216.71.140.77])
        by mx.google.com with ESMTPS id e12si16449534edz.192.2022.02.03.08.33.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Feb 2022 08:33:53 -0800 (PST)
Received-SPF: pass (google.com: domain of tsimpson@quicinc.com designates 216.71.140.77 as permitted sender) client-ip=216.71.140.77;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qccesdkim1 header.b=pCieErlJ;
       arc=pass (i=1);
       spf=pass (google.com: domain of tsimpson@quicinc.com designates 216.71.140.77 as permitted sender) smtp.mailfrom=tsimpson@quicinc.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
  t=1643906033; x=1644510833;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=VXv65nvZZfdlDrvABYV4xj3xvaC/UqyT4a41bra3+SQ=;
  b=pCieErlJzdFeHUNWeDbfGmokI0jqB+qd/p2rAbK1glGXaHQWOdl9ZnBh
   RcwUZZdcfh3UQPur0DaYU43QWJqNOY0Ao5nCzxdvKwOlmclFHs+mMWxsG
   nqCTCxq0LJccntkk85VBxl1pD0s7DB78jDqAK2S4HcqUuAlROF7D9tJju
   8=;
Received: from mail-bn8nam12lp2174.outbound.protection.outlook.com (HELO NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.174])
  by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2022 16:33:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lVeT3+eQwZ1R+LEjSpOv7zEb7+0AejTO7x1Buz6ihZnCQfXdUctoSuwNpYK0nBlAUcUL2ctzR+P6k2o9d+aWQ9OsN+w8+xaxSXleYqD1uwvyhWClnAMZjdk8Nj5tkNxelSmrUvhJjhnXkBcHSgNujXLnRS7xVLBZSYLcZ1+TU4LIhqFc+d2DFsyxcCqRWj6Olujq3r/EB6OvYQ3jy3PejEL32SCnmpeSb+PDOjDOIrZutFJqP5XIYu2msPAIA7ttnb2o9sKXQdiPBJbVy4dNMk+dFuHG5BwKfqcWH1Pd0LYvzkSVkVOOulgdD9lQDDsM3ezCeQXVv2XPsmpIKHucpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VXv65nvZZfdlDrvABYV4xj3xvaC/UqyT4a41bra3+SQ=;
 b=AYVx006ij7GIjWf5+LnEjS6AZqdt4n1wKOrhUSo95cLYzjsh4IciR/Hojpkzw4xBx25Hgiu4SALYMjVxQRS/nXjeDsPkV4Zajx0HyUXOCvL1t7jvcyzyAvo5CIVZbNVAToffC7XEU6UfVJ1ysRWCA8GzCdv9oHFDLrprhP6suiw1+wnvq27ocSeBg3tm00cRz0CyTHr6speb9XuEo9qT1mzjApetgrIH4KLxBbg5o1S7czsUV9olv5qpTimwPhiz20XmoF143Ek4qQF70RITNxv/s6bZzD7L9gWJHttK/Lz5ouWfxRxVbXXeCHJakzbQM3Vl4JFX/cibyC/hDtkx/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by DM5PR02MB2507.namprd02.prod.outlook.com
 (2603:10b6:3:40::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.18; Thu, 3 Feb
 2022 16:33:47 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::bd2b:92ca:d25e:9d10]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::bd2b:92ca:d25e:9d10%6]) with mapi id 15.20.4951.014; Thu, 3 Feb 2022
 16:33:47 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: =?utf-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
	"richard.henderson@linaro.org" <richard.henderson@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "fam@euphon.net"
	<fam@euphon.net>, "berrange@redhat.com" <berrange@redhat.com>,
	"f4bug@amsat.org" <f4bug@amsat.org>, "aurelien@aurel32.net"
	<aurelien@aurel32.net>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
	"stefanha@redhat.com" <stefanha@redhat.com>, "crosa@redhat.com"
	<crosa@redhat.com>
Subject: RE: [RFC PATCH  0/4] improve coverage of vector backend
Thread-Topic: [RFC PATCH  0/4] improve coverage of vector backend
Thread-Index: AQHYGHGJHyYvQ8C+vki+6vd1G/AKz6yA5OuAgAApILCAAPft0A==
Date: Thu, 3 Feb 2022 16:33:47 +0000
Message-ID:
 <SN4PR0201MB88089C0A52C660DC7A6D71E6DE289@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20220202191242.652607-1-alex.bennee@linaro.org>
 <87k0ecvoxu.fsf@linaro.org>
 <SN4PR0201MB8808B91BF0F27E376C1872AEDE289@SN4PR0201MB8808.namprd02.prod.outlook.com>
In-Reply-To:
 <SN4PR0201MB8808B91BF0F27E376C1872AEDE289@SN4PR0201MB8808.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 19371add-172e-42ae-aa6d-08d9e732f3ff
x-ms-traffictypediagnostic: DM5PR02MB2507:EE_
x-microsoft-antispam-prvs:
 <DM5PR02MB25076004977ABEBF9931ADA3DE289@DM5PR02MB2507.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 gGggrybO/Rg+vEZyg/3+ELZg4jtm/6nWfFl28TkYf78k3+DO4BaNGsY7w7FVSsrqQWbPQ5+Erkm/K+vrgphfqfWvaUxyOdhryx+4LY6XfHWsRXRQADilfX3ojxzfnGeM+Wv8+2KJ0V1FvurHWezwu7aW6I9gyYNMYuOrpgc6ocS84/lOv7wfoDY6to3L60jsyGGu23C2/yNMRIPEBzsALUSWcu5Qv3uDylijGXkXTsvz+1UR65PHZwt+9s29m1xIRU+tkQVIjMlxaEFJTySJoLulzfKbcmuTdDhBtPuMecYet5kc8+otnzoBXQ9s79eWY58T+dFqjuWFYchNhR9vjcNBqNClxKorOAduGzCXBvflEjUOPvNR65760sHEpFE6PCJ/AYfqj91KBTXN/KlRXhoEiBI4i9qmSaMAgUBJY1KunrB6jcab80sRNMFMeaNC5yLj4IQqqeS7C+iLCPa3zscCghIxVVj0R4iHM12O1oQLoUdMcx7a4k8qNyjYpMuJRCUcjw+ELcwycM/r6GW8K/wV3EFa0jSUGkuOhdu1PpiAHeAoP1MyeCiKbFKrGy8vSQZc4B9o7APrVr3YDO52cveYgiMp1gcZ97rIQpcSOObCaX2xNd9pURP+x+oIhyPrnlMXiP/mwlLdZ2Y5HNvEfG95T27j2Zl3R4wKV8dKBEZXZzxSe7Lmz+jkjGEy72LRjrSA4zJbzfZOEAlzNEec/g==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0201MB8808.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(7416002)(5660300002)(66574015)(52536014)(33656002)(186003)(26005)(122000001)(2906002)(2940100002)(71200400001)(76116006)(7696005)(66556008)(38070700005)(8676002)(316002)(8936002)(66946007)(9686003)(64756008)(66446008)(66476007)(4326008)(110136005)(83380400001)(508600001)(86362001)(6506007)(54906003)(55016003)(38100700002)(53546011);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZlpKZisxZmJ2a09VQ2tDa3AvN05jbTZMaU15UVdERVFaMU5NV2ptbVBidmhq?=
 =?utf-8?B?SGxiZUw5VFAySExRWlZKM3VjSjRCMzRjTnhBQlZNY251SGNaNHlUamx6RTZk?=
 =?utf-8?B?dGVmMGhzVXBOaVJKS08renAxY0x0ajhBTmZBRjh4Qm9ZOW5qalVQVVEvQVk3?=
 =?utf-8?B?NENlQm1tVG5FTndRWFdrMzM0UTJvNk00bHFlem91bjdrUDVOeUZzdFlIVE50?=
 =?utf-8?B?d1Z1U3pETSsxV2cvTjBWcDRZMHpDckdiMkc4OHZXQVoxaVhiaDFlSFNpM01Y?=
 =?utf-8?B?ZW1zdDdLMzQxVUpud2FZWm1KV2Vock16ZERaVTlRVVVuVGFuNk1KTENKWXNM?=
 =?utf-8?B?UzllWGp1NnV6elVUQnJ5Q1NaemdzMWIxWUgvVHI3QlJKZmdIbXlnN0s1MHU0?=
 =?utf-8?B?ODA5NWs3NzI4ZldQUkJrSklFNEF6d2dwZHRiam5PUUxXOFRPUCtmOGYwcjlm?=
 =?utf-8?B?SWhhNW1YTVdUbXhCZzQvRkUvM2NkdkIzUGJpTHUxNFcyLzFxTmx2eFhzdEpZ?=
 =?utf-8?B?eDR4MjUwaUUxa3M2WFhWTmFvUzBkYmpYV2dXWUJMcytINHMvbXVWNVozcTF1?=
 =?utf-8?B?a29vWmlVNHM2UFJ6Sk43dmp4T21CaWN5d3B0ZWhya2t2Q0ZMWEhPTnUzVWVD?=
 =?utf-8?B?cVZ2d1FsNE05aFo3UGdDVzZxL0t0Vy9nNExhNFljbWhBT0RtaXBRVHRLbVpO?=
 =?utf-8?B?TmJJb3FlQUVIYkRnaU9qUjVjakxJNnowanc1WG1aTmpNNHZ2UnVkOGNNZzRC?=
 =?utf-8?B?WDRxU3V4dEh6TTlvKzZ1U2hqNWpwY0NIczEvYW5KSUdGUjQ2WnlsejhiQmwr?=
 =?utf-8?B?cHRabFlZWFJqMjQ2N0lTOG9TMUNVN1pybGZGS2FRdmlhcDhleTIzejhUdUgr?=
 =?utf-8?B?a3BhamVkbWZiNTVsSUY1T0tEYlhrMDJBbElwWW9rZG1ZMHhYNjZCOWVWUDB0?=
 =?utf-8?B?OGlRNEZ5TDltMUlNNThpb1l5VGJYWHVQUWUvRm9Ea0E3VjJ0YnpoaTQ5NUtW?=
 =?utf-8?B?UTJKZU1hcERiQzNLVjhIbzI4RFppZmdhLzkrWlBwMUwyekNZTXJjRHZqdjFN?=
 =?utf-8?B?dTBvVyt3eVhyZVNnUkErdk40Mi9Ia08xK1dUQ0tvbTRTVVhMQWg3b1Bvb1Vw?=
 =?utf-8?B?NnRiN2dpVkkrZGFBZGhxQWFnSTFlMHhpZ01LQTE3NU5PVWhLTXFqVlhpTW5Y?=
 =?utf-8?B?MGRrQmxWV1M3QkJZYzhHaHNaMldZZGJCSkF3Mjg2dEt3cmNMQ0JLb2hTYk9U?=
 =?utf-8?B?aTFxSVlwZnNqSUhpVlBPQzlKYkhKR3ZlalpzSkdmQ1lxbGRrV3Evb25BVnRa?=
 =?utf-8?B?dVdldTVpa2RJZnVScGpINnB3ZHJDZWsycEY0WUZRZUFCYzV5eE9WMndYdklo?=
 =?utf-8?B?VlZlWDYvMEpVRlE2UnVVQlFQVElaSTM2Rk51aWI4WEpseW04SnJtb3ViZzNv?=
 =?utf-8?B?Mlg0aHpLVGxMUlBYV1J0QTc4dXM4TnV3Y1AvdE84cnBUbDdraTlidVpKMUhj?=
 =?utf-8?B?elZGU0ljZ0IwcDRKSUFzTU5ydlg5VDk1S0piU24wTk9vT0JZL1c3SXE0eGJU?=
 =?utf-8?B?OGVhbWRobXdvWStCeTdRUmJ2azZuQzBES3l6Y0srWGlQMFU5TWdCQm5XNmRY?=
 =?utf-8?B?bjYySy9lMTF1ZVR4bVR3eDd3aTVaRXp4NFdWdWtYejVXekJ2TVJ6MTNmRFlt?=
 =?utf-8?B?KzVkWVU5amNBR3hXdGpNV3pXMXYzRmRSQThJRkprVXNITVZTQnhxbm56WXBy?=
 =?utf-8?B?Y3JxQWxndkxyaVdiT1pVODlTNVFtblJzWjhJNmZjajNkb0JQQm8zOC8wUzlC?=
 =?utf-8?B?cUhWdThCZ0MzdUxOdWp6VmxYZWNGQ0JXZUtvSnBTcXhsdXRBYmx4SjFOWjBN?=
 =?utf-8?B?ZXY0clFSaURMemFWdlZ2MjNrQnFYUW9IWGtUbzRHTnNhZ2VDTjJ3aEprMGJF?=
 =?utf-8?B?OUhWd05qTmZ3L2ZkMzZsUG94dllINHlzbmo0VTVNeEVQd2cxVzUrU0N5SDBq?=
 =?utf-8?B?S0dVSmRSRU11dUN1cjBDNjZyYS9JYXF1Ym5tU3ByV0FYSFltUVh5cU1YMWZo?=
 =?utf-8?B?bzMxRGNZdWYrclhJR0h3cFEyZzlwcVJtRFhDYVZMYmZrNWZ6Uzk3blExWnRh?=
 =?utf-8?B?N0dPa05oTXp3RSsyUldOVFoyNTdMMUZrODB2T3pPS0hLZnVsWWYzbTJ0bVVi?=
 =?utf-8?Q?Ji10F4c5xkYjttVe6ro0f+4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19371add-172e-42ae-aa6d-08d9e732f3ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2022 16:33:47.6685
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qHJKR7hsC1jErC6ny8ZkbKN92bOXrdSvyt/G3Xc/IC/A918J9hnR8V2fTXyu22q0xcXVuHEfYgaih9DRVJbBxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB2507
X-TUID: AvTHu5Do5rHx

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBUYXlsb3IgU2ltcHNvbg0KPiBT
ZW50OiBXZWRuZXNkYXksIEZlYnJ1YXJ5IDIsIDIwMjIgNzo0NSBQTQ0KPiBUbzogQWxleCBCZW5u
w6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPjsgcmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9y
ZzsNCj4gcWVtdS1kZXZlbEBub25nbnUub3JnDQo+IENjOiBxZW11LWFybUBub25nbnUub3JnOyBm
YW1AZXVwaG9uLm5ldDsgYmVycmFuZ2VAcmVkaGF0LmNvbTsNCj4gZjRidWdAYW1zYXQub3JnOyBh
dXJlbGllbkBhdXJlbDMyLm5ldDsgcGJvbnppbmlAcmVkaGF0LmNvbTsNCj4gc3RlZmFuaGFAcmVk
aGF0LmNvbTsgY3Jvc2FAcmVkaGF0LmNvbQ0KPiBTdWJqZWN0OiBSRTogW1JGQyBQQVRDSCAwLzRd
IGltcHJvdmUgY292ZXJhZ2Ugb2YgdmVjdG9yIGJhY2tlbmQNCj4gDQo+IA0KPiA+IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gRnJvbTogQWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBs
aW5hcm8ub3JnPg0KPiA+IFNlbnQ6IFdlZG5lc2RheSwgRmVicnVhcnkgMiwgMjAyMiA1OjE2IFBN
DQo+ID4gVG86IHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc7IHFlbXUtZGV2ZWxAbm9uZ251
Lm9yZw0KPiA+IENjOiBxZW11LWFybUBub25nbnUub3JnOyBmYW1AZXVwaG9uLm5ldDsgYmVycmFu
Z2VAcmVkaGF0LmNvbTsNCj4gPiBmNGJ1Z0BhbXNhdC5vcmc7IGF1cmVsaWVuQGF1cmVsMzIubmV0
OyBwYm9uemluaUByZWRoYXQuY29tOw0KPiA+IHN0ZWZhbmhhQHJlZGhhdC5jb207IGNyb3NhQHJl
ZGhhdC5jb207IEFsZXggQmVubsOpZQ0KPiA+IDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPjsgVGF5
bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29tPg0KPiA+IFN1YmplY3Q6IFJlOiBbUkZD
IFBBVENIIDAvNF0gaW1wcm92ZSBjb3ZlcmFnZSBvZiB2ZWN0b3IgYmFja2VuZA0KPiA+DQo+ID4g
QWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPiB3cml0ZXM6DQo+ID4NCj4gPiA+
IEhpIFJpY2hhcmQsDQo+ID4gPg0KPiA+ID4gV2hpbGUgcmV2aWV3aW5nIHRoZSBUQ0cgdmVjdG9y
IGNsZWFuLXVwcyBJIHRyaWVkIHRvIGltcHJvdmUgdGhlDQo+ID4gPiByYW5nZSBvZiBpbnN0cnVj
dGlvbnMgd2UgdGVzdGVkLiBJIGNvdWxkbid0IGdldCB0aGUgZXhpc3RpbmcgaGFja3kNCj4gPiA+
IHNoYTEgdGVzdCB0byB2ZWN0b3Jpc2UgbmljZWx5IHNvIEkgc25hcmZlZCB0aGUgc2hhNTEyIGFs
Z29yaXRobSBmcm9tDQo+ID4gPiBDQ0FOLiBUaGUgc2hhNTEyIHRlc3QgaXMgZ29vZCBiZWNhdXNl
IGl0IGlzIGFsbCBwdXJlbHkgaW50ZWdlciBzbyB3ZQ0KPiA+ID4gc2hvdWxkIGJlIGFibGUgdG8g
dXNlIG5hdGl2ZSBjb2RlIG9uIHRoZSBiYWNrZW5kLiBUaGUgdGVzdCBhbHNvIGhhcw0KPiA+ID4g
dGhlIG5pY2UgcHJvcGVydHkgb2YgdmFsaWRhdGluZyBiZWhhdmlvdXIuDQo+ID4NCj4gPiBIaSBU
YXlsb3IsDQo+ID4NCj4gPiBZb3UgbWlnaHQgd2FudCB0byBjaGVjayB0aGlzIG91dDoNCj4gPg0K
PiA+IOKclyAgLi9xZW11LWhleGFnb24gLi90ZXN0cy90Y2cvaGV4YWdvbi1saW51eC11c2VyL3No
YTUxMg0KPiA+IDEuLjEwDQo+ID4gbm90IG9rIDEgLSBkb190ZXN0KCZ0ZXN0c1tpXSkNCj4gPiAj
ICAgICBGYWlsZWQgdGVzdA0KPiA+ICgvaG9tZS9hbGV4LmJlbm5lZS9sc3JjL3FlbXUuZ2l0L3Rl
c3RzL3RjZy9tdWx0aWFyY2gvc2hhNTEyLmM6bWFpbigpDQo+ID4gYXQgbGluZSA5ODYpIG5vdCBv
ayAyIC0gZG9fdGVzdCgmdGVzdHNbaV0pDQo+IA0KPiBUaGFua3MgZm9yIHRoZSBoZWFkcy11cC4g
IEknbGwgdGFrZSBhIGxvb2sNCg0KUXVpY2sgdXBkYXRlIC0gSSByYW4gdGhlIHRlc3Qgb24gdGhl
IGhhcmR3YXJlIGFuZCBoYXZlIHRoZSBzYW1lIGVycm9yIG1lc3NhZ2VzLg0KDQpTbywgaXQgZG9l
c24ndCBsb29rIGxpa2UgYSBRRU1VIHByb2JsZW0uICBJJ2xsIGludmVzdGlnYXRlIGlmIHRoZSBw
cm9ibGVtIGlzIGR1ZSB0byBzb21ldGhpbmcgaW4gdGhlIHRvb2xjaGFpbi4NCg0KVGF5bG9yDQoN
Cg==
