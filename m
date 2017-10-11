Received: by 10.223.197.9 with SMTP id q9csp464278wrf;
        Wed, 11 Oct 2017 03:44:28 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QAAyUl5PhKUu5qbLTmE8zPLDoEzRvQEdJZxdHTya5uqBy9/UEEe9/iB+PN5Dyp6cFMWzszM
X-Received: by 10.55.41.226 with SMTP id p95mr18611905qkp.336.1507718668537;
        Wed, 11 Oct 2017 03:44:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507718668; cv=none;
        d=google.com; s=arc-20160816;
        b=Yztd1uMvufMlPcco6Hwla0XsoVlzXCNHYEkZyjycff+pkwOVNZnMYegtTgxorEeF9C
         wwHnHmvs1rhlKJFdYxuxlmftv/OV7o/p2yaB4OeR8Glsh39yalPjJ8DZFL+IHI5AfDYv
         296Nz32U+ZneAs/rqlTb15LnsUs15NDkKrGqjfwjsymYdqtu7aFgDJdtr+5Wz+o0ekbD
         4J0mX/QdDqcfOp1hWFtWFt9Bn7PnTnxRIz3yhUF776IgvhuXjAFm3i87Z1Mr/cPTI0Id
         VQCoawCpC7Ezj02mxK8glJj7+0R7Ff+ZNDxBCVw3UZZxAB5IcosIs00mInJu59AE4T7q
         EICQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject:date:to
         :from:resent-from:content-transfer-encoding:mime-version:in-reply-to
         :message-id:resent-message-id:resent-date:arc-authentication-results;
        bh=KA/djsbvEMg+vodKGoeLYJnTCXqqZm564ChfTzJqPqs=;
        b=ioA9OM/oJ9JQfdnTlWZzUad21MeJI5trhx+5HT3IJeB0I2xi7CS692YRaPeoe3VoCw
         yiB0T3fuyRWLkAXImzLjaC07FhkagMdwlxIFus8n/xM7u7uxDpgbjwktdq1ZbaqIRtqI
         g8bP2ppN/cFWmDbb6IePQjWwkbFqzul4j2twhxzeaKVy4o+VidUZufB5ikF3L/8ccsSC
         nF/QLQggqofPK7E2r8GlThEQ01z+LaZ4TFWB/R8MQQmrDMHJB4BpSR52cfVkZ72VHhjx
         q1ajsHQUnr8E4/WnAMG4xcmYZh7GGCkdP2Px7SeN+xU3spRfG7Pn38GY49JF2CaAj8PB
         N7lg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q28si869075qtj.171.2017.10.11.03.44.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 11 Oct 2017 03:44:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40165 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e2EV0-0006am-9h
	for alex.bennee@linaro.org; Wed, 11 Oct 2017 06:44:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41823)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1e2EUr-0006ab-1i
	for qemu-arm@nongnu.org; Wed, 11 Oct 2017 06:44:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1e2EUm-0005RU-Rz
	for qemu-arm@nongnu.org; Wed, 11 Oct 2017 06:44:16 -0400
Resent-Date: Wed, 11 Oct 2017 06:44:16 -0400
Resent-Message-Id: <E1e2EUm-0005RU-Rz@eggs.gnu.org>
Received: from sender-of-o52.zoho.com ([135.84.80.217]:21339)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <no-reply@patchew.org>)
	id 1e2EUm-0005Qx-Jy
	for qemu-arm@nongnu.org; Wed, 11 Oct 2017 06:44:12 -0400
Received: from [172.17.0.2] (23.253.156.214 [23.253.156.214]) by
	mx.zohomail.com with SMTPS id 1507718624418907.9955524084811;
	Wed, 11 Oct 2017 03:43:44 -0700 (PDT)
Message-ID: <150771862388.288.7275764832812347655@b58463cdfd5f>
In-Reply-To: <1507712980-12135-1-git-send-email-thomas.venries@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: thomas.venries@gmail.com
Date: Wed, 11 Oct 2017 03:43:44 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 135.84.80.217
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] bcm2835_armtimer: add bcm2835
 ARM timer
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
Cc: qemu-arm@nongnu.org, famz@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LzIislz/x55W

SGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1z
LiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3JlIGluZm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1l
c3NhZ2UtaWQ6IDE1MDc3MTI5ODAtMTIxMzUtMS1naXQtc2VuZC1lbWFpbC10aG9tYXMudmVucmll
c0BnbWFpbC5jb20KU3ViamVjdDogW1FlbXUtZGV2ZWxdIFtQQVRDSF0gYmNtMjgzNV9hcm10aW1l
cjogYWRkIGJjbTI4MzUgQVJNIHRpbWVyCgo9PT0gVEVTVCBTQ1JJUFQgQkVHSU4gPT09CiMhL2Jp
bi9iYXNoCgpCQVNFPWJhc2UKbj0xCnRvdGFsPSQoZ2l0IGxvZyAtLW9uZWxpbmUgJEJBU0UuLiB8
IHdjIC1sKQpmYWlsZWQ9MAoKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lbGltaXQgMApn
aXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVzIFRydWUKCmNvbW1pdHM9IiQoZ2l0IGxvZyAt
LWZvcm1hdD0lSCAtLXJldmVyc2UgJEJBU0UuLikiCmZvciBjIGluICRjb21taXRzOyBkbwogICAg
ZWNobyAiQ2hlY2tpbmcgUEFUQ0ggJG4vJHRvdGFsOiAkKGdpdCBsb2cgLW4gMSAtLWZvcm1hdD0l
cyAkYykuLi4iCiAgICBpZiAhIGdpdCBzaG93ICRjIC0tZm9ybWF0PWVtYWlsIHwgLi9zY3JpcHRz
L2NoZWNrcGF0Y2gucGwgLS1tYWlsYmFjayAtOyB0aGVuCiAgICAgICAgZmFpbGVkPTEKICAgICAg
ICBlY2hvCiAgICBmaQogICAgbj0kKChuKzEpKQpkb25lCgpleGl0ICRmYWlsZWQKPT09IFRFU1Qg
U0NSSVBUIEVORCA9PT0KClVwZGF0aW5nIDNjOGNmNWE5YzIxZmY4NzgyMTY0ZDFkZWY3ZjQ0YmQ4
ODg3MTMzODQKU3dpdGNoZWQgdG8gYSBuZXcgYnJhbmNoICd0ZXN0JwpmZDU5NmI1NDFjIGJjbTI4
MzVfYXJtdGltZXI6IGFkZCBiY20yODM1IEFSTSB0aW1lcgoKPT09IE9VVFBVVCBCRUdJTiA9PT0K
Q2hlY2tpbmcgUEFUQ0ggMS8xOiBiY20yODM1X2FybXRpbWVyOiBhZGQgYmNtMjgzNSBBUk0gdGlt
ZXIuLi4KRVJST1I6IHNwYWNlIHByb2hpYml0ZWQgYmVmb3JlIG9wZW4gc3F1YXJlIGJyYWNrZXQg
J1snCiMxNDc6IEZJTEU6IGh3L3RpbWVyL2JjbTI4MzVfYXJtdGltZXIuYzo3MzoKK3N0YXRpYyBj
b25zdCB1aW50MTZfdCBjdHJsX3ByZXNjYWxlIFtdID0geyAxLCAxNiwgMjU2LCAxIH07CgpFUlJP
UjogcmV0dXJuIGlzIG5vdCBhIGZ1bmN0aW9uLCBwYXJlbnRoZXNlcyBhcmUgbm90IHJlcXVpcmVk
CiMxOTU6IEZJTEU6IGh3L3RpbWVyL2JjbTI4MzVfYXJtdGltZXIuYzoxMjE6CisgICAgICAgIHJl
dHVybiAocy0+cmF3X2lycSAmJiAocy0+Y3RybCAmIENUUkxfSU5UX0VOQUJMRSkpOwoKRVJST1I6
IGJyYWNlcyB7fSBhcmUgbmVjZXNzYXJ5IGZvciBhbGwgYXJtcyBvZiB0aGlzIHN0YXRlbWVudAoj
MjIwOiBGSUxFOiBody90aW1lci9iY20yODM1X2FybXRpbWVyLmM6MTQ2OgorICAgICAgICBpZiAo
cy0+Y3RybCAmIENUUkxfVElNRVJfRU5BQkxFKQpbLi4uXQoKRVJST1I6IGJyYWNlcyB7fSBhcmUg
bmVjZXNzYXJ5IGZvciBhbGwgYXJtcyBvZiB0aGlzIHN0YXRlbWVudAojMjM0OiBGSUxFOiBody90
aW1lci9iY20yODM1X2FybXRpbWVyLmM6MTYwOgorICAgICAgICBpZiAocy0+Y3RybCAmIENUUkxf
VElNRVJfRU5BQkxFKQpbLi4uXQoKdG90YWw6IDQgZXJyb3JzLCAwIHdhcm5pbmdzLCAzNjQgbGlu
ZXMgY2hlY2tlZAoKWW91ciBwYXRjaCBoYXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZpZXcu
ICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0g
dG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgoKPT09IE9V
VFBVVCBFTkQgPT09CgpUZXN0IGNvbW1hbmQgZXhpdGVkIHdpdGggY29kZTogMQoKCi0tLQpFbWFp
bCBnZW5lcmF0ZWQgYXV0b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRwOi8vcGF0Y2hldy5vcmcv
XS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRjaGV3LWRldmVsQGZyZWVsaXN0cy5v
cmc=

