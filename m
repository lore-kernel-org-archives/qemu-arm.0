Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp592370wrp;
        Wed, 13 Feb 2019 22:01:55 -0800 (PST)
X-Google-Smtp-Source: AHgI3IaAZtn2E1laHohBp2pE9Rk7tCVn8V7CVtEOGlPYyAWBaEyogoxsXLbYDXuu7tddzS42aQRz
X-Received: by 2002:a0d:e682:: with SMTP id p124mr1544458ywe.405.1550124115248;
        Wed, 13 Feb 2019 22:01:55 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c124si895656ywf.270.2019.02.13.22.01.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Feb 2019 22:01:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       arc=fail (signature failed);
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:40821 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1guA5q-0004Ts-QD
	for alex.bennee@linaro.org; Thu, 14 Feb 2019 01:01:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34323)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1guA4X-00040v-7V
	for qemu-devel@nongnu.org; Thu, 14 Feb 2019 01:00:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1guA4Q-0001sk-O2
	for qemu-devel@nongnu.org; Thu, 14 Feb 2019 01:00:29 -0500
Resent-Date: Thu, 14 Feb 2019 01:00:27 -0500
Resent-Message-Id: <E1guA4Q-0001sk-O2@eggs.gnu.org>
Received: from sender-of-o51.zoho.com ([135.84.80.216]:21004)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <no-reply@patchew.org>)
	id 1guA4O-0001k3-JO
	for qemu-devel@nongnu.org; Thu, 14 Feb 2019 01:00:25 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1550117670; cv=none; d=zoho.com; s=zohoarc; 
	b=P/gpBBfzbjx1fPQP9wITmLNSlvxQaRwbpJ7pypR2k9JauhLQ6ksThC7tsORiUxh0woWfpGtLpRhoD8UIyq2aBLfZqkzIEr3iUELbCF0OKdF5dkASftrgsJtkBhGASaIYI6/0LPIkuh1EU+B7PIr5NQ0+nv3234Wie5P7VGcEZjM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
	s=zohoarc; t=1550117670;
	h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To:ARC-Authentication-Results;
	bh=JmLjxBLEJhrL58re+8TNvV6qWNx9VfbPTASNz+8NgG4=; 
	b=SfZvdply3xHzL0k3y403SHtDBOsFcHrIqUGvgEJK1NbMkaS9/nsHUHBNOqeQg0tAM4m1msmlOBdG/ibplW6FGEPb0ggWGxXlzpRLoelbGTmiT/CuNdjxhR0zdfIEwhEFsRGMfpjJOjmCO1/aQtG2oxU7Mftgnj4JXMQMrg3P0Ss=
ARC-Authentication-Results: i=1; mx.zoho.com; dkim=pass  header.i=patchew.org;
	spf=pass  smtp.mailfrom=no-reply@patchew.org;
	dmarc=pass header.from=<no-reply@patchew.org>
	header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
	mx.zohomail.com with SMTPS id 1550117669099118.09625453386923;
	Wed, 13 Feb 2019 20:14:29 -0800 (PST)
Message-ID: <155011766782.7770.10268841351802097380@ebba9967afc0>
In-Reply-To: <20190214034345.24722-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: richard.henderson@linaro.org
Date: Wed, 13 Feb 2019 20:14:29 -0800 (PST)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 135.84.80.216
Subject: Re: [Qemu-devel] [PATCH 0/4] target/arm: Implement ARMv8.2-FHM
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
Cc: fam@euphon.net, peter.maydell@linaro.org, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AWDJnlud5Uow

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDE5MDIxNDAzNDM0NS4yNDcy
Mi0xLXJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmcvCgoKCkhpLAoKVGhpcyBzZXJpZXMgc2Vl
bXMgdG8gaGF2ZSBzb21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxvdyBm
b3IKbW9yZSBpbmZvcm1hdGlvbjoKClN1YmplY3Q6IFtRZW11LWRldmVsXSBbUEFUQ0ggMC80XSB0
YXJnZXQvYXJtOiBJbXBsZW1lbnQgQVJNdjguMi1GSE0KVHlwZTogc2VyaWVzCk1lc3NhZ2UtaWQ6
IDIwMTkwMjE0MDM0MzQ1LjI0NzIyLTEtcmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZwoKPT09
IFRFU1QgU0NSSVBUIEJFR0lOID09PQojIS9iaW4vYmFzaApnaXQgY29uZmlnIC0tbG9jYWwgZGlm
Zi5yZW5hbWVsaW1pdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZXMgVHJ1ZQpnaXQg
Y29uZmlnIC0tbG9jYWwgZGlmZi5hbGdvcml0aG0gaGlzdG9ncmFtCi4vc2NyaXB0cy9jaGVja3Bh
dGNoLnBsIC0tbWFpbGJhY2sgYmFzZS4uCj09PSBURVNUIFNDUklQVCBFTkQgPT09CgpVcGRhdGlu
ZyAzYzhjZjVhOWMyMWZmODc4MjE2NGQxZGVmN2Y0NGJkODg4NzEzMzg0CkZyb20gaHR0cHM6Ly9n
aXRodWIuY29tL3BhdGNoZXctcHJvamVjdC9xZW11CiAqIFtuZXcgdGFnXSAgICAgICAgICAgICAg
IHBhdGNoZXcvMjAxOTAyMTQwMzQzNDUuMjQ3MjItMS1yaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8u
b3JnIC0+IHBhdGNoZXcvMjAxOTAyMTQwMzQzNDUuMjQ3MjItMS1yaWNoYXJkLmhlbmRlcnNvbkBs
aW5hcm8ub3JnClN3aXRjaGVkIHRvIGEgbmV3IGJyYW5jaCAndGVzdCcKMTBhYWQ0ZWI4MSB0YXJn
ZXQvYXJtOiBFbmFibGUgQVJNdjguMi1GSE0gZm9yIC1jcHUgbWF4CmZmOTVhODhhZTYgdGFyZ2V0
L2FybTogSW1wbGVtZW50IFZGTUFMIGFuZCBWRk1TTCBmb3IgYWFyY2gzMgo1OTg5NjNhZDQ1IHRh
cmdldC9hcm06IEltcGxlbWVudCBGTUxBTCBhbmQgRk1MU0wgZm9yIGFhcmNoNjQKNDM5OWFmZTIz
NyB0YXJnZXQvYXJtOiBBZGQgaGVscGVycyBmb3IgRk1MQUwgYW5kIEZNTFNMCgo9PT0gT1VUUFVU
IEJFR0lOID09PQoxLzQgQ2hlY2tpbmcgY29tbWl0IDQzOTlhZmUyMzdmMCAodGFyZ2V0L2FybTog
QWRkIGhlbHBlcnMgZm9yIEZNTEFMIGFuZCBGTUxTTCkKRVJST1I6IHNwYWNlcyByZXF1aXJlZCBh
cm91bmQgdGhhdCAnKicgKGN0eDpWeFYpCiMxMzA6IEZJTEU6IHRhcmdldC9hcm0vdmVjX2hlbHBl
ci5jOjg1NjoKKyAgICAgICAgZFtINChpKV0gPSBmbWxhbChkW0g0KGkpXSwgZXh0cmFjdDY0KG5f
NCwgaSoxNiwgMTYpLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgXgoKRVJST1I6IHNwYWNlcyByZXF1aXJlZCBhcm91bmQgdGhhdCAnKicgKGN0eDpW
eFYpCiMxMzE6IEZJTEU6IHRhcmdldC9hcm0vdmVjX2hlbHBlci5jOjg1NzoKKyAgICAgICAgICAg
ICAgICAgICAgICAgICBleHRyYWN0NjQobV80LCBpKjE2LCAxNiksIGZwc3QpOwogICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeCgpFUlJPUjogc3BhY2VzIHJlcXVpcmVk
IGFyb3VuZCB0aGF0ICcqJyAoY3R4OlZ4VikKIzE1MDogRklMRTogdGFyZ2V0L2FybS92ZWNfaGVs
cGVyLmM6ODc2OgorICAgICAgICBkW0g0KGkpXSA9IGZtbHNsKGRbSDQoaSldLCBleHRyYWN0NjQo
bl80LCBpKjE2LCAxNiksCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBeCgpFUlJPUjogc3BhY2VzIHJlcXVpcmVkIGFyb3VuZCB0aGF0ICcqJyAoY3R4
OlZ4VikKIzE1MTogRklMRTogdGFyZ2V0L2FybS92ZWNfaGVscGVyLmM6ODc3OgorICAgICAgICAg
ICAgICAgICAgICAgICAgIGV4dHJhY3Q2NChtXzQsIGkqMTYsIDE2KSwgZnBzdCk7CiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4KCkVSUk9SOiBzcGFjZXMgcmVxdWly
ZWQgYXJvdW5kIHRoYXQgJyonIChjdHg6VnhWKQojMTkzOiBGSUxFOiB0YXJnZXQvYXJtL3ZlY19o
ZWxwZXIuYzo5MTk6CisgICAgICAgIGRbSDQoaSldID0gZm1sc2woZFtINChpKV0sIGV4dHJhY3Q2
NChuXzQsIGkqMTYsIDE2KSwgbV8xLCBmcHN0KTsKICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIF4KCnRvdGFsOiA1IGVycm9ycywgMCB3YXJuaW5ncywg
MTcyIGxpbmVzIGNoZWNrZWQKClBhdGNoIDEvNCBoYXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFzZSBy
ZXZpZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0
IHRoZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgoK
Mi80IENoZWNraW5nIGNvbW1pdCA1OTg5NjNhZDQ1MDQgKHRhcmdldC9hcm06IEltcGxlbWVudCBG
TUxBTCBhbmQgRk1MU0wgZm9yIGFhcmNoNjQpCjMvNCBDaGVja2luZyBjb21taXQgZmY5NWE4OGFl
NjAzICh0YXJnZXQvYXJtOiBJbXBsZW1lbnQgVkZNQUwgYW5kIFZGTVNMIGZvciBhYXJjaDMyKQo0
LzQgQ2hlY2tpbmcgY29tbWl0IDEwYWFkNGViODFlOCAodGFyZ2V0L2FybTogRW5hYmxlIEFSTXY4
LjItRkhNIGZvciAtY3B1IG1heCkKPT09IE9VVFBVVCBFTkQgPT09CgpUZXN0IGNvbW1hbmQgZXhp
dGVkIHdpdGggY29kZTogMQoKClRoZSBmdWxsIGxvZyBpcyBhdmFpbGFibGUgYXQKaHR0cDovL3Bh
dGNoZXcub3JnL2xvZ3MvMjAxOTAyMTQwMzQzNDUuMjQ3MjItMS1yaWNoYXJkLmhlbmRlcnNvbkBs
aW5hcm8ub3JnL3Rlc3RpbmcuY2hlY2twYXRjaC8/dHlwZT1tZXNzYWdlLgotLS0KRW1haWwgZ2Vu
ZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0cDovL3BhdGNoZXcub3JnL10uClBs
ZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQuY29t

