Received: by 10.25.44.15 with SMTP id s15csp4920886lfs;
        Tue, 11 Jul 2017 07:37:10 -0700 (PDT)
X-Received: by 10.80.182.48 with SMTP id b45mr2858186ede.157.1499783830665;
        Tue, 11 Jul 2017 07:37:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499783830; cv=none;
        d=google.com; s=arc-20160816;
        b=Bp4iouLJzWv+msRJFiLHVnaucnWT1KQbxFqcYpxfl96MMLeBOH+g/aXZ/u5VpfBSsU
         gxedM2i+NtiXwhDM+QXyoJsGRfWju9qUfetc5CiBjyHkqW+ZE343Eia9vqtQA1UCqQSX
         uEN187mKMZQ1qSIW35Osbq33+tyYvOF9HGe6PopKVfHlTv+HNZnnGr7K2lASgDqYlDL9
         7W8AlhfQnyQFFTjbKukgjFVBHOofyc5gAwMAFPNdjob63BN6ZQytQ/ziOa7aHIOS6g4Z
         LNHJXqUDmUzqmtGXRE+OSBxigyZrbCr6Dd7II4XsAX7XVDJyrqp0KHel9nllfpj5wHFf
         YkLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:content-language
         :accept-language:message-id:date:thread-index:thread-topic:to:from
         :arc-authentication-results;
        bh=+aCuPQifybRw24YbkR3zGlMIKwo7sC+VJG0ZvAnhtMs=;
        b=YfWRm6Lfju/5rPKI99JQSnzs9aVaWaPN+8A3lI+iiQVbZ8lutJiD3q0xoDxtODG9LG
         GaXBTpmBhXX8ONSjFB0dQjcuLfxtZolKrYaIUrOref+D6W7errmhdc2k1XyTPW/bL/OT
         DbU1oBND1uJHKO9PMCkNPG8WhwUPAdPHARWggQIVaixbxJxPobOPQiM3fByKVc66Mv+S
         wyb+kn9fXQ4VtKwGKh8qjxSTbMJ2ayUThu3y4CCe1T9fRjDdF12sUtwfLLdSnXU3DSNu
         JNkH2vK+2YS7YQsbPSzAtbO0Tu9tpfeeyfTl3kcra/qrcJxk3RyVajzKle1w3sqT31bt
         MM9g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id 64si1578716edm.344.2017.07.11.07.37.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 11 Jul 2017 07:37:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46745 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dUwHl-0003xq-Jx
	for alex.bennee@linaro.org; Tue, 11 Jul 2017 10:37:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41533)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1dUwG6-0003Ae-C8
	for qemu-devel@nongnu.org; Tue, 11 Jul 2017 10:35:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1dUwG5-0004pW-84
	for qemu-devel@nongnu.org; Tue, 11 Jul 2017 10:35:26 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:3904)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_ARCFOUR_SHA1:16) (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>)
	id 1dUwFy-0004mZ-Tf; Tue, 11 Jul 2017 10:35:19 -0400
Received: from 172.30.72.57 (EHLO DGGEMA404-HUB.china.huawei.com)
	([172.30.72.57])
	by dggrg03-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
	with ESMTP id AQY46889; Tue, 11 Jul 2017 22:34:54 +0800 (CST)
Received: from DGGEMA503-MBS.china.huawei.com ([169.254.2.48]) by
	DGGEMA404-HUB.china.huawei.com ([10.3.20.45]) with mapi id
	14.03.0301.000; Tue, 11 Jul 2017 22:34:47 +0800
From: gengdongjiu <gengdongjiu@huawei.com>
To: "lersek@redhat.com" <lersek@redhat.com>
Thread-Topic: [PATCH resend v4 0/3] Generate APEI GHES table and dynamically
	record CPER
Thread-Index: AdL6Utg5VGBInosaQECG2J4/lpNyRA==
Date: Tue, 11 Jul 2017 14:34:47 +0000
Message-ID: <etPan.5964e206.163e212f.272d@localhost>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A0B0202.5964E20F.014B, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=169.254.2.48,
	so=2014-11-16 11:51:01, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 9cb87bde1b1370718a5ace1080242ffc
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
	[fuzzy]
X-Received-From: 45.249.212.189
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: [Qemu-devel] =?utf-8?b?562U5aSNOiBbUEFUQ0ggcmVzZW5kIHY0IDAvM10g?=
 =?utf-8?q?Generate_APEI_GHES_table_and_dynamically_record_CPER?=
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	Wuquanming <wuquanming@huawei.com>, "famz@redhat.com" <famz@redhat.com>,
	"mst@redhat.com" <mst@redhat.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Gaozhihui <zhihui.gao@huawei.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Huangshaoyu <huangshaoyu@huawei.com>,
	Zhaoshenglong <zhaoshenglong@huawei.com>,
	"imammedo@redhat.com" <imammedo@redhat.com>,
	"Zhengqiang \(turing\)" <zhengqiang10@huawei.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nsRo2n4SILTu

TGFzemxvLA0KICAgICBJIGFtIHNvIHNvcnJ5IGFib3V0IGl0LCB0aGFua3MgZm9yIHlvdXIgY29t
bWVudHPjgIIgSSB3aWxsIHJlc2VuZCB0aGVtIHRvbW9ycm93LCBub3cgdGhlIGNoaW5lc2UgdGlt
ZSBpcyBtaWRuaWdodOOAgg0K5Y+R5Lu25Lq677yaTGFzemxvIEVyc2VrDQrmlLbku7bkurrvvJro
gL/kuJzkuYUNCuaKhOmAge+8mm1zdEByZWRoYXQuY29tLGltYW1tZWRvQHJlZGhhdC5jb20sZmFt
ekByZWRoYXQuY29tLHFlbXUtZGV2ZWxAbm9uZ251Lm9yZyxaaGFvc2hlbmdsb25nLHBldGVyLm1h
eWRlbGxAbGluYXJvLm9yZyxxZW11LWFybUBub25nbnUub3JnLOmDkeW8uizpu4Tpn7blrocs5ZC0
5rOJ5piOLOmrmOaZuuaFpyxFcmljIEJsYWtlDQrml7bpl7TvvJoyMDE3LTA3LTExIDIxOjQ0OjEy
DQrkuLvpopg6UmU6IFtQQVRDSCByZXNlbmQgdjQgMC8zXSBHZW5lcmF0ZSBBUEVJIEdIRVMgdGFi
bGUgYW5kIGR5bmFtaWNhbGx5IHJlY29yZCBDUEVSDQoNCkhpIERvbmdqaXUsDQoNCk9uIDA3LzEx
LzE3IDA4OjQ2LCBEb25naml1IEdlbmcgd3JvdGU6DQo+IFsuLi5dDQoNClNvIG15IGZvbGxvd3Vw
IGlzIG9mZi10b3BpYywgYnV0IEknZCBsaWtlIHRvIHBvaW50IG91dCB0aGF0IHRoZSBwYXRjaCAv
DQplbWFpbCB0aHJlYWRpbmcgaW4gdGhpcyBzZXJpZXMgaXMgc3RpbGwgaW5jb3JyZWN0Lg0KDQpU
aGVzZSBhcmUgdGhlICJzZW50IiB0aW1lc3RhbXBzIG9uIHRoZSBtZXNzYWdlczoNCg0KRGF0ZTog
VHVlLCAxMSBKdWwgMjAxNyAxNDo0NjoxOSArMDgwMA0KRGF0ZTogVHVlLCAxMSBKdWwgMjAxNyAx
NDo0NjozMSArMDgwMCAoKzEyIHNlY29uZHMpDQpEYXRlOiBUdWUsIDExIEp1bCAyMDE3IDE0OjQ2
OjQxICswODAwICgrMTAgc2Vjb25kcykNCkRhdGU6IFR1ZSwgMTEgSnVsIDIwMTcgMTQ6NDc6MDAg
KzA4MDAgKCsxOSBzZWNvbmRzKQ0KDQpUaGlzIHRlbGxzIG1lIHRoYXQgeW91IGFyZSBtYWlsaW5n
IG91dCB0aGUgcGF0Y2hlcyBvbmUgYnkgb25lLiBUaGF0J3MNCm5vdCBob3cgbW9zdCBwZW9wbGUg
cG9zdCB0aGVpciBwYXRjaGVzLg0KDQooU2lkZSByZW1hcms6IHdoaWxlIGdpdC1zZW5kLWVtYWls
IGNhbiBzdGlsbCBnZXQgdGhlIHRocmVhZGluZyByaWdodA0Kd2l0aCBpbmRpdmlkdWFsIHBvc3Rp
bmcsIGZvciB0aGF0IHlvdSB3b3VsZCBoYXZlIHRvIHByb3ZpZGUgdGhlIGZpcnN0DQplbWFpbCdz
IE1lc3NhZ2UtSWQgaW5kaXZpZHVhbGx5IHRvIGFsbCB0aGUgc3Vic2VxdWVudCBjb21tYW5kcywg
YW5kIHRoZQ0KZW1haWxzIHNob3cgdGhhdCB0aGlzIGRpZG4ndCBoYXBwZW4uKQ0KDQpJbnN0ZWFk
LCB5b3Ugc2hvdWxkIGludm9rZSBnaXQtc2VuZC1lbWFpbCB3aXRoIGFsbCB0aGUgbWVzc2FnZXMg
KmF0DQpvbmNlKi4gVGhlbiBnaXQtc2VuZC1lbWFpbCBjYW4gc2V0IHVwIHRoZSB0aHJlYWRpbmcg
YXV0b21hdGljYWxseS4gRnJvbQ0KZ2l0LXNlbmQtZW1haWwoMSk6DQoNCj4gR0lULVNFTkQtRU1B
SUwoMSkgICAgICAgICAgICBHaXQgTWFudWFsICAgICAgICAgICAgR0lULVNFTkQtRU1BSUwoMSkN
Cj4NCj4gTkFNRQ0KPiAgICAgICAgZ2l0LXNlbmQtZW1haWwgLSBTZW5kIGEgY29sbGVjdGlvbiBv
ZiBwYXRjaGVzIGFzIGVtYWlscw0KPg0KPiBTWU5PUFNJUw0KPiAgICAgICAgZ2l0IHNlbmQtZW1h
aWwgW29wdGlvbnNdIDxmaWxlfGRpcmVjdG9yeXxyZXYtbGlzdCBvcHRpb25zPi4uLg0KPiAgICAg
ICAgZ2l0IHNlbmQtZW1haWwgLS1kdW1wLWFsaWFzZXMNCj4NCj4gREVTQ1JJUFRJT04NCj4gICAg
ICAgIFRha2VzIHRoZSBwYXRjaGVzIGdpdmVuIG9uIHRoZSBjb21tYW5kIGxpbmUgYW5kIGVtYWls
cyB0aGVtDQo+ICAgICAgICBvdXQuIFBhdGNoZXMgY2FuIGJlIHNwZWNpZmllZCBhcyBmaWxlcywg
ZGlyZWN0b3JpZXMgKHdoaWNoDQo+ICAgICAgICB3aWxsIHNlbmQgYWxsIGZpbGVzIGluIHRoZSBk
aXJlY3RvcnkpLCBvciBkaXJlY3RseSBhcyBhDQo+ICAgICAgICByZXZpc2lvbiBsaXN0LiBJbiB0
aGUgbGFzdCBjYXNlLCBhbnkgZm9ybWF0IGFjY2VwdGVkIGJ5IGdpdC0NCj4gICAgICAgIGZvcm1h
dC1wYXRjaCgxKSBjYW4gYmUgcGFzc2VkIHRvIGdpdCBzZW5kLWVtYWlsLg0KDQpTbyBzZW5kIHRo
ZSBwYXRjaGVzIHdpdGgNCg0KICBnaXQgc2VuZC1lbWFpbCAqLnBhdGNoDQoNCm9yIHB1dCBhbGwg
dGhlIHBhdGNoZXMgaW50byBhIHRlbXBvcmFyeSBkaXJlY3RvcnksIGFuZCBydW4NCg0KICBnaXQg
c2VuZC1lbWFpbCBwYXRjaC1kaXIvDQoNClRoYW5rcywNCkxhc3psbw0K
