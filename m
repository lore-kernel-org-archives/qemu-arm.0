Received: by 10.25.208.137 with SMTP id h131csp61655lfg;
        Tue, 26 Apr 2016 14:46:08 -0700 (PDT)
X-Received: by 10.55.77.216 with SMTP id a207mr5064840qkb.80.1461707168226;
        Tue, 26 Apr 2016 14:46:08 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 12si489359qgx.113.2016.04.26.14.46.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Apr 2016 14:46:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@yandex.ru;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE dis=NONE) header.from=yandex.ru
Received: from localhost ([::1]:39865 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1avAo3-0000bD-Pm
	for alex.bennee@linaro.org; Tue, 26 Apr 2016 17:46:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42096)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>) id 1avAht-0004qq-QT
	for qemu-arm@nongnu.org; Tue, 26 Apr 2016 17:39:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>) id 1avAhq-0005kY-JH
	for qemu-arm@nongnu.org; Tue, 26 Apr 2016 17:39:45 -0400
Received: from forward11j.cmail.yandex.net ([5.255.227.175]:55755)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>)
	id 1avAhp-0005kM-V1; Tue, 26 Apr 2016 17:39:42 -0400
Received: from web27j.yandex.ru (web27j.yandex.ru [5.45.198.68])
	by forward11j.cmail.yandex.net (Yandex) with ESMTP id 01EF72149C;
	Wed, 27 Apr 2016 00:39:37 +0300 (MSK)
Received: from web27j.yandex.ru (localhost [127.0.0.1])
	by web27j.yandex.ru (Yandex) with ESMTP id DCD54DC231A;
	Wed, 27 Apr 2016 00:39:36 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1461706777; bh=xv7Rkunosi6SI3CEzcIND777O1cAyvH/LY3fgVIneWg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=kW8VTwuExY5YMPZuuC7mIzW+fkJPEYhMbPfOg8CBuLJi7198fp8fJwtZQ5HSAkIOT
	wEnFoUPpPy6X9UGiBuIyA2wO6HOuuK4L4/pd8F8Erzpi1sNnW5mE3IRlRkH5z62KiU
	9BHUdrN5IaSGSfat5K5cz2soSP3GNFsoO1yUt7Ok=
Received: by web27j.yandex.ru with HTTP;
	Wed, 27 Apr 2016 00:39:36 +0300
From: Sergey Sorokin <afarallax@yandex.ru>
To: Tom Hanson <thomas.hanson@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
In-Reply-To: <571F98E6.1010109@linaro.org>
References: <1457107473-26292-1-git-send-email-afarallax@yandex.ru>
	<CAFEAcA8F9AdePC4h8ZqPftbBatnhbge=1jpoe1gdrYstpdiwzA@mail.gmail.com>
	<1022901457739899@web28h.yandex.ru>
	<CAFEAcA_+MD=Cf26wZ_C9AH_NbRm_Lim492ugWUx3WqEzNrN8eQ@mail.gmail.com>
	<4542001457893724@web22h.yandex.ru>
	<CAFEAcA_s+YmPJSwmWYc4coMXzdRHhB3bsHew_AfRunD1pWhB_Q@mail.gmail.com>
	<628941458228094@web26j.yandex.ru>
	<CAFEAcA_+znhWyJFWC3eMi8JiZw-nb2MyK_+uD6Fww76reinoeQ@mail.gmail.com>
	<1362381458575779@web6j.yandex.ru> <571F98E6.1010109@linaro.org>
MIME-Version: 1.0
Message-Id: <1793781461706776@web27j.yandex.ru>
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Wed, 27 Apr 2016 00:39:36 +0300
Content-Transfer-Encoding: base64
Content-Type: text/html; charset=koi8-r
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 5.255.227.175
Subject: Re: [Qemu-arm] [PATCH] target-arm: Fix descriptor address masking
 in ARM address translation
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sPzplmEAYWGq

PGRpdj4yNi4wNC4yMDE2LCAxOTozNSwgIlRvbSBIYW5zb24iICZsdDt0aG9tYXMuaGFuc29uQGxp
bmFyby5vcmcmZ3Q7OjwvZGl2PjxibG9ja3F1b3RlIHR5cGU9ImNpdGUiPjxwPk9uIDAzLzIxLzIw
MTYgMDk6NTYgQU0sIFNlcmdleSBTb3Jva2luIHdyb3RlOjwvcD48YmxvY2txdW90ZT6aMTcuMDMu
MjAxNiwgMTg6MjQsICJQZXRlciBNYXlkZWxsIiAmbHQ7PGEgaHJlZj0ibWFpbHRvOnBldGVyLm1h
eWRlbGxAbGluYXJvLm9yZyI+cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnPC9hPiZndDs6PGJyIC8+
PGJsb2NrcXVvdGU+mpqaT24gMTcgTWFyY2ggMjAxNiBhdCAxNToyMSwgU2VyZ2V5IFNvcm9raW4g
Jmx0OzxhIGhyZWY9Im1haWx0bzphZmFyYWxsYXhAeWFuZGV4LnJ1Ij5hZmFyYWxsYXhAeWFuZGV4
LnJ1PC9hPiZndDsgd3JvdGU6PGJyIC8+PGJsb2NrcXVvdGU+mpqamjE3LjAzLjIwMTYsIDE0OjQw
LCAiUGV0ZXIgTWF5ZGVsbCIgJmx0OzxhIGhyZWY9Im1haWx0bzpwZXRlci5tYXlkZWxsQGxpbmFy
by5vcmciPnBldGVyLm1heWRlbGxAbGluYXJvLm9yZzwvYT4mZ3Q7OjxiciAvPjxibG9ja3F1b3Rl
PpqamppPbiAxMyBNYXJjaCAyMDE2IGF0IDE4OjI4LCBTZXJnZXkgU29yb2tpbiAmbHQ7PGEgaHJl
Zj0ibWFpbHRvOmFmYXJhbGxheEB5YW5kZXgucnUiPmFmYXJhbGxheEB5YW5kZXgucnU8L2E+Jmd0
OyB3cm90ZTo8YnIgLz48YmxvY2txdW90ZT48YmxvY2txdW90ZT6ampqaSWYgeW91IHdhbnQgdG8g
aW1wbGVtZW50IHRoZSBBZGRyZXNzU2l6ZSBjaGVja3MgdGhhdCdzIGZpbmUsPGJyIC8+mpqammJ1
dCBvdGhlcndpc2UgcGxlYXNlIGxlYXZlIHRoaXMgYml0IG9mIHRoZSBjb2RlIGFsb25lLjwvYmxv
Y2txdW90ZT48YnIgLz6ampqamllvdSBzYWlkIG1lIHRoYXQgbXkgY29kZSBpcyBub3QgY29ycmVj
dCwgSSBoYXZlIHByb3ZlZCB0aGF0IGl0IGNvbmZvcm1zPGJyIC8+mpqampp0byB0aGUgZG9jdW1l
bnRhdGlvbi48YnIgLz6ampqamkl0J3MgYSBiaXQgb2JmdXNjYXRpbmcgd2hlbiB0aGUgZG9jIGV4
cGxpY2l0bHkgc2F5cyB0byB0YWtlIGJpdHMgdXAgdG8gMzk8YnIgLz6ampqammZyb20gdGhlIGRl
c2NyaXB0b3IsIGJ1dCBpbiBRRU1VIHdlIHRha2UgYml0cyB1cCB0byA0NyByZWx5aW5nIG9uIHRo
ZSBjaGVjayBpbjxiciAvPpqampqaYW5vdGhlciBwYXJ0IG9mIHRoZSBjb2RlLCBldmVuIGlmIGJv
dGggd2F5cyBhcmUgY29ycmVjdC48L2Jsb2NrcXVvdGU+PGJyIC8+mpqamlRoZSB3YXkgdGhlIGNv
ZGUgaW4gUUVNVSBpcyBzdHJ1Y3R1cmVkIGlzIHRoYXQgd2UgZXh0cmFjdCB0aGU8YnIgLz6ampqa
ZGVzY3JpcHRvciBmaWVsZCBpbiBvbmUgZ28gYW5kIHRoZW4gd2lsbCBvcGVyYXRlIG9uIGl0PGJy
IC8+mpqamihjaGVja2luZyBmb3IgbmVlZCB0byBBZGRyZXNzU2l6ZSBmYXVsdCwgZXRjKSBhcyBh
IHNlY29uZDxiciAvPpqampphY3Rpb24uIFRoZSBmaWVsZCBkZXNjcmlwdG9ycyB0aGVtc2VsdmVz
IGFyZSB0aGUgc2l6ZXMgSSBzYWlkLjwvYmxvY2txdW90ZT48YnIgLz6ampqaV2VsbCwgbWF5IGJl
IGl0J3MgZW5vdWdoIGp1c3QgdG8gY2hhbmdlIHRoaXMgY29tbWVudCBhcyB5b3UgaW50ZW5kOjxi
ciAvPjxiciAvPjxibG9ja3F1b3RlPjxibG9ja3F1b3RlPpqampotIC8qIFRoZSBhZGRyZXNzIGZp
ZWxkIGluIHRoZSBkZXNjcmlwdG9yIGdvZXMgdXAgdG8gYml0IDM5IGZvciBBUk12NzxiciAvPpqa
mpotICogYnV0IHVwIHRvIGJpdCA0NyBmb3IgQVJNdjguPGJyIC8+mpqamisgLyogVGhlIGFkZHJl
c3MgZmllbGQgaW4gdGhlIGRlc2NyaXB0b3IgZ29lcyB1cCB0byBiaXQgMzkgZm9yIEFBcmNoMzI8
YnIgLz6ampqaKyAqIGJ1dCB1cCB0byBiaXQgNDcgZm9yIEFBcmNoNjQuPGJyIC8+mpqampqampqa
miovPC9ibG9ja3F1b3RlPjwvYmxvY2txdW90ZT48L2Jsb2NrcXVvdGU+PGJyIC8+mpqaVGhlIGNv
bW1lbnQgaXMgY29ycmVjdCBhcyBpdCBzdGFuZHMuPGJyIC8+PGJyIC8+mpqadGhhbmtzPGJyIC8+
mpqaLS0gUE1NPC9ibG9ja3F1b3RlPjxiciAvPppJIG1lYW4gaW4gdGhlIHBhdGNoLjxiciAvPppX
ZSBuZWVkIHRvIGZpeCBsb3dlciBiaXRzIGluIGRlc2NhZGRybWFzayBhbnl3YXkuPGJyIC8+mlNv
OjxiciAvPjxiciAvPppJIGNvdWxkIGRlc2NyaWJlIGluIHRoZSBjb21tZW50LCB0aGF0IHRoZSBk
ZXNjcmlwdG9yIGZpZWxkIGlzIHVwIHRvIGJpdCA0NyBmb3IgQVJNdjggKGFzIGxvbmcgYXMgeW91
IHdhbnQgaXQpLDxiciAvPppidXQgd2UgdXNlIHRoZSBkZXNjYWRkcm1hc2sgdXAgdG8gYml0IDM5
IGZvciBBQXJjaDMyLDxiciAvPppiZWNhdXNlIHdlIGRvbid0IG5lZWQgb3RoZXIgYml0cyBpbiB0
aGF0IGNhc2UgdG8gY29uc3RydWN0IG5leHQgZGVzY3JpcHRvciBhZGRyZXNzLjxiciAvPppJdCBp
cyBjbGVhcmx5IGRlc2NyaWJlZCBpbiB0aGUgQVJNIHBzZXVkby1jb2RlLjxiciAvPppXaHkgc2hv
dWxkIHdlIGtlZXAgaW4gdGhlIG1hc2sgYml0cyBmcm9tIDQwIHVwIHRvIDQ3IGlmIHdlIGRvbid0
IG5lZWQgdGhlbT8gRXZlbiBpZiB0aGV5IGFyZSBhbGwgemVyb2VzLjxiciAvPppJdCBpcyBhIGJp
dCBvYmZ1c2NhdGluZywgYXMgSSBzYWlkLjxiciAvPjxiciAvPjwvYmxvY2txdW90ZT48cD6amkkg
YWdyZWUgd2l0aCBQZXRlci4gVGhlIG9yaWdpbmFsIGNvbW1lbnQgaXMgY29ycmVjdC48YnIgLz48
YnIgLz5Mb29raW5nIGF0IHRoZSBUTEJSZWNvcmQgQUFyY2gzMi5UcmFuc2xhdGlvblRhYmxlV2Fs
a0xEIHBzZXVkb2NvZGUsIGl0IGlzIHRyZWF0aW5nIHRoZSBBQXJjaDMyIGFkZHJlc3MgYXMgNDgg
Yml0cyBsb25nLiBGb3IgZXhhbXBsZTo8YnIgLz6ampqammlmICFJc1plcm8oYmFzZXJlZ2lzdGVy
Jmx0OzQ3OjQwJmd0OykgdGhlbjxiciAvPpqampqampqammxldmVsID0gMDs8YnIgLz6ampqampqa
mppyZXN1bHQuYWRkcmRlc2MuZmF1bHQgPSBBQXJjaDMyLkFkZHJlc3NTaXplRmF1bHQoaXBhZGRy
ZXNzLCBkb21haW4sIGxldmVsLCBhY2N0eXBlLCBpc3dyaXRlLDxiciAvPpqampqampqampqampqa
mpqampqampqampqampqampqampqampqampqampqampqampqampqampqamppzZWNvbmRzdGFnZSwg
czJmczF3YWxrKTs8YnIgLz6ampqamnJldHVybiByZXN1bHQ7PGJyIC8+PGJyIC8+VGhpcyByZXF1
aXJlcyB0aGF0IGFuIEFBcmNoMzIgYWRkcmVzcyBoYXZlIHNwZWNpZmljIHZhbHVlcyB1cCB0aHJv
dWdoIGJpdCA0Ny48L3A+PC9ibG9ja3F1b3RlPjxkaXY+mjwvZGl2PjxkaXY+VGhlcmUgaXMgYSBu
ZXdlciB2ZXJzaW9uIG9mIHRoZSBwYXRjaC4gSSdtIHNvcnJ5LCBJIGZvcmdvdCB0byByZXBvcnQg
aGVyZSBhYm91dCBpdC48L2Rpdj4=
