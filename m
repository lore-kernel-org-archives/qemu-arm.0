Received: by 10.25.0.147 with SMTP id 141csp1987016lfa;
        Wed, 1 Mar 2017 10:33:52 -0800 (PST)
X-Received: by 10.200.38.72 with SMTP id v8mr12330910qtv.27.1488393232456;
        Wed, 01 Mar 2017 10:33:52 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f5si4868251qkb.239.2017.03.01.10.33.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 01 Mar 2017 10:33:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48175 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cj94P-0001uP-IV
	for alex.bennee@linaro.org; Wed, 01 Mar 2017 13:33:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60631)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1cj94I-0001sT-OF
	for qemu-arm@nongnu.org; Wed, 01 Mar 2017 13:33:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1cj94H-0002WS-PN
	for qemu-arm@nongnu.org; Wed, 01 Mar 2017 13:33:42 -0500
Resent-Date: Wed, 01 Mar 2017 13:33:42 -0500
Resent-Message-Id: <E1cj94H-0002WS-PN@eggs.gnu.org>
Received: from sender-of-o52.zoho.com ([135.84.80.217]:21321)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <no-reply@patchew.org>)
	id 1cj94C-0002Rl-ND; Wed, 01 Mar 2017 13:33:36 -0500
Received: from [172.17.0.2] (23.253.156.214 [23.253.156.214]) by
	mx.zohomail.com with SMTPS id 1488393199730556.8000333736331;
	Wed, 1 Mar 2017 10:33:19 -0800 (PST)
In-Reply-To: <20170301182618.22395-1-krzk@kernel.org>
Message-ID: <148839319906.285.10296846671880555758@0e2666bad730>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: krzk@kernel.org
Date: Wed, 1 Mar 2017 10:33:19 -0800 (PST)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 135.84.80.217
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC 0/5] hw: arm: exynos: Bring up
 secondary CPU + CPUIDLE issue
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
Cc: peter.maydell@linaro.org, famz@redhat.com, i.mitsyanko@gmail.com,
	qemu-devel@nongnu.org, krzk@kernel.org, qemu-arm@nongnu.org,
	shannon.zhao@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /iLpf2V5r65k

SGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1z
LiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3JlIGluZm9ybWF0aW9uOgoKTWVzc2FnZS1pZDogMjAx
NzAzMDExODI2MTguMjIzOTUtMS1rcnprQGtlcm5lbC5vcmcKVHlwZTogc2VyaWVzClN1YmplY3Q6
IFtRZW11LWRldmVsXSBbUkZDIDAvNV0gaHc6IGFybTogZXh5bm9zOiBCcmluZyB1cCBzZWNvbmRh
cnkgQ1BVICsgQ1BVSURMRSBpc3N1ZQoKPT09IFRFU1QgU0NSSVBUIEJFR0lOID09PQojIS9iaW4v
YmFzaAoKQkFTRT1iYXNlCm49MQp0b3RhbD0kKGdpdCBsb2cgLS1vbmVsaW5lICRCQVNFLi4gfCB3
YyAtbCkKZmFpbGVkPTAKCiMgVXNlZnVsIGdpdCBvcHRpb25zCmdpdCBjb25maWcgLS1sb2NhbCBk
aWZmLnJlbmFtZWxpbWl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lcyBUcnVlCgpj
b21taXRzPSIkKGdpdCBsb2cgLS1mb3JtYXQ9JUggLS1yZXZlcnNlICRCQVNFLi4pIgpmb3IgYyBp
biAkY29tbWl0czsgZG8KICAgIGVjaG8gIkNoZWNraW5nIFBBVENIICRuLyR0b3RhbDogJChnaXQg
bG9nIC1uIDEgLS1mb3JtYXQ9JXMgJGMpLi4uIgogICAgaWYgISBnaXQgc2hvdyAkYyAtLWZvcm1h
dD1lbWFpbCB8IC4vc2NyaXB0cy9jaGVja3BhdGNoLnBsIC0tbWFpbGJhY2sgLTsgdGhlbgogICAg
ICAgIGZhaWxlZD0xCiAgICAgICAgZWNobwogICAgZmkKICAgIG49JCgobisxKSkKZG9uZQoKZXhp
dCAkZmFpbGVkCj09PSBURVNUIFNDUklQVCBFTkQgPT09CgpVcGRhdGluZyAzYzhjZjVhOWMyMWZm
ODc4MjE2NGQxZGVmN2Y0NGJkODg4NzEzMzg0CkZyb20gaHR0cHM6Ly9naXRodWIuY29tL3BhdGNo
ZXctcHJvamVjdC9xZW11CiAqIFtuZXcgdGFnXSAgICAgICAgIHBhdGNoZXcvMjAxNzAzMDExODI2
MTguMjIzOTUtMS1rcnprQGtlcm5lbC5vcmcgLT4gcGF0Y2hldy8yMDE3MDMwMTE4MjYxOC4yMjM5
NS0xLWtyemtAa2VybmVsLm9yZwpTd2l0Y2hlZCB0byBhIG5ldyBicmFuY2ggJ3Rlc3QnCmFjYzIy
YjIgaHcvdGltZXIvZXh5bm9zNDIxMF9tY3Q6IFJlbW92ZSB1bnVzZWQgZGVmaW5lcwozMTJjM2Zj
IGh3L3RpbWVyL2V4eW5vczQyMTBfbWN0OiBGaXggY2hlY2twYXRjaCBzdHlsZSBlcnJvcnMKZmI4
OTIyNCBody90aW1lci9leHlub3M0MjEwX21jdDogQ2xlYW51cCBpbmRlbnRhdGlvbiBhbmQgZW1w
dHkgbmV3IGxpbmVzCjA0MGYzZjggaHcvaW50Yy9leHlub3M0MjEwX2dpYzogVXNlIG1vcmUgbWVh
bmluZ2Z1bCBuYW1lIGZvciBsb2NhbCB2YXJpYWJsZQoyMGFhNDIxIGh3L2ludGMvZXh5bm9zNDIx
MF9naWM6IEZpeCBHSUMgbWVtb3J5IG1hcHBpbmdzIGZvciBzZWNvbmRhcnkgQ1BVCgo9PT0gT1VU
UFVUIEJFR0lOID09PQpDaGVja2luZyBQQVRDSCAxLzU6IGh3L2ludGMvZXh5bm9zNDIxMF9naWM6
IEZpeCBHSUMgbWVtb3J5IG1hcHBpbmdzIGZvciBzZWNvbmRhcnkgQ1BVLi4uCkNoZWNraW5nIFBB
VENIIDIvNTogaHcvaW50Yy9leHlub3M0MjEwX2dpYzogVXNlIG1vcmUgbWVhbmluZ2Z1bCBuYW1l
IGZvciBsb2NhbCB2YXJpYWJsZS4uLgpDaGVja2luZyBQQVRDSCAzLzU6IGh3L3RpbWVyL2V4eW5v
czQyMTBfbWN0OiBDbGVhbnVwIGluZGVudGF0aW9uIGFuZCBlbXB0eSBuZXcgbGluZXMuLi4KRVJS
T1I6IHNwYWNlcyByZXF1aXJlZCBhcm91bmQgdGhhdCAnJicgKGN0eDpWeFYpCiM2NDogRklMRTog
aHcvdGltZXIvZXh5bm9zNDIxMF9tY3QuYzoxMTYzOgorICAgICAgICBpZiAob2Zmc2V0JjB4NCkg
ewogICAgICAgICAgICAgICAgICAgXgoKdG90YWw6IDEgZXJyb3JzLCAwIHdhcm5pbmdzLCA5MyBs
aW5lcyBjaGVja2VkCgpZb3VyIHBhdGNoIGhhcyBzdHlsZSBwcm9ibGVtcywgcGxlYXNlIHJldmll
dy4gIElmIGFueSBvZiB0aGVzZSBlcnJvcnMKYXJlIGZhbHNlIHBvc2l0aXZlcyByZXBvcnQgdGhl
bSB0byB0aGUgbWFpbnRhaW5lciwgc2VlCkNIRUNLUEFUQ0ggaW4gTUFJTlRBSU5FUlMuCgpDaGVj
a2luZyBQQVRDSCA0LzU6IGh3L3RpbWVyL2V4eW5vczQyMTBfbWN0OiBGaXggY2hlY2twYXRjaCBz
dHlsZSBlcnJvcnMuLi4KQ2hlY2tpbmcgUEFUQ0ggNS81OiBody90aW1lci9leHlub3M0MjEwX21j
dDogUmVtb3ZlIHVudXNlZCBkZWZpbmVzLi4uCj09PSBPVVRQVVQgRU5EID09PQoKVGVzdCBjb21t
YW5kIGV4aXRlZCB3aXRoIGNvZGU6IDEKCgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2Fs
bHkgYnkgUGF0Y2hldyBbaHR0cDovL3BhdGNoZXcub3JnL10uClBsZWFzZSBzZW5kIHlvdXIgZmVl
ZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEBmcmVlbGlzdHMub3Jn

