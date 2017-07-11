Received: by 10.25.44.15 with SMTP id s15csp4937435lfs;
        Tue, 11 Jul 2017 07:50:54 -0700 (PDT)
X-Received: by 10.80.225.203 with SMTP id m11mr2859983edl.107.1499784654667;
        Tue, 11 Jul 2017 07:50:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499784654; cv=none;
        d=google.com; s=arc-20160816;
        b=rbGmw8+9Kp1VN9bZ3CTW+BX7cwd/YcTa+0Z9WGXUw1x//PsNiNFbNr9OdMENtwG81l
         u+NCLsPgUvHwBVJw+u/bercAOAjjuTKoMaY+CnmATnlJfUv9oaDaZjtndf9668pkwr8l
         tU3OuBBGxDxVbmYpirRuOKFmj3iN/5b0hOOAcKhwRE5ALKZDLp1q1OrZ9NHGreebqHsK
         rNVK4uGT4LhrzJdMySl3hfL3Q+rzOqdNTnYb3/MVEnoWAXEVLHYOJtbyIwGuiy3mi9Er
         9urLJPmzmxxfZd0L9LVg3idRV/loGRZRvIWgRKfSN16EEiCGpCEzxgF7LnYY3RwIQe9S
         DZwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-language:accept-language
         :message-id:date:thread-index:thread-topic:to:from
         :arc-authentication-results;
        bh=iv3FuMSvE2pYwgVkole0AyViHHJ1veUAiDZfydP9Jsk=;
        b=boo2rwPwmgFxMVoYdckjCSa8iQGAkirsz3tQ6O+Q9qGp2naYFXUzsIcAq4tkZkmOf0
         7tujpAiE7+p5CwnUUcUrCC/DyJhYY8X3+OQuRwOOHwwN+20PYvza2fnIA/ta/eRxhP4W
         A/ykOI94PCy137etdT/ay5GRNtJnB9bp6C9Gm3y96+ZGxMb6FtUcoM4ezN3v0o7SvoGE
         dF9pkoKhENEI+M2I3esuaFcoz06jbJtm8R2thsbsFv7WVDpVdZDDx5VgkNyqLpOBfz71
         SQ2vk2TGTpJMjlEahxwcBaZ0dbkp6bWo7mSpG6ljYU1W0+zkkg0KsJ2PIz7MFMW1bprj
         PuGw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id a43si1758479edc.8.2017.07.11.07.50.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 11 Jul 2017 07:50:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46830 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dUwV3-0007Oy-K4
	for alex.bennee@linaro.org; Tue, 11 Jul 2017 10:50:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47016)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1dUwUw-0007NS-Nc
	for qemu-arm@nongnu.org; Tue, 11 Jul 2017 10:50:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1dUwUt-0003U8-KY
	for qemu-arm@nongnu.org; Tue, 11 Jul 2017 10:50:46 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:3964)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_ARCFOUR_SHA1:16) (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>)
	id 1dUwUs-0003Sd-SJ; Tue, 11 Jul 2017 10:50:43 -0400
Received: from 172.30.72.55 (EHLO DGGEMA405-HUB.china.huawei.com)
	([172.30.72.55])
	by dggrg02-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
	with ESMTP id AQW49240; Tue, 11 Jul 2017 22:50:22 +0800 (CST)
Received: from DGGEMA503-MBS.china.huawei.com ([169.254.2.48]) by
	DGGEMA405-HUB.china.huawei.com ([10.3.20.46]) with mapi id
	14.03.0301.000; Tue, 11 Jul 2017 22:50:12 +0800
From: gengdongjiu <gengdongjiu@huawei.com>
To: Eric Blake <eblake@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Thread-Topic: [PATCH resend v4 0/3] Generate APEI GHES table and dynamically
	record CPER
Thread-Index: AdL6VI0Athkvscr4QxW50h+oRWzuzg==
Date: Tue, 11 Jul 2017 14:50:11 +0000
Message-ID: <0184EA26B2509940AA629AE1405DD7F2014DD643@DGGEMA503-MBS.china.huawei.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.45.92.66]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020201.5964E5B0.002A, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=169.254.2.48,
	so=2014-11-16 11:51:01, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 976bd3fa5c5d272e6ef2099aae411765
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
	[fuzzy]
X-Received-From: 45.249.212.188
Subject: Re: [Qemu-arm] [PATCH resend v4 0/3] Generate APEI GHES table and
 dynamically record CPER
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	Wuquanming <wuquanming@huawei.com>, "famz@redhat.com" <famz@redhat.com>,
	"mst@redhat.com" <mst@redhat.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Huangshaoyu <huangshaoyu@huawei.com>,
	Zhaoshenglong <zhaoshenglong@huawei.com>,
	"imammedo@redhat.com" <imammedo@redhat.com>,
	"Zhengqiang \(turing\)" <zhengqiang10@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +wvaXVRsYrA6

RXJpYywNCiAgVGhhbmtzIGZvciB5b3VyIGZvbGxvdyB1cC4gDQpJdCBpcyBpbmRlZWQgdGhhdCBJ
IHNlbmQgdGhlIHBhdGNoZXMgb25lIGJ5IG9uZS4gdGhleSBzaG91bGQgYmUgc2VudCB0b2dldGhl
ci4NCkkgd2lsbCB1c2UgYmVsb3cgY29tbWFuZHMgdG8gZml4IHRoaXMgaXNzdWUsIG5vdyB0aGUg
Y2hpbmVzIHRpbWUgaXMgbWlkbmlnaHQsIHNvIEkgd2lsbCBoYXZlIHRvIHVwZGF0ZSBpdCB0b21v
cnJvdy4gDQoNCj4gU28gc2VuZCB0aGUgcGF0Y2hlcyB3aXRoDQo+IA0KPiAgIGdpdCBzZW5kLWVt
YWlsICoucGF0Y2gNCj4gDQo+IG9yIHB1dCBhbGwgdGhlIHBhdGNoZXMgaW50byBhIHRlbXBvcmFy
eSBkaXJlY3RvcnksIGFuZCBydW4NCj4gDQo+ICAgZ2l0IHNlbmQtZW1haWwgcGF0Y2gtZGlyLw0K
DQoNCi0tLS0t6YKu5Lu25Y6f5Lu2LS0tLS0NCuWPkeS7tuS6ujogRXJpYyBCbGFrZSBbbWFpbHRv
OmVibGFrZUByZWRoYXQuY29tXSANCuWPkemAgeaXtumXtDogMjAxN+W5tDfmnIgxMeaXpSAyMTo1
OA0K5pS25Lu25Lq6OiBMYXN6bG8gRXJzZWsgPGxlcnNla0ByZWRoYXQuY29tPjsgZ2VuZ2Rvbmdq
aXUgPGdlbmdkb25naml1QGh1YXdlaS5jb20+DQrmioTpgIE6IG1zdEByZWRoYXQuY29tOyBpbWFt
bWVkb0ByZWRoYXQuY29tOyBmYW16QHJlZGhhdC5jb207IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZzsg
Wmhhb3NoZW5nbG9uZyA8emhhb3NoZW5nbG9uZ0BodWF3ZWkuY29tPjsgcGV0ZXIubWF5ZGVsbEBs
aW5hcm8ub3JnOyBxZW11LWFybUBub25nbnUub3JnOyBaaGVuZ3FpYW5nICh0dXJpbmcpIDx6aGVu
Z3FpYW5nMTBAaHVhd2VpLmNvbT47IEh1YW5nc2hhb3l1IDxodWFuZ3NoYW95dUBodWF3ZWkuY29t
PjsgV3VxdWFubWluZyA8d3VxdWFubWluZ0BodWF3ZWkuY29tPjsgR2FvemhpaHVpIDx6aGlodWku
Z2FvQGh1YXdlaS5jb20+DQrkuLvpopg6IFJlOiBbUEFUQ0ggcmVzZW5kIHY0IDAvM10gR2VuZXJh
dGUgQVBFSSBHSEVTIHRhYmxlIGFuZCBkeW5hbWljYWxseSByZWNvcmQgQ1BFUg0KDQpPbiAwNy8x
MS8yMDE3IDA4OjQzIEFNLCBMYXN6bG8gRXJzZWsgd3JvdGU6DQo+IFNvIHNlbmQgdGhlIHBhdGNo
ZXMgd2l0aA0KPiANCj4gICBnaXQgc2VuZC1lbWFpbCAqLnBhdGNoDQo+IA0KPiBvciBwdXQgYWxs
IHRoZSBwYXRjaGVzIGludG8gYSB0ZW1wb3JhcnkgZGlyZWN0b3J5LCBhbmQgcnVuDQo+IA0KPiAg
IGdpdCBzZW5kLWVtYWlsIHBhdGNoLWRpci8NCg0KT3IgeW91IGNhbiBldmVuIHNraXAgcGF0Y2gg
ZmlsZXMsIGFuZCBkaXJlY3RseSBzZW5kIHRoaW5ncyB3aXRoIG9uZSBsYXNzIGNoYW5jZSBpbiB5
b3VyIGVkaXRvcjoNCg0KZ2l0IHNlbmQtZW1haWwgLXY1IC0zIC0tYW5ub3RhdGUgLS1jb3Zlci1s
ZXR0ZXINCg0KW3NlbmQgdGhlIHRvcCB0aHJlZSBjb21taXRzIGluIG15IGN1cnJlbnQgZ2l0IGJy
YW5jaCBhcyBhIHZlcnNpb24gNSBwYXRjaCBzZXJpZXMsIHdoZXJlIEkgZ2V0IHRvIHdyaXRlIHRo
ZSBjb3ZlciBsZXR0ZXIgYW5kIHR3ZWFrIGFueSBvZiB0aGUgcGF0Y2hlcyBpbiBteSBwcmVmZXJy
ZWQgJEVESVRPUiBiZWZvcmUgc2VuZGluZyBhbnl0aGluZ10NCg0KLS0NCkVyaWMgQmxha2UsIFBy
aW5jaXBhbCBTb2Z0d2FyZSBFbmdpbmVlcg0KUmVkIEhhdCwgSW5jLiAgICAgICAgICAgKzEtOTE5
LTMwMS0zMjY2DQpWaXJ0dWFsaXphdGlvbjogIHFlbXUub3JnIHwgbGlidmlydC5vcmcNCg0K
