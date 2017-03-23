Received: by 10.25.15.230 with SMTP id 99csp646872lfp;
        Thu, 23 Mar 2017 01:46:09 -0700 (PDT)
X-Received: by 10.200.46.196 with SMTP id i4mr1213686qta.17.1490258769325;
        Thu, 23 Mar 2017 01:46:09 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g17si3144011qtc.257.2017.03.23.01.46.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Mar 2017 01:46:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54960 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cqyNk-0006RW-Se
	for alex.bennee@linaro.org; Thu, 23 Mar 2017 04:46:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39835)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wangjintang@huawei.com>) id 1cqyNg-0006RR-S0
	for qemu-arm@nongnu.org; Thu, 23 Mar 2017 04:46:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wangjintang@huawei.com>) id 1cqyNd-0001XX-L0
	for qemu-arm@nongnu.org; Thu, 23 Mar 2017 04:46:04 -0400
Received: from [45.249.212.187] (port=3007 helo=dggrg01-dlp.huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_ARCFOUR_SHA1:16) (Exim 4.71)
	(envelope-from <wangjintang@huawei.com>) id 1cqyNa-0000ti-7I
	for qemu-arm@nongnu.org; Thu, 23 Mar 2017 04:46:01 -0400
Received: from 172.30.72.56 (EHLO DGGEMA405-HUB.china.huawei.com)
	([172.30.72.56])
	by dggrg01-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
	with ESMTP id ALG11601; Thu, 23 Mar 2017 16:41:20 +0800 (CST)
Received: from DGGEMA504-MBX.china.huawei.com ([169.254.4.180]) by
	DGGEMA405-HUB.china.huawei.com ([10.3.20.46]) with mapi id
	14.03.0301.000; Thu, 23 Mar 2017 16:41:11 +0800
From: Wangjintang <wangjintang@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>
Thread-Topic: [Qemu-arm] about armv8's prefetch decode
Thread-Index: AQHRj1R6bYMlriGS4E2IOsFES6FMxKGfZpSAgATWYmA=
Date: Thu, 23 Mar 2017 08:41:11 +0000
Message-ID: <C94A741879221447B4FC9B607EB4FFCD79EA6B52@DGGEMA504-MBX.china.huawei.com>
References: <1459777195-7907-1-git-send-email-vijayak@caviumnetworks.com>
	<1459777195-7907-3-git-send-email-vijayak@caviumnetworks.com>
	<CAFEAcA_755uEOZoGj0SCtmT-5PyLMntkK3wZeuHvZ_kPG9A1aQ@mail.gmail.com>
	<5703D7EE.2000005@redhat.com>
	<CAFEAcA8G_-jQOtnVag2Ef++RbfbEJ-XzNnyYM=o9Sh8c6ohecA@mail.gmail.com> 
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
	refid=str=0001.0A020206.58D38A32.019F, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=169.254.4.180,
	so=2014-11-16 11:51:01, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 8f596a3057ff9a436ff8afe7d163b73a
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
	[fuzzy]
X-Received-From: 45.249.212.187
Subject: Re: [Qemu-arm] about armv8's prefetch decode
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
Cc: "Shlomo Pongratz \(A\)" <shlomo.pongratz@huawei.com>,
	"Wanghaibin \(Benjamin\)" <benjamin.wanghaibin@huawei.com>,
	"Ori Chalak \(A\)" <Ori.Chalak@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DJcS+Cw7sFVe

SGksDQoNCglUaGVyZSBpcyBubyBmZWVkYmFjayBhYm91dCB0aGlzLCBzbyBhc2sgYWdhaW4uICAN
CkRvZXMgbmVlZCBJIHBhc3RlIHRoZSBhcm12OCdzIHByZWZldGNoIGluc3RydWN0aW9uIGRlY29k
ZSBwYXRjaCBoZXJlPyANCg0KV2Ugd2lsbCByZWxlYXNlIGl0IHVuZGVyIGEgbWFjcm8sIHdob3Nl
IGRlZmF1bHQgaXMgZGlzYWJsZWQuIA0KDQojdW5kZWYgIFRDR19BQVJDSDY0X1RSQU5TTEFURV9Q
UkVGRVRDSA0KI2lmZGVmIFRDR19BQVJDSDY0X1RSQU5TTEFURV9QUkVGRVRDSA0KUHJlZmV0Y2gg
dHJhbnNsYXRpb24NCiNlbmRpZg0KDQpCZXN0IFJlZ2FyZHMsDQrnjovph5HloIIgLyBKZWQNCg0K
DQoNCuWNjuS4uuaKgOacr+aciemZkOWFrOWPuEh1YXdlaSBUZWNobm9sb2dpZXMgQ28uLCBMdGQu
IA0KRW1haWw6IHdhbmdqaW50YW5nQGh1YXdlaS5jb20NCkJ1aWxkaW5nIFo4LCBIdWF3ZWkgUiZE
IGNlbnRlciwgSmlhbmdzaHUgUmQgMzYwLCBCaW5qaWFuZyBEaXN0cmljdCxIYW5nemhvdSAzMTAw
NTEsIFAuUi5DaGluYQ0KaHR0cDovL3d3dy5odWF3ZWkuY29tIA0KDQoNCj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogV2FuZ2ppbnRhbmcNCj4gU2VudDogTW9uZGF5LCBNYXJj
aCAyMCwgMjAxNyAyOjM1IFBNDQo+IFRvOiAnUGV0ZXIgTWF5ZGVsbCcNCj4gQ2M6IHFlbXUtYXJt
OyBTaGxvbW8gUG9uZ3JhdHogKEEpOyBPcmkgQ2hhbGFrIChBKQ0KPiBTdWJqZWN0OiBbUWVtdS1h
cm1dIGFib3V0IGFybXY4J3MgcHJlZmV0Y2ggZGVjb2RlDQo+IA0KPiBIaSwNCj4gDQo+IAlXZSBz
ZWUgdGhhdCBhcm12OCdzIHByZWZldGNoIGluc3RydWN0aW9uIGRlY29kZSBoYXZlIGJlZW4gc2tp
cHBlZCBpbg0KPiBxZW11LiBGb3Igc29tZSB1c2VyLCB0aGV5IG5lZWQgcHJlZmV0Y2ggaW5zdHJ1
Y3Rpb24sIGZvciBleGFtcGxlLCB0aGV5IHVzZQ0KPiBxZW11IHRvIGdlbmVyYXRlIHRoZSBpbnN0
cnVjdGlvbiB0cmFjZS4gV2Ugd2FudCB0byBtZXJnZSB0aGlzIHBhdGNoIHRvDQo+IGNvbW11bml0
eSwgaXQncyBvayBvciBub3Q/ICBUaGFua3MuDQo+IA0KPiANCj4gQmVzdCBSZWdhcmRzLA0KPiDn
jovph5HloIIgLyBKZWQNCj4gDQo+IA0KPiANCj4gSHVhd2VpIFRlY2hub2xvZ2llcyBDby4sIEx0
ZC4NCj4gRW1haWw6IHdhbmdqaW50YW5nQGh1YXdlaS5jb20NCj4gaHR0cDovL3d3dy5odWF3ZWku
Y29tDQo=
