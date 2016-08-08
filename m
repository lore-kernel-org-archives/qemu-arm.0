Received: by 10.25.21.156 with SMTP id 28csp105856lfv;
        Mon, 8 Aug 2016 09:59:07 -0700 (PDT)
X-Received: by 10.55.93.71 with SMTP id r68mr3231513qkb.131.1470675547095;
        Mon, 08 Aug 2016 09:59:07 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y34si20546239qta.16.2016.08.08.09.59.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Aug 2016 09:59:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58810 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bWntK-0006p9-Ic
	for alex.bennee@linaro.org; Mon, 08 Aug 2016 12:59:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42677)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1bWntF-0006mm-OR
	for qemu-arm@nongnu.org; Mon, 08 Aug 2016 12:59:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1bWntB-0005fa-GQ
	for qemu-arm@nongnu.org; Mon, 08 Aug 2016 12:59:00 -0400
Resent-Date: Mon, 08 Aug 2016 12:59:00 -0400
Resent-Message-Id: <E1bWntB-0005fa-GQ@eggs.gnu.org>
Received: from sender163-mail.zoho.com ([74.201.84.163]:24321)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>)
	id 1bWntB-0005fM-7f; Mon, 08 Aug 2016 12:58:57 -0400
Received: from ex-std-node742.prod.rhcloud.com
	(ec2-52-6-146-230.compute-1.amazonaws.com [52.6.146.230]) by
	mx.zohomail.com with SMTPS id 1470675528480915.6435849429944;
	Mon, 8 Aug 2016 09:58:48 -0700 (PDT)
In-Reply-To: <1470675071-23677-1-git-send-email-vijay.kilari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: vijay.kilari@gmail.com
Date: Mon, 8 Aug 2016 09:58:48 -0700 (PDT)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
Message-ID: <E1bWntB-0005fM-7f@eggs.gnu.org>
X-Received-From: 74.201.84.163
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC PATCH v2 0/2] GICv3 live migration
 support
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
Cc: peter.maydell@linaro.org, famz@redhat.com, vijay.kilari@gmail.com,
	Prasun.Kapoor@cavium.com, p.fedin@samsung.com,
	qemu-devel@nongnu.org, Vijaya.Kumar@cavium.com,
	qemu-arm@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XZqpEBntM25T

SGksCgpZb3VyIHNlcmllcyBzZWVtcyB0byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1z
LiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3JlIGluZm9ybWF0aW9uOgoKTWVzc2FnZS1pZDogMTQ3
MDY3NTA3MS0yMzY3Ny0xLWdpdC1zZW5kLWVtYWlsLXZpamF5LmtpbGFyaUBnbWFpbC5jb20KVHlw
ZTogc2VyaWVzClN1YmplY3Q6IFtRZW11LWRldmVsXSBbUkZDIFBBVENIIHYyIDAvMl0gR0lDdjMg
bGl2ZSBtaWdyYXRpb24gc3VwcG9ydAoKPT09IFRFU1QgU0NSSVBUIEJFR0lOID09PQojIS9iaW4v
YmFzaAoKQkFTRT1iYXNlCm49MQp0b3RhbD0kKGdpdCBsb2cgLS1vbmVsaW5lICRCQVNFLi4gfCB3
YyAtbCkKZmFpbGVkPTAKCmNvbW1pdHM9IiQoZ2l0IGxvZyAtLWZvcm1hdD0lSCAtLXJldmVyc2Ug
JEJBU0UuLikiCmZvciBjIGluICRjb21taXRzOyBkbwogICAgZWNobyAiQ2hlY2tpbmcgUEFUQ0gg
JG4vJHRvdGFsOiAkKGdpdCBzaG93IC0tbm8tcGF0Y2ggLS1mb3JtYXQ9JXMgJGMpLi4uIgogICAg
aWYgISBnaXQgc2hvdyAkYyAtLWZvcm1hdD1lbWFpbCB8IC4vc2NyaXB0cy9jaGVja3BhdGNoLnBs
IC0tbWFpbGJhY2sgLTsgdGhlbgogICAgICAgIGZhaWxlZD0xCiAgICAgICAgZWNobwogICAgZmkK
ICAgIG49JCgobisxKSkKZG9uZQoKZXhpdCAkZmFpbGVkCj09PSBURVNUIFNDUklQVCBFTkQgPT09
CgpVcGRhdGluZyAzYzhjZjVhOWMyMWZmODc4MjE2NGQxZGVmN2Y0NGJkODg4NzEzMzg0CkZyb20g
aHR0cHM6Ly9naXRodWIuY29tL3BhdGNoZXctcHJvamVjdC9xZW11CiAqIFtuZXcgdGFnXSAgICAg
ICAgIHBhdGNoZXcvMTQ3MDY3NTA3MS0yMzY3Ny0xLWdpdC1zZW5kLWVtYWlsLXZpamF5LmtpbGFy
aUBnbWFpbC5jb20gLT4gcGF0Y2hldy8xNDcwNjc1MDcxLTIzNjc3LTEtZ2l0LXNlbmQtZW1haWwt
dmlqYXkua2lsYXJpQGdtYWlsLmNvbQpTd2l0Y2hlZCB0byBhIG5ldyBicmFuY2ggJ3Rlc3QnCjUy
NjM1ZTQgaHcvaW50Yy9hcm1fZ2ljdjNfa3ZtOiBJbXBsZW1lbnQgZ2V0L3B1dCBmdW5jdGlvbnMK
MTUwNTNlOCBrZXJuZWw6IEFkZCBkZWZpbml0aW9ucyBmb3IgR0lDdjMgYXR0cmlidXRlcwoKPT09
IE9VVFBVVCBCRUdJTiA9PT0KQ2hlY2tpbmcgUEFUQ0ggMS8yOiBrZXJuZWw6IEFkZCBkZWZpbml0
aW9ucyBmb3IgR0lDdjMgYXR0cmlidXRlcy4uLgpFUlJPUjogY29kZSBpbmRlbnQgc2hvdWxkIG5l
dmVyIHVzZSB0YWJzCiMyMjogRklMRTogbGludXgtaGVhZGVycy9hc20tYXJtNjQva3ZtLmg6MTgz
OgorXkkoQVJNNjRfU1lTX1JFR19TSElGVF9NQVNLKG9wMCwgT1AwKSB8IFwkCgpFUlJPUjogc3Bh
Y2UgcmVxdWlyZWQgYWZ0ZXIgdGhhdCAnLCcgKGN0eDpWeFYpCiM0NzogRklMRTogbGludXgtaGVh
ZGVycy9hc20tYXJtNjQva3ZtLmg6MjExOgorI2RlZmluZSAgIEtWTV9ERVZfQVJNX1ZHSUNfU1lT
UkVHKG9wMCxvcDEsY3JuLGNybSxvcDIpIFwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBeCgpFUlJPUjogc3BhY2UgcmVxdWlyZWQgYWZ0ZXIgdGhhdCAnLCcgKGN0eDpWeFYp
CiM0NzogRklMRTogbGludXgtaGVhZGVycy9hc20tYXJtNjQva3ZtLmg6MjExOgorI2RlZmluZSAg
IEtWTV9ERVZfQVJNX1ZHSUNfU1lTUkVHKG9wMCxvcDEsY3JuLGNybSxvcDIpIFwKICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXgoKRVJST1I6IHNwYWNlIHJlcXVpcmVk
IGFmdGVyIHRoYXQgJywnIChjdHg6VnhWKQojNDc6IEZJTEU6IGxpbnV4LWhlYWRlcnMvYXNtLWFy
bTY0L2t2bS5oOjIxMToKKyNkZWZpbmUgICBLVk1fREVWX0FSTV9WR0lDX1NZU1JFRyhvcDAsb3Ax
LGNybixjcm0sb3AyKSBcCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBeCgpFUlJPUjogc3BhY2UgcmVxdWlyZWQgYWZ0ZXIgdGhhdCAnLCcgKGN0eDpWeFYpCiM0
NzogRklMRTogbGludXgtaGVhZGVycy9hc20tYXJtNjQva3ZtLmg6MjExOgorI2RlZmluZSAgIEtW
TV9ERVZfQVJNX1ZHSUNfU1lTUkVHKG9wMCxvcDEsY3JuLGNybSxvcDIpIFwKICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeCgpFUlJPUjogc3BhY2UgcmVx
dWlyZWQgYWZ0ZXIgdGhhdCAnLCcgKGN0eDpWeFYpCiM0ODogRklMRTogbGludXgtaGVhZGVycy9h
c20tYXJtNjQva3ZtLmg6MjEyOgorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgX19BUk02NF9TWVNfUkVHKG9wMCxvcDEsY3JuLGNybSxvcDIpCiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXgoKRVJST1I6IHNwYWNl
IHJlcXVpcmVkIGFmdGVyIHRoYXQgJywnIChjdHg6VnhWKQojNDg6IEZJTEU6IGxpbnV4LWhlYWRl
cnMvYXNtLWFybTY0L2t2bS5oOjIxMjoKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIF9fQVJNNjRfU1lTX1JFRyhvcDAsb3AxLGNybixjcm0sb3AyKQogICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeCgpFUlJP
Ujogc3BhY2UgcmVxdWlyZWQgYWZ0ZXIgdGhhdCAnLCcgKGN0eDpWeFYpCiM0ODogRklMRTogbGlu
dXgtaGVhZGVycy9hc20tYXJtNjQva3ZtLmg6MjEyOgorICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgX19BUk02NF9TWVNfUkVHKG9wMCxvcDEsY3JuLGNybSxvcDIpCiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBeCgpFUlJPUjogc3BhY2UgcmVxdWlyZWQgYWZ0ZXIgdGhhdCAnLCcgKGN0eDpWeFYpCiM0
ODogRklMRTogbGludXgtaGVhZGVycy9hc20tYXJtNjQva3ZtLmg6MjEyOgorICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgX19BUk02NF9TWVNfUkVHKG9wMCxvcDEsY3JuLGNy
bSxvcDIpCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgXgoKdG90YWw6IDkgZXJyb3JzLCAwIHdhcm5pbmdzLCAzOCBs
aW5lcyBjaGVja2VkCgpZb3VyIHBhdGNoIGhhcyBzdHlsZSBwcm9ibGVtcywgcGxlYXNlIHJldmll
dy4gIElmIGFueSBvZiB0aGVzZSBlcnJvcnMKYXJlIGZhbHNlIHBvc2l0aXZlcyByZXBvcnQgdGhl
bSB0byB0aGUgbWFpbnRhaW5lciwgc2VlCkNIRUNLUEFUQ0ggaW4gTUFJTlRBSU5FUlMuCgpDaGVj
a2luZyBQQVRDSCAyLzI6IGh3L2ludGMvYXJtX2dpY3YzX2t2bTogSW1wbGVtZW50IGdldC9wdXQg
ZnVuY3Rpb25zLi4uCkVSUk9SOiBkbyBub3QgdXNlIEM5OSAvLyBjb21tZW50cwojMjkxOiBGSUxF
OiBody9pbnRjL2FybV9naWN2M19rdm0uYzozMDA6CisgICAgICAgIC8vIFRPRE86IHRoZXJlIGlz
IG5vIGtlcm5lbCBBUEkgZm9yIHJlYWRpbmcvd3JpdGluZyBjLT5sZXZlbAoKRVJST1I6IGRvIG5v
dCB1c2UgQzk5IC8vIGNvbW1lbnRzCiMzNDc6IEZJTEU6IGh3L2ludGMvYXJtX2dpY3YzX2t2bS5j
OjM1NjoKKyAgICAvLyBUT0RPOiB0aGVyZSBpcyBubyBrZXJuZWwgQVBJIGZvciByZWFkaW5nL3dy
aXRpbmcgcy0+bGV2ZWwKCnRvdGFsOiAyIGVycm9ycywgMCB3YXJuaW5ncywgNTEyIGxpbmVzIGNo
ZWNrZWQKCllvdXIgcGF0Y2ggaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYg
YW55IG9mIHRoZXNlIGVycm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRo
ZSBtYWludGFpbmVyLCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KCj09PSBPVVRQVVQg
RU5EID09PQoKVGVzdCBjb21tYW5kIGV4aXRlZCB3aXRoIGNvZGU6IDE=

