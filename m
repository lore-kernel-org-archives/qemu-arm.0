Received: by 10.223.197.9 with SMTP id q9csp9060052wrf;
        Sat, 21 Oct 2017 11:13:59 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+ScDJycBE3KJb1kSMMM/lm6s4fPWdbwBBRzkiOC24UupeJolWmX7tbp3F32lemUqR0dKpk7
X-Received: by 10.55.139.70 with SMTP id n67mr12311539qkd.275.1508609639126;
        Sat, 21 Oct 2017 11:13:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508609639; cv=none;
        d=google.com; s=arc-20160816;
        b=sG9NwoVrg3Mov2dSiiHVo7bbRAOD7Cyz5V8+S375DxkK6GZRCUdiruG4aFY+Sbw4W7
         L6jApMMYQoEBtkHWdqfZ2Rw0ar4FNFpVSts0rDP07pv30U0+GZMCzqKmDJyu4l6d0yPk
         Ta0guufcj1HOk42bJDcElBMUQGL3XslnHdOkbWXheGg9BoKzlT98jCbN/K+6SEkdzFdP
         CKx9Lr6/EZKdxQInc77JWnLdh4K/Ez/DHLKA7LRklRSixGnD1vAqhm6mZ18ZV3MTssYi
         V+bqzxgItTQdTKTOuEDvztORtd2yKsQiGWfHNL4kacTmkOYXY42QJc7odoXWHYLzEEES
         u/sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject:date:to
         :from:resent-from:content-transfer-encoding:mime-version:in-reply-to
         :message-id:resent-message-id:resent-date:arc-authentication-results;
        bh=DqMrJ4H+csuEyzzGUwgca7Oftbwk/hCcsBDleHhzmRU=;
        b=ApwWpAhydV2tykJ5QD9VSgyEYLaokLV4h3d0FLf4oKPxSz89nPYqUHJ5ooRLw+fJXC
         Ft1VEvRRXzOD359p8SqZehWFU60GyKH0cX9gJvwxs211atsG3oBTaxaBxVwXsmsaGrLD
         JT65y6lewHzP17yGQeiAqBVupVJ9tlv77YYX50C36vKTyD0sfiTXUvY3tCU7WaotggJT
         aUghseZsNfY6zgD1aFB5qtlMkEENYJVowoBLstOhlTQzYOONXdZ6FLlAXzPnobsIacKP
         6O8xUdUcy8TA9W3UCJLDTzlXO++FAbiFBNA+uiEm/dBCKYKEvsgtcpvR4gWAR1tHIzRF
         R1vQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e126si2938749qkd.77.2017.10.21.11.13.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 21 Oct 2017 11:13:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58710 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e5yHU-0001Ya-S1
	for alex.bennee@linaro.org; Sat, 21 Oct 2017 14:13:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46838)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1e5yHM-0001YP-C2
	for qemu-arm@nongnu.org; Sat, 21 Oct 2017 14:13:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1e5yHJ-00071h-W4
	for qemu-arm@nongnu.org; Sat, 21 Oct 2017 14:13:48 -0400
Resent-Date: Sat, 21 Oct 2017 14:13:48 -0400
Resent-Message-Id: <E1e5yHJ-00071h-W4@eggs.gnu.org>
Received: from sender-of-o52.zoho.com ([135.84.80.217]:21401)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <no-reply@patchew.org>)
	id 1e5yHJ-00071F-OB
	for qemu-arm@nongnu.org; Sat, 21 Oct 2017 14:13:45 -0400
Received: from [172.17.0.2] (23.253.156.214 [23.253.156.214]) by
	mx.zohomail.com with SMTPS id 1508609606835887.5174873889397;
	Sat, 21 Oct 2017 11:13:26 -0700 (PDT)
Message-ID: <150860960587.476.13639554045849369874@b58463cdfd5f>
In-Reply-To: <alpine.DEB.2.10.1710211105550.27209@sstabellini-ThinkPad-X260>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: sstabellini@kernel.org
Date: Sat, 21 Oct 2017 11:13:26 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 135.84.80.217
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2] fix WFI/WFE length in
 syndrome register
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, famz@redhat.com,
	sstabellini@kernel.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vwe0BVUiUoNE

SGksCgpUaGlzIHNlcmllcyBmYWlsZWQgYXV0b21hdGljIGJ1aWxkIHRlc3QuIFBsZWFzZSBmaW5k
IHRoZSB0ZXN0aW5nIGNvbW1hbmRzIGFuZAp0aGVpciBvdXRwdXQgYmVsb3cuIElmIHlvdSBoYXZl
IGRvY2tlciBpbnN0YWxsZWQsIHlvdSBjYW4gcHJvYmFibHkgcmVwcm9kdWNlIGl0CmxvY2FsbHku
CgpUeXBlOiBzZXJpZXMKTWVzc2FnZS1pZDogYWxwaW5lLkRFQi4yLjEwLjE3MTAyMTExMDU1NTAu
MjcyMDlAc3N0YWJlbGxpbmktVGhpbmtQYWQtWDI2MApTdWJqZWN0OiBbUWVtdS1kZXZlbF0gW1BB
VENIIHYyXSBmaXggV0ZJL1dGRSBsZW5ndGggaW4gc3luZHJvbWUgcmVnaXN0ZXIKCj09PSBURVNU
IFNDUklQVCBCRUdJTiA9PT0KIyEvYmluL2Jhc2gKc2V0IC1lCmdpdCBzdWJtb2R1bGUgdXBkYXRl
IC0taW5pdCBkdGMKIyBMZXQgZG9ja2VyIHRlc3RzIGR1bXAgZW52aXJvbm1lbnQgaW5mbwpleHBv
cnQgU0hPV19FTlY9MQpleHBvcnQgSj04CnRpbWUgbWFrZSBkb2NrZXItdGVzdC1xdWlja0BjZW50
b3M2CnRpbWUgbWFrZSBkb2NrZXItdGVzdC1idWlsZEBtaW4tZ2xpYgp0aW1lIG1ha2UgZG9ja2Vy
LXRlc3QtbWluZ3dAZmVkb3JhCnRpbWUgbWFrZSBkb2NrZXItdGVzdC1ibG9ja0BmZWRvcmEKPT09
IFRFU1QgU0NSSVBUIEVORCA9PT0KClVwZGF0aW5nIDNjOGNmNWE5YzIxZmY4NzgyMTY0ZDFkZWY3
ZjQ0YmQ4ODg3MTMzODQKRnJvbSBodHRwczovL2dpdGh1Yi5jb20vcGF0Y2hldy1wcm9qZWN0L3Fl
bXUKICogW25ldyB0YWddICAgICAgICAgICAgICAgcGF0Y2hldy9hbHBpbmUuREVCLjIuMTAuMTcx
MDIxMTEwNTU1MC4yNzIwOUBzc3RhYmVsbGluaS1UaGlua1BhZC1YMjYwIC0+IHBhdGNoZXcvYWxw
aW5lLkRFQi4yLjEwLjE3MTAyMTExMDU1NTAuMjcyMDlAc3N0YWJlbGxpbmktVGhpbmtQYWQtWDI2
MApTd2l0Y2hlZCB0byBhIG5ldyBicmFuY2ggJ3Rlc3QnCmQ3MzA1ZjYzYWYgZml4IFdGSS9XRkUg
bGVuZ3RoIGluIHN5bmRyb21lIHJlZ2lzdGVyCgo9PT0gT1VUUFVUIEJFR0lOID09PQpTdWJtb2R1
bGUgJ2R0YycgKGdpdDovL2dpdC5xZW11LXByb2plY3Qub3JnL2R0Yy5naXQpIHJlZ2lzdGVyZWQg
Zm9yIHBhdGggJ2R0YycKQ2xvbmluZyBpbnRvICcvdmFyL3RtcC9wYXRjaGV3LXRlc3Rlci10bXAt
bWZpa3k3ZG8vc3JjL2R0YycuLi4KZmF0YWw6IHJlYWQgZXJyb3I6IENvbm5lY3Rpb24gcmVzZXQg
YnkgcGVlcgpmYXRhbDogY2xvbmUgb2YgJ2dpdDovL2dpdC5xZW11LXByb2plY3Qub3JnL2R0Yy5n
aXQnIGludG8gc3VibW9kdWxlIHBhdGggJy92YXIvdG1wL3BhdGNoZXctdGVzdGVyLXRtcC1tZmlr
eTdkby9zcmMvZHRjJyBmYWlsZWQKRmFpbGVkIHRvIGNsb25lICdkdGMnLiBSZXRyeSBzY2hlZHVs
ZWQKQ2xvbmluZyBpbnRvICcvdmFyL3RtcC9wYXRjaGV3LXRlc3Rlci10bXAtbWZpa3k3ZG8vc3Jj
L2R0YycuLi4KZmF0YWw6IHJlYWQgZXJyb3I6IENvbm5lY3Rpb24gcmVzZXQgYnkgcGVlcgpmYXRh
bDogY2xvbmUgb2YgJ2dpdDovL2dpdC5xZW11LXByb2plY3Qub3JnL2R0Yy5naXQnIGludG8gc3Vi
bW9kdWxlIHBhdGggJy92YXIvdG1wL3BhdGNoZXctdGVzdGVyLXRtcC1tZmlreTdkby9zcmMvZHRj
JyBmYWlsZWQKRmFpbGVkIHRvIGNsb25lICdkdGMnIGEgc2Vjb25kIHRpbWUsIGFib3J0aW5nCj09
PSBPVVRQVVQgRU5EID09PQoKVGVzdCBjb21tYW5kIGV4aXRlZCB3aXRoIGNvZGU6IDEKCgotLS0K
RW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0cDovL3BhdGNoZXcu
b3JnL10uClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEBmcmVlbGlz
dHMub3Jn

