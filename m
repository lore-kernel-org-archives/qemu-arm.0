Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp4554120wru;
        Mon, 30 Jul 2018 22:27:05 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdya0O54kzV5P25OL+rEZubogyi19WpVAZaMT3SluSrnrtUhyo3LDwnkPynotfsgk4U9kE/
X-Received: by 2002:a37:6249:: with SMTP id w70-v6mr18421484qkb.312.1533014825387;
        Mon, 30 Jul 2018 22:27:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533014825; cv=none;
        d=google.com; s=arc-20160816;
        b=06a9ufHpiJGZKpPI2VpiiBLCmUK+Joo6W9c5GFfh5e+H6q9vegbABqpZ6eXuSu0mhv
         7o35QlUJUZKeA/X6GYhu4M0aWZBuzO/4cxQyZvKTW6/wUt5reTNZMVr6V6k41hAF4hMT
         r93a5EHLSMqSekLFJKRDHuvY/gzortH5oHxOL4aHatNOu0ykGYJkzzbkd3djQsd7klyW
         VVFQQNWCgaI1HtzeeK//hzjdxh8o+tpCiamgPeeXnILwKF1J07B9jUeiDw028DdvvXwO
         0P/+pdD5JNlrdHWFlswUi5hGIjaemvpyJ/5jBIt6+U9FZkvIjhfEOcqrpICpsVhBmXUf
         QdZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject:date:to
         :from:resent-from:content-transfer-encoding:mime-version:message-id
         :in-reply-to:resent-message-id:resent-date
         :arc-authentication-results;
        bh=LocHyxtbOh7sZ4yFnmieeGUTFYtMiO32KGu5rdgrjH0=;
        b=Rhos5Z8Uih1He7iYePPI2BiPSBd8lwk3zVWB6y+vO8E6eLXXrDJaDibobDZVSXZ8RE
         jgWIMEvPL0JVqYXBBbIkgrdGQEzuM2YEA3GxFy3k9B3jOsFA69Hwc2eridbcjaa/Uol5
         8Y2UNtOWonAQxW9MUjBElOZH7f2r4QLg8KqobaPUOfWSIeAZHnbmqbhV3WuCP+RqVz9Z
         bXaascBCKpcjvnrfj1qZ0g2GUi8f8UFX1eM+qTXEWPl4EYa27gFIlKiuzOavt7kWe1GQ
         ARNEBjjxkkY9+1WApN0D6kd23V2Do+fWeCSGDoIRBnCGQJ/K2MGMvS+K0W75iyIoq7No
         Y+kQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o6-v6si4825517qvi.277.2018.07.30.22.27.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 30 Jul 2018 22:27:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57088 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fkNBY-0007TR-U2
	for alex.bennee@linaro.org; Tue, 31 Jul 2018 01:27:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35575)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1fkNBO-0007So-MR
	for qemu-arm@nongnu.org; Tue, 31 Jul 2018 01:26:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1fkNBM-0002Gb-Kk
	for qemu-arm@nongnu.org; Tue, 31 Jul 2018 01:26:54 -0400
Resent-Date: Tue, 31 Jul 2018 01:26:54 -0400
Resent-Message-Id: <E1fkNBM-0002Gb-Kk@eggs.gnu.org>
Received: from sender-of-o51.zoho.com ([135.84.80.216]:21131)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <no-reply@patchew.org>)
	id 1fkNBM-0002GC-CS
	for qemu-arm@nongnu.org; Tue, 31 Jul 2018 01:26:52 -0400
Received: from [172.17.0.2] (23.253.156.214 [23.253.156.214]) by
	mx.zohomail.com with SMTPS id 1533014783229670.0025675415435;
	Mon, 30 Jul 2018 22:26:23 -0700 (PDT)
In-Reply-To: <20180730162458.23186-1-peter.maydell@linaro.org>
Message-ID: <153301478211.27456.14651007722843160778@502c9da6d61e>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: peter.maydell@linaro.org
Date: Mon, 30 Jul 2018 22:26:23 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 135.84.80.216
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 0/5] mps2: Implement FPGAIO
 counters and dual-timer
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
Cc: qemu-arm@nongnu.org, famz@redhat.com, qemu-devel@nongnu.org,
	patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Yjb9+UnFUsDw

SGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1z
LiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3JlIGluZm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1l
c3NhZ2UtaWQ6IDIwMTgwNzMwMTYyNDU4LjIzMTg2LTEtcGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3Jn
ClN1YmplY3Q6IFtRZW11LWRldmVsXSBbUEFUQ0ggMC81XSBtcHMyOiBJbXBsZW1lbnQgRlBHQUlP
IGNvdW50ZXJzIGFuZCBkdWFsLXRpbWVyCgo9PT0gVEVTVCBTQ1JJUFQgQkVHSU4gPT09CiMhL2Jp
bi9iYXNoCgpCQVNFPWJhc2UKbj0xCnRvdGFsPSQoZ2l0IGxvZyAtLW9uZWxpbmUgJEJBU0UuLiB8
IHdjIC1sKQpmYWlsZWQ9MAoKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lbGltaXQgMApn
aXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVzIFRydWUKZ2l0IGNvbmZpZyAtLWxvY2FsIGRp
ZmYuYWxnb3JpdGhtIGhpc3RvZ3JhbQoKY29tbWl0cz0iJChnaXQgbG9nIC0tZm9ybWF0PSVIIC0t
cmV2ZXJzZSAkQkFTRS4uKSIKZm9yIGMgaW4gJGNvbW1pdHM7IGRvCiAgICBlY2hvICJDaGVja2lu
ZyBQQVRDSCAkbi8kdG90YWw6ICQoZ2l0IGxvZyAtbiAxIC0tZm9ybWF0PSVzICRjKS4uLiIKICAg
IGlmICEgZ2l0IHNob3cgJGMgLS1mb3JtYXQ9ZW1haWwgfCAuL3NjcmlwdHMvY2hlY2twYXRjaC5w
bCAtLW1haWxiYWNrIC07IHRoZW4KICAgICAgICBmYWlsZWQ9MQogICAgICAgIGVjaG8KICAgIGZp
CiAgICBuPSQoKG4rMSkpCmRvbmUKCmV4aXQgJGZhaWxlZAo9PT0gVEVTVCBTQ1JJUFQgRU5EID09
PQoKVXBkYXRpbmcgM2M4Y2Y1YTljMjFmZjg3ODIxNjRkMWRlZjdmNDRiZDg4ODcxMzM4NApTd2l0
Y2hlZCB0byBhIG5ldyBicmFuY2ggJ3Rlc3QnCmRkYjcwNTQ0YTggaHcvYXJtL21wczI6IFdpcmUg
dXAgZHVhbC10aW1lciBpbiBtcHMyLWFuMzg1IGFuZCBtcHMyLWFuNTExCmJkYjUwNDYwZjQgaHcv
YXJtL2lvdGtpdDogV2lyZSB1cCB0aGUgZHVhbHRpbWVyCjAwOGE3NjhlMTIgaHcvdGltZXIvY21z
ZGstYXBiLWR1YWx0aW1lcjogSW1wbGVtZW50IENNU0RLIGR1YWwgdGltZXIgbW9kdWxlCjVhMDA4
YTM1NDUgaHcvbWlzYy9tcHMyLWZwZ2FpbzogSW1wbGVtZW50IFBTQ05UUiBhbmQgQ09VTlRFUgo3
NTJjNjU1OTFlIGh3L21pc2MvbXBzMi1mcGdhaW86IEltcGxlbWVudCAxSHogYW5kIDEwMEh6IGNv
dW50ZXJzCgo9PT0gT1VUUFVUIEJFR0lOID09PQpDaGVja2luZyBQQVRDSCAxLzU6IGh3L21pc2Mv
bXBzMi1mcGdhaW86IEltcGxlbWVudCAxSHogYW5kIDEwMEh6IGNvdW50ZXJzLi4uCkVSUk9SOiBz
cGFjZXMgcmVxdWlyZWQgYXJvdW5kIHRoYXQgJyonIChjdHg6VnhWKQojMTMxOiBGSUxFOiBody9t
aXNjL21wczItZnBnYWlvLmM6MTkzOgorICAgIC5zdWJzZWN0aW9ucyA9IChjb25zdCBWTVN0YXRl
RGVzY3JpcHRpb24qW10pIHsKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgXgoKdG90YWw6IDEgZXJyb3JzLCAwIHdhcm5pbmdzLCAxMjMgbGluZXMgY2hlY2tlZAoK
WW91ciBwYXRjaCBoYXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2Yg
dGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50
YWluZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgoKQ2hlY2tpbmcgUEFUQ0ggMi81
OiBody9taXNjL21wczItZnBnYWlvOiBJbXBsZW1lbnQgUFNDTlRSIGFuZCBDT1VOVEVSLi4uCkNo
ZWNraW5nIFBBVENIIDMvNTogaHcvdGltZXIvY21zZGstYXBiLWR1YWx0aW1lcjogSW1wbGVtZW50
IENNU0RLIGR1YWwgdGltZXIgbW9kdWxlLi4uCldBUk5JTkc6IGFkZGVkLCBtb3ZlZCBvciBkZWxl
dGVkIGZpbGUocyksIGRvZXMgTUFJTlRBSU5FUlMgbmVlZCB1cGRhdGluZz8KIzUwOiAKbmV3IGZp
bGUgbW9kZSAxMDA2NDQKCnRvdGFsOiAwIGVycm9ycywgMSB3YXJuaW5ncywgNjE3IGxpbmVzIGNo
ZWNrZWQKCllvdXIgcGF0Y2ggaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYg
YW55IG9mIHRoZXNlIGVycm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRo
ZSBtYWludGFpbmVyLCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KQ2hlY2tpbmcgUEFU
Q0ggNC81OiBody9hcm0vaW90a2l0OiBXaXJlIHVwIHRoZSBkdWFsdGltZXIuLi4KQ2hlY2tpbmcg
UEFUQ0ggNS81OiBody9hcm0vbXBzMjogV2lyZSB1cCBkdWFsLXRpbWVyIGluIG1wczItYW4zODUg
YW5kIG1wczItYW41MTEuLi4KPT09IE9VVFBVVCBFTkQgPT09CgpUZXN0IGNvbW1hbmQgZXhpdGVk
IHdpdGggY29kZTogMQoKCi0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21hdGljYWxseSBieSBQYXRj
aGV3IFtodHRwOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0byBw
YXRjaGV3LWRldmVsQHJlZGhhdC5jb20=

