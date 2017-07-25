Received: by 10.25.44.15 with SMTP id s15csp86672lfs;
        Tue, 25 Jul 2017 14:53:11 -0700 (PDT)
X-Received: by 10.98.158.194 with SMTP id f63mr20439283pfk.288.1501019591246;
        Tue, 25 Jul 2017 14:53:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501019591; cv=none;
        d=google.com; s=arc-20160816;
        b=UhFFo8dY60IDFyZfIT8jMfQeMgcIIa3Gc2WkLXXdqreWmuitIa0B9t29rueqRcCP0j
         nPZA5BOV2M+pgICICxr8052em6l5ZtDGG1jUo2f35eXzkFQQCdNq4goi8jmLwqKXAMJl
         zfpqsBM+ImznXRAzU14vMuHn9wk/XHVH8drTtAbxXhEcqVj9JtQMwXMJqsdFv1SzwrIL
         m8HwhK3CCGOFL9PrxJ7q1+4eIIOWkXpx4g01e0xb1kKzQ7zE9DIMjndV04nTJCRSLidX
         dJl/RQYo80fNkoNfxMwF2TInHLcuGzxa5W3cPj4XV8Y13FKE4PMaf6DhYD2dblPy2Fj1
         lHzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:msip_labels:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:cc:to:from:dkim-signature:arc-authentication-results;
        bh=IKRrB0FqjajiYYKwjl1linvSukv4k7HzreCkEnFBR/M=;
        b=O1TrM7GoQcJ01+6e9gmMFOQKWU8wH9Fb4i9uiDHiJ/F12Uq9+CzvyosfZia9FP7G6D
         OharOQJ03j9JgT3H0dmwNpga9EKWF3QpUJYNLLS+TRVuHH/yVeDwcbNeYm/iuQ4f6o3A
         smpWrsVF1A5tbym8AGpwaWVXIqnBu7p7Bq0tbde7Xa991Ke9oiAroWG+wSRzxoprhArj
         kgLnrQOoaasRNggZDyXVSeqLCHX7DIoiwJnquidQl8l/8PjhKISHTDJ4MtMIvwCEs8pE
         q++c/kucVrglZn/zy7P0C609pDHQzH4VS6vzbhaJPC6d5OMwqysvZMnEzLAHcZXm5ph9
         JFIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@microsoft.com header.b=WOhsGCC1;
       spf=pass (google.com: domain of andrew.baumann@microsoft.com designates 104.47.32.106 as permitted sender) smtp.mailfrom=Andrew.Baumann@microsoft.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=microsoft.com
Return-Path: <Andrew.Baumann@microsoft.com>
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (mail-sn1nam01on0106.outbound.protection.outlook.com. [104.47.32.106])
        by mx.google.com with ESMTPS id y69si3187549pfj.15.2017.07.25.14.53.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 25 Jul 2017 14:53:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrew.baumann@microsoft.com designates 104.47.32.106 as permitted sender) client-ip=104.47.32.106;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@microsoft.com header.b=WOhsGCC1;
       spf=pass (google.com: domain of andrew.baumann@microsoft.com designates 104.47.32.106 as permitted sender) smtp.mailfrom=Andrew.Baumann@microsoft.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=microsoft.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=IKRrB0FqjajiYYKwjl1linvSukv4k7HzreCkEnFBR/M=;
 b=WOhsGCC1Ba3v1gjmRO5GAb4HI/S7omfWvFiktWPKvcfuHOJJnbEeyhsYUJIm4eOyUeIRYJvGYaBWV/ENHpTXodMY1pb3Qq05hVnXf/5wESRU3mASg/3wUVujwoKrXeSQWp44iMiRujKpz4dWoBBIwxwm0RNI9BzMtz9iNUm2cRY=
Received: from DM2PR21MB0060.namprd21.prod.outlook.com (10.161.140.26) by
 DM2PR21MB0105.namprd21.prod.outlook.com (10.161.141.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1282.2; Tue, 25 Jul 2017 21:53:08 +0000
Received: from DM2PR21MB0060.namprd21.prod.outlook.com
 ([fe80::dcb7:af0:9415:d7f2]) by DM2PR21MB0060.namprd21.prod.outlook.com
 ([fe80::dcb7:af0:9415:d7f2%17]) with mapi id 15.01.1304.010; Tue, 25 Jul 2017
 21:53:08 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: Richard Henderson <rth@twiddle.net>, "Emilio G. Cota" <cota@braap.org>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org"
	<qemu-arm@nongnu.org>, Andrey Shedel <ashedel@microsoft.com>,
	=?utf-8?B?QWxleCBCZW5u77+9ZQ==?= <alex.bennee@linaro.org>, Pranith Kumar
	<bobby.prani@gmail.com>
Subject: RE: [Qemu-devel] Torn read/write possible on aarch64/x86-64 MTTCG?
Thread-Topic: [Qemu-devel] Torn read/write possible on aarch64/x86-64 MTTCG?
Thread-Index: AdMEr5d6ACtDBuctTTu22oYjpWuKdAAE386AAAFgkIAAMYX7wA==
Date: Tue, 25 Jul 2017 21:53:08 +0000
Message-ID: <DM2PR21MB00602DE4F811D886C5E5C75C9EB80@DM2PR21MB0060.namprd21.prod.outlook.com>
References: <DM2PR21MB0060EFC1F6B9F0883A1792369EBB0@DM2PR21MB0060.namprd21.prod.outlook.com>
 <20170724212327.GA24963@flamenco>
 <fda73f35-098f-c190-4d15-4363e28872f1@twiddle.net>
In-Reply-To: <fda73f35-098f-c190-4d15-4363e28872f1@twiddle.net>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Ref=https://api.informationprotection.azure.com/api/72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=baumann@microsoft.com;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2017-07-25T14:53:06.6966883-07:00;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic;
 Sensitivity=General
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Andrew.Baumann@microsoft.com; 
x-originating-ip: [2001:4898:80e8:f::5ef]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;DM2PR21MB0105;7:OQoKSwh455odpJ7jU4RkZ89MoJqt2e9/Z9ESTxjus3RpF6Dsei9822Y2L7qk2Jxy1nBqTsba80RekmcdsyiweI8N6z9t8rR/6fo2aB4bLNxxlFG2G+SlZcye6WIqN3S8JFJeUDRzwdB2WoU4E6FE4/7YWSrGhBWDEjHy42/J7cdUZm+/gu7Z9BvOqw3nkQ2HAS0NwXL5STYqifzw1a75KEiua9/m7Yk5aPeXceJI3QdgNiHILaZsNzYo/7VUSlOMnYkbOD+m5/II+DzpDCeAnjkCOqKS2oDXUqvuWEMFY5SYFfm/cXCP6GsjjFDyMKyhLpYAjEihkJGOMM7+FjXiN0gdVsO6znSVyx4Opw8aRqBky9OnfAueyFPgN7DL3GORSGfNycyFZZq7JCpSI/Yuj3GBao3edueQReUqTg5S38OiCSDO1NotAvvcCOy8C+Sx1GpImCV7nC8TjDxSEmbrt5A+0t+JS+bOmbVUDUGhlvFKz1VNXWx83hThWkk9V3jOW1jwtjkY1sswCfpPhj0IApUtcCOxAv7T4qNGoL7YNoALkvOYM4XAc75MMxPVNHk57XU2aJG2euMOPrgOz/NLcZT6pb9oamhJXFV0RFjm3ZNsLPjVU4/axnCVY+RBU4bFHy8n5pMfrUg1Ufm8ZufiB7NK/5YOVCrJKz4HMs0vHZ7EAiGGPXEEU6kZ/E5bQn8QlW9l+5fatOrJj00D/hwR7BU5JkEGKoVTy9x+1gO0n/vslohZGgkivYTaeOnhlqXudEuX80UqOTl1iLv/lFNId8sY6SxV5sk+tmCNKiYBN5hbOLLa10g8QBF8PqY5+XpL
x-ms-office365-filtering-correlation-id: 49fe0df8-cabf-4462-7be6-08d4d3a78995
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254088)(48565401081)(300000503095)(300135400095)(2017052603031)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);SRVR:DM2PR21MB0105;
x-ms-traffictypediagnostic: DM2PR21MB0105:
x-exchange-antispam-report-test: UriScan:;
x-microsoft-antispam-prvs: <DM2PR21MB01054412BED738BB304EB8029EB80@DM2PR21MB0105.namprd21.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(61425038)(6040450)(601004)(2401047)(8121501046)(5005006)(3002001)(100000703101)(100105400095)(10201501046)(93006095)(93001095)(6055026)(61426038)(61427038)(6041248)(20161123555025)(20161123560025)(20161123562025)(20161123564025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123558100)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);SRVR:DM2PR21MB0105;BCL:0;PCL:0;RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);SRVR:DM2PR21MB0105;
x-forefront-prvs: 03793408BA
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(6009001)(39450400003)(39400400002)(39840400002)(39410400002)(39860400002)(39850400002)(47760400005)(24454002)(199003)(53754006)(189002)(377454003)(51914003)(53936002)(5250100002)(9686003)(68736007)(72206003)(478600001)(8990500004)(39060400002)(106356001)(99286003)(55016002)(53546010)(105586002)(2950100002)(4326008)(54906002)(14454004)(10290500003)(6506006)(6436002)(76176999)(5005710100001)(54356999)(7696004)(189998001)(25786009)(10090500001)(50986999)(305945005)(101416001)(81156014)(81166006)(8676002)(2900100001)(86612001)(7736002)(3280700002)(97736004)(3660700001)(102836003)(74316002)(6116002)(38730400002)(229853002)(6246003)(8936002)(33656002)(5660300001)(2906002)(86362001);DIR:OUT;SFP:1102;SCL:1;SRVR:DM2PR21MB0105;H:DM2PR21MB0060.namprd21.prod.outlook.com;FPR:;SPF:None;PTR:InfoNoRecords;A:1;MX:1;LANG:en;
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2017 21:53:08.5485
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR21MB0105
X-TUID: id6WvyOICCJq

PiBGcm9tOiBSaWNoYXJkIEhlbmRlcnNvbiBbbWFpbHRvOnJ0aDc2ODBAZ21haWwuY29tXSBPbiBC
ZWhhbGYgT2YgUmljaGFyZA0KPiBIZW5kZXJzb24NCj4gU2VudDogTW9uZGF5LCAyNCBKdWx5IDIw
MTcgMTU6MDMNCj4gDQo+IE9uIDA3LzI0LzIwMTcgMDI6MjMgUE0sIEVtaWxpbyBHLiBDb3RhIHdy
b3RlOg0KPiA+IChBZGRpbmcgc29tZSBDYydzKQ0KPiA+DQo+ID4gT24gTW9uLCBKdWwgMjQsIDIw
MTcgYXQgMTk6MDU6MzMgKzAwMDAsIEFuZHJldyBCYXVtYW5uIHZpYSBRZW11LWRldmVsDQo+IHdy
b3RlOg0KPiA+PiBIaSBhbGwsDQo+ID4+DQo+ID4+IEknbSB0cnlpbmcgdG8gdHJhY2sgZG93biB3
aGF0IGFwcGVhcnMgdG8gYmUgYSB0cmFuc2xhdGlvbiBidWcgaW4gZWl0aGVyDQo+ID4+IHRoZSBh
YXJjaDY0IHRhcmdldCBvciB4ODZfNjQgVENHIChpbiBtdWx0aXRocmVhZGVkIG1vZGUpLiBUaGUN
Cj4gc3ltcHRvbXMNCj4gDQo+IEkgYXNzdW1lIHRoaXMgaXMgcmVhbGx5IHg4Nl82NCBhbmQgbm90
IGk2ODYgYXMgaG9zdC4NCg0KWWVzLg0KDQo+ID4+IGFyZSBlbnRpcmVseSBjb25zaXN0ZW50IHdp
dGggYSB0b3JuIHJlYWQvd3JpdGUgLS0gdGhhdCBpcywgYSA2NC1iaXQNCj4gPj4gbG9hZCBvciBz
dG9yZSB0aGF0IHdhcyB0cmFuc2xhdGVkIHRvIHR3byAzMi1iaXQgbG9hZHMgYW5kIHN0b3JlcyAt
LQ0KPiA+PiBidXQgdGhhdCdzIG9idmlvdXNseSBub3Qgd2hhdCBoYXBwZW5zIGluIHRoZSBjb21t
b24gcGF0aCB0aHJvdWdoIHRoZQ0KPiA+PiB0cmFuc2xhdGlvbiBmb3IgdGhpcyBjb2RlLCBzbyBJ
J20gd29uZGVyaW5nOiBhcmUgdGhlcmUgYW55IGNhc2VzIGluDQo+ID4+IHdoaWNoIHFlbXUgd2ls
bCBzcGxpdCBhIDY0LWJpdCBtZW1vcnkgYWNjZXNzIGludG8gdHdvIDMyLWJpdCBhY2Nlc3Nlcz8N
Cj4gPg0KPiA+IFRoYXQgd291bGQgYmUgYSBidWcgaW4gTVRUQ0cuDQo+ID4NCj4gPj4gVGhlIGNv
ZGU6IEd1ZXN0IENQVSBBIHdyaXRlcyBhIDY0LWJpdCB2YWx1ZSB0byBhbiBhbGlnbmVkIG1lbW9y
eQ0KPiA+PiBsb2NhdGlvbiB0aGF0IHdhcyBwcmV2aW91c2x5IDAsIHVzaW5nIGEgcmVndWxhciBz
dG9yZTsgZS5nLjoNCj4gPj4gCWY5MDAwMDM0IHN0cgkgICAgIHgyMCxbeDFdDQo+ID4+DQo+ID4+
IEd1ZXN0IENQVSBCICh3aG8gaXMgYnVzeS13YWl0aW5nKSByZWFkcyBhIHZhbHVlIGZyb20gdGhl
IHNhbWUgbG9jYXRpb246DQo+ID4+IAlmOTQwMDI4MCBsZHIJICAgICB4MCxbeDIwXQ0KPiA+Pg0K
PiA+PiBUaGUgc3ltcHRvbTogQ1BVIEIgbG9hZHMgYSB2YWx1ZSB0aGF0IGlzIG5laXRoZXIgTlVM
TCBub3IgdGhlIHZhbHVlDQo+ID4+IHdyaXR0ZW4uIEluc3RlYWQsIHgwIGdldHMgb25seSB0aGUg
bG93IDMyLWJpdHMgb2YgdGhlIHZhbHVlIHdyaXR0ZW4NCj4gPj4gKGhpZ2ggYml0cyBhcmUgYWxs
IHplcm8pLiBCeSB0aGUgdGltZSB0aGlzIHZhbHVlIGlzIGRlcmVmZXJlbmNlZCAoYQ0KPiA+PiBm
ZXcgaW5zdHJ1Y3Rpb25zIGxhdGVyKSBhbmQgdGhlIGV4Y2VwdGlvbiBoYW5kbGVycyBydW4sIHRo
ZSBtZW1vcnkNCj4gPj4gbG9jYXRpb24gZnJvbSB3aGljaCBpdCB3YXMgbG9hZGVkIGhhcyB0aGUg
Y29ycmVjdCA2NC1iaXQgdmFsdWUgd2l0aA0KPiA+PiBhIG5vbi16ZXJvIHVwcGVyIGhhbGYuDQo+
ID4+DQo+ID4+IE9idmlvdXNseSBvbiBhIHJlYWwgQVJNIG1lbW9yeSBiYXJyaWVycyBhcmUgY3Jp
dGljYWwsIGFuZCBpbmRlZWQNCj4gPj4gdGhlIGNvZGUgaGFzIHN1Y2ggYmFycmllcnMgaW4gaXQs
IGJ1dCBJJ20gYXNzdW1pbmcgdGhhdCBhbnkgcG9zc2libGUNCj4gPj4gbWlzdHJhbnNsYXRpb24g
b2YgdGhlIGJhcnJpZXJzIGlzIGlycmVsZXZhbnQgYmVjYXVzZSBmb3IgYSA2NC1iaXQgbG9hZA0K
PiA+PiBhbmQgYSA2NC1iaXQgc3RvcmUgeW91IHNob3VsZCBnZXQgYWxsIG9yIG5vdGhpbmcuIE90
aGVyIGNsdWVzIHRoYXQgbWF5DQo+ID4+IGJlIHJlbGV2YW50OiB0aGUgY29kZSBpcyBfbmVhcl8g
YSBMRFJFWC9TVFJFWCBwYWlyICh0aGUgYnVzeS13YWl0aW5nDQo+ID4+IGlzIHVzZWQgdG8gcmVz
b2x2ZSBhIHJhY2Ugd2hlbiB1cGRhdGluZyBhbm90aGVyIHZhcmlhYmxlKSwgYW5kIHRoZQ0KPiA+
PiBidXN5LXdhaXQgbG9vcCBoYXMgYSB5aWVsZCBpbnN0cnVjdGlvbiBpbiBpdCAoYWx0aG91Z2gg
dGhvc2UgYXBwZWFyDQo+ID4+IHRvIGJlIG5vLW9wcyB3aXRoIE1UVENHKS4NCj4gPg0KPiA+IFRo
aXMgbWlnaHQgaGF2ZSB0byBkbyB3aXRoIGhvdyBsZHJleC9zdHJleCBpcyBlbXVsYXRlZDsgYXJl
IHlvdSByZWx5aW5nDQo+ID4gb24gdGhlIGV4Y2x1c2l2ZSBwYWlyIGRldGVjdGluZyBBQkE/IElm
IHNvLCB5b3VyIGNvZGUgd29uJ3Qgd29yayBpbg0KPiA+IFFFTVUgc2luY2UgaXQgdXNlcyBjbXB4
Y2hnIHRvIGVtdWxhdGUgbGRyZXgvc3RyZXguDQo+IA0KPiBBQkEgcHJvYmxlbSBpcyBub3RoaW5n
IHRvIGRvIHdpdGggdGVhcmluZy4gIEFuZCBjbXB4Y2hnIHdpbGwgZGVmaW5pdGVseSBub3QNCj4g
Y3JlYXRlIHRlYXJpbmcgcHJvYmxlbXMuDQoNCkluIGZhY3QsIHRoZSBsZHJleC9zdHJleCBhcmUg
dGhlcmUgaW1wbGVtZW50aW5nIGEgY21weGNoZy4gOikNCg0KPiBJIGRvbid0IGtub3cgaG93IHdl
IHdvdWxkIG1hbmFnZSA2NC1iaXQgdGVhcmluZyBvbiBhIDY0LWJpdCBob3N0LCBhdCBsZWFzdA0K
PiBmb3INCj4gdGhlIGFhcmNoNjQgZ3Vlc3QsIGZvciB3aGljaCBJIGJlbGlldmUgd2UgaGF2ZSBh
IGdvb2QgZW11bGF0aW9uLg0KPiANCj4gPiAtIFBpbiB0aGUgUUVNVS1NVFRDRyBwcm9jZXNzIHRv
IGEgc2luZ2xlIENQVS4gQ2FuIHlvdSByZXBybyB0aGVuPw0KPiANCj4gQSBnb29kIHN1Z2dlc3Rp
b24uDQoNClRoYW5rcyBmb3IgdGhlIHN1Z2dlc3Rpb25zLiBJJ3ZlIGJlZW4gcnVubmluZyB0aGlz
IGNvbmZpZ3VyYXRpb24gYWxsIGRheSwgYW5kIGhhdmVuJ3Qgc2VlbiBhIHJlcHJvIHlldCBpbiBo
dW5kcmVkcyBvZiBhdHRlbXB0cy4gSSdsbCByZXBvcnQgaWYgdGhhdCBjaGFuZ2VzLg0KDQpUaGUg
cHJvYmxlbSBpcyB0aGF0IHRoaXMgdGVzdCBpc24ndCB2ZXJ5IGNvbmNsdXNpdmUuLi4gSSBkb24n
dCBrbm93IGhvdyBvZnRlbiB0aGUgVkNQVSB0aHJlYWRzIHdpbGwgY29udGV4dCBzd2l0Y2gsIGJ1
dCBJIHN1c3BlY3QgaXQncyBwcmV0dHkgcmFyZSByZWxhdGl2ZSB0byB0aGUgYWJpbGl0eSB0byBl
eHBvc2UgcmFjZXMgd2hlbiB0aGV5IHJ1biBkaXJlY3RseSBvbiBkaWZmZXJlbnQgaG9zdCBjb3Jl
cy4gQW5kIGlmIHRoZSByYWNlIHJlYWxseSBkb2Vzbid0IGV4aXN0IHdoZW4gcnVubmluZyBvbiBh
IHNpbmdsZSBjb3JlLCB0aGF0IHRvIG1lIHN1Z2dlc3RzIGEgaGFyZHdhcmUgcHJvYmxlbSwgd2hp
Y2ggaXMgZXZlbiBsZXNzIGxpa2VseS4NCg0KPiA+IC0gRm9yY2UgdGhlIGVtdWxhdGlvbiBvZiBj
bXB4Y2hnIHZpYSBFWENQX0FUT01JQyB3aXRoOg0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL3RjZy90
Y2ctb3AuYyBiL3RjZy90Y2ctb3AuYw0KPiA+IGluZGV4IDg3ZjY3M2UuLjc3MWVmZmU1IDEwMDY0
NA0KPiA+IC0tLSBhL3RjZy90Y2ctb3AuYw0KPiA+ICsrKyBiL3RjZy90Y2ctb3AuYw0KPiA+IEBA
IC0yODU2LDcgKzI4NTYsNyBAQCB2b2lkIHRjZ19nZW5fYXRvbWljX2NtcHhjaGdfaTY0KFRDR3Zf
aTY0DQo+IHJldHYsIFRDR3YgYWRkciwgVENHdl9pNjQgY21wdiwNCj4gPiAgICAgICAgICAgfQ0K
PiA+ICAgICAgICAgICB0Y2dfdGVtcF9mcmVlX2k2NCh0MSk7DQo+ID4gICAgICAgfSBlbHNlIGlm
ICgobWVtb3AgJiBNT19TSVpFKSA9PSBNT182NCkgew0KPiA+IC0jaWZkZWYgQ09ORklHX0FUT01J
QzY0DQo+ID4gKyNpZiAwDQo+IA0KPiBJIHN1c3BlY3QgdGhpcyB3aWxsIHNpbXBseSBhbHRlciB0
aGUgdGltaW5nLiAgSG93ZXZlciwgZ2l2ZSBpdCBhIGdvIGJ5IGFsbCBtZWFucy4NCg0KSSBoYXZl
bid0IHRyaWVkIHRoaXMgeWV0LiBJZiBpdCBiZWhhdmVzIGFzIHlvdSBkZXNjcmliZSwgaXQgc2Vl
bXMgbGlrZWx5IHRvIG1ha2UgdGhlIHJhY2UgaGFyZGVyIHRvIGhpdC4NCg0KPiBJZiB0aGVyZSdz
IGEgdGVzdCBjYXNlIHRoYXQgeW91IGNhbiBzaGFyZSwgdGhhdCB3b3VsZCBiZSBhd2Vzb21lLg0K
DQpJIHdpc2ggd2UgY291bGQgOigNCg0KPiBFc3BlY2lhbGx5IGlmIHlvdSBjYW4gcHJvZCBpdCB0
byBoYXBwZW4gd2l0aCBhIHN0YW5kYWxvbmUgbWluaW1hbCBiaW5hcnkuICBXaXRoDQo+IGx1Y2sg
eW91IGNhbiByZXByb2R1Y2UgdmlhIGFhcmNoNjQtbGludXgtdXNlciB0b28sIGFuZCBzaW1wbHkg
c2lnbmFsIGFuIGVycm9yDQo+IHZpYSBicmFuY2ggdG8gX19idWlsdGluX3RyYXAuDQoNCkluaXRp
YWwgYXR0ZW1wdHMgdG8gcmVwcm8gdGhpcyB3aXRoIGEgdGlnaHQgbG9vcCBmYWlsZWQsIGJ1dCBJ
J2xsIHRha2UgYW5vdGhlciBzdGFiIGF0IHByb2R1Y2luZyBhIHN0YW5kYWxvbmUgdGVzdCBwcm9n
cmFtIHRoYXQgd2UgY2FuIHNoYXJlLg0KDQpBbmRyZXcNCg==
