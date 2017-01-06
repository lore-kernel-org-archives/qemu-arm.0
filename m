Received: by 10.25.205.13 with SMTP id d13csp10411346lfg;
        Fri, 6 Jan 2017 09:27:45 -0800 (PST)
X-Received: by 10.200.37.101 with SMTP id 34mr70954486qtn.273.1483723665521;
        Fri, 06 Jan 2017 09:27:45 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 60si50554375qtf.164.2017.01.06.09.27.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 06 Jan 2017 09:27:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54093 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cPYIo-0006Pk-O7
	for alex.bennee@linaro.org; Fri, 06 Jan 2017 12:27:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40560)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1cPYID-0005rp-N9
	for qemu-arm@nongnu.org; Fri, 06 Jan 2017 12:27:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1cPYI9-0004OY-JT
	for qemu-arm@nongnu.org; Fri, 06 Jan 2017 12:27:05 -0500
Resent-Date: Fri, 06 Jan 2017 12:27:05 -0500
Resent-Message-Id: <E1cPYI9-0004OY-JT@eggs.gnu.org>
Received: from sender163-mail.zoho.com ([74.201.84.163]:21442)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <no-reply@patchew.org>)
	id 1cPYI9-0004O2-At; Fri, 06 Jan 2017 12:27:01 -0500
Received: from [172.17.0.2] (23.253.156.214 [23.253.156.214]) by
	mx.zohomail.com with SMTPS id 1483723613803160.16972028348812;
	Fri, 6 Jan 2017 09:26:53 -0800 (PST)
In-Reply-To: <20170106162116.12859-1-kirkseraph@gmail.com>
Message-ID: <148372361252.199.14478591434551054669@790289a7ca88>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: kirkseraph@gmail.com
Date: Fri, 6 Jan 2017 09:26:53 -0800 (PST)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 74.201.84.163
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCHv2] target-arm/abi32: check for
 segfault in do_kernel_trap
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, famz@redhat.com,
	qemu-devel@nongnu.org, kirkseraph@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gx68OreBFQG3

SGksCgpZb3VyIHNlcmllcyBzZWVtcyB0byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1z
LiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3JlIGluZm9ybWF0aW9uOgoKU3ViamVjdDogW1FlbXUt
ZGV2ZWxdIFtQQVRDSHYyXSB0YXJnZXQtYXJtL2FiaTMyOiBjaGVjayBmb3Igc2VnZmF1bHQgaW4g
ZG9fa2VybmVsX3RyYXAKTWVzc2FnZS1pZDogMjAxNzAxMDYxNjIxMTYuMTI4NTktMS1raXJrc2Vy
YXBoQGdtYWlsLmNvbQpUeXBlOiBzZXJpZXMKCj09PSBURVNUIFNDUklQVCBCRUdJTiA9PT0KIyEv
YmluL2Jhc2gKCkJBU0U9YmFzZQpuPTEKdG90YWw9JChnaXQgbG9nIC0tb25lbGluZSAkQkFTRS4u
IHwgd2MgLWwpCmZhaWxlZD0wCgojIFVzZWZ1bCBnaXQgb3B0aW9ucwpnaXQgY29uZmlnIC0tbG9j
YWwgZGlmZi5yZW5hbWVsaW1pdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZXMgVHJ1
ZQoKY29tbWl0cz0iJChnaXQgbG9nIC0tZm9ybWF0PSVIIC0tcmV2ZXJzZSAkQkFTRS4uKSIKZm9y
IGMgaW4gJGNvbW1pdHM7IGRvCiAgICBlY2hvICJDaGVja2luZyBQQVRDSCAkbi8kdG90YWw6ICQo
Z2l0IGxvZyAtbiAxIC0tZm9ybWF0PSVzICRjKS4uLiIKICAgIGlmICEgZ2l0IHNob3cgJGMgLS1m
b3JtYXQ9ZW1haWwgfCAuL3NjcmlwdHMvY2hlY2twYXRjaC5wbCAtLW1haWxiYWNrIC07IHRoZW4K
ICAgICAgICBmYWlsZWQ9MQogICAgICAgIGVjaG8KICAgIGZpCiAgICBuPSQoKG4rMSkpCmRvbmUK
CmV4aXQgJGZhaWxlZAo9PT0gVEVTVCBTQ1JJUFQgRU5EID09PQoKVXBkYXRpbmcgM2M4Y2Y1YTlj
MjFmZjg3ODIxNjRkMWRlZjdmNDRiZDg4ODcxMzM4NApGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9w
YXRjaGV3LXByb2plY3QvcWVtdQogKiBbbmV3IHRhZ10gICAgICAgICBwYXRjaGV3LzIwMTcwMTA2
MTYyMTE2LjEyODU5LTEta2lya3NlcmFwaEBnbWFpbC5jb20gLT4gcGF0Y2hldy8yMDE3MDEwNjE2
MjExNi4xMjg1OS0xLWtpcmtzZXJhcGhAZ21haWwuY29tClN3aXRjaGVkIHRvIGEgbmV3IGJyYW5j
aCAndGVzdCcKOGVhMzA2MiB0YXJnZXQtYXJtL2FiaTMyOiBjaGVjayBmb3Igc2VnZmF1bHQgaW4g
ZG9fa2VybmVsX3RyYXAKCj09PSBPVVRQVVQgQkVHSU4gPT09CkNoZWNraW5nIFBBVENIIDEvMTog
dGFyZ2V0LWFybS9hYmkzMjogY2hlY2sgZm9yIHNlZ2ZhdWx0IGluIGRvX2tlcm5lbF90cmFwLi4u
CkVSUk9SOiBicmFjZXMge30gYXJlIG5lY2Vzc2FyeSBmb3IgYWxsIGFybXMgb2YgdGhpcyBzdGF0
ZW1lbnQKIzU2OiBGSUxFOiBsaW51eC11c2VyL21haW4uYzo1MTc6CisgICAgaWYgKGdldF91c2Vy
X3UzMih2YWwsIGFkZHIpKQpbLi4uXQoKRVJST1I6IGJyYWNlcyB7fSBhcmUgbmVjZXNzYXJ5IGZv
ciBhbGwgYXJtcyBvZiB0aGlzIHN0YXRlbWVudAojNjA6IEZJTEU6IGxpbnV4LXVzZXIvbWFpbi5j
OjUyMToKKyAgICAgICAgaWYgKHB1dF91c2VyX3UzMih2YWwsIGFkZHIpKQpbLi4uXQoKdG90YWw6
IDIgZXJyb3JzLCAwIHdhcm5pbmdzLCA5NSBsaW5lcyBjaGVja2VkCgpZb3VyIHBhdGNoIGhhcyBz
dHlsZSBwcm9ibGVtcywgcGxlYXNlIHJldmlldy4gIElmIGFueSBvZiB0aGVzZSBlcnJvcnMKYXJl
IGZhbHNlIHBvc2l0aXZlcyByZXBvcnQgdGhlbSB0byB0aGUgbWFpbnRhaW5lciwgc2VlCkNIRUNL
UEFUQ0ggaW4gTUFJTlRBSU5FUlMuCgo9PT0gT1VUUFVUIEVORCA9PT0KClRlc3QgY29tbWFuZCBl
eGl0ZWQgd2l0aCBjb2RlOiAxCgoKLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5
IFBhdGNoZXcgW2h0dHA6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNr
IHRvIHBhdGNoZXctZGV2ZWxAZnJlZWxpc3RzLm9yZw==

