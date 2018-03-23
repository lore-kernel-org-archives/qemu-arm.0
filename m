Received: by 10.28.71.155 with SMTP id m27csp1347889wmi;
        Sat, 24 Mar 2018 01:14:40 -0700 (PDT)
X-Google-Smtp-Source: AG47ELtFJs4RFO74027OLdKwtF10DEsroi9amVgz8vS76XlR/DflsTbeaQavqQl51QVTmBwEsPk8
X-Received: by 10.55.75.205 with SMTP id y196mr25161515qka.44.1521879279929;
        Sat, 24 Mar 2018 01:14:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521879279; cv=none;
        d=google.com; s=arc-20160816;
        b=UdPE50AA+ywpSKx0CPPp48G6CYM2iRiMFXadvNyfVp7CAhLXAOnvXRRfVrAI8oMs2+
         u9io+H1SRrTHZfObkT4AYIh6mG7r6SosjFdb0F3JGreQQtWGA4ZvenCgyzzbc1H+PZzG
         qgWh+xtTP7S69pdv42ji8LaXzyOdHO7wC7hBaKVkmdW/zC2bdm0jqsLuNmHLs/rqNfKD
         8RvqT0tFqqojjjJXzJWB3pbjDluuf66doJyMMuNmPcee/OMPsq4xTWz9eQgtFtVK5FTS
         xQfs6ZtlQ+pCzj2MjlXSQ/VUDRu1sXb65HppNcNy8z50BeIIncHi2kRCI95qC3rJdM6M
         TcQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject:date:to
         :from:resent-from:content-transfer-encoding:mime-version:message-id
         :in-reply-to:resent-message-id:resent-date
         :arc-authentication-results;
        bh=qkMIVXbNhtnMoEeF26nPpWdbmW695feq60Y2ydSKs8w=;
        b=FMmED+Uc4bT0/o8B1tj9Zvt49aY4cJDPkQ1x0i5yENRSLfxKPwzTEMS6a+c27dqufr
         ls3DyZaVmLtjmWDMLLW8IAcPxjUOAPFCzkxuQOt88Z28plGIxuXSgtyn60PGFdkyG4mG
         jOSDjp5Qbgv6JD5HzgU2MWt2f4OZOJ/67oGqPQhvmJLJy2cF3XUnHv+8MsZUn+zYN1jT
         mQDfPBgcLB9pT9Orn5xYdQ1f8pTX6qKcrYYTZKGiJiA2B4deLURl2c1mh2NbXNyygEcv
         igzotFC/O2A4NHJpOYso7RS4PBOX/cxH2G0JNgSII8adv5DeNmYfDWB57jZy6OO/Ju0A
         XhKg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a85si4643424qkj.366.2018.03.24.01.14.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 24 Mar 2018 01:14:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41589 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ezeJz-0004Wm-DV
	for alex.bennee@linaro.org; Sat, 24 Mar 2018 04:14:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39639)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1ezeJY-0004M0-H9
	for qemu-arm@nongnu.org; Sat, 24 Mar 2018 04:14:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1ezeJX-0000dM-AI
	for qemu-arm@nongnu.org; Sat, 24 Mar 2018 04:14:12 -0400
Resent-Date: Sat, 24 Mar 2018 04:14:12 -0400
Resent-Message-Id: <E1ezeJX-0000dM-AI@eggs.gnu.org>
Received: from sender-of-o51.zoho.com ([135.84.80.216]:21128)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <no-reply@patchew.org>)
	id 1ezeJX-0000ct-40
	for qemu-arm@nongnu.org; Sat, 24 Mar 2018 04:14:11 -0400
Received: from [172.17.0.2] (23.253.156.214 [23.253.156.214]) by
	mx.zohomail.com with SMTPS id 152182238122531.5608797995676;
	Fri, 23 Mar 2018 09:26:21 -0700 (PDT)
In-Reply-To: <20180323143202.28879-1-lvivier@redhat.com>
Message-ID: <152182237902.291.10506431455446754776@71c20359a636>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: lvivier@redhat.com
Date: Fri, 23 Mar 2018 09:26:21 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 135.84.80.216
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 0/5] coccinelle: re-run
 scripts from scripts/coccinelle
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
Cc: peter.maydell@linaro.org, mst@redhat.com, jasowang@redhat.com,
	qemu-devel@nongnu.org, agraf@suse.de, jcmvbkbc@gmail.com,
	yongbok.kim@mips.com, berto@igalia.com, qemu-block@nongnu.org,
	qemu-trivial@nongnu.org, armbru@redhat.com, rth@twiddle.net,
	lvivier@redhat.com, famz@redhat.com, ehabkost@redhat.com,
	dgilbert@redhat.com, qemu-arm@nongnu.org,
	david@gibson.dropbear.id.au, kwolf@redhat.com,
	i.mitsyanko@gmail.com, mreitz@redhat.com, qemu-ppc@nongnu.org,
	pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4b3uKUtJyYoJ

SGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1z
LiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3JlIGluZm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1l
c3NhZ2UtaWQ6IDIwMTgwMzIzMTQzMjAyLjI4ODc5LTEtbHZpdmllckByZWRoYXQuY29tClN1Ympl
Y3Q6IFtRZW11LWRldmVsXSBbUEFUQ0ggdjIgMC81XSBjb2NjaW5lbGxlOiByZS1ydW4gc2NyaXB0
cyBmcm9tIHNjcmlwdHMvY29jY2luZWxsZQoKPT09IFRFU1QgU0NSSVBUIEJFR0lOID09PQojIS9i
aW4vYmFzaAoKQkFTRT1iYXNlCm49MQp0b3RhbD0kKGdpdCBsb2cgLS1vbmVsaW5lICRCQVNFLi4g
fCB3YyAtbCkKZmFpbGVkPTAKCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZWxpbWl0IDAK
Z2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lcyBUcnVlCmdpdCBjb25maWcgLS1sb2NhbCBk
aWZmLmFsZ29yaXRobSBoaXN0b2dyYW0KCmNvbW1pdHM9IiQoZ2l0IGxvZyAtLWZvcm1hdD0lSCAt
LXJldmVyc2UgJEJBU0UuLikiCmZvciBjIGluICRjb21taXRzOyBkbwogICAgZWNobyAiQ2hlY2tp
bmcgUEFUQ0ggJG4vJHRvdGFsOiAkKGdpdCBsb2cgLW4gMSAtLWZvcm1hdD0lcyAkYykuLi4iCiAg
ICBpZiAhIGdpdCBzaG93ICRjIC0tZm9ybWF0PWVtYWlsIHwgLi9zY3JpcHRzL2NoZWNrcGF0Y2gu
cGwgLS1tYWlsYmFjayAtOyB0aGVuCiAgICAgICAgZmFpbGVkPTEKICAgICAgICBlY2hvCiAgICBm
aQogICAgbj0kKChuKzEpKQpkb25lCgpleGl0ICRmYWlsZWQKPT09IFRFU1QgU0NSSVBUIEVORCA9
PT0KClVwZGF0aW5nIDNjOGNmNWE5YzIxZmY4NzgyMTY0ZDFkZWY3ZjQ0YmQ4ODg3MTMzODQKU3dp
dGNoZWQgdG8gYSBuZXcgYnJhbmNoICd0ZXN0Jwo4NGEwZTM0YjZjIFJlbW92ZSB1bm5lY2Vzc2Fy
eSB2YXJpYWJsZXMgZm9yIGZ1bmN0aW9uIHJldHVybiB2YWx1ZQoxNzU5NDExOGRjIHFkaWN0OiBy
ZW1vdmUgdXNlbGVzcyBjYXN0CjkyZTBlNjQ2YzIgZXJyb3I6IFJlbW92ZSBOVUxMIGNoZWNrcyBv
biBlcnJvcl9wcm9wYWdhdGUoKSBjYWxscwpkMzRlZDIzMTczIGVycm9yOiBTdHJpcCB0cmFpbGlu
ZyAnXG4nIGZyb20gZXJyb3Igc3RyaW5nIGFyZ3VtZW50cyAoYWdhaW4gYWdhaW4pCmExZDE1ODFh
ZDUgbWFrZTogaW1wcm92ZSBjaGVjayBmb3Igc3RhbGUgZ2VuZXJhdGVkIGZpbGVzIGluIHNvdXJj
ZSBkaXIKCj09PSBPVVRQVVQgQkVHSU4gPT09CkNoZWNraW5nIFBBVENIIDEvNTogbWFrZTogaW1w
cm92ZSBjaGVjayBmb3Igc3RhbGUgZ2VuZXJhdGVkIGZpbGVzIGluIHNvdXJjZSBkaXIuLi4KQ2hl
Y2tpbmcgUEFUQ0ggMi81OiBlcnJvcjogU3RyaXAgdHJhaWxpbmcgJ1xuJyBmcm9tIGVycm9yIHN0
cmluZyBhcmd1bWVudHMgKGFnYWluIGFnYWluKS4uLgpDaGVja2luZyBQQVRDSCAzLzU6IGVycm9y
OiBSZW1vdmUgTlVMTCBjaGVja3Mgb24gZXJyb3JfcHJvcGFnYXRlKCkgY2FsbHMuLi4KQ2hlY2tp
bmcgUEFUQ0ggNC81OiBxZGljdDogcmVtb3ZlIHVzZWxlc3MgY2FzdC4uLgpDaGVja2luZyBQQVRD
SCA1LzU6IFJlbW92ZSB1bm5lY2Vzc2FyeSB2YXJpYWJsZXMgZm9yIGZ1bmN0aW9uIHJldHVybiB2
YWx1ZS4uLgpFUlJPUjogcmV0dXJuIGlzIG5vdCBhIGZ1bmN0aW9uLCBwYXJlbnRoZXNlcyBhcmUg
bm90IHJlcXVpcmVkCiMyNTM6IEZJTEU6IHRhcmdldC9taXBzL2RzcF9oZWxwZXIuYzozMjgxOgor
ICAgIHJldHVybiAodGVtcFsxXSA8PCA2MykgfCAodGVtcFswXSA+PiAxKTsKCkVSUk9SOiByZXR1
cm4gaXMgbm90IGEgZnVuY3Rpb24sIHBhcmVudGhlc2VzIGFyZSBub3QgcmVxdWlyZWQKIzI3Mjog
RklMRTogdGFyZ2V0L21pcHMvZHNwX2hlbHBlci5jOjMzMDg6CisgICAgcmV0dXJuICh0ZW1wWzFd
IDw8IDYzKSB8ICh0ZW1wWzBdID4+IDEpOwoKRVJST1I6IHJldHVybiBpcyBub3QgYSBmdW5jdGlv
biwgcGFyZW50aGVzZXMgYXJlIG5vdCByZXF1aXJlZAojMjkxOiBGSUxFOiB0YXJnZXQvbWlwcy9k
c3BfaGVscGVyLmM6MzM0MToKKyAgICByZXR1cm4gKHRlbXBbMV0gPDwgNjMpIHwgKHRlbXBbMF0g
Pj4gMSk7Cgp0b3RhbDogMyBlcnJvcnMsIDAgd2FybmluZ3MsIDgxNyBsaW5lcyBjaGVja2VkCgpZ
b3VyIHBhdGNoIGhhcyBzdHlsZSBwcm9ibGVtcywgcGxlYXNlIHJldmlldy4gIElmIGFueSBvZiB0
aGVzZSBlcnJvcnMKYXJlIGZhbHNlIHBvc2l0aXZlcyByZXBvcnQgdGhlbSB0byB0aGUgbWFpbnRh
aW5lciwgc2VlCkNIRUNLUEFUQ0ggaW4gTUFJTlRBSU5FUlMuCgo9PT0gT1VUUFVUIEVORCA9PT0K
ClRlc3QgY29tbWFuZCBleGl0ZWQgd2l0aCBjb2RlOiAxCgoKLS0tCkVtYWlsIGdlbmVyYXRlZCBh
dXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHA6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2Vu
ZCB5b3VyIGZlZWRiYWNrIHRvIHBhdGNoZXctZGV2ZWxAZnJlZWxpc3RzLm9yZw==

