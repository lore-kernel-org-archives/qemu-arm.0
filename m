Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp665511wre;
        Fri, 1 Jun 2018 07:04:38 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJoKCmGCKCE7SUxVvA68+Wx4fwMcTM6bjz+gXV4+tzA4sCCp3sdDKYrxH5fxJKQdgG3MXQ9
X-Received: by 2002:a37:1fd4:: with SMTP id n81-v6mr9637457qkh.308.1527861878839;
        Fri, 01 Jun 2018 07:04:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527861878; cv=none;
        d=google.com; s=arc-20160816;
        b=L0G1rkSulWEx08v+amQha8TDcfmSGiUV4/x240wHNOAS3czX+pbKWZb2UUt+SCbN5a
         8H7B+kR98pegUYopwzcJ9yOvnyziKNhdX2RbIws2OcSbpE6qrHF3S4X6DdRrETzAWv0q
         WbXV6lYV6nXcOgSPIezXg30PeKAEyiTfu/pmUhcQJCDTznUWmWvUg3GXHiIUHpjGb+oD
         7Ciks6t8B7MtP3Q+ZSBC7Lx4IL51lw6FYSDRyQ9XKNkOeQuvUHEXXJOOsCBG/etLDFr1
         ZJTWT3wKoefYWMuVM1ur2K1f3Yoay2n2Gh5ORBTGydSfmNErJ1X7KAaTbfjKm8kPAC1G
         Qa4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-language:accept-language
         :message-id:date:thread-index:thread-topic:to:from
         :arc-authentication-results;
        bh=JxqQdSCS1tjRgpAKgZbBy0oDmBVtDhuWTXNUg+TGj2s=;
        b=GHbfR2sxBmD2y5NHsIi2/JOaq+wLkZrl4PHryyBNep7ivyC3jCIo+dNSux3cJT/CPv
         1Z6wdlzCX4q/H80pmgtx87rnUsyBTKMg+v+STZWpZqW71waS97jsvwVLqF/XP5YHfinx
         cP0Fuvddp9eq/ZAgEHT/5S3NcgDrlZw0pnkcA9yOuCp+3NYSeIen+CQGkFskUSGcRNAe
         pt7WomTI0a2d9cEWmXeDIYZOJ51yqGS8kD6ZZTtIFidn4znLUKE5O+dVvwM89aFkJqW6
         FbRCqMstxXS1I8c6Z3OCmj8l+e8jG2nRDV+wf3M3/gen4bIy9S2zt6oyrfenx8Hw5glQ
         CgrA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 17-v6si1881850qtv.20.2018.06.01.07.04.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Jun 2018 07:04:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55909 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fOkfW-0005Fv-Cv
	for alex.bennee@linaro.org; Fri, 01 Jun 2018 10:04:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35671)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1fOkfL-0005Fm-Fv
	for qemu-arm@nongnu.org; Fri, 01 Jun 2018 10:04:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1fOkfH-0001zw-7I
	for qemu-arm@nongnu.org; Fri, 01 Jun 2018 10:04:27 -0400
Received: from [45.249.212.255] (port=51404 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <gengdongjiu@huawei.com>)
	id 1fOkfE-0001tb-MK; Fri, 01 Jun 2018 10:04:23 -0400
Received: from DGGEMA404-HUB.china.huawei.com (unknown [172.30.72.55])
	by Forcepoint Email with ESMTP id BE3B189C6B32A;
	Fri,  1 Jun 2018 21:17:09 +0800 (CST)
Received: from DGGEMA423-HUB.china.huawei.com (10.1.198.156) by
	DGGEMA404-HUB.china.huawei.com (10.3.20.45) with Microsoft SMTP Server
	(TLS) id 14.3.382.0; Fri, 1 Jun 2018 21:17:09 +0800
Received: from DGGEMA503-MBX.china.huawei.com ([169.254.1.111]) by
	dggema423-hub.china.huawei.com ([10.1.198.156]) with mapi id
	14.03.0382.000; Fri, 1 Jun 2018 21:17:04 +0800
From: gengdongjiu <gengdongjiu@huawei.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH RESEND v1 0/3] add support for VCPU event
	states
Thread-Index: AdP5qsdFCpf43D3+S5S/p3QMyk2Qeg==
Date: Fri, 1 Jun 2018 13:17:03 +0000
Message-ID: <0184EA26B2509940AA629AE1405DD7F201CAECD7@DGGEMA503-MBX.china.huawei.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.45.53.132]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 45.249.212.255
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH RESEND v1 0/3] add support for
 VCPU event states
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
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"famz@redhat.com" <famz@redhat.com>,
	"james.morse@arm.com" <james.morse@arm.com>, Linuxarm <linuxarm@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Wh1u8PdfPRqa

SGkgUGV0ZXIsDQogIA0KPiBIaSwNCj4gDQo+IFRoaXMgc2VyaWVzIGZhaWxlZCBidWlsZCB0ZXN0
IG9uIHMzOTB4IGhvc3QuIFBsZWFzZSBmaW5kIHRoZSBkZXRhaWxzIGJlbG93Lg0KPiANClsuLi5d
DQoNCj4gbWFrZVsxXTogKioqIFdhaXRpbmcgZm9yIHVuZmluaXNoZWQgam9icy4uLi4NCj4gICBD
QyAgICAgIGFhcmNoNjQtc29mdG1tdS9ody9kaXNwbGF5L3ZnYS5vDQo+ICAgQ0MgICAgICBhYXJj
aDY0LXNvZnRtbXUvaHcvZGlzcGxheS92aXJ0aW8tZ3B1Lm8NCj4gbWFrZTogKioqIFtNYWtlZmls
ZTo0ODI6IHN1YmRpci1hcm0tc29mdG1tdV0gRXJyb3IgMg0KPiAgIENDICAgICAgYWFyY2g2NC1z
b2Z0bW11L2h3L2Rpc3BsYXkvdmlydGlvLWdwdS0zZC5vDQo+ICAgQ0MgICAgICBhYXJjaDY0LXNv
ZnRtbXUvaHcvZGlzcGxheS92aXJ0aW8tZ3B1LXBjaS5vDQo+ICAgQ0MgICAgICBhYXJjaDY0LXNv
ZnRtbXUvaHcvZGlzcGxheS9kcGNkLm8NCj4gICBDQyAgICAgIGFhcmNoNjQtc29mdG1tdS9ody9k
aXNwbGF5L3hsbnhfZHAubw0KPiAvdmFyL3RtcC9wYXRjaGV3LXRlc3Rlci10bXAtaHdzbjN3c2wv
c3JjL2h3L2Rpc3BsYXkvdmlydGlvLWdwdS0zZC5jOiBJbiBmdW5jdGlvbiDigJh2aXJnbF9jbWRf
Z2V0X2NhcHNldF9pbmZv4oCZOg0KPiAvdmFyL3RtcC9wYXRjaGV3LXRlc3Rlci10bXAtaHdzbjN3
c2wvc3JjL2h3L2Rpc3BsYXkvdmlydGlvLWdwdS0zZC5jOjM2NjoyNjogZXJyb3I6IOKAmFZJUlRJ
T19HUFVfQ0FQU0VUX1ZJUkdMMuKAmSB1bmRlY2xhcmVkIChmaXJzdA0KPiB1c2UgaW4gdGhpcyBm
dW5jdGlvbik7IGRpZCB5b3UgbWVhbiDigJhWSVJUSU9fR1BVX0NBUFNFVF9WSVJHTOKAmT8NCj4g
ICAgICAgICAgcmVzcC5jYXBzZXRfaWQgPSBWSVJUSU9fR1BVX0NBUFNFVF9WSVJHTDI7DQo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+DQo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgVklSVElPX0dQVV9DQVBTRVRfVklSR0wNCj4gL3Zhci90bXAv
cGF0Y2hldy10ZXN0ZXItdG1wLWh3c24zd3NsL3NyYy9ody9kaXNwbGF5L3ZpcnRpby1ncHUtM2Qu
YzozNjY6MjY6IG5vdGU6IGVhY2ggdW5kZWNsYXJlZCBpZGVudGlmaWVyIGlzIHJlcG9ydGVkIG9u
bHkgb25jZSBmb3INCj4gZWFjaCBmdW5jdGlvbiBpdCBhcHBlYXJzIGluDQo+IC92YXIvdG1wL3Bh
dGNoZXctdGVzdGVyLXRtcC1od3NuM3dzbC9zcmMvaHcvZGlzcGxheS92aXJ0aW8tZ3B1LTNkLmM6
IEluIGZ1bmN0aW9uIOKAmHZpcnRpb19ncHVfdmlyZ2xfZ2V0X251bV9jYXBzZXRz4oCZOg0KPiAv
dmFyL3RtcC9wYXRjaGV3LXRlc3Rlci10bXAtaHdzbjN3c2wvc3JjL2h3L2Rpc3BsYXkvdmlydGlv
LWdwdS0zZC5jOjY0NjozMjogZXJyb3I6IOKAmFZJUlRJT19HUFVfQ0FQU0VUX1ZJUkdMMuKAmSB1
bmRlY2xhcmVkIChmaXJzdA0KPiB1c2UgaW4gdGhpcyBmdW5jdGlvbik7IGRpZCB5b3UgbWVhbiDi
gJhWSVJUSU9fR1BVX0NBUFNFVF9WSVJHTOKAmT8NCg0KVGhpcyBidWlsZCBmYWlsdXJlIGlzIGR1
ZSB0byBrZXJuZWwgbWlzc2luZyB0aGUgZGVmaW5pdGlvbiBvZiAiVklSVElPX0dQVV9DQVBTRVRf
VklSR0wyIiwgSSBzeW5jIHRoZSBtYWlubGluZSBrZXJuZWwgdHJlZSBoZWFkZXIgZmlsZSB0byB0
aGUgbWFpbmxpbmUgUUVNVSB1c2luZyB0aGUgc2NyaXB0c1sxXSwNClNvIGhhcHBlbiB0aGlzIGZh
aWx1cmUsIEl0IGRvZXMgbm90IHJlbGF0ZWQgd2l0aCBteXNlbGYgcGF0Y2gsIHNvIGNhbiBJIGRp
c2NhcmQgdGhlIHBhdGNoIFsxXSBvciBhZGQgdGhlIOKAmFZJUlRJT19HUFVfQ0FQU0VUX1ZJUkdM
MuKAmSBkZWZpbml0aW9uIHRvIG1haW5saW5lIGtlcm5lbCB0cmVlPw0KDQpbMV0gaHR0cHM6Ly9s
aXN0cy5nbnUub3JnL2FyY2hpdmUvaHRtbC9xZW11LWRldmVsLzIwMTgtMDUvbXNnMDY5NzMuaHRt
bA0KDQo+ICAgICAgdmlyZ2xfcmVuZGVyZXJfZ2V0X2NhcF9zZXQoVklSVElPX0dQVV9DQVBTRVRf
VklSR0wyLA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFZJUlRJT19HUFVf
Q0FQU0VUX1ZJUkdMDQo+IG1ha2VbMV06ICoqKiBbL3Zhci90bXAvcGF0Y2hldy10ZXN0ZXItdG1w
LWh3c24zd3NsL3NyYy9ydWxlcy5tYWs6NjY6IGh3L2Rpc3BsYXkvdmlydGlvLWdwdS0zZC5vXSBF
cnJvciAxDQo+IG1ha2VbMV06ICoqKiBXYWl0aW5nIGZvciB1bmZpbmlzaGVkIGpvYnMuLi4uDQo+
IG1ha2U6ICoqKiBbTWFrZWZpbGU6NDgyOiBzdWJkaXItYWFyY2g2NC1zb2Z0bW11XSBFcnJvciAy
DQo+ID09PSBPVVRQVVQgRU5EID09PQ0KPiANCj4gVGVzdCBjb21tYW5kIGV4aXRlZCB3aXRoIGNv
ZGU6IDINCj4gDQo+IA0KPiAtLS0NCj4gRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkg
UGF0Y2hldyBbaHR0cDovL3BhdGNoZXcub3JnL10uDQo+IFBsZWFzZSBzZW5kIHlvdXIgZmVlZGJh
Y2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQuY29tDQo=
