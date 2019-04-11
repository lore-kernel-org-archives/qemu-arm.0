Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp7036074wrx;
        Thu, 11 Apr 2019 03:59:05 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwNdJMyS+3zrBsNl/dVeHAzrCCXmDoszLTWA5wegT3J/u2N/m7yeG9J5E5dQXWtawQT1koI
X-Received: by 2002:adf:edca:: with SMTP id v10mr2205977wro.157.1554980345373;
        Thu, 11 Apr 2019 03:59:05 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n9si24177245wro.307.2019.04.11.03.59.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Apr 2019 03:59:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       arc=fail (signature failed);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:46331 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hEXQ3-0000Om-GF
	for alex.bennee@linaro.org; Thu, 11 Apr 2019 06:58:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56814)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1hEWxh-0008Cm-U5
	for qemu-arm@nongnu.org; Thu, 11 Apr 2019 06:29:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1hEWxg-00009Y-JC
	for qemu-arm@nongnu.org; Thu, 11 Apr 2019 06:29:41 -0400
Resent-Date: Thu, 11 Apr 2019 06:29:41 -0400
Resent-Message-Id: <E1hEWxg-00009Y-JC@eggs.gnu.org>
Received: from sender4-of-o55.zoho.com ([136.143.188.55]:21515)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <no-reply@patchew.org>)
	id 1hEWxY-0008Q4-Nn; Thu, 11 Apr 2019 06:29:33 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1554978531; cv=none; d=zoho.com; s=zohoarc; 
	b=KLzm4Y6Rz9lqDLs+RS3RsGP+4e1lsSN2IR4qGAAtSdS7lfgurFdfYf8L0cCQas35zHOzFhcX6r9+JEc6TIW0M5gcm85g/Vg725CDRmwszDrVmYvAfzKQQRPYVghG4qiFXjz9cYHMHjlqdmoyAETR0ta1jHIXben0eOsQAay6/IE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
	s=zohoarc; t=1554978531;
	h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To:ARC-Authentication-Results;
	bh=XYqnnWDIGInqZxEBYUKuZp3tHsFcmdpy7H8CtTLpncQ=; 
	b=RrSDqjl0naT6UFBb0n5O9THVhJEU9PiW2Unc1oxiXKjGcy9SaBaOXzyBjNr13IVJ4EkKjo491Eu5rlqpXqMy/oc/MwqIxTl5h6wRuFZe/OOYYALoC0QO3XhU3a64x2un/hOJr9I0lLImHY4LjnWeTrk1ImR1TrDqiVxfzoMwMZc=
ARC-Authentication-Results: i=1; mx.zoho.com; dkim=pass  header.i=patchew.org;
	spf=pass  smtp.mailfrom=no-reply@patchew.org;
	dmarc=pass header.from=<no-reply@patchew.org>
	header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
	mx.zohomail.com with SMTPS id 1554978526210312.8661830096032;
	Thu, 11 Apr 2019 03:28:46 -0700 (PDT)
Message-ID: <155497852263.12882.17138118894178379111@76452e4e88f2>
In-Reply-To: <20190411102025.22559-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: cohuck@redhat.com
Date: Thu, 11 Apr 2019 03:28:46 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 136.143.188.55
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-4.1] hw: add compat machines
 for 4.1
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
Cc: fam@euphon.net, peter.maydell@linaro.org, cohuck@redhat.com,
	ehabkost@redhat.com, mst@redhat.com, david@redhat.com,
	qemu-devel@nongnu.org, pasic@linux.ibm.com,
	borntraeger@de.ibm.com, qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	marcel.apfelbaum@gmail.com, pbonzini@redhat.com,
	david@gibson.dropbear.id.au, rth@twiddle.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zE+ura5Zxbu0

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDE5MDQxMTEwMjAyNS4yMjU1
OS0xLWNvaHVja0ByZWRoYXQuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIHNlZW1zIHRvIGhhdmUg
c29tZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cgZm9yCm1vcmUgaW5m
b3JtYXRpb246CgpNZXNzYWdlLWlkOiAyMDE5MDQxMTEwMjAyNS4yMjU1OS0xLWNvaHVja0ByZWRo
YXQuY29tClN1YmplY3Q6IFtRZW11LWRldmVsXSBbUEFUQ0ggZm9yLTQuMV0gaHc6IGFkZCBjb21w
YXQgbWFjaGluZXMgZm9yIDQuMQpUeXBlOiBzZXJpZXMKCj09PSBURVNUIFNDUklQVCBCRUdJTiA9
PT0KIyEvYmluL2Jhc2gKZ2l0IHJldi1wYXJzZSBiYXNlID4gL2Rldi9udWxsIHx8IGV4aXQgMApn
aXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVsaW1pdCAwCmdpdCBjb25maWcgLS1sb2NhbCBk
aWZmLnJlbmFtZXMgVHJ1ZQpnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5hbGdvcml0aG0gaGlzdG9n
cmFtCi4vc2NyaXB0cy9jaGVja3BhdGNoLnBsIC0tbWFpbGJhY2sgYmFzZS4uCj09PSBURVNUIFND
UklQVCBFTkQgPT09CgpVcGRhdGluZyAzYzhjZjVhOWMyMWZmODc4MjE2NGQxZGVmN2Y0NGJkODg4
NzEzMzg0CkZyb20gaHR0cHM6Ly9naXRodWIuY29tL3BhdGNoZXctcHJvamVjdC9xZW11CiB0IFt0
YWcgdXBkYXRlXSAgICAgICAgICAgIHBhdGNoZXcvMjAxOTAzMTUwMzI2MjkuMjEyMzQtMS1yaWNo
YXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnIC0+IHBhdGNoZXcvMjAxOTAzMTUwMzI2MjkuMjEyMzQt
MS1yaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnCiB0IFt0YWcgdXBkYXRlXSAgICAgICAgICAg
IHBhdGNoZXcvMjAxOTA0MTEwNjM0MDguMzk5OC0xLWNsZ0BrYW9kLm9yZyAtPiBwYXRjaGV3LzIw
MTkwNDExMDYzNDA4LjM5OTgtMS1jbGdAa2FvZC5vcmcKICogW25ldyB0YWddICAgICAgICAgICAg
ICAgcGF0Y2hldy8yMDE5MDQxMTA3MTczOS4yMjg4OS0xLXJpY2hhcmR3LnlhbmdAbGludXguaW50
ZWwuY29tIC0+IHBhdGNoZXcvMjAxOTA0MTEwNzE3MzkuMjI4ODktMS1yaWNoYXJkdy55YW5nQGxp
bnV4LmludGVsLmNvbQogKiBbbmV3IHRhZ10gICAgICAgICAgICAgICBwYXRjaGV3LzIwMTkwNDEx
MTAyMDI1LjIyNTU5LTEtY29odWNrQHJlZGhhdC5jb20gLT4gcGF0Y2hldy8yMDE5MDQxMTEwMjAy
NS4yMjU1OS0xLWNvaHVja0ByZWRoYXQuY29tClN3aXRjaGVkIHRvIGEgbmV3IGJyYW5jaCAndGVz
dCcKNTU3NDZkZGFlOCBodzogYWRkIGNvbXBhdCBtYWNoaW5lcyBmb3IgNC4xCgo9PT0gT1VUUFVU
IEJFR0lOID09PQpFUlJPUjogc3BhY2VzIHJlcXVpcmVkIGFyb3VuZCB0aGF0ICc9JyAoY3R4Old4
VikKIzU4OiBGSUxFOiBody9pMzg2L3BjLmM6MTE4OgorR2xvYmFsUHJvcGVydHkgcGNfY29tcGF0
XzRfMFtdID17fTsKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeCgp0b3RhbDogMSBl
cnJvcnMsIDAgd2FybmluZ3MsIDE2MCBsaW5lcyBjaGVja2VkCgpDb21taXQgNTU3NDZkZGFlOGI2
IChodzogYWRkIGNvbXBhdCBtYWNoaW5lcyBmb3IgNC4xKSBoYXMgc3R5bGUgcHJvYmxlbXMsIHBs
ZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMg
cmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5UQUlO
RVJTLgo9PT0gT1VUUFVUIEVORCA9PT0KClRlc3QgY29tbWFuZCBleGl0ZWQgd2l0aCBjb2RlOiAx
CgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8y
MDE5MDQxMTEwMjAyNS4yMjU1OS0xLWNvaHVja0ByZWRoYXQuY29tL3Rlc3RpbmcuY2hlY2twYXRj
aC8/dHlwZT1tZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0
Y2hldyBbaHR0cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRv
IHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNvbQ==

