Received: by 10.25.208.211 with SMTP id h202csp1841991lfg;
        Tue, 1 Mar 2016 13:34:56 -0800 (PST)
X-Received: by 10.55.74.209 with SMTP id x200mr29459199qka.106.1456868096021;
        Tue, 01 Mar 2016 13:34:56 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k5si32833384qkh.65.2016.03.01.13.34.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 01 Mar 2016 13:34:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:52382 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aarwV-0001PD-Ep
	for alex.bennee@linaro.org; Tue, 01 Mar 2016 16:34:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34448)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aarwS-0001NG-MV
	for qemu-arm@nongnu.org; Tue, 01 Mar 2016 16:34:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aarwR-0007g0-KO
	for qemu-arm@nongnu.org; Tue, 01 Mar 2016 16:34:52 -0500
Received: from mail-bn1on0143.outbound.protection.outlook.com
	([157.56.110.143]:54159
	helo=na01-bn1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1aarwL-0007fJ-U0; Tue, 01 Mar 2016 16:34:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=hRCj9vlyqBz3E52m27v0pUcVWDlTn6ImTHHq3m3RkRg=;
	b=fc/ReOFjkhT2DPPESMR8vRifl6xPEX5mlabpMsUQFNDVHQ9+Qu6vYuksoyH+hfyf6BN0KE2tkWSdGNq5YikIaAPPjo4oMLhGe2Qy1soc7rgHpmSrtjsKhkfftK1AbjOCYpquqO3I8GaIyVnzwqt4Mcc1fC9hKG/923bKPndgOPQ=
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com (10.164.22.24) by
	BLUPR0301MB2034.namprd03.prod.outlook.com (10.164.22.24) with Microsoft
	SMTP Server (TLS) id 15.1.415.20; Tue, 1 Mar 2016 21:34:44 +0000
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) by
	BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) with mapi id
	15.01.0415.022; Tue, 1 Mar 2016 21:34:44 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>, Stefan Weil
	<sw@weilnetz.de>
Thread-Topic: [Qemu-devel] [PATCH v1 00/17] ARM big-endian and setend support
Thread-Index: AQHRc3sCHfCipu2RmkC1kVrQfIL8XJ9E7Z2AgAAuXYA=
Date: Tue, 1 Mar 2016 21:34:44 +0000
Message-ID: <BLUPR0301MB20341204399663BD594BA50C9EBB0@BLUPR0301MB2034.namprd03.prod.outlook.com>
References: <cover.1453100525.git.crosthwaite.peter@gmail.com>
	<56D52825.1010107@weilnetz.de>
	<CAPokK=oGzBuvSKw7PFiwwzL0m_=bu7haNYqsyL_WV6PP6UfCyQ@mail.gmail.com>
In-Reply-To: <CAPokK=oGzBuvSKw7PFiwwzL0m_=bu7haNYqsyL_WV6PP6UfCyQ@mail.gmail.com>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
	header.d=none; gmail.com;
	dmarc=none action=none header.from=microsoft.com; 
x-originating-ip: [2001:4898:80e8:6::724]
x-ms-office365-filtering-correlation-id: 02445dfe-c083-43a5-a848-08d342194e48
x-microsoft-exchange-diagnostics: 1; BLUPR0301MB2034;
	5:g7yynBBaVjj4yUG3FzDYyeTy3GmwV/YdMbAgpJ9bKQzosIBomF5l5ayjRdCscJ9xL38i9C3HFGVw3bWzcL2Oaubp0nYpCUWjrhGiQQM1126TwCxbj0Z4DBrTsZuBv77H98TwjmxiTf8Um7yVPyktNA==;
	24:hRiLeIZrEgHg8Dovy0zlR6LCwi+FstGUhyhMH5q2rOSbGYy1CSxGuVO+MQ/7Juvq8WmPwE0LkIXwLWx4q7bZzgx3V3gFuW8UJ1MaDX5tK44=
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR0301MB2034;
x-microsoft-antispam-prvs: <BLUPR0301MB203423118EC49F5702C054049EBB0@BLUPR0301MB2034.namprd03.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(61425038)(601004)(2401047)(8121501046)(5005006)(3002001)(10201501046)(61426038)(61427038);
	SRVR:BLUPR0301MB2034; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2034; 
x-forefront-prvs: 086831DFB4
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(24454002)(53754006)(377454003)(87936001)(15975445007)(77096005)(3280700002)(2900100001)(3660700001)(189998001)(4326007)(33656002)(40100003)(2906002)(2950100001)(5005710100001)(10290500002)(10400500002)(10090500001)(5003600100002)(5008740100001)(19580395003)(92566002)(11100500001)(5002640100001)(76576001)(575784001)(5001770100001)(86362001)(1096002)(50986999)(54356999)(106116001)(76176999)(99286002)(5004730100002)(122556002)(74316001)(19580405001)(1220700001)(586003)(6116002)(102836003)(86612001)(5001960100004)(81156009)(7059030)(3826002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR0301MB2034;
	H:BLUPR0301MB2034.namprd03.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
spamdiagnosticoutput: 1:23
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2016 21:34:44.2028 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0301MB2034
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 157.56.110.143
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	sridhar kulkarni <sridhar_kulk@yahoo.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?utf-8?B?UGlvdHIgS3LDs2w=?= <piotr.krol@3mdeb.com>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v1 00/17] ARM big-endian and
	setend support
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: QyaZ+K8R7enA

PiBGcm9tOiBQZXRlciBDcm9zdGh3YWl0ZSBbbWFpbHRvOmNyb3N0aHdhaXRlcGV0ZXJAZ21haWwu
Y29tXQ0KPiBTZW50OiBUdWVzZGF5LCAxIE1hcmNoIDIwMTYgMTA6NDQgQU0NCj4gDQo+IE9uIE1v
biwgRmViIDI5LCAyMDE2IGF0IDk6MjcgUE0sIFN0ZWZhbiBXZWlsIDxzd0B3ZWlsbmV0ei5kZT4g
d3JvdGU6DQo+ID4gQW0gMTguMDEuMjAxNiB1bSAwODoxMiBzY2hyaWViIFBldGVyIENyb3N0aHdh
aXRlOg0KPiA+PiBIaSBBbGwsDQo+ID4+DQo+ID4+IFRoaXMgcGF0Y2ggc2VyaWVzIGFkZHMgc3lz
dGVtLW1vZGUgYmlnLWVuZGlhbiBzdXBwb3J0IGZvciBBUk0uIEl0IGFsc28NCj4gPj4gaW1wbGVt
ZW50cyB0aGUgc2V0ZW5kIGluc3RydWN0aW9uLCBhbmQgbG9hZGluZyBvZiBCRSBiaW5hcmllcyBl
dmVuIGluDQo+ID4+IExFIGVtdWxhdGlvbiBtb2RlLg0KPiA+Pg0KPiA+PiBCYXNlZCBvbiBQYW9s
bydzIG9yaWdpbmFsIHdvcmsuIEkgaGF2ZSBtb3ZlZCBhbGwgdGhlIEJFMzIgcmVsYXRlZCB3b3Jr
DQo+ID4+IHRvIHRoZSBiYWNrIG9mIHRoZSBzZXJpZXMuIE11bHRpcGxlIHBhcnRpZXMgYXJlIGlu
dGVyZXN0ZWQgaW4gdGhlIEJFOA0KPiA+PiB3b3JrIGp1c3Qgb24gaXRzIG93biwgc28gdGhhdCBj
b3VsZCBwb3RlbnRpYWxseSBiZSBtZXJnZWQgdy9vIEJFMzIuDQo+ID4+IFBNTSByZXF1ZXN0ZWQg
QkUzMiBiZSBhdCBsZWFzdCB0aG91Z2h0IG91dCBhcmNoaXRlY3R1cmFsbHksIHNvIHRoaXMNCj4g
Pj4gc2VyaWVzIHNlZXMgQkUzMiBmdW5jdGlvbmFsaXR5IHRocm91Z2guDQo+ID4+DQo+ID4+IEkg
aGF2ZSB0ZXN0ZWQgYWxsIG9mIExFLiBCRTggYW5kIEJFMzIgaW4gYm90aCBsaW51eC11c2VyIG1v
ZGUgKGZvcg0KPiA+PiByZWdyZXNzaW9ucykgYW5kIHN5c3RlbSBtb2RlIChCRTggYW5kIEJFMzIg
YXJlIG5ldyBoZXJlKS4NCj4gPj4gTXkgdGVzdCBhcHBsaWNhdGlvbiBpcyBoZXJlLCB0aGUgUkVB
RE1FIGdpdmVzIHNvbWUgZXhhbXBsZSBjb21tYW5kDQo+ID4+IGxpbmVzIHlvdSBjYW4gcnVuOg0K
PiA+Pg0KPiA+PiBodHRwczovL2dpdGh1Yi5jb20vcGNyb3N0L2FybS1iZS10ZXN0DQo+ID4+DQo+
ID4+IFJlZ2FyZHMsDQo+ID4+IFBldGVyDQo+ID4NCj4gPiBJdCB3b3VsZCBiZSBuaWNlIHRvIGdl
dCBhdCBsZWFzdCB0aGUgZW11bGF0aW9uIGZvciAnc2V0ZW5kJyBpbnRvIHRoZQ0KPiA+IG5leHQg
dmVyc2lvbiwgYmVjYXVzZSBpdCBpcyBuZWVkZWQgZm9yIHRoZSBSYXNwYmVycnkgUGkgZW11bGF0
aW9uLg0KPiA+DQo+IA0KPiBCVFcgaWYgeW91IGNhbiBsaW5rIG1lIGJpbmFyaWVzIGFuZCBhIGZh
aWxpbmcgY29tbWFuZCBsaW5lIGZvciB0aGUNCj4gZmFpbGluZyByUEkgd29yayBJIGNhbiB0ZXN0
IGl0LCBJIGFtIGN1cnJlbnRseSBkb2luZyBteSBvd24gc3RhbmRhbG9uZQ0KPiB0ZXN0cyAob2Yg
bGludXggdXNlciBhcyB3ZWxsKS4NCg0KRG93bmxvYWQgYW5kIHVuemlwOg0KaHR0cHM6Ly9kb3du
bG9hZHMucmFzcGJlcnJ5cGkub3JnL3Jhc3BiaWFuX2xpdGVfbGF0ZXN0DQoNClRoZW4sIG1vdW50
IHRoZSBib290IHBhcnRpdGlvbiwgYW5kIGdyYWIgYSBjb3B5IG9mIGtlcm5lbDcuaW1nLiBZb3Ug
c2hvdWxkIG5vdyBiZSBhYmxlIHRvIGJvb3Qgb24gYSBjdXJyZW50IHFlbXUgd2l0aDoNCg0KcWVt
dS1zeXN0ZW0tYXJtIC1NIHJhc3BpMiAta2VybmVsIGtlcm5lbDcuaW1nIC1zZCAyMDE2LTAyLTI2
LXJhc3BiaWFuLWplc3NpZS1saXRlLmltZyAtYXBwZW5kICJydyBlYXJseXByaW50ayBsb2dsZXZl
bD04IGNvbnNvbGU9dHR5QU1BMCByb290PS9kZXYvbW1jYmxrMHAyIHJvb3R3YWl0IiAtc2VyaWFs
IHN0ZGlvIC1kIHVuaW1wDQoNCkF0IHByZXNlbnQsIHRoaXMgZmFpbHMgd2l0aDoNCg0KWyAgIDEw
LjUzNTIzMl0gVkZTOiBNb3VudGVkIHJvb3QgKGV4dDQgZmlsZXN5c3RlbSkgb24gZGV2aWNlIDE3
OToyLg0KWyAgIDEwLjcyOTY4NV0gZGV2dG1wZnM6IG1vdW50ZWQNClsgICAxMC44MDUxMjVdIEZy
ZWVpbmcgdW51c2VkIGtlcm5lbCBtZW1vcnk6IDQxNksgKDgwNzc2MDAwIC0gODA3ZGUwMDApDQpb
ICAgMTcuMzE3Mjg2XSByYW5kb206IHN5c3RlbWQgdXJhbmRvbSByZWFkIHdpdGggNiBiaXRzIG9m
IGVudHJvcHkgYXZhaWxhYmxlDQphcm06IHVuaW1wbGVtZW50ZWQgc2V0ZW5kDQpbICAgMTcuMzY2
NjU2XSBLZXJuZWwgcGFuaWMgLSBub3Qgc3luY2luZzogQXR0ZW1wdGVkIHRvIGtpbGwgaW5pdCEg
ZXhpdGNvZGU9MHgwMDAwMDAwNA0KWyAgIDE3LjM2NjY1Nl0NClsgICAxNy4zODQ2MjVdIENQVTog
MCBQSUQ6IDEgQ29tbTogc3lzdGVtZCBOb3QgdGFpbnRlZCA0LjEuNy12NysgIzgxNw0KWyAgIDE3
LjM5NTU2Ml0gSGFyZHdhcmUgbmFtZTogQkNNMjcwOQ0KWyAgIDE3LjQwNDczOF0gWzw4MDAxODQ0
MD5dICh1bndpbmRfYmFja3RyYWNlKSBmcm9tIFs8ODAwMTNlMGM+XSAoc2hvd19zdGFjaysweDIw
LzB4MjQpDQpbICAgMTcuNDE5MDQyXSBbPDgwMDEzZTBjPl0gKHNob3dfc3RhY2spIGZyb20gWzw4
MDU1ODU0OD5dIChkdW1wX3N0YWNrKzB4OTgvMHhlMCkNClsgICAxNy40MzIyMzddIFs8ODA1NTg1
NDg+XSAoZHVtcF9zdGFjaykgZnJvbSBbPDgwNTU0NzNjPl0gKHBhbmljKzB4YTQvMHgyMDQpDQpb
ICAgMTcuNDQ0NzYxXSBbPDgwNTU0NzNjPl0gKHBhbmljKSBmcm9tIFs8ODAwMjkzN2M+XSAoZG9f
ZXhpdCsweGEwYy8weGE2NCkNClsgICAxNy40NTI1MDddIFs8ODAwMjkzN2M+XSAoZG9fZXhpdCkg
ZnJvbSBbPDgwMDI5NDcwPl0gKGRvX2dyb3VwX2V4aXQrMHg1MC8weGNjKQ0KWyAgIDE3LjQ2Mjgy
N10gWzw4MDAyOTQ3MD5dIChkb19ncm91cF9leGl0KSBmcm9tIFs8ODAwMzNlZDQ+XSAoZ2V0X3Np
Z25hbCsweDJiMC8weDZlMCkNClsgICAxNy40NzQ0MjldIFs8ODAwMzNlZDQ+XSAoZ2V0X3NpZ25h
bCkgZnJvbSBbPDgwMDEzMTk0Pl0gKGRvX3NpZ25hbCsweDk4LzB4M2FjKQ0KWyAgIDE3LjQ4MjE3
Nl0gWzw4MDAxMzE5ND5dIChkb19zaWduYWwpIGZyb20gWzw4MDAxMzY5MD5dIChkb193b3JrX3Bl
bmRpbmcrMHhiOC8weGM4KQ0KWyAgIDE3LjQ5MDEyOV0gWzw4MDAxMzY5MD5dIChkb193b3JrX3Bl
bmRpbmcpIGZyb20gWzw4MDAwZjllND5dICh3b3JrX3BlbmRpbmcrMHhjLzB4MjApDQpbICAgMTcu
NTAxMDIwXSAtLS1bIGVuZCBLZXJuZWwgcGFuaWMgLSBub3Qgc3luY2luZzogQXR0ZW1wdGVkIHRv
IGtpbGwgaW5pdCEgZXhpdGNvZGU9MHgwMDAwMDAwNA0KWyAgIDE3LjUwMTAyMF0NCg0KQ2hlZXJz
LA0KQW5kcmV3DQo=
