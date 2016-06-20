Received: by 10.25.21.96 with SMTP id l93csp1556963lfi;
        Mon, 20 Jun 2016 10:34:08 -0700 (PDT)
X-Received: by 10.200.49.50 with SMTP id g47mr23513917qtb.76.1466444047988;
        Mon, 20 Jun 2016 10:34:07 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l12si48866840qtb.131.2016.06.20.10.34.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 Jun 2016 10:34:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@yandex.ru;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=yandex.ru
Received: from localhost ([::1]:45278 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bF35L-0004X7-BZ
	for alex.bennee@linaro.org; Mon, 20 Jun 2016 13:34:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51292)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>) id 1bF35H-0004VV-KK
	for qemu-arm@nongnu.org; Mon, 20 Jun 2016 13:34:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>) id 1bF35E-0001c1-EK
	for qemu-arm@nongnu.org; Mon, 20 Jun 2016 13:34:03 -0400
Received: from forward2m.cmail.yandex.net ([5.255.216.20]:41613)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>)
	id 1bF35C-0001aG-Ur; Mon, 20 Jun 2016 13:34:00 -0400
Received: from mxback5m.mail.yandex.net (mxback5m.mail.yandex.net
	[37.140.138.65])
	by forward2m.cmail.yandex.net (Yandex) with ESMTP id ED9682102E;
	Mon, 20 Jun 2016 20:33:45 +0300 (MSK)
Received: from web26m.yandex.ru (web26m.yandex.ru [37.140.138.117])
	by mxback5m.mail.yandex.net (nwsmtp/Yandex) with ESMTP id
	4v3bVoLsNl-XjAWs8bj; Mon, 20 Jun 2016 20:33:45 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1466444025; bh=JQftiRiuMIP8lcQadQFXizj9GzLInNFhwSYsB1TdP98=;
	h=X-Yandex-Sender-Uid:From:To:Cc:In-Reply-To:References:Subject:
	MIME-Version:Message-Id:X-Mailer:Date:Content-Transfer-Encoding:
	Content-Type;
	b=Q3iVZeylVjyAoQUU0SduD4+6vmq+3iSZ8mSm71dQ0QMLMzbxUukmqPigV+nKvB1dZ
	UoVjPYQWgtwNuhQOB90ngoKJux5zTHt+DRVpey/WdxBBkg1gptaWmV19/iKBrWe5qQ
	dYuVmuUxDcvKQNiyk7UEcRt9DzqBIBvUFtJuB/D4=
Authentication-Results: mxback5m.mail.yandex.net; dkim=pass header.i=@yandex.ru
Received: by web26m.yandex.ru with HTTP;
	Mon, 20 Jun 2016 20:33:45 +0300
From: Sergey Sorokin <afarallax@yandex.ru>
To: Richard Henderson <rth@twiddle.net>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
In-Reply-To: <ace0b2e6-613b-cc8e-aa05-f583ed43857b@twiddle.net>
References: <1466431017-123868-1-git-send-email-afarallax@yandex.ru>
	<ace0b2e6-613b-cc8e-aa05-f583ed43857b@twiddle.net>
MIME-Version: 1.0
Message-Id: <44881466444025@web26m.yandex.ru>
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Mon, 20 Jun 2016 20:33:45 +0300
Content-Transfer-Encoding: base64
Content-Type: text/html; charset=utf-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 5.255.216.20
Subject: Re: [Qemu-arm] [PATCH] Improve the alignment check infrastructure
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
	"Vassili Karpov \(malc\)" <av1474@comtv.ru>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vfPwH+4oZ1/v

PGRpdj7CoDwvZGl2PjxkaXY+wqA8L2Rpdj48ZGl2PjIwLjA2LjIwMTYsIDE4OjQ1LCAiUmljaGFy
ZCBIZW5kZXJzb24iICZsdDtydGhAdHdpZGRsZS5uZXQmZ3Q7OjwvZGl2PjxibG9ja3F1b3RlIHR5
cGU9ImNpdGUiPjxwPk9uIDA2LzIwLzIwMTYgMDY6NTYgQU0sIFNlcmdleSBTb3Jva2luIHdyb3Rl
OjwvcD48YmxvY2txdW90ZT7CoMKgLyogRmxhZ3Mgc3RvcmVkIGluIHRoZSBsb3cgYml0cyBvZiB0
aGUgVExCIHZpcnR1YWwgYWRkcmVzcy4gVGhlc2UgYXJlPGJyIC8+wqAtIGRlZmluZWQgc28gdGhh
dCBmYXN0IHBhdGggcmFtIGFjY2VzcyBpcyBhbGwgemVyb3MuICovPGJyIC8+wqArICogZGVmaW5l
ZCBzbyB0aGF0IGZhc3QgcGF0aCByYW0gYWNjZXNzIGlzIGFsbCB6ZXJvcy48YnIgLz7CoCsgKiBU
aGV5IHN0YXJ0IGFmdGVyIGFkZHJlc3MgYWxpZ25tZW50IGJpdHMuPGJyIC8+wqArICovPGJyIC8+
wqArI2RlZmluZSBUTEJfRkxBR1NfU1RBUlRfQklUIDY8YnIgLz7CoMKgLyogWmVybyBpZiBUTEIg
ZW50cnkgaXMgdmFsaWQuICovPGJyIC8+wqAtI2RlZmluZSBUTEJfSU5WQUxJRF9NQVNLICgxICZs
dDsmbHQ7IDMpPGJyIC8+wqArI2RlZmluZSBUTEJfSU5WQUxJRF9NQVNLICgxICZsdDsmbHQ7IChU
TEJfRkxBR1NfU1RBUlRfQklUICsgMCkpPGJyIC8+wqDCoC8qIFNldCBpZiBUTEIgZW50cnkgcmVm
ZXJlbmNlcyBhIGNsZWFuIFJBTSBwYWdlLiBUaGUgaW90bGIgZW50cnkgd2lsbDxiciAvPsKgwqDC
oMKgwqBjb250YWluIHRoZSBwYWdlIHBoeXNpY2FsIGFkZHJlc3MuICovPGJyIC8+wqAtI2RlZmlu
ZSBUTEJfTk9URElSVFkgKDEgJmx0OyZsdDsgNCk8YnIgLz7CoCsjZGVmaW5lIFRMQl9OT1RESVJU
WSAoMSAmbHQ7Jmx0OyAoVExCX0ZMQUdTX1NUQVJUX0JJVCArIDEpKTxiciAvPsKgwqAvKiBTZXQg
aWYgVExCIGVudHJ5IGlzIGFuIElPIGNhbGxiYWNrLiAqLzxiciAvPsKgLSNkZWZpbmUgVExCX01N
SU8gKDEgJmx0OyZsdDsgNSk8YnIgLz7CoCsjZGVmaW5lIFRMQl9NTUlPICgxICZsdDsmbHQ7IChU
TEJfRkxBR1NfU1RBUlRfQklUICsgMikpPC9ibG9ja3F1b3RlPjxwPjxiciAvPkkgdGhpbmsgd2Ug
bWF5IG5lZWQgdG8gYXNzZXJ0IHRoYXQgVExCX0ZMQUdTX1NUQVJUX0JJVCArIDMgJmx0OyBUQVJH
RVRfUEFHRV9CSVRTLiA8YnIgLz5PciBwZXJoYXBzIHN0YXJ0IGZyb20gVEFSR0VUX1BBR0VfQklU
Uy0xIGFuZCBzdWJ0cmFjdD88L3A+PC9ibG9ja3F1b3RlPjxwPkkgdGhvdWdodCBhYm91dCB0aGlz
IGJ1dCBsZWZ0IHVuY2hlY2tlZCBhcyBpdCB3YXMuIEFueXdheSwgaWRlYSBpcyBnb29kLjwvcD48
cD7CoDwvcD48YmxvY2txdW90ZSB0eXBlPSJjaXRlIj48cD5JJ20gdGhpbmtpbmcgb2YgdGhlIEFW
UiB0YXJnZXQgY3VycmVudGx5IHVuZGVyIHJldmlldyB3aGljaCByZXF1aXJlcyA8YnIgLz5UQVJH
RVRfUEFHRV9CSVRTID09IDggaW4gb3JkZXIgdG8gc3VwcG9ydCB0aGUgbWVtb3J5IGRldmljZSBs
YXlvdXQuPC9wPjwvYmxvY2txdW90ZT48ZGl2PldoYXQgaXMgbWF4aW11bSBhbGlnbm1lbnQgc2l6
ZSBmb3IgQVZSPyBJIHRoaW5rIGl0J3MgcG9zc2libGUgdG8gaW1wbGVtZW50IHNvbWUgY2hlY2tz
IGZvciB0aGlzIG1heGltdW0uPC9kaXY+PGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSI+PHA+PGJyIC8+
PGJyIC8+PC9wPjxibG9ja3F1b3RlPsKgQEAgLTExOTUsOCArMTE5NSw4IEBAIHN0YXRpYyBpbmxp
bmUgdm9pZCB0Y2dfb3V0X3RsYl9sb2FkKFRDR0NvbnRleHQgKnMsIFRDR1JlZyBhZGRybG8sIFRD
R1JlZyBhZGRyaGksPGJyIC8+wqDCoMKgwqDCoMKgVENHVHlwZSB0dHlwZSA9IFRDR19UWVBFX0kz
Mjs8YnIgLz7CoMKgwqDCoMKgwqBUQ0dUeXBlIHRsYnR5cGUgPSBUQ0dfVFlQRV9JMzI7PGJyIC8+
wqDCoMKgwqDCoMKgaW50IHRyZXh3ID0gMCwgaHJleHcgPSAwLCB0bGJyZXh3ID0gMDs8YnIgLz7C
oC0gaW50IHNfbWFzayA9ICgxICZsdDsmbHQ7IChvcGMgJmFtcDsgTU9fU0laRSkpIC0gMTs8YnIg
Lz7CoC0gYm9vbCBhbGlnbmVkID0gKG9wYyAmYW1wOyBNT19BTUFTSykgPT0gTU9fQUxJR04gfHwg
c19tYXNrID09IDA7PGJyIC8+wqArIGludCBhX2JpdHMgPSBnZXRfYWxpZ25tZW50X2JpdHMob3Bj
KTs8YnIgLz7CoCsgdWludDY0X3QgdGxiX21hc2s7PC9ibG9ja3F1b3RlPjxwPjxiciAvPnRsYl9t
YXNrIHNob3VsZCBiZSB0YXJnZXRfdWxvbmcuPGJyIC8+PGJyIC8+PGJyIC8+PC9wPjxibG9ja3F1
b3RlPsKgQEAgLTEwOTksOSArMTEwOSwxNSBAQCB2b2lkIHRjZ19kdW1wX29wcyhUQ0dDb250ZXh0
ICpzKTxiciAvPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqBxZW11X2xvZygiLCQweCV4LCV1Iiwgb3AsIGl4KTs8YnIgLz7CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoH0gZWxzZSB7PGJyIC8+wqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGNvbnN0IGNoYXIgKnNfYWwgPSAi
IiwgKnNfb3A7PGJyIC8+wqArIGludCBhX2JpdHM7PGJyIC8+wqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmIChvcCAmYW1wOyBNT19BTUFTSykgezxi
ciAvPsKgLSBpZiAoKG9wICZhbXA7IE1PX0FNQVNLKSA9PSBNT19BTElHTikgezxiciAvPsKgLSBz
X2FsID0gImFsKyI7PGJyIC8+wqArIGFfYml0cyA9IGdldF9hbGlnbm1lbnRfYml0cyhvcCk7PGJy
IC8+wqArIGlmIChhX2JpdHMgJmd0Oz0gMCkgezxiciAvPsKgKyBpZiAoKG9wICZhbXA7IE1PX1NJ
WkUpID09IGFfYml0cykgezxiciAvPsKgKyBzX2FsID0gImFsKyI7PGJyIC8+wqArIH0gZWxzZSB7
PGJyIC8+wqArIHNfYWwgPSBhbGlnbm1lbnRfbmFtZVthX2JpdHNdOzxiciAvPsKgKyB9PC9ibG9j
a3F1b3RlPjxwPjxiciAvPkkgdGhpbmsgcGVyaGFwcyB3ZSBzaG91bGQgYmUgbW9yZSBleHBsaWNp
dCBhYm91dCB3aGF0J3MgYWN0dWFsbHkgZW5jb2RlZCBoZXJlLiA8YnIgLz5FZyBvbmx5IHByaW50
ICJhbCsiIGlmIChvcCAmYW1wOyBNT19BTUFTSykgPT0gTU9fQUxJR04uIFNvIGlmIGFuIGV4cGxp
Y2l0IGFsNCBpcyA8YnIgLz5lbmNvZGVkIGZvciBzaXplIDQsIHByaW50IHRoYXQuIFdoaWNoIGRv
ZXMgc2ltcGxpZnkgYWxsIHRoaXMgY29kZSB0bzxiciAvPjxiciAvPitzdGF0aWMgY29uc3QgY2hh
ciAqIGNvbnN0IGFsaWdubWVudF9uYW1lW01PX0FNQVNLICZndDsmZ3Q7IE1PX0FTSElGVF0gPSB7
PGJyIC8+KyBbTU9fVU5BTE4gJmd0OyZndDsgTU9fQVNISUZUXSA9ICJ1bisiLDxiciAvPisgW01P
X0FMSUdOICZndDsmZ3Q7IE1PX0FTSElGVF0gPSAiYWwrIiw8YnIgLz4rIFtNT19BTElHTl8yICZn
dDsmZ3Q7IE1PX0FTSElGVF0gPSAiYWwyKyIsPGJyIC8+KyBbTU9fQUxJR05fNCAmZ3Q7Jmd0OyBN
T19BU0hJRlRdID0gImFsNCsiLDxiciAvPisgW01PX0FMSUdOXzggJmd0OyZndDsgTU9fQVNISUZU
XSA9ICJhbDgrIiw8YnIgLz4rIFtNT19BTElHTl8xNiAmZ3Q7Jmd0OyBNT19BU0hJRlRdID0gImFs
MTYrIiw8YnIgLz4rIFtNT19BTElHTl8zMiAmZ3Q7Jmd0OyBNT19BU0hJRlRdID0gImFsMzIrIiw8
YnIgLz4rIFtNT19BTElHTl82NCAmZ3Q7Jmd0OyBNT19BU0hJRlRdID0gImFsNjQrIiw8YnIgLz4r
fTs8YnIgLz48YnIgLz5zX2FsID0gYWxpZ25tZW50X25hbWVbKG9wICZhbXA7IE1PX0FNQVNLKSAm
Z3Q7Jmd0OyBNT19BU0hJRlRdOzwvcD48L2Jsb2NrcXVvdGU+PHA+PC9wPjxwPjwvcD48cD48L3A+
PGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSI+PHA+PC9wPjxibG9ja3F1b3RlPsKgKyAvKiBTcGVjaWZp
YyBhbGlnbm1lbnQgc2l6ZS4gSXQgbXVzdCBiZSBlcXVhbCBvciBncmVhdGVyPGJyIC8+wqArICog
dGhhbiB0aGUgYWNjZXNzIHNpemUuPGJyIC8+wqArICovPGJyIC8+wqArIGEgJmd0OyZndDs9IE1P
X0FTSElGVDs8YnIgLz7CoCsgYXNzZXJ0KGEgJmd0Oz0gcyk7PGJyIC8+wqArIHJldHVybiBhOzwv
YmxvY2txdW90ZT48cD48YnIgLz50Y2dfZGVidWdfYXNzZXJ0LjxiciAvPjxiciAvPjxiciAvPnJ+
PC9wPjwvYmxvY2txdW90ZT4=
