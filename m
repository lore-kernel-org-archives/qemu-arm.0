Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp182745wrq;
        Mon, 4 Jun 2018 15:13:01 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLPq6xz/5zm74lGjCdnDXIxW5Xt6pF5Rs+e4pUZAjVurJFLJv8aHo4yr11jrNgOAiMXjAqr
X-Received: by 2002:ac8:430e:: with SMTP id z14-v6mr19768270qtm.105.1528150380919;
        Mon, 04 Jun 2018 15:13:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528150380; cv=none;
        d=google.com; s=arc-20160816;
        b=NSgOHzaowYFLwbv3fVUvrvvYNrI9Wf0BiVVxXARsJ9vN3rJNrB3kdHdh+eej8oQrLx
         NQPd1cWLmM2SoVcdVIf7T9EkBrWz6KLRkef2lx2cQaFhiTko5QvmZbOXqp19d1aCaHGR
         F09WV9+osGVJJXSvDvOBI3Py+eIiRcO95mY3x3yT1ZrGtvokX0fJNmhKsrfFCgIlEKBf
         mE6ef5j0123hrpw0ZsVc9boO0LviVImuiCon/qlLbFqcJCQW/PHk36dMBpLkbcbo6x8j
         ylORj6eYNx5YJSw2AXqF3bO/hvJpLPEp0YCtFhQQVQPiYeIM6exFsnPFBfGsJfqlTTcL
         doFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-language:accept-language
         :message-id:date:thread-index:thread-topic:to:from
         :arc-authentication-results;
        bh=hUpp1W6AnBDKjFoUYKCLCsXMJsuLYcBhC7fsSRxygjs=;
        b=QhehnAK8IFnjM/QdB5r7VS+E/hTp67vOzDasYC7gPl+4FGEnW3cHxog/aa4r1PH7TQ
         yvDiHizszaf7OWFsfNWiOOO6bTDVaBU0dMMhhOezsOAYNfzP1zfA21l3oGfs+EEtGPaP
         qfb8Z8k5+/er618KXOzMfjqymguR+KJfsgj3GGjB/ojH6Wu9L47OkMV/INs/XpILm/bb
         CTVkhC4d5XDnED++hSv7BrXECkxQWqgzX/ScbHy16oQ0EKKS5nh9sJf7ZkDig8wFI8fo
         FFqyvW84OZzvJhjZOsnWlW1NcAhfn+m8XcDdf5PzkhnQ0Rf3aazwT1vyrVkrWFis+rIc
         yTnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s3-v6si22348290qte.232.2018.06.04.15.13.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Jun 2018 15:13:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42143 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fPxim-0003nV-Cl
	for alex.bennee@linaro.org; Mon, 04 Jun 2018 18:13:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51693)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1fPxid-0003nD-5h
	for qemu-arm@nongnu.org; Mon, 04 Jun 2018 18:12:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1fPxia-0003SO-0f
	for qemu-arm@nongnu.org; Mon, 04 Jun 2018 18:12:51 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2395 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <gengdongjiu@huawei.com>)
	id 1fPxiZ-0003RL-IY; Mon, 04 Jun 2018 18:12:47 -0400
Received: from DGGEMA405-HUB.china.huawei.com (unknown [172.30.72.54])
	by Forcepoint Email with ESMTP id CA40F73F1F30D;
	Tue,  5 Jun 2018 06:12:36 +0800 (CST)
Received: from DGGEMA503-MBX.china.huawei.com ([169.254.1.111]) by
	DGGEMA405-HUB.china.huawei.com ([10.3.20.46]) with mapi id
	14.03.0382.000; Tue, 5 Jun 2018 06:12:33 +0800
From: gengdongjiu <gengdongjiu@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>
Thread-Topic: [Qemu-devel] [PATCH RESEND v1 0/3] add support for VCPU event
	states
Thread-Index: AdP8UOZuihOiVi52RqekGA3J+liJJA==
Date: Mon, 4 Jun 2018 22:12:33 +0000
Message-ID: <0184EA26B2509940AA629AE1405DD7F201CB5BA1@DGGEMA503-MBX.china.huawei.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.45.56.248]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 45.249.212.187
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
Cc: "james.morse@arm.com" <james.morse@arm.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"famz@redhat.com" <famz@redhat.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ObswUFQqWZE8

PiBPbiAxIEp1bmUgMjAxOCBhdCAxNToxNiwgZ2VuZ2RvbmdqaXUgPGdlbmdkb25naml1QGh1YXdl
aS5jb20+IHdyb3RlOg0KPiA+IEhpIFBldGVyLA0KPiANCj4gPj4gWW91IHNob3VsZCB3YWl0IGZv
ciB0aGF0IHRvIGdldCBpbnRvIG1hc3RlciAoaXQgaXMgaW4gUGFvbG8ncyBtb3N0DQo+ID4+IHJl
Y2VudCBwYXRjaHNldCBidXQgdGhhdCBoYXMgYW4gaXNzdWUgd2l0aCBhIGRpZmZlcmVudCBwYXRj
aCwgc28gaXMNCj4gPj4gd2FpdGluZyBvbiBQYW9sbyB0byBkbyBhIHJlc3BpbikuIFRoZW4geW91
IGNhbiBiYXNlIG9uIHRoYXQuIEF0IHRoYXQNCj4gPj4gcG9pbnQgYSBzaW1wbGUgc2NyaXB0IHVw
ZGF0ZSBzaG91bGQgd29yayBmaW5lIChpZiB5b3UgbmVlZCBhbnl0aGluZw0KPiA+PiBpbiByYzcg
dGhhdCB3YXNuJ3QgaW4gcmM2KS4NCj4gPg0KPiA+IE9rLCBnb3QgaXQuIFRoYW5rcyBhIGxvdCBm
b3IgdGhlIGV4cGxhbmF0aW9uLCBJIHdpbGwgd2FpdCBmb3IgeW91cg0KPiA+IHBhdGNoWzFdIG1l
cmdlIGludG8gbWFzdGVyIGFuZCBiYXNlZCBvbiBpdC4NCj4gDQo+IFRoZSByYzYgaGVhZGVyIHVw
ZGF0ZSBpcyBub3cgaW4gUUVNVSBnaXQgbWFzdGVyLg0KDQpPaywgdGhhbmtzIGZvciB0aGUgcmVt
aW5kZXIuIEkgd2lsbCByZWJhc2VkIGl0Lg0KDQo+IA0KPiB0aGFua3MNCj4gLS0gUE1NDQo=
