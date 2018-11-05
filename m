Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp2841614wro;
        Mon, 5 Nov 2018 09:16:48 -0800 (PST)
X-Google-Smtp-Source: AJdET5fwmZvL4ml9v0B7wdxD/wzjdrKW2kklHY/RTigf340TJuDde4eLBmgjdCfspTVGybKgASTv
X-Received: by 2002:a0c:9dc6:: with SMTP id p6mr1441532qvf.217.1541438208192;
        Mon, 05 Nov 2018 09:16:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541438208; cv=none;
        d=google.com; s=arc-20160816;
        b=V7f+qLywQaLmoym+hR13zrnZSJKgROmL8jhbCoZNiwpyiIJGKfEMvE/x1Oy8CN7kdI
         ncp0zzuOgpHYV7Oo3RUX5Eeq5rNjMUs/nJL+YRIM4tH5Wmx8mLhtyOsx+Jxbfz4FNiDE
         hQIHfK/YrQKon5ZP6yD3+3CQ6TwINwYBvSmuox/dAAwLAw0GW/OA8O9hOYcYd6edMVE2
         mZCStR6vsrOeSP/X8xzGb62Sehx6pDyRUQFUYQYmtT7bxSdAlWeSdlnKvxPlf+gLLAU/
         AQPDahw96lZzT7k7UAx505aXFaP9AZip7o4sbiNdYposILyr4zS5frRHuqidpdEH4SDt
         k6ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:from:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:subject
         :mime-version:content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to
         :dkim-signature;
        bh=NI32MCGUXFrp3ivgs0uMwhNUwz430seK0pYMu5B0aLk=;
        b=BayTtr1JCgHEdyGk6sOjoNBX1oq/pUL2QsPHNSkGPzsWVCLFqLGd10WAkdNN4VFNaO
         egT7oGzAEp9z35ReztDaAFZ7gZAjsli7HSEj7hB9npxSXQofuc4kP7EyfQeLcgrPE/Yv
         Yao5IFuzEDCHbUROWqj01EQEoiOFM5ijip78ev4A4QC8dbnLaOemXRXkcU13hMceQOok
         VOIAN/U+QeFMQ2lluxasylwCo0h6EZhx3tJgvfjvva/brvvROUKwTmAV1Bg9bO8BZqfv
         p9TTENOexpdCiOE4uK4AcLv5TX5oW/BIb1+yPH6SItkv2d0HZmQeeh+HACf+ZArDZrJv
         qAIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@microsoft.com header.s=selector1 header.b=AMy0vZ5k;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z1si1404167qtc.127.2018.11.05.09.16.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 05 Nov 2018 09:16:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@microsoft.com header.s=selector1 header.b=AMy0vZ5k;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36460 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gJiUZ-0002NO-Jw
	for alex.bennee@linaro.org; Mon, 05 Nov 2018 12:16:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34329)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1gJiOc-00047P-VT
	for qemu-devel@nongnu.org; Mon, 05 Nov 2018 12:10:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1gJiKu-0005ue-HZ
	for qemu-devel@nongnu.org; Mon, 05 Nov 2018 12:06:51 -0500
Received: from mail-bl2nam02on0119.outbound.protection.outlook.com
	([104.47.38.119]:31184
	helo=NAM02-BL2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Andrew.Baumann@microsoft.com>)
	id 1gJiKu-0005ov-7a; Mon, 05 Nov 2018 12:06:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=NI32MCGUXFrp3ivgs0uMwhNUwz430seK0pYMu5B0aLk=;
	b=AMy0vZ5k84CjC637K1DGfGRj46GDxNLQF/U6zvjt3bZQ80nag2lrmx0gGBjHs2/v3w1/NO6MILREZag8NtPYQzNbuiWALemtzJVSvaOsy2HZv9ZE7j6gadTH3rQu8IRmeglFIerZ/MCCak6sPzMuBPwPM3dwSlg+7oPu+YApSdc=
Received: from MWHPR21MB0189.namprd21.prod.outlook.com (10.173.52.135) by
	MWHPR21MB0287.namprd21.prod.outlook.com (10.173.53.17) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1294.4; Mon, 5 Nov 2018 17:06:45 +0000
Received: from MWHPR21MB0189.namprd21.prod.outlook.com
	([fe80::cdac:4513:3c87:dd56]) by
	MWHPR21MB0189.namprd21.prod.outlook.com
	([fe80::cdac:4513:3c87:dd56%16]) with mapi id 15.20.1339.006;
	Mon, 5 Nov 2018 17:06:45 +0000
To: Peter Maydell <peter.maydell@linaro.org>,
	=?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Thread-Topic: [PATCH for 3.1 v2 1/7] MAINTAINERS: Add an entry for the
	Raspberry Pi machines
Thread-Index: AQHUdRvimBICU3vmBUWrS716vXkjCqVBaLPw
Date: Mon, 5 Nov 2018 17:06:45 +0000
Message-ID: <MWHPR21MB018970A4F8FA0E42B5DD48229ECA0@MWHPR21MB0189.namprd21.prod.outlook.com>
References: <20181102001303.32640-1-f4bug@amsat.org>
	<20181102001303.32640-2-f4bug@amsat.org>
	<CAFEAcA-DZMivo-epUmM6NxPzCUbGCfSU+SxEjszTNLdVaB8UxQ@mail.gmail.com>
In-Reply-To: <CAFEAcA-DZMivo-epUmM6NxPzCUbGCfSU+SxEjszTNLdVaB8UxQ@mail.gmail.com>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [131.107.147.183]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR21MB0287;
	6:pLjH4NSAyVx6aHajFaKYu83o5RoFvGng6TrXBetvTZszLHHkhkAs8zTg5Z+3dz4kmnUmbrY/7BctaPK9KQaMJsBNqz3uS4RIaNVqvDPo5B8KvQgdFm8gfck7UWWBASmFX90wSdFrWcy9XxI83jjIrl7fmh59R7F5qOIrw1QeFnXqww7BNvn1Yw+PCWCcIi/Kkm5wyu101TUqBELchwQuuZHerFHPciJe8A5c5S6z9IvsDarSgPLhEbTaR4qFbP261sTAmg9CiPmMqO0nPajosE8RXXttntGbfhgo6rkawcadM38yO1jAcDppt3Y4bqMnNs16o43GVdFw7C2tSWZuxOYTacefvRSCqlbXdbbpF+63HxRDCnTQ2qcae8r7XW0Uzw+JrGZxiXYHBrIE5ECSqdCG+fuBMjWvIYFhObVaLA7Bu0nAkPja7WFf+an4FTKP75VOlV0+SOTOX6cglpy2BA==;
	5:ufkQ373mJO/x0hUv/hvRV3zw/se01uZxQvnl/Keo6rbn6InmkOjI6nT/A9GLiD39yQx9DejCHxEegAGEvQgUgggWCvcuJg0GCtkUHaRvxbg1I7lN3RkT76gQ1jdmh29D4Ou5Rrj5nqGIDgjzZ0tavFKIw0vOKDipQrwV9UQRlA0=;
	7:FC45jqjS2sUChobgSMrPY8XIsFvAE3jVowuE2phykrltPn7QxLGx4/NCGDgNhCG6d1imToHGoUScQSHaO7xG6TOZPCE26t57fClcXdDkr1VJjPV1azs78TdejIJTC1fLDyzgCdcBFg1VOlTRqoKpPQ==
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: dc92e3ac-7d06-4adf-4388-08d64341110e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7193020);
	SRVR:MWHPR21MB0287; 
x-ms-traffictypediagnostic: MWHPR21MB0287:
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Andrew.Baumann@microsoft.com; 
x-o365-sonar-daas-pilot: True
x-o365eop-header: O365_EOP: Allow for Unauthenticated Relay
x-o365ent-eop-header: Message processed by -  O365_ENT: Allow from ranges
	(Engineering ONLY)
x-microsoft-antispam-prvs: <MWHPR21MB02872A0903EE5529DBB8526B9ECA0@MWHPR21MB0287.namprd21.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(8220035)(2401047)(5005006)(8121501046)(3002001)(10201501046)(93006095)(93001095)(3231382)(944501410)(52105095)(2018427008)(6055026)(148016)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123560045)(20161123558120)(20161123564045)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR21MB0287; BCL:0; PCL:0; RULEID:; SRVR:MWHPR21MB0287; 
x-forefront-prvs: 08476BC6EF
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(136003)(396003)(346002)(39860400002)(366004)(376002)(189003)(199004)(97736004)(2900100001)(6436002)(105586002)(316002)(53936002)(55016002)(68736007)(66066001)(6506007)(53546011)(25786009)(102836004)(33656002)(10090500001)(99286004)(9686003)(74316002)(76176011)(71200400001)(81166006)(4326008)(8676002)(6116002)(7736002)(3846002)(8936002)(5660300001)(81156014)(2906002)(229853002)(7696005)(305945005)(110136005)(106356001)(14454004)(486006)(54906003)(446003)(476003)(26005)(10290500003)(186003)(8990500004)(86612001)(22452003)(71190400001)(11346002)(6246003)(86362001)(256004)(72206003)(478600001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR21MB0287;
	H:MWHPR21MB0189.namprd21.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: AVwOBAMOlNAXkmF0co94RIwf6jbvMPjS5AdPKJMZoEc/jmJx8f0bF3HFjW+BQo097t5kNnOXI5Th1lZn1CRg5pddUtbZvZHwIfq3fQx21GiOpUUgxN2gTOHfp1bUEcrVkxM1qGDrFNZ0GsHkD9J4XWV5Vj1wMe2qrtqkeBWDjpgkupoc6+EE7J121wF89RGQ9b13mp9kpZl+bSGx99pWP+Sc6SbrNczBhUaleI3OprWiI7Fi8gsyjZPTf8AYLq0aO/dSlAq2Wlqmk0e5wrKZO+ZpNl3jFyJJ9f42Kttg7KbnUmls85zPeF6o/fk/FXbs4TBSoDTQUFLSzbalATXbGH5HlIl38KidZKIs8/LEmkU=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc92e3ac-7d06-4adf-4388-08d64341110e
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2018 17:06:45.5644 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR21MB0287
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.38.119
Subject: Re: [Qemu-devel] [PATCH for 3.1 v2 1/7] MAINTAINERS: Add an entry
 for the Raspberry Pi machines
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
From: Andrew Baumann via Qemu-devel <qemu-devel@nongnu.org>
Reply-To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ivgEIBRWgesT

PiBGcm9tOiBQZXRlciBNYXlkZWxsIDxwZXRlci5tYXlkZWxsQGxpbmFyby5vcmc+DQo+IFNlbnQ6
IE1vbmRheSwgNSBOb3ZlbWJlciAyMDE4IDA3OjI2DQo+IA0KPiBPbiAyIE5vdmVtYmVyIDIwMTgg
YXQgMDA6MTIsIFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxmNGJ1Z0BhbXNhdC5vcmc+DQo+IHdy
b3RlOg0KPiA+IFNvIGZhciB0aGUgUmFzcGkgbWFjaGluZXMgdXNlIHRoZSBCQ00yODM2IFNvQyB3
aGljaCBpbmNsdWRlcyBhIEJDTTI4MzUNCj4gPiBmb3IgdGhlIHBlcmlwaGVyYWxzLg0KPiA+DQo+
ID4gU2lnbmVkLW9mZi1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPGY0YnVnQGFtc2F0Lm9y
Zz4NCj4gPiAtLS0NCj4gPiAgTUFJTlRBSU5FUlMgfCA2ICsrKysrKw0KPiA+ICAxIGZpbGUgY2hh
bmdlZCwgNiBpbnNlcnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMg
Yi9NQUlOVEFJTkVSUyBpbmRleCBmMjM2MGVmZTNlLi5jNDFlYTVlZDNmDQo+ID4gMTAwNjQ0DQo+
ID4gLS0tIGEvTUFJTlRBSU5FUlMNCj4gPiArKysgYi9NQUlOVEFJTkVSUw0KPiA+IEBAIC02ODMs
NiArNjgzLDEyIEBAIEY6IGh3L2FybS9ucmY1MV9zb2MuYw0KPiA+ICBGOiBody9hcm0vbWljcm9i
aXQuYw0KPiA+ICBGOiBpbmNsdWRlL2h3L2FybS9ucmY1MV9zb2MuaA0KPiA+DQo+ID4gK1Jhc3Bi
ZXJyeSBQaQ0KPiA+ICtMOiBxZW11LWFybUBub25nbnUub3JnDQo+ID4gK1M6IE9kZCBGaXhlcw0K
PiA+ICtGOiBody8qL2JjbTI4MyoNCj4gPiArRjogaW5jbHVkZS9ody8qL2JjbTI4MyoNCj4gPiAr
DQo+IA0KPiBXZSBzaG91bGQgYWxzbyBoYXZlIEY6aHcvYXJtL3Jhc3BpLmMNCj4gDQo+IEFuZHJl
dywgYXMgdGhlIG9yaWdpbmFsIHN1Ym1pdHRlciBvZiB0aGUgUmFzcGJlcnJ5IFBpIGNvZGUgd291
bGQgeW91IGxpa2UgdG8NCj4gYmUgbGlzdGVkIGFzIGEgbWFpbnRhaW5lciBmb3IgaXQ/DQoNClRo
YW5rcyBmb3IgYXNraW5nOyBwcm9iYWJseSBub3QgLS0gSSdtIGhhcHB5IHRvIHJldmlldyB0aGUg
b2RkIHBhdGNoIGlmIG15IGlucHV0IHdvdWxkIGJlIGhlbHBmdWwsIGJ1dCBJIGhhdmVuJ3Qgd29y
a2VkIG9uIGl0IGZvciB5ZWFycywgYW5kIEkgZG9uJ3QgaGF2ZSBzcGFyZSBjeWNsZXMsIHNvIEkn
ZCBqdXN0IGJlIGEgYm90dGxlbmVjay4NCg0KQW5kcmV3DQo=
