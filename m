Received: by 10.182.158.201 with SMTP id ww9csp1012699obb;
        Sun, 29 Nov 2015 06:41:32 -0800 (PST)
X-Received: by 10.55.203.151 with SMTP id u23mr64858771qkl.84.1448808092797;
        Sun, 29 Nov 2015 06:41:32 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g131si40878799qkb.102.2015.11.29.06.41.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 29 Nov 2015 06:41:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36494 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a33AS-0000gU-3w
	for alex.bennee@linaro.org; Sun, 29 Nov 2015 09:41:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57776)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <web@jimmystone.cn>) id 1a2xNK-0003gr-QR
	for qemu-arm@nongnu.org; Sun, 29 Nov 2015 03:30:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <web@jimmystone.cn>) id 1a2xNH-0005N6-JG
	for qemu-arm@nongnu.org; Sun, 29 Nov 2015 03:30:26 -0500
Received: from smtpbg202.qq.com ([184.105.206.29]:37973)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <web@jimmystone.cn>) id 1a2xNH-0005Mp-Bm
	for qemu-arm@nongnu.org; Sun, 29 Nov 2015 03:30:23 -0500
X-QQ-GoodBg: 0
X-QQ-SSF: 00100000000000F0
X-QQ-FEAT: cjCJQiWPIAsQUCrmZZ2vasW9oNF70DAkOhs9tkX0MgUjr/LJwbnay/AaNo2om
	mD2krgqzE2RplAliQuv2bY6YHm7Lz6Fm6RCE2BLb2IfRKdZCJCzh01QnoHpjKEzkWQPIzWR
	T/R+SVrHQFi3J5nmyXo1R+4ic+qc0sTHizlPP8wylHBP3Ld6vNwqpJ3t/i6Hs9Fe76svi2S
	qytz0NRnqSykkFqcjpyEK1MyChl0yvl259Ps0UGo4+g==
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 192.227.97.24
X-QQ-STYLE: 
X-QQ-mid: bizmailfree37t1448785814t6497
From: "=?ISO-8859-1?B?SmltbXkgU2l0dQ==?=" <web@jimmystone.cn>
To: "=?ISO-8859-1?B?cWVtdS1hcm0=?=" <qemu-arm@nongnu.org>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_565AB796_0AA5FC88_3E7E4CFD"
Content-Transfer-Encoding: 8Bit
Date: Sun, 29 Nov 2015 16:30:14 +0800
X-Priority: 3
Message-ID: <tencent_36F2633E3F3DBE7C54299DA6@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-QQ-SENDSIZE: 520
X-QQ-Bgrelay: 1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 184.105.206.29
X-Mailman-Approved-At: Sun, 29 Nov 2015 09:41:31 -0500
Subject: [Qemu-arm] How to get memroy trace in qemu-system-arm or qemu-arm
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Pe/Q7RK9JAXB

This is a multi-part message in MIME format.

------=_NextPart_565AB796_0AA5FC88_3E7E4CFD
Content-Type: text/plain;
	charset="ISO-8859-1"
Content-Transfer-Encoding: base64

RGVhciBhbGwsDQoNCkkgYW0gdHJ5aW5nIHRvIGNhcHR1cmUgbWVtb3J5IGFjY2VzcyB3aXRo
IHFlbXUtc3lzdGVtLWFybSwgYW5kIEkgZmluZCB0aGVyZSBpcyBnZXRfcGh5c19hZGRyIGlu
IHRhcmdldC1hcm0vaGVscGVyLmMNClNvICBJIGFkZCBhIHFlbXUgdHJhY2UgZXZlbnQgaW4g
aXQuIEl0IHNlZW1zIHRoaXMgdHJhY2UgY2FuIGNhcHR1cmUgc29tZSAgbWVtcm95IGFjY2Vz
cy4gSG93ZXZlciwgdGhlIHRyYWNlIGFkZHJlc3MgdHJhY2UgZG9zZXMgbm90IG1ha2UgYW55
ICBzZW5jZS4NCg0KRG8gYW55b25lIGtub3cgYWJvdXQgdGhpcyBnZXRfcGh5c19hZGRyKCkg
ZnVuY3Rpb24uIERvZXMgaXQgY2FsbCBieSBldmVyeSBtZW1vcnkgYWNjZXNzPw0KSWYgbm90
LCBob3cgY291bGQgSSBjYXB0dXJlIHRoZSBtZW1vcnkgdHJhY2UgY29ycmVjdGx5Pw0KDQpU
aGFua3Mu

------=_NextPart_565AB796_0AA5FC88_3E7E4CFD
Content-Type: text/html;
	charset="ISO-8859-1"
Content-Transfer-Encoding: base64

RGVhciBhbGwsPGJyPjxicj5JIGFtIHRyeWluZyB0byBjYXB0dXJlIG1lbW9yeSBhY2Nlc3Mg
d2l0aCBxZW11LXN5c3RlbS1hcm0sIGFuZCBJIGZpbmQgdGhlcmUgaXMgZ2V0X3BoeXNfYWRk
ciBpbiB0YXJnZXQtYXJtL2hlbHBlci5jPGJyPlNvDQogSSBhZGQgYSBxZW11IHRyYWNlIGV2
ZW50IGluIGl0LiBJdCBzZWVtcyB0aGlzIHRyYWNlIGNhbiBjYXB0dXJlIHNvbWUgDQptZW1y
b3kgYWNjZXNzLiBIb3dldmVyLCB0aGUgdHJhY2UgYWRkcmVzcyB0cmFjZSBkb3NlcyBub3Qg
bWFrZSBhbnkgDQpzZW5jZS48YnI+PGJyPkRvIGFueW9uZSBrbm93IGFib3V0IHRoaXMgZ2V0
X3BoeXNfYWRkcigpIGZ1bmN0aW9uLiBEb2VzIGl0IGNhbGwgYnkgZXZlcnkgbWVtb3J5IGFj
Y2Vzcz88YnI+SWYgbm90LCBob3cgY291bGQgSSBjYXB0dXJlIHRoZSBtZW1vcnkgdHJhY2Ug
Y29ycmVjdGx5Pzxicj48YnI+VGhhbmtzLjxkaXY+PGluY2x1ZGV0YWlsPjwhLS08IVtlbmRp
Zl0tLT48L2luY2x1ZGV0YWlsPjwvZGl2Pg==

------=_NextPart_565AB796_0AA5FC88_3E7E4CFD--



