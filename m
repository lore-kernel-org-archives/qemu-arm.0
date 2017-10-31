Received: by 10.223.161.27 with SMTP id o27csp3117743wro;
        Mon, 30 Oct 2017 18:24:00 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+S8HsF8NbWhdakq7hcm7HZKNoU6mWLcCueoRdvRhTpedAs7Ultlj9hMrtRUT1IfkaPIjKdb
X-Received: by 10.129.51.74 with SMTP id z71mr150790ywz.169.1509413040815;
        Mon, 30 Oct 2017 18:24:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1509413040; cv=none;
        d=google.com; s=arc-20160816;
        b=LTdYIOtAmtTmZBbcPuUa5zJ74NJ6lhOGOVW2q80bDwazt8UcJiy6EGxJCrPhfY5nLG
         Yt/FZeMNAuXPgMdcP+kzP6KW5USHw2Hx7pJ8n5YJv3cWncnNxY3TU9t8vAH+xTAf0Qb9
         IxmkzK3+o+yh0kFb4gINRUxUnWxzmsPMz8jRXqT0AY9ovM110O2iKh0gNPLL2wLPjvIM
         LUJEigZ3y3bqLQV4G9L5/bNh0/N44ggnGxT0EDfjF3t8qY/WK3rteNiK7EvvmPLIEAgR
         F5/mI4lXnQTQcwPysNRHJgbeK14ngDiygXj9A7vH86jf8Al09Mx5OrhEtWAZRp+dZbnj
         WDlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:from:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:subject
         :mime-version:content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:msip_labels:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic:to
         :dkim-signature:arc-authentication-results;
        bh=lE5fu/XZ1JiQWZWTlrkq5loM+OQ19D8o9DnoVFdxRIw=;
        b=yvTQcn7mwHSWeWPT4jrFdEhH1Qpw2hWvl/18Jhs8YCkNv7FXHmW/tcNJNedf9+ogRQ
         9a3QV0KATPVX6Gw72dTf8YN8ZElwmRMJRPvTeYf8JifStBz7tjxBtmgrPKX5qTkDoFJ4
         Osiwqz0Ai2K1LZpQSrhV/0v2FnWA4dJXytfhXrgW8nyQLjrwQeinm9aRmwx+2Z4NfLiu
         2C1iPdnyChERK9qFgFcq/At9MvtdASx+MLxuAe2/veSvcENWdGTXjq7vs5ZdWUSDnuq4
         McxjOmggdiErQWG+s/ZwvT5aOL3sOtPvsuOW1BCu3E5fOUrvbalQL+rylWyc9rTTKlof
         qSyw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@microsoft.com header.s=selector1 header.b=W9DJjjq7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m18si62661ybj.531.2017.10.30.18.24.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 30 Oct 2017 18:24:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@microsoft.com header.s=selector1 header.b=W9DJjjq7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43307 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e9LHc-0000Sk-6l
	for alex.bennee@linaro.org; Mon, 30 Oct 2017 21:24:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38842)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1e9LHT-0000Sa-Pf
	for qemu-arm@nongnu.org; Mon, 30 Oct 2017 21:23:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1e9LHP-0001Oh-Nx
	for qemu-arm@nongnu.org; Mon, 30 Oct 2017 21:23:51 -0400
Received: from mail-by2nam01on0115.outbound.protection.outlook.com
	([104.47.34.115]:54644
	helo=NAM01-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Andrew.Baumann@microsoft.com>)
	id 1e9LHP-0001NW-6E; Mon, 30 Oct 2017 21:23:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
	bh=lE5fu/XZ1JiQWZWTlrkq5loM+OQ19D8o9DnoVFdxRIw=;
	b=W9DJjjq76RHQDGO8kdpl9bg63wf2OvJiutOGpJYQNXiskyfci1o5BeGYYxmkBdItxsui9zvGxhSqRSEFoeuX9zp9qnoeyeNdZ5V5+DQhGQwzSiY61F8CtN/zSb7k/SB8eBb2WE4NwTd+SHYMYEG5fSk7ZCl5wCvXxQoPqY5dAuM=
Received: from MWHPR21MB0159.namprd21.prod.outlook.com (10.173.52.17) by
	MWHPR21MB0479.namprd21.prod.outlook.com (10.172.102.18) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.156.5; Tue, 31 Oct 2017 01:23:44 +0000
Received: from MWHPR21MB0159.namprd21.prod.outlook.com ([10.173.52.17]) by
	MWHPR21MB0159.namprd21.prod.outlook.com ([10.173.52.17]) with mapi id
	15.20.0156.005; Tue, 31 Oct 2017 01:23:44 +0000
To: Peter Maydell <peter.maydell@linaro.org>
Thread-Topic: [PATCH v2] arm: implement cache/shareability attribute bits for
	PAR registers
Thread-Index: AQHTSe1g2erorUvJcU22oGgDep+lmKL81dGAgABYD5A=
Date: Tue, 31 Oct 2017 01:23:43 +0000
Message-ID: <MWHPR21MB01591265BB44E18E19B910879E5E0@MWHPR21MB0159.namprd21.prod.outlook.com>
References: <20171020214918.18944-1-Andrew.Baumann@microsoft.com>
	<CAFEAcA-bW6CtLTN0omLoL7x7r996rY9BS1MvH4KdfS-2z6g1LQ@mail.gmail.com>
In-Reply-To: <CAFEAcA-bW6CtLTN0omLoL7x7r996rY9BS1MvH4KdfS-2z6g1LQ@mail.gmail.com>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=baumann@microsoft.com;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2017-10-31T01:23:38.0053680Z;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft
	Azure Information Protection;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic;
	Sensitivity=General
x-originating-ip: [210.13.102.210]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR21MB0479;
	6:i+t7TqVB4JlDoVn1ZXEG8KDvOskR1dR5+yNTYoPzC9RROHst875jyyGdRB9VjASMcwBZO3sVIwBo5F/cx1XI5fDr5MzRShBf3GIRryvaYTf/8nELGqJFghQBhkWuD1gmUVRTrJcEY5e5q3kp6SnABFY8uKnn9kaTrslEsUwqxBDiqbVXOcxHQtyBAYxPCSBHADsZNpO9puSJr5/nbykutlwAdJ5EOXnaA2aA/k6qcxo/TeXt3+CNehHaBRm0RfOAMY6nzNm6L3n8ZRB7DI+oenCa2mIAHDeH+STamPqbP9FX3Ays2b9Pu7KssVsinjdccBj3dxj5xZZg40OjtwueVw==;
	5:7KdcYxEcCNFJNTJc/0kVlgYE2FJPvwJEdiObfuwAMbJ1OxsUGyTfzVoXB7Lq5krWAylGquFA8ol0rm4zzy+DuOvZ+yKzfurp84611GOf2raFX5ijdISz8jrBFmUxNInK5Qh310zwVMTO7ccglBqpTQ==;
	24:R8YCz0T8bPmhN/5pVUtIp68Yf6aUUtYYstEgAmicr1JYYRugeYNDk2o3Te/rtcqyaonL/FZxUqaop4y2dAOAFeUX2mTGpZxmAfW/R6KcXu0=;
	7:zT08ieXbKPCDanZiKeD1yYW55GGd3t2FCFfWXEIid9AQR+fudoTcfbUYdfplRGjNNhC5ry2/fg9tqzfeJaF7Wfk3X9PpCpxpjke5twDgwrLdEv5SBCSXbIaDmt2oa2WL1z34If8do+Px4goX4TW6Ki4/eGPX6Jt6yOkQ+EuUEyzUdtGcbQqfQCL1bHJsyrB/J1FK7tAAdHc4eobLX2ogPxP8dSrFgbA1Bl0V4Z/MqCA=
x-ms-exchange-antispam-srfa-diagnostics: SSOS;
x-ms-office365-filtering-correlation-id: 26e0e063-a8ac-4499-08a4-08d51ffe06fd
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(48565401081)(4534020)(4602075)(2017052603238);
	SRVR:MWHPR21MB0479; 
x-ms-traffictypediagnostic: MWHPR21MB0479:
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Andrew.Baumann@microsoft.com; 
x-exchange-antispam-report-test: UriScan:(89211679590171);
x-microsoft-antispam-prvs: <MWHPR21MB0479675CB14393387B2479319E5E0@MWHPR21MB0479.namprd21.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(61425038)(6040450)(2401047)(8121501046)(5005006)(10201501046)(3231020)(100000703101)(100105400095)(3002001)(93006095)(93001095)(6055026)(61426038)(61427038)(6041248)(20161123562025)(20161123564025)(20161123560025)(20161123558100)(20161123555025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:MWHPR21MB0479; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:MWHPR21MB0479; 
x-forefront-prvs: 04772EA191
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(346002)(376002)(39860400002)(47760400005)(24454002)(51914003)(199003)(57704003)(189002)(66066001)(53546010)(6506006)(77096006)(9686003)(5660300001)(6246003)(478600001)(106356001)(10090500001)(97736004)(99286003)(55016002)(189998001)(229853002)(22452003)(316002)(54906003)(4326008)(53936002)(2900100001)(105586002)(74316002)(101416001)(33656002)(3846002)(3660700001)(6436002)(305945005)(14454004)(7736002)(76176999)(54356999)(50986999)(8990500004)(6916009)(86612001)(2950100002)(8936002)(7696004)(72206003)(86362001)(68736007)(81166006)(6116002)(102836003)(2906002)(25786009)(3280700002)(81156014)(8676002)(10290500003)(473944003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR21MB0479;
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 26e0e063-a8ac-4499-08a4-08d51ffe06fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2017 01:23:43.9693 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR21MB0479
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.34.115
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
X-TUID: LXkj/jffukaI

PiBGcm9tOiBQZXRlciBNYXlkZWxsIFttYWlsdG86cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnXQ0K
PiBTZW50OiBUdWVzZGF5LCAzMSBPY3RvYmVyIDIwMTcgMDM6MjUNCj4gDQo+IE9uIDIwIE9jdG9i
ZXIgMjAxNyBhdCAyMjo0OSwgQW5kcmV3IEJhdW1hbm4NCj4gPEFuZHJldy5CYXVtYW5uQG1pY3Jv
c29mdC5jb20+IHdyb3RlOg0KPiA+IE9uIGEgc3VjY2Vzc2Z1bCBhZGRyZXNzIHRyYW5zbGF0aW9u
IGluc3RydWN0aW9uLCBQQVIgaXMgc3VwcG9zZWQgdG8NCj4gPiBjb250YWluIGNhY2hlYWJpbGl0
eSBhbmQgc2hhcmVhYmlsaXR5IGF0dHJpYnV0ZXMgZGV0ZXJtaW5lZCBieSB0aGUNCj4gPiB0cmFu
c2xhdGlvbi4gV2UgcHJldmlvdXNseSByZXR1cm5lZCAwIGZvciB0aGVzZSBiaXRzIChpbiBsaW5l
IHdpdGggdGhlDQo+ID4gZ2VuZXJhbCBzdHJhdGVneSBvZiBpZ25vcmluZyBjYWNoZXMgYW5kIG1l
bW9yeSBhdHRyaWJ1dGVzKSwgYnV0IHNvbWUNCj4gPiBndWVzdCBPU2VzIG1heSBkZXBlbmQgb24g
dGhlbS4NCj4gPg0KPiA+IFRoaXMgcGF0Y2ggY29sbGVjdHMgdGhlIGF0dHJpYnV0ZSBiaXRzIGlu
IHRoZSBwYWdlLXRhYmxlIHdhbGssIGFuZA0KPiA+IHVwZGF0ZXMgUEFSIHdpdGggdGhlIGNvcnJl
Y3QgYXR0cmlidXRlcyBmb3IgYWxsIExQQUUNCj4gPiB0cmFuc2xhdGlvbnMuIFNob3J0IGRlc2Ny
aXB0b3IgZm9ybWF0cyBzdGlsbCByZXR1cm4gMCBmb3IgdGhlc2UgYml0cywNCj4gPiBhcyBpbiB0
aGUgcHJpb3IgaW1wbGVtZW50YXRpb24sIGJ1dCBub3cgbG9nIGFuIHVuaW1wbGVtZW50ZWQgbWVz
c2FnZS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBCYXVtYW5uIDxBbmRyZXcuQmF1
bWFubkBtaWNyb3NvZnQuY29tPg0KPiA+IC0tLQ0KPiA+IHYyOg0KPiA+ICAqIHJldHVybiBhdHRy
cyB2aWEgb3V0IHBhcmFtZXRlciBmcm9tIGdldF9waHlzX2FkZHIsIHJhdGhlciB0aGFuDQo+IE1l
bVR4QXR0cnMNCj4gPiAgKiBtb3ZlIE1BSVIgbG9va3VwL2luZGV4IGlubGluZSwgc2luY2UgaXQg
dHVybmVkIG91dCB0byBiZSBzaW1wbGUNCj4gPiAgKiBpbXBsZW1lbnQgYXR0cmlidXRlcyBmb3Ig
c3RhZ2UgMiB0cmFuc2xhdGlvbnMNCj4gPiAgKiBjb21iaW5lIGF0dHJpYnV0ZXMgZnJvbSBzdGFn
ZXMgMSBhbmQgMiB3aGVuIHJlcXVpcmVkDQo+IA0KPiBIaS4gVGhpcyBpcyBsb29raW5nIHByZXR0
eSBnb29kLCBidXQgSSBoYXZlIGEgZmV3IGNvbW1lbnRzIGJlbG93LA0KPiBhbmQgd2UncmUgcHJl
dHR5IG11Y2ggYXQgdGhlIHNvZnRmcmVlemUgZGF0ZSAoS1ZNIEZvcnVtIGxhc3Qgd2Vlaw0KPiBt
ZWFudCBJIGRpZG4ndCBnZXQgbXVjaCBjb2RlIHJldmlldyBkb25lLCB1bmZvcnR1bmF0ZWx5KS4g
V291bGQNCj4geW91IGJlIHRvbyBzYWQgaWYgdGhpcyBtaXNzZWQgMi4xMSA/DQoNCk5vIHdvcnJp
ZXMuIEl0IHdvdWxkIGJlIG5pY2UgdG8gaGF2ZSBhIHN0YWJsZSByZWxlYXNlIHRoYXQgd2UgY2Fu
IHRlbGwgcGVvcGxlIHN1cHBvcnRzIGFybTY0IFdpbmRvd3MsIGJ1dCBJIHJlY29nbmlzZSB0aGF0
IHRoaXMgaXMgYSBub24tdHJpdmlhbCBjaGFuZ2UsIHNvIGlmIHdlIGhhdmUgdG8gd2FpdCBmb3Ig
Mi4xMiB0byBnZXQgdGhhdCwgdGhlbiBmYWlyIGVub3VnaC4NCg0KPiA+IEF0dHJpYnV0ZXMgZm9y
IHNob3J0IFBURSBmb3JtYXRzIHJlbWFpbiB1bmltcGxlbWVudGVkOyB0aGVyZSdzIGENCj4gTE9H
X1VOSU1QIGZvcg0KPiA+IHRoaXMgY2FzZSwgYnV0IGl0J3MgbGlrZWx5IHRvIGJlIG5vaXN5IGZv
ciBndWVzdHMgdGhhdCB0cmlnZ2VyIGl0IC0tIGRvIHdlIG5lZWQNCj4gPiBhIG9uZS1zaG90IG1l
Y2hhbmlzbSBmb3IgdGhlIGxvZyBzdGF0ZW1lbnQ/DQo+IA0KPiBJIHRoaW5rIHdlIHNob3VsZCBq
dXN0IGRyb3AgdGhhdCBMT0dfVU5JTVAuDQoNCk9rLg0KDQo+ID4gQEAgLTg5MjksNiArODkzOSwy
OCBAQCBzdGF0aWMgYm9vbCBnZXRfcGh5c19hZGRyX2xwYWUoQ1BVQVJNU3RhdGUNCj4gKmVudiwg
dGFyZ2V0X3Vsb25nIGFkZHJlc3MsDQo+ID4gICAgICAgICAgICovDQo+ID4gICAgICAgICAgdHhh
dHRycy0+c2VjdXJlID0gZmFsc2U7DQo+ID4gICAgICB9DQo+ID4gKw0KPiA+ICsgICAgaWYgKGNh
Y2hlYXR0cnMgIT0gTlVMTCkgew0KPiA+ICsgICAgICAgIGlmIChtbXVfaWR4ID09IEFSTU1NVUlk
eF9TMk5TKSB7DQo+ID4gKyAgICAgICAgICAgIC8qIFRyYW5zbGF0ZSBmcm9tIHRoZSA0LWJpdCBz
dGFnZSAyIHJlcHJlc2VudGF0aW9uIG9mDQo+ID4gKyAgICAgICAgICAgICAqIG1lbW9yeSBhdHRy
aWJ1dGVzICh3aXRob3V0IGNhY2hlLWFsbG9jYXRpb24gaGludHMpIHRvDQo+ID4gKyAgICAgICAg
ICAgICAqIHRoZSA4LWJpdCByZXByZXNlbnRhdGlvbiBvZiB0aGUgc3RhZ2UgMSBNQUlSIHJlZ2lz
dGVycw0KPiA+ICsgICAgICAgICAgICAgKiAod2hpY2ggaW5jbHVkZXMgYWxsb2NhdGlvbiBoaW50
cykuDQo+ID4gKyAgICAgICAgICAgICAqLw0KPiA+ICsgICAgICAgICAgICB1aW50OF90IG1lbWF0
dHIgPSBleHRyYWN0MzIoYXR0cnMsIDAsIDQpOw0KPiA+ICsgICAgICAgICAgICBjYWNoZWF0dHJz
LT5hdHRycyA9IChleHRyYWN0MzIobWVtYXR0ciwgMiwgMikgPDwgNCkNCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAoZXh0cmFjdDMyKG1lbWF0dHIsIDAsIDIpIDw8IDIpOw0K
PiANCj4gUHNldWRvY29kZSBTMkNvbnZlcnRBdHRyc0hpbnRzKCkgc3BlY2lmaWVzIHNvbWUgaGlu
dCBiaXQgZGVmYXVsdHMNCj4gKG5vLWFsbG9jYXRlIGZvciBOQzsgUlctYWxsb2NhdGUgZm9yIFdU
IG9yIFdCKSAtLSBkbyB3ZSB3YW50IHRvDQo+IGZvbGxvdyB0aGF0Pw0KDQpUaGFua3MgZm9yIHRo
ZSBwb2ludGVyLiBZZXMsIEkgdGhpbmsgd2UgZG8uDQoNCj4gDQo+ID4gKyAgICAgICAgICAgIGNh
Y2hlYXR0cnMtPnNoYXJlYWJpbGl0eSA9IGV4dHJhY3QzMihhdHRycywgNCwgMik7DQo+IA0KPiBB
cmUgeW91IHN1cmUgdGhpcyBpcyB0aGUgcmlnaHQgYml0IG9mZnNldCBmb3IgdGhlIHNoYXJlYWJp
bGl0eSBiaXRzPw0KPiBJIHRoaW5rIDQsMiBpcyB0aGUgUzJBUCAoYWNjZXNzKSBiaXRzLCBhbmQg
dGhlIFNIIGJpdHMgYXJlIGluIDYsMiwgc2FtZQ0KPiBhcyBmb3Igc3RhZ2UgMSBkZXNjcmlwdG9y
cy4NCg0KWW91J3JlIHJpZ2h0LiBJIHdhcyBjb252aW5jZWQgaXQgZGlmZmVyZWQsIGJ1dCBJIGRv
bid0IHJlY2FsbCB3aHkuIFRoYW5rcyBmb3IgY2F0Y2hpbmcgdGhpcy4NCg0KPiA+ICsgICAgICAg
IH0gZWxzZSB7DQo+ID4gKyAgICAgICAgICAgIC8qIEluZGV4IGludG8gTUFJUiByZWdpc3RlcnMg
Zm9yIGNhY2hlIGF0dHJpYnV0ZXMgKi8NCj4gPiArICAgICAgICAgICAgdWludDhfdCBhdHRyaW5k
eCA9IGV4dHJhY3QzMihhdHRycywgMCwgMyk7DQo+ID4gKyAgICAgICAgICAgIHVpbnQ2NF90IG1h
aXIgPSBlbnYtPmNwMTUubWFpcl9lbFtyZWdpbWVfZWwoZW52LCBtbXVfaWR4KV07DQo+ID4gKyAg
ICAgICAgICAgIGFzc2VydChhdHRyaW5keCA8PSA3KTsNCj4gPiArICAgICAgICAgICAgY2FjaGVh
dHRycy0+YXR0cnMgPSBleHRyYWN0NjQobWFpciwgYXR0cmluZHggKiA4LCA4KTsNCj4gPiArICAg
ICAgICAgICAgY2FjaGVhdHRycy0+c2hhcmVhYmlsaXR5ID0gZXh0cmFjdDMyKGF0dHJzLCA2LCAy
KTsNCj4gPiArICAgICAgICB9DQo+ID4gKyAgICB9DQo+ID4gKw0KPiA+ICAgICAgKnBoeXNfcHRy
ID0gZGVzY2FkZHI7DQo+ID4gICAgICAqcGFnZV9zaXplX3B0ciA9IHBhZ2Vfc2l6ZTsNCj4gPiAg
ICAgIHJldHVybiBmYWxzZTsNCj4gPiBAQCAtOTQ5MCw2ICs5NTIyLDg5IEBAIHN0YXRpYyBib29s
DQo+IGdldF9waHlzX2FkZHJfcG1zYXY1KENQVUFSTVN0YXRlICplbnYsIHVpbnQzMl90IGFkZHJl
c3MsDQo+ID4gICAgICByZXR1cm4gZmFsc2U7DQo+ID4gIH0NCj4gPg0KPiA+ICsvKiBDb21iaW5l
IGVpdGhlciBpbm5lciBvciBvdXRlciBjYWNoZWFiaWxpdHkgYXR0cmlidXRlcyBmb3Igbm9ybWFs
DQo+ID4gKyAqIG1lbW9yeSwgYWNjb3JkaW5nIHRvIHRhYmxlIEQ0LTQyIG9mIEFSTSBEREkgMDQ4
N0IuYiAodGhlIEFSTXY4DQo+IEFSTSkuDQo+ID4gKyAqDQo+ID4gKyAqIE5COiBvbmx5IHN0YWdl
IDEgaW5jbHVkZXMgYWxsb2NhdGlvbiBoaW50cyAoUlcgYml0cyksIGxlYWRpbmcgdG8NCj4gPiAr
ICogc29tZSBhc3ltbWV0cnkuDQo+ID4gKyAqLw0KPiA+ICtzdGF0aWMgdWludDhfdCBjb21iaW5l
X2NhY2hlYXR0cl9uaWJibGUodWludDhfdCBzMSwgdWludDhfdCBzMikNCj4gPiArew0KPiA+ICsg
ICAgaWYgKHMxID09IDQgfHwgczIgPT0gNCkgew0KPiA+ICsgICAgICAgIC8qIG5vbi1jYWNoZWFi
bGUgaGFzIHByZWNlZGVuY2UgKi8NCj4gPiArICAgICAgICByZXR1cm4gNDsNCj4gPiArICAgIH0g
ZWxzZSBpZiAoZXh0cmFjdDMyKHMxLCAyLCAyKSA9PSAwIHx8IGV4dHJhY3QzMihzMSwgMiwgMikg
PT0gMikgew0KPiA+ICsgICAgICAgIC8qIHN0YWdlIDEgd3JpdGUtdGhyb3VnaCB0YWtlcyBwcmVj
ZWRlbmNlICovDQo+ID4gKyAgICAgICAgcmV0dXJuIHMxOw0KPiA+ICsgICAgfSBlbHNlIGlmIChl
eHRyYWN0MzIoczIsIDIsIDIpID09IDIpIHsNCj4gPiArICAgICAgICAvKiBzdGFnZSAyIHdyaXRl
LXRocm91Z2ggdGFrZXMgcHJlY2VkZW5jZSAqLw0KPiA+ICsgICAgICAgIHJldHVybiBzMjsNCj4g
PiArICAgIH0gZWxzZSB7IC8qIHdyaXRlLWJhY2sgKi8NCj4gPiArICAgICAgICByZXR1cm4gczE7
DQo+ID4gKyAgICB9DQo+IA0KPiBUaGUgdjhBIEFSTSBBUk0gcHNldWRvY29kZSBDb21iaW5lUzFT
MkF0dHJIaW50cygpIHNheXMgdGhhdCB0aGUgaGludA0KPiBiaXRzIGFsd2F5cyBjb21lIGZyb20g
czEgcmVnYXJkbGVzcyBvZiB3aG9zZSBhdHRycyB3b24uDQoNCkFoYSwgSSB3YXMgd29uZGVyaW5n
IGFib3V0IHRoaXMuIFRoYW5rcyBmb3IgdGhlIHBvaW50ZXIgdG8gdGhlIHBzZXVkb2NvZGUuLi4g
aXQgaXNuJ3QgcmVmZXJlbmNlZCBhbnl3aGVyZSBpbiB0aGUgcmVsZXZhbnQgc2VjdGlvbiEgSXQn
cyByZWFzc3VyaW5nIHRvIHNlZSB0aGF0LCBhc2lkZSBmcm9tIHRoZSBoaW50cyAod2hlcmUgdGhl
IEVuZ2xpc2ggd2FzIGFtYmlndW91cyBJSVJDKSwgSSBzZWVtIHRvIGhhdmUgZ290IHRoZSByZXN0
IG9mIHRoZSB0cmFuc2xhdGlvbiBjb3JyZWN0Lg0KDQo+IChJIHdhcyBob3BpbmcgeW91IGNvdWxk
IHdyaXRlIHRoaXMgZnVuY3Rpb24gYXMgc29tZXRoaW5nIGxpa2UgYQ0KPiBNQVggb3IgTUlOLCBi
dXQgdGhlIGNvbXBsZXhpdGllcyBvZiB0aGUgd3JpdGV0aHJvdWdoLXRyYW5zaWVudA0KPiBlbmNv
ZGluZyBhbmQgdGhlIGhpbnQgYml0cyBtZWFuIGl0IGRvZXNuJ3Qgd29yayBvdXQuKQ0KPiANCj4g
PiArfQ0KPiA+ICsNCj4gPiArLyogQ29tYmluZSBTMSBhbmQgUzIgY2FjaGVhYmlsaXR5L3NoYXJl
YWJpbGl0eSBhdHRyaWJ1dGVzLCBwZXIgRDQuNS40DQo+ID4gKyAqDQo+ID4gKyAqIEBzMTogICAg
ICBBdHRyaWJ1dGVzIGZyb20gc3RhZ2UgMSB3YWxrDQo+ID4gKyAqIEBzMjogICAgICBBdHRyaWJ1
dGVzIGZyb20gc3RhZ2UgMiB3YWxrDQo+ID4gKyAqLw0KPiA+ICtzdGF0aWMgQVJNQ2FjaGVBdHRy
cyBjb21iaW5lX2NhY2hlYXR0cnMoQVJNQ2FjaGVBdHRycyBzMSwNCj4gQVJNQ2FjaGVBdHRycyBz
MikNCj4gPiArew0KPiA+ICsgICAgdWludDhfdCBzMWxvID0gZXh0cmFjdDMyKHMxLmF0dHJzLCAw
LCA0KSwgczJsbyA9IGV4dHJhY3QzMihzMi5hdHRycywgMCwgNCk7DQo+ID4gKyAgICB1aW50OF90
IHMxaGkgPSBleHRyYWN0MzIoczEuYXR0cnMsIDQsIDQpLCBzMmhpID0gZXh0cmFjdDMyKHMyLmF0
dHJzLCA0LCA0KTsNCj4gPiArICAgIEFSTUNhY2hlQXR0cnMgcmV0Ow0KPiA+ICsNCj4gPiArICAg
IC8qIENvbWJpbmUgc2hhcmVhYmlsaXR5IGF0dHJpYnV0ZXMgKHRhYmxlIEQ0LTQzKSAqLw0KPiA+
ICsgICAgaWYgKHMxLnNoYXJlYWJpbGl0eSA9PSAyIHx8IHMyLnNoYXJlYWJpbGl0eSA9PSAyKSB7
DQo+ID4gKyAgICAgICAgLyogaWYgZWl0aGVyIGFyZSBvdXRlci1zaGFyZWFibGUsIHRoZSByZXN1
bHQgaXMgb3V0ZXItc2hhcmVhYmxlICovDQo+ID4gKyAgICAgICAgcmV0LnNoYXJlYWJpbGl0eSA9
IDI7DQo+ID4gKyAgICB9IGVsc2UgaWYgKHMxLnNoYXJlYWJpbGl0eSA9PSAzIHx8IHMyLnNoYXJl
YWJpbGl0eSA9PSAzKSB7DQo+ID4gKyAgICAgICAgLyogaWYgZWl0aGVyIGFyZSBpbm5lci1zaGFy
ZWFibGUsIHRoZSByZXN1bHQgaXMgaW5uZXItc2hhcmVhYmxlICovDQo+ID4gKyAgICAgICAgcmV0
LnNoYXJlYWJpbGl0eSA9IDM7DQo+ID4gKyAgICB9IGVsc2Ugew0KPiA+ICsgICAgICAgIC8qIGJv
dGggbm9uLXNoYXJlYWJsZSAqLw0KPiA+ICsgICAgICAgIHJldC5zaGFyZWFiaWxpdHkgPSAwOw0K
PiA+ICsgICAgfQ0KPiANCj4gWW91IGNhbiBwbGF5IGJpdCBnYW1lcyB3aXRoIHRoZSBmb3JtYXQg
aGVyZSwgYmVjYXVzZQ0KPiB3aGF0IHdlJ3JlIGVmZmVjdGl2ZWx5IGltcGxlbWVudGluZyBpcyAi
d2hpY2hldmVyIGlzIGxhc3QgaW4NCj4gdGhlIG9yZGVyICcwLCAzLCAyJyB3aW5zIiwgd2hpY2gg
aXMNCj4gICAgcmV0LnNoYXJlYWJpbGl0eSA9IE1JTihzMS5zaGFyZWFiaWxpdHkgXiAxLCBzMi5z
aGFyZWFiaWxpdHkgXiAxKSBeIDE7DQo+IChzaW5jZSB0aGUgeG9yIHdpdGggMSB0cmFuc2Zvcm1z
ICgwLDMsMikgdG8gKDEsMiwzKSBhbmQgaXMgc2VsZi1pbnZlcnNlKS4NCj4gSXMgdGhhdCBiZXR0
ZXIgdGhhbiB0aGUgaWYgbGFkZGVyIGFib3ZlPyBOb3QgZW50aXJlbHkgc3VyZSA6LSkNCg0KSSd2
ZSBubyBjb25maWRlbmNlIGluIG15IGFiaWxpdHkgdG8gZ2V0IHRoYXQgYml0LWxvZ2ljIHJpZ2h0
LCBvciBldmVuIHRvIGNoZWNrIHRoYXQgeW91IGRpZC4gSSdkIHJhdGhlciBsZWF2ZSBpdCB0byB0
aGUgY29tcGlsZXIgdG8gZmlndXJlIG91dCBob3cgdG8gcGxheSB0aG9zZSBvcHRpbWlzYXRpb24g
Z2FtZXMgOikNCg0KPiA+ICsgICAgLyogQ29tYmluZSBtZW1vcnkgdHlwZSBhbmQgY2FjaGVhYmls
aXR5IGF0dHJpYnV0ZXMgKi8NCj4gPiArICAgIGlmIChzMWhpID09IDAgfHwgczJoaSA9PSAwKSB7
DQo+ID4gKyAgICAgICAgLyogRGV2aWNlIGhhcyBwcmVjZWRlbmNlIG92ZXIgbm9ybWFsICovDQo+
ID4gKyAgICAgICAgaWYgKHMxbG8gPT0gMCB8fCBzMmxvID09IDApIHsNCj4gPiArICAgICAgICAg
ICAgLyogbkduUm5FIGhhcyBwcmVjZWRlbmNlIG92ZXIgYW55dGhpbmcgKi8NCj4gPiArICAgICAg
ICAgICAgcmV0LmF0dHJzID0gMDsNCj4gPiArICAgICAgICB9IGVsc2UgaWYgKHMxbG8gPT0gNCB8
fCBzMmxvID09IDQpIHsNCj4gPiArICAgICAgICAgICAgLyogbm9uLVJlb3JkZXJpbmcgaGFzIHBy
ZWNlZGVuY2Ugb3ZlciBSZW9yZGVyaW5nICovDQo+ID4gKyAgICAgICAgICAgIHJldC5hdHRycyA9
IDQ7ICAvKiBuR25SRSAqLw0KPiA+ICsgICAgICAgIH0gZWxzZSBpZiAoczFsbyA9PSA4IHx8IHMy
bG8gPT0gOCkgew0KPiA+ICsgICAgICAgICAgICAvKiBub24tR2F0aGVyaW5nIGhhcyBwcmVjZWRl
bmNlIG92ZXIgR2F0aGVyaW5nICovDQo+ID4gKyAgICAgICAgICAgIHJldC5hdHRycyA9IDg7ICAv
KiBuR1JFICovDQo+ID4gKyAgICAgICAgfSBlbHNlIHsNCj4gPiArICAgICAgICAgICAgcmV0LmF0
dHJzID0gMHhjOyAvKiBHUkUgKi8NCj4gPiArICAgICAgICB9DQo+IA0KPiBJc24ndCB0aGlzIGlm
LWxhZGRlciBlcXVpdmFsZW50IHRvIGp1c3QgInJldC5hdHRycyA9IE1JTihzMWxvLCBzMmxvKTsi
ID8NCg0KQXNzdW1pbmcgYm90aCBzMWxvIGFuZCBzMmxvIGF2b2lkIHVuZGVmaW5lZCBlbmNvZGlu
Z3MsIHllcyBpdCBpcy4gSSB0ZW5kIHRvIHByZWZlciB0aGUgaWYtbGFkZGVyIGp1c3QgYmVjYXVz
ZSBpdCdzIGEgbW9yZSBkaXJlY3QgdHJhbnNsYXRpb24gb2YgdGhlIHNwZWMgKGUuZy4gQ29tYmlu
ZVMxUzJEZXZpY2UoKSBwc2V1ZG9jb2RlKS4gQnV0IGluIHRoaXMgY2FzZSBpZiB5b3UgcHJlZmVy
IEkgY291bGQgY2hhbmdlIGl0IHRvIHRoZSBNSU4gdmVyc2lvbiBmb3IgYnJldml0eSwgc2luY2Ug
aXQncyBmYWlybHkgc3RyYWlnaHRmb3J3YXJkLg0KDQpUaGFua3MsDQpBbmRyZXcNCg==
