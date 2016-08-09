Received: by 10.25.21.156 with SMTP id 28csp283459lfv;
        Mon, 8 Aug 2016 19:33:06 -0700 (PDT)
X-Received: by 10.55.147.1 with SMTP id v1mr6674994qkd.107.1470709986744;
        Mon, 08 Aug 2016 19:33:06 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f124si9717133qkd.239.2016.08.08.19.33.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Aug 2016 19:33:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33056 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bWwqo-0005Iu-8s
	for alex.bennee@linaro.org; Mon, 08 Aug 2016 22:33:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54752)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1bWwqj-00057S-61
	for qemu-arm@nongnu.org; Mon, 08 Aug 2016 22:33:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1bWwqi-00005b-0y
	for qemu-arm@nongnu.org; Mon, 08 Aug 2016 22:33:01 -0400
Resent-Date: Mon, 08 Aug 2016 22:33:01 -0400
Resent-Message-Id: <E1bWwqi-00005b-0y@eggs.gnu.org>
Received: from sender163-mail.zoho.com ([74.201.84.163]:24799)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>)
	id 1bWwqc-0008Ui-8j; Mon, 08 Aug 2016 22:32:54 -0400
Received: from ex-std-node742.prod.rhcloud.com
	(ec2-52-6-146-230.compute-1.amazonaws.com [52.6.146.230]) by
	mx.zohomail.com with SMTPS id 1470709964988301.1563694505578;
	Mon, 8 Aug 2016 19:32:44 -0700 (PDT)
In-Reply-To: <BLU437-SMTP43591ADA801E900D4BCE81DB1C0@phx.gbl>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: chaojianhu@hotmail.com
Date: Mon, 8 Aug 2016 19:32:44 -0700 (PDT)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
Message-ID: <E1bWwqc-0008Ui-8j@eggs.gnu.org>
X-Received-From: 74.201.84.163
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw/net: Fix a heap overflow in
 xlnx.xps-ethernetlite
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
Cc: famz@redhat.com, qemu-trivial@nongnu.org, jasowang@redhat.com,
	qemu-devel@nongnu.org, alistair.francis@xilinx.com,
	qemu-arm@nongnu.org, chaojianhu@hotmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TPKXEir9WIYe

SGksCgpZb3VyIHNlcmllcyBzZWVtcyB0byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1z
LiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3JlIGluZm9ybWF0aW9uOgoKTWVzc2FnZS1pZDogQkxV
NDM3LVNNVFA0MzU5MUFEQTgwMUU5MDBENEJDRTgxREIxQzBAcGh4LmdibApUeXBlOiBzZXJpZXMK
U3ViamVjdDogW1FlbXUtZGV2ZWxdIFtQQVRDSF0gaHcvbmV0OiBGaXggYSBoZWFwIG92ZXJmbG93
IGluIHhsbngueHBzLWV0aGVybmV0bGl0ZQoKPT09IFRFU1QgU0NSSVBUIEJFR0lOID09PQojIS9i
aW4vYmFzaAoKQkFTRT1iYXNlCm49MQp0b3RhbD0kKGdpdCBsb2cgLS1vbmVsaW5lICRCQVNFLi4g
fCB3YyAtbCkKZmFpbGVkPTAKCmNvbW1pdHM9IiQoZ2l0IGxvZyAtLWZvcm1hdD0lSCAtLXJldmVy
c2UgJEJBU0UuLikiCmZvciBjIGluICRjb21taXRzOyBkbwogICAgZWNobyAiQ2hlY2tpbmcgUEFU
Q0ggJG4vJHRvdGFsOiAkKGdpdCBzaG93IC0tbm8tcGF0Y2ggLS1mb3JtYXQ9JXMgJGMpLi4uIgog
ICAgaWYgISBnaXQgc2hvdyAkYyAtLWZvcm1hdD1lbWFpbCB8IC4vc2NyaXB0cy9jaGVja3BhdGNo
LnBsIC0tbWFpbGJhY2sgLTsgdGhlbgogICAgICAgIGZhaWxlZD0xCiAgICAgICAgZWNobwogICAg
ZmkKICAgIG49JCgobisxKSkKZG9uZQoKZXhpdCAkZmFpbGVkCj09PSBURVNUIFNDUklQVCBFTkQg
PT09CgpVcGRhdGluZyAzYzhjZjVhOWMyMWZmODc4MjE2NGQxZGVmN2Y0NGJkODg4NzEzMzg0ClN3
aXRjaGVkIHRvIGEgbmV3IGJyYW5jaCAndGVzdCcKZjI5ZWRmMCBody9uZXQ6IEZpeCBhIGhlYXAg
b3ZlcmZsb3cgaW4geGxueC54cHMtZXRoZXJuZXRsaXRlCgo9PT0gT1VUUFVUIEJFR0lOID09PQpD
aGVja2luZyBQQVRDSCAxLzE6IGh3L25ldDogRml4IGEgaGVhcCBvdmVyZmxvdyBpbiB4bG54Lnhw
cy1ldGhlcm5ldGxpdGUuLi4KRVJST1I6IHNwYWNlIHByb2hpYml0ZWQgYmVmb3JlIHRoYXQgY2xv
c2UgcGFyZW50aGVzaXMgJyknCiMyNjogRklMRTogaHcvbmV0L3hpbGlueF9ldGhsaXRlLmM6MjAw
OgorICAgIGlmIChzaXplID4gKFJfTUFYIC0gUl9SWF9CVUYwIC0gcnhiYXNlKSAqIDQgKSB7CgpF
UlJPUjogTWlzc2luZyBTaWduZWQtb2ZmLWJ5OiBsaW5lKHMpCgp0b3RhbDogMiBlcnJvcnMsIDAg
d2FybmluZ3MsIDEwIGxpbmVzIGNoZWNrZWQKCllvdXIgcGF0Y2ggaGFzIHN0eWxlIHByb2JsZW1z
LCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55IG9mIHRoZXNlIGVycm9ycwphcmUgZmFsc2UgcG9zaXRp
dmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBtYWludGFpbmVyLCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlO
VEFJTkVSUy4KCj09PSBPVVRQVVQgRU5EID09PQoKVGVzdCBjb21tYW5kIGV4aXRlZCB3aXRoIGNv
ZGU6IDEKCgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0
cDovL3BhdGNoZXcub3JnL10uClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1k
ZXZlbEBmcmVlbGlzdHMub3Jn

