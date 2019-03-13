Received: by 2002:adf:fd4f:0:0:0:0:0 with SMTP id h15csp1708449wrs;
        Wed, 13 Mar 2019 07:17:38 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzlSbF8p3vwovC34Fm8KT0Bpz3VXiEKZs9N3nT0slrGK2nksoImmPKjgrdli4iUcR1PcYtD
X-Received: by 2002:a25:8b02:: with SMTP id i2mr36716573ybl.311.1552486658527;
        Wed, 13 Mar 2019 07:17:38 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g19si4941713ywk.128.2019.03.13.07.17.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Mar 2019 07:17:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       arc=fail (signature failed);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:45401 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h44hN-00027y-UO
	for alex.bennee@linaro.org; Wed, 13 Mar 2019 10:17:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53629)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1h44bc-0005gJ-Oo
	for qemu-arm@nongnu.org; Wed, 13 Mar 2019 10:11:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1h44S1-0001dp-N6
	for qemu-arm@nongnu.org; Wed, 13 Mar 2019 10:01:46 -0400
Resent-Date: Wed, 13 Mar 2019 10:01:46 -0400
Resent-Message-Id: <E1h44S1-0001dp-N6@eggs.gnu.org>
Received: from sender-of-o53.zoho.com ([135.84.80.218]:21848)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <no-reply@patchew.org>)
	id 1h44Rv-0001bj-9L; Wed, 13 Mar 2019 10:01:39 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1552485685; cv=none; d=zoho.com; s=zohoarc; 
	b=j6Y8tWlV8HyfOt1bItYRu5C+Q16xs1LpjhuJesWUeHXByYpDN3fS/+vsU3IPa5Yo5g/4qecHFm/OXNC/ZFBJrFftqkd4S2kHGIp8KxBcTdqcSJKurprZDvZXRFfc9uA/1SIG0yF+YLnt1i0F+KSQCoVKnNbxaqzowsp4b1bGjsU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
	s=zohoarc; t=1552485685;
	h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To:ARC-Authentication-Results;
	bh=e1Y+tcweYsgSuaVKyRpzVvsyuKAni8WS1XNbMANluRo=; 
	b=nB8MhdsfqpuU4W4Nd1/mZU6PG7Fe0qYtxW4ZbdWMtK56u5MCK+lLBXzwMgES5OCkpPClv6njrghbt2LzyA0us5ui8ZBYmGv4uYhcGWloMDDSgnMBVsMlO1tSvtli892W53kj8ltZkLlkiNebLUN7vrVcEGie8GgrMOJqlbk3YQY=
ARC-Authentication-Results: i=1; mx.zoho.com; dkim=pass  header.i=patchew.org;
	spf=pass  smtp.mailfrom=no-reply@patchew.org;
	dmarc=pass header.from=<no-reply@patchew.org>
	header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
	mx.zohomail.com with SMTPS id 155248568327467.36075780564056;
	Wed, 13 Mar 2019 07:01:23 -0700 (PDT)
In-Reply-To: <1552483426-3128-1-git-send-email-amir.charif@cea.fr>
Message-ID: <155248568190.8295.15557379980370109669@00e3a2c681c7>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: amir.charif@cea.fr
Date: Wed, 13 Mar 2019 07:01:23 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 135.84.80.218
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] Re-evaluate SVE vector length
 everytime ADDVL/RDVL is called
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
Cc: fam@euphon.net, amir.charif@cea.fr, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iZWPS9yOXKLW

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8xNTUyNDgzNDI2LTMxMjgtMS1n
aXQtc2VuZC1lbWFpbC1hbWlyLmNoYXJpZkBjZWEuZnIvCgoKCkhpLAoKVGhpcyBzZXJpZXMgc2Vl
bXMgdG8gaGF2ZSBzb21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxvdyBm
b3IKbW9yZSBpbmZvcm1hdGlvbjoKClR5cGU6IHNlcmllcwpNZXNzYWdlLWlkOiAxNTUyNDgzNDI2
LTMxMjgtMS1naXQtc2VuZC1lbWFpbC1hbWlyLmNoYXJpZkBjZWEuZnIKU3ViamVjdDogW1FlbXUt
ZGV2ZWxdIFtQQVRDSF0gUmUtZXZhbHVhdGUgU1ZFIHZlY3RvciBsZW5ndGggZXZlcnl0aW1lIEFE
RFZML1JEVkwgaXMgY2FsbGVkCgo9PT0gVEVTVCBTQ1JJUFQgQkVHSU4gPT09CiMhL2Jpbi9iYXNo
CmdpdCByZXYtcGFyc2UgYmFzZSA+IC9kZXYvbnVsbCB8fCBleGl0IDAKZ2l0IGNvbmZpZyAtLWxv
Y2FsIGRpZmYucmVuYW1lbGltaXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVzIFRy
dWUKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYuYWxnb3JpdGhtIGhpc3RvZ3JhbQouL3NjcmlwdHMv
Y2hlY2twYXRjaC5wbCAtLW1haWxiYWNrIGJhc2UuLgo9PT0gVEVTVCBTQ1JJUFQgRU5EID09PQoK
VXBkYXRpbmcgM2M4Y2Y1YTljMjFmZjg3ODIxNjRkMWRlZjdmNDRiZDg4ODcxMzM4NApGcm9tIGh0
dHBzOi8vZ2l0aHViLmNvbS9wYXRjaGV3LXByb2plY3QvcWVtdQogKiBbbmV3IHRhZ10gICAgICAg
ICAgICAgICBwYXRjaGV3LzE1NTI0ODM0MjYtMzEyOC0xLWdpdC1zZW5kLWVtYWlsLWFtaXIuY2hh
cmlmQGNlYS5mciAtPiBwYXRjaGV3LzE1NTI0ODM0MjYtMzEyOC0xLWdpdC1zZW5kLWVtYWlsLWFt
aXIuY2hhcmlmQGNlYS5mcgogdCBbdGFnIHVwZGF0ZV0gICAgICAgICAgICBwYXRjaGV3LzIwMTkw
MzEzMDMyMDIwLjQ5MzQtMS1kYXZpZEBnaWJzb24uZHJvcGJlYXIuaWQuYXUgLT4gcGF0Y2hldy8y
MDE5MDMxMzAzMjAyMC40OTM0LTEtZGF2aWRAZ2lic29uLmRyb3BiZWFyLmlkLmF1CiB0IFt0YWcg
dXBkYXRlXSAgICAgICAgICAgIHBhdGNoZXcvMjAxOTAzMTMxMTQ2MDQuNjAzNi0xLWNsZ0BrYW9k
Lm9yZyAtPiBwYXRjaGV3LzIwMTkwMzEzMTE0NjA0LjYwMzYtMS1jbGdAa2FvZC5vcmcKU3dpdGNo
ZWQgdG8gYSBuZXcgYnJhbmNoICd0ZXN0JwplZWVmZTdkZTdmIFJlLWV2YWx1YXRlIFNWRSB2ZWN0
b3IgbGVuZ3RoIGV2ZXJ5dGltZSBBRERWTC9SRFZMIGlzIGNhbGxlZAoKPT09IE9VVFBVVCBCRUdJ
TiA9PT0KRVJST1I6IHRyYWlsaW5nIHdoaXRlc3BhY2UKIzM1OiBGSUxFOiB0YXJnZXQvYXJtL3Ry
YW5zbGF0ZS1hNjQuYzoxMDk6CisgICAgICAgICQKCldBUk5JTkc6IEJsb2NrIGNvbW1lbnRzIHVz
ZSBhIGxlYWRpbmcgLyogb24gYSBzZXBhcmF0ZSBsaW5lCiM0NTogRklMRTogdGFyZ2V0L2FybS90
cmFuc2xhdGUtYTY0LmM6NTg3OgorLyogR2V0IGEgdGVtcG9yYXJ5IHJlZ2lzdGVyIGNvbnRhaW5p
bmcgdGhlIGN1cnJlbnQgdmVjdG9yIGxlbmd0aAoKRVJST1I6IG9wZW4gYnJhY2UgJ3snIGZvbGxv
d2luZyBmdW5jdGlvbiBkZWNsYXJhdGlvbnMgZ28gb24gdGhlIG5leHQgbGluZQojNDc6IEZJTEU6
IHRhcmdldC9hcm0vdHJhbnNsYXRlLWE2NC5jOjU4OToKK1RDR3ZfaTY0IGdldF9jcHVfdmVjX2xl
bihEaXNhc0NvbnRleHQgKnMpIHsKCnRvdGFsOiAyIGVycm9ycywgMSB3YXJuaW5ncywgNjEgbGlu
ZXMgY2hlY2tlZAoKQ29tbWl0IGVlZWZlN2RlN2Y1YyAoUmUtZXZhbHVhdGUgU1ZFIHZlY3RvciBs
ZW5ndGggZXZlcnl0aW1lIEFERFZML1JEVkwgaXMgY2FsbGVkKSBoYXMgc3R5bGUgcHJvYmxlbXMs
IHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2
ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5U
QUlORVJTLgo9PT0gT1VUUFVUIEVORCA9PT0KClRlc3QgY29tbWFuZCBleGl0ZWQgd2l0aCBjb2Rl
OiAxCgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hldy5vcmcvbG9n
cy8xNTUyNDgzNDI2LTMxMjgtMS1naXQtc2VuZC1lbWFpbC1hbWlyLmNoYXJpZkBjZWEuZnIvdGVz
dGluZy5jaGVja3BhdGNoLz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21h
dGljYWxseSBieSBQYXRjaGV3IFtodHRwOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91
ciBmZWVkYmFjayB0byBwYXRjaGV3LWRldmVsQHJlZGhhdC5jb20=

