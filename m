Received: by 10.223.161.27 with SMTP id o27csp52455wro;
        Mon, 23 Oct 2017 09:35:03 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+Tuzv8YIGNhBe3zz+QtiharB+xm2HUVcbO6SDy9hQwI319dvbszf5Qa03HrQHWosZWlfJiP
X-Received: by 10.37.189.83 with SMTP id p19mr8742526ybm.522.1508776503280;
        Mon, 23 Oct 2017 09:35:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508776503; cv=none;
        d=google.com; s=arc-20160816;
        b=OR87owKplQWt+epiNT/vsuMSNtiuEeP4UlNMUoVmus1DOuRbEeYkfvq4Tyt7Mrxsuh
         LUyROmZQI7sFEYCsJDFvUqPgnvnw9OJJKeVgD7SpHDA1K348aE03HqoCD5V8W0BJalDp
         s2sFQKyMeuV+ODJZf85P+gR9NjxfyixTqGMxAKnm42AX0AS/eUxjdYxMnsKw8RFTjnM0
         Sn1DPCbzQ0hizkRqOdSo6Jr3hmW3NnBacl4OwKbUBjh7a/NRO4hxjX9ApnthI71LEuJv
         7QDnsXbe3TibiRVF8bVjYMeT9oHhUOX2ca2LGUx13KaR+cDd8lpe4Vbmc0V+9JMaNiZr
         Jv/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:from:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:subject
         :mime-version:content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:msip_labels:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic:to
         :dkim-signature:arc-authentication-results;
        bh=JoCQ5c7xStazO+t4Ua/+8TkUgAApv9qM2oCrQCMb55Y=;
        b=F60bJaPrTK1/KaBV4mapwoL7j0M5hxO5KUYjnp3uRir5+11AYtasxqdegFV6esLmXe
         LYivUSlfXgEncXlr4Aft3HisxHokleMB5PqLknqYiH5M799uYHwobB/nSbcsLRfzUptK
         Bh+igEg9JDh3mKIf4y8NTa0m9AvHj1KWaBWgNWztjybYij45JOOIKWtf2u4PvQuhOisx
         TYILEgrtwmE3g6AB58OQdF3ETwl9cTH2TxIhygApzX4dVdzXWTi9zhbQjGBZWCBOyu5m
         5Jqt4Zbi2vydByS5ey3dMgUW2SKJmbViBdrVVJYJFG0T7hqDApI3lIYoEAWVPoNgg1wo
         Bzcg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@microsoft.com header.s=selector1 header.b=Og+g35ml;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 206si1295125ywf.103.2017.10.23.09.35.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 23 Oct 2017 09:35:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@microsoft.com header.s=selector1 header.b=Og+g35ml;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39631 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e6fgs-0007ym-OH
	for alex.bennee@linaro.org; Mon, 23 Oct 2017 12:35:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43060)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1e6fgj-0007x5-7W
	for qemu-arm@nongnu.org; Mon, 23 Oct 2017 12:34:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1e6fgf-0000gM-1e
	for qemu-arm@nongnu.org; Mon, 23 Oct 2017 12:34:53 -0400
Received: from mail-sn1nam01on0099.outbound.protection.outlook.com
	([104.47.32.99]:24168
	helo=NAM01-SN1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Andrew.Baumann@microsoft.com>)
	id 1e6fgU-0000dd-LK; Mon, 23 Oct 2017 12:34:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
	bh=JoCQ5c7xStazO+t4Ua/+8TkUgAApv9qM2oCrQCMb55Y=;
	b=Og+g35mlVOUv/M0JFqis8irP9i21rbKgr5Bu2NWmRUvSb86LdOBfcfn9pszh92C7hOUAxknyWYEJvPwI6QFKvqHmGsJvuiAIaN+cvHQjAghHVqY2nRgKnRzFE1cvez2duzjt5Dju6FlY/KdgaAJt0ZPKj6N3/+kXFAkU9kFOLRw=
Received: from MWHPR21MB0159.namprd21.prod.outlook.com (10.173.52.17) by
	MWHPR21MB0782.namprd21.prod.outlook.com (10.173.51.148) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.197.0; Mon, 23 Oct 2017 16:34:36 +0000
Received: from MWHPR21MB0159.namprd21.prod.outlook.com ([10.173.52.17]) by
	MWHPR21MB0159.namprd21.prod.outlook.com ([10.173.52.17]) with mapi id
	15.20.0156.005; Mon, 23 Oct 2017 16:34:36 +0000
To: bzt bzt <bztemail@gmail.com>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH] BCM2837 and machine raspi3
Thread-Index: AQHTS1iaOqiv7GBJY0mQ9agTHxJPvKLxn5Zg
Date: Mon, 23 Oct 2017 16:34:35 +0000
Message-ID: <MWHPR21MB01590CD596A992C93E01B5079E460@MWHPR21MB0159.namprd21.prod.outlook.com>
References: <CADYoBw2dogvU6-3vChG4js0BNdyTPG8eDvMSRoU50eTX_9DdEQ@mail.gmail.com>
In-Reply-To: <CADYoBw2dogvU6-3vChG4js0BNdyTPG8eDvMSRoU50eTX_9DdEQ@mail.gmail.com>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=baumann@microsoft.com;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2017-10-23T16:34:29.5521462Z;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft
	Azure Information Protection;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic;
	Sensitivity=General
x-originating-ip: [2001:4898:80e8:6::41a]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR21MB0782;
	6:uLNPIDkiFoZLFwLtXzWx/goBoZnephmxfyYk3kHwIXBDIXK5+6K5QTOcO8qtAkdArydYGIDqQ+MmDjbmRqNwtJ3ElDBJ08JHwF6HCXvJyH5k96kBApSrNcwYiqfMNMZPJuFYHRlo6ffTemOFivbOGQSvdAQkwGkZDLEPQeMeZ5lkL+IXOszB1ukq/CCWcWMM0et7FokmpxpcCozpZ41AlxiIOkUgMtLuSKGeeIe9NG/iNUUewm4OlI9Quvwr1/o3ZqWQ72qSrqbtztwbDKC7KjE0C3nAChSuakFrmo0fsb19qz0tgfKitSYCvqeuMw2K8I3OXfOzbxeQD3qgE5EXVzSHMshLh+nNRvZ7zNPvd9c=;
	5:qozVkJgIS4Llk0dtTRBUg3MBWcj4C42bbesiFy7TLsQCg86kOuCswUrj5kTERSWcqBSygfWjWG8shaIZn/Mt10TgrDPgIEZIvycvO2xzlnBjvEBlZCZo70QIoigzJz9tgjzc4eeWRRfY/FwkOS9JXPBzxsxXj5cgC5XW0YE0/bU=;
	24:VKeFpoElsElG3PZ0V2L/8O677cX7B8AU2MoK2yl/lFtRuS3NlEvgU+74Bgpefim4zNQfNp2M/u2k8ZWgxuvhGV1Osq4rHLfBRaJY9YQa7J4=;
	7:bZwBZFpfgV4nAKjSWVFfb67TpnuZdRxPKy/j2Ft9vaR8fYlg1Jya/mNY8d3h6zMA2Si3DrM+ci9FD4tjppUN26HzhiSsRH/t/25GKrErtSlbcLmYEL+FLZYXUUnXoLgQ271BmWfk6qu3o3/ZR9C7Xa72ApDS45xtjZ1c1Ok6k7i0IC4SxhCVh8iYWeY8zpdZjcukChKaZYYUKY7SWJuToedFxONTkKaBNhfL5ERKUxKtLgloM5cLnj6Hl8BVHe3l
x-ms-exchange-antispam-srfa-diagnostics: SSOS;
x-ms-office365-filtering-correlation-id: 1cf29e8c-6ef2-4663-fa4d-08d51a33f2b9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(48565401081)(4534020)(4602075)(4627075)(201703031133081)(201702281549075)(2017052603229);
	SRVR:MWHPR21MB0782; 
x-ms-traffictypediagnostic: MWHPR21MB0782:
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Andrew.Baumann@microsoft.com; 
x-exchange-antispam-report-test: UriScan:(166708455590820)(111885846020525);
x-microsoft-antispam-prvs: <MWHPR21MB0782A314898DB38B2CA6891D9E460@MWHPR21MB0782.namprd21.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(61425038)(6040450)(2401047)(8121501046)(5005006)(10201501046)(100000703101)(100105400095)(93006095)(93001095)(3002001)(3231020)(6055026)(61426038)(61427038)(6041248)(20161123564025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123558100)(20161123555025)(20161123560025)(20161123562025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:MWHPR21MB0782; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:MWHPR21MB0782; 
x-forefront-prvs: 046985391D
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(376002)(346002)(39860400002)(47760400005)(199003)(189002)(51914003)(8990500004)(50986999)(53936002)(4326008)(2950100002)(551934003)(7696004)(101416001)(39060400002)(5660300001)(105586002)(106356001)(33656002)(8676002)(8936002)(6246003)(76176999)(54356999)(81156014)(81166006)(9686003)(305945005)(74316002)(6436002)(68736007)(25786009)(7736002)(99286003)(55016002)(97736004)(966005)(14454004)(3660700001)(6506006)(6306002)(77096006)(2906002)(2900100001)(10290500003)(6116002)(86362001)(189998001)(10090500001)(72206003)(2501003)(102836003)(86612001)(110136005)(22452003)(316002)(478600001)(3280700002)(54906003)(229853002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR21MB0782;
	H:MWHPR21MB0159.namprd21.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cf29e8c-6ef2-4663-fa4d-08d51a33f2b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2017 16:34:35.9784 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR21MB0782
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.32.99
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] BCM2837 and machine raspi3
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qTm3PUE/W6X3

PiBGcm9tOiBRZW11LWRldmVsIE9uIEJlaGFsZiBPZiBienQgYnp0DQo+IFNlbnQ6IFN1bmRheSwg
MjIgT2N0b2JlciAyMDE3IDA2OjIxDQo+IA0KPiBJJ3ZlIGFkZGVkIHN1cHBvcnQgZm9yICItTSBy
YXNwaTMiIHRvIHFlbXUuIFRoaXMgaXMgbXkgZmlyc3QgcGF0Y2gsIEkgaG9wZQ0KPiBpdCdzIG9r
YXkuIFRoZSBnaXRodWIgcmVwbyBpcyBoZXJlOiBodHRwczovL2dpdGh1Yi5jb20vYnp0c3JjL3Fl
bXUtcmFzcGkzDQo+IGluIGNhc2UgbXkgcGF0Y2ggZG9lcyBub3Qgd29yayBmb3Igc29tZSByZWFz
b24uDQoNClRoYW5rcyBmb3IgdGhlIHBhdGNoIQ0KDQpbLi4uXQ0KDQo+IFN1YmplY3Q6IFtQQVRD
SF0gQkNNMjgzNyBhbmQgbWFjaGluZSByYXNwaTMNCg0KKmFkZA0KDQpbLi4uXQ0KDQo+IC0tLSAv
ZGV2L251bGwNCj4gKysrIGIvaHcvYXJtL2JjbTI4MzcuYw0KPiBAQCAtMCwwICsxLDE3OSBAQA0K
PiArLyoNCj4gKyAqIFJhc3BiZXJyeSBQaSBlbXVsYXRpb24gKGMpIDIwMTIgR3JlZ29yeSBFc3Ry
YWRlDQo+ICsgKiBVcHN0cmVhbWluZyBjb2RlIGNsZWFudXAgW2luY2x1ZGluZyBiY20yODM1Xypd
IChjKSAyMDEzIEphbiBQZXRyb3VzDQo+ICsgKg0KPiArICogUmFzcGVycnkgUGkgMiBlbXVsYXRp
b24gYW5kIHJlZmFjdG9yaW5nIENvcHlyaWdodCAoYykgMjAxNSwgTWljcm9zb2Z0DQo+ICsgKiBX
cml0dGVuIGJ5IEFuZHJldyBCYXVtYW5uDQo+ICsgKg0KPiArICogUmFzcGJlcnJ5IFBpIDMgZW11
bGF0aW9uIDIwMTcgYnkgYnp0DQo+ICsgKg0KPiArICogVGhpcyBjb2RlIGlzIGxpY2Vuc2VkIHVu
ZGVyIHRoZSBHTlUgR1BMdjIgYW5kIGxhdGVyLg0KPiArICovDQo+ICsNCj4gKyNpbmNsdWRlICJx
ZW11L29zZGVwLmgiDQo+ICsjaW5jbHVkZSAicWFwaS9lcnJvci5oIg0KPiArI2luY2x1ZGUgInFl
bXUtY29tbW9uLmgiDQo+ICsjaW5jbHVkZSAiY3B1LmgiDQo+ICsjaW5jbHVkZSAiaHcvYXJtL2Jj
bTI4MzYuaCINCj4gKyNpbmNsdWRlICJody9hcm0vYmNtMjgzNy5oIg0KPiArI2luY2x1ZGUgImh3
L2FybS9yYXNwaV9wbGF0Zm9ybS5oIg0KPiArI2luY2x1ZGUgImh3L3N5c2J1cy5oIg0KPiArI2lu
Y2x1ZGUgImV4ZWMvYWRkcmVzcy1zcGFjZXMuaCINCj4gKw0KPiArLyogQWNjb3JkaW5nIHRvDQo+
IGh0dHBzOi8vd3d3LnJhc3BiZXJyeXBpLm9yZy9kb2N1bWVudGF0aW9uL2hhcmR3YXJlL3Jhc3Bi
ZXJyeXBpL2JjbTI4MzcvDQo+IFJFQURNRS5tZA0KPiArICogVGhlIHVuZGVybHlpbmcgYXJjaGl0
ZWN0dXJlIG9mIHRoZSBCQ00yODM3IGlzIGlkZW50aWNhbCB0byB0aGUgQkNNMjgzNi4NCj4gVGhl
IG9ubHkgc2lnbmlmaWNhbnQNCj4gKyAqIGRpZmZlcmVuY2UgaXMgdGhlIHJlcGxhY2VtZW50IG9m
IHRoZSBBUk12NyBxdWFkIGNvcmUgY2x1c3RlciB3aXRoIGENCj4gcXVhZC1jb3JlIEFSTSBDb3J0
ZXggQTUzDQo+ICsgKiAoQVJNdjgpIGNsdXN0ZXIuIFNvIHdlIHVzZSBjb3J0ZXgtYTUzLSBoZXJl
LiAqLw0KDQpBcmUgdGhlcmUgYW55IGNoYW5nZXMgZnJvbSBiY20yODM2IG90aGVyIHRoYW4gdGhl
IENQVSBtb2RlbD8NCg0KRHVwbGljYXRpbmcgdGhlIHdob2xlIGZpbGUganVzdCB0byBoYXZlIGEg
ZGlmZmVyZW50IENQVSBzZWVtcyBsaWtlIGEgYmFkIGlkZWEgdG8gbWUuIEkgd291bGQgc3VnZ2Vz
dCBwYXJhbWV0ZXJpc2luZyB0aGUgQ1BVIG1vZGVsIGluIGJjbTI4MzYgKGFuZCBtYXliZSBub3Rp
bmcgaW4gaGVhZGVyIGNvbW1lbnRzIGV0Yy4gdGhhdCBpdCBjYW4gYWxzbyBtb2RlbCAyODM3KSwg
YW5kIHRoZW4gaW5zdGFudGlhdGluZyBpdCBmcm9tIHJhc3BpLmMgd2l0aCB0aGUgY29ycmVjdCBD
UFUgdHlwZSBkZXBlbmRpbmcgb24gd2hpY2ggbWFjaGluZSBpcyBiZWluZyB1c2VkLiBUaGF0IHdp
bGwgYWxzbyByZWR1Y2UgdGhlIHNpemUgb2YgdGhlIHBhdGNoIHNpZ25pZmljYW50bHksIHdoaWNo
IHdpbGwgbWFrZSBpdCBlYXNpZXIgdG8gZ2V0IGl0IHJldmlld2VkLg0KDQooQWx0ZXJuYXRpdmVs
eSwgaWYgdGhlcmUgYXJlIG1pbm9yIGJ1dCBub24tdHJpdmlhbCBkaWZmZXJlbmNlcyBiZXR3ZWVu
IDI4MzYgYW5kIDI4Mzcgb3RoZXIgdGhhbiB0aGUgQ1BVIG1vZGVsLCB5b3UgbWF5IHdhbnQgdG8g
Y3JlYXRlIHNvbWV0aGluZyBsaWtlIGJjbTI4MzVfcGVyaXBoZXJhbHMgdGhhdCBjb250YWlucyBh
bGwgdGhlIGZ1bmN0aW9uYWxpdHkgY29tbW9uIHRvIGJvdGguIEJ1dCBJIHN1c3BlY3QgdGhhdCBp
c24ndCB0aGUgY2FzZSBoZXJlLikNCg0KPiAtLS0gYS9ody9hcm0vcmFzcGkuYw0KPiArKysgYi9o
dy9hcm0vcmFzcGkuYw0KWy4uLl0NCj4gQEAgLTE3MSwzICsxNzcsNjIgQEAgc3RhdGljIHZvaWQg
cmFzcGkyX21hY2hpbmVfaW5pdChNYWNoaW5lQ2xhc3MgKm1jKQ0KPiAgICAgIG1jLT5pZ25vcmVf
bWVtb3J5X3RyYW5zYWN0aW9uX2ZhaWx1cmVzID0gdHJ1ZTsNCj4gIH07DQo+ICBERUZJTkVfTUFD
SElORSgicmFzcGkyIiwgcmFzcGkyX21hY2hpbmVfaW5pdCkNCj4gKw0KPiArc3RhdGljIHZvaWQg
cmFzcGkzX2luaXQoTWFjaGluZVN0YXRlICptYWNoaW5lKQ0KPiArew0KPiArICAgIFJhc1BpU3Rh
dGUgKnMgPSBnX25ldzAoUmFzUGlTdGF0ZSwgMSk7DQo+ICsgICAgdWludDMyX3QgdmNyYW1fc2l6
ZTsNCj4gKyAgICBEcml2ZUluZm8gKmRpOw0KPiArICAgIEJsb2NrQmFja2VuZCAqYmxrOw0KPiAr
ICAgIEJ1c1N0YXRlICpidXM7DQo+ICsgICAgRGV2aWNlU3RhdGUgKmNhcmRkZXY7DQo+ICsNCj4g
KyAgICBvYmplY3RfaW5pdGlhbGl6ZSgmcy0+c29jLCBzaXplb2Yocy0+c29jKSwgVFlQRV9CQ00y
ODM3KTsNCj4gKyAgICBvYmplY3RfcHJvcGVydHlfYWRkX2NoaWxkKE9CSkVDVChtYWNoaW5lKSwg
InNvYyIsIE9CSkVDVCgmcy0+c29jKSwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICZlcnJvcl9hYm9ydCk7DQo+ICsNCj4gKyAgICAvKiBBbGxvY2F0ZSBhbmQgbWFwIFJBTSAqLw0K
PiArICAgIG1lbW9yeV9yZWdpb25fYWxsb2NhdGVfc3lzdGVtX21lbW9yeSgmcy0+cmFtLCBPQkpF
Q1QobWFjaGluZSksDQo+ICJyYW0iLA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBtYWNoaW5lLT5yYW1fc2l6ZSk7DQo+ICsgICAgLyogRklYTUU6IFJlbW92ZSB3
aGVuIHdlIGhhdmUgY3VzdG9tIENQVSBhZGRyZXNzIHNwYWNlIHN1cHBvcnQgKi8NCj4gKyAgICBt
ZW1vcnlfcmVnaW9uX2FkZF9zdWJyZWdpb25fb3ZlcmxhcChnZXRfc3lzdGVtX21lbW9yeSgpLCAw
LCAmcy0NCj4gPnJhbSwNCj4gMCk7DQo+ICsNCj4gKyAgICAvKiBTZXR1cCB0aGUgU09DICovDQo+
ICsgICAgb2JqZWN0X3Byb3BlcnR5X2FkZF9jb25zdF9saW5rKE9CSkVDVCgmcy0+c29jKSwgInJh
bSIsIE9CSkVDVCgmcy0NCj4gPnJhbSksDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICZlcnJvcl9hYm9ydCk7DQo+ICsgICAgb2JqZWN0X3Byb3BlcnR5X3NldF9pbnQoT0JK
RUNUKCZzLT5zb2MpLCBzbXBfY3B1cywgImVuYWJsZWQtY3B1cyIsDQo+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgJmVycm9yX2Fib3J0KTsNCj4gKyAgICBvYmplY3RfcHJvcGVydHlfc2V0
X2ludChPQkpFQ1QoJnMtPnNvYyksIDB4YTAyMDgyLCAiYm9hcmQtcmV2IiwNCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAmZXJyb3JfYWJvcnQpOw0KPiArICAgIG9iamVjdF9wcm9wZXJ0
eV9zZXRfYm9vbChPQkpFQ1QoJnMtPnNvYyksIHRydWUsICJyZWFsaXplZCIsDQo+ICZlcnJvcl9h
Ym9ydCk7DQo+ICsNCj4gKyAgICAvKiBDcmVhdGUgYW5kIHBsdWcgaW4gdGhlIFNEIGNhcmRzICov
DQo+ICsgICAgZGkgPSBkcml2ZV9nZXRfbmV4dChJRl9TRCk7DQo+ICsgICAgYmxrID0gZGkgPyBi
bGtfYnlfbGVnYWN5X2RpbmZvKGRpKSA6IE5VTEw7DQo+ICsgICAgYnVzID0gcWRldl9nZXRfY2hp
bGRfYnVzKERFVklDRSgmcy0+c29jKSwgInNkLWJ1cyIpOw0KPiArICAgIGlmIChidXMgPT0gTlVM
TCkgew0KPiArICAgICAgICBlcnJvcl9yZXBvcnQoIk5vIFNEIGJ1cyBmb3VuZCBpbiBTT0Mgb2Jq
ZWN0Iik7DQo+ICsgICAgICAgIGV4aXQoMSk7DQo+ICsgICAgfQ0KPiArICAgIGNhcmRkZXYgPSBx
ZGV2X2NyZWF0ZShidXMsIFRZUEVfU0RfQ0FSRCk7DQo+ICsgICAgcWRldl9wcm9wX3NldF9kcml2
ZShjYXJkZGV2LCAiZHJpdmUiLCBibGssICZlcnJvcl9mYXRhbCk7DQo+ICsgICAgb2JqZWN0X3By
b3BlcnR5X3NldF9ib29sKE9CSkVDVChjYXJkZGV2KSwgdHJ1ZSwgInJlYWxpemVkIiwNCj4gJmVy
cm9yX2ZhdGFsKTsNCj4gKw0KPiArICAgIHZjcmFtX3NpemUgPSBvYmplY3RfcHJvcGVydHlfZ2V0
X3VpbnQoT0JKRUNUKCZzLT5zb2MpLCAidmNyYW0tc2l6ZSIsDQo+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAmZXJyb3JfYWJvcnQpOw0KPiArICAgIHNldHVwX2Jv
b3QobWFjaGluZSwgMywgbWFjaGluZS0+cmFtX3NpemUgLSB2Y3JhbV9zaXplKTsNCj4gK30NCg0K
U2ltaWxhcmx5LCB0aGlzIGxvb2tzIGxpa2UgYSBjbG9uZSBvZiByYXNwaTJfaW5pdC4gSSB0aGlu
ayBpdCB3b3VsZCBiZSBiZXR0ZXIgdG8gaGF2ZSBvbmUgZnVuY3Rpb24sIHBhcmFtZXRyaXNlZCBp
ZiBuZWVkZWQuDQoNClJlZ2FyZHMsDQpBbmRyZXcNCg==
