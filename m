Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp1529181lfk;
        Wed, 2 Feb 2022 17:45:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJycJ6opU7IXA6Kb49U2qNBWX4YIwP6RnlwGuK/Bp2thrQwHlnMCP0j5lIhozzETYQ0QIj19
X-Received: by 2002:a17:907:924d:: with SMTP id kb13mr27342301ejb.507.1643852727982;
        Wed, 02 Feb 2022 17:45:27 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1643852727; cv=pass;
        d=google.com; s=arc-20160816;
        b=NBZfWdTEkD0n5xb35oXDRGiboOwezJq5E95ah64H/hssVVkMfiwYG5PV5mn6lJTaE3
         HG9DF2HVyEl3Rtwbcy29vQfoNZ0g9dZyb0uwwVWrF2QsmT55HzPmGX5c2BSDIfYf06uL
         Vjq4UrY4+vGpC7w6LeG/RqnEzx+OB2PBjxLfSPQhrcCnBSTyMLWEn7WDLX9yWPIcU2w4
         5pAtVFWrW1BJrwgpaz3Yyb4Ox14gujU7Yq9pIOuPU1Gvl8ZpAziRd4WoTtrLZdV4qOpN
         ciE9vDPKexcoT6nM3zw7Dn8ybzvOPKCPusFvtgggeAJmIz/bD8SzNCurn1zwrYhgu+Ii
         088g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature;
        bh=gu95pF23KXpeLehiVz6mNLapSFgE5P4v7KnNeSZMf/Y=;
        b=FIXlStMFGf/B1MjOBSrn6sJQD2eKnFJUWDy+5fWjOYVuGJu/+TZsvAAWpES+B6dWg3
         K+IgWkU0iQ0aVWwyCbPq/3cR3zky4P/uwkojt3xC8q7neM2WcxCYUgY3mwZ824cQ1kc5
         s5/4CGfFBRDwE9Z7h6Ih5BpnMMd+/sQSEpMjzXUxs8vitoDwHwEbVMPlVS1m/gnL5C7R
         QPr4iDWK8IxLbsygez6c0TJh5khoUl+iGSv46JkaP9lKuRGf13nN3kG/YiLUZhGVa0Y1
         eUEbOrQGRhoc2CobuHMS0QZm7zVA5HLtWJ8ApW99wK6IjFvO7YSU4r+G8GIZXSSK5SAe
         7ygg==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qccesdkim1 header.b=LkP0ph+i;
       arc=pass (i=1);
       spf=pass (google.com: domain of tsimpson@quicinc.com designates 216.71.140.77 as permitted sender) smtp.mailfrom=tsimpson@quicinc.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Return-Path: <tsimpson@quicinc.com>
Received: from esa.hc3962-90.iphmx.com (esa.hc3962-90.iphmx.com. [216.71.140.77])
        by mx.google.com with ESMTPS id y26si13177214edm.375.2022.02.02.17.45.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 02 Feb 2022 17:45:27 -0800 (PST)
Received-SPF: pass (google.com: domain of tsimpson@quicinc.com designates 216.71.140.77 as permitted sender) client-ip=216.71.140.77;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qccesdkim1 header.b=LkP0ph+i;
       arc=pass (i=1);
       spf=pass (google.com: domain of tsimpson@quicinc.com designates 216.71.140.77 as permitted sender) smtp.mailfrom=tsimpson@quicinc.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
  t=1643852727; x=1644457527;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=gu95pF23KXpeLehiVz6mNLapSFgE5P4v7KnNeSZMf/Y=;
  b=LkP0ph+ib/vmIQ3RtXGjK7SoZbERoP3MwE76mKhcKePW7cVcinNgrG5S
   ju6aoafd/XLLzJVwvHUoFnlRk9xHxFEbL+YAnAqzFJtXw1FBpmSjd99zu
   6lbrQb+AyveO19QNWYC5/EN/i8ZNbS1HieML4fPl4geBf6OXY3a6h4WKs
   g=;
Received: from mail-sn1anam02lp2041.outbound.protection.outlook.com (HELO NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.41])
  by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2022 01:45:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YTNO52TrsjsuY3Tbsqi5CYAvWkos5tMyZbyDUrdeItGlUaTCOxN0s3LVX6aMn42dTQ1ks8f8PDFL6GaVOppaFQAW4FGORmNxFueSUbeazJnvcxki0F6TEbIKAgjl4i/bm+IJbkFcukWGecicAdx/Mw3hUka34tQDkAZm17uloMYx90ONRtHVaQAf8dSQ9a27yKChicEIxnrEBhV3C7S2M1rKioZWjOlNOmsPimCrVvvhJgPUENee9dwoSV6fmDy5ztmKL1B8Fjo/dDE21x5xwCe7Dj/IuJ8nJUTcUFxhH0bqW3Alw0CgVoWuwlK8w/PHX4YVMhOmD0EF4q435FJn0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gu95pF23KXpeLehiVz6mNLapSFgE5P4v7KnNeSZMf/Y=;
 b=GDg806VnRGXwk1xuzdHCrROZKTVHyaG6KNjAXgee64dbBoncLo9VQqlSpq6rTQg4tfFeI3y7d9Y7TZ4G3Ph7NhyT0N0WMAaI0bwu7FDj/nfziScWk0oWAaCtCUTrrgzS1CJCPvRB6fE1PZUiNNrqqA9xFFSSMg5SV92h8IzDacjZ/ihk1699tSH2hSQNmHDXXuq+Rq/9+7Rd/EZJvCAKNNof2gPaDwncksqYxcXtugqy5aEoM4dslZ4kckMJBHW8wWMmr0XnWpS/tczvGWXJIymIHT5azIs/Tcgm6qvrdE9C0Kj3FlmSeU2tsmWVIicLTiG50VTiTno9+/xOf3w/NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by SN4PR0201MB8757.namprd02.prod.outlook.com
 (2603:10b6:806:1e9::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 3 Feb
 2022 01:45:23 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::2016:dd39:b081:9dd4]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::2016:dd39:b081:9dd4%6]) with mapi id 15.20.4909.019; Thu, 3 Feb 2022
 01:45:23 +0000
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
Thread-Index: AQHYGHGJHyYvQ8C+vki+6vd1G/AKz6yA5OuAgAApILA=
Date: Thu, 3 Feb 2022 01:45:23 +0000
Message-ID:
 <SN4PR0201MB8808B91BF0F27E376C1872AEDE289@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20220202191242.652607-1-alex.bennee@linaro.org>
 <87k0ecvoxu.fsf@linaro.org>
In-Reply-To: <87k0ecvoxu.fsf@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c1e90b86-9c7e-4c9f-3e9d-08d9e6b6d848
x-ms-traffictypediagnostic: SN4PR0201MB8757:EE_
x-microsoft-antispam-prvs:
 <SN4PR0201MB8757E5D4D7F42CA5EE906AF4DE289@SN4PR0201MB8757.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 1ckcc+1qIBy9kIOqDRZBgJli9XHooNhaDtAeXo7dT6tTZ1CJs+Q8b+r3ogEWj1y6SE286F6QS5TMsIlarEyCarb1PKghmTNhVIvJcIQTXcHbpLoSMXaydND52oJB7D10nO+R6KWn4PLpyqVV7GQHjQ8mZVSJJxtdMnb9cdSd0Ydgtg884ix8lcUK6UnJtqQtxRBEbyIon6pzy1FzG9t5GxVF3rOtd/gibAmpGH+aJZylfi7JHkKoZfdZs/2i1JCB+38t1XaQNIwVKj72CBMq2P6Fl0yL0qJKZzsEzYBAK+52YQPiCDOJ1Kf4SeVMphF3O8qI9uj9BO5c7+RKNCzi3OOXJwXJW+pXa1IE3i4sGfGxroX9cQHCRqkA5lsO2w0K1KPojHKlyMu+eV/but1oYRZlq/J45dZ1F2DYI+c43/TJZTnUWibQn1qqiVwTlkK/rMNxXeULj+uULS4RqH/gXtbUizMS20AbJgSAcsitVCHbJm9+XVO6BUlByDat0B3qLWtnDSgpIKvI40qEDkLxZN1WnggedOAhEHEf1Z216fSVG67j4NOpnQs5Y6Eo1yiXCcQRPVjKZH66E1HNqXXROu4+ghQ49Xf2pbKfLahujqKf0bRr9qDUq3xQXni2IxjXPjOr5wNLNPxZOyvb8cznusKe7QuNHh7lMRoSEHF4iUpZJidr8JHmoFbRaiHHDE1Ct4O0vyPpKQsec9e7PrpHRg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0201MB8808.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(7416002)(122000001)(38100700002)(2906002)(6506007)(110136005)(52536014)(316002)(508600001)(38070700005)(71200400001)(53546011)(9686003)(7696005)(55016003)(33656002)(8676002)(86362001)(76116006)(66556008)(54906003)(8936002)(5660300002)(4326008)(66946007)(66476007)(83380400001)(186003)(66446008)(26005)(64756008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Y0pseUtpNFdRM1RUUXU4SFI0Y1ZPVjdmVHdMdEZialpXaTZ0cVlmS1ZLSVl1?=
 =?utf-8?B?RnhRS0l1SjF6bTNxYlFHL1NyOFJPSStEeTFzWmIvR1YzNjROb1RteHV3bVRv?=
 =?utf-8?B?MUdaRnM3Q3gzQnhNME1oR3dORTdyL0xBanhDVVM5UGZlRHp3aWxwZHJETFVn?=
 =?utf-8?B?NkZBb2EwMHBvMU8vYUpSUGFaVzJVYjVjbVdlRXJVaUJyTTlyZU9JNms5M1ZY?=
 =?utf-8?B?WGkxNDlDMW0xaFB4YkxoQVp4anhhdUlGQnJHbzgzbTRFMGg5YitMMlhPbkhE?=
 =?utf-8?B?M2E3dGhUMlVRM01rOHJqbUh5ay9YOGhWZnhOcWFXZUFMK3pvKzhhOHZVWlcz?=
 =?utf-8?B?M1VMcEdoSkdjM2tyTEF3R29JM3pZa3dSSGZ1YWxtaWg5VFp2OElWWDQvTnpu?=
 =?utf-8?B?VElEZWwzMFRuVFhrQUg5ZWNmMDRHVDdleXJuVi9ETnp5YXJnZ3MvTjFKWHNZ?=
 =?utf-8?B?N2tjMWMxVUdPdkRxOWdHVjE0SHBkbVNlbTB1RVZqOXZYbWxlZjFUMlBhb08r?=
 =?utf-8?B?d0F2SkV6ZlZqU01SRWRaaitzSHYvVU0xZXZiaVdBRGtGNStqMkRtc1RPd1ox?=
 =?utf-8?B?SElZWWlqSG9ubmNNU25JcStKcjFLTGI3aUkzbWtxUEYyVklTUFpLSmpsOW9m?=
 =?utf-8?B?b1RxYVZEdnkzV0Q4UnBib2tVMWYwbjVZWnp2c2ZLcXVrbVZsbUtrZmlUV081?=
 =?utf-8?B?TmpoNloxZUdiOVpVcy9PRFNzNE1DRmhSTVNxeWxUR01rd2FENFVVMmZPdkpp?=
 =?utf-8?B?TmVhdGNINHVhSEFsOTFSYjRORFljbVp6OXE3b1kraUxhWEVKSzg2dVRnUjdV?=
 =?utf-8?B?cmpuY1Bua3dTNlNVTThpTkJlWkRSM0hZK08zYnhIZEx0ZGFSdWU3N0diZWNm?=
 =?utf-8?B?Mk5jWlpqYVJqUHBFV213QllxOUVMbWh3QWRRSEk2cjFJWitOc1J4WTdUTUpJ?=
 =?utf-8?B?b1lCOFo5YW5ZNHEweEJjSzdsc3g1S3d3SExNQjc5MUlrSEs5RmVQVENQRkNw?=
 =?utf-8?B?WklxaXNVbUp1TU8zdXBrZnZFKzRMdjhBUG8vQWlTWXJuSEtnRXFGZXZkQWNi?=
 =?utf-8?B?aytpVVYwMU9iUDJ2SjE4SzltQ1hIbi9BRWJHdVZNOU42cnlTdmgrYkUzcUtV?=
 =?utf-8?B?c1JJMFpLeVI0TEU5TmpYQ251Y2NndVNJVWNVdHBUUVdzMVltSndhdEducFh4?=
 =?utf-8?B?dTdJSk1EdzVnaFZyVU5MREh4dklvdEhyQzBtU1RybElUOXJ3WG1Kam5qK0Rv?=
 =?utf-8?B?dVB6TWlZLzlhdnJnOEpjNVovd3BRNU54eC9FRzlRNS9CWHNOVjlWK3lJaHlT?=
 =?utf-8?B?bW9iZ0sxUXM5bThKRERKTWpnSzgzRmx6R1kvSEdLVTlCM3ZkY3UrdmRyWksv?=
 =?utf-8?B?SE4zRWV0RjdTRCtudURQNnJkdTVjZ1l4UGM2dE5HQ0NCNjBBRlRlaTAwN3Ru?=
 =?utf-8?B?TG9qTlE4b2o2UUVEemxTOVFMYUhzNTl3ZmM5SGx5WHdFY2U3R2NCaG5qTnZt?=
 =?utf-8?B?N1JpMytGMWRpQ0FwYXNhV0lOUUpMS1Uvd0FPS1pCOVdONlV2NENzME9sTWZl?=
 =?utf-8?B?eWJ0ZDlTRXg1S29HUEs1QVZtZE9ldm14NWdjaVBtVG4xYWlWMnIxcWt4U3h0?=
 =?utf-8?B?U25Qc0J0MVR0dmxNSXQvYTAzRTZ1QkVlU29WbENLdm0xWDZTWDBuc2t6dlVZ?=
 =?utf-8?B?NnN2Sld1NkxHUDMreXFpalNZK3h4czN4Q3pPT2pyOHNZcnRyM3hJRnhEa0tT?=
 =?utf-8?B?bG9GQ010cFkzK3ErZWpZVmpLc0dsajlEenp2N1IwWWZIYXVnSjJ1Z3dkeDBH?=
 =?utf-8?B?VGhwT1U4N3FJbjFtZE1ROUNud3NlODlGUGhYc3dvNzI2ZEpXOGt6TmJrd1Nr?=
 =?utf-8?B?RXE2VkV2ak9kTmliekNMRERlb0hQYTdPRUdxaFdaUFAwazMxSDN2QVFBZVlG?=
 =?utf-8?B?bk9kUWk1dy8xcVNkOTByQ3VnQTR2djc5ZDdFb1pFbVE3MlJtaGxZSWY3SGN1?=
 =?utf-8?B?YWpYSU1RYko0SnNpM2VIMDhBTVFJcWRWSG45am8wMSthc2VNVnNkSXpFZkRH?=
 =?utf-8?B?QXprd2I5ZXRld2pvVy82aHRhYWNMaWgvL0VvRzB3QjBmWXFudy8wYlhWZkRI?=
 =?utf-8?B?c2ZJTnlRZTJnVzBxWXBTSHkyME0vRFdLUkZyVWpnOW5maENGTDdldVJScWJa?=
 =?utf-8?Q?iZf3UgbtGlALMsCb4WX9/1w=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1e90b86-9c7e-4c9f-3e9d-08d9e6b6d848
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2022 01:45:23.5748
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Fajgbu1G++3PBb2afzG2dGr1fh69I70CtDWNa0fJXnL2au+5Mj5W57aLBtdgYU3wzirShseVGjJTCK5zlwNk1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR0201MB8757
X-TUID: 88l3OPgkdssl

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEFsZXggQmVubsOpZSA8YWxl
eC5iZW5uZWVAbGluYXJvLm9yZz4NCj4gU2VudDogV2VkbmVzZGF5LCBGZWJydWFyeSAyLCAyMDIy
IDU6MTYgUE0NCj4gVG86IHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc7IHFlbXUtZGV2ZWxA
bm9uZ251Lm9yZw0KPiBDYzogcWVtdS1hcm1Abm9uZ251Lm9yZzsgZmFtQGV1cGhvbi5uZXQ7IGJl
cnJhbmdlQHJlZGhhdC5jb207DQo+IGY0YnVnQGFtc2F0Lm9yZzsgYXVyZWxpZW5AYXVyZWwzMi5u
ZXQ7IHBib256aW5pQHJlZGhhdC5jb207DQo+IHN0ZWZhbmhhQHJlZGhhdC5jb207IGNyb3NhQHJl
ZGhhdC5jb207IEFsZXggQmVubsOpZQ0KPiA8YWxleC5iZW5uZWVAbGluYXJvLm9yZz47IFRheWxv
ciBTaW1wc29uIDx0c2ltcHNvbkBxdWljaW5jLmNvbT4NCj4gU3ViamVjdDogUmU6IFtSRkMgUEFU
Q0ggMC80XSBpbXByb3ZlIGNvdmVyYWdlIG9mIHZlY3RvciBiYWNrZW5kDQo+IA0KPiBBbGV4IEJl
bm7DqWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+IHdyaXRlczoNCj4gDQo+ID4gSGkgUmljaGFy
ZCwNCj4gPg0KPiA+IFdoaWxlIHJldmlld2luZyB0aGUgVENHIHZlY3RvciBjbGVhbi11cHMgSSB0
cmllZCB0byBpbXByb3ZlIHRoZSByYW5nZQ0KPiA+IG9mIGluc3RydWN0aW9ucyB3ZSB0ZXN0ZWQu
IEkgY291bGRuJ3QgZ2V0IHRoZSBleGlzdGluZyBoYWNreQ0KPiA+IHNoYTEgdGVzdCB0byB2ZWN0
b3Jpc2UgbmljZWx5IHNvIEkgc25hcmZlZCB0aGUgc2hhNTEyIGFsZ29yaXRobSBmcm9tDQo+ID4g
Q0NBTi4gVGhlIHNoYTUxMiB0ZXN0IGlzIGdvb2QgYmVjYXVzZSBpdCBpcyBhbGwgcHVyZWx5IGlu
dGVnZXIgc28gd2UNCj4gPiBzaG91bGQgYmUgYWJsZSB0byB1c2UgbmF0aXZlIGNvZGUgb24gdGhl
IGJhY2tlbmQuIFRoZSB0ZXN0IGFsc28gaGFzDQo+ID4gdGhlIG5pY2UgcHJvcGVydHkgb2YgdmFs
aWRhdGluZyBiZWhhdmlvdXIuDQo+IA0KPiBIaSBUYXlsb3IsDQo+IA0KPiBZb3UgbWlnaHQgd2Fu
dCB0byBjaGVjayB0aGlzIG91dDoNCj4gDQo+IOKclyAgLi9xZW11LWhleGFnb24gLi90ZXN0cy90
Y2cvaGV4YWdvbi1saW51eC11c2VyL3NoYTUxMg0KPiAxLi4xMA0KPiBub3Qgb2sgMSAtIGRvX3Rl
c3QoJnRlc3RzW2ldKQ0KPiAjICAgICBGYWlsZWQgdGVzdA0KPiAoL2hvbWUvYWxleC5iZW5uZWUv
bHNyYy9xZW11LmdpdC90ZXN0cy90Y2cvbXVsdGlhcmNoL3NoYTUxMi5jOm1haW4oKSBhdA0KPiBs
aW5lIDk4NikNCj4gbm90IG9rIDIgLSBkb190ZXN0KCZ0ZXN0c1tpXSkNCg0KVGhhbmtzIGZvciB0
aGUgaGVhZHMtdXAuICBJJ2xsIHRha2UgYSBsb29rDQoNClRheWxvcg0K
