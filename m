Received: by 10.25.21.156 with SMTP id 28csp31625lfv;
        Mon, 8 Aug 2016 07:13:39 -0700 (PDT)
X-Received: by 10.237.37.216 with SMTP id y24mr28164260qtc.58.1470665617415;
        Mon, 08 Aug 2016 07:13:37 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o11si17430833qkl.213.2016.08.08.07.13.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Aug 2016 07:13:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57692 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bWlJA-0005XP-Q9
	for alex.bennee@linaro.org; Mon, 08 Aug 2016 10:13:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45376)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1bWf5l-0002v4-4O
	for qemu-arm@nongnu.org; Mon, 08 Aug 2016 03:35:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1bWf5g-0007lP-1L
	for qemu-arm@nongnu.org; Mon, 08 Aug 2016 03:35:20 -0400
Resent-Date: Mon, 08 Aug 2016 03:35:20 -0400
Resent-Message-Id: <E1bWf5g-0007lP-1L@eggs.gnu.org>
Received: from sender163-mail.zoho.com ([74.201.84.163]:24059)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>)
	id 1bWf5f-0007lK-Nv; Mon, 08 Aug 2016 03:35:15 -0400
Received: from ex-std-node742.prod.rhcloud.com
	(ec2-52-6-146-230.compute-1.amazonaws.com [52.6.146.230]) by
	mx.zohomail.com with SMTPS id 1470641702093138.21575003454518;
	Mon, 8 Aug 2016 00:35:02 -0700 (PDT)
In-Reply-To: <409b2bbd046a53987a71e64d855e5761d441bbaf.1470641265.git.lv.zheng@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: lv.zheng@intel.com
Date: Mon, 8 Aug 2016 00:35:02 -0700 (PDT)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
Message-ID: <E1bWf5f-0007lK-Nv@eggs.gnu.org>
X-Received-From: 74.201.84.163
X-Mailman-Approved-At: Mon, 08 Aug 2016 10:11:10 -0400
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] ACPI: Add -acpifadt to allow
 FADT revision changes
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
Cc: famz@redhat.com, mst@redhat.com, qemu-devel@nongnu.org, zetalog@gmail.com,
	qemu-arm@nongnu.org, lv.zheng@intel.com, imammedo@redhat.com,
	shannon.zhao@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fu/LEv25iR3L

SGksCgpZb3VyIHNlcmllcyBzZWVtcyB0byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1z
LiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3JlIGluZm9ybWF0aW9uOgoKTWVzc2FnZS1pZDogNDA5
YjJiYmQwNDZhNTM5ODdhNzFlNjRkODU1ZTU3NjFkNDQxYmJhZi4xNDcwNjQxMjY1LmdpdC5sdi56
aGVuZ0BpbnRlbC5jb20KVHlwZTogc2VyaWVzClN1YmplY3Q6IFtRZW11LWRldmVsXSBbUEFUQ0hd
IEFDUEk6IEFkZCAtYWNwaWZhZHQgdG8gYWxsb3cgRkFEVCByZXZpc2lvbiBjaGFuZ2VzCgo9PT0g
VEVTVCBTQ1JJUFQgQkVHSU4gPT09CiMhL2Jpbi9iYXNoCgpCQVNFPWJhc2UKbj0xCnRvdGFsPSQo
Z2l0IGxvZyAtLW9uZWxpbmUgJEJBU0UuLiB8IHdjIC1sKQpmYWlsZWQ9MAoKY29tbWl0cz0iJChn
aXQgbG9nIC0tZm9ybWF0PSVIIC0tcmV2ZXJzZSAkQkFTRS4uKSIKZm9yIGMgaW4gJGNvbW1pdHM7
IGRvCiAgICBlY2hvICJDaGVja2luZyBQQVRDSCAkbi8kdG90YWw6ICQoZ2l0IHNob3cgLS1uby1w
YXRjaCAtLWZvcm1hdD0lcyAkYykuLi4iCiAgICBpZiAhIGdpdCBzaG93ICRjIC0tZm9ybWF0PWVt
YWlsIHwgLi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgLS1tYWlsYmFjayAtOyB0aGVuCiAgICAgICAg
ZmFpbGVkPTEKICAgICAgICBlY2hvCiAgICBmaQogICAgbj0kKChuKzEpKQpkb25lCgpleGl0ICRm
YWlsZWQKPT09IFRFU1QgU0NSSVBUIEVORCA9PT0KClVwZGF0aW5nIDNjOGNmNWE5YzIxZmY4Nzgy
MTY0ZDFkZWY3ZjQ0YmQ4ODg3MTMzODQKRnJvbSBodHRwczovL2dpdGh1Yi5jb20vcGF0Y2hldy1w
cm9qZWN0L3FlbXUKICogW25ldyB0YWddICAgICAgICAgcGF0Y2hldy80MDliMmJiZDA0NmE1Mzk4
N2E3MWU2NGQ4NTVlNTc2MWQ0NDFiYmFmLjE0NzA2NDEyNjUuZ2l0Lmx2LnpoZW5nQGludGVsLmNv
bSAtPiBwYXRjaGV3LzQwOWIyYmJkMDQ2YTUzOTg3YTcxZTY0ZDg1NWU1NzYxZDQ0MWJiYWYuMTQ3
MDY0MTI2NS5naXQubHYuemhlbmdAaW50ZWwuY29tCiAqIFtuZXcgdGFnXSAgICAgICAgIHBhdGNo
ZXcvNWQ0YjVlNmIxN2VhZGY5MmI2MWU5ZWY2ZjMxMThmNzY1OGJiOTlkMC4xNDcwNjQxMDI4Lmdp
dC5sdi56aGVuZ0BpbnRlbC5jb20gLT4gcGF0Y2hldy81ZDRiNWU2YjE3ZWFkZjkyYjYxZTllZjZm
MzExOGY3NjU4YmI5OWQwLjE0NzA2NDEwMjguZ2l0Lmx2LnpoZW5nQGludGVsLmNvbQpTd2l0Y2hl
ZCB0byBhIG5ldyBicmFuY2ggJ3Rlc3QnCjEwZjAxMjQgQUNQSTogQWRkIC1hY3BpZmFkdCB0byBh
bGxvdyBGQURUIHJldmlzaW9uIGNoYW5nZXMKCj09PSBPVVRQVVQgQkVHSU4gPT09CkNoZWNraW5n
IFBBVENIIDEvMTogQUNQSTogQWRkIC1hY3BpZmFkdCB0byBhbGxvdyBGQURUIHJldmlzaW9uIGNo
YW5nZXMuLi4KRVJST1I6IGNvZGUgaW5kZW50IHNob3VsZCBuZXZlciB1c2UgdGFicwojMzE6IEZJ
TEU6IGh3L2kzODYvYWNwaS1idWlsZC5jOjI4MToKK15JICB1aW50OF90IGJpdF93aWR0aCwgdWlu
dDhfdCBiaXRfb2Zmc2V0LCQKCkVSUk9SOiBjb2RlIGluZGVudCBzaG91bGQgbmV2ZXIgdXNlIHRh
YnMKIzMyOiBGSUxFOiBody9pMzg2L2FjcGktYnVpbGQuYzoyODI6CiteSSAgdWludDhfdCBhY2Nl
c3Nfd2lkdGgsIHVpbnQ2NF90IGFkZHJlc3MpJAoKRVJST1I6IHNwYWNlcyByZXF1aXJlZCBhcm91
bmQgdGhhdCAnPScgKGN0eDpWeFcpCiMzNzogRklMRTogaHcvaTM4Ni9hY3BpLWJ1aWxkLmM6Mjg3
OgorICAgIGdhcy0+YWNjZXNzX3dpZHRoPSBhY2Nlc3Nfd2lkdGg7CiAgICAgICAgICAgICAgICAg
ICAgICBeCgpXQVJOSU5HOiBjb25zaWRlciB1c2luZyBxZW11X3N0cnRvdWwgaW4gcHJlZmVyZW5j
ZSB0byBzdHJ0b3VsCiMxODc6IEZJTEU6IHZsLmM6MjMxMDoKKyAgICByZXYgPSBzdHJ0b3VsKGFy
ZywgTlVMTCwgMCk7Cgp0b3RhbDogMyBlcnJvcnMsIDEgd2FybmluZ3MsIDE2MiBsaW5lcyBjaGVj
a2VkCgpZb3VyIHBhdGNoIGhhcyBzdHlsZSBwcm9ibGVtcywgcGxlYXNlIHJldmlldy4gIElmIGFu
eSBvZiB0aGVzZSBlcnJvcnMKYXJlIGZhbHNlIHBvc2l0aXZlcyByZXBvcnQgdGhlbSB0byB0aGUg
bWFpbnRhaW5lciwgc2VlCkNIRUNLUEFUQ0ggaW4gTUFJTlRBSU5FUlMuCgo9PT0gT1VUUFVUIEVO
RCA9PT0KClRlc3QgY29tbWFuZCBleGl0ZWQgd2l0aCBjb2RlOiAx

