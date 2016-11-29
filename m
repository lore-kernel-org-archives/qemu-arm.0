Received: by 10.25.150.194 with SMTP id y185csp2343602lfd;
        Tue, 29 Nov 2016 05:37:26 -0800 (PST)
X-Received: by 10.55.132.4 with SMTP id g4mr23215108qkd.2.1480426646620;
        Tue, 29 Nov 2016 05:37:26 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o1si27510628qta.5.2016.11.29.05.37.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Nov 2016 05:37:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37140 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cBib7-0006AR-Cv
	for alex.bennee@linaro.org; Tue, 29 Nov 2016 08:37:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35604)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1cBib2-00069F-KA
	for qemu-arm@nongnu.org; Tue, 29 Nov 2016 08:37:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1cBiay-0000pg-LC
	for qemu-arm@nongnu.org; Tue, 29 Nov 2016 08:37:20 -0500
Resent-Date: Tue, 29 Nov 2016 08:37:20 -0500
Resent-Message-Id: <E1cBiay-0000pg-LC@eggs.gnu.org>
Received: from sender163-mail.zoho.com ([74.201.84.163]:21352)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <no-reply@patchew.org>)
	id 1cBiay-0000ou-Dq; Tue, 29 Nov 2016 08:37:16 -0500
Received: from [172.17.0.2] (23.253.156.214 [23.253.156.214]) by
	mx.zohomail.com with SMTPS id 1480426622258774.0817190518836;
	Tue, 29 Nov 2016 05:37:02 -0800 (PST)
Message-ID: <148042662061.139.8078035742561370423@5b492b8a941d>
In-Reply-To: <20161128195701.24912-1-lersek@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: lersek@redhat.com
Date: Tue, 29 Nov 2016 05:37:02 -0800 (PST)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 74.201.84.163
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-2.8 0/2] loader fixes
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
Cc: peter.maydell@linaro.org, famz@redhat.com, mst@redhat.com,
	qemu-devel@nongnu.org, alistair.francis@xilinx.com,
	michael@walle.cc, qemu-arm@nongnu.org, zhaoshenglong@huawei.com,
	pbonzini@redhat.com, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7CnFdNwBPBoE

SGksCgpZb3VyIHNlcmllcyBzZWVtcyB0byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1z
LiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3JlIGluZm9ybWF0aW9uOgoKU3ViamVjdDogW1FlbXUt
ZGV2ZWxdIFtQQVRDSCBmb3ItMi44IDAvMl0gbG9hZGVyIGZpeGVzClR5cGU6IHNlcmllcwpNZXNz
YWdlLWlkOiAyMDE2MTEyODE5NTcwMS4yNDkxMi0xLWxlcnNla0ByZWRoYXQuY29tCgo9PT0gVEVT
VCBTQ1JJUFQgQkVHSU4gPT09CiMhL2Jpbi9iYXNoCgpCQVNFPWJhc2UKbj0xCnRvdGFsPSQoZ2l0
IGxvZyAtLW9uZWxpbmUgJEJBU0UuLiB8IHdjIC1sKQpmYWlsZWQ9MAoKIyBVc2VmdWwgZ2l0IG9w
dGlvbnMKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lbGltaXQgMApnaXQgY29uZmlnIC0t
bG9jYWwgZGlmZi5yZW5hbWVzIFRydWUKCmNvbW1pdHM9IiQoZ2l0IGxvZyAtLWZvcm1hdD0lSCAt
LXJldmVyc2UgJEJBU0UuLikiCmZvciBjIGluICRjb21taXRzOyBkbwogICAgZWNobyAiQ2hlY2tp
bmcgUEFUQ0ggJG4vJHRvdGFsOiAkKGdpdCBsb2cgLW4gMSAtLWZvcm1hdD0lcyAkYykuLi4iCiAg
ICBpZiAhIGdpdCBzaG93ICRjIC0tZm9ybWF0PWVtYWlsIHwgLi9zY3JpcHRzL2NoZWNrcGF0Y2gu
cGwgLS1tYWlsYmFjayAtOyB0aGVuCiAgICAgICAgZmFpbGVkPTEKICAgICAgICBlY2hvCiAgICBm
aQogICAgbj0kKChuKzEpKQpkb25lCgpleGl0ICRmYWlsZWQKPT09IFRFU1QgU0NSSVBUIEVORCA9
PT0KClVwZGF0aW5nIDNjOGNmNWE5YzIxZmY4NzgyMTY0ZDFkZWY3ZjQ0YmQ4ODg3MTMzODQKU3dp
dGNoZWQgdG8gYSBuZXcgYnJhbmNoICd0ZXN0JwphNzAwNzA5IGxvYWRlcjogZml4IHVuZGVmaW5l
ZCBiZWhhdmlvciBpbiByb21fb3JkZXJfY29tcGFyZSgpCjU0YWUwMWIgbG9hZGVyOiBmaXggaGFu
ZGxpbmcgb2YgY3VzdG9tIGFkZHJlc3Mgc3BhY2VzIHdoZW4gYWRkaW5nIFJPTSBibG9icwoKPT09
IE9VVFBVVCBCRUdJTiA9PT0KQ2hlY2tpbmcgUEFUQ0ggMS8yOiBsb2FkZXI6IGZpeCBoYW5kbGlu
ZyBvZiBjdXN0b20gYWRkcmVzcyBzcGFjZXMgd2hlbiBhZGRpbmcgUk9NIGJsb2JzLi4uCkNoZWNr
aW5nIFBBVENIIDIvMjogbG9hZGVyOiBmaXggdW5kZWZpbmVkIGJlaGF2aW9yIGluIHJvbV9vcmRl
cl9jb21wYXJlKCkuLi4KRVJST1I6ICIoZm9vKikiIHNob3VsZCBiZSAiKGZvbyAqKSIKIzY5OiBG
SUxFOiBody9jb3JlL2xvYWRlci5jOjgyMToKKyAgICByZXR1cm4gKCh1aW50cHRyX3QpKHZvaWQq
KXJvbS0+YXMgPiAodWludHB0cl90KSh2b2lkKilpdGVtLT5hcykgfHwKCnRvdGFsOiAxIGVycm9y
cywgMCB3YXJuaW5ncywgOCBsaW5lcyBjaGVja2VkCgpZb3VyIHBhdGNoIGhhcyBzdHlsZSBwcm9i
bGVtcywgcGxlYXNlIHJldmlldy4gIElmIGFueSBvZiB0aGVzZSBlcnJvcnMKYXJlIGZhbHNlIHBv
c2l0aXZlcyByZXBvcnQgdGhlbSB0byB0aGUgbWFpbnRhaW5lciwgc2VlCkNIRUNLUEFUQ0ggaW4g
TUFJTlRBSU5FUlMuCgo9PT0gT1VUUFVUIEVORCA9PT0KClRlc3QgY29tbWFuZCBleGl0ZWQgd2l0
aCBjb2RlOiAxCgoKLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcg
W2h0dHA6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBhdGNo
ZXctZGV2ZWxAZnJlZWxpc3RzLm9yZw==

