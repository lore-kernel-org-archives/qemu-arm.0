Received: by 2002:a17:90a:ad88:0:0:0:0 with SMTP id s8csp6778734pjq;
        Mon, 27 May 2019 07:19:10 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzWCothCJc6f8NAGWHumG7eGwGNkqQhiooyghpRso7VVVa8+Mgrf4iiheIIymAR2OZqIE7U
X-Received: by 2002:a67:f410:: with SMTP id p16mr23978052vsn.108.1558966750152;
        Mon, 27 May 2019 07:19:10 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v11si3803998vsc.34.2019.05.27.07.19.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 27 May 2019 07:19:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       arc=fail (signature failed);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:46540 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hVGSz-0001eh-Lb
	for alex.bennee@linaro.org; Mon, 27 May 2019 10:19:09 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43743)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1hVGSe-0001cy-AA
	for qemu-arm@nongnu.org; Mon, 27 May 2019 10:18:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1hVGSc-0007Ud-9s
	for qemu-arm@nongnu.org; Mon, 27 May 2019 10:18:48 -0400
Resent-Date: Mon, 27 May 2019 10:18:47 -0400
Resent-Message-Id: <E1hVGSc-0007Ud-9s@eggs.gnu.org>
Received: from sender4-of-o59.zoho.com ([136.143.188.59]:21902)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <no-reply@patchew.org>)
	id 1hVGSa-0007T8-Mr
	for qemu-arm@nongnu.org; Mon, 27 May 2019 10:18:45 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1558960292; cv=none; d=zoho.com; s=zohoarc; 
	b=Up3mkOkZzo5yLOrPSffioIGDEAwBBGBq1SumubItra6n53rNpFGjrg6fdmdIaheHUAmYPN3peIS1eL9wfYoGcGHHQPEMIF+5L5JpaACU/Ixg99SWrdkRPvvgKh3N1D0w9YMmUyymB6f7oD7fhVkSUanDx1jEpKWzS0ygk2nCqO0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
	s=zohoarc; t=1558960292;
	h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To:ARC-Authentication-Results;
	bh=+vWsj462XklaqwLz+g3S9gUdbsUbVxmkeAhbKqPrkQM=; 
	b=nmFjI3JjU3OPHrdrH1Gir5FHwFGveoGx90iQ34vcZQEafa1X4GMeRN/c5fPzNdq6P0KpHjpbvwUsT7pLpPgZViNdfAZC/BH89FO6DrMd4msr4vRvQi55m0BkDhgKKxyisDwDfQUR543BY7GeMQ838iCBIZGq/lHQKHJ3aAGP91M=
ARC-Authentication-Results: i=1; mx.zoho.com; dkim=pass  header.i=patchew.org;
	spf=pass  smtp.mailfrom=no-reply@patchew.org;
	dmarc=pass header.from=<no-reply@patchew.org>
	header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
	mx.zohomail.com with SMTPS id 1558960291339723.0272863463014;
	Mon, 27 May 2019 05:31:31 -0700 (PDT)
In-Reply-To: <20190527114203.2762-1-eric.auger@redhat.com>
Message-ID: <155896028968.24.17330667446250277041@ce79690b2cb9>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: eric.auger@redhat.com
Date: Mon, 27 May 2019 05:31:31 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 136.143.188.59
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v4 00/27] vSMMUv3/pSMMUv3 2 stage
 VFIO integration
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, yi.l.liu@intel.com,
	mst@redhat.com, jean-philippe.brucker@arm.com,
	zhangfei.gao@foxmail.com, qemu-devel@nongnu.org,
	peterx@redhat.com, eric.auger@redhat.com,
	alex.williamson@redhat.com, qemu-arm@nongnu.org,
	vincent.stehle@arm.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IUWdNzzGPymq

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDE5MDUyNzExNDIwMy4yNzYy
LTEtZXJpYy5hdWdlckByZWRoYXQuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIGZhaWxlZCBidWls
ZCB0ZXN0IG9uIHMzOTB4IGhvc3QuIFBsZWFzZSBmaW5kIHRoZSBkZXRhaWxzIGJlbG93LgoKPT09
IFRFU1QgU0NSSVBUIEJFR0lOID09PQojIS9iaW4vYmFzaAojIFRlc3Rpbmcgc2NyaXB0IHdpbGwg
YmUgaW52b2tlZCB1bmRlciB0aGUgZ2l0IGNoZWNrb3V0IHdpdGgKIyBIRUFEIHBvaW50aW5nIHRv
IGEgY29tbWl0IHRoYXQgaGFzIHRoZSBwYXRjaGVzIGFwcGxpZWQgb24gdG9wIG9mICJiYXNlIgoj
IGJyYW5jaApzZXQgLWUKQ0M9JEhPTUUvYmluL2NjCklOU1RBTEw9JFBXRC9pbnN0YWxsCkJVSUxE
PSRQV0QvYnVpbGQKbWtkaXIgLXAgJEJVSUxEICRJTlNUQUxMClNSQz0kUFdECmNkICRCVUlMRAok
U1JDL2NvbmZpZ3VyZSAtLWNjPSRDQyAtLXByZWZpeD0kSU5TVEFMTAptYWtlIC1qNAojIFhYWDog
d2UgbmVlZCByZWxpYWJsZSBjbGVhbiB1cAojIG1ha2UgY2hlY2sgLWo0IFY9MQptYWtlIGluc3Rh
bGwKCmVjaG8KZWNobyAiPT09IEVOViA9PT0iCmVudgoKZWNobwplY2hvICI9PT0gUEFDS0FHRVMg
PT09IgpycG0gLXFhCj09PSBURVNUIFNDUklQVCBFTkQgPT09CgogIENDICAgICAgcHBjLXNvZnRt
bXUvaHcvZGlzcGxheS92Z2EubwogIENDICAgICAgbWlwcy1zb2Z0bW11L2h3L21pcHMvbWlwc19y
NGsubwovdmFyL3RtcC9wYXRjaGV3LXRlc3Rlci10bXAtb2FxZm14dTUvc3JjL2h3L3BwYy9zcGFw
cl9pb21tdS5jOiBJbiBmdW5jdGlvbiDigJhzcGFwcl90Y2VfcmVwbGF54oCZOgovdmFyL3RtcC9w
YXRjaGV3LXRlc3Rlci10bXAtb2FxZm14dTUvc3JjL2h3L3BwYy9zcGFwcl9pb21tdS5jOjE2MTox
NDogZXJyb3I6IOKAmElPTU1VTm90aWZpZXLigJkge2FrYSDigJhzdHJ1Y3QgSU9NTVVOb3RpZmll
cuKAmX0gaGFzIG5vIG1lbWJlciBuYW1lZCDigJhub3RpZnnigJkKICAxNjEgfCAgICAgICAgICAg
ICBuLT5ub3RpZnkobiwgJmlvdGxiKTsKICAgICAgfCAgICAgICAgICAgICAgXn4KbWFrZVsxXTog
KioqIFsvdmFyL3RtcC9wYXRjaGV3LXRlc3Rlci10bXAtb2FxZm14dTUvc3JjL3J1bGVzLm1hazo2
OTogaHcvcHBjL3NwYXByX2lvbW11Lm9dIEVycm9yIDEKCgpUaGUgZnVsbCBsb2cgaXMgYXZhaWxh
YmxlIGF0Cmh0dHA6Ly9wYXRjaGV3Lm9yZy9sb2dzLzIwMTkwNTI3MTE0MjAzLjI3NjItMS1lcmlj
LmF1Z2VyQHJlZGhhdC5jb20vdGVzdGluZy5zMzkweC8/dHlwZT1tZXNzYWdlLgotLS0KRW1haWwg
Z2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0cHM6Ly9wYXRjaGV3Lm9yZy9d
LgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNvbQ==

