Received: by 10.25.0.144 with SMTP id 138csp515900lfa;
        Wed, 12 Apr 2017 16:58:44 -0700 (PDT)
X-Received: by 10.55.22.159 with SMTP id 31mr229144qkw.113.1492041524529;
        Wed, 12 Apr 2017 16:58:44 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z94si20940583qtc.333.2017.04.12.16.58.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 12 Apr 2017 16:58:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46638 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cyS9p-0006Ls-To
	for alex.bennee@linaro.org; Wed, 12 Apr 2017 19:58:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43737)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1cyS8j-0005lE-CT
	for qemu-devel@nongnu.org; Wed, 12 Apr 2017 19:57:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1cyS8g-0005ti-AY
	for qemu-devel@nongnu.org; Wed, 12 Apr 2017 19:57:33 -0400
Resent-Date: Wed, 12 Apr 2017 19:57:33 -0400
Resent-Message-Id: <E1cyS8g-0005ti-AY@eggs.gnu.org>
Received: from sender-of-o52.zoho.com ([135.84.80.217]:21312)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <no-reply@patchew.org>)
	id 1cyS8g-0005tU-2h; Wed, 12 Apr 2017 19:57:30 -0400
Received: from [172.17.0.2] (23.253.156.214 [23.253.156.214]) by
	mx.zohomail.com with SMTPS id 1492041435625627.3669671235808;
	Wed, 12 Apr 2017 16:57:15 -0700 (PDT)
Message-ID: <149204143506.10500.9312462203357418218@6c512846dbc7>
In-Reply-To: <20170408054318.19830-1-omar.rizwan@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: omar.rizwan@gmail.com
Date: Wed, 12 Apr 2017 16:57:15 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 135.84.80.217
Subject: Re: [Qemu-devel] [PATCH] raspi: Add Raspberry Pi 1 support
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
Cc: peter.maydell@linaro.org, famz@redhat.com, qemu-devel@nongnu.org,
	Andrew.Baumann@microsoft.com, qemu-arm@nongnu.org, omar.rizwan@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /GOoaMiWhMxZ

SGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1z
LiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3JlIGluZm9ybWF0aW9uOgoKTWVzc2FnZS1pZDogMjAx
NzA0MDgwNTQzMTguMTk4MzAtMS1vbWFyLnJpendhbkBnbWFpbC5jb20KU3ViamVjdDogW1FlbXUt
ZGV2ZWxdIFtQQVRDSF0gcmFzcGk6IEFkZCBSYXNwYmVycnkgUGkgMSBzdXBwb3J0ClR5cGU6IHNl
cmllcwoKPT09IFRFU1QgU0NSSVBUIEJFR0lOID09PQojIS9iaW4vYmFzaAoKQkFTRT1iYXNlCm49
MQp0b3RhbD0kKGdpdCBsb2cgLS1vbmVsaW5lICRCQVNFLi4gfCB3YyAtbCkKZmFpbGVkPTAKCiMg
VXNlZnVsIGdpdCBvcHRpb25zCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZWxpbWl0IDAK
Z2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lcyBUcnVlCgpjb21taXRzPSIkKGdpdCBsb2cg
LS1mb3JtYXQ9JUggLS1yZXZlcnNlICRCQVNFLi4pIgpmb3IgYyBpbiAkY29tbWl0czsgZG8KICAg
IGVjaG8gIkNoZWNraW5nIFBBVENIICRuLyR0b3RhbDogJChnaXQgbG9nIC1uIDEgLS1mb3JtYXQ9
JXMgJGMpLi4uIgogICAgaWYgISBnaXQgc2hvdyAkYyAtLWZvcm1hdD1lbWFpbCB8IC4vc2NyaXB0
cy9jaGVja3BhdGNoLnBsIC0tbWFpbGJhY2sgLTsgdGhlbgogICAgICAgIGZhaWxlZD0xCiAgICAg
ICAgZWNobwogICAgZmkKICAgIG49JCgobisxKSkKZG9uZQoKZXhpdCAkZmFpbGVkCj09PSBURVNU
IFNDUklQVCBFTkQgPT09CgpVcGRhdGluZyAzYzhjZjVhOWMyMWZmODc4MjE2NGQxZGVmN2Y0NGJk
ODg4NzEzMzg0ClN3aXRjaGVkIHRvIGEgbmV3IGJyYW5jaCAndGVzdCcKMDgyYmI2MSByYXNwaTog
QWRkIFJhc3BiZXJyeSBQaSAxIHN1cHBvcnQKCj09PSBPVVRQVVQgQkVHSU4gPT09CkNoZWNraW5n
IFBBVENIIDEvMTogcmFzcGk6IEFkZCBSYXNwYmVycnkgUGkgMSBzdXBwb3J0Li4uCkVSUk9SOiBs
aW5lIG92ZXIgOTAgY2hhcmFjdGVycwojMTg5OiBGSUxFOiBody9hcm0vcmFzcGkuYzozNDoKKyAq
IGh0dHBzOi8vZ2l0aHViLmNvbS9BbmRyZXdGcm9tTWVsYm91cm5lL3Jhc3BiZXJyeV9waV9yZXZp
c2lvbi9ibG9iLzI3NjRjMTk5ODNmYjdiMWVmOGNiMjEwMzFlOTRjMjkzNzAzYWZhMmUvUkVBRE1F
Lm1kCgp0b3RhbDogMSBlcnJvcnMsIDAgd2FybmluZ3MsIDI1OCBsaW5lcyBjaGVja2VkCgpZb3Vy
IHBhdGNoIGhhcyBzdHlsZSBwcm9ibGVtcywgcGxlYXNlIHJldmlldy4gIElmIGFueSBvZiB0aGVz
ZSBlcnJvcnMKYXJlIGZhbHNlIHBvc2l0aXZlcyByZXBvcnQgdGhlbSB0byB0aGUgbWFpbnRhaW5l
ciwgc2VlCkNIRUNLUEFUQ0ggaW4gTUFJTlRBSU5FUlMuCgo9PT0gT1VUUFVUIEVORCA9PT0KClRl
c3QgY29tbWFuZCBleGl0ZWQgd2l0aCBjb2RlOiAxCgoKLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRv
bWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHA6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5
b3VyIGZlZWRiYWNrIHRvIHBhdGNoZXctZGV2ZWxAZnJlZWxpc3RzLm9yZw==

