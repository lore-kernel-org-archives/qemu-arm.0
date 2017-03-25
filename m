Received: by 10.25.15.230 with SMTP id 99csp302187lfp;
        Fri, 24 Mar 2017 19:23:51 -0700 (PDT)
X-Received: by 10.55.22.16 with SMTP id g16mr12087370qkh.102.1490408631887;
        Fri, 24 Mar 2017 19:23:51 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s5si3605454qkf.111.2017.03.24.19.23.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 24 Mar 2017 19:23:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35651 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1crbMt-0002Pt-Da
	for alex.bennee@linaro.org; Fri, 24 Mar 2017 22:23:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51859)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wangjintang@huawei.com>) id 1crbLt-00024I-L3
	for qemu-devel@nongnu.org; Fri, 24 Mar 2017 22:22:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wangjintang@huawei.com>) id 1crbLq-00076W-FK
	for qemu-devel@nongnu.org; Fri, 24 Mar 2017 22:22:49 -0400
Received: from [45.249.212.187] (port=3014 helo=dggrg01-dlp.huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_ARCFOUR_SHA1:16) (Exim 4.71)
	(envelope-from <wangjintang@huawei.com>)
	id 1crbLp-0006x1-6V; Fri, 24 Mar 2017 22:22:46 -0400
Received: from 172.30.72.54 (EHLO DGGEMA406-HUB.china.huawei.com)
	([172.30.72.54])
	by dggrg01-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
	with ESMTP id ALJ97620; Sat, 25 Mar 2017 10:22:21 +0800 (CST)
Received: from DGGEMA504-MBS.china.huawei.com ([169.254.3.23]) by
	DGGEMA406-HUB.china.huawei.com ([10.3.20.47]) with mapi id
	14.03.0301.000; Sat, 25 Mar 2017 10:22:12 +0800
From: Wangjintang <wangjintang@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>
Thread-Topic: [Qemu-arm] [patch 1/1]about armv8's prefetch decode
Thread-Index: AQHSpIZcyUvCPOkCJ0WWUqTl5FKTEaGkwNlw
Date: Sat, 25 Mar 2017 02:22:11 +0000
Message-ID: <C94A741879221447B4FC9B607EB4FFCD79EACAC2@DGGEMA504-MBS.china.huawei.com>
References: <1459777195-7907-1-git-send-email-vijayak@caviumnetworks.com>
	<1459777195-7907-3-git-send-email-vijayak@caviumnetworks.com>
	<CAFEAcA_755uEOZoGj0SCtmT-5PyLMntkK3wZeuHvZ_kPG9A1aQ@mail.gmail.com>
	<5703D7EE.2000005@redhat.com>
	<CAFEAcA8G_-jQOtnVag2Ef++RbfbEJ-XzNnyYM=o9Sh8c6ohecA@mail.gmail.com>
	<C94A741879221447B4FC9B607EB4FFCD79EA34F4@DGGEMA504-MBX.china.huawei.com>
	<CAJhHMCDDu_kEJichH=60N=np+ZKbU1e9bWK-pP9Z-9=Fn4w1_w@mail.gmail.com>
	<C94A741879221447B4FC9B607EB4FFCD79EA7BA3@DGGEMA504-MBX.china.huawei.com>
	<CAFEAcA_0UA1hnP9XVBn8w0B66eyR12GnnUoCOxjirPSDgHcHvQ@mail.gmail.com>
In-Reply-To: <CAFEAcA_0UA1hnP9XVBn8w0B66eyR12GnnUoCOxjirPSDgHcHvQ@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.177.25.122]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A010205.58D5D45E.00CC, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=169.254.3.23,
	so=2014-11-16 11:51:01, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 875970e0f7132de6ddc5cc067b1e0374
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
	[fuzzy]
X-Received-From: 45.249.212.187
Subject: Re: [Qemu-devel] [Qemu-arm] [patch 1/1]about armv8's prefetch decode
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
Cc: "Shlomo Pongratz \(A\)" <shlomo.pongratz@huawei.com>,
	"Ori Chalak \(A\)" <Ori.Chalak@huawei.com>,
	qemu-devel <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Pranith Kumar <bobby.prani@gmail.com>,
	"Wanghaibin \(Benjamin\)" <benjamin.wanghaibin@huawei.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: J/n443WpektN

SGkgUGV0ZXIsDQoJTW9yZSBkZXRhaWwgaWxsdXN0cmF0aW9uIGF0IGJlbG93Lg0KDQo+IC0tLS0t
T3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFBldGVyIE1heWRlbGwgW21haWx0bzpwZXRl
ci5tYXlkZWxsQGxpbmFyby5vcmddDQo+IFNlbnQ6IEZyaWRheSwgTWFyY2ggMjQsIDIwMTcgNjow
NiBQTQ0KPiBUbzogV2FuZ2ppbnRhbmcNCj4gQ2M6IFByYW5pdGggS3VtYXI7IFNobG9tbyBQb25n
cmF0eiAoQSk7IFdhbmdoYWliaW4gKEJlbmphbWluKTsgcWVtdS1hcm07DQo+IHFlbXUtZGV2ZWw7
IE9yaSBDaGFsYWsgKEEpDQo+IFN1YmplY3Q6IFJlOiBbUWVtdS1hcm1dIFtwYXRjaCAxLzFdYWJv
dXQgYXJtdjgncyBwcmVmZXRjaCBkZWNvZGUNCj4gTm8sIHRoZXNlIGNoYW5nZXMgbG9vayB3cm9u
Zy4gUFJGTSBpbnN0cnVjdGlvbnMgZG8gbm90IG5lZWQgdG8NCj4gZG8gYW55dGhpbmcgYW5kIHNo
b3VsZCBkZWZpbml0ZWx5IG5vdCBiZSBlbWl0dGluZyBhbnkgaW50ZXJtZWRpYXRlDQo+IGNvZGUu
IEluIHBhcnRpY3VsYXIgaWYgeW91IGxldCBleGVjdXRpb24gZmFsbCB0aHJvdWdoIGFuZCB0cnkN
Cj4gZG9fZ3ByX2xkKCkgdGhlbiBpdCB3aWxsIHJlYWxseSBkbyBhIGxvYWQsIHdoaWNoIG1pZ2h0
IGNhdXNlDQo+IGFuIGV4Y2VwdGlvbiAtLSB0aGlzIGlzIHNwZWNpZmljYWxseSBmb3JiaWRkZW4g
Zm9yIFBSRk0uDQo+IEFyY2hpdGVjdHVyYWxseSB0aGUgQVJNIEFSTSBzYXlzICJpdCBpcyB2YWxp
ZCBmb3IgdGhlIFBFIHRvDQo+IHRyZWF0IGFueSBvciBhbGwgcHJlZmV0Y2ggaW5zdHJ1Y3Rpb25z
IGFzIGEgTk9QIiwgd2hpY2ggaXMNCj4gd2hhdCBRRU1VIGRvZXMuDQo+IA0KPiBUaGUgZXhpc3Rp
bmcgY29kZSBpcyBjb3JyZWN0LiBJbiBnZW5lcmFsIHlvdSBzaG91bGQgbm90DQo+IGV4cGVjdCB0
byBiZSBhYmxlIHRvIGRlZHVjZSB0aGUgZ3Vlc3QgaW5zdHJ1Y3Rpb25zIGZyb20NCj4gdGhlIGlu
dGVybWVkaWF0ZSBjb2RlIHJlcHJlc2VudGF0aW9uLg0KPiANCg0KIml0IGlzIHZhbGlkIGZvciB0
aGUgUEUgdG8gdHJlYXQgYW55IG9yIGFsbCBwcmVmZXRjaCBpbnN0cnVjdGlvbnMgYXMgYSBOT1Ai
LCANCmZyb20gc29mdHdhcmUgdmlldywgaXQncyByaWdodC4NCnRoZSBwYXRjaCByZWdhcmQgdGhl
IHByZWZldGNoIGFzIGxvYWQgaW5zdHJ1Y3Rpb24sIGF0IHRoZSBzYW1lIHRpbWUgDQpkb24ndCBh
ZmZlY3Qgcm0vcnQgcmVnaXN0ZXIuIE9ubHkgdGhlIFBSRk0gaW5zdHJ1Y3Rpb24gYmVlbiBlbWl0
dGVkIHRvDQppbnRlcm1lZGlhdGUgY29kZSBhbmQgZG8gYSByZWFsbHkgbG9hZCwgdGhlbiB3ZSBj
YW4gZ2V0IHRoZSBtZW1vcnkgDQphZGRyZXNzIHJlbGF0aXZlIHRvIHRoZSBwcmVmZXRjaCBpbnN0
cnVjdGlvbi4gQmVjYXVzZSB0aGUgcm0vcnQgcmVnaXN0ZXIgDQpkb24ndCBiZWVuIG1vZGlmaWVk
LCBzbyB0aGUgYXBwbGljYXRpb24gY2FuIHJ1biBjb3JyZWN0bHkuIA0KQlRXLCB0aGUgbmV3IGFk
ZGVkIGNvZGUgZGVmYXVsdCBpcyBkaXNhYmxlLiBTbyBmb3IgdGhlIGNvbW1vbiB1c2VyLCBoYXZl
IG5vIA0KYWZmZWN0IHRvIHRoZW0uDQoNCkluIG91ciBjYXNlLCB3ZSBuZWVkIGFsbCB0aGUgaW5z
dHJ1Y3Rpb24gdHJhY2UgJiBsZC9zdCBpbnN0cnVjdGlvbidzIA0KYWNjZXNzIG1lbW9yeSBhZGRy
ZXNzLCB0aGUgdHJhY2UgYXMgdGhlIGlucHV0IGZvciBjaGlwIGN5Y2xlLWFjY3VyYXRlIA0KbW9k
ZWwuIFNpbWlsYXIgd2l0aCBmbGV4dXMgKyBxZW11LiANCkN1cnJlbnQgY29kZSB0aGF0IHNraXAg
Z2VuZXJhdGUgcHJlZmV0Y2ggaW5zdHJ1Y3Rpb25zJyBpbnRlcm1lZGlhdGUgY29kZSwgDQpTbyB3
ZSBjYW4gZ2V0IHByZWZldGNoIGluc3RydWN0aW9uLCBidXQgY2FuJ3QgZ2V0IHRoZSBwcmVmZXRj
aCBpbnN0cnVjdGlvbiANCnJlbGF0aXZlIG1lbW9yeSBhZGRyZXNzLiANCldlIGhhdmUgdGVzdGVk
IHRoYXQgdGhlIHJhdGlvIG9mIHByZWZldGNoIGluc3RydWN0aW9ucyBpcyBhYm91dCAyJX4zJSBk
dXJpbmcgDQpydW4gRGhyeXN0b25lIGluIHN5c3RlbSBtb2RlLiBUaGUgcmF0aW8gaXMgaGlnaC4N
Cl9fX19fX19fX19fX19fX18gICAgICAgICAgICAgICAgICAgICAgIF9fX19fX19fX19fX19fX18N
CnwgICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgIHwgICAgICAgICAgICAgICAg
fA0KfCAgICAgICAgICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAg
ICB8DQp8ICAgUWVtdSAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgIHwgIGNoaXAgICAgICAg
ICAgfA0KfCAgICAgICAgICAgICAgICB8ICAgaW5zdHJ1Y3Rpb24gdHJhY2UgICAgfCBjeWNsZS1h
Y2N1cmF0ZSAgIHwNCnwgICAgICAgICAgICAgICAgfCAgICAtLS0tLS0tLS0tLS0tLS0tLT4gICAg
ICB8IG1vZGVsICAgICAgICAgIHwNCnwgICAgICAgICAgICAgICAgfCAgIG1lbW9yeSB0cmFjZSAg
ICAgIHwgICAgICAgICAgICAgICAgfA0KfF9fX19fX19fX19fX19fX198ICAgICAgICAgICAgICAg
ICAgICAgfF9fX19fX19fX19fX19fX198DQoNCg0KDQpPcmkgQ2hhbGFrJ3MgZXhwbGFpbiB0aGlz
IGFzIGJlbG93Og0KIiBJbmRlZWQsIHByZWZldGNoIGluc3RydWN0aW9uIGFmZmVjdHMgb25seSB0
aGUgbWljcm8gYXJjaGl0ZWN0dXJlLCANCmFuZCBoZW5jZSBub3QgbmVlZGVkIGZvciBydW5uaW5n
IGNvcnJlY3RseSB0aGUgZ2VuZXJhdGVkIGNvZGUuDQpIb3dldmVyLCB3ZSBkZXZlbG9wZWQgYSBw
ZXJmb3JtYW5jZSBzaW11bGF0b3IgZm9yIGEgZGV0YWlsZWQgDQpBUk12OCBDUFUgbW9kZWwsIGFu
ZCB1c2UgUWVtdSB0byByZXNvbHZlIHRoZSBmdW5jdGlvbmFsaXR5Lg0KQW5kIGZvciB0aGlzIHB1
cnBvc2Ugd2UgbmVlZCB0byB0cmFuc2xhdGUgYWxsIGluc3RydWN0aW9ucyB0aGF0IA0KbWF5IGFm
ZmVjdCB0aGUgcGlwZWxpbmUgYmVoYXZpb3IsIGNhY2hlcywgZXRjLg0KDQpUaGlzIGlzIG5vdCB0
aGUgbWFqb3IgdXNhZ2Ugb2YgUWVtdSwgaG93ZXZlciB0aGVyZSBtYXkgYmUgDQpvdGhlcnMgZG9p
bmcgdGhpcyBhbmQgaXQgbWF5IGhlbHAgdGhlbS4NCmh0dHA6Ly93d3cubGludXgta3ZtLm9yZy9p
bWFnZXMvNC80NS8wMXgwOS1DaHJpc3RvcGhlcl9Db3Zpbmd0b24tVXNpbmdfVXBzdHJlYW1fUUVN
VV9mb3JfQ0FTUy5wZGYgIg0KDQoNCkJlc3QgUmVnYXJkcywNCldhbmcgamludGFuZyAvIEplZA0K
SHVhd2VpIFRlY2hub2xvZ2llcyBDby4sIEx0ZC4gDQpFbWFpbDogd2FuZ2ppbnRhbmdAaHVhd2Vp
LmNvbQ0KaHR0cDovL3d3dy5odWF3ZWkuY29tDQo=
