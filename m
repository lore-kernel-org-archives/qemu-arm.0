Received: by 10.80.163.71 with SMTP id 65csp2326312edn;
        Tue, 4 Oct 2016 13:50:52 -0700 (PDT)
X-Received: by 10.55.121.67 with SMTP id u64mr6375798qkc.114.1475614252753;
        Tue, 04 Oct 2016 13:50:52 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d67si3792761qkh.88.2016.10.04.13.50.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 04 Oct 2016 13:50:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45215 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1brWfs-0001im-9g
	for alex.bennee@linaro.org; Tue, 04 Oct 2016 16:50:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46799)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1brWfn-0001iI-4J
	for qemu-arm@nongnu.org; Tue, 04 Oct 2016 16:50:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1brWfh-0004Nu-OA
	for qemu-arm@nongnu.org; Tue, 04 Oct 2016 16:50:46 -0400
Resent-Date: Tue, 04 Oct 2016 16:50:46 -0400
Resent-Message-Id: <E1brWfh-0004Nu-OA@eggs.gnu.org>
Received: from sender163-mail.zoho.com ([74.201.84.163]:21432)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>)
	id 1brWfh-0004MS-94; Tue, 04 Oct 2016 16:50:41 -0400
Received: from ex-std-node742.prod.rhcloud.com
	(ec2-52-6-146-230.compute-1.amazonaws.com [52.6.146.230]) by
	mx.zohomail.com with SMTPS id 1475614233437455.64653310905624;
	Tue, 4 Oct 2016 13:50:33 -0700 (PDT)
In-Reply-To: <1475604703-3381-1-git-send-email-rutu.shah.26@gmail.com>
Message-ID: <20161004205031.498194.11825@ex-std-node742.prod.rhcloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: rutu.shah.26@gmail.com
Date: Tue, 4 Oct 2016 13:50:33 -0700 (PDT)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 74.201.84.163
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCHv2] Reducing stack frame size in
 stream_process_mem2s()
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
Cc: famz@redhat.com, rutu.shah.26@gmail.com, stefanha@gmail.com,
	qemu-devel@nongnu.org, alistair.francis@xilinx.com, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nYn67NYBRSVd

SGksCgpZb3VyIHNlcmllcyBmYWlsZWQgYXV0b21hdGljIGJ1aWxkIHRlc3QuIFBsZWFzZSBmaW5k
IHRoZSB0ZXN0aW5nIGNvbW1hbmRzIGFuZAp0aGVpciBvdXRwdXQgYmVsb3cuIElmIHlvdSBoYXZl
IGRvY2tlciBpbnN0YWxsZWQsIHlvdSBjYW4gcHJvYmFibHkgcmVwcm9kdWNlIGl0CmxvY2FsbHku
CgpUeXBlOiBzZXJpZXMKTWVzc2FnZS1pZDogMTQ3NTYwNDcwMy0zMzgxLTEtZ2l0LXNlbmQtZW1h
aWwtcnV0dS5zaGFoLjI2QGdtYWlsLmNvbQpTdWJqZWN0OiBbUWVtdS1kZXZlbF0gW1BBVENIdjJd
IFJlZHVjaW5nIHN0YWNrIGZyYW1lIHNpemUgaW4gc3RyZWFtX3Byb2Nlc3NfbWVtMnMoKQoKPT09
IFRFU1QgU0NSSVBUIEJFR0lOID09PQojIS9iaW4vYmFzaApzZXQgLWUKZ2l0IHN1Ym1vZHVsZSB1
cGRhdGUgLS1pbml0IGR0YwojIExldCBkb2NrZXIgdGVzdHMgZHVtcCBlbnZpcm9ubWVudCBpbmZv
CmV4cG9ydCBTSE9XX0VOVj0xCm1ha2UgSj04IGRvY2tlci10ZXN0LXF1aWNrQGNlbnRvczYKbWFr
ZSBKPTggZG9ja2VyLXRlc3QtbWluZ3dAZmVkb3JhCj09PSBURVNUIFNDUklQVCBFTkQgPT09CgpV
cGRhdGluZyAzYzhjZjVhOWMyMWZmODc4MjE2NGQxZGVmN2Y0NGJkODg4NzEzMzg0ClN3aXRjaGVk
IHRvIGEgbmV3IGJyYW5jaCAndGVzdCcKNDI3NmViZiBSZWR1Y2luZyBzdGFjayBmcmFtZSBzaXpl
IGluIHN0cmVhbV9wcm9jZXNzX21lbTJzKCkKCj09PSBPVVRQVVQgQkVHSU4gPT09ClN1Ym1vZHVs
ZSAnZHRjJyAoZ2l0Oi8vZ2l0LnFlbXUtcHJvamVjdC5vcmcvZHRjLmdpdCkgcmVnaXN0ZXJlZCBm
b3IgcGF0aCAnZHRjJwpDbG9uaW5nIGludG8gJ2R0YycuLi4KU3VibW9kdWxlIHBhdGggJ2R0Yyc6
IGNoZWNrZWQgb3V0ICc2NWNjNGQyNzQ4YTJjMmU2ZjI3ZjFjZjM5ZTA3YTVkYmFiZDgwZWJmJwog
IEJVSUxEIGNlbnRvczYKICBBUkNISVZFIHFlbXUudGd6CiAgQVJDSElWRSBkdGMudGd6CiAgQ09Q
WSBSVU5ORVIKICBSVU4gdGVzdC1xdWljayBpbiBjZW50b3M2Cj09PSBPVVRQVVQgRU5EID09PQoK
QWJvcnQ6IGNvbW1hbmQgdGltZW91dCAoPjM2MDAgc2Vjb25kcykKCgotLS0KRW1haWwgZ2VuZXJh
dGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0cDovL3BhdGNoZXcub3JnL10uClBsZWFz
ZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEBmcmVlbGlzdHMub3Jn

