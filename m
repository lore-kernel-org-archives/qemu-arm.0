Received: by 10.103.86.15 with SMTP id k15csp1422595vsb;
        Fri, 16 Dec 2016 08:09:42 -0800 (PST)
X-Received: by 10.55.144.70 with SMTP id s67mr3952547qkd.290.1481904582870;
        Fri, 16 Dec 2016 08:09:42 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v144si1212494qka.326.2016.12.16.08.09.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Dec 2016 08:09:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33025 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cHv4m-00006Q-6g
	for alex.bennee@linaro.org; Fri, 16 Dec 2016 11:09:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46533)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1cHv4Z-0008Vt-TA
	for qemu-arm@nongnu.org; Fri, 16 Dec 2016 11:09:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1cHv4U-00056x-SH
	for qemu-arm@nongnu.org; Fri, 16 Dec 2016 11:09:27 -0500
Resent-Date: Fri, 16 Dec 2016 11:09:27 -0500
Resent-Message-Id: <E1cHv4U-00056x-SH@eggs.gnu.org>
Received: from sender163-mail.zoho.com ([74.201.84.163]:21488)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <no-reply@patchew.org>)
	id 1cHv4U-00054l-HP; Fri, 16 Dec 2016 11:09:22 -0500
Received: from [172.17.0.2] (23.253.156.214 [23.253.156.214]) by
	mx.zohomail.com with SMTPS id 1481904552893318.82150581542055;
	Fri, 16 Dec 2016 08:09:12 -0800 (PST)
In-Reply-To: <1481894862-14102-1-git-send-email-marcin.krzeminski@nokia.com>
Message-ID: <148190455153.31.11980243308320502782@790289a7ca88>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: marcin.krzeminski@nokia.com
Date: Fri, 16 Dec 2016 08:09:12 -0800 (PST)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 74.201.84.163
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 0/2]block: m25p80: Improve
 mt25qu01g chip model
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
Reply-To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, famz@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, clg@kaod.org, rfsw-patches@mlist.nokia.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jBnp7FAypuNm

SGksCgpZb3VyIHNlcmllcyBzZWVtcyB0byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1z
LiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3JlIGluZm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzClN1
YmplY3Q6IFtRZW11LWRldmVsXSBbUEFUQ0ggMC8yXWJsb2NrOiBtMjVwODA6IEltcHJvdmUgbXQy
NXF1MDFnIGNoaXAgbW9kZWwKTWVzc2FnZS1pZDogMTQ4MTg5NDg2Mi0xNDEwMi0xLWdpdC1zZW5k
LWVtYWlsLW1hcmNpbi5rcnplbWluc2tpQG5va2lhLmNvbQoKPT09IFRFU1QgU0NSSVBUIEJFR0lO
ID09PQojIS9iaW4vYmFzaAoKQkFTRT1iYXNlCm49MQp0b3RhbD0kKGdpdCBsb2cgLS1vbmVsaW5l
ICRCQVNFLi4gfCB3YyAtbCkKZmFpbGVkPTAKCiMgVXNlZnVsIGdpdCBvcHRpb25zCmdpdCBjb25m
aWcgLS1sb2NhbCBkaWZmLnJlbmFtZWxpbWl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVu
YW1lcyBUcnVlCgpjb21taXRzPSIkKGdpdCBsb2cgLS1mb3JtYXQ9JUggLS1yZXZlcnNlICRCQVNF
Li4pIgpmb3IgYyBpbiAkY29tbWl0czsgZG8KICAgIGVjaG8gIkNoZWNraW5nIFBBVENIICRuLyR0
b3RhbDogJChnaXQgbG9nIC1uIDEgLS1mb3JtYXQ9JXMgJGMpLi4uIgogICAgaWYgISBnaXQgc2hv
dyAkYyAtLWZvcm1hdD1lbWFpbCB8IC4vc2NyaXB0cy9jaGVja3BhdGNoLnBsIC0tbWFpbGJhY2sg
LTsgdGhlbgogICAgICAgIGZhaWxlZD0xCiAgICAgICAgZWNobwogICAgZmkKICAgIG49JCgobisx
KSkKZG9uZQoKZXhpdCAkZmFpbGVkCj09PSBURVNUIFNDUklQVCBFTkQgPT09CgpVcGRhdGluZyAz
YzhjZjVhOWMyMWZmODc4MjE2NGQxZGVmN2Y0NGJkODg4NzEzMzg0CkZyb20gaHR0cHM6Ly9naXRo
dWIuY29tL3BhdGNoZXctcHJvamVjdC9xZW11CiAqIFtuZXcgdGFnXSAgICAgICAgIHBhdGNoZXcv
MTQ4MTg5NDg2Mi0xNDEwMi0xLWdpdC1zZW5kLWVtYWlsLW1hcmNpbi5rcnplbWluc2tpQG5va2lh
LmNvbSAtPiBwYXRjaGV3LzE0ODE4OTQ4NjItMTQxMDItMS1naXQtc2VuZC1lbWFpbC1tYXJjaW4u
a3J6ZW1pbnNraUBub2tpYS5jb20KU3dpdGNoZWQgdG8gYSBuZXcgYnJhbmNoICd0ZXN0Jwo0NGFl
Mjk4IGJsb2NrOiBtMjVwODA6IEludHJvZHVjZSBEaWUgRXJhc2UgY29tbWFuZAoxYzUwZTJlIGJs
b2NrOiBtMjVwODA6IEFkZCBRdWFkIFBhZ2UgUHJvZ3JhbSA0Ynl0ZSB2ZXJzaW9uIG9wCgo9PT0g
T1VUUFVUIEJFR0lOID09PQpDaGVja2luZyBQQVRDSCAxLzI6IGJsb2NrOiBtMjVwODA6IEFkZCBR
dWFkIFBhZ2UgUHJvZ3JhbSA0Ynl0ZSB2ZXJzaW9uIG9wLi4uCkNoZWNraW5nIFBBVENIIDIvMjog
YmxvY2s6IG0yNXA4MDogSW50cm9kdWNlIERpZSBFcmFzZSBjb21tYW5kLi4uCkVSUk9SOiBzcGFj
ZXMgcmVxdWlyZWQgYXJvdW5kIHRoYXQgJy0nIChjdHg6VnhWKQojNjM6IEZJTEU6IGh3L2Jsb2Nr
L20yNXA4MC5jOjUyMjoKKyAgICAgICAgICAgIG9mZnNldCA9IG9mZnNldCAmICh+KGxlbi0xKSk7
CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeCgpXQVJOSU5HOiBsaW5lIG92
ZXIgODAgY2hhcmFjdGVycwojNjU6IEZJTEU6IGh3L2Jsb2NrL20yNXA4MC5jOjUyNDoKKyAgICAg
ICAgICAgIHFlbXVfbG9nX21hc2soTE9HX0dVRVNUX0VSUk9SLCAiTTI1UDgwOiAlZCBkaWUgZXJh
c2Ugbm90IHN1cHBvcnRlZCBieSIKCldBUk5JTkc6IGxpbmUgb3ZlciA4MCBjaGFyYWN0ZXJzCiM5
NDogRklMRTogaHcvYmxvY2svbTI1cDgwLmM6NzM0OgorICAgICAgICAgICAgcy0+ZWFyID0gKCBz
LT5zaXplID4gTUFYXzNCWVRFU19TSVpFID8gcy0+c2l6ZSAvIE1BWF8zQllURVNfU0laRSAtIDEg
OiAwKTsKCkVSUk9SOiBzcGFjZSBwcm9oaWJpdGVkIGFmdGVyIHRoYXQgb3BlbiBwYXJlbnRoZXNp
cyAnKCcKIzk0OiBGSUxFOiBody9ibG9jay9tMjVwODAuYzo3MzQ6CisgICAgICAgICAgICBzLT5l
YXIgPSAoIHMtPnNpemUgPiBNQVhfM0JZVEVTX1NJWkUgPyBzLT5zaXplIC8gTUFYXzNCWVRFU19T
SVpFIC0gMSA6IDApOwoKRVJST1I6IGJyYWNlcyB7fSBhcmUgbmVjZXNzYXJ5IGZvciBhbGwgYXJt
cyBvZiB0aGlzIHN0YXRlbWVudAojOTk6IEZJTEU6IGh3L2Jsb2NrL20yNXA4MC5jOjczOToKKyAg
ICAgICAgICAgIGlmIChzLT5waS0+aWRbNF0gJiBCSVQoNikpClsuLi5dCisgICAgICAgICAgICBl
bHNlClsuLi5dCgp0b3RhbDogMyBlcnJvcnMsIDIgd2FybmluZ3MsIDkzIGxpbmVzIGNoZWNrZWQK
CllvdXIgcGF0Y2ggaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55IG9m
IHRoZXNlIGVycm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBtYWlu
dGFpbmVyLCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KCj09PSBPVVRQVVQgRU5EID09
PQoKVGVzdCBjb21tYW5kIGV4aXRlZCB3aXRoIGNvZGU6IDEKCgotLS0KRW1haWwgZ2VuZXJhdGVk
IGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0cDovL3BhdGNoZXcub3JnL10uClBsZWFzZSBz
ZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEBmcmVlbGlzdHMub3Jn

