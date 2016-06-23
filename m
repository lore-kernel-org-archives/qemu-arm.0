Received: by 10.25.21.96 with SMTP id l93csp546415lfi;
        Thu, 23 Jun 2016 07:14:08 -0700 (PDT)
X-Received: by 10.200.42.200 with SMTP id c8mr28379251qta.8.1466691248058;
        Thu, 23 Jun 2016 07:14:08 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 128si256871qkg.246.2016.06.23.07.14.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Jun 2016 07:14:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@yandex.ru;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=yandex.ru
Received: from localhost ([::1]:36917 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bG5OR-0005RI-Ho
	for alex.bennee@linaro.org; Thu, 23 Jun 2016 10:14:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53961)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>) id 1bG5OM-0005R1-MS
	for qemu-arm@nongnu.org; Thu, 23 Jun 2016 10:14:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>) id 1bG5OG-0003sK-KE
	for qemu-arm@nongnu.org; Thu, 23 Jun 2016 10:14:01 -0400
Received: from forward2m.cmail.yandex.net ([5.255.216.20]:55005)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>)
	id 1bG5OF-0003lg-6q; Thu, 23 Jun 2016 10:13:56 -0400
Received: from mxback1m.mail.yandex.net (mxback1m.mail.yandex.net
	[37.140.138.61])
	by forward2m.cmail.yandex.net (Yandex) with ESMTP id 0BA03210FB;
	Thu, 23 Jun 2016 17:13:41 +0300 (MSK)
Received: from web14m.yandex.ru (web14m.yandex.ru [37.140.138.105])
	by mxback1m.mail.yandex.net (nwsmtp/Yandex) with ESMTP id
	GYke5ieSpm-DfjCHfAk; Thu, 23 Jun 2016 17:13:41 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1466691221; bh=ODsn+AJPoPZ9jPFyaJsJnZ1oxjm5jyO/aXP04cLJClE=;
	h=From:To:Cc:In-Reply-To:References:Subject:MIME-Version:Message-Id:
	X-Mailer:Date:Content-Transfer-Encoding:Content-Type;
	b=ghzvWZKEnZ0ak00cTP7VNb1GNFpN3dKCmB+iFn8e6sIw9loUCXGMaFcY7+VRUpwGg
	ZeQ0K+V5I22GcRFLgak8+rIgFD7An+0FaFK6jcSjP70w1NZJNELZ+5jy6guLmIzYCN
	hWFphqhC1589cBJiP8+MmauceHj7nUvRTrB5QKXY=
Authentication-Results: mxback1m.mail.yandex.net; dkim=pass header.i=@yandex.ru
Received: by web14m.yandex.ru with HTTP;
	Thu, 23 Jun 2016 17:13:41 +0300
From: Sergey Sorokin <afarallax@yandex.ru>
To: Richard Henderson <rth@twiddle.net>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
In-Reply-To: <458f40bb-cb58-4e10-2237-a08cb35155bd@twiddle.net>
References: <1466599029-3388432-1-git-send-email-afarallax@yandex.ru>
	<5d86b8ba-16e8-e94d-ba7f-e865cbcc938e@twiddle.net>
	<1793281466613020@web5h.yandex.ru>
	<6c24c820-4a26-848c-e62d-88ebce59125d@twiddle.net>
	<201241466676212@web21j.yandex.ru>
	<458f40bb-cb58-4e10-2237-a08cb35155bd@twiddle.net>
MIME-Version: 1.0
Message-Id: <200981466691221@web14m.yandex.ru>
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Thu, 23 Jun 2016 17:13:41 +0300
Content-Transfer-Encoding: base64
Content-Type: text/html; charset=utf-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 5.255.216.20
Subject: Re: [Qemu-arm] [PATCH v2] Improve the alignment check infrastructure
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
Cc: Claudio Fontana <claudio.fontana@huawei.com>,
	Alexander Graf <agraf@suse.de>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Vassili Karpov <av1474@comtv.ru>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ecxBe8Gxu5D3

PGRpdj7CoDwvZGl2PjxkaXY+wqA8L2Rpdj48ZGl2PjIzLjA2LjIwMTYsIDE3OjA1LCAiUmljaGFy
ZCBIZW5kZXJzb24iICZsdDtydGhAdHdpZGRsZS5uZXQmZ3Q7OjwvZGl2PjxibG9ja3F1b3RlIHR5
cGU9ImNpdGUiPjxwPk9uIDA2LzIzLzIwMTYgMDM6MDMgQU0sIFNlcmdleSBTb3Jva2luIHdyb3Rl
OjwvcD48YmxvY2txdW90ZT7CoFNvIHdoYXQncyB3cm9uZyBpbiB0aGlzIHBhcnQgb2YgdGhlIHBh
dGNoPzwvYmxvY2txdW90ZT48cD48YnIgLz5JIHRoaW5rIEkganVzdCBtaXNyZWFkIGl0LjwvcD48
L2Jsb2NrcXVvdGU+PGRpdj7CoDwvZGl2PjxkaXY+SXQgaGFwcGVucyA6KTwvZGl2PjxkaXY+wqA8
L2Rpdj48ZGl2PjxkaXY+wqA8L2Rpdj48ZGl2PjIyLjA2LjIwMTYsIDE4OjUwLCAiUmljaGFyZCBI
ZW5kZXJzb24iICZsdDtydGhAdHdpZGRsZS5uZXQmZ3Q7OjwvZGl2PjxibG9ja3F1b3RlIHR5cGU9
ImNpdGUiPjxwPk9uIDA2LzIyLzIwMTYgMDU6MzcgQU0sIFNlcmdleSBTb3Jva2luIHdyb3RlOjwv
cD48YmxvY2txdW90ZT7CoCsvKiBVc2UgdGhpcyBtYXNrIHRvIGNoZWNrIGludGVyY2VwdGlvbiB3
aXRoIGFuIGFsaWdubWVudCBtYXNrPGJyIC8+wqArICogaW4gYSBUQ0cgYmFja2VuZC48YnIgLz7C
oCsgKi88YnIgLz7CoCsjZGVmaW5lIFRMQl9GTEFHU19NQVNLIChUTEJfSU5WQUxJRF9NQVNLIHwg
VExCX05PVERJUlRZIHwgVExCX01NSU8pPC9ibG9ja3F1b3RlPjxwPjxiciAvPkkgdGhpbmsgd2Ug
b3VnaHQgdG8gY2hlY2sgdGhpcyBpbiB0Y2ctb3AuYywgcmF0aGVyIHRoYW4gd2FpdCB1bnRpbCBn
ZW5lcmF0aW5nPGJyIC8+Y29kZSBpbiB0aGUgYmFja2VuZC48L3A+PC9ibG9ja3F1b3RlPjxwPkkg
dGhpbmsgaXQncyBiZXR0ZXIgdG8gY2hlY2sgdGhpcyBpbiBvbmUgcGxhY2UgaW4gZ2V0X2FsaWdu
bWVudF9iaXRzKCkgZnVuY3Rpb248YnIgLz5iZWNhdXNlIHRoZXJlIGNhbiBiZSBhIGRpcmVjdCBj
YWxsIG9mIGhlbHBlcnMgZnJvbSBzb2Z0bW11X3RlbXBsYXRlLmguPC9wPjxwPjwvcD48L2Rpdj4=
