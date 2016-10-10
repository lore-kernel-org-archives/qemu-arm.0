Received: by 10.80.166.35 with SMTP id d32csp579827edc;
        Mon, 10 Oct 2016 09:17:38 -0700 (PDT)
X-Received: by 10.237.37.162 with SMTP id x31mr32097659qtc.148.1476116258362;
        Mon, 10 Oct 2016 09:17:38 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w65si16403345qkg.266.2016.10.10.09.17.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 10 Oct 2016 09:17:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51207 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1btdGj-00053n-4W
	for alex.bennee@linaro.org; Mon, 10 Oct 2016 12:17:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48709)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1btdGZ-0004zV-UT
	for qemu-arm@nongnu.org; Mon, 10 Oct 2016 12:17:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1btdGU-0005k4-Jh
	for qemu-arm@nongnu.org; Mon, 10 Oct 2016 12:17:26 -0400
Resent-Date: Mon, 10 Oct 2016 12:17:26 -0400
Resent-Message-Id: <E1btdGU-0005k4-Jh@eggs.gnu.org>
Received: from sender163-mail.zoho.com ([74.201.84.163]:21448)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>)
	id 1btdGU-0005jg-CJ; Mon, 10 Oct 2016 12:17:22 -0400
Received: from ex-std-node742.prod.rhcloud.com
	(ec2-52-6-146-230.compute-1.amazonaws.com [52.6.146.230]) by
	mx.zohomail.com with SMTPS id 147611621759236.79960936783414;
	Mon, 10 Oct 2016 09:16:57 -0700 (PDT)
Message-ID: <20161010161653.498195.39878@ex-std-node742.prod.rhcloud.com>
In-Reply-To: <1475754090-22681-1-git-send-email-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: eric.auger@redhat.com
Date: Mon, 10 Oct 2016 09:16:57 -0700 (PDT)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 74.201.84.163
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v4 0/8] KVM PCI/MSI passthrough
 with mach-virt
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, famz@redhat.com,
	pranav.sawargaonkar@gmail.com, qemu-devel@nongnu.org,
	Bharat.Bhushan@freescale.com, eric.auger@redhat.com,
	alex.williamson@redhat.com, qemu-arm@nongnu.org,
	diana.craciun@freescale.com, christoffer.dall@linaro.org,
	eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: K7ojRoGtRWVt

SGksCgpZb3VyIHNlcmllcyBzZWVtcyB0byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1z
LiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3JlIGluZm9ybWF0aW9uOgoKU3ViamVjdDogW1FlbXUt
ZGV2ZWxdIFtSRkMgdjQgMC84XSBLVk0gUENJL01TSSBwYXNzdGhyb3VnaCB3aXRoIG1hY2gtdmly
dApNZXNzYWdlLWlkOiAxNDc1NzU0MDkwLTIyNjgxLTEtZ2l0LXNlbmQtZW1haWwtZXJpYy5hdWdl
ckByZWRoYXQuY29tClR5cGU6IHNlcmllcwoKPT09IFRFU1QgU0NSSVBUIEJFR0lOID09PQojIS9i
aW4vYmFzaAoKQkFTRT1iYXNlCm49MQp0b3RhbD0kKGdpdCBsb2cgLS1vbmVsaW5lICRCQVNFLi4g
fCB3YyAtbCkKZmFpbGVkPTAKCiMgVXNlZnVsIGdpdCBvcHRpb25zCmdpdCBjb25maWcgLS1sb2Nh
bCBkaWZmLnJlbmFtZWxpbWl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lcyBUcnVl
Cgpjb21taXRzPSIkKGdpdCBsb2cgLS1mb3JtYXQ9JUggLS1yZXZlcnNlICRCQVNFLi4pIgpmb3Ig
YyBpbiAkY29tbWl0czsgZG8KICAgIGVjaG8gIkNoZWNraW5nIFBBVENIICRuLyR0b3RhbDogJChn
aXQgc2hvdyAtLW5vLXBhdGNoIC0tZm9ybWF0PSVzICRjKS4uLiIKICAgIGlmICEgZ2l0IHNob3cg
JGMgLS1mb3JtYXQ9ZW1haWwgfCAuL3NjcmlwdHMvY2hlY2twYXRjaC5wbCAtLW1haWxiYWNrIC07
IHRoZW4KICAgICAgICBmYWlsZWQ9MQogICAgICAgIGVjaG8KICAgIGZpCiAgICBuPSQoKG4rMSkp
CmRvbmUKCmV4aXQgJGZhaWxlZAo9PT0gVEVTVCBTQ1JJUFQgRU5EID09PQoKVXBkYXRpbmcgM2M4
Y2Y1YTljMjFmZjg3ODIxNjRkMWRlZjdmNDRiZDg4ODcxMzM4NApTd2l0Y2hlZCB0byBhIG5ldyBi
cmFuY2ggJ3Rlc3QnCjlmYTZlNGIgaHc6IHZmaW86IGNvbW1vbjogQWRhcHQgdmZpb19saXN0ZW5l
cnMgZm9yIHJlc2VydmVkX2lvdmEgcmVnaW9uCjZmNThiOTQgaHc6IHZmaW86IGNvbW1vbjogdmZp
b19wcmVwYXJlX21zaV9tYXBwaW5nCmU3M2MxZjkgaHc6IHBsYXRmb3JtLWJ1czogRW5hYmxlIHRv
IG1hcCBhbnkgbWVtb3J5IHJlZ2lvbiBvbnRvIHRoZSBwbGF0Zm9ybS1idXMKMzEzYjQ0NSBtZW1v
cnk6IG1lbW9yeV9yZWdpb25fZmluZF9ieV9uYW1lCmFmZTNjMjEgbWVtb3J5OiBBZGQgcmVzZXJ2
ZWRfaW92YSByZWdpb24gdHlwZQo0MDNmNmEyIGh3OiB2ZmlvOiBjb21tb246IEludHJvZHVjZSB2
ZmlvX3JlZ2lzdGVyX21zaV9pb3ZhCjMwY2QyMzcgaHc6IHZmaW86IGNvbW1vbjogdmZpb19nZXRf
aW9tbXVfdHlwZTFfaW5mbwoyMmU0ZWZiIGxpbnV4LWhlYWRlcnM6IFBhcnRpYWwgdXBkYXRlIGZv
ciBNU0kgSU9WQSBoYW5kbGluZwoKPT09IE9VVFBVVCBCRUdJTiA9PT0KQ2hlY2tpbmcgUEFUQ0gg
MS84OiBsaW51eC1oZWFkZXJzOiBQYXJ0aWFsIHVwZGF0ZSBmb3IgTVNJIElPVkEgaGFuZGxpbmcu
Li4KQ2hlY2tpbmcgUEFUQ0ggMi84OiBodzogdmZpbzogY29tbW9uOiB2ZmlvX2dldF9pb21tdV90
eXBlMV9pbmZvLi4uCkNoZWNraW5nIFBBVENIIDMvODogaHc6IHZmaW86IGNvbW1vbjogSW50cm9k
dWNlIHZmaW9fcmVnaXN0ZXJfbXNpX2lvdmEuLi4KRVJST1I6IGV4dGVybnMgc2hvdWxkIGJlIGF2
b2lkZWQgaW4gLmMgZmlsZXMKIzMyOiBGSUxFOiBody92ZmlvL2NvbW1vbi5jOjIyMjoKK2ludCB2
ZmlvX3JlZ2lzdGVyX21zaV9pb3ZhKFZGSU9Db250YWluZXIgKmNvbnRhaW5lciwgaHdhZGRyIGlv
dmEsCgp0b3RhbDogMSBlcnJvcnMsIDAgd2FybmluZ3MsIDM0IGxpbmVzIGNoZWNrZWQKCllvdXIg
cGF0Y2ggaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55IG9mIHRoZXNl
IGVycm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBtYWludGFpbmVy
LCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KCkNoZWNraW5nIFBBVENIIDQvODogbWVt
b3J5OiBBZGQgcmVzZXJ2ZWRfaW92YSByZWdpb24gdHlwZS4uLgpDaGVja2luZyBQQVRDSCA1Lzg6
IG1lbW9yeTogbWVtb3J5X3JlZ2lvbl9maW5kX2J5X25hbWUuLi4KQ2hlY2tpbmcgUEFUQ0ggNi84
OiBodzogcGxhdGZvcm0tYnVzOiBFbmFibGUgdG8gbWFwIGFueSBtZW1vcnkgcmVnaW9uIG9udG8g
dGhlIHBsYXRmb3JtLWJ1cy4uLgpDaGVja2luZyBQQVRDSCA3Lzg6IGh3OiB2ZmlvOiBjb21tb246
IHZmaW9fcHJlcGFyZV9tc2lfbWFwcGluZy4uLgpDaGVja2luZyBQQVRDSCA4Lzg6IGh3OiB2Zmlv
OiBjb21tb246IEFkYXB0IHZmaW9fbGlzdGVuZXJzIGZvciByZXNlcnZlZF9pb3ZhIHJlZ2lvbi4u
Lgo9PT0gT1VUUFVUIEVORCA9PT0KClRlc3QgY29tbWFuZCBleGl0ZWQgd2l0aCBjb2RlOiAxCgoK
LS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHA6Ly9wYXRj
aGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBhdGNoZXctZGV2ZWxAZnJl
ZWxpc3RzLm9yZw==

