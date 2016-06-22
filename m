Received: by 10.25.21.96 with SMTP id l93csp84124lfi;
        Wed, 22 Jun 2016 09:30:47 -0700 (PDT)
X-Received: by 10.55.155.18 with SMTP id d18mr40143086qke.103.1466613047632;
        Wed, 22 Jun 2016 09:30:47 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y10si473681qty.110.2016.06.22.09.30.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 22 Jun 2016 09:30:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@yandex.ru;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=yandex.ru
Received: from localhost ([::1]:59678 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bFl39-0003Sm-3Q
	for alex.bennee@linaro.org; Wed, 22 Jun 2016 12:30:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59041)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>) id 1bFl34-0003QP-To
	for qemu-arm@nongnu.org; Wed, 22 Jun 2016 12:30:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>) id 1bFl2x-0002wV-Oh
	for qemu-arm@nongnu.org; Wed, 22 Jun 2016 12:30:42 -0400
Received: from forward5h.cmail.yandex.net ([87.250.230.20]:46710)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>)
	id 1bFl2w-0002uE-1o; Wed, 22 Jun 2016 12:30:35 -0400
Received: from mxback2h.mail.yandex.net (mxback2h.mail.yandex.net
	[84.201.187.139])
	by forward5h.cmail.yandex.net (Yandex) with ESMTP id 9273221040;
	Wed, 22 Jun 2016 19:30:21 +0300 (MSK)
Received: from web5h.yandex.ru (web5h.yandex.ru [84.201.186.34])
	by mxback2h.mail.yandex.net (nwsmtp/Yandex) with ESMTP id
	1uErBjiRAk-UKBugDiS; Wed, 22 Jun 2016 19:30:20 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1466613020; bh=yTosTBNFevvqIMIo8KIdVWbbaVb6kwQId74mdPfq3Z0=;
	h=X-Yandex-Sender-Uid:From:To:Cc:In-Reply-To:References:Subject:
	MIME-Version:Message-Id:X-Mailer:Date:Content-Transfer-Encoding:
	Content-Type;
	b=la1IorL+6u0yPPBVJ7TZTU10r8acKppc2rgh+6nQyIBww5S9ogci3pSzcs7Gbf3Qx
	dWNi716gZfiBCppZmV7Qepix64UCKDzVWYnpbUH2quyuu1wc92f5FFfYsIQk9gBHgw
	Rf8+KmVsp+qd2QDhhvpgzZVAClsEtv4pxc0CRafg=
Authentication-Results: mxback2h.mail.yandex.net; dkim=pass header.i=@yandex.ru
Received: by web5h.yandex.ru with HTTP;
	Wed, 22 Jun 2016 19:30:20 +0300
From: Sergey Sorokin <afarallax@yandex.ru>
To: Richard Henderson <rth@twiddle.net>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
In-Reply-To: <5d86b8ba-16e8-e94d-ba7f-e865cbcc938e@twiddle.net>
References: <1466599029-3388432-1-git-send-email-afarallax@yandex.ru>
	<5d86b8ba-16e8-e94d-ba7f-e865cbcc938e@twiddle.net>
MIME-Version: 1.0
Message-Id: <1793281466613020@web5h.yandex.ru>
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Wed, 22 Jun 2016 19:30:20 +0300
Content-Transfer-Encoding: base64
Content-Type: text/html; charset=utf-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 87.250.230.20
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
X-TUID: klV7nyET2pG8

PGRpdj7CoDwvZGl2PjxkaXY+wqA8L2Rpdj48ZGl2PjIyLjA2LjIwMTYsIDE4OjUwLCAiUmljaGFy
ZCBIZW5kZXJzb24iICZsdDtydGhAdHdpZGRsZS5uZXQmZ3Q7OjwvZGl2PjxibG9ja3F1b3RlIHR5
cGU9ImNpdGUiPjxwPk9uIDA2LzIyLzIwMTYgMDU6MzcgQU0sIFNlcmdleSBTb3Jva2luIHdyb3Rl
OjwvcD48YmxvY2txdW90ZT7CoCsvKiBVc2UgdGhpcyBtYXNrIHRvIGNoZWNrIGludGVyY2VwdGlv
biB3aXRoIGFuIGFsaWdubWVudCBtYXNrPGJyIC8+wqArICogaW4gYSBUQ0cgYmFja2VuZC48YnIg
Lz7CoCsgKi88YnIgLz7CoCsjZGVmaW5lIFRMQl9GTEFHU19NQVNLIChUTEJfSU5WQUxJRF9NQVNL
IHwgVExCX05PVERJUlRZIHwgVExCX01NSU8pPC9ibG9ja3F1b3RlPjxwPjxiciAvPkkgdGhpbmsg
d2Ugb3VnaHQgdG8gY2hlY2sgdGhpcyBpbiB0Y2ctb3AuYywgcmF0aGVyIHRoYW4gd2FpdCB1bnRp
bCBnZW5lcmF0aW5nPGJyIC8+Y29kZSBpbiB0aGUgYmFja2VuZC48YnIgLz48YnIgLz48YnIgLz48
L3A+PGJsb2NrcXVvdGU+wqAtLS0gYS90Y2cvYWFyY2g2NC90Y2ctdGFyZ2V0LmluYy5jPGJyIC8+
wqArKysgYi90Y2cvYWFyY2g2NC90Y2ctdGFyZ2V0LmluYy5jPGJyIC8+wqBAQCAtMTA3MSwxOSAr
MTA3MSwyMSBAQCBzdGF0aWMgdm9pZCB0Y2dfb3V0X3RsYl9yZWFkKFRDR0NvbnRleHQgKnMsIFRD
R1JlZyBhZGRyX3JlZywgVENHTWVtT3Agb3BjLDxiciAvPsKgwqDCoMKgwqDCoGludCB0bGJfb2Zm
c2V0ID0gaXNfcmVhZCA/PGJyIC8+wqDCoMKgwqDCoMKgwqDCoMKgwqBvZmZzZXRvZihDUFVBcmNo
U3RhdGUsIHRsYl90YWJsZVttZW1faW5kZXhdWzBdLmFkZHJfcmVhZCk8YnIgLz7CoMKgwqDCoMKg
wqDCoMKgwqDCoDogb2Zmc2V0b2YoQ1BVQXJjaFN0YXRlLCB0bGJfdGFibGVbbWVtX2luZGV4XVsw
XS5hZGRyX3dyaXRlKTs8YnIgLz7CoC0gaW50IHNfbWFzayA9ICgxICZsdDsmbHQ7IChvcGMgJmFt
cDsgTU9fU0laRSkpIC0gMTs8YnIgLz7CoCsgaW50IGFfYml0cyA9IGdldF9hbGlnbm1lbnRfYml0
cyhvcGMpOzxiciAvPsKgwqDCoMKgwqDCoFRDR1JlZyBiYXNlID0gVENHX0FSRUcwLCB4Mzs8YnIg
Lz7CoC0gdWludDY0X3QgdGxiX21hc2s7PGJyIC8+wqArIHRhcmdldF91bG9uZyB0bGJfbWFzazs8
L2Jsb2NrcXVvdGU+PHA+PGJyIC8+SHVtLiBJIGhhZCBiZWVuIHRhbGtpbmcgYWJvdXQgaTM4NiBz
cGVjaWZpY2FsbHkgd2hlbiBjaGFuZ2luZyB0aGUgdHlwZSBvZjxiciAvPnRsYl9tYXNrLjxiciAv
PjxiciAvPkZvciBhYXJjaDY0LCBhIHF1aXJrIGluIHRoZSBjb2RlIGdlbmVyYXRpb24gbG9naWMg
cmVxdWlyZXMgdGhhdCBhIDMyLWJpdDxiciAvPnRsYl9tYXNrIGJlIHNpZ24tZXh0ZW5kZWQgdG8g
NjQtYml0LiBUaGUgZWZmZWN0IG9mIHRoZSBhY3R1YWwgaW5zdHJ1Y3Rpb24gd2lsbDxiciAvPmJl
IHplcm8tZXh0ZW5zaW9uLCBob3dldmVyLjxiciAvPjxiciAvPlNlZSBpc19saW1tLCB0Y2dfb3V0
X2xvZ2ljYWxpLCBhbmQgYSByZWxhdGVkIGNvbW1lbnQgaW4gdGNnX291dF9tb3ZpIGZvcjxiciAv
PmRldGFpbHMuIFdlIHNob3VsZCBwcm9iYWJseSBhZGQgYSBjb21tZW50IGhlcmUgaW4gdGxiX3Jl
YWQgZm9yIHRoZSBuZXh0IHBlcnNvbjxiciAvPnRoYXQgY29tZXMgYWxvbmcuLi48YnIgLz48YnIg
Lz48L3A+PC9ibG9ja3F1b3RlPjxwPlRoYW5rIHlvdSBmb3IgdGhlIGNvbW1lbnQuPC9wPjxwPsKg
PC9wPjxibG9ja3F1b3RlIHR5cGU9ImNpdGUiPjxibG9ja3F1b3RlPsKgZGlmZiAtLWdpdCBhL3Rj
Zy9wcGMvdGNnLXRhcmdldC5pbmMuYyBiL3RjZy9wcGMvdGNnLXRhcmdldC5pbmMuYzxiciAvPsKg
aW5kZXggZGExMDA1Mi4uM2RjMzhmYSAxMDA2NDQ8YnIgLz7CoC0tLSBhL3RjZy9wcGMvdGNnLXRh
cmdldC5pbmMuYzxiciAvPsKgKysrIGIvdGNnL3BwYy90Y2ctdGFyZ2V0LmluYy5jPGJyIC8+wqBA
QCAtMTM5OSw2ICsxMzk5LDcgQEAgc3RhdGljIFRDR1JlZyB0Y2dfb3V0X3RsYl9yZWFkKFRDR0Nv
bnRleHQgKnMsIFRDR01lbU9wIG9wYyw8YnIgLz7CoMKgwqDCoMKgwqBpbnQgYWRkX29mZiA9IG9m
ZnNldG9mKENQVUFyY2hTdGF0ZSwgdGxiX3RhYmxlW21lbV9pbmRleF1bMF0uYWRkZW5kKTs8YnIg
Lz7CoMKgwqDCoMKgwqBUQ0dSZWcgYmFzZSA9IFRDR19BUkVHMDs8YnIgLz7CoMKgwqDCoMKgwqBU
Q0dNZW1PcCBzX2JpdHMgPSBvcGMgJmFtcDsgTU9fU0laRTs8YnIgLz7CoCsgaW50IGFfYml0cyA9
IGdldF9hbGlnbm1lbnRfYml0cyhvcGMpOzxiciAvPjxiciAvPsKgwqDCoMKgwqDCoC8qIEV4dHJh
Y3QgdGhlIHBhZ2UgaW5kZXgsIHNoaWZ0ZWQgaW50byBwbGFjZSBmb3IgdGxiIGluZGV4LiAqLzxi
ciAvPsKgwqDCoMKgwqDCoGlmIChUQ0dfVEFSR0VUX1JFR19CSVRTID09IDY0KSB7PGJyIC8+wqBA
QCAtMTQ1NiwxNCArMTQ1NywyMSBAQCBzdGF0aWMgVENHUmVnIHRjZ19vdXRfdGxiX3JlYWQoVENH
Q29udGV4dCAqcywgVENHTWVtT3Agb3BjLDxiciAvPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqAqIHRo
ZSBib3R0b20gYml0cyBhbmQgdGh1cyB0cmlnZ2VyIGEgY29tcGFyaXNvbiBmYWlsdXJlIG9uPGJy
IC8+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCogdW5hbGlnbmVkIGFjY2Vzc2VzPGJyIC8+wqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCovPGJyIC8+wqArIGlmIChhX2JpdHMgJmd0OyAwKSB7PGJyIC8+wqAr
IHRjZ19kZWJ1Z19hc3NlcnQoKCgoMSAmbHQ7Jmx0OyBhX2JpdHMpIC0gMSkgJmFtcDsgVExCX0ZM
QUdTX01BU0spID09IDApOzxiciAvPsKgKyB9IGVsc2UgezxiciAvPsKgKyBhX2JpdHMgPSBzX2Jp
dHM7PGJyIC8+wqArIH08YnIgLz7CoMKgwqDCoMKgwqDCoMKgwqDCoHRjZ19vdXRfcmx3KHMsIFJM
V0lOTSwgVENHX1JFR19SMCwgYWRkcmxvLCAwLDxiciAvPsKgKyAoMzIgLSBhX2JpdHMpICZhbXA7
IDMxLCAzMSAtIFRBUkdFVF9QQUdFX0JJVFMpOzwvYmxvY2txdW90ZT48cD48YnIgLz5wcGMzMiBj
YW4gY2VydGFpbmx5IHN1cHBvcnQgb3Zlci1hbGlnbm1lbnQsIGp1c3QgbGlrZSBldmVyeSBvdGhl
ciB0YXJnZXQuIEl0J3M8YnIgLz5qdXN0IHRoYXQgdGhlcmUgYXJlIHNvbWUgMzItYml0IHBhcnRz
IHRoYXQgZG9uJ3Qgc3VwcG9ydCB1bmFsaWduZWQgYWNjZXNzZXMuPC9wPjwvYmxvY2txdW90ZT48
ZGl2PsKgPC9kaXY+PGRpdj5JIGRvbid0IHVuZGVyc3RhbmQgeW91ciBwb2ludCBoZXJlLjwvZGl2
PjxkaXY+QXMgdGhlIGNvbW1lbnQgc2F5cyB0aGlzIGNhc2UgcHJlc2VydmVzIGFsbCBhbGlnbm1l
bnQgYml0cyB0byBnbyB0byB0aGUgc2xvdyBwYXRoIGluIGNhc2Ugb2YgYW55IHVuYWxpZ25lZCBh
Y2Nlc3MgcmVnYXJkbGVzcyBvZiBhbiBhbGlnbm1lbnQgZW5hYmxpbmcuPC9kaXY+PGRpdj7CoDwv
ZGl2PjxkaXY+wqA8L2Rpdj48ZGl2PsKgPC9kaXY+PGRpdj5BbHNvIEkgZm9yZ2V0IGFib3V0IHNv
ZnRtbXVfdGVtcGxhdGUuaC4gVGhpcyBwYXRjaCBpcyBub3QgZnVsbC48L2Rpdj4=
