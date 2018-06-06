Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp822131wrq;
        Wed, 6 Jun 2018 06:28:04 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKCj600Iz0/4XSwlYMhgZRjry2o9qZ64pYs7CLIy+kixqjOWbo7o/KMSVRziH1KdSjq5rSw
X-Received: by 2002:a37:1399:: with SMTP id 25-v6mr2300435qkt.83.1528291684744;
        Wed, 06 Jun 2018 06:28:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528291684; cv=none;
        d=google.com; s=arc-20160816;
        b=tETcdykk3P55kTqsL5JnQ4nXHHnbsDzZtzuR6JLljCQQG67OfZcy0NS64+i3RxXW0M
         l7TFrRK76ev2Baf/6O39Z9Z6pTtktBbFHNKOP/xl6KvpDDMthbH+NA7Ee8VcgBgIw5Jg
         29AZ+I3NI3/xz6wO5tw0Tk47XXxWKu3VhoYrGDXaxr2cPATGxGHCeUnJvu/aElJE3ZZq
         yq3FjYkETUccJ177TpQ/nng1EKVtR53s4DZfDbJDxCOCupi0mUk+Jho00hQreg9/X5lx
         JTUR79I7FL1B1IOAl9eVKZPJe3gv7AcO9CXL0TuEc/y7oTsoo2IsuupyIJYj5Wa9GkJs
         x2vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-language:accept-language
         :message-id:date:thread-index:thread-topic:to:from
         :arc-authentication-results;
        bh=/JOUo7cL1nGj/K8VYqSibcw+326qmXQqfaBP+ijdiCA=;
        b=RcGPPAw80twvkLQiiKbPoCfGzcZPBxToIF21lDFS6jmFdoDmzGaWBeHUHQVciUVH+z
         dellAiPNy7OMfxazGycjPQAY82rQez9zahQ55WdC6xC/VZrlvD+eOnfdTBUKHjZv9qyF
         D5BCYxT14hf5wZGL/7SR/OPtZPX1nRtcG2lHcHM1HAgruifto46uk/hnx3bKVOd1z6zC
         CreTN4qOAa4XKrNCZ4i2YETiXgcTStetoAVTQU7nxG17QybgP7fgh/Cd7hC7hxwA47rw
         UNwfUnn+lS5N998BijZ6luuLxtOCsMVRpMDuwG3pg8XqmJQQWWy5ppndgT1RRa4o/yy4
         lt1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o62-v6si11970208qkd.346.2018.06.06.06.28.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 06 Jun 2018 06:28:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52441 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fQYTs-00073C-7D
	for alex.bennee@linaro.org; Wed, 06 Jun 2018 09:28:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60452)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1fQYSZ-0006Lg-IL
	for qemu-devel@nongnu.org; Wed, 06 Jun 2018 09:26:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1fQYSY-0006fK-DU
	for qemu-devel@nongnu.org; Wed, 06 Jun 2018 09:26:43 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:2272 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <gengdongjiu@huawei.com>)
	id 1fQYSS-0006It-MR; Wed, 06 Jun 2018 09:26:37 -0400
Received: from DGGEMA405-HUB.china.huawei.com (unknown [172.30.72.55])
	by Forcepoint Email with ESMTP id BDEE5501B5E86;
	Wed,  6 Jun 2018 21:26:28 +0800 (CST)
Received: from DGGEMA424-HUB.china.huawei.com (10.1.198.157) by
	DGGEMA405-HUB.china.huawei.com (10.3.20.46) with Microsoft SMTP Server
	(TLS) id 14.3.382.0; Wed, 6 Jun 2018 21:26:30 +0800
Received: from DGGEMA503-MBX.china.huawei.com ([169.254.1.111]) by
	dggema424-hub.china.huawei.com ([10.1.198.157]) with mapi id
	14.03.0382.000; Wed, 6 Jun 2018 21:26:22 +0800
From: gengdongjiu <gengdongjiu@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>
Thread-Topic: [PATCH v2 1/2] kvm: sync linux headers
Thread-Index: AdP9l34wjRTJc916RDWU1ojuHFcaIw==
Date: Wed, 6 Jun 2018 13:26:22 +0000
Message-ID: <0184EA26B2509940AA629AE1405DD7F201CBFAF3@DGGEMA503-MBX.china.huawei.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.45.56.176]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 45.249.212.189
Subject: Re: [Qemu-devel] [PATCH v2 1/2] kvm: sync linux headers
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
Cc: qemu-arm <qemu-arm@nongnu.org>, James Morse <james.morse@arm.com>, QEMU
	Developers <qemu-devel@nongnu.org>, Linuxarm <linuxarm@huawei.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qlSatPGsmYLU

PiBPbiA1IEp1bmUgMjAxOCBhdCAyMTo1MiwgRG9uZ2ppdSBHZW5nIDxnZW5nZG9uZ2ppdUBodWF3
ZWkuY29tPiB3cm90ZToNCj4gPiBJbXBvcnQgS1ZNX0NBUF9BUk1fSU5KRUNUX1NFUlJPUl9FU1Ig
YW5kIHN0cnVjdCBrdm1fdmNwdV9ldmVudHMgZm9yDQo+ID4gYXJtNjQNCj4gPg0KPiA+IFNpZ25l
ZC1vZmYtYnk6IERvbmdqaXUgR2VuZyA8Z2VuZ2RvbmdqaXVAaHVhd2VpLmNvbT4NCj4gDQo+IFdh
cyB0aGlzIHByb2R1Y2VkIHdpdGggdGhlIHVwZGF0ZS1oZWFkZXJzIHNjcmlwdD8gSWYgc28sIHRo
ZSBjb21taXQgbWVzc2FnZSBzaG91bGQgc2F5IHNvIGFuZCBhbHNvIHdoaWNoIHVwc3RyZWFtIGtl
cm5lbCBjb21taXQvdGFnDQo+IHRoZSBzeW5jIGlzIGFnYWluc3QuIChTZWUgUUVNVSBjb21taXQN
Cj4gNjVhNmQ4ZGQzZjMyIGZvciBhbiBleGFtcGxlLikgSWYgbm90IHRoZW4gdGhpcyBzZXJpZXMg
c2hvdWxkIGJlIHRhZ2dlZCBhcyBhbiBSRkMsIHNpbmNlIGl0IHNob3VsZG4ndCBiZSBhcHBsaWVk
IHVudGlsIHRoZSBrZXJuZWwgQVBJIGNoYW5nZXMNCj4gaGF2ZSBnb25lIGludG8gdGhlIGtlcm5l
bCB1cHN0cmVhbS4NCg0KVGhhbmtzIGFnYWluIGZvciB0aGUgcmVtaW5kZXIuDQpZZXMsIGl0IHNo
b3VsZCBiZSB0YWdnZWQgYXMgYW4gUkZDLCB0aGUga2VybmVsIEFQSSBjaGFuZ2VzIGlzIHN0aWxs
IHVuZGVyIHJldmlldy4NCmh0dHBzOi8vd3d3LnNwaW5pY3MubmV0L2xpc3RzL2t2bS9tc2cxNjk4
MTMuaHRtbA0KDQpJIHVzZWQgYmVsb3cgc2NyaXB0IGFuZCBjb21tYW5kIHRvIHN5bmMgdGhlIGtl
cm5lbCBjaGFuZ2VkIGhlYWRlci4NCi4vc2NyaXB0cy91cGRhdGUtbGludXgtaGVhZGVycy5zaCB4
eHh4DQoNCj4gDQo+IHRoYW5rcw0KPiAtLSBQTU0NCg==
