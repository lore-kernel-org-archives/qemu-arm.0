Received: by 10.28.4.212 with SMTP id 203csp42899wme;
        Thu, 3 May 2018 15:20:10 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZrJ6n6mffzXhmZ7ITDu1YE+/sY057MGQGHVknSAc/sTZzS8vu9I13uBPIAbhrWNpTl5IDFX
X-Received: by 2002:a0c:a066:: with SMTP id b93-v6mr21296997qva.108.1525386010079;
        Thu, 03 May 2018 15:20:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525386010; cv=none;
        d=google.com; s=arc-20160816;
        b=jfjtuZo/A+H9uuredRDDJ6sU9ZCQjez8floi78cUw4mHmZjpIIf6xLv6cKefFxrqCh
         9UJLbKgBmomOlmf64DBTmfCNHUM31H3rT5b9ohPlj6mYv7zE6T2+PKSGX7IWpC6PAyyr
         WGO8GgKoM35zwQivFxsOgC8Fq7gM0a+ZVlTS1MetEn1ZXO7x2wNE/37qMSgt3wbwSqit
         Cdsaen/iYUMz8mm7D2NGGjgsAmdndO67QJ2K5AHv9DRIU2WXbEnqQyZ/Sb5VXbmlRBmp
         WuaIRq+TxW5M7n9HtW3I9rffs0g1Z92tN2qA7RXH+GXpbdmlJHSo6mDEyQqX1HCRwaQO
         WQoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject:date:to
         :from:resent-from:content-transfer-encoding:mime-version:message-id
         :in-reply-to:resent-message-id:resent-date
         :arc-authentication-results;
        bh=hZA9asUogii4klaiXzZ8XN/wZQDWV0pYDBG9JQeh2qc=;
        b=SOsh+fPew2ARN0DwMBfd6i/vIpELlOS5ROqtVjh0hQtrjAasyHNnJZS9fe6g3fYfzN
         Bf1vQ1n4hZDeWZcYfjgI0rvNxBVM1SQeXr8mD0MuNpAM7Nb2KNnBNMTLpyr4qgxbOW1G
         eYHKn/KtaGvQsbi4h/mj8ULnTRdSW5hRfaNxuVtXozwYOy2qH4vmprUJa2ZAZXlHrPMv
         nmzNJ45VcvxZxchSKn1CUSVjeL2hf22zggNmjNKcUBu4X6Xx/QjoRgb+SjJb5pEMGvsr
         kGT6mvTdkI8fYZ5aLCwM4L2VWMDcR+tKilbWr9v/kFmNiwmlNr7+uTpzJEhN0cnk7MUq
         rxLw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u184si3623598qkb.368.2018.05.03.15.20.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 May 2018 15:20:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59385 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fEMa9-0001xC-K1
	for alex.bennee@linaro.org; Thu, 03 May 2018 18:20:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32982)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1fEMa0-0001wr-LH
	for qemu-arm@nongnu.org; Thu, 03 May 2018 18:20:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1fEMZy-0006oR-EX
	for qemu-arm@nongnu.org; Thu, 03 May 2018 18:20:00 -0400
Resent-Date: Thu, 03 May 2018 18:20:00 -0400
Resent-Message-Id: <E1fEMZy-0006oR-EX@eggs.gnu.org>
Received: from sender-of-o51.zoho.com ([135.84.80.216]:21020)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <no-reply@patchew.org>)
	id 1fEMZy-0006nN-5o
	for qemu-arm@nongnu.org; Thu, 03 May 2018 18:19:58 -0400
Received: from [172.17.0.2] (23.253.156.214 [23.253.156.214]) by
	mx.zohomail.com with SMTPS id 1525300406089951.6194247088617;
	Wed, 2 May 2018 15:33:26 -0700 (PDT)
In-Reply-To: <20180502221552.3873-1-richard.henderson@linaro.org>
Message-ID: <152530040552.2448.9571284396230949836@71c20359a636>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: richard.henderson@linaro.org
Date: Wed, 2 May 2018 15:33:26 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 135.84.80.216
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 00/14] target/arm: Fixups for
 ARM_FEATURE_V8_FP16
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
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lIFMofD8guri

SGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1z
LiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3JlIGluZm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1l
c3NhZ2UtaWQ6IDIwMTgwNTAyMjIxNTUyLjM4NzMtMS1yaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8u
b3JnClN1YmplY3Q6IFtRZW11LWRldmVsXSBbUEFUQ0ggdjIgMDAvMTRdIHRhcmdldC9hcm06IEZp
eHVwcyBmb3IgQVJNX0ZFQVRVUkVfVjhfRlAxNgoKPT09IFRFU1QgU0NSSVBUIEJFR0lOID09PQoj
IS9iaW4vYmFzaAoKQkFTRT1iYXNlCm49MQp0b3RhbD0kKGdpdCBsb2cgLS1vbmVsaW5lICRCQVNF
Li4gfCB3YyAtbCkKZmFpbGVkPTAKCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZWxpbWl0
IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lcyBUcnVlCmdpdCBjb25maWcgLS1sb2Nh
bCBkaWZmLmFsZ29yaXRobSBoaXN0b2dyYW0KCmNvbW1pdHM9IiQoZ2l0IGxvZyAtLWZvcm1hdD0l
SCAtLXJldmVyc2UgJEJBU0UuLikiCmZvciBjIGluICRjb21taXRzOyBkbwogICAgZWNobyAiQ2hl
Y2tpbmcgUEFUQ0ggJG4vJHRvdGFsOiAkKGdpdCBsb2cgLW4gMSAtLWZvcm1hdD0lcyAkYykuLi4i
CiAgICBpZiAhIGdpdCBzaG93ICRjIC0tZm9ybWF0PWVtYWlsIHwgLi9zY3JpcHRzL2NoZWNrcGF0
Y2gucGwgLS1tYWlsYmFjayAtOyB0aGVuCiAgICAgICAgZmFpbGVkPTEKICAgICAgICBlY2hvCiAg
ICBmaQogICAgbj0kKChuKzEpKQpkb25lCgpleGl0ICRmYWlsZWQKPT09IFRFU1QgU0NSSVBUIEVO
RCA9PT0KClVwZGF0aW5nIDNjOGNmNWE5YzIxZmY4NzgyMTY0ZDFkZWY3ZjQ0YmQ4ODg3MTMzODQK
RnJvbSBodHRwczovL2dpdGh1Yi5jb20vcGF0Y2hldy1wcm9qZWN0L3FlbXUKICogW25ldyB0YWdd
ICAgICAgICAgICAgICAgcGF0Y2hldy8yMDE4MDUwMjIyMTU1Mi4zODczLTEtcmljaGFyZC5oZW5k
ZXJzb25AbGluYXJvLm9yZyAtPiBwYXRjaGV3LzIwMTgwNTAyMjIxNTUyLjM4NzMtMS1yaWNoYXJk
LmhlbmRlcnNvbkBsaW5hcm8ub3JnClN3aXRjaGVkIHRvIGEgbmV3IGJyYW5jaCAndGVzdCcKMGFm
NjgzN2I0OCB0YXJnZXQvYXJtOiBGaXggc3FydF9mMTYgZXhjZXB0aW9uIHJhaXNpbmcKYzc0MGI1
OTRlZiB0YXJnZXQvYXJtOiBJbXBsZW1lbnQgRk1PViAoaW1tZWRpYXRlKSBmb3IgZnAxNgo5ODY5
OTQxYzU4IHRhcmdldC9hcm06IEltcGxlbWVudCBGQ1NFTCBmb3IgZnAxNgoyZjlhZjE0M2U1IHRh
cmdldC9hcm06IEltcGxlbWVudCBGQ01QIGZvciBmcDE2CmQ3ZmQ4NzQ3NTcgdGFyZ2V0L2FybTog
SW1wbGVtZW50IEZQIGRhdGEtcHJvY2Vzc2luZyAoMyBzb3VyY2UpIGZvciBmcDE2CmJkNjkzYjE5
ZjQgdGFyZ2V0L2FybTogSW1wbGVtZW50IEZQIGRhdGEtcHJvY2Vzc2luZyAoMiBzb3VyY2UpIGZv
ciBmcDE2CmE3YzFmZjdmMzEgdGFyZ2V0L2FybTogSW50cm9kdWNlIGFuZCB1c2UgcmVhZF9mcF9o
cmVnCjVjMmRmY2UzYjMgdGFyZ2V0L2FybTogSW1wbGVtZW50IEZDVlQgKHNjYWxhciwgZml4ZWQt
cG9pbnQpIGZvciBmcDE2CmVjZTUzM2ZhYWQgdGFyZ2V0L2FybTogSW1wbGVtZW50IEZDVlQgKHNj
YWxhciwgaW50ZWdlcikgZm9yIGZwMTYKMWQ4MTUzMTU4MSB0YXJnZXQvYXJtOiBJbXBsZW1lbnQg
Rk1PViAoZ2VuZXJhbCkgZm9yIGZwMTYKZDNlNDdmZDg2YiB0YXJnZXQvYXJtOiBDbGVhciBTVkUg
aGlnaCBiaXRzIGZvciBGTU9WCmI4NTMwZDY2YjMgdGFyZ2V0L2FybTogRml4IGZsb2F0MTYgdG8v
ZnJvbSBpbnQxNgo5NjQ1MWY4ZmVmIHRhcmdldC9hcm06IEltcGxlbWVudCB2ZWN0b3Igc2hpZnRl
ZCBGQ1ZUIGZvciBmcDE2CmYzZDFiOGRiNWQgdGFyZ2V0L2FybTogSW1wbGVtZW50IHZlY3RvciBz
aGlmdGVkIFNDVkYvVUNWRiBmb3IgZnAxNgoKPT09IE9VVFBVVCBCRUdJTiA9PT0KQ2hlY2tpbmcg
UEFUQ0ggMS8xNDogdGFyZ2V0L2FybTogSW1wbGVtZW50IHZlY3RvciBzaGlmdGVkIFNDVkYvVUNW
RiBmb3IgZnAxNi4uLgpDaGVja2luZyBQQVRDSCAyLzE0OiB0YXJnZXQvYXJtOiBJbXBsZW1lbnQg
dmVjdG9yIHNoaWZ0ZWQgRkNWVCBmb3IgZnAxNi4uLgpDaGVja2luZyBQQVRDSCAzLzE0OiB0YXJn
ZXQvYXJtOiBGaXggZmxvYXQxNiB0by9mcm9tIGludDE2Li4uCkVSUk9SOiBzcGFjZXMgcmVxdWly
ZWQgYXJvdW5kIHRoYXQgJyonIChjdHg6V3hWKQojNDU6IEZJTEU6IHRhcmdldC9hcm0vaGVscGVy
LmM6MTE0MzQ6CitzdGF0aWMgZmxvYXQxNiBkb19wb3N0c2NhbGVfZnAxNihmbG9hdDY0IGYsIGlu
dCBzaGlmdCwgZmxvYXRfc3RhdHVzICpmcHN0KQogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeCgp0b3RhbDogMSBlcnJv
cnMsIDAgd2FybmluZ3MsIDgzIGxpbmVzIGNoZWNrZWQKCllvdXIgcGF0Y2ggaGFzIHN0eWxlIHBy
b2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55IG9mIHRoZXNlIGVycm9ycwphcmUgZmFsc2Ug
cG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBtYWludGFpbmVyLCBzZWUKQ0hFQ0tQQVRDSCBp
biBNQUlOVEFJTkVSUy4KCkNoZWNraW5nIFBBVENIIDQvMTQ6IHRhcmdldC9hcm06IENsZWFyIFNW
RSBoaWdoIGJpdHMgZm9yIEZNT1YuLi4KQ2hlY2tpbmcgUEFUQ0ggNS8xNDogdGFyZ2V0L2FybTog
SW1wbGVtZW50IEZNT1YgKGdlbmVyYWwpIGZvciBmcDE2Li4uCkNoZWNraW5nIFBBVENIIDYvMTQ6
IHRhcmdldC9hcm06IEltcGxlbWVudCBGQ1ZUIChzY2FsYXIsIGludGVnZXIpIGZvciBmcDE2Li4u
CkNoZWNraW5nIFBBVENIIDcvMTQ6IHRhcmdldC9hcm06IEltcGxlbWVudCBGQ1ZUIChzY2FsYXIs
IGZpeGVkLXBvaW50KSBmb3IgZnAxNi4uLgpDaGVja2luZyBQQVRDSCA4LzE0OiB0YXJnZXQvYXJt
OiBJbnRyb2R1Y2UgYW5kIHVzZSByZWFkX2ZwX2hyZWcuLi4KQ2hlY2tpbmcgUEFUQ0ggOS8xNDog
dGFyZ2V0L2FybTogSW1wbGVtZW50IEZQIGRhdGEtcHJvY2Vzc2luZyAoMiBzb3VyY2UpIGZvciBm
cDE2Li4uCkNoZWNraW5nIFBBVENIIDEwLzE0OiB0YXJnZXQvYXJtOiBJbXBsZW1lbnQgRlAgZGF0
YS1wcm9jZXNzaW5nICgzIHNvdXJjZSkgZm9yIGZwMTYuLi4KQ2hlY2tpbmcgUEFUQ0ggMTEvMTQ6
IHRhcmdldC9hcm06IEltcGxlbWVudCBGQ01QIGZvciBmcDE2Li4uCkNoZWNraW5nIFBBVENIIDEy
LzE0OiB0YXJnZXQvYXJtOiBJbXBsZW1lbnQgRkNTRUwgZm9yIGZwMTYuLi4KRVJST1I6IHNwYWNl
IHJlcXVpcmVkIGJlZm9yZSB0aGUgb3BlbiBwYXJlbnRoZXNpcyAnKCcKIzQxOiBGSUxFOiB0YXJn
ZXQvYXJtL3RyYW5zbGF0ZS1hNjQuYzo0NjgzOgorICAgIHN3aXRjaCh0eXBlKSB7Cgp0b3RhbDog
MSBlcnJvcnMsIDAgd2FybmluZ3MsIDU4IGxpbmVzIGNoZWNrZWQKCllvdXIgcGF0Y2ggaGFzIHN0
eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55IG9mIHRoZXNlIGVycm9ycwphcmUg
ZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBtYWludGFpbmVyLCBzZWUKQ0hFQ0tQ
QVRDSCBpbiBNQUlOVEFJTkVSUy4KCkNoZWNraW5nIFBBVENIIDEzLzE0OiB0YXJnZXQvYXJtOiBJ
bXBsZW1lbnQgRk1PViAoaW1tZWRpYXRlKSBmb3IgZnAxNi4uLgpDaGVja2luZyBQQVRDSCAxNC8x
NDogdGFyZ2V0L2FybTogRml4IHNxcnRfZjE2IGV4Y2VwdGlvbiByYWlzaW5nLi4uCj09PSBPVVRQ
VVQgRU5EID09PQoKVGVzdCBjb21tYW5kIGV4aXRlZCB3aXRoIGNvZGU6IDEKCgotLS0KRW1haWwg
Z2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0cDovL3BhdGNoZXcub3JnL10u
ClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQuY29t

