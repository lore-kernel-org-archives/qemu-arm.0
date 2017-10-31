Received: by 10.223.161.27 with SMTP id o27csp3534907wro;
        Tue, 31 Oct 2017 03:28:46 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+TyCOmQihKI0eUeOcFpBmVrB5nZUOa6fhrnWj2EhwfF6bGGadkUpA08/jlCNxdGQlY7hxy+
X-Received: by 10.37.128.74 with SMTP id a10mr814981ybn.497.1509445726132;
        Tue, 31 Oct 2017 03:28:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1509445726; cv=none;
        d=google.com; s=arc-20160816;
        b=BCRrcsGy2aXmobHQWoxEnWiEx2mKvZDGyPQ8lWA0/ej6x8SuLSKG2pJdyHtNVQjd7D
         f22r1Fy2rZ2IL707mhv8hX7MJSEeX5Hz4D4AB118sLWH7F7JrJmLDt7i2UpxFHjAkEXN
         Pru7oB9FoR//Q2ts8lc2GeRFgP8qpydLa9qTv3Mx48i5oNHXJIcC25ydUBokhd25REzw
         A3V230ieFQOGzn0ADfWpzwDIqKkuhB/JdjNRvgknO0q/67zdeqmMD39rSWdOKPDWdVJc
         ggznCIJlbfehxW/7cehVWw4Yz3ruz3JIsjp72fmLPgIHEjwOwFv8gwSN2zrAtyNNbKNh
         OQ2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:from:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:subject
         :mime-version:content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:msip_labels:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic:to
         :dkim-signature:arc-authentication-results;
        bh=RboWF/tXYcu6MCD8w8A/kWMeka2LjlavJg0zQD/qCwo=;
        b=hBOkE72fk8zlYbncHO2pZmEKrovKt88C5k7WnUeNDvnPW5dD8pQuy1Ko7GFctiu89d
         G9Hx4QX0cvXVh3F4eTRH+qhh9qynjwmJx8p1r8SuDBAraGU+WAiiDWYiaHTKxt7GHSB0
         ZakPJzPhbHH6TdT1qU0cXkA+lXx375QKDZckdrGJ6lBDdIX3JoNfQDz9SgfW3CX0eg6F
         iJ0neT2bl+szKRevAw/r8O9hRRRDfSo6oocLcNOfp+RqggGxHVEVWzIoIqnVLcXtVAyN
         PlNgOA/t3h4CjCYA3901XxIWqcjRwlh72/xqDqTYmlnDqIvTuLFGrayTYKhyW8wm3cQU
         fVuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@microsoft.com header.s=selector1 header.b=U0/S+4e/;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e70si357637ywh.272.2017.10.31.03.28.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 31 Oct 2017 03:28:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@microsoft.com header.s=selector1 header.b=U0/S+4e/;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44604 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e9Tmn-0001zO-Je
	for alex.bennee@linaro.org; Tue, 31 Oct 2017 06:28:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49464)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1e9Tmh-0001z4-0B
	for qemu-arm@nongnu.org; Tue, 31 Oct 2017 06:28:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1e9Tme-0002P4-CE
	for qemu-arm@nongnu.org; Tue, 31 Oct 2017 06:28:39 -0400
Received: from mail-sn1nam01on0117.outbound.protection.outlook.com
	([104.47.32.117]:25247
	helo=NAM01-SN1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Andrew.Baumann@microsoft.com>)
	id 1e9Tme-0002O2-0l; Tue, 31 Oct 2017 06:28:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
	bh=RboWF/tXYcu6MCD8w8A/kWMeka2LjlavJg0zQD/qCwo=;
	b=U0/S+4e/i8scLfG1++j75scweAogGi8I/Zihjgwwhfw3Y1VTEFCQUjx4eiE3N8/dkHJVxU8b4Ov5hfWaIpWvzR+nTruH/J5I++CyYxiPiOzJBdwdh9rxP7qUQ28Wn7u6XUfQXce7eMuXTyqQ/f+6LAJjKnN0mTRyxoF+wxWlmOk=
Received: from MWHPR21MB0159.namprd21.prod.outlook.com (10.173.52.17) by
	MWHPR21MB0126.namprd21.prod.outlook.com (10.173.52.8) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.20.218.3; Tue, 31 Oct 2017 10:28:34 +0000
Received: from MWHPR21MB0159.namprd21.prod.outlook.com ([10.173.52.17]) by
	MWHPR21MB0159.namprd21.prod.outlook.com ([10.173.52.17]) with mapi id
	15.20.0156.005; Tue, 31 Oct 2017 10:28:34 +0000
To: Peter Maydell <peter.maydell@linaro.org>
Thread-Topic: [PATCH v2] arm: implement cache/shareability attribute bits for
	PAR registers
Thread-Index: AQHTSe1g2erorUvJcU22oGgDep+lmKL81dGAgABYD5CAAJpwgIAACSfg
Date: Tue, 31 Oct 2017 10:28:33 +0000
Message-ID: <MWHPR21MB0159D0542A55A8B36EB2B4509E5E0@MWHPR21MB0159.namprd21.prod.outlook.com>
References: <20171020214918.18944-1-Andrew.Baumann@microsoft.com>
	<CAFEAcA-bW6CtLTN0omLoL7x7r996rY9BS1MvH4KdfS-2z6g1LQ@mail.gmail.com>
	<MWHPR21MB01591265BB44E18E19B910879E5E0@MWHPR21MB0159.namprd21.prod.outlook.com>
	<CAFEAcA-oEu+bOHFp_vHKALnnkK=krP_1pMoar5t=MqY24JHRtA@mail.gmail.com>
In-Reply-To: <CAFEAcA-oEu+bOHFp_vHKALnnkK=krP_1pMoar5t=MqY24JHRtA@mail.gmail.com>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=baumann@microsoft.com;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2017-10-31T10:28:30.9726441Z;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft
	Azure Information Protection;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic;
	Sensitivity=General
x-originating-ip: [116.246.28.225]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR21MB0126;
	6:91pz7T1cE9Zwgd/xMQIRRuF4YXzp3oUd8fZv8+EA6JlUclTm33M2djCxT4lQU0Mc1lMei7Tu98zbGCW2vf/MSaxY6QefgtjjtOcCm1kdC+kW560Qeb6xmj1UE3KYTJcyQ3L+RdWGenp4VqLNW/gGAqBhgIzFCP7bLcaUpl+tX/ZFzdgifAmhDKwy7Lmt1va0uK3elBbcSdNn71z82OrUg3/AQwuGQYoKLApefO77a5jrMFdx+UIA+C3qgSpUUJv1rc3dwVYxoyN51ahruRMC5u26bpghrc4hjXWFgkC0i438ZHwN2TGk7yrL4V3hqVJjqPkgBgDKvI+Cvsh88RyCS2rFTVDL+/wcjwnIkp6Eadg=;
	5:6X0EmPLWcqmqV6FrCsQYUI9hTZnnrnPnHoaIAx3yxPowKqYNljsjWeC+hMHRMR/Zlh55tXFezs5qVR2jg+Y/X+jJdCZPRTlEtdGLOHxjH9lSVtZPNtjgku1pnmK7dg+61cQLbXclOictKFOYuGxQxUvCUvm6PQ7ugyKyl+eV5S4=;
	24:ISSwBsNngLbRXw4rzb6Lba7/HboxiL16VCWgf5CB+1T1AsUh/SDhVDwAE/N4/5BnNT4bNXPD4NsOCjG/DIY5cY5tJLwfjYmLIiGhVtGjbpQ=;
	7:qOSzctCphUCMgegMk7muTlhAPh+icUyTRg6uXD8OPVnyed17F5/z81KnCG27C7qGM7vktOr5M0M2dk4NAF78fh7heUdKTnyJvyWBzQtU+DrvtMpZrOSNfvkLSLC/iwbBw9JIzfmyIrDhuzC3UqvJcrg1BIgSA/p5bf3826k9F29OocRKEsWDhtJFQAJ4B2N6hJ3RIw3MmufjgpeQztg12tLpcPpXTsTSUd3hqeG6KAKQhfGtE2smEEnPXUlRZeNK
x-ms-exchange-antispam-srfa-diagnostics: SSOS;
x-ms-office365-filtering-correlation-id: 767686aa-3a06-414f-b12b-08d5204a23bd
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(48565401081)(4534020)(4602075)(2017052603238);
	SRVR:MWHPR21MB0126; 
x-ms-traffictypediagnostic: MWHPR21MB0126:
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Andrew.Baumann@microsoft.com; 
x-exchange-antispam-report-test: UriScan:(89211679590171);
x-microsoft-antispam-prvs: <MWHPR21MB01266383AAE669BB80DBAEBB9E5E0@MWHPR21MB0126.namprd21.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(61425038)(6040450)(2401047)(8121501046)(5005006)(93006095)(93001095)(3231020)(10201501046)(3002001)(100000703101)(100105400095)(6055026)(61426038)(61427038)(6041248)(20161123564025)(20161123560025)(20161123555025)(20161123562025)(20161123558100)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:MWHPR21MB0126; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:MWHPR21MB0126; 
x-forefront-prvs: 04772EA191
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(376002)(346002)(39860400002)(47760400005)(189002)(24454002)(199003)(51914003)(101416001)(8936002)(33656002)(3660700001)(10090500001)(3280700002)(76176999)(54356999)(2906002)(6246003)(72206003)(25786009)(4326008)(50986999)(53936002)(10290500003)(9686003)(99286003)(2900100001)(55016002)(478600001)(68736007)(106356001)(189998001)(8990500004)(53546010)(305945005)(7736002)(229853002)(86362001)(105586002)(2950100002)(6916009)(7696004)(74316002)(5660300001)(14454004)(8676002)(66066001)(81156014)(81166006)(93886005)(97736004)(54906003)(3846002)(22452003)(316002)(77096006)(102836003)(6116002)(6506006)(86612001)(6436002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR21MB0126;
	H:MWHPR21MB0159.namprd21.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 767686aa-3a06-414f-b12b-08d5204a23bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2017 10:28:34.0504 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR21MB0126
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.32.117
Subject: Re: [Qemu-arm] [PATCH v2] arm: implement cache/shareability
 attribute bits for PAR registers
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
From: Andrew Baumann via Qemu-arm <qemu-arm@nongnu.org>
Reply-To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qAmzqxyqH9Du

PiBGcm9tOiBQZXRlciBNYXlkZWxsIFttYWlsdG86cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnXQ0K
PiBTZW50OiBUdWVzZGF5LCAzMSBPY3RvYmVyIDIwMTcgMTc6NTMNCj4gDQo+IE9uIDMxIE9jdG9i
ZXIgMjAxNyBhdCAwMToyMywgQW5kcmV3IEJhdW1hbm4NCj4gPEFuZHJldy5CYXVtYW5uQG1pY3Jv
c29mdC5jb20+IHdyb3RlOg0KPiA+PiBGcm9tOiBQZXRlciBNYXlkZWxsIFttYWlsdG86cGV0ZXIu
bWF5ZGVsbEBsaW5hcm8ub3JnXQ0KPiA+PiBIaS4gVGhpcyBpcyBsb29raW5nIHByZXR0eSBnb29k
LCBidXQgSSBoYXZlIGEgZmV3IGNvbW1lbnRzIGJlbG93LA0KPiA+PiBhbmQgd2UncmUgcHJldHR5
IG11Y2ggYXQgdGhlIHNvZnRmcmVlemUgZGF0ZSAoS1ZNIEZvcnVtIGxhc3Qgd2Vlaw0KPiA+PiBt
ZWFudCBJIGRpZG4ndCBnZXQgbXVjaCBjb2RlIHJldmlldyBkb25lLCB1bmZvcnR1bmF0ZWx5KS4g
V291bGQNCj4gPj4geW91IGJlIHRvbyBzYWQgaWYgdGhpcyBtaXNzZWQgMi4xMSA/DQo+ID4NCj4g
PiBObyB3b3JyaWVzLiBJdCB3b3VsZCBiZSBuaWNlIHRvIGhhdmUgYSBzdGFibGUgcmVsZWFzZSB0
aGF0IHdlIGNhbiB0ZWxsIHBlb3BsZQ0KPiBzdXBwb3J0cyBhcm02NCBXaW5kb3dzLCBidXQgSSBy
ZWNvZ25pc2UgdGhhdCB0aGlzIGlzIGEgbm9uLXRyaXZpYWwgY2hhbmdlLCBzbyBpZg0KPiB3ZSBo
YXZlIHRvIHdhaXQgZm9yIDIuMTIgdG8gZ2V0IHRoYXQsIHRoZW4gZmFpciBlbm91Z2guDQo+IA0K
PiBJcyB0aGlzIHRoZSBvbmx5IG1pc3NpbmcgcGllY2UsIHRoZW4/IElmIHdlIHNxdWludCBhIGJp
dCB3ZSBjYW4NCj4gY2FsbCBpdCBhIGJ1ZyBmaXggYXMgbG9uZyBhcyB3ZSBjYW4gZ2V0IGl0IGlu
IGVhcmx5IGluIHRoZSBzb2Z0ZnJlZXplDQo+IHJhdGhlciB0aGFuIGxhdGVyLi4uDQoNCkl0IGlz
IHRoZSBsYXN0IHBpZWNlLCBhbmQgSSdsbCB0cnkgdG8gZ2V0IHlvdSBhIHYzIHNvb24sIGJ1dCB0
aGlzIHdlZWsgaXQncyBteSB0dXJuIHRvIGJlIHRyYXZlbGxpbmcsIHNvIGl0IG1heSB0YWtlIGEg
ZGF5IG9yIHR3by4gSSdsbCB1bmRlcnN0YW5kIGlmIHdlIGRvbid0IGdldCBpdCBpbiAtLSBub3Qg
YSBzaG93LXN0b3BwZXIuDQoNCj4gPj4gVGhlIHY4QSBBUk0gQVJNIHBzZXVkb2NvZGUgQ29tYmlu
ZVMxUzJBdHRySGludHMoKSBzYXlzIHRoYXQgdGhlIGhpbnQNCj4gPj4gYml0cyBhbHdheXMgY29t
ZSBmcm9tIHMxIHJlZ2FyZGxlc3Mgb2Ygd2hvc2UgYXR0cnMgd29uLg0KPiA+DQo+ID4gQWhhLCBJ
IHdhcyB3b25kZXJpbmcgYWJvdXQgdGhpcy4gVGhhbmtzIGZvciB0aGUgcG9pbnRlciB0byB0aGUg
cHNldWRvY29kZS4uLg0KPiBpdCBpc24ndCByZWZlcmVuY2VkIGFueXdoZXJlIGluIHRoZSByZWxl
dmFudCBzZWN0aW9uISBJdCdzIHJlYXNzdXJpbmcgdG8gc2VlIHRoYXQsDQo+IGFzaWRlIGZyb20g
dGhlIGhpbnRzICh3aGVyZSB0aGUgRW5nbGlzaCB3YXMgYW1iaWd1b3VzIElJUkMpLCBJIHNlZW0g
dG8gaGF2ZQ0KPiBnb3QgdGhlIHJlc3Qgb2YgdGhlIHRyYW5zbGF0aW9uIGNvcnJlY3QuDQo+IA0K
PiBJIGRpZG4ndCBmaW5kIGFueXRoaW5nIGluIHRoZSBFbmdsaXNoIHRleHQgYWJvdXQgaGludHMg
YXQgYWxsLg0KPiAoSSdsbCBoYXZlIHRvIGdvIGFuZCBoYXZlIGFub3RoZXIgbG9vay4pDQoNCkkg
ZGlkbid0IGZpbmQgYW55IG1lbnRpb24gb2YgaXQuIFRoYXQncyBwcmV0dHkgYW1iaWd1b3VzIElN
TyA6KQ0KDQpBbmRyZXcNCg==
