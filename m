Received: by 10.25.15.230 with SMTP id 99csp1312888lfp;
        Mon, 20 Mar 2017 07:16:29 -0700 (PDT)
X-Received: by 10.55.209.207 with SMTP id o76mr25088138qkl.258.1490019389222;
        Mon, 20 Mar 2017 07:16:29 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r81si12982545qkr.215.2017.03.20.07.16.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 Mar 2017 07:16:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33259 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cpy6m-0006RG-Ig
	for alex.bennee@linaro.org; Mon, 20 Mar 2017 10:16:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44046)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wangjintang@huawei.com>) id 1cprFt-00084i-Rp
	for qemu-arm@nongnu.org; Mon, 20 Mar 2017 02:57:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wangjintang@huawei.com>) id 1cprFq-0007uD-0f
	for qemu-arm@nongnu.org; Mon, 20 Mar 2017 02:57:25 -0400
Received: from [45.249.212.187] (port=3005 helo=dggrg01-dlp.huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_ARCFOUR_SHA1:16) (Exim 4.71)
	(envelope-from <wangjintang@huawei.com>) id 1cprFp-0007pW-Jl
	for qemu-arm@nongnu.org; Mon, 20 Mar 2017 02:57:21 -0400
Received: from 172.30.72.53 (EHLO DGGEMA402-HUB.china.huawei.com)
	([172.30.72.53])
	by dggrg01-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
	with ESMTP id ALB03269; Mon, 20 Mar 2017 14:35:30 +0800 (CST)
Received: from DGGEMA504-MBX.china.huawei.com ([169.254.4.180]) by
	DGGEMA402-HUB.china.huawei.com ([10.3.20.43]) with mapi id
	14.03.0301.000; Mon, 20 Mar 2017 14:35:19 +0800
From: Wangjintang <wangjintang@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>
Thread-Topic: [Qemu-arm] about armv8's prefetch decode
Thread-Index: AQHRj1R6bYMlriGS4E2IOsFES6FMxKGfZpSA
Date: Mon, 20 Mar 2017 06:35:18 +0000
Message-ID: <C94A741879221447B4FC9B607EB4FFCD79EA34F4@DGGEMA504-MBX.china.huawei.com>
References: <1459777195-7907-1-git-send-email-vijayak@caviumnetworks.com>
	<1459777195-7907-3-git-send-email-vijayak@caviumnetworks.com>
	<CAFEAcA_755uEOZoGj0SCtmT-5PyLMntkK3wZeuHvZ_kPG9A1aQ@mail.gmail.com>
	<5703D7EE.2000005@redhat.com>
	<CAFEAcA8G_-jQOtnVag2Ef++RbfbEJ-XzNnyYM=o9Sh8c6ohecA@mail.gmail.com>
In-Reply-To: <CAFEAcA8G_-jQOtnVag2Ef++RbfbEJ-XzNnyYM=o9Sh8c6ohecA@mail.gmail.com>
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
	refid=str=0001.0A020203.58CF7833.0304, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=169.254.4.180,
	so=2014-11-16 11:51:01, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: e67b0f55157597c1914afe2f58b97f51
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
	[fuzzy]
X-Received-From: 45.249.212.187
X-Mailman-Approved-At: Mon, 20 Mar 2017 10:16:10 -0400
Subject: [Qemu-arm]  about armv8's prefetch decode
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
	qemu-arm <qemu-arm@nongnu.org>, "Ori Chalak \(A\)" <Ori.Chalak@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XV5U4imk5mwB

SGksDQoJDQoJV2Ugc2VlIHRoYXQgYXJtdjgncyBwcmVmZXRjaCBpbnN0cnVjdGlvbiBkZWNvZGUg
aGF2ZSBiZWVuIHNraXBwZWQgaW4gcWVtdS4gRm9yIHNvbWUgdXNlciwgdGhleSBuZWVkIHByZWZl
dGNoIGluc3RydWN0aW9uLCBmb3IgZXhhbXBsZSwgdGhleSB1c2UgcWVtdSB0byBnZW5lcmF0ZSB0
aGUgaW5zdHJ1Y3Rpb24gdHJhY2UuIFdlIHdhbnQgdG8gbWVyZ2UgdGhpcyBwYXRjaCB0byBjb21t
dW5pdHksIGl0J3Mgb2sgb3Igbm90PyAgVGhhbmtzLg0KDQoNCkJlc3QgUmVnYXJkcywNCueOi+mH
keWggiAvIEplZA0KDQoNCg0KSHVhd2VpIFRlY2hub2xvZ2llcyBDby4sIEx0ZC4gDQpFbWFpbDog
d2FuZ2ppbnRhbmdAaHVhd2VpLmNvbQ0KaHR0cDovL3d3dy5odWF3ZWkuY29tIA0K
