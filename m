Received: by 10.28.71.155 with SMTP id m27csp651816wmi;
        Thu, 22 Mar 2018 11:00:23 -0700 (PDT)
X-Google-Smtp-Source: AG47ELvb90C9rAEXJWQOSFJJ7EiGT6FQ/gahblJjIqURy/dnWokbUNJy6ETdQIHEN65CvAUWJfdw
X-Received: by 10.200.68.90 with SMTP id m26mr31926604qtn.5.1521741623433;
        Thu, 22 Mar 2018 11:00:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521741623; cv=none;
        d=google.com; s=arc-20160816;
        b=WWvR2xBvIpYwRPWp4D34IzRR0FCaxniH1I3pXvzbeolE3RUgllJYgm+ino8Kdsq914
         5L/E2XgnmbpcVK7tW6J49VnhxfIwyXiwx0cWwz+pXJznPx+AGuXH+1XLnWGU31gxFLh+
         hkkHzMM77nDMOqmCMXAYCK0ocgnqL2iYeOysor2XY2ZLipLrSP+4TRNF+MtrhIOiJ/9+
         rBaMDxEIfWnI8B7FUJ8qnXZaOQFx4QrP3jRfjXxdlJ67K2AC3DiFvWy4MM5ZSd+B2iI2
         scJwgirkVp18VI0Tz7BpjWAuysSXJbovi7mLJdUPwFdoTjTv9iikYILPjlRa3S0Z+QSl
         KJSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject:date:to
         :from:resent-from:content-transfer-encoding:mime-version:message-id
         :in-reply-to:resent-message-id:resent-date
         :arc-authentication-results;
        bh=+dZUsVIjZX2DQNgwNjjZbdGmxlKpkJT+qT3gku4qWL4=;
        b=KnXY6JSiPSn44cugfFsVXMupYB6nQXeMeZfNlU4n99CLPcDSpfiwQea0P6QXGQVMMi
         eqpicYxWCtOnrxqhpWXjwjDNIrsa3Cxf//0fK+kOLUlfLNNqQujcoUGWMVpRS8AzKaqb
         SxitoctWqHtsbo5EYe0zNmwjjYfRqrzTgSo9WBcGrB7qZGvBnJHsd8bwAr8hkvuRLb3f
         DQdUbgIirY7MSzoUEx76BWE5gqaI2L/xLUWdq7ZWe77fU9ZHZhKNMFr4rPZKKNN/YgHj
         PoATdsMdXmBY6uQSC0vXolq8HNMwpsqXaK44MrxdGKa5ZOMndGAkVpZcM6YyaKRsEyhZ
         Gq+g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l124si1226456qkc.285.2018.03.22.11.00.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Mar 2018 11:00:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34036 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ez4Vi-0005ak-Uw
	for alex.bennee@linaro.org; Thu, 22 Mar 2018 14:00:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47818)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1ez4VU-0005Sz-SR
	for qemu-arm@nongnu.org; Thu, 22 Mar 2018 14:00:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1ez4VP-0004Yf-62
	for qemu-arm@nongnu.org; Thu, 22 Mar 2018 14:00:08 -0400
Resent-Date: Thu, 22 Mar 2018 14:00:08 -0400
Resent-Message-Id: <E1ez4VP-0004Yf-62@eggs.gnu.org>
Received: from sender-of-o51.zoho.com ([135.84.80.216]:21050)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <no-reply@patchew.org>)
	id 1ez4V8-0004IY-KW; Thu, 22 Mar 2018 13:59:46 -0400
Received: from [172.17.0.2] (23.253.156.214 [23.253.156.214]) by
	mx.zohomail.com with SMTPS id 1521741460598621.2674785906428;
	Thu, 22 Mar 2018 10:57:40 -0700 (PDT)
In-Reply-To: <20180322161226.29796-1-lvivier@redhat.com>
Message-ID: <152174145840.240.3926671265619235661@71c20359a636>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: lvivier@redhat.com
Date: Thu, 22 Mar 2018 10:57:40 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 135.84.80.216
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 0/4] coccinelle: re-run scripts
 from scripts/coccinelle
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
	qemu-trivial@nongnu.org, armbru@redhat.com,
	david@gibson.dropbear.id.au, lvivier@redhat.com, famz@redhat.com,
	ehabkost@redhat.com, dgilbert@redhat.com, qemu-arm@nongnu.org,
	rth@twiddle.net, kwolf@redhat.com, i.mitsyanko@gmail.com,
	mreitz@redhat.com, qemu-ppc@nongnu.org, pbonzini@redhat.com,
	aurelien@aurel32.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JgyC5KpQkXc8

SGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1z
LiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3JlIGluZm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1l
c3NhZ2UtaWQ6IDIwMTgwMzIyMTYxMjI2LjI5Nzk2LTEtbHZpdmllckByZWRoYXQuY29tClN1Ympl
Y3Q6IFtRZW11LWRldmVsXSBbUEFUQ0ggMC80XSBjb2NjaW5lbGxlOiByZS1ydW4gc2NyaXB0cyBm
cm9tIHNjcmlwdHMvY29jY2luZWxsZQoKPT09IFRFU1QgU0NSSVBUIEJFR0lOID09PQojIS9iaW4v
YmFzaAoKQkFTRT1iYXNlCm49MQp0b3RhbD0kKGdpdCBsb2cgLS1vbmVsaW5lICRCQVNFLi4gfCB3
YyAtbCkKZmFpbGVkPTAKCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZWxpbWl0IDAKZ2l0
IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lcyBUcnVlCmdpdCBjb25maWcgLS1sb2NhbCBkaWZm
LmFsZ29yaXRobSBoaXN0b2dyYW0KCmNvbW1pdHM9IiQoZ2l0IGxvZyAtLWZvcm1hdD0lSCAtLXJl
dmVyc2UgJEJBU0UuLikiCmZvciBjIGluICRjb21taXRzOyBkbwogICAgZWNobyAiQ2hlY2tpbmcg
UEFUQ0ggJG4vJHRvdGFsOiAkKGdpdCBsb2cgLW4gMSAtLWZvcm1hdD0lcyAkYykuLi4iCiAgICBp
ZiAhIGdpdCBzaG93ICRjIC0tZm9ybWF0PWVtYWlsIHwgLi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwg
LS1tYWlsYmFjayAtOyB0aGVuCiAgICAgICAgZmFpbGVkPTEKICAgICAgICBlY2hvCiAgICBmaQog
ICAgbj0kKChuKzEpKQpkb25lCgpleGl0ICRmYWlsZWQKPT09IFRFU1QgU0NSSVBUIEVORCA9PT0K
ClVwZGF0aW5nIDNjOGNmNWE5YzIxZmY4NzgyMTY0ZDFkZWY3ZjQ0YmQ4ODg3MTMzODQKRnJvbSBo
dHRwczovL2dpdGh1Yi5jb20vcGF0Y2hldy1wcm9qZWN0L3FlbXUKIHQgW3RhZyB1cGRhdGVdICAg
ICAgICAgICAgcGF0Y2hldy8yMDE4MDMyMTE0NDEwNy4yMjc3MC0xLWt3b2xmQHJlZGhhdC5jb20g
LT4gcGF0Y2hldy8yMDE4MDMyMTE0NDEwNy4yMjc3MC0xLWt3b2xmQHJlZGhhdC5jb20KU3dpdGNo
ZWQgdG8gYSBuZXcgYnJhbmNoICd0ZXN0JwphMWM3Mjc1YjU3IFJlbW92ZSB1bm5lY2Vzc2FyeSB2
YXJpYWJsZXMgZm9yIGZ1bmN0aW9uIHJldHVybiB2YWx1ZQphNTMwZmE1YTcyIHFkaWN0OiByZW1v
dmUgdXNlbGVzcyBjYXN0CmMxYmZlMjZiMTEgZXJyb3I6IFJlbW92ZSBOVUxMIGNoZWNrcyBvbiBl
cnJvcl9wcm9wYWdhdGUoKSBjYWxscwpkYjNkNTVlNThlIGVycm9yOiBTdHJpcCB0cmFpbGluZyAn
XG4nIGZyb20gZXJyb3Igc3RyaW5nIGFyZ3VtZW50cyAoYWdhaW4gYWdhaW4pCgo9PT0gT1VUUFVU
IEJFR0lOID09PQpDaGVja2luZyBQQVRDSCAxLzQ6IGVycm9yOiBTdHJpcCB0cmFpbGluZyAnXG4n
IGZyb20gZXJyb3Igc3RyaW5nIGFyZ3VtZW50cyAoYWdhaW4gYWdhaW4pLi4uCkNoZWNraW5nIFBB
VENIIDIvNDogZXJyb3I6IFJlbW92ZSBOVUxMIGNoZWNrcyBvbiBlcnJvcl9wcm9wYWdhdGUoKSBj
YWxscy4uLgpDaGVja2luZyBQQVRDSCAzLzQ6IHFkaWN0OiByZW1vdmUgdXNlbGVzcyBjYXN0Li4u
CkNoZWNraW5nIFBBVENIIDQvNDogUmVtb3ZlIHVubmVjZXNzYXJ5IHZhcmlhYmxlcyBmb3IgZnVu
Y3Rpb24gcmV0dXJuIHZhbHVlLi4uCkVSUk9SOiByZXR1cm4gaXMgbm90IGEgZnVuY3Rpb24sIHBh
cmVudGhlc2VzIGFyZSBub3QgcmVxdWlyZWQKIzI1MTogRklMRTogdGFyZ2V0L21pcHMvZHNwX2hl
bHBlci5jOjMyODE6CisgICAgcmV0dXJuICh0ZW1wWzFdIDw8IDYzKSB8ICh0ZW1wWzBdID4+IDEp
OwoKRVJST1I6IHJldHVybiBpcyBub3QgYSBmdW5jdGlvbiwgcGFyZW50aGVzZXMgYXJlIG5vdCBy
ZXF1aXJlZAojMjcwOiBGSUxFOiB0YXJnZXQvbWlwcy9kc3BfaGVscGVyLmM6MzMwODoKKyAgICBy
ZXR1cm4gKHRlbXBbMV0gPDwgNjMpIHwgKHRlbXBbMF0gPj4gMSk7CgpFUlJPUjogcmV0dXJuIGlz
IG5vdCBhIGZ1bmN0aW9uLCBwYXJlbnRoZXNlcyBhcmUgbm90IHJlcXVpcmVkCiMyODk6IEZJTEU6
IHRhcmdldC9taXBzL2RzcF9oZWxwZXIuYzozMzQxOgorICAgIHJldHVybiAodGVtcFsxXSA8PCA2
MykgfCAodGVtcFswXSA+PiAxKTsKCnRvdGFsOiAzIGVycm9ycywgMCB3YXJuaW5ncywgODEzIGxp
bmVzIGNoZWNrZWQKCllvdXIgcGF0Y2ggaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3
LiAgSWYgYW55IG9mIHRoZXNlIGVycm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVt
IHRvIHRoZSBtYWludGFpbmVyLCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KCj09PSBP
VVRQVVQgRU5EID09PQoKVGVzdCBjb21tYW5kIGV4aXRlZCB3aXRoIGNvZGU6IDEKCgotLS0KRW1h
aWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0cDovL3BhdGNoZXcub3Jn
L10uClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEBmcmVlbGlzdHMu
b3Jn

