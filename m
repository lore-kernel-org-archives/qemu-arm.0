Received: by 10.223.161.27 with SMTP id o27csp784653wro;
        Tue, 24 Oct 2017 09:45:20 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+Sw0vlSfdFPsSABX2DkxoPi2gj9LDvwj+YImzAEi0QBSGP+m0cYicAF+g5R9xiKRThgVf7b
X-Received: by 10.37.95.77 with SMTP id h13mr11362709ybm.85.1508863520716;
        Tue, 24 Oct 2017 09:45:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508863520; cv=none;
        d=google.com; s=arc-20160816;
        b=dWawJc2Q8dJ1SPncKTwAYQiKK86oEHShIcQjhMTWd7tYkyt2jdvZciGWmKZUEayPg8
         6K3cfZOMblCnpqJPqc6HX5Uji/EvDqvqN8Cl3pBuEu9hjyYxYCMjp/at65iaQTV+BO38
         0kl+kkAI6qRx1WztYonCHyC0FpDuDxUKmvOj1+5LTCJ12GGeE3T6k7/0OypbL26GpQka
         5XaHvPR4oOYU7jBIhKAadPNSgqTtNhmSo6kaP2x4n2mu/KMjdh7WY71Z/UErR7DzmJV3
         z2bU2qq3b/zvj1DLB8nT5GbMksQ4tk2YzvyxOQtYe1IG7wT+kCTW6JylBg963S4oluwQ
         93NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:from:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:subject
         :mime-version:content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:msip_labels:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic:to
         :dkim-signature:arc-authentication-results;
        bh=aaiiwHgWcRRqR/ZZmIrbRIEzJJcdAWOI3ewYAUvxj9w=;
        b=bEM1NctvmcyPZt4COBvVnqvHscBOuKqup4wVl6MDtTT7Bu1WN48tzuCoUbG698NnGe
         dhI5bySgxCzrHzUntqRg95DlohoD8zptInZqj/ifVauFJRwinNp8Bi6l1J6+F9g//QFB
         SAq2hElRcOsQ3hxVHM0U4/8U+h7U9fO8Ix0VZ+0XvKScP/NuhD7fT4EzgcM2TfOp+qV5
         aJGekXdFuma2tKCpPe4A0hLnpbdrS1VZW3gpFRuQknkTOuo1q0axvvA5zo4ZdKYlPPHq
         RFPx8VPK3NlR8XHzAhKL4p97Sz68aJwpJnhkA/4bm760D+VWWSNRDVDqT7vMwowsGH9w
         Yikg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@microsoft.com header.s=selector1 header.b=LO76FZiZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t186si104965ywc.510.2017.10.24.09.45.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 24 Oct 2017 09:45:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@microsoft.com header.s=selector1 header.b=LO76FZiZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44684 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e72KO-0003JB-4E
	for alex.bennee@linaro.org; Tue, 24 Oct 2017 12:45:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53323)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1e72KA-0003HP-2K
	for qemu-arm@nongnu.org; Tue, 24 Oct 2017 12:45:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1e72K8-00057R-LK
	for qemu-arm@nongnu.org; Tue, 24 Oct 2017 12:45:06 -0400
Received: from mail-bn3nam01on0126.outbound.protection.outlook.com
	([104.47.33.126]:31260
	helo=NAM01-BN3-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Andrew.Baumann@microsoft.com>)
	id 1e72K3-0004uz-33; Tue, 24 Oct 2017 12:44:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
	bh=aaiiwHgWcRRqR/ZZmIrbRIEzJJcdAWOI3ewYAUvxj9w=;
	b=LO76FZiZ41q9z0o+R0DL8xCNoLtpSXE+h0pQsiuBAlG2QsD9nSZGvxUnxpKYrrTQiuYqDHTYPgoWqyVDYzbY6+sskxn0ju2VMdwyQXuqN/z05kKcmjmNzGcCiWbQSx+ys76wb+VyYE9hPukN3gDIMQcA65+AwMWvcbtEXsU5qBY=
Received: from MWHPR21MB0159.namprd21.prod.outlook.com (10.173.52.17) by
	MWHPR21MB0480.namprd21.prod.outlook.com (10.172.102.19) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.156.5; Tue, 24 Oct 2017 16:44:57 +0000
Received: from MWHPR21MB0159.namprd21.prod.outlook.com ([10.173.52.17]) by
	MWHPR21MB0159.namprd21.prod.outlook.com ([10.173.52.17]) with mapi id
	15.20.0156.005; Tue, 24 Oct 2017 16:44:56 +0000
To: bzt bzt <bztemail@gmail.com>
Thread-Topic: [Qemu-devel] [PATCH] BCM2837 and machine raspi3
Thread-Index: AQHTS1iaOqiv7GBJY0mQ9agTHxJPvKLxn5ZggAElsACAAG5+QA==
Date: Tue, 24 Oct 2017 16:44:56 +0000
Message-ID: <MWHPR21MB01591543E188B048145985709E470@MWHPR21MB0159.namprd21.prod.outlook.com>
References: <CADYoBw2dogvU6-3vChG4js0BNdyTPG8eDvMSRoU50eTX_9DdEQ@mail.gmail.com>
	<MWHPR21MB01590CD596A992C93E01B5079E460@MWHPR21MB0159.namprd21.prod.outlook.com>
	<CADYoBw1ksGDo26-PC4eMnyqxZQoZkXNLDeGoWfcRHs-SfTCJkw@mail.gmail.com>
In-Reply-To: <CADYoBw1ksGDo26-PC4eMnyqxZQoZkXNLDeGoWfcRHs-SfTCJkw@mail.gmail.com>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=baumann@microsoft.com;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2017-10-24T16:44:54.1076836Z;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft
	Azure Information Protection;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic;
	Sensitivity=General
x-originating-ip: [2001:4898:80e8::fd]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR21MB0480;
	6:BEkgbUaUZvi3l8rfKH0Cigsaq23eZ32oyFx5xYEBFHNyaAbN9KzU+ssTa2oMKH/UAB7Is9/h7t38/uD13gcboUL/1Z0KvzxCKq9JFUTlbB3nzKr6syV9qIeLz/ektkXJPdNJfZ3657pk7auew+7cqpWhd2FWELqGOiPPzDsuudjoRQlM7I36xKPreou8kWA6WgYYW9Bm+/qO7Mucn5iYe2FSLAWclTccSJq8fAxuvC+aIHpXOoZhmzDX4TaBNVwsi5aIKVjz2lqFB+toLhjhqsyUgwfU5xjeye+/VIaG7kYeaS2tHeEX/mN2nNBYcHuL1GtYcSozM/FJMxQksBnXGA==;
	5:x8+Hz32h/sv8b9gY/pN7Fdd60jZIdDhDYsa6b8fB2O3nC1TsmX2IkRC05Kr5HYwagtDR/1XtxnZlQ05cCMt+zYQmxutxEjWhqV7zjdkcw1Lw5Qa93/yRVDqBjilyWds9AjxGAARAq+54+pVvpZZffw==;
	24:81uSwqv55Z2A+UKJ0NZNaKXQ4HeTCABO8dxSt7G6IX+OmtAg22VrBWqbD8uWFMNeTAi5gqiLBEdO9Gd9hVaD1MvOtHOWrWEoqMbwLgB5+5A=;
	7:DHWUk9LDKmVyGE35vC2y2ALw8vfv365CVv2ywOUudtcgPgzmGKIcqEHopA7F+z058IqQ/tedEgkGmeA8xYUGG5hNmtDzdTmtXd17YVhd9l/JPrpCYPPcKDSxsq8YDu87Uf4yVt0mQNq0AuMTatO/jqiDMSpxME2X0YRBZdGjWewBd1qcMyK5wyvK9nTSInzm8fXLNtbOa/n5CXKFQ41ybEldU2IJG7+4UR2ALRvD+9w=
x-ms-exchange-antispam-srfa-diagnostics: SSOS;
x-ms-office365-filtering-correlation-id: db4b2bcc-4f45-4724-9771-08d51afe8f39
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(48565401081)(4534020)(4602075)(4627075)(201703031133081)(201702281549075)(2017052603229);
	SRVR:MWHPR21MB0480; 
x-ms-traffictypediagnostic: MWHPR21MB0480:
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Andrew.Baumann@microsoft.com; 
x-exchange-antispam-report-test: UriScan:;
x-microsoft-antispam-prvs: <MWHPR21MB0480C582D11FDFA4D0D86B879E470@MWHPR21MB0480.namprd21.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(61425038)(6040450)(2401047)(5005006)(8121501046)(3231020)(3002001)(100000703101)(100105400095)(10201501046)(93006095)(93001095)(6055026)(61426038)(61427038)(6041248)(20161123555025)(20161123558100)(20161123562025)(20161123560025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123564025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:MWHPR21MB0480; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:MWHPR21MB0480; 
x-forefront-prvs: 047001DADA
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(39860400002)(376002)(346002)(47760400005)(199003)(24454002)(189002)(8676002)(6246003)(14454004)(39060400002)(4326008)(6916009)(2950100002)(189998001)(53546010)(5660300001)(7696004)(1411001)(101416001)(478600001)(6506006)(77096006)(6436002)(97736004)(2900100001)(229853002)(8990500004)(10290500003)(72206003)(25786009)(68736007)(2906002)(3280700002)(3660700001)(102836003)(6116002)(10090500001)(106356001)(105586002)(86362001)(50986999)(76176999)(316002)(22452003)(54356999)(9686003)(33656002)(54906003)(81156014)(74316002)(53936002)(99286003)(81166006)(8936002)(7736002)(55016002)(86612001)(305945005);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR21MB0480;
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
X-MS-Exchange-CrossTenant-Network-Message-Id: db4b2bcc-4f45-4724-9771-08d51afe8f39
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2017 16:44:56.7302 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR21MB0480
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.33.126
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
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TXMKnLtiSy4z

PiBGcm9tOiBienQgYnp0IFttYWlsdG86Ynp0ZW1haWxAZ21haWwuY29tXQ0KPiBTZW50OiBUdWVz
ZGF5LCAyNCBPY3RvYmVyIDIwMTcgMDI6NTQNCj4gT24gTW9uLCBPY3QgMjMsIDIwMTcgYXQgNjoz
NCBQTSwgQW5kcmV3IEJhdW1hbm4gd3JvdGU6DQo+IAlBcmUgdGhlcmUgYW55IGNoYW5nZXMgZnJv
bSBiY20yODM2IG90aGVyIHRoYW4gdGhlIENQVSBtb2RlbD8NCj4gDQo+IA0KPiAJRHVwbGljYXRp
bmcgdGhlIHdob2xlIGZpbGUganVzdCB0byBoYXZlIGEgZGlmZmVyZW50IENQVSBzZWVtcyBsaWtl
IGEgYmFkDQo+IGlkZWEgdG8gbWUuIEkgd291bGQgc3VnZ2VzdCBwYXJhbWV0ZXJpc2luZyB0aGUg
Q1BVIG1vZGVsIGluIGJjbTI4MzYgKGFuZA0KPiBtYXliZSBub3RpbmcgaW4gaGVhZGVyIGNvbW1l
bnRzIGV0Yy4gdGhhdCBpdCBjYW4gYWxzbyBtb2RlbCAyODM3KSwgYW5kIHRoZW4NCj4gaW5zdGFu
dGlhdGluZyBpdCBmcm9tIHJhc3BpLmMgd2l0aCB0aGUgY29ycmVjdCBDUFUgdHlwZSBkZXBlbmRp
bmcgb24gd2hpY2gNCj4gbWFjaGluZSBpcyBiZWluZyB1c2VkLiBUaGF0IHdpbGwgYWxzbyByZWR1
Y2UgdGhlIHNpemUgb2YgdGhlIHBhdGNoIHNpZ25pZmljYW50bHksDQo+IHdoaWNoIHdpbGwgbWFr
ZSBpdCBlYXNpZXIgdG8gZ2V0IGl0IHJldmlld2VkLg0KPiANCj4gDQo+IA0KPiBGb3Igbm93LCB0
aGVyZSdzIG5vIG1vcmUgZGlmZmVyZW5jZSBpbiB0aGUgZW11bGF0aW9uIHRoYW4gdGhlIENQVSwg
YnV0DQo+IEJDTTI4MzcgaGFzIGEgbG90IG1vcmUgdG8gb2ZmZXIgKDQwIGJpdCBhZGRyZXNzIHNw
YWNlLCB3aWZpLCBibHVldG9vdGggZXRjLikuIFNvDQo+IHNvb25lciBvciBsYXRlciBpdCB3aWxs
IG5lZWQgaXQncyBvd24gc291cmNlIGZpbGUgdG8gc3VwcG9ydCBhbGwgb2YgdGhhdCB3aXRob3V0
DQo+IGdldHRpbmcgdGhlIGNvZGUgbWVzc3kuIEkgaGF2ZSBhc2tlZCBQZXRlciB3aGV0aGVyIGl0
IGRvZXMgd29ydGggd3JpdGluZw0KPiBmdXR1cmUgcHJvb2YgY29kZSwgb3Iga2VlcCB0aGUgY2hh
bmdlIGF0IHRoZSBiYXJlIG1pbmltdW0sIGJ1dCBoYWQgbm8gYW5zd2VyDQo+IHlldC4NCg0KSSBz
ZWUuIFRoZSBhZGRyZXNzIHNwYWNlIHNpemUgc291bmRzIGxpa2UgaXQgd291bGQgYWZmZWN0IHRo
ZSBTb0MgKGFsdGhvdWdoIGlzIHRoZXJlIHJlYWxseSA0MCBiaXRzIG9mIHVzYWJsZSBwaHlzaWNh
bCBhZGRyZXNzIHNwYWNlIGJleW9uZCB0aGUgY29yZT8pLiBJZiBpdCdzIGxpa2UgcGkyLCBob3dl
dmVyLCB0aGUgd2lmaSBhbmQgQlQgYXJlIGJvdGggYmVoaW5kIFVTQiwgc28gdGhhdCB3b3VsZCBi
ZSBoYW5kbGVkIG1vcmUgbmF0dXJhbGx5IGluIHRoZSBib2FyZCBtb2RlbCAocmFzcGkuYykgdGhh
biB0aGUgU29DLg0KDQo+IFdlbGwsIGJjbTI4MzcgaXMgYmFja3dhcmQgY29tcGF0aWJsZSB3aXRo
IHRoZSBiY20yODM2LCBidXQgaGFzIGEgbG90IG1vcmUNCj4gcmVnaXN0ZXJzIGFuZCBhIGRpZmZl
cmVudCBib290IHVwIHByb2Nlc3MgKGRpZmZlcmVudCBhZGRyZXNzIGFuZCBubyBhdGFncykuIFRo
ZQ0KPiBjb21tb24gZnVuY3Rpb25hbGl0eSBpcyBhbHJlYWR5IGluIGJjbTI4MzVfcGVyaXBoZXJh
bHMsIGFuZCB0aGUgTU1JTw0KPiBhZGRyZXNzIGNoYW5nZSBmcm9tIGJjbTI4MzUgdG8gYmNtMjgz
NiBoYXMgYWxyZWFkeSBiZWVuIGFkZGVkIGJ5IHlvdS4NCj4gV2hhdCdzIGRpZmZlcmVudCBpcyBh
IGxvdCBtb3JlIGRldmljZXMsIHdoaWNoIGltaG8gd291bGQgYmUgdW53aXNlIHRvIGFkZCB0bw0K
PiBiY20yODM1IG9yIGVpdGhlciB0byBiY20yODM2LiBTbyB0byBiZSBmdXR1cmUgcHJvb2YgSSd2
ZSBjcmVhdGVkIGEgc2VwYXJhdGVkDQo+IGZpbGUsIGJ1dCB5b3UgYXJlIHJpZ2h0IGF0IHRoZSBj
dXJyZW50IGxldmVsIG9mIGVtdWxhdGlvbiBpdCdzIG5vdCBuZWNlc3NhcnkuDQoNClJpZ2h0LCBi
dXQgYXMgSSB3cm90ZSBhYm92ZSBpZiB0aG9zZSBkZXZpY2VzIGFyZSBiZWhpbmQgVVNCIHRoYXQn
cyBub3QgcGFydCBvZiB0aGUgU29DIG1vZGVsLCBhbmQgYmVsb25ncyBpbiB0aGUgYm9hcmQgbG9n
aWMuIElmICJtb3JlIHJlZ2lzdGVycyIganVzdCByZWZlcnMgdG8gdGhlIENQVSwgdGhlbiB0aGF0
J3MgaXJyZWxldmFudC4gSWYgdGhlcmUgYXJlIHJlYWxseSBtb3JlIGRldmljZXMgLyBkZXZpY2Ug
cmVnaXN0ZXJzIG9uIHRoZSBzeXN0ZW0gYnVzLCB0aGVuIHRoYXQgY2FsbHMgZm9yIGEgZGVlcGVy
IGNoYW5nZSBpbiB0aGUgU29DIG1vZGVsIGFuZCBwZXJoYXBzIGEgbmV3IGltcGxlbWVudGF0aW9u
Lg0KDQo+IAlTaW1pbGFybHksIHRoaXMgbG9va3MgbGlrZSBhIGNsb25lIG9mIHJhc3BpMl9pbml0
LiBJIHRoaW5rIGl0IHdvdWxkIGJlIGJldHRlcg0KPiB0byBoYXZlIG9uZSBmdW5jdGlvbiwgcGFy
YW1ldHJpc2VkIGlmIG5lZWRlZC4NCj4gDQo+IA0KPiANCj4gRm9yIG5vdywgeWVzLiBCdXQgdGhl
IGV4dHJhIGRldmljZXMgYmNtMjgzNyBoYXZlIHdpbGwgbmVlZCBleHRyYSBpbml0aWFsaXphdGlv
biwNCj4gYW5kIEkgdGhvdWdoIGl0IHdvdWxkIGJlIGNsZWFyZXIgdG8gc2VwYXJhdGUgaW4gYWR2
YW5jZS4gQWdhaW4sIEkndmUgYXNrZWQgUGV0ZXINCj4gYWJvdXQgdGhpcywgYnV0IGhhZCBubyBy
ZXNwb25zZS4gQXMgSSBzZWUgaGF2aW5nIGEgcGFyYW1ldHJpc2VkIHNpbmdsZSBmdW5jdGlvbg0K
PiBpcyBzaW1wbGllciBmb3Igbm93LCBidXQgY291bGQgbGVhZCB0byBhIG1lc3N5IGNvZGUgbGF0
ZXIgd2hlbiBhbGwgdGhlIFNvQw0KPiBmZWF0dXJlcyB3aWxsIGJlIGFkZGVkLiBCdXQgSSdtIGFp
bid0IG5vIGV4cGVydCBvbiBxZW11IHNvdXJjZSwgdGhpcyBpcyBteSBmaXJzdA0KPiBwYXRjaCwg
c28gSSdtIG9wZW4gdG8gc3VnZ2VzdGlvbnMhIDotKQ0KDQpJJ20gbW9yZSBvcGVuIHRvIHRoZSBu
ZWVkIGZvciBldm9sdXRpb24gaW4gdGhlIG1hY2hpbmUgaW5pdCBsb2dpYyAocmFzcGkuYyksIHNv
IHNwbGl0dGluZyB0aGVyZSBtYWtlcyBtb3JlIHNlbnNlIHRvIG1lIHRoYW4gaW4gYmNtMjgzNi83
Lg0KDQpJIHNlZSB5b3UganVzdCBwb3N0ZWQgYW5vdGhlciBwYXRjaC4gRldJVywgdGhpcyBpc24n
dCBxdWl0ZSB3aGF0IEkgd2FzIHByb3Bvc2luZyAtLSByYXRoZXIgdGhhbiBoYXZlIGJjbTI3MzYu
YyB0YWtlIGEgdmVyc2lvbiBudW1iZXIgdGhhdCBpcyAyIG9yIDMsIEkgd291bGQganVzdCBwYXNz
IGl0IHRoZSBDUFUgbW9kZWwgdG8gaW5zdGFudGlhdGUuIEJ1dCBhdCB0aGlzIHBvaW50IEkgdGhp
bmsgaXQncyBiZXN0IHdhaXRpbmcgZm9yIG9uZSBvZiB0aGUgUWVtdSBtYWludGFpbmVycyB0byBj
aGltZSBpbiBhbmQgc2VlIHdoYXQgdGhleSBwcmVmZXIuDQoNCkFuZHJldw0K
