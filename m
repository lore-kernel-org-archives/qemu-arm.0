Received: by 10.80.166.35 with SMTP id d32csp276526edc;
        Tue, 11 Oct 2016 17:58:18 -0700 (PDT)
X-Received: by 10.55.16.164 with SMTP id 36mr5745472qkq.30.1476233897997;
        Tue, 11 Oct 2016 17:58:17 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t8si2678762qkt.318.2016.10.11.17.58.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 11 Oct 2016 17:58:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58613 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bu7s9-0001eo-BN
	for alex.bennee@linaro.org; Tue, 11 Oct 2016 20:58:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34616)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1bu7rz-0001aT-Em
	for qemu-arm@nongnu.org; Tue, 11 Oct 2016 20:58:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1bu7rw-0006U4-SY
	for qemu-arm@nongnu.org; Tue, 11 Oct 2016 20:58:06 -0400
Resent-Date: Tue, 11 Oct 2016 20:58:06 -0400
Resent-Message-Id: <E1bu7rw-0006U4-SY@eggs.gnu.org>
Received: from sender163-mail.zoho.com ([74.201.84.163]:21459)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>)
	id 1bu7rw-0006Tq-JP; Tue, 11 Oct 2016 20:58:04 -0400
Received: from ex-std-node742.prod.rhcloud.com
	(ec2-52-6-146-230.compute-1.amazonaws.com [52.6.146.230]) by
	mx.zohomail.com with SMTPS id 1476233867854884.3619292407241;
	Tue, 11 Oct 2016 17:57:47 -0700 (PDT)
In-Reply-To: <1476205699-28857-1-git-send-email-peter.maydell@linaro.org>
Message-ID: <20161012005744.451919.64369@ex-std-node742.prod.rhcloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: peter.maydell@linaro.org
Date: Tue, 11 Oct 2016 17:57:47 -0700 (PDT)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 74.201.84.163
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 0/7] Runtime pagesize
 computation
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
Cc: famz@redhat.com, patches@linaro.org, Vijaya.Kumar@caviumnetworks.com,
	qemu-devel@nongnu.org, dgilbert@redhat.com, qemu-arm@nongnu.org,
	paolo@archaic.org.uk, laurent.desnogues@gmail.com, rth@twiddle.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NQ4EfqvLNO8S

SGksCgpZb3VyIHNlcmllcyBzZWVtcyB0byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1z
LiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3JlIGluZm9ybWF0aW9uOgoKTWVzc2FnZS1pZDogMTQ3
NjIwNTY5OS0yODg1Ny0xLWdpdC1zZW5kLWVtYWlsLXBldGVyLm1heWRlbGxAbGluYXJvLm9yZwpT
dWJqZWN0OiBbUWVtdS1kZXZlbF0gW1BBVENIIHYzIDAvN10gUnVudGltZSBwYWdlc2l6ZSBjb21w
dXRhdGlvbgpUeXBlOiBzZXJpZXMKCj09PSBURVNUIFNDUklQVCBCRUdJTiA9PT0KIyEvYmluL2Jh
c2gKCkJBU0U9YmFzZQpuPTEKdG90YWw9JChnaXQgbG9nIC0tb25lbGluZSAkQkFTRS4uIHwgd2Mg
LWwpCmZhaWxlZD0wCgojIFVzZWZ1bCBnaXQgb3B0aW9ucwpnaXQgY29uZmlnIC0tbG9jYWwgZGlm
Zi5yZW5hbWVsaW1pdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZXMgVHJ1ZQoKY29t
bWl0cz0iJChnaXQgbG9nIC0tZm9ybWF0PSVIIC0tcmV2ZXJzZSAkQkFTRS4uKSIKZm9yIGMgaW4g
JGNvbW1pdHM7IGRvCiAgICBlY2hvICJDaGVja2luZyBQQVRDSCAkbi8kdG90YWw6ICQoZ2l0IHNo
b3cgLS1uby1wYXRjaCAtLWZvcm1hdD0lcyAkYykuLi4iCiAgICBpZiAhIGdpdCBzaG93ICRjIC0t
Zm9ybWF0PWVtYWlsIHwgLi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgLS1tYWlsYmFjayAtOyB0aGVu
CiAgICAgICAgZmFpbGVkPTEKICAgICAgICBlY2hvCiAgICBmaQogICAgbj0kKChuKzEpKQpkb25l
CgpleGl0ICRmYWlsZWQKPT09IFRFU1QgU0NSSVBUIEVORCA9PT0KClVwZGF0aW5nIDNjOGNmNWE5
YzIxZmY4NzgyMTY0ZDFkZWY3ZjQ0YmQ4ODg3MTMzODQKU3dpdGNoZWQgdG8gYSBuZXcgYnJhbmNo
ICd0ZXN0Jwo1YTFkODliIGh3L2FybS92aXJ0OiBTZXQgbWluaW11bV9wYWdlX2JpdHMgdG8gMTIK
YzNjODVkNSB0YXJnZXQtYXJtOiBNYWtlIHBhZ2Ugc2l6ZSBhIHJ1bnRpbWUgc2V0dGluZwpiNDNh
OGIwIG1pZ3JhdGlvbi9zYXZldm0uYzogbWlncmF0ZSBub24tZGVmYXVsdCBwYWdlIHNpemUKOTk0
YTM3ZiBjcHU6IFN1cHBvcnQgYSB0YXJnZXQgQ1BVIGhhdmluZyBhIHZhcmlhYmxlIHBhZ2Ugc2l6
ZQo1NzBhZmYwIHRyYW5zbGF0ZS1hbGwuYzogQ29tcHV0ZSBMMSBwYWdlIHRhYmxlIHByb3BlcnRp
ZXMgYXQgcnVudGltZQo5ODkxNzMyIGV4ZWMuYzogUmVtb3ZlIHN0YXRpYyBhbGxvY2F0aW9uIG9m
IHN1Yl9zZWN0aW9uIG9mIHN1Yl9wYWdlCjYwYzdlNGMgbWlncmF0aW9uOiBSZW1vdmUgc3RhdGlj
IGFsbG9jYXRpb24gb2YgeHpibHJlIGNhY2hlIGJ1ZmZlcgoKPT09IE9VVFBVVCBCRUdJTiA9PT0K
Q2hlY2tpbmcgUEFUQ0ggMS83OiBtaWdyYXRpb246IFJlbW92ZSBzdGF0aWMgYWxsb2NhdGlvbiBv
ZiB4emJscmUgY2FjaGUgYnVmZmVyLi4uCkNoZWNraW5nIFBBVENIIDIvNzogZXhlYy5jOiBSZW1v
dmUgc3RhdGljIGFsbG9jYXRpb24gb2Ygc3ViX3NlY3Rpb24gb2Ygc3ViX3BhZ2UuLi4KQ2hlY2tp
bmcgUEFUQ0ggMy83OiB0cmFuc2xhdGUtYWxsLmM6IENvbXB1dGUgTDEgcGFnZSB0YWJsZSBwcm9w
ZXJ0aWVzIGF0IHJ1bnRpbWUuLi4KQ2hlY2tpbmcgUEFUQ0ggNC83OiBjcHU6IFN1cHBvcnQgYSB0
YXJnZXQgQ1BVIGhhdmluZyBhIHZhcmlhYmxlIHBhZ2Ugc2l6ZS4uLgpDaGVja2luZyBQQVRDSCA1
Lzc6IG1pZ3JhdGlvbi9zYXZldm0uYzogbWlncmF0ZSBub24tZGVmYXVsdCBwYWdlIHNpemUuLi4K
RVJST1I6IHNwYWNlcyByZXF1aXJlZCBhcm91bmQgdGhhdCAnKicgKGN0eDpWeFYpCiM5NjogRklM
RTogbWlncmF0aW9uL3NhdmV2bS5jOjM1OToKKyAgICAuc3Vic2VjdGlvbnMgPSAoY29uc3QgVk1T
dGF0ZURlc2NyaXB0aW9uKltdKSB7CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIF4KCnRvdGFsOiAxIGVycm9ycywgMCB3YXJuaW5ncywgNzkgbGluZXMgY2hlY2tl
ZAoKWW91ciBwYXRjaCBoYXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZpZXcuICBJZiBhbnkg
b2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1h
aW50YWluZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgoKQ2hlY2tpbmcgUEFUQ0gg
Ni83OiB0YXJnZXQtYXJtOiBNYWtlIHBhZ2Ugc2l6ZSBhIHJ1bnRpbWUgc2V0dGluZy4uLgpDaGVj
a2luZyBQQVRDSCA3Lzc6IGh3L2FybS92aXJ0OiBTZXQgbWluaW11bV9wYWdlX2JpdHMgdG8gMTIu
Li4KPT09IE9VVFBVVCBFTkQgPT09CgpUZXN0IGNvbW1hbmQgZXhpdGVkIHdpdGggY29kZTogMQoK
Ci0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRwOi8vcGF0
Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRjaGV3LWRldmVsQGZy
ZWVsaXN0cy5vcmc=

