Received: by 10.80.163.71 with SMTP id 65csp370981edn;
        Wed, 28 Sep 2016 06:39:42 -0700 (PDT)
X-Received: by 10.55.150.130 with SMTP id y124mr31077049qkd.14.1475069982609;
        Wed, 28 Sep 2016 06:39:42 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z65si5194871qke.334.2016.09.28.06.39.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 28 Sep 2016 06:39:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58912 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bpF5J-0006Vx-W6
	for alex.bennee@linaro.org; Wed, 28 Sep 2016 09:39:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35817)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1bpEhQ-0008NH-7u
	for qemu-devel@nongnu.org; Wed, 28 Sep 2016 09:15:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1bpEhN-0001bd-VN
	for qemu-devel@nongnu.org; Wed, 28 Sep 2016 09:14:59 -0400
Resent-Date: Wed, 28 Sep 2016 09:14:59 -0400
Resent-Message-Id: <E1bpEhN-0001bd-VN@eggs.gnu.org>
Received: from sender163-mail.zoho.com ([74.201.84.163]:21393)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>)
	id 1bpEhG-0001X0-Uh; Wed, 28 Sep 2016 09:14:51 -0400
Received: from ex-std-node742.prod.rhcloud.com
	(ec2-52-6-146-230.compute-1.amazonaws.com [52.6.146.230]) by
	mx.zohomail.com with SMTPS id 1475068483069888.9057550997941;
	Wed, 28 Sep 2016 06:14:43 -0700 (PDT)
Message-ID: <20160928131440.227108.70440@ex-std-node742.prod.rhcloud.com>
In-Reply-To: <1475063033-8176-1-git-send-email-vijaykumar@zilogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: vijaykumar@zilogic.com
Date: Wed, 28 Sep 2016 06:14:43 -0700 (PDT)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 74.201.84.163
Subject: Re: [Qemu-devel] [PATCH 0/2] mainstone: Fix incorrect and missed
 out keypad mappings.
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, famz@redhat.com, qemu-devel@nongnu.org,
	vijaykumar@zilogic.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: u7dFwpsZnaAA

SGksCgpZb3VyIHNlcmllcyBzZWVtcyB0byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1z
LiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3JlIGluZm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1l
c3NhZ2UtaWQ6IDE0NzUwNjMwMzMtODE3Ni0xLWdpdC1zZW5kLWVtYWlsLXZpamF5a3VtYXJAemls
b2dpYy5jb20KU3ViamVjdDogW1FlbXUtZGV2ZWxdIFtQQVRDSCAwLzJdIG1haW5zdG9uZTogRml4
IGluY29ycmVjdCBhbmQgbWlzc2VkIG91dCBrZXlwYWQgbWFwcGluZ3MuCgo9PT0gVEVTVCBTQ1JJ
UFQgQkVHSU4gPT09CiMhL2Jpbi9iYXNoCgpCQVNFPWJhc2UKbj0xCnRvdGFsPSQoZ2l0IGxvZyAt
LW9uZWxpbmUgJEJBU0UuLiB8IHdjIC1sKQpmYWlsZWQ9MAoKIyBVc2VmdWwgZ2l0IG9wdGlvbnMK
Z2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lbGltaXQgMApnaXQgY29uZmlnIC0tbG9jYWwg
ZGlmZi5yZW5hbWVzIFRydWUKCmNvbW1pdHM9IiQoZ2l0IGxvZyAtLWZvcm1hdD0lSCAtLXJldmVy
c2UgJEJBU0UuLikiCmZvciBjIGluICRjb21taXRzOyBkbwogICAgZWNobyAiQ2hlY2tpbmcgUEFU
Q0ggJG4vJHRvdGFsOiAkKGdpdCBzaG93IC0tbm8tcGF0Y2ggLS1mb3JtYXQ9JXMgJGMpLi4uIgog
ICAgaWYgISBnaXQgc2hvdyAkYyAtLWZvcm1hdD1lbWFpbCB8IC4vc2NyaXB0cy9jaGVja3BhdGNo
LnBsIC0tbWFpbGJhY2sgLTsgdGhlbgogICAgICAgIGZhaWxlZD0xCiAgICAgICAgZWNobwogICAg
ZmkKICAgIG49JCgobisxKSkKZG9uZQoKZXhpdCAkZmFpbGVkCj09PSBURVNUIFNDUklQVCBFTkQg
PT09CgpVcGRhdGluZyAzYzhjZjVhOWMyMWZmODc4MjE2NGQxZGVmN2Y0NGJkODg4NzEzMzg0ClN3
aXRjaGVkIHRvIGEgbmV3IGJyYW5jaCAndGVzdCcKYzMyNDdiZSBtYWluc3RvbmU6IEFkZCBtYXBw
aW5nIGZvciBkb3QsIHNsYXNoIGFuZCBiYWNrc3BhY2UuCjE2NzRlMjUgbWFpbnN0b25lOiBGaXgg
aW5jb3JyZWN0IGtleSBtYXBwaW5nIGZvciBFbnRlciBrZXkuCgo9PT0gT1VUUFVUIEJFR0lOID09
PQpDaGVja2luZyBQQVRDSCAxLzI6IG1haW5zdG9uZTogRml4IGluY29ycmVjdCBrZXkgbWFwcGlu
ZyBmb3IgRW50ZXIga2V5Li4uLgpFUlJPUjogc3BhY2UgcmVxdWlyZWQgYWZ0ZXIgdGhhdCAnLCcg
KGN0eDpWeFYpCiMyMzogRklMRTogaHcvYXJtL21haW5zdG9uZS5jOjkxOgorICAgIFsweDFjXSA9
IHs1LDR9LCAvKiBlbnRlciAqLwogICAgICAgICAgICAgICAgXgoKdG90YWw6IDEgZXJyb3JzLCAw
IHdhcm5pbmdzLCA4IGxpbmVzIGNoZWNrZWQKCllvdXIgcGF0Y2ggaGFzIHN0eWxlIHByb2JsZW1z
LCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55IG9mIHRoZXNlIGVycm9ycwphcmUgZmFsc2UgcG9zaXRp
dmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBtYWludGFpbmVyLCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlO
VEFJTkVSUy4KCkNoZWNraW5nIFBBVENIIDIvMjogbWFpbnN0b25lOiBBZGQgbWFwcGluZyBmb3Ig
ZG90LCBzbGFzaCBhbmQgYmFja3NwYWNlLi4uLgpFUlJPUjogc3BhY2UgcmVxdWlyZWQgYWZ0ZXIg
dGhhdCAnLCcgKGN0eDpWeFYpCiMyMTogRklMRTogaHcvYXJtL21haW5zdG9uZS5jOjc2OgorICAg
IFsweDM0XSA9IHs0LDB9LCAvKiAuICovCiAgICAgICAgICAgICAgICBeCgpFUlJPUjogc3BhY2Ug
cmVxdWlyZWQgYWZ0ZXIgdGhhdCAnLCcgKGN0eDpWeFYpCiMyNDogRklMRTogaHcvYXJtL21haW5z
dG9uZS5jOjc5OgorICAgIFsweDM1XSA9IHs0LDR9LCAvKiAvICovCiAgICAgICAgICAgICAgICBe
CgpFUlJPUjogc3BhY2UgcmVxdWlyZWQgYWZ0ZXIgdGhhdCAnLCcgKGN0eDpWeFYpCiMzMjogRklM
RTogaHcvYXJtL21haW5zdG9uZS5jOjk0OgorICAgIFsweDBlXSA9IHs1LDV9LCAvKiBiYWNrc3Bh
Y2UgKi8KICAgICAgICAgICAgICAgIF4KCnRvdGFsOiAzIGVycm9ycywgMCB3YXJuaW5ncywgMTcg
bGluZXMgY2hlY2tlZAoKWW91ciBwYXRjaCBoYXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZp
ZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRo
ZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgoKPT09
IE9VVFBVVCBFTkQgPT09CgpUZXN0IGNvbW1hbmQgZXhpdGVkIHdpdGggY29kZTogMQoKCi0tLQpF
bWFpbCBnZW5lcmF0ZWQgYXV0b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRwOi8vcGF0Y2hldy5v
cmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRjaGV3LWRldmVsQGZyZWVsaXN0
cy5vcmc=

