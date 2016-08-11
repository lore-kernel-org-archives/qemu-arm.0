Received: by 10.25.21.156 with SMTP id 28csp23945lfv;
        Thu, 11 Aug 2016 02:12:09 -0700 (PDT)
X-Received: by 10.55.92.193 with SMTP id q184mr9875996qkb.59.1470906729449;
        Thu, 11 Aug 2016 02:12:09 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w123si989179qkd.222.2016.08.11.02.12.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Aug 2016 02:12:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47019 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bXm24-0003l4-RS
	for alex.bennee@linaro.org; Thu, 11 Aug 2016 05:12:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50582)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1bXm1z-0003ht-LD
	for qemu-arm@nongnu.org; Thu, 11 Aug 2016 05:12:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1bXm1v-0006Iw-G5
	for qemu-arm@nongnu.org; Thu, 11 Aug 2016 05:12:02 -0400
Resent-Date: Thu, 11 Aug 2016 05:12:02 -0400
Resent-Message-Id: <E1bXm1v-0006Iw-G5@eggs.gnu.org>
Received: from sender163-mail.zoho.com ([74.201.84.163]:24259)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>)
	id 1bXm1v-0006Ih-6z; Thu, 11 Aug 2016 05:11:59 -0400
Received: from ex-std-node742.prod.rhcloud.com
	(ec2-52-6-146-230.compute-1.amazonaws.com [52.6.146.230]) by
	mx.zohomail.com with SMTPS id 1470906711568342.3952379032788;
	Thu, 11 Aug 2016 02:11:51 -0700 (PDT)
Message-ID: <20160811091147.482797.97532@ex-std-node742.prod.rhcloud.com>
In-Reply-To: <cover.1470905888.git.lv.zheng@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: lv.zheng@intel.com
Date: Thu, 11 Aug 2016 02:11:51 -0700 (PDT)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 74.201.84.163
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 0/2] ACPI: Add FADT revision
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
Reply-To: qemu-devel@nongnu.org
Cc: lv.zheng@intel.com, famz@redhat.com, mst@redhat.com, qemu-devel@nongnu.org,
	zetalog@gmail.com, qemu-arm@nongnu.org, shannon.zhao@linaro.org,
	imammedo@redhat.com, pbonzini@redhat.com, rth@twiddle.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kvrtbfYZhg4X

SGksCgpZb3VyIHNlcmllcyBzZWVtcyB0byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1z
LiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3JlIGluZm9ybWF0aW9uOgoKTWVzc2FnZS1pZDogY292
ZXIuMTQ3MDkwNTg4OC5naXQubHYuemhlbmdAaW50ZWwuY29tClN1YmplY3Q6IFtRZW11LWRldmVs
XSBbUEFUQ0ggdjMgMC8yXSBBQ1BJOiBBZGQgRkFEVCByZXZpc2lvbiBzdXBwb3J0ClR5cGU6IHNl
cmllcwoKPT09IFRFU1QgU0NSSVBUIEJFR0lOID09PQojIS9iaW4vYmFzaAoKQkFTRT1iYXNlCm49
MQp0b3RhbD0kKGdpdCBsb2cgLS1vbmVsaW5lICRCQVNFLi4gfCB3YyAtbCkKZmFpbGVkPTAKCmNv
bW1pdHM9IiQoZ2l0IGxvZyAtLWZvcm1hdD0lSCAtLXJldmVyc2UgJEJBU0UuLikiCmZvciBjIGlu
ICRjb21taXRzOyBkbwogICAgZWNobyAiQ2hlY2tpbmcgUEFUQ0ggJG4vJHRvdGFsOiAkKGdpdCBz
aG93IC0tbm8tcGF0Y2ggLS1mb3JtYXQ9JXMgJGMpLi4uIgogICAgaWYgISBnaXQgc2hvdyAkYyAt
LWZvcm1hdD1lbWFpbCB8IC4vc2NyaXB0cy9jaGVja3BhdGNoLnBsIC0tbWFpbGJhY2sgLTsgdGhl
bgogICAgICAgIGZhaWxlZD0xCiAgICAgICAgZWNobwogICAgZmkKICAgIG49JCgobisxKSkKZG9u
ZQoKZXhpdCAkZmFpbGVkCj09PSBURVNUIFNDUklQVCBFTkQgPT09CgpVcGRhdGluZyAzYzhjZjVh
OWMyMWZmODc4MjE2NGQxZGVmN2Y0NGJkODg4NzEzMzg0CkZyb20gaHR0cHM6Ly9naXRodWIuY29t
L3BhdGNoZXctcHJvamVjdC9xZW11CiAqIFtuZXcgdGFnXSAgICAgICAgIHBhdGNoZXcvY292ZXIu
MTQ3MDkwNTg4OC5naXQubHYuemhlbmdAaW50ZWwuY29tIC0+IHBhdGNoZXcvY292ZXIuMTQ3MDkw
NTg4OC5naXQubHYuemhlbmdAaW50ZWwuY29tClN3aXRjaGVkIHRvIGEgbmV3IGJyYW5jaCAndGVz
dCcKMTNiOGE4MCBBQ1BJOiBBZGQgLWFjcGl0YWJsZSBmYWR0PSB0byBhbGxvdyBGQURUIHJldmlz
aW9uIGNoYW5nZXMKZDM5NWM4NCBBQ1BJOiBDbGVhbnVwIC1hY3BpdGFibGUgb3B0aW9uIGNvZGUK
Cj09PSBPVVRQVVQgQkVHSU4gPT09CkNoZWNraW5nIFBBVENIIDEvMjogQUNQSTogQ2xlYW51cCAt
YWNwaXRhYmxlIG9wdGlvbiBjb2RlLi4uCkNoZWNraW5nIFBBVENIIDIvMjogQUNQSTogQWRkIC1h
Y3BpdGFibGUgZmFkdD0gdG8gYWxsb3cgRkFEVCByZXZpc2lvbiBjaGFuZ2VzLi4uCkVSUk9SOiBz
cGFjZSBwcm9oaWJpdGVkIGJldHdlZW4gZnVuY3Rpb24gbmFtZSBhbmQgb3BlbiBwYXJlbnRoZXNp
cyAnKCcKIzE1NjogRklMRTogaHcvaTM4Ni9hY3BpLWJ1aWxkLmM6MzU5OgorICAgICAgICBmYWR0
X2xlbiA9IHNpemVvZiAoQWNwaUZhZHREZXNjcmlwdG9yUmV2MSk7CgpFUlJPUjogc3BhY2UgcHJv
aGliaXRlZCBiZXR3ZWVuIGZ1bmN0aW9uIG5hbWUgYW5kIG9wZW4gcGFyZW50aGVzaXMgJygnCiMx
NTg6IEZJTEU6IGh3L2kzODYvYWNwaS1idWlsZC5jOjM2MToKKyAgICAgICAgZmFkdF9sZW4gPSBz
aXplb2YgKEFjcGlGYWR0RGVzY3JpcHRvclJldjVfMSk7Cgp0b3RhbDogMiBlcnJvcnMsIDAgd2Fy
bmluZ3MsIDE5NyBsaW5lcyBjaGVja2VkCgpZb3VyIHBhdGNoIGhhcyBzdHlsZSBwcm9ibGVtcywg
cGxlYXNlIHJldmlldy4gIElmIGFueSBvZiB0aGVzZSBlcnJvcnMKYXJlIGZhbHNlIHBvc2l0aXZl
cyByZXBvcnQgdGhlbSB0byB0aGUgbWFpbnRhaW5lciwgc2VlCkNIRUNLUEFUQ0ggaW4gTUFJTlRB
SU5FUlMuCgo9PT0gT1VUUFVUIEVORCA9PT0KClRlc3QgY29tbWFuZCBleGl0ZWQgd2l0aCBjb2Rl
OiAxCgoKLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHA6
Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBhdGNoZXctZGV2
ZWxAZnJlZWxpc3RzLm9yZw==

