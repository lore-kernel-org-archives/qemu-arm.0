Received: by 10.25.44.15 with SMTP id s15csp565700lfs;
        Mon, 3 Jul 2017 23:15:05 -0700 (PDT)
X-Received: by 10.55.22.167 with SMTP id 39mr46836271qkw.20.1499148905129;
        Mon, 03 Jul 2017 23:15:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499148905; cv=none;
        d=google.com; s=arc-20160816;
        b=xQ0zMTvqjcgqyXDvvIxZZu2PC8nVWgDfuvcrv8UuIDG/BzA53ohFVQqv1RLF091zMz
         hywBazb4IQ79RPtfta92GvMEtE7LWw1yHyzcfZvviNNw+mlSyOAXfI5vQg8xmprAoLuj
         4Gsy3QhsjXu8ECiIFvOPkjn7RcSlsZeyqwKO+CKBLcA5QmawEui4dJJ11o4MBrzs2CwV
         rUWhEPPBWCZoa4nHYkL1ZNbuzxZ+xe84kXXQMyVJd4hVDAgCoEANW35HXH41bx4N1X+J
         mcK2cQOxomb98YtQEEiE1RAYvE7eirOTr63Wrhz5SHYTR5NdFFWD/BcsGcYYXcdVQ4h1
         AHxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-id:spamdiagnosticmetadata
         :spamdiagnosticoutput:user-agent:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic:to
         :from:dkim-signature:arc-authentication-results;
        bh=IsrM0YqVajvaYZFAFk2HuhqBsxU3jjR4RDnyjl7k2eo=;
        b=f4tgH9Ef/E8HdRdu2g1X3r+SQqjRuMBCWErBof1VK6rl8kUEx790UT9+KYZVeHTttj
         z5bDR7xTirqUQDSBXokcrjNqJj/OuG7Ip2WmC1x/mvIVq5dJZNGJ6+tc4htBSzkJe3d9
         TmeTpAULdNMuYSVS74ulHjpDO9jeaSwrTpSPC4ZsxrLHv8bqwNefNd2tlHrTjXgTcCpU
         ZPCLUJPdE75/zU3nhpEluVm0LvRX5wbNSY7OlHxCrvSEoS+beIEn5dOhsWxZWynWgoPP
         1IpU8YUB3zLcWGMJgJKaOpjomvKLIq0gCqnIo5kwbo9ELRYKVf5Ti17eYUeuVOaRD394
         IPuA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@juniper.net header.b=lNf14N8i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=juniper.net
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d191si16715010qkb.226.2017.07.03.23.15.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 03 Jul 2017 23:15:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@juniper.net header.b=lNf14N8i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=juniper.net
Received: from localhost ([::1]:38810 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dSH70-0006hb-Gi
	for alex.bennee@linaro.org; Tue, 04 Jul 2017 02:15:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36607)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dchang@juniper.net>) id 1dSH6w-0006hT-Nn
	for qemu-arm@nongnu.org; Tue, 04 Jul 2017 02:15:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dchang@juniper.net>) id 1dSH6t-0005hC-G2
	for qemu-arm@nongnu.org; Tue, 04 Jul 2017 02:14:58 -0400
Received: from mail-co1nam03on0105.outbound.protection.outlook.com
	([104.47.40.105]:27208
	helo=NAM03-CO1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dchang@juniper.net>) id 1dSH6t-0005gV-2V
	for qemu-arm@nongnu.org; Tue, 04 Jul 2017 02:14:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=juniper.net;
	s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
	bh=IsrM0YqVajvaYZFAFk2HuhqBsxU3jjR4RDnyjl7k2eo=;
	b=lNf14N8iD10QsC/AJJKlaKlynB7wx2QMrSfJ0M9hGKgLExwrktygNdUS8uy0QJd5ZI3Jb4thcADTa9c/fEF1WZW5OpveKpBMNHyNrR1mUisuYAIC0je0zq+tKJLID7xO6vpEPD5zh6s7jfYiZRR8we/d3/lJFoQ//walkVqBo50=
Received: from DM5PR05MB2924.namprd05.prod.outlook.com (10.168.176.136) by
	DM5PR05MB3017.namprd05.prod.outlook.com (10.168.177.13) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1240.6; Tue, 4 Jul 2017 06:14:52 +0000
Received: from DM5PR05MB2924.namprd05.prod.outlook.com ([10.168.176.136]) by
	DM5PR05MB2924.namprd05.prod.outlook.com ([10.168.176.136]) with mapi id
	15.01.1240.013; Tue, 4 Jul 2017 06:14:52 +0000
From: Daniel Chang <dchang@juniper.net>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Thread-Topic: [Qemu-arm] [Query]: Does QEMU support SMSC LAN9514 chip for
	Raspberry Pi2(raspi2)?
Thread-Index: AQHS88mB9F1UfI+atUWzBptOmt6gdqJDH/KAgACYSIA=
Date: Tue, 4 Jul 2017 06:14:52 +0000
Message-ID: <22A234FD-BD4A-4624-972F-21DFEFC56070@juniper.net>
References: <41CFADD7-21D1-4893-955A-503A6C464AC2@juniper.net>
	<CAAdtpL5RtZ606Q06nBd4N7DkBOR9mwdwGOwQYXanXanmDQ7p5A@mail.gmail.com>
In-Reply-To: <CAAdtpL5RtZ606Q06nBd4N7DkBOR9mwdwGOwQYXanXanmDQ7p5A@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/f.20.0.170309
authentication-results: amsat.org; dkim=none (message not signed)
	header.d=none; amsat.org; dmarc=none action=none header.from=juniper.net;
x-originating-ip: [116.197.188.10]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DM5PR05MB3017;
	7:GFI7d3SfLwkjmgloh+n6zAdr6IY5pvn4aA4pfyjSe3dbv7nSDCyCwWqAd8LgqNUDFDjhSPV+6Q/lUs680mfDttl6ccYrVkXwR2KCoCS7ACzKeYOAGGv3+OwJvepGWiLjFSsjJcuXmoYmz218bzeoIeUAyXj+f8ys6ENWNGo2x5pRhoYraep4EV2dD5YNS5Qati5S2Dt4psnqmFxFX4uKYMxmTVDO7x7DoLA9L53gEVwGi3mEJ0ckpYwjwYH+Wql2uCY3/K3WOw71JyO8H9mB4KRToyRf88QD797CAcgkQ3eg9aJUz1JHRoCK16EjIwaHfke6r7bezVnNCmalMId1DrWFzx7kES66zRuRiNVHVbbDi4Vy4BxGPTSzhiJ5A92VAkPG9tgcjAb8f4GIEqT3Vo6OVJwjsnL64knkPIRJqilrgDbeJA67wvaQ3tBdMfvHzePmC6cRRXpCdVhYZGJlcjkN5MtUEf/UW0tztuM/Qup2/lsMrh60ySOaMk122Jr7PqIFBjPXOqi7/oa4S87AGYYBUlg6h/2U3LvYCmuaIbjxsyexClCwgIOz4KvFo2bXZaqOtSKXC2j98iEdl7wVW5CgpOaHfVyufhPV9h0pzlhhEnX2Fyx8/vb13ZXHZUvxUcJnpmQJEzMToBxzKeNawGvfsHWEFnJ6IK7pkxQuuwGHid1TdLjtQZsW92wremaW8Q6iwoqsjn3/JHvlg4XXC7rY0rYFNQsPLqQ+QBW+PiuOhmoMVhO+/wq9nRiX1CHTpP6ZbWc/pTWsWAe75xwX3qkcNTBBM8ha8Ey9Z3ey31U=
x-ms-office365-filtering-correlation-id: b7ac934e-c417-4bdc-85af-08d4c2a3fbc4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254075)(48565401081)(300000503095)(300135400095)(2017052603031)(201703131423075)(201703031133081)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:DM5PR05MB3017; 
x-ms-traffictypediagnostic: DM5PR05MB3017:
x-microsoft-antispam-prvs: <DM5PR05MB3017F47CE3A5358674183E05D3D70@DM5PR05MB3017.namprd05.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(158342451672863)(133145235818549)(236129657087228)(47647156867600)(138986009662008)(111885846020525)(48057245064654)(248062484455213)(21532816269658)(209349559609743);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(8121501046)(5005006)(100000703101)(100105400095)(10201501046)(93006095)(93001095)(3002001)(6055026)(6041248)(20161123564025)(20161123558100)(20161123555025)(20161123560025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123562025)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:DM5PR05MB3017; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:DM5PR05MB3017; 
x-forefront-prvs: 0358535363
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(39850400002)(39410400002)(39400400002)(39840400002)(39860400002)(39450400003)(24454002)(377454003)(5660300001)(305945005)(36756003)(25786009)(8936002)(4326008)(2900100001)(8676002)(966005)(53546010)(3660700001)(14454004)(478600001)(16799955002)(82746002)(7736002)(81166006)(83506001)(2906002)(4001350100001)(53936002)(6436002)(83716003)(54356999)(76176999)(189998001)(50986999)(66066001)(6916009)(6246003)(229853002)(38730400002)(2950100002)(86362001)(110136004)(6116002)(102836003)(3846002)(3280700002)(6512007)(6306002)(99286003)(33656002)(6506006)(6486002)(77096006);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR05MB3017;
	H:DM5PR05MB2924.namprd05.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-ID: <0E323C8C35E73C41B1057EB7934F4EBE@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: juniper.net
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2017 06:14:52.4329 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bea78b3c-4cdb-4130-854a-1d193232e5f4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR05MB3017
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.40.105
Subject: Re: [Qemu-arm] [Query]: Does QEMU support SMSC LAN9514 chip for
 Raspberry Pi2(raspi2)?
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
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uBCwbRy1j3Eq

VGhhbmsgeW91IHNvIG11Y2gsIFBoaWwgIQ0KSeKAmWxsIHRyeSDigJh2aXJ04oCZIGJvYXJkLg0K
DQpPbiA3LzQvMTcsIDE6MDkgUE0sICJwaGlsaXBwZS5tYXRoaWV1LmRhdWRlQGdtYWlsLmNvbSBv
biBiZWhhbGYgb2YgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kiIDxwaGlsaXBwZS5tYXRoaWV1LmRh
dWRlQGdtYWlsLmNvbSBvbiBiZWhhbGYgb2YgZjRidWdAYW1zYXQub3JnPiB3cm90ZToNCg0KICAg
IEhpIERhbmllbCwNCiAgICANCiAgICBPbiBNb24sIEp1bCAzLCAyMDE3IGF0IDM6NTYgQU0sIERh
bmllbCBDaGFuZyA8ZGNoYW5nQGp1bmlwZXIubmV0PiB3cm90ZToNCiAgICA+IFJlY2VudGx5IEni
gJltIHRyeWluZyB0byBlbXVsYXRlIGEgUmFzcGJlcnJ5IFBpIDIgc3lzdGVtIG9uIFFFTVUoaG9z
dCBpcw0KICAgID4gWDg2LTY0IHVidW50dSBzZXJ2ZXIgMTcuMDQpLg0KICAgIFsuLi5dDQogICAg
PiBSYXNwYmVycnkgUGkgMiBNb2RlbCBCIGhhcyBhIGJ1aWxkLWluIFVTQiBFdGhlcm5ldCBhZGFw
dGVyIHVzaW5nIHRoZSBTTVNDDQogICAgPiBMQU45NTE0IGNoaXAuIEJ1dCBJIGRpZG7igJl0IHNl
ZSBpdCBpbiB0aGUgZGV2aWNlIGxpc3QgZm9yIHJhc3BpMi4NCiAgICANCiAgICBBcyB5b3Ugbm90
aWNlZCBvbiB0aGUgUmFzcGJlcnJ5IFBpIDIgdGhlIEV0aGVybmV0IGFkYXB0ZXIgaXMgY29ubmVj
dGVkDQogICAgdG8gdGhlIEJDTTI4MzYgY3B1IHZpYSB0aGUgVVNCIGJ1cy4NCiAgICBPbiB0aGlz
IGNwdSB0aGUgVVNCIGNvbnRyb2xsZXIgaXMgaW1wbGVtZW50ZWQgd2l0aCB0aGUgIkRXQyBVU0Iy
LjANCiAgICBPVEciIElQIGNvcmUgZnJvbSBTeW5vcHN5cy4gVGhpcyB1c2VyIG1hbnVhbCBpcyBw
cm90ZWN0ZWQgYW5kIG9ubHkNCiAgICBhdmFpbGFibGUgZm9yIFN5bm9wc3lzIGN1c3RvbWVycy4N
CiAgICBJIGJlbGlldmUgdGhpcyBpcyB0aGUgcmVhc29uIHdoeSB0aGVyZSBpcyBubyBVU0IgbW9k
ZWxlZCBmb3IgdGhlIHJhc3BpMi4NCiAgICANCiAgICBTZWU6DQogICAgaHR0cHM6Ly93d3cucmFz
cGJlcnJ5cGkub3JnL2RvY3VtZW50YXRpb24vaGFyZHdhcmUvcmFzcGJlcnJ5cGkvYmNtMjgzNi9S
RUFETUUubWQNCiAgICBodHRwczovL3d3dy5zeW5vcHN5cy5jb20vZHcvaXBkaXIucGhwP2RzPWR3
Y191c2JfMl8wX2RpZ2l0YWxfY29udHJvbGxlcnMNCiAgICANCiAgICA+IFRoZSBpZGVhIGlzIHRv
IHVzZSBob3N0IHRhcCBkZXZpY2UgYXMgYmFja2VuZCBhbmQgY29ubmVjdGVkIGl0IHdpdGggZ3Vl
c3QNCiAgICA+IGZyb250ZW5kIGludGVyZmFjZSh2aXJ0dWFsIE5JQykuDQogICAgPg0KICAgID4g
QnV0IHRoZSBwcm9ibGVtIGlzLCB3aGljaCB2aXJ0dWFsIE5JQyBzaG91bGQgSSB1c2U/DQogICAg
DQogICAgV2l0aCB0aGUgYW5ub3VuY2Ugb2YgRG9ja2VyIHJ1bm5pbmcgb24gQVJNIHdpdGggdGhl
IFJhc3BiZXJyeSBQaSAyDQogICAgZXhhbXBsZSwgSSBzZWUgZmV3IHBlb3BsZSB0cnlpbmcgdG8g
ZW11bGF0ZSB0aGUgcmFzcGkyIHRvIHJ1biBBUk0NCiAgICBjb250YWluZXJzIGFuZCB0aGV5IGhh
dmUgeW91ciBwcm9ibGVtIGZvciBuZXR3b3JrIGFjY2Vzcy4NCiAgICANCiAgICBJZiB5b3UgZG9u
J3QgY2FyZSBhYm91dCB3aGljaCBBUk0gYm9hcmQgZW11bGF0ZSwgSSByZWNvbW1lbmQgeW91IHRo
ZQ0KICAgICJ2aXJ0IiBib2FyZCB3aGljaCBpcyBwcm9iYWJseSB0aGUgbW9zdCBjb21wbGV0ZSBh
bmQgcGVyZm9ybWFudC4NCiAgICANCiAgICBTZWUgUGV0ZXIgTWF5ZGVsbCBwb3N0Og0KICAgIGh0
dHBzOi8vdHJhbnNsYXRlZGNvZGUud29yZHByZXNzLmNvbS8yMDE2LzExLzAzL2luc3RhbGxpbmct
ZGViaWFuLW9uLXFlbXVzLTMyLWJpdC1hcm0tdmlydC1ib2FyZC8NCiAgICANCiAgICBOb3cgaWYg
eW91IHJlYWxseSBuZWVkIHRvIGVtdWxhdGUgYSBSYXNwYmVycnkgUGkgMiB5b3UgY2FuIGNvbm5l
Y3QgaXQNCiAgICB0byBhbiBJUCBuZXR3b3JrIHVzaW5nIHRoZSBTTElQIG9yIFBQUCAocmVjb21t
ZW5kZWQpIHByb3RvY29sIHRocnUgdGhlDQogICAgVUFSVCAodHR5QU1BMCkuIFlvdSB3aWxsIG5l
ZWQgdG8gZGlzYWJsZSB0aGUgY29uc29sZSBsb2dpbiBzaGVsbA0KICAgIChpbnN0YWxsIHNzaGQg
Zmlyc3QpLg0KICAgIA0KICAgIFNlZToNCiAgICBodHRwOi8vd3d3LnRsZHAub3JnL0hPV1RPL1BQ
UC1IT1dUTy9kaXJlY3QuaHRtbA0KICAgIA0KICAgIFJlZ2FyZHMsDQogICAgDQogICAgUGhpbC4N
CiAgICANCg0K
