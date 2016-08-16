Received: by 10.25.21.156 with SMTP id 28csp2054261lfv;
        Tue, 16 Aug 2016 09:02:48 -0700 (PDT)
X-Received: by 10.129.14.213 with SMTP id 204mr27250511ywo.317.1471363368798;
        Tue, 16 Aug 2016 09:02:48 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q187si6571634ybg.90.2016.08.16.09.02.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Aug 2016 09:02:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42949 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bZgpB-0007ia-Ov
	for alex.bennee@linaro.org; Tue, 16 Aug 2016 12:02:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37630)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1bZgp3-0007ci-DO
	for qemu-arm@nongnu.org; Tue, 16 Aug 2016 12:02:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1bZgoy-0008Mf-Sa
	for qemu-arm@nongnu.org; Tue, 16 Aug 2016 12:02:36 -0400
Resent-Date: Tue, 16 Aug 2016 12:02:36 -0400
Resent-Message-Id: <E1bZgoy-0008Mf-Sa@eggs.gnu.org>
Received: from sender163-mail.zoho.com ([74.201.84.163]:24548)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>)
	id 1bZgoy-0008MJ-K7; Tue, 16 Aug 2016 12:02:32 -0400
Received: from ex-std-node742.prod.rhcloud.com
	(ec2-52-6-146-230.compute-1.amazonaws.com [52.6.146.230]) by
	mx.zohomail.com with SMTPS id 1471363329966363.5348790748925;
	Tue, 16 Aug 2016 09:02:09 -0700 (PDT)
Message-ID: <20160816160204.482798.21750@ex-std-node742.prod.rhcloud.com>
In-Reply-To: <1471348968-4614-1-git-send-email-vijay.kilari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: vijay.kilari@gmail.com
Date: Tue, 16 Aug 2016 09:02:09 -0700 (PDT)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 74.201.84.163
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC PATCH v2 0/2] Live migration
 optimization for Thunderx platform
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
Cc: peter.maydell@linaro.org, famz@redhat.com, vijay.kilari@gmail.com,
	Prasun.Kapoor@cavium.com, p.fedin@samsung.com,
	qemu-devel@nongnu.org, Vijaya.Kumar@cavium.com,
	qemu-arm@nongnu.org, pbonzini@redhat.com, rth@twiddle.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 23Ra8wmURIk1

SGksCgpZb3VyIHNlcmllcyBzZWVtcyB0byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1z
LiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3JlIGluZm9ybWF0aW9uOgoKTWVzc2FnZS1pZDogMTQ3
MTM0ODk2OC00NjE0LTEtZ2l0LXNlbmQtZW1haWwtdmlqYXkua2lsYXJpQGdtYWlsLmNvbQpTdWJq
ZWN0OiBbUWVtdS1kZXZlbF0gW1JGQyBQQVRDSCB2MiAwLzJdIExpdmUgbWlncmF0aW9uIG9wdGlt
aXphdGlvbiBmb3IgVGh1bmRlcnggcGxhdGZvcm0KVHlwZTogc2VyaWVzCgo9PT0gVEVTVCBTQ1JJ
UFQgQkVHSU4gPT09CiMhL2Jpbi9iYXNoCgpCQVNFPWJhc2UKbj0xCnRvdGFsPSQoZ2l0IGxvZyAt
LW9uZWxpbmUgJEJBU0UuLiB8IHdjIC1sKQpmYWlsZWQ9MAoKIyBVc2VmdWwgZ2l0IG9wdGlvbnMK
Z2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lbGltaXQgMApnaXQgY29uZmlnIC0tbG9jYWwg
ZGlmZi5yZW5hbWVzIFRydWUKCmNvbW1pdHM9IiQoZ2l0IGxvZyAtLWZvcm1hdD0lSCAtLXJldmVy
c2UgJEJBU0UuLikiCmZvciBjIGluICRjb21taXRzOyBkbwogICAgZWNobyAiQ2hlY2tpbmcgUEFU
Q0ggJG4vJHRvdGFsOiAkKGdpdCBzaG93IC0tbm8tcGF0Y2ggLS1mb3JtYXQ9JXMgJGMpLi4uIgog
ICAgaWYgISBnaXQgc2hvdyAkYyAtLWZvcm1hdD1lbWFpbCB8IC4vc2NyaXB0cy9jaGVja3BhdGNo
LnBsIC0tbWFpbGJhY2sgLTsgdGhlbgogICAgICAgIGZhaWxlZD0xCiAgICAgICAgZWNobwogICAg
ZmkKICAgIG49JCgobisxKSkKZG9uZQoKZXhpdCAkZmFpbGVkCj09PSBURVNUIFNDUklQVCBFTkQg
PT09CgpVcGRhdGluZyAzYzhjZjVhOWMyMWZmODc4MjE2NGQxZGVmN2Y0NGJkODg4NzEzMzg0CkZy
b20gaHR0cHM6Ly9naXRodWIuY29tL3BhdGNoZXctcHJvamVjdC9xZW11CiAqIFtuZXcgdGFnXSAg
ICAgICAgIHBhdGNoZXcvMTQ3MTM0ODYzMy0yMjE3NC0xLWdpdC1zZW5kLWVtYWlsLWVoYWJrb3N0
QHJlZGhhdC5jb20gLT4gcGF0Y2hldy8xNDcxMzQ4NjMzLTIyMTc0LTEtZ2l0LXNlbmQtZW1haWwt
ZWhhYmtvc3RAcmVkaGF0LmNvbQogKiBbbmV3IHRhZ10gICAgICAgICBwYXRjaGV3LzE0NzEzNDg5
NjgtNDYxNC0xLWdpdC1zZW5kLWVtYWlsLXZpamF5LmtpbGFyaUBnbWFpbC5jb20gLT4gcGF0Y2hl
dy8xNDcxMzQ4OTY4LTQ2MTQtMS1naXQtc2VuZC1lbWFpbC12aWpheS5raWxhcmlAZ21haWwuY29t
ClN3aXRjaGVkIHRvIGEgbmV3IGJyYW5jaCAndGVzdCcKNThhNDMxNyB1dGlsczogQWRkIHByZWZl
dGNoIGZvciBUaHVuZGVyeCBwbGF0Zm9ybQo1ODk4MDA1IHV0aWxzOiBBZGQgaGVscGVyIHRvIHJl
YWQgYXJtIE1JRFJfRUwxIHJlZ2lzdGVyCgo9PT0gT1VUUFVUIEJFR0lOID09PQpDaGVja2luZyBQ
QVRDSCAxLzI6IHV0aWxzOiBBZGQgaGVscGVyIHRvIHJlYWQgYXJtIE1JRFJfRUwxIHJlZ2lzdGVy
Li4uCkVSUk9SOiBzcGFjZSBwcm9oaWJpdGVkIGJldHdlZW4gZnVuY3Rpb24gbmFtZSBhbmQgb3Bl
biBwYXJlbnRoZXNpcyAnKCcKIzI0OiBGSUxFOiBpbmNsdWRlL3FlbXUvYWFyY2g2NC1jcHVpZC5o
OjQ6CisjaWYgZGVmaW5lZCAoX19hYXJjaDY0X18pCgpFUlJPUjogYXJjaGl0ZWN0dXJlIHNwZWNp
ZmljIGRlZmluZXMgc2hvdWxkIGJlIGF2b2lkZWQKIzI0OiBGSUxFOiBpbmNsdWRlL3FlbXUvYWFy
Y2g2NC1jcHVpZC5oOjQ6CisjaWYgZGVmaW5lZCAoX19hYXJjaDY0X18pCgpFUlJPUjogc3BhY2Ug
cHJvaGliaXRlZCBiZXR3ZWVuIGZ1bmN0aW9uIG5hbWUgYW5kIG9wZW4gcGFyZW50aGVzaXMgJygn
CiM2MjogRklMRTogdXRpbC9hYXJjaDY0LWNwdWlkLmM6MTg6CisjaWYgZGVmaW5lZCAoX19hYXJj
aDY0X18pCgpFUlJPUjogYXJjaGl0ZWN0dXJlIHNwZWNpZmljIGRlZmluZXMgc2hvdWxkIGJlIGF2
b2lkZWQKIzYyOiBGSUxFOiB1dGlsL2FhcmNoNjQtY3B1aWQuYzoxODoKKyNpZiBkZWZpbmVkIChf
X2FhcmNoNjRfXykKCldBUk5JTkc6IGxpbmUgb3ZlciA4MCBjaGFyYWN0ZXJzCiM4NjogRklMRTog
dXRpbC9hYXJjaDY0LWNwdWlkLmM6NDI6CisgICAgY29uc3QgY2hhciAqZmlsZSA9ICIvc3lzL2Rl
dmljZXMvc3lzdGVtL2NwdS9jcHUwL3JlZ3MvaWRlbnRpZmljYXRpb24vbWlkcl9lbDEiOwoKdG90
YWw6IDQgZXJyb3JzLCAxIHdhcm5pbmdzLCAxMDcgbGluZXMgY2hlY2tlZAoKWW91ciBwYXRjaCBo
YXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3Jz
CmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpD
SEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgoKQ2hlY2tpbmcgUEFUQ0ggMi8yOiB1dGlsczogQWRk
IHByZWZldGNoIGZvciBUaHVuZGVyeCBwbGF0Zm9ybS4uLgpFUlJPUjogYXJjaGl0ZWN0dXJlIHNw
ZWNpZmljIGRlZmluZXMgc2hvdWxkIGJlIGF2b2lkZWQKIzEwOTogRklMRTogdXRpbC9jdXRpbHMu
YzoyMDg6CisjaWYgZGVmaW5lZChfX2FhcmNoNjRfXykKCkVSUk9SOiBhcmNoaXRlY3R1cmUgc3Bl
Y2lmaWMgZGVmaW5lcyBzaG91bGQgYmUgYXZvaWRlZAojMTIyOiBGSUxFOiB1dGlsL2N1dGlscy5j
OjIyMToKKyNpZiBkZWZpbmVkKF9fYWFyY2g2NF9fKQoKdG90YWw6IDIgZXJyb3JzLCAwIHdhcm5p
bmdzLCA1NyBsaW5lcyBjaGVja2VkCgpZb3VyIHBhdGNoIGhhcyBzdHlsZSBwcm9ibGVtcywgcGxl
YXNlIHJldmlldy4gIElmIGFueSBvZiB0aGVzZSBlcnJvcnMKYXJlIGZhbHNlIHBvc2l0aXZlcyBy
ZXBvcnQgdGhlbSB0byB0aGUgbWFpbnRhaW5lciwgc2VlCkNIRUNLUEFUQ0ggaW4gTUFJTlRBSU5F
UlMuCgo9PT0gT1VUUFVUIEVORCA9PT0KClRlc3QgY29tbWFuZCBleGl0ZWQgd2l0aCBjb2RlOiAx
CgoKLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHA6Ly9w
YXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBhdGNoZXctZGV2ZWxA
ZnJlZWxpc3RzLm9yZw==

