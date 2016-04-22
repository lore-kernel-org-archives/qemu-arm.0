Received: by 10.25.208.194 with SMTP id h185csp720188lfg;
        Fri, 22 Apr 2016 04:57:34 -0700 (PDT)
X-Received: by 10.140.16.133 with SMTP id 5mr20809021qgb.50.1461326254042;
        Fri, 22 Apr 2016 04:57:34 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u11si3466129qhu.103.2016.04.22.04.57.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Apr 2016 04:57:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@microsoft.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:60086 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1atZiH-00070n-E7
	for alex.bennee@linaro.org; Fri, 22 Apr 2016 07:57:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36390)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1atZhN-0005zt-7K
	for qemu-devel@nongnu.org; Fri, 22 Apr 2016 07:56:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1atZhJ-0004Jd-BI
	for qemu-devel@nongnu.org; Fri, 22 Apr 2016 07:56:36 -0400
Received: from mail-by2on0117.outbound.protection.outlook.com
	([207.46.100.117]:45754
	helo=na01-by2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1atZhJ-0004If-0a; Fri, 22 Apr 2016 07:56:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=LSMSKZW+2q1P664D60RXMsXmOcXipBcAkQDi3bZYtfQ=;
	b=ZppsvlpKHdQCExoStHwHlAWtAvx3wo0//GkQ92x2ACqrZouyOIfilIZInRFWCzf1IaZZQgUkBFJ8sedxfpPuVnnJqoNduOYMyn5t5wLFayWBCcsvRZX7biXAMaVcyxcZ2y/N9Qkf1NiTG8aC5TGRUanElfRWpkxdoHlh7IgdEi0=
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com (10.164.22.24) by
	BLUPR0301MB2034.namprd03.prod.outlook.com (10.164.22.24) with Microsoft
	SMTP Server (TLS) id 15.1.466.19; Fri, 22 Apr 2016 11:56:30 +0000
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) by
	BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) with mapi id
	15.01.0466.023; Fri, 22 Apr 2016 11:56:30 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: Gerd Hoffmann <kraxel@redhat.com>, Peter Crosthwaite
	<crosthwaitepeter@gmail.com>
Thread-Topic: [Qemu-devel] [Qemu-arm] [PATCH] bcm2835_property: use cached
	values when querying framebuffer
Thread-Index: AQHRm8u+qM+NdH2KakOQE6S3pLfMN5+UYRwAgAABQYCAAAW/gIAAB6kAgAAG0QCAACFSgIAA/qeAgAAH9ICAAEKyYA==
Date: Fri, 22 Apr 2016 11:56:30 +0000
Message-ID: <BLUPR0301MB2034706BA58E0B2F97B0F7059E6F0@BLUPR0301MB2034.namprd03.prod.outlook.com>
References: <1461235306-3393-1-git-send-email-sylvain@sylvaingarrigues.com>
	<CAFEAcA8mLk+3t+ypR96WPG9yMsvbJ4hmgk1NwfxPLHzk0R=Dwg@mail.gmail.com>
	<DD3027E2-6F96-4D87-B2C5-02E9926AA402@sylvaingarrigues.com>
	<CAFEAcA_nE2Ee_Ky+upz4veasmkyiVSHqyUe2-brtfopJA2-=_g@mail.gmail.com>
	<A03258E3-4CFE-49F8-8601-1467CD70AC29@sylvaingarrigues.com>
	<CAFEAcA-yDZKEgZfFmtgn3+j3qCKo_zUJwp40BRERF4rF-tjASw@mail.gmail.com>
	<DED29353-D9CE-45F5-990F-0A32DB57B4AE@sylvaingarrigues.com>
	<5718FA7F.5030903@wwwdotorg.org>
	<CAPokK=qiaGkd3oZ+r_cLNov4gvAF6Qtv-p6NwxHkY_m4_NrqRg@mail.gmail.com>
	<1461311177.28204.67.camel@redhat.com>
In-Reply-To: <1461311177.28204.67.camel@redhat.com>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
	header.d=none; redhat.com;
	dmarc=none action=none header.from=microsoft.com; 
x-originating-ip: [82.50.189.71]
x-ms-office365-filtering-correlation-id: 5d6df78c-a739-46d0-cc38-08d36aa524b5
x-microsoft-exchange-diagnostics: 1; BLUPR0301MB2034;
	5:/zAO9Og2eJpRTcZ+OWfq92GJeyegVQdAkIneguznVvq6ufOeU7W+m6VzzdkFENo3+tUpUgDtjcI/aK3E4LRZRalLqOJCf1z4bkUOK1nYo9CirvmIbTT8jzH5Or3kotqzM2wIcmx3U1a/usMn9taiWdadxjGnK7lq8xGMkFHLilTOzuK4CDVhV8Acjt91LYmk;
	24:bl+dFRG5YM6th/eTYU/SOfF2ymKVlzoWUp87PwBLF94RZ/AmHqv6zYixlUhG8WlMlstc3Lw2JmnsQW7boedl1G0xyuwtHN0mT9sXkxX1b5M=;
	7:mYChWEPDLs+/yqeA3QjJut5Se+1A8fgz5PKGBEcmV8Hkr7nIjPjj4l9OoIx+/yiv70RRYf4BBknvCK2HBevV/GFgPxUBtAUhg7Lsex7GYBtodv9OCx+eT5p4IjnlBu0WTd56+ppSNZKp4WnrIjrvRQlI7Zb3vggjVmjXoE1zfhxIUaZbzOKE8zpBjmHjqzRl4xyop0hF6Ge6/ibaBV4jBpt6kw+PNLHpJC2TAZC4Q2c7ooG17/5XcQEIOW2cO8/J
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR0301MB2034;
x-microsoft-antispam-prvs: <BLUPR0301MB20340B0A8D05C1E94B58CEF69E6F0@BLUPR0301MB2034.namprd03.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(9101521026)(61425038)(601004)(2401047)(8121501046)(5005006)(3002001)(10201501046)(6055026)(61426038)(61427038);
	SRVR:BLUPR0301MB2034; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2034; 
x-forefront-prvs: 0920602B08
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(4326007)(5002640100001)(81166005)(77096005)(87936001)(189998001)(5001770100001)(1220700001)(74316001)(1096002)(5003600100002)(93886004)(5004730100002)(122556002)(50986999)(86362001)(86612001)(10400500002)(11100500001)(92566002)(3280700002)(3660700001)(10290500002)(5005710100001)(2900100001)(2950100001)(10090500001)(76176999)(54356999)(33656002)(66066001)(5008740100001)(9686002)(106116001)(3846002)(2906002)(19580395003)(586003)(19580405001)(6116002)(102836003)(15760500001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR0301MB2034;
	H:BLUPR0301MB2034.namprd03.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
spamdiagnosticoutput: 1:23
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2016 11:56:30.6007 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0301MB2034
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 207.46.100.117
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH] bcm2835_property: use cached
 values when querying framebuffer
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Stephen Warren <swarren@wwwdotorg.org>, QEMU
	Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, Sylvain
	Garrigues <sylvain@sylvaingarrigues.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5cTXMLoYu481

PiBGcm9tOiBHZXJkIEhvZmZtYW5uIFttYWlsdG86a3JheGVsQHJlZGhhdC5jb21dDQo+IFNlbnQ6
IEZyaWRheSwgMjIgQXByaWwgMjAxNiAwOTo0Ng0KPg0KPiBBbHRlcm5hdGl2ZWx5IHdlIGNhbiBq
dXN0IGdvIGZvciBhIGxhdGVyIGJvb3QgbG9hZGVyIHN0YWdlLCBpLmUuIHB1dCBhIHUtYm9vdCBi
dWlsZA0KPiBmb3IgcnBpMiB0byBwYy1iaW9zLyAod2UgYWxyZWFkeSBoYXZlIG9uZSBmb3IgcHBj
IHRoZXJlKSBhbmQgcnVuIHRoYXQgYnkgZGVmYXVsdC4NCj4gDQo+IE91ciBzZGNhcmQgZW11bGF0
aW9uIHNlZW1zIHRvIGhhdmUgcHJvYmxlbXMgdGhvdWdoOg0KPiANCj4gICAgVS1Cb290IDIwMTYu
MDUtcmMyIChBcHIgMjIgMjAxNiAtIDA5OjExOjQ1ICswMjAwKQ0KPiANCj4gICAgRFJBTTogIDk2
MCBNaUINCj4gICAgUlBJIDIgTW9kZWwgQiAoMHhhMjEwNDEpDQo+ICAgIE1NQzogICA8dWJvb3Qg
aGFuZ3MgaGVyZT4NCj4gDQo+IFJlY2VudCBsaW51eCBrZXJuZWxzIGhhdmUgdHJvdWJsZSB0YWxr
aW5nIHRvIHRoZSBtbWMgdG9vLg0KDQpJIGtub3cgOiggSSBoYXZlbid0IGxvb2tlZCBhdCB0aGUg
bW9yZSByZWNlbnQga2VybmVscywgYnV0IGl0IGNvdWxkIGJlIHRoZSBzYW1lIGlzc3VlIEkgc3Bl
bnQgYSB3aGlsZSBkZWJ1Z2dpbmcgZnJ1aXRsZXNzbHkgb24gcmFzcGkxIC0tIGl0IGxvb2tlZCBs
aWtlIExpbnV4IHdhcyBpc3N1aW5nIGEgbGFyZ2UgTU1DIHJlYWQgZm9yIE4gYmxvY2tzLCBidXQg
b25seSBwcm9ncmFtbWluZyB0aGUgRE1BIGNvbnRyb2xsZXIgZm9yIGZld2VyICg8TipibG9ja3Np
emUpLiBUaGUgRE1BIHJlYWRzIGNvbXBsZXRlZCBxdWlja2x5IGJ1dCBldmVudHVhbGx5IHRoZSBr
ZXJuZWwgdGltZWQgb3V0LCBsb2dnZWQgYW4gZXJyb3IgYW5kIHJlaXNzdWVkIHRoZSB3aG9sZSBv
cGVyYXRpb24gYXMgc2luZ2xlLWJsb2NrIFBJTyByZWFkcy4NCg0KSWYgeW91IGdldCBhIGNoYW5j
ZSB0byBkaWFnbm9zZSB0aGlzIGFueSBmdXJ0aGVyLCBJJ2QgYmUgY3VyaW91cyB0byBrbm93IHdo
YXQgeW91IGZpbmQuIElmIHRoZSBzYW1lIHByb2JsZW0gcmVwcm9zIHdpdGggdS1ib290LCBpdCdz
IGFsbW9zdCBjZXJ0YWlubHkgc2ltcGxlciB0byBkZWJ1ZyB0aGVyZS4NCg0KVGhhbmtzLA0KQW5k
cmV3DQo=
